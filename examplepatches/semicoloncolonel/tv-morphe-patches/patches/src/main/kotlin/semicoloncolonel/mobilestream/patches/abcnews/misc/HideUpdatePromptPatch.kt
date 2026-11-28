package semicoloncolonel.mobilestream.patches.abcnews.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.abcnews.shared.Constants

// ABC News for Android TV 11.12.0 asks Disney's server which versions are
// current. When the server's "mandatory" or "suggested" version number is
// higher than the app's own, the app opens a screen that asks for, or
// requires, an update from Google Play. The app's number comes from a
// resource, not from the manifest, so Disable auto-updates does not change
// it. The update checker's copy of that number is now the highest possible,
// so no update is ever due and an older patched version keeps working.

internal object UpdateCheckerInitFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("Lcom/disney/libupdate/api/UpdateVersionApi;", "L", "I"),
)

@Suppress("unused")
val hideUpdatePromptPatch = bytecodePatch(
    name = "Hide update prompt",
    description = "Stops the app from asking for, or requiring, an update from Google Play.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)

    execute {
        // p3 is the app's version number; the constructor stores it.
        UpdateCheckerInitFingerprint.method.addInstruction(0, "const p3, 0x7fffffff")
    }
}
