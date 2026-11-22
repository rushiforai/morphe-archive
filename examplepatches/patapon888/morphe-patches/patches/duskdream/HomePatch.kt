package duskdream

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode

private const val PACKAGE_INFO = "Landroid/content/pm/PackageInfo;"
private const val SIGNATURES = "[Landroid/content/pm/Signature;"
private const val CONTEXT = "Landroid/content/Context;"
private const val STRING = "Ljava/lang/String;"
private const val RECT = "Landroid/graphics/RectF;"
private const val ACCOUNT = "Landroid/accounts/Account;"
private const val STORE = "Store;->"
private const val DISCOVERY_WINDOW = "Lcom/google/android/apps/vr/home/app/ui/appdiscovery/DiscoveryWindow;"

private val homeNativePatch = resourcePatch {
    execute {
        fixShaders(
            "assets/shaders/color_aa.fplshader",
            "assets/shaders/color_aa_batched.fplshader",
            "assets/multiview/shaders/color_aa.fplshader",
            "assets/multiview/shaders/color_aa_batched.fplshader",
        )
        patchLibrary(
            "lib/arm64-v8a/libvrhome_vrapps_native_lib.so",
            listOf(
                ByteEdit(0x624735, "03032a", "ff9f52"),
                ByteEdit(0x62474c, "e3030032", "62048052"),
                ByteEdit(0x624768, "60000054", "1f2003d5"),
                ByteEdit(0x6247a8, "bf0200f9", "1f2003d5"),
                ByteEdit(0x341916, "40b9", "8052"),
                ByteEdit(0x459b8e, "00b4000c40b9", "8052c0035fd6"),
            )
        )
    }
}

/** Google's store server is gone: see Store.java in the extension. */
private fun BytecodePatchContext.storeHooks() {
    hookBefore(method("Lamu;", "a", listOf(ACCOUNT, "Ldvq;", "Lada;")), "${STORE}onStoreRequest")
    hookBefore(method("Lamu;", "a", listOf(ACCOUNT, STRING, "I", "[Lefz;", "[B", "Lada;")), "${STORE}onSearch")
    // Only asks whether the old server could be reached.
    method("Lagv;", "g").returnConstant(true)
    hookBefore(method("Lagv;", "onEvent", listOf("Laiz;")), "${STORE}onDiscoveryClick")

    hookResult(method("Lbhd;", "a", listOf("Legu;", "I", "I", "I")), "${STORE}onTile")
    hookResult(method("Lalu;", "a", listOf("Legu;", CONTEXT, "Lafb;", "Lafp;")), "${STORE}onAppStatus")

    // a() crops the VR library's cards, b() the store's tiles.
    listOf("a", "b").forEach { hookOverride(method("Laeg;", it, listOf(STRING, "I", RECT)), "${STORE}imageUrl") }
    method("Lalz;", "a", listOf(STRING, "I", RECT, "Lamc;")).addInstructions(
        0,
        """
            invoke-static {p1, p3}, $EXT${STORE}cropFor($STRING$RECT)$RECT
            move-result-object p3
        """.trimIndent()
    )
    hookOverride(method("Lalz;", "a", listOf("Landroid/graphics/Bitmap;", "I", RECT)), "${STORE}fitLogo")

    val window = method(DISCOVERY_WINDOW, "a", listOf("Laif;"))
    window.addInstructions(
        0,
        """
            invoke-static {p1}, $EXT${STORE}stillLayers(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object p1
            check-cast p1, Laif;
        """.trimIndent()
    )
    hookAfter(window, "${STORE}cropLayers")
}

/** Daydream's app list queries, so OpenXR apps are listed too. */
internal val OPENXR_APP_REDIRECTS = listOf(
    Redirect(
        setOf("Landroid/content/pm/PackageManager;"), "queryIntentActivities",
        listOf("Landroid/content/Intent;", "I"), "queryIntentActivities", "Landroid/content/pm/PackageManager;"
    ),
)

@Suppress("unused")
val homePatch = bytecodePatch(
    name = "Daydream Everywhere (Daydream)",
    description = "Runs Daydream on any arm64 phone without root."
) {
    compatibleWith(VR_HOME)
    dependsOn(homeNativePatch, microGManifestPatch("com.google.android.vr.home", "fc1edc68f7e3e4963c998e95fc38f3de8d1bfc96"))
    extendWith(EXTENSION)

    execute {
        useMicroG()
        method("Leiy;", "a", listOf(PACKAGE_INFO, SIGNATURES)).returnConstant(true)
        method("Lehl;", "i", listOf(CONTEXT)).returnConstant(false)
        method("Lehl;", "j", listOf(CONTEXT)).returnConstant(false)

        controllerClientHooks(
            "Lcom/google/vr/vrcore/controller/api/ControllerServiceBridge;",
            "Lcom/google/vr/vrcore/controller/api/NativeCallbacks;"
        )

        queueFrames()
        hookApplication("Lcom/google/android/apps/vr/home/dagger/HomeApplication;")
        storeHooks()
        // OpenXR apps in the Daydream library; see OpenXrApps.java in the extension.
        hookBefore(method("Laef;", "a", listOf("Landroid/content/Intent;")), "OpenXrApps;->fixLaunch")
        val counts = redirectCalls(FEATURE_REDIRECTS + SESSION_QUERY_REDIRECTS + OPENXR_APP_REDIRECTS)
        println("DuskDream: vr.home call sites $counts")
    }
}

@Suppress("unused")
val keyboardPatch = bytecodePatch(
    name = "Daydream Everywhere (Keyboard)",
    description = "Lets the Daydream keyboard run re-signed, and adds Swiss layouts."
) {
    compatibleWith(VR_KEYBOARD)
    dependsOn(microGManifestPatch("com.google.android.vr.inputmethod", "235b3171fefdc7c34920a28df7099d12e0a817b0"))
    extendWith(EXTENSION)

    execute {
        useMicroG()
        method("Lcvh;", "a", listOf(PACKAGE_INFO, SIGNATURES)).returnConstant(true)
        method("Lcwh;", "a", listOf(PACKAGE_INFO, SIGNATURES)).returnConstant(true)
        method("Lcpi;", "f", listOf(CONTEXT)).returnConstant(false)
        method("Lcpi;", "g", listOf(CONTEXT)).returnConstant(false)
        hookApplication("Lcom/google/android/apps/vr/inputmethod/VrApplication;")
        swissKeyboard()
        val counts = redirectCalls(FEATURE_REDIRECTS + SWISS_KEYBOARD_REDIRECTS)
        println("DuskDream: keyboard call sites $counts")
    }
}

/** The language entries' getString calls, so SwissKeyboard can name the entries it adds. */
private val SWISS_KEYBOARD_REDIRECTS = listOf(
    Redirect(setOf("Landroid/content/Context;"), "getString", listOf("I"), "getString", "Landroid/content/Context;"),
    Redirect(setOf("Laci;"), "getString", listOf("I"), "getString", "Landroid/app/Fragment;"),
)

/** Calls SwissKeyboard.add at each return of the language list's constructor. */
private fun BytecodePatchContext.swissKeyboard() {
    val init = method("Lacj;", "<init>", listOf(CONTEXT))
    init.implementation!!.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_VOID }
        .map { it.index }
        .reversed()
        .forEach { init.addInstructions(it, "invoke-static {p0}, ${EXT}SwissKeyboard;->add(Ljava/lang/Object;)V") }
}
