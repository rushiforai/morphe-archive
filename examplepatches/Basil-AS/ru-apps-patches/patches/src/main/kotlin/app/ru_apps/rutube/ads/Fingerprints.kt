// Ported from virzak/morphe-patches (GPLv3), app/rutube/patches/ads/Fingerprints.kt.
package app.ru_apps.rutube.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `ru.rutube.adsdk.AdSdk#initialize`, the single entry point of RuTube's in-house ad
 * SDK. It builds the SDK kernel that both the banner stack
 * (`adsdk/banner/.../BannerApi`, `BannerRulesApi`) and the VAST pre-roll stack
 * (`adsdk/video/backend/service/vast`) are resolved from.
 *
 * The class name is not obfuscated in 31.14.2, so it is matched directly. Parameters
 * are all obfuscated types and so are matched as bare objects, which also keeps the
 * fingerprint working when those types are renamed in a later build.
 *
 * The two string filters are the Kotlin null-check parameter names emitted at the top
 * of the method. They pin the method identity without depending on the obfuscated
 * types, and they would fail loudly if the signature were reordered.
 */
object AdSdkInitializeFingerprint : Fingerprint(
    definingClass = "Lru/rutube/adsdk/AdSdk;",
    name = "initialize",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "L", "L", "L", "L", "L"),
    filters = listOf(
        string("appType"),
        string("initBlock"),
    ),
)

/**
 * `ru.rutube.app.application.RtApp#onCreate`, the app's `Application.onCreate()`.
 *
 * A 2026-10 RuTube build removed the standalone `AdSdk.initialize(...)` entry point
 * entirely: the ad SDK kernel (`ru.rutube.adsdk.core.internal.b`, still unobfuscated,
 * still built from the same shape of inputs the old method took) is now constructed
 * inline inside this method, guarded by a one-shot static boolean flag checked right
 * before it. [AdSdkKernelConstructionFingerprint] locates that guard from inside this
 * method's instructions rather than matching the method itself, since `onCreate()` does
 * unrelated application bootstrap work before and after the ad SDK section.
 */
object RtAppOnCreateFingerprint : Fingerprint(
    definingClass = "Lru/rutube/app/application/RtApp;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)
