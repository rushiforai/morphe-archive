package app.anghami.patches.core

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

/**
 * Build metadata for the Anghami release this bundle is authored against.
 *
 * Every patch in the bundle declares the same compatibility entry so that the
 * patch set can only be applied to a binary whose version codes were verified
 * against the signatures below. Bumping [VERSION]/[VERSION_CODE] is the single
 * change required to re-target the whole bundle.
 */
object AnghamiTarget {
    /** Android package name of the stock application. */
    const val PACKAGE_NAME = "com.anghami"

    /** Human readable version of the stock application. */
    const val VERSION = "8.0.28"

    /** Version code that [VERSION] must report for every supported ABI. */
    const val VERSION_CODE = 8000280

    /** Compatibility entry shared by all patches in the bundle. */
    val COMPATIBILITY = Compatibility(
        name = "Anghami",
        packageName = PACKAGE_NAME,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xA020F0,
        targets = listOf(
            AppTarget(
                version = VERSION,
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to VERSION_CODE,
                    SupportedAbi.ARMEABI_V7A to VERSION_CODE,
                    SupportedAbi.X86 to VERSION_CODE,
                    SupportedAbi.X86_64 to VERSION_CODE,
                ),
            ),
        ),
    )
}
