package app.morphe.patches.applemusic.dilink

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.applemusic.shared.Constants.APPLE_MUSIC_DILINK
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val EXTENSION_PACKAGE = "Lapp/morphe/extension/"
private const val OBJECTS_COMPAT = "${EXTENSION_PACKAGE}applemusic/ObjectsCompat;"
private const val LIST_COMPAT = "${EXTENSION_PACKAGE}applemusic/ListCompat;"
private const val INSETS_COMPAT = "${EXTENSION_PACKAGE}applemusic/WindowInsetsControllerCompat;"
private const val WIFI_COMPAT = "${EXTENSION_PACKAGE}applemusic/WifiInfoCompat;"
private const val ACCESSIBILITY_COMPAT = "${EXTENSION_PACKAGE}applemusic/AccessibilityCompat;"
private const val PLATFORM_COMPAT = "${EXTENSION_PACKAGE}applemusic/PlatformCompat;"

/**
 * x2/W and x2/W$a are androidx.core.view.WindowInsetsControllerCompat and its Impl30 after R8.
 * Descriptors confirmed with dexdump on classes.dex of 7.0.0 (see analysis/api-levels.md §1.4).
 */
private const val W = "Lx2/W;"
private const val W_IMPL = "Lx2/W\$a;"
private const val SDK_INT = "Landroid/os/Build\$VERSION;->SDK_INT:I"

/**
 * x2/v is androidx.core.view.SoftwareKeyboardControllerCompat (jadx: p468x2/C6812v for the outer
 * class and p468x2/C6812v$a/$b for the impls). x2/v$b is Impl30: its show()/hide() call
 * View.getWindowInsetsController() (API 30) with no guard, because R8 removed the SDK_INT
 * selection when the app was built with minSdk 30. x2/v$a is Impl20, which only uses
 * InputMethodManager and is safe on API 29.
 */
private const val V_IMPL20 = "Lx2/v\$a;"

/**
 * m1.x() is the only method in the dex that contains "android.hardware.sensor.hinge_angle"
 * and the only one returning K; (m1.java:505-515). Forcing K.TABLET reaches every consumer,
 * including MainActivity's setRequestedOrientation(-1) decision (MainActivity.java:937-945).
 */
internal object TabletFingerprint : Fingerprint(
    returnType = "Lcom/apple/android/music/utils/K;",
    strings = listOf("android.hardware.sensor.hinge_angle"),
)

/**
 * EmojiSearchFragment$a.onGlobalLayout() calls API 30 WindowInsets/Window methods without
 * any SDK_INT check (EmojiSearchFragment.java:82,85,92,104).
 */
internal object EmojiGlobalLayoutFingerprint : Fingerprint(
    definingClass = "Lcom/apple/android/music/common/views/EmojiSearchFragment\$a;",
    name = "onGlobalLayout",
    returnType = "V",
)

/**
 * The implementing class is obfuscated (Le7/i; in 7.0.0), so it is identified by the
 * interface it implements. getAppIntegrityToken is the only method with this name in a
 * class implementing IExternalAppIntegrityProvider.
 */
internal object AppIntegrityTokenFingerprint : Fingerprint(
    name = "getAppIntegrityToken",
    custom = { _, classDef ->
        "Lcom/apple/mediaservices/amskit/fairplay/IExternalAppIntegrityProvider;" in classDef.interfaces
    },
)

// The store request interceptor that adds Anisette headers.
internal object AnisetteRequestFingerprint : Fingerprint(
    definingClass = "Ltb/a;",
    name = "a",
    parameters = listOf(
        "Lcom/apple/android/music/storeapi/modelprivate/Request;",
        "Lkotlin/coroutines/Continuation;",
    ),
    returnType = "Ljava/lang/Object;",
)

// TEMP debug: WebContainer user scripts (AMS bundle) and WebView DevTools.
internal object WebContainerScriptsFingerprint : Fingerprint(
    definingClass = "Lcom/apple/mediaservices/amsuikit/pageview/webcontainer/WebContainerScripts;",
    name = "<init>",
    parameters = listOf("Landroid/content/Context;", "Ljava/util/List;"),
    returnType = "V",
)

// The app's IAnisetteProvider.request implementation: replace the failing local ADI call with
// the remote Anisette v3 values.
internal object AnisetteProviderRequestFingerprint : Fingerprint(
    definingClass = "Le7/d;",
    name = "request-4PLdz1A",
    parameters = listOf("J", "Lkotlin/coroutines/Continuation;"),
    returnType = "Ljava/lang/Object;",
)

internal object AnisetteProvisioningFingerprint : Fingerprint(
    definingClass = "Le7/d;",
    name = "provisioning",
    parameters = listOf(
        "[B",
        "Lcom/apple/mediaservices/amskit/accounts/MediaAccount;",
        "Lcom/apple/mediaservices/amskit/network/EncodeHTTPRequestTask\$AnisetteType;",
        "Lcom/apple/mediaservices/amskit/bag/Bag;",
        "Lcom/apple/mediaservices/amskit/AndroidBundleInfo;",
        "Lkotlin/coroutines/Continuation;",
    ),
    returnType = "Ljava/lang/Object;",
)

internal object AnisetteSynchronizeFingerprint : Fingerprint(
    definingClass = "Le7/d;",
    name = "synchronize",
    parameters = listOf(
        "[B",
        "Lcom/apple/mediaservices/amskit/accounts/AccountIdentity;",
        "Lcom/apple/mediaservices/amskit/network/EncodeHTTPRequestTask\$AnisetteType;",
        "Lcom/apple/mediaservices/amskit/bag/Bag;",
        "Lcom/apple/mediaservices/amskit/AndroidBundleInfo;",
        "Lkotlin/coroutines/Continuation;",
    ),
    returnType = "Ljava/lang/Object;",
)

internal object AnisetteEraseFingerprint : Fingerprint(
    definingClass = "Le7/d;",
    name = "eraseProvisioning-4PLdz1A",
    parameters = listOf("J", "Lkotlin/coroutines/Continuation;"),
    returnType = "Ljava/lang/Object;",
)

// INativeAnisetteProvider implementation (e7.k): AMSCore still calls these directly.
internal object NativeAnisetteRequestFingerprint : Fingerprint(
    definingClass = "Le7/k;",
    name = "request-VKZWuLQ",
    parameters = listOf("J"),
    returnType = "Lcom/apple/mediaservices/amskit/bindings/Expected;",
)

internal object NativeAnisetteStartFingerprint : Fingerprint(
    definingClass = "Le7/k;",
    name = "startProvisioning-4PLdz1A",
    parameters = listOf("J", "[B"),
    returnType = "Lcom/apple/mediaservices/amskit/bindings/Expected;",
)

internal object NativeAnisetteFinishFingerprint : Fingerprint(
    definingClass = "Le7/k;",
    name = "finishProvisioning-E0BElUM",
    parameters = listOf("J", "[B", "[B"),
    returnType = "Lcom/apple/mediaservices/amskit/bindings/Expected;",
)

internal object NativeAnisetteSyncFingerprint : Fingerprint(
    definingClass = "Le7/k;",
    name = "synchronize-4PLdz1A",
    parameters = listOf("J", "[B"),
    returnType = "Lcom/apple/mediaservices/amskit/bindings/Expected;",
)

internal object NativeAnisetteEraseFingerprint : Fingerprint(
    definingClass = "Le7/k;",
    name = "eraseProvisioning-VKZWuLQ",
    parameters = listOf("J"),
    returnType = "Lcom/apple/mediaservices/amskit/bindings/Expected;",
)

internal object NativeAnisetteDisposeFingerprint : Fingerprint(
    definingClass = "Le7/k;",
    name = "dispose-VKZWuLQ",
    parameters = listOf("J"),
    returnType = "V",
)

// The WebContainer WebViewClient that can serve the build-time transpiled Apple JS assets.
internal object WebViewInterceptFingerprint : Fingerprint(
    definingClass = "Lcom/apple/mediaservices/amsuikit/pageview/webcontainer/webview/UIKitAndroidWebView\$androidWebView\$2\$3;",
    name = "shouldInterceptRequest",
    parameters = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"),
    returnType = "Landroid/webkit/WebResourceResponse;",
)

/**
 * openKeyboardForTitle() builds the androidx WindowInsetsControllerCompat wrapper
 * (p468x2.W / x2.W$a), whose constructor calls Window.getInsetsController() (API 30)
 * unconditionally. The app was built with minSdk 30, so R8 already removed the
 * SDK_INT >= 30 fallback that the original compat class had; on API < 30 this path
 * throws NoSuchMethodError before the dialog's keyboard is shown.
 */
internal object NewPlaylistKeyboardFingerprint : Fingerprint(
    definingClass = "Lcom/apple/android/music/collection/mediaapi/fragment/NewPlaylistFragment;",
    name = "openKeyboardForTitle",
    returnType = "V",
)

/**
 * x2/W$a.<init>(Window, x2/v) is the Impl30 constructor: it calls Window.getInsetsController()
 * (API 30) with no guard (dexdump: 6ab29c, invoke-virtual @0000). This is the constructor used
 * by every API < 35 caller (dexdump: x2/W.<init> @0x0018 and every new-instance x2/W$a).
 */
internal object InsetsImplWindowInitFingerprint : Fingerprint(
    definingClass = W_IMPL,
    name = "<init>",
    parameters = listOf("Landroid/view/Window;", "Lx2/v;"),
    returnType = "V",
)

/** x2/W.a(Z) — setAppearanceLightStatusBars, dereferences the controller (dexdump: 6ab4c0). */
internal object InsetsLightStatusBarsFingerprint : Fingerprint(
    definingClass = W,
    name = "a",
    parameters = listOf("Z"),
    returnType = "V",
)

/** x2/W.b(Z) — setAppearanceLightNavigationBars, dereferences the controller (dexdump: 6ab51c). */
internal object InsetsLightNavigationBarsFingerprint : Fingerprint(
    definingClass = W,
    name = "b",
    parameters = listOf("Z"),
    returnType = "V",
)

/** x2/W$a.a()Z — isAppearanceLightStatusBars (dexdump: 6ab234). */
internal object InsetsIsLightStatusBarsFingerprint : Fingerprint(
    definingClass = W_IMPL,
    name = "a",
    parameters = emptyList(),
    returnType = "Z",
)

/** x2/W$a.b()Z — isAppearanceLightNavigationBars (dexdump: 6ab268). */
internal object InsetsIsLightNavigationBarsFingerprint : Fingerprint(
    definingClass = W_IMPL,
    name = "b",
    parameters = emptyList(),
    returnType = "Z",
)

/** x2/W$a.c()V — setSystemBarsBehavior (dexdump: 6ab2fc). */
internal object InsetsSetBehaviorFingerprint : Fingerprint(
    definingClass = W_IMPL,
    name = "c",
    parameters = emptyList(),
    returnType = "V",
)

/**
 * FullScreenVideoActivity.onCreate ends with the API 30 insets block
 * (FullScreenVideoActivity.java:691-695):
 *
 *   Window window = getWindow();
 *   C6812v impl = new C6812v(getWindow().getDecorView());
 *   W.a v = SDK_INT >= 35 ? new W.c(window, impl) : new W.a(window, impl);
 *   v.c();
 *   v.f82859a.hide(519);
 *
 * On API 29 v.f82859a is null, so the block has to be skipped as a whole.
 */
internal object FullScreenVideoOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/apple/android/music/player2/FullScreenVideoActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

/**
 * x2/v$b.a()V — SoftwareKeyboardControllerCompat.Impl30.hide(): calls
 * View.getWindowInsetsController() (API 30) and then WindowInsetsController.hide(ime).
 * Called by E1/P.run() (Compose keyboard controller), Af/i (Material SearchView) and
 * NewPlaylistFragment.openKeyboardForTitle.
 */
internal object SoftwareKeyboardHideFingerprint : Fingerprint(
    definingClass = "Lx2/v\$b;",
    name = "a",
    parameters = emptyList(),
    returnType = "V",
)

/**
 * x2/v$b.b()V — SoftwareKeyboardControllerCompat.Impl30.show(): calls
 * View.getWindowInsetsController() (API 30) and then WindowInsetsController.show(ime).
 * Called by E1/P.run(), Af/h (Material SearchView) and NewPlaylistFragment.
 */
internal object SoftwareKeyboardShowFingerprint : Fingerprint(
    definingClass = "Lx2/v\$b;",
    name = "b",
    parameters = emptyList(),
    returnType = "V",
)

/**
 * x2/E$j.c(View) is ViewCompat.getWindowInsetsController(View): it calls
 * View.getWindowInsetsController() (API 30) and wraps the result in x2/W.
 * The DiLink target has no such method, so it returns null below API 30 (the same
 * contract androidx's own compat class has).
 */
internal object ViewCompatInsetsControllerFingerprint : Fingerprint(
    definingClass = "Lx2/E\$j;",
    name = "c",
    parameters = listOf("Landroid/view/View;"),
    returnType = "Lx2/W;",
)

/**
 * androidx.preference/a$a.a(Window) shows the IME of a preference dialog's window through
 * View.getWindowInsetsController(), WindowInsets.Type.ime() and WindowInsetsController.show(),
 * all API 30, without an SDK_INT guard (PreferenceFragmentCompat built with minSdk 30).
 * On API < 30 the whole method is a no-op.
 */
internal object PreferenceInsetsKeyboardFingerprint : Fingerprint(
    definingClass = "Landroidx/preference/a\$a;",
    name = "a",
    parameters = listOf("Landroid/view/Window;"),
    returnType = "V",
)

/**
 * N4/a.<init>(Context) creates the MediaRouter2 provider (N4/e, API 30) when the app has the
 * matching broadcast receiver. fixed22 skipped the provider creation on the car; here it is
 * skipped only below API 30, so phones keep the modern provider.
 */
internal object MediaRouterProviderFingerprint : Fingerprint(
    definingClass = "LN4/a;",
    name = "<init>",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "V",
)

/**
 * androidx.mediarouter.app.c.<init>(Context, AttributeSet, int) calls View.isInEditMode() and
 * then initializes a MediaRouter (API 30 routes). fixed22 forced the edit-mode branch; the same
 * is done here so mRouter stays null and refreshRoute() is null-guarded below.
 */
internal object MediaRouterViewInitFingerprint : Fingerprint(
    definingClass = "Landroidx/mediarouter/app/c;",
    name = "<init>",
    parameters = listOf(
        "Landroid/content/Context;",
        "Landroid/util/AttributeSet;",
        "I",
    ),
    returnType = "V",
)

/** Refresh path of the same view: refreshes mRouter without a null check (NPE on the car). */
internal object MediaRouterViewRefreshFingerprint : Fingerprint(
    definingClass = "Landroidx/mediarouter/app/c;",
    name = "refreshRoute",
    parameters = emptyList(),
    returnType = "V",
)

/** x2/V$e.y(View) only throws UnsupportedOperationException; return null below API 30. */
internal object WindowInsetsImpl20ThrowFingerprint : Fingerprint(
    definingClass = "Lx2/V\$e;",
    name = "y",
    parameters = listOf("Landroid/view/View;"),
    returnType = "Ln2/b;",
)

/**
 * x2/V.<init>(WindowInsets) chooses V$j for API >= 34 and V$i (API 30 impl) for everything
 * below. The car is API 29, so the second branch has to use V$e (the API 20 impl) there.
 */
internal object WindowInsetsCompatInitFingerprint : Fingerprint(
    definingClass = "Lx2/V;",
    name = "<init>",
    parameters = listOf("Landroid/view/WindowInsets;"),
    returnType = "V",
)

/**
 * vf/k.onGlobalLayout does layout work that fixed22 cut short with a return; the rest of the
 * method is skipped below API 30 only.
 */
internal object LegacyLayoutGlobalLayoutFingerprint : Fingerprint(
    definingClass = "Lvf/k;",
    name = "onGlobalLayout",
    parameters = emptyList(),
    returnType = "V",
)

/**
 * x2/E.m(View, x2/U$b) is ViewCompat.setWindowInsetsAnimationCallback: it constructs
 * x2/U$c$a, which extends android.view.WindowInsetsAnimation.Callback (API 30). Loading that
 * class kills the process on API 29, even before the redirected platform call is reached.
 */
internal object ViewCompatAnimationFingerprint : Fingerprint(
    definingClass = "Lx2/E;",
    name = "m",
    parameters = listOf("Landroid/view/View;", "Lx2/U\$b;"),
    returnType = "V",
)

/** One "redirect these platform calls to an extension helper" rule. */
private class RedirectRule(
    val key: String,
    val targetClass: String,
    val targetNames: Set<String>,
    val helperClass: String,
    val helperParameters: (MethodReference) -> List<String>,
    val expectedCalls: Int,
    /** Restricts the rule to one invoke-* opcode (null matches any). */
    val opcode: Opcode? = null,
    /** Helper method name when it must differ from the platform method name. */
    val helperName: String? = null,
)

private fun Instruction.methodCalled(definingClass: String, names: Set<String>): MethodReference? {
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    return reference.takeIf { it.definingClass == definingClass && it.name in names }
}

private fun Instruction.methodCalled(rule: RedirectRule): MethodReference? {
    if (rule.opcode != null && opcode != rule.opcode) return null
    return methodCalled(rule.targetClass, rule.targetNames)
}

/**
 * Rewrites every invoke-* of the given platform methods to a static helper that receives the
 * original receiver as its first argument. Register list and return type are preserved, so the
 * call site keeps working; only the declaring class and the prototype change.
 */
private fun BytecodePatchContext.redirectCalls(rules: List<RedirectRule>): Map<String, Int> {
    val counts = rules.associate { it.key to 0 }.toMutableMap()

    val candidates = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        // Never rewrite the helpers themselves (they call the platform methods on purpose).
        if (!classDef.type.startsWith(EXTENSION_PACKAGE) &&
            classDef.methods.any { method ->
                method.implementation?.instructions?.any { instruction ->
                    rules.any { rule -> instruction.methodCalled(rule) != null }
                } == true
            }
        ) {
            candidates += classDef
        }
    }

    for (classDef in candidates) {
        for (method in mutableClassDefBy(classDef).methods) {
            val implementation = method.implementation ?: continue
            val rewrites = implementation.instructions.mapIndexedNotNull { index, instruction ->
                rules.firstOrNull { rule ->
                    instruction.methodCalled(rule) != null
                }?.let { index to it }
            }
            for ((index, rule) in rewrites) {
                val instruction = implementation.instructions[index] as Instruction35c
                val reference = (instruction as ReferenceInstruction).reference as MethodReference
                implementation.replaceInstruction(
                    index,
                    BuilderInstruction35c(
                        Opcode.INVOKE_STATIC,
                        instruction.registerCount,
                        instruction.registerC,
                        instruction.registerD,
                        instruction.registerE,
                        instruction.registerF,
                        instruction.registerG,
                        ImmutableMethodReference(
                            rule.helperClass,
                            rule.helperName ?: reference.name,
                            rule.helperParameters(reference),
                            reference.returnType,
                        ),
                    ),
                )
                counts[rule.key] = counts.getValue(rule.key) + 1
            }
        }
    }

    counts.forEach { (key, count) ->
        val expected = rules.first { it.key == key }.expectedCalls
        check(count == expected) { "Expected $expected $key call sites, redirected $count" }
    }
    return counts
}

/**
 * Rewrites every invoke-static of a platform method to the same-signature static helper (no
 * receiver argument). Used for android.os.ext.SdkExtensions.getExtensionVersion(int).
 */
private fun BytecodePatchContext.redirectStaticCalls(
    targetClass: String,
    targetName: String,
    helperClass: String,
    expectedCalls: Int,
) {
    var count = 0
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
        for (method in mutableClassDefBy(classDef).methods) {
            val implementation = method.implementation ?: continue
            val indexes = implementation.instructions.mapIndexedNotNull { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                if (instruction.opcode == Opcode.INVOKE_STATIC &&
                    reference?.definingClass == targetClass &&
                    reference.name == targetName
                ) {
                    index
                } else {
                    null
                }
            }
            for (index in indexes) {
                val instruction = implementation.instructions[index] as Instruction35c
                val reference = (instruction as ReferenceInstruction).reference as MethodReference
                implementation.replaceInstruction(
                    index,
                    BuilderInstruction35c(
                        Opcode.INVOKE_STATIC,
                        instruction.registerCount,
                        instruction.registerC,
                        instruction.registerD,
                        instruction.registerE,
                        instruction.registerF,
                        instruction.registerG,
                        ImmutableMethodReference(
                            helperClass,
                            targetName,
                            reference.parameterTypes,
                            reference.returnType,
                        ),
                    ),
                )
                count++
            }
        }
    }
    check(count == expectedCalls) {
        "Expected $expectedCalls $targetClass->$targetName calls, redirected $count"
    }
}

/**
 * Replaces every read of one of the given static fields with `const/4 vX, 0`.
 *
 * Used for the AccessibilityAction constants added in API 30: their class exists on API 29 but
 * the fields do not, so a field read throws NoSuchFieldError while the accessibility bridge
 * initializes.
 */
private fun BytecodePatchContext.nullFields(
    targetClass: String,
    fieldNames: Set<String>,
    expectedCalls: Int,
) {
    var count = 0
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
        for (method in mutableClassDefBy(classDef).methods) {
            val implementation = method.implementation ?: continue
            val replacements = implementation.instructions.mapIndexedNotNull { index, instruction ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    ?: return@mapIndexedNotNull null
                if (field.definingClass != targetClass || field.name !in fieldNames) {
                    return@mapIndexedNotNull null
                }
                index to (instruction as Instruction21c).registerA
            }
            for ((index, register) in replacements) {
                implementation.replaceInstruction(
                    index,
                    BuilderInstruction11n(Opcode.CONST_4, register, 0),
                )
                count++
            }
        }
    }
    check(count == expectedCalls) {
        "Expected $expectedCalls $targetClass field reads, replaced $count"
    }
}

private fun Instruction.isNewInstanceOf(type: String): Boolean =
    opcode == Opcode.NEW_INSTANCE &&
        ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type == type

@Suppress("unused")
val appleMusicDiLinkPatch = bytecodePatch(
    name = "Apple Music DiLink support",
    description = "Unlocks landscape rotation, lowers the API floor to Android 10 (API 29), " +
        "backports the API 30 java/androidx/accessibility calls and bypasses Play Integrity.",
    default = true,
) {
    compatibleWith(APPLE_MUSIC_DILINK)
    dependsOn(dilinkManifestPatch, dilinkTlsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // x() has 2 registers and no parameters, so v0 is free at method entry.
        TabletFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/apple/android/music/utils/K;->TABLET:Lcom/apple/android/music/utils/K;
                return-object v0
            """,
        )

        // onGlobalLayout() has 5 registers and 1 parameter (this = v4), so v0/v1 are free.
        // The original body registers API 30 window insets listeners; returning early on
        // API < 30 skips all of them, including setDecorFitsSystemWindows(false).
        EmojiGlobalLayoutFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    sget v0, $SDK_INT
                    const/16 v1, 0x1e
                    if-ge v0, v1, :supported
                    return-void
                """,
                ExternalLabel("supported", getInstruction(0)),
            )
        }

        // getAppIntegrityToken() has 6 registers and 2 parameters, so v0 is free.
        // Its callers already handle a null token (p095e7/i.java:66-68). The Anisette/FairPlay
        // login path fails with the same code with or without this bypass, so it is unrelated.
        AppIntegrityTokenFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        AnisetteRequestFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, Lapp/morphe/extension/applemusic/PlatformCompat;->applyAnisetteHeaders(Ljava/lang/Object;)V",
        )

        AnisetteProviderRequestFingerprint.method.apply {
            val cont = implementation!!.instructions[0]
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {p1, p2}, Lapp/morphe/extension/applemusic/PlatformCompat;->remoteOtpResponse(J)Ljava/lang/Object;
                    move-result-object v0
                    if-eqz v0, :cont
                    return-object v0
                """,
                ExternalLabel("cont", cont),
            )
        }

        // Replace the remaining Anisette methods with success so the native ADI is never called
        // (it returns -45061 on a re-signed build and makes AMSCore erase the provisioning).
        for (fingerprint in listOf(
            AnisetteProvisioningFingerprint,
            AnisetteSynchronizeFingerprint,
            AnisetteEraseFingerprint,
        )) {
            fingerprint.method.addInstructions(
                0,
                """
                    invoke-static {}, Lapp/morphe/extension/applemusic/PlatformCompat;->expectedUnit()Ljava/lang/Object;
                    move-result-object v0
                    return-object v0
                """,
            )
        }

        NativeAnisetteRequestFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p1, p2}, Lapp/morphe/extension/applemusic/PlatformCompat;->remoteOtpResponse(J)Ljava/lang/Object;
                move-result-object v0
                return-object v0
            """,
        )
        NativeAnisetteStartFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lapp/morphe/extension/applemusic/PlatformCompat;->expectedStartProvisioning()Ljava/lang/Object;
                move-result-object v0
                return-object v0
            """,
        )
        NativeAnisetteSyncFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lapp/morphe/extension/applemusic/PlatformCompat;->expectedSync()Ljava/lang/Object;
                move-result-object v0
                return-object v0
            """,
        )
        NativeAnisetteFinishFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lapp/morphe/extension/applemusic/PlatformCompat;->expectedUnit()Ljava/lang/Object;
                move-result-object v0
                return-object v0
            """,
        )
        NativeAnisetteEraseFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lapp/morphe/extension/applemusic/PlatformCompat;->expectedUnit()Ljava/lang/Object;
                move-result-object v0
                return-object v0
            """,
        )
        NativeAnisetteDisposeFingerprint.method.addInstructions(0, "return-void")

        WebContainerScriptsFingerprint.method.apply {
            addInstructions(0, "invoke-static {p1, p2}, Lapp/morphe/extension/applemusic/PlatformCompat;->fixScripts(Ljava/lang/Object;Ljava/lang/Object;)V")
        }

        WebViewInterceptFingerprint.method.apply {
            val cont = implementation!!.instructions[0]
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {p2}, Lapp/morphe/extension/applemusic/PlatformCompat;->interceptWebResource(Ljava/lang/Object;)Landroid/webkit/WebResourceResponse;
                    move-result-object v0
                    if-eqz v0, :cont
                    return-object v0
                """,
                ExternalLabel("cont", cont),
            )
        }

        // openKeyboardForTitle() has 5 registers and 1 parameter (this = v3), so v0/v1 are
        // free. Skipping it on API < 30 avoids constructing the WindowInsetsControllerCompat
        // wrapper, whose constructor calls Window.getInsetsController() (API 30). The only
        // degradation is that the new-playlist dialog does not focus the title field.
        NewPlaylistKeyboardFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    sget v0, $SDK_INT
                    const/16 v1, 0x1e
                    if-ge v0, v1, :supported
                    return-void
                """,
                ExternalLabel("supported", getInstruction(0)),
            )
        }

        // ---------------------------------------------------------------------------------
        // API 29 backport: platform calls that only exist on API 30.
        // ---------------------------------------------------------------------------------

        // java.util.Objects.requireNonNullElse/ElseGet (7 call sites: the 5 playback getters
        // of MediaPlaybackPreferences, StorePlaybackQueueItemProvider.isExplicitAllowed and
        // medialibrary.library.a.<init>), java.util.List.of (7 call sites, one of them
        // BaseAssetRequest.fetchMiniSinfs), WifiInfo.getWifiStandard (metrics.f.b) and the
        // WindowInsetsController appearance/behavior calls, which all receive a null
        // controller on API 29 because of the x2/W$a constructor patch below.
        redirectCalls(
            listOf(
                RedirectRule(
                    key = "Objects.requireNonNullElse*",
                    targetClass = "Ljava/util/Objects;",
                    targetNames = setOf("requireNonNullElse", "requireNonNullElseGet"),
                    helperClass = OBJECTS_COMPAT,
                    helperParameters = { reference ->
                        listOf(
                            "Ljava/lang/Object;",
                            "Ljava/util/function/Supplier;".takeIf {
                                reference.name == "requireNonNullElseGet"
                            } ?: "Ljava/lang/Object;",
                        )
                    },
                    expectedCalls = 7,
                ),
                RedirectRule(
                    key = "List.of",
                    targetClass = "Ljava/util/List;",
                    targetNames = setOf("of"),
                    helperClass = LIST_COMPAT,
                    helperParameters = { reference ->
                        when (reference.parameterTypes.size) {
                            1 -> listOf("Ljava/lang/Object;")
                            2 -> listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
                            else -> error("Unsupported List.of arity: ${reference.parameterTypes.size}")
                        }
                    },
                    expectedCalls = 7,
                ),
                RedirectRule(
                    key = "WifiInfo.getWifiStandard",
                    targetClass = "Landroid/net/wifi/WifiInfo;",
                    targetNames = setOf("getWifiStandard"),
                    helperClass = WIFI_COMPAT,
                    helperParameters = { listOf("Landroid/net/wifi/WifiInfo;") },
                    expectedCalls = 1,
                ),
                // p507z3.C7059k.<clinit> reads IBinder.getSuggestedMaxIpcSizeBytes() (API 30).
                RedirectRule(
                    key = "IBinder.getSuggestedMaxIpcSizeBytes",
                    targetClass = "Landroid/os/IBinder;",
                    targetNames = setOf("getSuggestedMaxIpcSizeBytes"),
                    helperClass = PLATFORM_COMPAT,
                    helperParameters = { emptyList() },
                    expectedCalls = 1,
                    opcode = Opcode.INVOKE_STATIC,
                ),
                RedirectRule(
                    key = "Surface.setFrameRate",
                    targetClass = "Landroid/view/Surface;",
                    targetNames = setOf("setFrameRate"),
                    helperClass = PLATFORM_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;", "F", "I") },
                    expectedCalls = 2,
                    opcode = Opcode.INVOKE_VIRTUAL,
                ),
                RedirectRule(
                    key = "WindowInsetsController.setSystemBarsAppearance",
                    targetClass = "Landroid/view/WindowInsetsController;",
                    targetNames = setOf("setSystemBarsAppearance"),
                    helperClass = INSETS_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;", "I", "I") },
                    expectedCalls = 26,
                ),
                RedirectRule(
                    key = "WindowInsetsController.getSystemBarsAppearance",
                    targetClass = "Landroid/view/WindowInsetsController;",
                    targetNames = setOf("getSystemBarsAppearance"),
                    helperClass = INSETS_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;") },
                    expectedCalls = 4,
                ),
                RedirectRule(
                    key = "WindowInsetsController.setSystemBarsBehavior",
                    targetClass = "Landroid/view/WindowInsetsController;",
                    targetNames = setOf("setSystemBarsBehavior"),
                    helperClass = INSETS_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;", "I") },
                    expectedCalls = 2,
                ),
                // API 30 platform calls that fixed22 had removed from the binary by hand. They
                // are redirected to PlatformCompat, which keeps the API 30 behavior and degrades
                // to null/false/empty/no-op on API 29.
                RedirectRule(
                    key = "View.setWindowInsetsAnimationCallback",
                    targetClass = "Landroid/view/View;",
                    targetNames = setOf("setWindowInsetsAnimationCallback"),
                    helperClass = PLATFORM_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;", "Ljava/lang/Object;") },
                    expectedCalls = 4,
                    opcode = Opcode.INVOKE_VIRTUAL,
                ),
                RedirectRule(
                    key = "LayoutParams.setFitInsetsSides",
                    targetClass = "Landroid/view/WindowManager\$LayoutParams;",
                    targetNames = setOf("setFitInsetsSides"),
                    helperClass = PLATFORM_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;", "I") },
                    expectedCalls = 1,
                    opcode = Opcode.INVOKE_VIRTUAL,
                ),
                RedirectRule(
                    key = "LayoutParams.setFitInsetsTypes",
                    targetClass = "Landroid/view/WindowManager\$LayoutParams;",
                    targetNames = setOf("setFitInsetsTypes"),
                    helperClass = PLATFORM_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;", "I") },
                    expectedCalls = 1,
                    opcode = Opcode.INVOKE_VIRTUAL,
                ),
                RedirectRule(
                    key = "Outline.setPath",
                    targetClass = "Landroid/graphics/Outline;",
                    targetNames = setOf("setPath"),
                    helperClass = PLATFORM_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;", "Ljava/lang/Object;") },
                    expectedCalls = 4,
                    opcode = Opcode.INVOKE_VIRTUAL,
                ),
                RedirectRule(
                    key = "Context.getAttributionTag",
                    targetClass = "Landroid/content/Context;",
                    targetNames = setOf("getAttributionTag"),
                    helperClass = PLATFORM_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;") },
                    expectedCalls = 1,
                    opcode = Opcode.INVOKE_VIRTUAL,
                ),
                RedirectRule(
                    key = "ActivityManager.getHistoricalProcessExitReasons",
                    targetClass = "Landroid/app/ActivityManager;",
                    targetNames = setOf("getHistoricalProcessExitReasons"),
                    helperClass = PLATFORM_COMPAT,
                    helperParameters = {
                        listOf("Ljava/lang/Object;", "Ljava/lang/String;", "I", "I")
                    },
                    expectedCalls = 3,
                    opcode = Opcode.INVOKE_VIRTUAL,
                ),
                RedirectRule(
                    key = "View.isShowingLayoutBounds",
                    targetClass = "Landroid/view/View;",
                    targetNames = setOf("isShowingLayoutBounds"),
                    helperClass = PLATFORM_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;") },
                    expectedCalls = 1,
                    opcode = Opcode.INVOKE_VIRTUAL,
                ),
                RedirectRule(
                    key = "Window.setDecorFitsSystemWindows",
                    targetClass = "Landroid/view/Window;",
                    targetNames = setOf("setDecorFitsSystemWindows"),
                    helperClass = PLATFORM_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;", "Z") },
                    expectedCalls = 3,
                    opcode = Opcode.INVOKE_VIRTUAL,
                ),
                // Accessibility state descriptions were added in API 30. The app was built with
                // minSdk 30, so R8 kept these calls unguarded; the first one executed (from the
                // accessibility bridge during uiautomator dump or a car accessibility service)
                // throws NoSuchMethodError. Direct calls go to the helper, which keeps the API 30
                // behavior and returns null/does nothing on API 29. Call sites in 7.0.0:
                //   View.getStateDescription:       x2/E$j.b
                //   View.setStateDescription:       x2/E$j.d
                //   Node.getStateDescription:       y2/j.toString
                //   Node.setStateDescription:       x2/a$a.onInitializeAccessibilityNodeInfo and
                //                                   androidx.compose.ui.platform.b$c.b
                //   View.setStateDescription super: Lif/a (MaterialCheckBox), handled below.
                RedirectRule(
                    key = "View.getStateDescription",
                    targetClass = "Landroid/view/View;",
                    targetNames = setOf("getStateDescription"),
                    helperClass = ACCESSIBILITY_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;") },
                    expectedCalls = 1,
                    opcode = Opcode.INVOKE_VIRTUAL,
                ),
                RedirectRule(
                    key = "View.setStateDescription",
                    targetClass = "Landroid/view/View;",
                    targetNames = setOf("setStateDescription"),
                    helperClass = ACCESSIBILITY_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;", "Ljava/lang/CharSequence;") },
                    expectedCalls = 1,
                    opcode = Opcode.INVOKE_VIRTUAL,
                ),
                // MaterialCheckBox (Lif/a, classes4.dex) overrides setStateDescription and calls
                // super through invoke-super three times (setCheckedState + setStateDescription).
                // Redirecting those to the virtual helper would dispatch back into the same
                // override and recurse forever, so they get a no-op helper: the subclass keeps its
                // own field, only the platform a11y value is not updated on API 30+.
                RedirectRule(
                    key = "View.setStateDescription (invoke-super)",
                    targetClass = "Landroid/view/View;",
                    targetNames = setOf("setStateDescription"),
                    helperClass = ACCESSIBILITY_COMPAT,
                    helperName = "setStateDescriptionSuper",
                    helperParameters = { listOf("Ljava/lang/Object;", "Ljava/lang/CharSequence;") },
                    expectedCalls = 3,
                    opcode = Opcode.INVOKE_SUPER,
                ),
                RedirectRule(
                    key = "AccessibilityNodeInfo.getStateDescription",
                    targetClass = "Landroid/view/accessibility/AccessibilityNodeInfo;",
                    targetNames = setOf("getStateDescription"),
                    helperClass = ACCESSIBILITY_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;") },
                    expectedCalls = 1,
                ),
                RedirectRule(
                    key = "AccessibilityNodeInfo.setStateDescription",
                    targetClass = "Landroid/view/accessibility/AccessibilityNodeInfo;",
                    targetNames = setOf("setStateDescription"),
                    helperClass = ACCESSIBILITY_COMPAT,
                    helperParameters = { listOf("Ljava/lang/Object;", "Ljava/lang/CharSequence;") },
                    expectedCalls = 2,
                ),
            ),
        )

        // x2/E.m constructs the platform adapter x2/U$c$a (extends
        // android.view.WindowInsetsAnimation.Callback, API 30). fixed22 removed the whole body;
        // here the new-instance/invoke-direct are neutralized so v0 stays null and the redirected
        // View.setWindowInsetsAnimationCallback call receives null. On API 29 the helper is a
        // no-op; on API 30+ the callback is simply not installed (animation-only degradation).
        ViewCompatAnimationFingerprint.method.apply {
            val implementation = implementation ?: error("x2/E.m has no implementation")
            val adapterIndex = implementation.instructions.indexOfFirst {
                it.isNewInstanceOf("Lx2/U\$c\$a;")
            }
            check(adapterIndex >= 0) { "x2/E.m has no WindowInsetsAnimation adapter" }
            implementation.replaceInstruction(
                adapterIndex,
                BuilderInstruction11n(Opcode.CONST_4, 0, 0),
            )
            implementation.replaceInstruction(
                adapterIndex + 1,
                BuilderInstruction10x(Opcode.NOP),
            )
        }

        // x2/W$a.<init>(Window, x2/v): 4 registers, ins 3 -> v0 free, v1 = this, v2 = window,
        // v3 = impl. Morphe 2.1.0 has no addFreeRegisters, and there is no second free register
        // for a comparison constant, so the SDK test goes through the pure helper
        // isAtLeast30(int) and touches only v0:
        //   original instruction 0 = Window.getInsetsController() (API 30)
        //   original instruction 1 = its move-result-object
        //   original instruction 2 = invoke-direct <init>(WindowInsetsController, x2/v)
        //   original instruction 3 = iput-object window -> c
        //   original instruction 4 = return-void
        //
        // On API < 30 the two branches never meet: the legacy path does its own Object.<init>
        // (the same super call the typed constructor performs), sets b (impl) and c (window) and
        // returns, so the invoke-direct whose prototype mentions the missing
        // android.view.WindowInsetsController is NEVER executed. f82859a (the controller) keeps its
        // default null, so no instruction of the legacy path references that type.
        InsetsImplWindowInitFingerprint.method.apply {
            val instructions = implementation?.instructions ?: error("${W_IMPL}init has no code")
            check(instructions.size == 5) { "${W_IMPL}init(Window, x2/v): expected 5 instructions" }
            check(instructions[0].opcode == Opcode.INVOKE_VIRTUAL) {
                "${W_IMPL}init: instruction 0 is not the controller call"
            }
            check(instructions[2].opcode == Opcode.INVOKE_DIRECT) {
                "${W_IMPL}init: instruction 2 is not the delegating <init> call"
            }
            addInstructionsWithLabels(
                0,
                """
                    sget v0, $SDK_INT
                    invoke-static {v0}, $INSETS_COMPAT->isAtLeast30(I)Z
                    move-result v0
                    if-eqz v0, :legacy
                    goto :orig
                    :legacy
                    invoke-direct {v1}, Ljava/lang/Object;-><init>()V
                    iput-object v3, v1, ${W_IMPL}->b:Lx2/v;
                    iput-object v2, v1, ${W_IMPL}->c:Landroid/view/Window;
                    return-void
                """,
                ExternalLabel("orig", getInstruction(0)),
            )
        }

        // x2/W.a(Z): 5 registers, ins 2 -> v3 = this, v4 = value; v0-v2 are free.
        // With a null controller the original setSystemBarsAppearance would NPE, so only the
        // Impl20 systemUiVisibility fallback is executed (16 = APPEARANCE_LIGHT_STATUS_BARS).
        InsetsLightStatusBarsFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, v3, ${W}->a:${W_IMPL}
                    iget-object v1, v0, ${W_IMPL}->a:Landroid/view/WindowInsetsController;
                    if-eqz v1, :supported
                    iget-object v1, v0, ${W_IMPL}->c:Landroid/view/Window;
                    if-eqz v1, :done
                    const/16 v2, 0x10
                    if-eqz v4, :clear
                    invoke-virtual {v0, v2}, ${W_IMPL}->d(I)V
                    goto :done
                    :clear
                    invoke-virtual {v0, v2}, ${W_IMPL}->e(I)V
                    :done
                    return-void
                """,
                ExternalLabel("supported", getInstruction(0)),
            )
        }

        // x2/W.b(Z): 6 registers, ins 2 -> v4 = this, v5 = value; v0-v3 are free.
        // The fallback flag is 0x2000 (C.ROLE_FLAG_EASY_TO_READ), the value the original
        // body passes to d()/e(); setSystemBarsAppearance uses 8 (LIGHT_NAVIGATION_BARS).
        InsetsLightNavigationBarsFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, v4, ${W}->a:${W_IMPL}
                    iget-object v1, v0, ${W_IMPL}->a:Landroid/view/WindowInsetsController;
                    if-eqz v1, :supported
                    iget-object v1, v0, ${W_IMPL}->c:Landroid/view/Window;
                    if-eqz v1, :done
                    const/16 v2, 0x2000
                    if-eqz v5, :clear
                    invoke-virtual {v0, v2}, ${W_IMPL}->d(I)V
                    goto :done
                    :clear
                    invoke-virtual {v0, v2}, ${W_IMPL}->e(I)V
                    :done
                    return-void
                """,
                ExternalLabel("supported", getInstruction(0)),
            )
        }

        // x2/W$a.a()Z / b(): 2 registers, ins 1 -> v1 = this, v0 is free.
        // Reading getSystemBarsAppearance() with a null controller would NPE; report "not set".
        for (fingerprint in listOf(InsetsIsLightStatusBarsFingerprint, InsetsIsLightNavigationBarsFingerprint)) {
            fingerprint.method.apply {
                addInstructionsWithLabels(
                    0,
                    """
                        iget-object v0, v1, ${W_IMPL}->a:Landroid/view/WindowInsetsController;
                        if-eqz v0, :supported
                        const/4 v0, 0x0
                        return v0
                    """,
                    ExternalLabel("supported", getInstruction(0)),
                )
            }
        }

        // x2/W$a.c()V: 4 registers, ins 1 -> v3 = this, v0/v1/v2 are free.
        // Instruction 0 is the window load, instruction 3 the start of the tag path
        // (dexdump: 6ab306 invoke-virtual Window.getDecorView). With a null controller the
        // tag/systemUiVisibility path is still valid when the window is known, and it is
        // skipped (return) when it is not.
        InsetsSetBehaviorFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, v3, ${W_IMPL}->a:Landroid/view/WindowInsetsController;
                    if-eqz v0, :supported
                    iget-object v0, v3, ${W_IMPL}->c:Landroid/view/Window;
                    if-eqz v0, :tag
                    return-void
                    :tag
                    const/4 v1, 0x2
                    goto :tagPath
                """,
                ExternalLabel("supported", getInstruction(0)),
                ExternalLabel("tagPath", getInstruction(3)),
            )
        }

        // FullScreenVideoActivity.onCreate: skip only the trailing insets block on API < 30.
        // The anchor is the SDK_INT read that selects W$c/W$a; the skip target is the
        // instruction right after WindowInsetsController.hide(519), i.e. the return-void.
        // 10 registers, ins 2 -> v9 = this, v10? no: v8 = decorView (dead after the C6812v
        // constructor) and v1 is dead since the last call at 0x10f; both are overwritten by
        // the original code right after the injection point.
        FullScreenVideoOnCreateFingerprint.method.apply {
            val instructions = implementation?.instructions ?: error("onCreate has no implementation")
            val hideIndex = instructions.indexOfFirst { instruction ->
                instruction.methodCalled(
                    "Landroid/view/WindowInsetsController;",
                    setOf("hide"),
                ) != null
            }
            check(hideIndex >= 0) { "FullScreenVideoActivity.onCreate has no WindowInsetsController.hide call" }
            val sdkIndex = (hideIndex downTo 0).first { index ->
                val reference = (instructions[index] as? ReferenceInstruction)?.reference
                reference is FieldReference &&
                    reference.definingClass == "Landroid/os/Build\$VERSION;" &&
                    reference.name == "SDK_INT"
            }
            addInstructionsWithLabels(
                sdkIndex,
                """
                    sget v8, $SDK_INT
                    const/16 v1, 0x1e
                    if-lt v8, v1, :insets
                """,
                ExternalLabel("insets", getInstruction(hideIndex + 1)),
            )
        }

        // x2/v$b.a()/b() (SoftwareKeyboardControllerCompat.Impl30 show/hide): the whole body is
        // API 30 (View.getWindowInsetsController + WindowInsetsController.show/hide). On API < 30
        // delegate to the Impl20 superclass, which only uses InputMethodManager, instead of
        // throwing NoSuchMethodError. The register holding "this" is the last one of the frame
        // (6 registers -> v5 in a(), 4 registers -> v3 in b()); v0-v2 are free in both.
        for ((fingerprint, impl20Method) in listOf(
            SoftwareKeyboardHideFingerprint to "a",
            SoftwareKeyboardShowFingerprint to "b",
        )) {
            fingerprint.method.apply {
                val method = implementation ?: error("$impl20Method has no implementation")
                val self = "v${method.registerCount - 1}"
                addInstructionsWithLabels(
                    0,
                    """
                        sget v0, $SDK_INT
                        invoke-static {v0}, $INSETS_COMPAT->isAtLeast30(I)Z
                        move-result v0
                        if-nez v0, :legacy
                        goto :supported
                        :legacy
                        invoke-super {$self}, $V_IMPL20->$impl20Method()V
                        return-void
                    """,
                    ExternalLabel("supported", getInstruction(0)),
                )
            }
        }

        // x2/E$j.c: ViewCompat.getWindowInsetsController(View) calls the API 30
        // View.getWindowInsetsController(). 2 registers, ins 1 -> v0 is free, v1 is the View.
        // Below API 30 it returns null, like androidx does when the platform has no controller.
        ViewCompatInsetsControllerFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    sget v0, $SDK_INT
                    invoke-static {v0}, $INSETS_COMPAT->isAtLeast30(I)Z
                    move-result v0
                    if-nez v0, :legacy
                    goto :supported
                    :legacy
                    const/4 v0, 0x0
                    return-object v0
                """,
                ExternalLabel("supported", getInstruction(0)),
            )
        }

        // androidx.preference/a$a.a(Window): the whole body is API 30 (getWindowInsetsController,
        // WindowInsets.Type.ime and WindowInsetsController.show). 2 registers -> v0 is free,
        // v1 is the Window; below API 30 the dialog keyboard is simply not shown automatically.
        PreferenceInsetsKeyboardFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    sget v0, $SDK_INT
                    invoke-static {v0}, $INSETS_COMPAT->isAtLeast30(I)Z
                    move-result v0
                    if-nez v0, :legacy
                    goto :supported
                    :legacy
                    return-void
                """,
                ExternalLabel("supported", getInstruction(0)),
            )
        }

        // android.os.ext.SdkExtensions is an API 30 class called from androidx.core/MediaDrm
        // paths on worker threads; 15 call sites in the merged 7.0.0 XAPK.
        redirectStaticCalls(
            targetClass = "Landroid/os/ext/SdkExtensions;",
            targetName = "getExtensionVersion",
            helperClass = PLATFORM_COMPAT,
            expectedCalls = 15,
        )

        // AccessibilityAction constants added in API 30: the class exists on API 29, the fields
        // do not. The clinit of y2/j$a reads four of them while the accessibility tree starts,
        // so they become null (the same null fixed22 used).
        nullFields(
            "Landroid/view/accessibility/AccessibilityNodeInfo\$AccessibilityAction;",
            setOf(
                "ACTION_SHOW_TOOLTIP",
                "ACTION_HIDE_TOOLTIP",
                "ACTION_PRESS_AND_HOLD",
                "ACTION_IME_ENTER",
            ),
            expectedCalls = 4,
        )

        // N4/a.<init>: skip the MediaRouter2 provider (N4/e) on API < 30. At the injection
        // point v0 holds the receiver-count condition (dead afterwards) and v3 is reused by the
        // original new-instance on the next instruction, so both are free; v6/v7 are kept.
        MediaRouterProviderFingerprint.method.apply {
            val index = implementation?.instructions?.indexOfFirst {
                it.isNewInstanceOf("LN4/e;")
            } ?: -1
            check(index >= 0) { "N4/a.<init> has no MediaRouter2 provider creation" }
            addInstructionsWithLabels(
                index,
                """
                    sget v0, $SDK_INT
                    const/16 v3, 0x1e
                    if-lt v0, v3, :legacy
                    goto :orig
                    :legacy
                    goto :after
                """,
                ExternalLabel("orig", getInstruction(index)),
                ExternalLabel("after", getInstruction(index + 5)),
            )
        }

        // androidx.mediarouter.app.c.<init>: on API < 30 the MediaRouter (API 30 routes) must stay
        // null, so force the View.isInEditMode() result to true there. On API 30+ the real result
        // is kept; forcing it leaves mRouter null and onAttachedToWindow() NPEs.
        MediaRouterViewInitFingerprint.method.apply {
            val index = implementation?.instructions?.indexOfFirst {
                it.methodCalled("Landroid/view/View;", setOf("isInEditMode")) != null
            } ?: -1
            check(index >= 0) { "mediarouter c.<init> has no isInEditMode call" }
            // Inject after the move-result (index + 2); v5/v6 are dead at this point and the
            // result lives in v7.
            addInstructionsWithLabels(
                index + 2,
                """
                    sget v5, $SDK_INT
                    const/16 v6, 0x1e
                    if-ge v5, v6, :orig
                    const/4 v7, 0x1
                """,
                ExternalLabel("orig", getInstruction(index + 2)),
            )
        }

        // androidx.mediarouter.app.c.refreshRoute(): mRouter can be null after the edit-mode
        // branch above. 3 registers -> v0 holds mRouter, so test it before getClass().
        MediaRouterViewRefreshFingerprint.method.apply {
            val instructions = implementation?.instructions ?: error("refreshRoute has no code")
            addInstructionsWithLabels(
                1,
                "if-eqz v0, :done",
                ExternalLabel("done", getInstruction(instructions.size - 1)),
            )
        }

        // x2/V$e.y(View): the Impl20 class only throws here; return null instead.
        WindowInsetsImpl20ThrowFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        // x2/V.<init>(WindowInsets): for API < 34 the original picks V$i (Impl30), which calls
        // WindowInsets.Type.captionBar() and other API 30 methods. The choice is handled right
        // after Object.<init> (index 1): API < 30 uses V$e (Impl20), 30-33 keeps V$i, 34+ runs
        // the original V$j path. Injecting at the V$i instruction does not work: the original
        // "SDK < 34" branch jumps straight to it and skips the injected block.
        WindowInsetsCompatInitFingerprint.method.apply {
            addInstructionsWithLabels(
                1,
                """
                    sget v0, $SDK_INT
                    const/16 v1, 0x22
                    if-ge v0, v1, :orig
                    const/16 v1, 0x1e
                    if-ge v0, v1, :impl30
                    new-instance v0, Lx2/V${'$'}e;
                    invoke-direct {v0, v2, v3}, Lx2/V${'$'}e;-><init>(Lx2/V; Landroid/view/WindowInsets;)V
                    goto :store
                    :impl30
                    new-instance v0, Lx2/V${'$'}i;
                    invoke-direct {v0, v2, v3}, Lx2/V${'$'}i;-><init>(Lx2/V; Landroid/view/WindowInsets;)V
                    :store
                    iput-object v0, v2, Lx2/V;->a:Lx2/V${'$'}k;
                    return-void
                """,
                ExternalLabel("orig", getInstruction(1)),
            )
        }

        // vf/k.onGlobalLayout: fixed22 cut the method short right before the ContextWrapper
        // branch. Only skip the remainder below API 30; v4 is the destination of the original
        // instance-of, so it is free for the SDK test.
        LegacyLayoutGlobalLayoutFingerprint.method.apply {
            val index = implementation?.instructions?.indexOfFirst { instruction ->
                instruction.opcode == Opcode.INSTANCE_OF &&
                    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type ==
                    "Landroid/content/ContextWrapper;"
            } ?: -1
            check(index >= 0) { "vf/k.onGlobalLayout has no ContextWrapper check" }
            addInstructionsWithLabels(
                index,
                """
                    sget v4, $SDK_INT
                    invoke-static {v4}, $INSETS_COMPAT->isAtLeast30(I)Z
                    move-result v4
                    if-eqz v4, :legacy
                    goto :orig
                    :legacy
                    return-void
                """,
                ExternalLabel("orig", getInstruction(index)),
            )
        }
    }
}
