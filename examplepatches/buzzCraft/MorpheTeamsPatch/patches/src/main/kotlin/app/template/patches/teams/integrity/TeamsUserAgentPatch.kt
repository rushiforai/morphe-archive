package app.template.patches.teams.integrity

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TEAMS_COMPATIBILITY
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

// Desktop Chrome user agent string to spoof as desktop browser
private const val DESKTOP_USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"

// default = false: this patch's fingerprint previously failed to match on a real
// device (Teams 1416/1.0.0.2026152302). The fingerprint has been loosened to
// match solely on the setUserAgentString method call — enable to test.
@Suppress("unused")
val teamsUserAgentPatch = bytecodePatch(
    name = "Desktop User-Agent for Login",
    description = "Spoofs the WebView user agent to a desktop Chrome user agent during Microsoft login, " +
        "allowing login as a desktop client instead of mobile. Works with conditional access policies that block mobile user agents.",
    default = false,
) {
    compatibleWith(TEAMS_COMPATIBILITY)
    dependsOn(teamsIntegrityBypassDependency())

    execute {
        // Find the setUserAgentString(String) call matched by the fingerprint's
        // methodCall filter and inject our desktop user agent right before it.
        val method = webViewAuthSetUpWebViewFingerprint.method
        val instructionMatch = webViewAuthSetUpWebViewFingerprint.instructionMatches.first()
        val index = instructionMatch.index

        // invoke-virtual {vObject, vParam}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V
        // registerC = WebSettings instance, registerD = the user agent string parameter.
        val invokeInstruction = instructionMatch.instruction as FiveRegisterInstruction
        val userAgentRegister = invokeInstruction.registerD

        // Insert const-string right before the invoke to overwrite the user agent
        // argument with our desktop user agent.
        method.addInstructions(
            index,
            """
                const-string v$userAgentRegister, "$DESKTOP_USER_AGENT"
            """.trimIndent(),
        )
    }
}

@JvmSynthetic
internal fun teamsUserAgentDependency() = teamsUserAgentPatch
