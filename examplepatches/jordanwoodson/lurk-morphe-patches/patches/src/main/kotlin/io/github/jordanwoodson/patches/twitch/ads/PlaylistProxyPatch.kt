package io.github.jordanwoodson.patches.twitch.ads

import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import io.github.jordanwoodson.patches.twitch.shared.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch
import org.w3c.dom.Element
import java.net.URI

private const val KEY = "playlist_proxy"

@Suppress("unused")
val playlistProxyPatch = bytecodePatch(
    name = "Playlist proxy",
    description = "Sends live stream playlist requests to a proxy server you set in this patch's options, for " +
        "example one that returns playlists without stitched ads. The proxy sees which channel you watch and " +
        "when. With {channel}, only the lowercase channel name is forwarded; the original signed query is " +
        "omitted. Without {channel}, the proxy gets the full request, including your signed playback token, " +
        "which identifies your account. The token is in the request's address (its query, or with {url} the whole " +
        "Twitch URL), so the proxy's access logs can keep it. The proxy decides what the player plays and can add segments of " +
        "its own: only use a proxy you trust. " +
        "An http:// proxy gets an exception from Twitch's HTTPS-only rule for its host alone, and the request " +
        "travels unencrypted. Does nothing while the proxy URL is empty; once it's set, the patch's switch " +
        "starts on (Lurk settings > Playback). Videos and clips are not proxied. " +
        "Avoid stitched ads leaves proxied streams alone: the proxy decides what their playlists hold.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)

    val proxyUrl by stringOption(
        key = "proxyUrl",
        default = "",
        title = "Proxy URL",
        description = "An https:// (or unencrypted http://) URL. With {channel}, for example " +
            "https://example.org/live/{channel}, only the lowercase channel name is substituted in the path or query; Twitch's signed " +
            "query is not sent. With {url}, the encoded full Twitch playlist URL is substituted. Without either, " +
            "the proxy takes the place of usher.ttvnw.net and gets the same path and query. Use one placeholder " +
            "type per URL. Empty: the patch does nothing.",
    ) { it.isNullOrBlank() || proxyProblem(it.trim()) == null }

    // Twitch only allows HTTPS. An http:// proxy's host gets a cleartext exception, nothing else does.
    dependsOn(resourcePatch {
        execute {
            val uri = runCatching { proxyUri(proxyUrl?.trim().orEmpty()) }.getOrNull()
            if (uri?.scheme?.lowercase() != "http" || uri.host.isNullOrEmpty()) return@execute
            val config = document("AndroidManifest.xml").use { manifest ->
                (manifest.getElementsByTagName("application").item(0) as Element).getAttribute("android:networkSecurityConfig")
            }
            if (!config.startsWith("@xml/")) throw PatchException("Twitch: no network security config to extend")
            document("res/xml/${config.removePrefix("@xml/")}.xml").use { document ->
                val root = document.documentElement
                if (root.tagName != "network-security-config") throw PatchException("Twitch: unexpected network security config")
                root.appendChild(document.createElement("domain-config").apply {
                    setAttribute("cleartextTrafficPermitted", "true")
                    appendChild(document.createElement("domain").apply {
                        setAttribute("includeSubdomains", "false")
                        textContent = uri.host
                    })
                })
            }
        }
    })

    execute {
        val proxy = proxyUrl?.trim().orEmpty()
        if (proxy.isEmpty()) return@execute
        proxyProblem(proxy)?.let { throw PatchException("Playlist proxy: $it") }

        // The extension reads the proxy from a stub that returns null.
        ProxyTemplateFingerprint.twitchMatch("playlist proxy template stub").method.apply {
            val first = implementation!!.instructions.firstOrNull()
            if (first?.opcode != Opcode.CONST_4 || implementation!!.registerCount != 1) {
                throw PatchException("Twitch: unexpected playlist proxy stub")
            }
            replaceInstruction(0, BuilderInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(proxy)))
        }

        // Native players (live, picture-by-picture and vertical): the finished usher URL, returned
        // once Twitch has checked it isn't null.
        LivePlaylistUrlFingerprint.twitchMatch("native live playlist URL").method.apply {
            val instructions = implementation!!.instructions.toList()
            val index = instructions.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
            val register = (instructions.getOrNull(index) as? OneRegisterInstruction)?.registerA
            val check = instructions.getOrNull(index - 1)
            if (register == null || check?.opcode != Opcode.IF_EQZ || (check as OneRegisterInstruction).registerA != register) {
                throw PatchException("Twitch: native live playlist URL return changed")
            }
            addInstructions(index, """
                invoke-static/range { v$register .. v$register }, $ADS->proxyPlaylist(Landroid/net/Uri;)Landroid/net/Uri;
                move-result-object v$register
            """)
        }

        // React Native: the player view's stream URL and the preloader's, which must stay equal so the
        // view finds its preloaded player.
        RnPlayerStreamUrlFingerprint.twitchMatch("React Native player stream URL").method.apply {
            addInstructions(0, """
                ${invokeStatic("$ADS->proxyPlaylistUrl(Ljava/lang/String;)Ljava/lang/String;", parameterRegister(1))}
                move-result-object p1
            """)
        }
        RnPreloadFingerprint.twitchMatch("React Native player preload").method.addInstructions(0, """
            invoke-static/range { p2 .. p2 }, $ADS->proxyPlaylistUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """)

        val host = proxyUri(proxy).host
        val requestSummary = if (proxy.contains("{channel}")) {
            "Only the channel name is forwarded; Twitch's signed query is omitted. "
        } else {
            "The proxy receives your signed playback token. "
        }
        twitchSettings.add(SwitchSetting(KEY, "Playlist proxy",
            "Load live playlists through $host, which sees what you watch and decides what plays. " +
                requestSummary + "On once a proxy is set.", Section.PLAYBACK))
    }
}

private fun proxyProblem(proxy: String): String? {
    if (proxy.contains("{url}") && proxy.contains("{channel}")) return "use either {url} or {channel}, not both"
    val uri = runCatching { proxyUri(proxy) }.getOrNull() ?: return "not a URL"
    return when {
        uri.scheme?.lowercase() != "https" && uri.scheme?.lowercase() != "http" -> "must start with https:// or http://"
        uri.host.isNullOrEmpty() -> "has no host"
        else -> null
    }
}

private fun proxyUri(proxy: String): URI {
    // A channel template must keep a fixed origin, including the host granted cleartext access.
    val origin = proxy.substringBefore("://") + "://" +
        proxy.substringAfter("://").takeWhile { it !in "/?#" }
    require("{channel}" !in origin && "{channel}" !in proxy.substringAfter('#', "")) {
        "{channel} is only allowed in the path or query"
    }
    return URI(proxy.replace("{url}", "").replace("{channel}", ""))
}
