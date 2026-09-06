package ajstrick81.morphe.patches.primevideo.nativehook

import ajstrick81.morphe.patches.primevideo.shared.Constants
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch

private fun ResourcePatchContext.bundleNativeHooks(abis: List<String>) {
    for (abi in abis) {
        val resourcePath = "/native/$abi/libpvhook.so"
        val soBytes = object {}.javaClass.getResourceAsStream(resourcePath)
            ?.use { it.readBytes() }
            ?: error(
                "Prime Video native hook $resourcePath is missing. Build the " +
                    "matching NDK ABI and add it to patches/src/main/resources/native/$abi/.",
            )

        get("lib/$abi/libpvhook.so").apply {
            parentFile?.mkdirs()
            writeBytes(soBytes)
        }
    }

    document("AndroidManifest.xml").use { document ->
        val application = document.getElementsByTagName("application").item(0)
            as? org.w3c.dom.Element ?: return@use
        application.setAttribute("android:extractNativeLibs", "true")
    }
}

// 6.23.23 ships only armeabi-v7a.
@Suppress("unused")
val bundleNativeHookPatchV6_23 = resourcePatch(
    name = "Bundle native ad-strip hook",
    description = "Packages the Prime Video libignite interception library for this APK's ABIs.",
) {
    compatibleWith(Constants.COMPATIBILITY_6_23)
    execute { bundleNativeHooks(listOf("armeabi-v7a")) }
}

// 6.24.5 is an all-ABI APKM. Bundle both libraries so the merged APK works on
// 32-bit and 64-bit TVs instead of silently loading only on the test device.
@Suppress("unused")
val bundleNativeHookPatchV6_24 = resourcePatch(
    name = "Bundle native ad-strip hook",
    description = "Packages the Prime Video libignite interception library for this APK's ABIs.",
) {
    compatibleWith(Constants.COMPATIBILITY_6_24)
    execute { bundleNativeHooks(listOf("armeabi-v7a", "arm64-v8a")) }
}
