package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.indexOfReference
import app.mightymorphing.patches.shared.insertAt
import app.mightymorphing.patches.shared.writeBody
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption

private fun smaliString(value: String) = value.replace("\\", "\\\\").replace("\"", "\\\"")

@Suppress("unused")
val clientIdPatch = bytecodePatch(
    name = "Log in with your own client ID",
    description = "Lets Joey log in with another app's client ID, for when Joey's own login stops working. " +
        "Normal option here is to sign in to RedReader once, then paste the App ID from Reddit's \"you authorized an app\" email into this patch's settings in expert mode.",
    default = false,
) {
    compatibleWith(JOEY)

    val clientId by stringOption(
        "client-id",
        null,
        null,
        "Client ID",
        "The App ID from Reddit's \"you authorized an app\" email. Leave empty to keep Joey's own login.",
        false,
        validator = { value -> value.isNullOrBlank() || value.trim().matches(Regex("^[\\w-]{14,30}$")) },
    )
    val redirectUri by stringOption(
        "redirect-uri",
        "redreader://rr_oauth_redir",
        null,
        "Redirect URI",
        "Has to match the app the ID came from. The default works for RedReader.",
        true,
    )
    val userAgent by stringOption(
        "user-agent",
        "org.quantumbadger.redreader/1.25.1",
        null,
        "User agent",
        "Sent with Reddit requests. The default is RedReader's.",
        true,
    )

    execute {
        // No ID: leave Joey's own client ID, redirect and user agent alone.
        if (clientId.isNullOrBlank()) return@execute

        val id = smaliString(clientId!!.trim())
        val redirect = smaliString(redirectUri!!.trim())
        val agent = smaliString(userAgent!!.trim())

        writeBody(
            ClientIdFingerprint.method,
            1,
            """
            const-string v0, "$id"
            return-object v0
            """,
        )
        writeBody(
            UserAgentFingerprint.method,
            1,
            """
            const-string v0, "$agent"
            return-object v0
            """,
        )

        // JRAW turns the redirect string into a URI here. p7 is non-null on this path.
        val credentials = CredentialsFingerprint.method
        credentials.insertAt(
            credentials.indexOfReference("Lx7/a;->p("),
            """const-string p7, "$redirect"""",
        )

        // .locals 2 plus this and the url.
        writeBody(
            LoginCodeCheckFingerprint.method,
            4,
            """
            const/4 v0, 0x0
            if-nez p1, :check
            return v0
            :check
            const-string v1, "code="
            invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
            move-result v1
            if-eqz v1, :done
            const-string v1, "$redirect"
            invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
            move-result v0
            :done
            return v0
            """,
        )

        // The redirect is not a web page, so stop the WebView from trying to open it.
        // .locals 1 plus this, the WebView and the url.
        writeBody(
            LoginOverrideFingerprint.method,
            4,
            """
            iget-object v0, p0, Lo/o/joey/Activities/LoginActivity${'$'}d;->d:Lo/o/joey/Activities/LoginActivity;
            invoke-static {v0, p2}, Lo/o/joey/Activities/LoginActivity;->o3(Lo/o/joey/Activities/LoginActivity;Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :pass
            invoke-direct {p0, p2}, Lo/o/joey/Activities/LoginActivity${'$'}d;->a(Ljava/lang/String;)V
            const/4 v0, 0x1
            return v0
            :pass
            invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
            move-result v0
            return v0
            """,
        )
    }
}
