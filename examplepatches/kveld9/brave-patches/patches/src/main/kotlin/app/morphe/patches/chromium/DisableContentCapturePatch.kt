package app.morphe.patches.chromium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants
import app.morphe.patches.shared.replaceWithReturnBoolean

@Suppress("unused")
val disableContentCapturePatch = bytecodePatch(
    name = "Stop Text Sharing with System",
    description = "Stops sending page text to the Android capture service.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_BRAVE)

    execute {
        // shouldCapture is JNI-only (@CalledByNative) and gates native content capture.
        Fingerprint(
            definingClass = "Lorg/chromium/components/content_capture/OnscreenContentProvider;",
            name = "shouldCapture",
            returnType = "Z",
            parameters = listOf("Ljava/lang/String;"),
        ).method.replaceWithReturnBoolean(false)

        println("[Stop Text Sharing with System] Forced OnscreenContentProvider.shouldCapture -> false; page content no longer dispatched to ContentCapture.")
    }
}
