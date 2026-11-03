package app.tikkamasalla.vimu.introskip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Lets the app run after re-signing.
 *
 * Stock Vimu 12.00 checks the signing certificate in
 * ComponentActivity.getView(Context) and exits when the hash differs, which
 * every re-signed (patched) build does. Returning at once skips the check.
 * The fingerprint anchors on the expected hash string, so a build without
 * this exact check fails clearly instead of stubbing another method.
 * Runs with Intro Skip (Vimu).
 */
val vimuResignCheckPatch = bytecodePatch(
    name = "Re-sign check (Vimu)",
    description = "Lets the app run after re-signing.",
    default = true,
) {
    compatibleWith(Constants.VIMU_COMPATIBILITY)

    execute {
        VimuResignCheckFingerprint.method.addInstructions(0, "return-void")
    }
}
