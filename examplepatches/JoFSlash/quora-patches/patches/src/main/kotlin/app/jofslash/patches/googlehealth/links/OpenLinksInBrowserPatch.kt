package app.jofslash.patches.googlehealth.links

import app.jofslash.patches.googlehealth.shared.Constants.COMPATIBILITY_GOOGLE_HEALTH
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

// AndroidX Browser's CustomTabsIntent.Builder.setSessionParameters(binder), obfuscated. The browser
// opens a link as a custom tab only when the intent carries this session extra.
internal object SetCustomTabsSessionFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/os/IBinder;"),
    strings = listOf("android.support.customtabs.extra.SESSION"),
)

@Suppress("unused")
val openLinksInBrowserPatch = bytecodePatch(
    name = "Open links in browser",
    description = "Opens links, such as the Google Store, in your browser instead of a browser tab inside " +
            "the app.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_GOOGLE_HEALTH)

    execute {
        // Without the session extra the link is a plain VIEW intent.
        SetCustomTabsSessionFingerprint.method.addInstruction(0, "return-void")
    }
}
