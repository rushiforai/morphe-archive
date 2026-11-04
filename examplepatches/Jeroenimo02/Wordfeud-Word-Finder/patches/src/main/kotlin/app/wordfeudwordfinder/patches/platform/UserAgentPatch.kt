package app.wordfeudwordfinder.patches.platform

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val USER_AGENT_TAP = "Lapp/wordfeudwordfinder/extension/hooks/UserAgentTap;"

internal object SetUserAgentFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/net/CronetEngine\$Builder;",
    name = "setUserAgent",
    parameters = listOf("Ljava/lang/String;")
)

// Internal patch (no name): not shown in Morphe Manager or the CLI patch list. It is only applied through
// overlayPatch's dependsOn, which also supplies compatibleWith and the extension.
// Remembers the app's HTTP User-Agent so word finder requests look the same.
val userAgentPatch = bytecodePatch {
    execute {
        // Builder instance method: p0 = this, p1 = user agent string.
        SetUserAgentFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, $USER_AGENT_TAP->set(Ljava/lang/String;)V"
        )
    }
}
