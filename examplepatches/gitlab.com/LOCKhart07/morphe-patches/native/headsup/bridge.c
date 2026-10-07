/*
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Native bridge for Heads Up! (Unity IL2CPP), loaded by
 * app.lockhart.extension.headsup.RoundLengthPatch from MainActivity.onCreate, before Unity
 * loads libil2cpp.so.
 *
 * It hooks il2cpp_init (pending until the library is loaded). Once the runtime is up it
 * resolves game methods by name through the exported il2cpp_* API, so no byte patterns or
 * RVAs are needed:
 *
 *   DefaultNamespace.HeadsUp.GameplayManager
 *     Init(DeckData, GameComponents)   sets gameTime from DEFAULT_GAME_TIME (60s) or
 *                                      DeckData.customRoundLength. After it returns, gameTime
 *                                      is overwritten with the user's round length, if set.
 *
 *   HeadsUp.Scripts.UI.MainMenu.Deck.DeckDetailsPopup (the deck page)
 *     MainMenuInit, ExternalInit,      page opens          -> show the round length chip
 *     OnCustomizeDoneClicked
 *     OnBackClicked (also the system   page closes / is    -> hide the chip
 *     back key), HideDetails,          covered
 *     OnPlayButtonClicked,
 *     OnCustomizeClicked, OnDestroy
 *
 * ShadowHook needs libshadowhook.so and libshadowhook_nothing.so next to this library;
 * without the latter shadowhook_init fails with "Init linker mod failed".
 */
#include <android/log.h>
#include <dlfcn.h>
#include <jni.h>
#include <stdatomic.h>
#include <stdbool.h>

#include "shadowhook.h"

#define TAG "MorpheHeadsUp"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, TAG, __VA_ARGS__)

#define IL2CPP "libil2cpp.so"
#define EXTENSION_CLASS "app/lockhart/extension/headsup/RoundLengthPatch"

// region IL2CPP API

typedef void Il2CppDomain;
typedef void Il2CppAssembly;
typedef void Il2CppImage;
typedef void Il2CppClass;
typedef void FieldInfo;
typedef struct {
    void *methodPointer;
} MethodInfo;

static Il2CppDomain *(*il2cpp_domain_get)(void);
static const Il2CppAssembly *(*il2cpp_domain_assembly_open)(Il2CppDomain *, const char *);
static const Il2CppImage *(*il2cpp_assembly_get_image)(const Il2CppAssembly *);
static Il2CppClass *(*il2cpp_class_from_name)(const Il2CppImage *, const char *, const char *);
static const MethodInfo *(*il2cpp_class_get_method_from_name)(Il2CppClass *, const char *, int);
static FieldInfo *(*il2cpp_class_get_field_from_name)(Il2CppClass *, const char *);
static size_t (*il2cpp_field_get_offset)(FieldInfo *);

static int resolve_api(void) {
    void *handle = dlopen(IL2CPP, RTLD_NOW | RTLD_NOLOAD);
    if (handle == NULL) {
        LOGE("dlopen(%s) failed: %s", IL2CPP, dlerror());
        return -1;
    }

#define RESOLVE(name)                                                               \
    if ((*(void **) &name = dlsym(handle, #name)) == NULL) {                        \
        LOGE("missing %s", #name);                                                  \
        dlclose(handle);                                                            \
        return -1;                                                                  \
    }
    RESOLVE(il2cpp_domain_get)
    RESOLVE(il2cpp_domain_assembly_open)
    RESOLVE(il2cpp_assembly_get_image)
    RESOLVE(il2cpp_class_from_name)
    RESOLVE(il2cpp_class_get_method_from_name)
    RESOLVE(il2cpp_class_get_field_from_name)
    RESOLVE(il2cpp_field_get_offset)
#undef RESOLVE

    dlclose(handle);
    return 0;
}

// endregion

// region Java side

static JavaVM *java_vm;
static jclass extension_class;
static jmethodID on_deck_page_visibility_changed;

// Seconds, 0 = keep the game's own round length. Written from the Java main thread.
static atomic_int round_length_seconds;

static void JNICALL native_set_round_length(JNIEnv *env, jclass clazz, jint seconds) {
    (void) env;
    (void) clazz;
    atomic_store(&round_length_seconds, seconds);
}

static void notify_deck_page_visible(bool visible) {
    if (java_vm == NULL || on_deck_page_visibility_changed == NULL) return;

    JNIEnv *env;
    bool attached = false;
    if ((*java_vm)->GetEnv(java_vm, (void **) &env, JNI_VERSION_1_6) == JNI_EDETACHED) {
        if ((*java_vm)->AttachCurrentThread(java_vm, &env, NULL) != JNI_OK) return;
        attached = true;
    }

    (*env)->CallStaticVoidMethod(env, extension_class, on_deck_page_visibility_changed, (jboolean) visible);
    if ((*env)->ExceptionCheck(env)) {
        (*env)->ExceptionDescribe(env);
        (*env)->ExceptionClear(env);
    }

    if (attached) (*java_vm)->DetachCurrentThread(java_vm);
}

// endregion

// region Hooks

static size_t game_time_offset;
static void (*orig_gameplay_manager_init)(void *, void *, void *, const MethodInfo *);

static void proxy_gameplay_manager_init(void *self, void *deck_data, void *components,
                                        const MethodInfo *method) {
    orig_gameplay_manager_init(self, deck_data, components, method);

    int seconds = atomic_load(&round_length_seconds);
    if (seconds > 0) *(float *) ((char *) self + game_time_offset) = (float) seconds;
}

// DeckDetailsPopup methods take at most two arguments; extra registers are ignored.
#define VISIBILITY_HOOK(id, visible)                                                \
    static void (*orig_##id)(void *, void *, void *, void *);                       \
    static void proxy_##id(void *self, void *a, void *b, void *method) {            \
        orig_##id(self, a, b, method);                                              \
        notify_deck_page_visible(visible);                                          \
    }

VISIBILITY_HOOK(main_menu_init, true)
VISIBILITY_HOOK(external_init, true)
VISIBILITY_HOOK(on_customize_done_clicked, true)
VISIBILITY_HOOK(on_back_clicked, false)
VISIBILITY_HOOK(hide_details, false)
VISIBILITY_HOOK(on_play_button_clicked, false)
VISIBILITY_HOOK(on_customize_clicked, false)
VISIBILITY_HOOK(on_destroy, false)

static int hook_method(Il2CppClass *klass, const char *name, int args, void *proxy, void **orig) {
    const MethodInfo *method = il2cpp_class_get_method_from_name(klass, name, args);
    if (method == NULL || method->methodPointer == NULL) {
        LOGE("method %s/%d not found", name, args);
        return -1;
    }

    if (shadowhook_hook_func_addr(method->methodPointer, proxy, orig) == NULL) {
        int err = shadowhook_get_errno();
        LOGE("hook %s failed: %d %s", name, err, shadowhook_to_errmsg(err));
        return -1;
    }
    return 0;
}

#define HOOK(klass, name, args, id) hook_method(klass, name, args, (void *) proxy_##id, (void **) &orig_##id)

// Runs on Unity's thread right after il2cpp_init, so the thread is already attached.
static void install_game_hooks(void) {
    if (resolve_api() != 0) return;

    const Il2CppAssembly *assembly = il2cpp_domain_assembly_open(il2cpp_domain_get(), "Assembly-CSharp");
    const Il2CppImage *image = assembly ? il2cpp_assembly_get_image(assembly) : NULL;
    if (image == NULL) {
        LOGE("Assembly-CSharp not found");
        return;
    }

    Il2CppClass *gameplay_manager = il2cpp_class_from_name(image, "DefaultNamespace.HeadsUp", "GameplayManager");
    FieldInfo *game_time = gameplay_manager ? il2cpp_class_get_field_from_name(gameplay_manager, "gameTime") : NULL;
    if (game_time == NULL) {
        // Without the round length hook the chip would do nothing, so don't show it either.
        LOGE("GameplayManager.gameTime not found");
        return;
    }
    game_time_offset = il2cpp_field_get_offset(game_time);
    if (HOOK(gameplay_manager, "Init", 2, gameplay_manager_init) != 0) return;

    Il2CppClass *popup = il2cpp_class_from_name(image, "HeadsUp.Scripts.UI.MainMenu.Deck", "DeckDetailsPopup");
    if (popup == NULL) {
        LOGE("DeckDetailsPopup not found");
        return;
    }
    HOOK(popup, "MainMenuInit", 2, main_menu_init);
    HOOK(popup, "ExternalInit", 2, external_init);
    HOOK(popup, "OnCustomizeDoneClicked", 0, on_customize_done_clicked);
    HOOK(popup, "OnBackClicked", 0, on_back_clicked);
    HOOK(popup, "HideDetails", 0, hide_details);
    HOOK(popup, "OnPlayButtonClicked", 0, on_play_button_clicked);
    HOOK(popup, "OnCustomizeClicked", 0, on_customize_clicked);
    HOOK(popup, "OnDestroy", 0, on_destroy);

    LOGI("hooks installed");
}

static int (*orig_il2cpp_init)(const char *);

static int proxy_il2cpp_init(const char *domain_name) {
    int result = orig_il2cpp_init(domain_name);
    install_game_hooks();
    return result;
}

// endregion

static int register_extension(JNIEnv *env) {
    // JNI_OnLoad runs with the class loader of the class that called System.loadLibrary.
    jclass clazz = (*env)->FindClass(env, EXTENSION_CLASS);
    if (clazz == NULL) {
        (*env)->ExceptionClear(env);
        LOGE("%s not found", EXTENSION_CLASS);
        return -1;
    }
    extension_class = (*env)->NewGlobalRef(env, clazz);

    on_deck_page_visibility_changed =
            (*env)->GetStaticMethodID(env, extension_class, "onDeckPageVisibilityChanged", "(Z)V");
    static const JNINativeMethod natives[] = {
            {"nativeSetRoundLength", "(I)V", (void *) native_set_round_length},
    };
    if (on_deck_page_visibility_changed == NULL ||
        (*env)->RegisterNatives(env, extension_class, natives, 1) != JNI_OK) {
        (*env)->ExceptionClear(env);
        LOGE("failed to bind %s", EXTENSION_CLASS);
        return -1;
    }
    return 0;
}

JNIEXPORT jint JNI_OnLoad(JavaVM *vm, void *reserved) {
    (void) reserved;
    java_vm = vm;

    JNIEnv *env;
    if ((*vm)->GetEnv(vm, (void **) &env, JNI_VERSION_1_6) != JNI_OK) return JNI_ERR;
    if (register_extension(env) != 0) return JNI_ERR;

    int err = shadowhook_init(SHADOWHOOK_MODE_UNIQUE, false);
    if (err != 0) {
        LOGE("shadowhook_init failed: %d %s", err, shadowhook_to_errmsg(err));
        return JNI_VERSION_1_6;
    }

    // Returns a stub with errno PENDING until Unity loads libil2cpp.so.
    if (shadowhook_hook_sym_name(IL2CPP, "il2cpp_init", (void *) proxy_il2cpp_init,
                                 (void **) &orig_il2cpp_init) == NULL) {
        err = shadowhook_get_errno();
        LOGE("hook il2cpp_init failed: %d %s", err, shadowhook_to_errmsg(err));
    }

    return JNI_VERSION_1_6;
}
