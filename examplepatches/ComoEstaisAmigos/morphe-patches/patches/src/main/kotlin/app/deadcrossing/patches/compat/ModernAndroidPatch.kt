package app.deadcrossing.patches.compat

import app.deadcrossing.patches.nativelib.NativeEdits
import app.deadcrossing.patches.shared.Constants.COMPATIBILITY
import app.deadcrossing.patches.shared.Constants.ORIGINAL_APK
import app.adebisi.patches.shared.applyByteEdits
import app.adebisi.patches.shared.makeBindExplicit
import app.adebisi.patches.shared.requireStockNative
import app.adebisi.patches.shared.setTargetSdk
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.deleteResource
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.util.returnEarly

/**
 * targetSdk 25, TEXTREL, and the Play Store bindService setPackage belong together:
 * from 21 an implicit Intent throws, and from 23 the linker refuses a text relocation.
 */
@Suppress("unused")
val modernAndroidPatch = patch(
    name = "Modern Android compatibility",
    description = "Fixes the crash at launch on current Android and targets API 25 so that Android 14 and later " +
        "install the game normally.",
) {
    compatibleWith(COMPATIBILITY)
    dependsOn(emptyYoumiSdksPatch)

    execute {
        requireStockNative(NativeEdits.FXS1, NativeEdits.FXS1_SHA256, "Feelingtouch", ORIGINAL_APK)
        requireStockNative(NativeEdits.MAIN, NativeEdits.MAIN_SHA256, "Feelingtouch", ORIGINAL_APK)
        requireStockNative(NativeEdits.MONO_REAL, NativeEdits.MONO_REAL_SHA256, "Feelingtouch", ORIGINAL_APK)
        requireStockNative(NativeEdits.UNITY_REAL, NativeEdits.UNITY_REAL_SHA256, "Feelingtouch", ORIGINAL_APK)

        applyByteEdits(NativeEdits.FXS1, NativeEdits.FXS1_TEXTREL, ORIGINAL_APK)
        applyByteEdits(NativeEdits.MAIN, NativeEdits.MAIN_TEXTREL, ORIGINAL_APK)
        applyByteEdits(NativeEdits.MONO_REAL, NativeEdits.MONO_TEXTREL, ORIGINAL_APK)
        applyByteEdits(NativeEdits.UNITY_REAL, NativeEdits.UNITY_TEXTREL, ORIGINAL_APK)
        replaceProxy(NativeEdits.MONO_REAL, NativeEdits.MONO_PROXY)
        replaceProxy(NativeEdits.UNITY_REAL, NativeEdits.UNITY_PROXY)
        // TEXTREL is applied on the assets copies, then copied over the lib/ proxies.
        NativeEdits.DROPPED_ASSET_LIBS.forEach { deleteResource(it) }

        makeBindExplicit(BindMarketBillingServiceFingerprint)
        UnityDeviceIdFingerprint.method.returnEarly("")

        document("AndroidManifest.xml").use { setTargetSdk(it) }
    }
}

private fun replaceProxy(realPath: String, proxyPath: String) {
    val real = resourceFile(realPath, copy = true)
    val proxy = resourceFile(proxyPath, copy = true)
    if (!real.exists()) throw PatchException("$realPath is missing from this APK")
    proxy.writeBytes(real.readBytes())
}
