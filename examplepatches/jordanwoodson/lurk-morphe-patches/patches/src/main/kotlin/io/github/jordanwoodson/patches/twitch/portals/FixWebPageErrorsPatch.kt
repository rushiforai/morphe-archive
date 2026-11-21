package io.github.jordanwoodson.patches.twitch.portals

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.addInstructionsWithLabels

private const val SSL_ERROR =
    "$PORTALS->sslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)Landroid/net/http/SslError;"

@Suppress("unused")
val fixWebPageErrorsPatch = bytecodePatch(
    name = "Fix web page errors",
    description = "Keeps Twitch's in-app web pages (Create Clip, Report, Sign up and others) open when a request " +
        "they make to another site fails its certificate check, as it does behind an HTTPS-filtering ad blocker, " +
        "VPN or DNS block page. Twitch closes the whole page on any such error (Create Clip: \"There was an " +
        "error, please try again later\"), unpatched Twitch included. The failed request stays blocked; errors " +
        "on the page's own site still close it. On by default; the switch is in Lurk settings > Interface.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)

    execute {
        portalClients().forEach { client ->
            // Capacitor's client has no locals here, so the hook hands back the error for Twitch, or null once it
            // has cancelled the request, and the SslError parameter takes the answer.
            val method = client.sslError
            val error = method.parameterRegister(3)
            method.addInstructionsWithLabels(0, """
                ${invokeStatic(SSL_ERROR, method.parameterRegister(1), method.parameterRegister(2), error)}
                move-result-object v$error
                if-nez v$error, :lurk_twitch
                return-void
            """, ExternalLabel("lurk_twitch", method.getInstruction(0)))
        }

        twitchSettings.add(SwitchSetting("fix_web_pages", "Fix web page errors",
            "Keep Create Clip, Report and Twitch's other web pages open when a tracker or another site they load fails " +
                "its certificate check, as behind an HTTPS-filtering ad blocker. That request stays blocked.",
            Section.INTERFACE))
    }
}
