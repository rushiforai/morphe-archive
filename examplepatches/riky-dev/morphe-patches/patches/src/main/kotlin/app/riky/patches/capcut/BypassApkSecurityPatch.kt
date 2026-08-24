package app.riky.patches.capcut

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CAPCUT

@Suppress("unused")
val bypassApkSecurityPatch = bytecodePatch(
    name = "Bypass APK security check",
    description = "Disables the retouch SDK APK signature check that shows a toast when the " +
        "app was repatched (e.g. after applying Morphe patches). The native check in " +
        "libretouch_sdk.so still runs but its error UI is suppressed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAPCUT)

    execute {
        JniToastShowApkErrorFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        // Inner Runnable posted to the main looper; patch both entry points in case
        // strip-fast leaves this class in a different dex from the outer class.
        JniToastShowApkErrorRunnableFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
