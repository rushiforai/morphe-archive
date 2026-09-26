/*
 * Copyright 2026 anondev.
 *
 * GPLv3. See the LICENSE file for details.
 */

package app.anondev.patches.zotero.sync

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.stringOption
import java.net.URI
import java.net.URISyntaxException

/*
 * Shared inputs and the endpoint policy for the "Custom sync server" patch family.
 *
 * The two patches in this bundle (a bytecode patch and a resource patch) both register these
 * SAME [Option] instances, so the values are entered once and read by both. See
 * [app.morphe.patcher.patch.PatchBuilder.invoke] — calling `serverOption()` / `streamingOption()`
 * inside a patch block registers the option and returns it.
 */

/**
 * The API origin, e.g. `https://zotero.example.org`.
 *
 * Required and HTTPS-only: it reaches Retrofit's `baseUrl`, so a path is refused (a sub-path
 * mount would need a trailing slash on the base URL that this patch does not synthesise) and a
 * cleartext scheme is refused because the target app (targetSdk 35) blocks cleartext for every
 * host that is not in `network_security_config.xml`.
 *
 * `key` is the property name Manager and the CLI expose; the CLI key is therefore
 * `-Oserver=…`.
 */
val serverOption: Option<String> = stringOption(
    key = "server",
    title = "Server address",
    description = "HTTPS origin of your self-hosted Zotero server, for example " +
        "https://zotero.example.org. Only the host (with an optional port) is accepted: " +
        "no path and no trailing slash. A missing scheme is assumed to be https://.",
    required = true,
)

/**
 * The streaming (live-update) WebSocket URL, e.g. `wss://zotero.example.org/stream`.
 *
 * Optional: when left empty it is derived from the API origin (see [resolveStreamingUrl]).
 * Unlike the API option, a cleartext value (`ws://` / `http://`) and a path are accepted here;
 * a cleartext value additionally makes [cleartextStreamingHost] return the host, which the
 * resource patch adds to the app's cleartext allow-list.
 *
 * The CLI key is `-Ostreaming=…`.
 */
val streamingOption: Option<String> = stringOption(
    key = "streaming",
    title = "Streaming address (optional)",
    description = "Full WebSocket URL for live updates, for example " +
        "wss://zotero.example.org/stream or ws://zotero.example.org/stream. A path is " +
        "allowed. Leave empty to derive it from the server address as wss://<server>/stream.",
    required = false,
)

/** The API base literal R8 inlined at every use site (5 sites in the pinned artifact). */
internal const val API_LITERAL_BARE = "https://api.zotero.org"

/** The API base literal with the trailing slash used by URL-building code (12 sites). */
internal const val API_LITERAL_WITH_SLASH = "https://api.zotero.org/"

/** The live-update literal (1 site: `websocket/WebSocketController`). */
internal const val STREAM_LITERAL = "wss://stream.zotero.org"

/** The app appends this to the server's login URL; against a queryless URL it corrupts the path. */
internal const val LOGIN_APP_PARAM_LITERAL = "&app=1"

/** The precondition header the app ships misspelled, at three sites: the deletion write and two read paths. Strict servers see no precondition on the write (428). */
internal const val DELETE_PRECONDITION_HEADER_MISSPELLED = "If-Modified-Since-Version"

/** The name the v3 write protocol defines. */
internal const val DELETE_PRECONDITION_HEADER = "If-Unmodified-Since-Version"

/** `BuildConfig.BASE_API_URL`, the surviving (but unreferenced) constant field. */
internal const val BUILD_CONFIG_CLASS = "Lorg/zotero/android/BuildConfig;"
internal const val BUILD_CONFIG_BASE_API_URL_FIELD = "BASE_API_URL"

/** Path of Zotero's streaming endpoint on a server. */
private const val STREAMING_PATH = "/stream"

/**
 * Normalise the `server` option to an origin (`scheme://host[:port]`, no trailing slash).
 *
 * Accepted: `host`, `host:port`, `https://host`, `https://host:port`, each optionally with a
 * single trailing slash. Since a scheme-less value is resolved as HTTPS, only `https` can
 * survive the scheme check; this is why `http://…` is refused here rather than by a bare
 * `startsWith("http://")` test.
 *
 * @throws PatchException for an empty value, a non-HTTPS scheme, a path, or any other form
 *   that is not a plain origin.
 */
fun normaliseOrigin(optionValue: String?): String {
    val raw = optionValue?.trim().orEmpty()

    if (raw.isEmpty()) {
        throw PatchException(
            "The 'server' option is empty. Enter the HTTPS origin of your self-hosted " +
                "Zotero server, for example https://zotero.example.org",
        )
    }

    // Assume HTTPS when the scheme is missing, then re-enter the parser so the scheme,
    // host and path checks below run exactly once.
    if (!raw.contains("://")) {
        return normaliseOrigin("https://$raw")
    }

    val uri = try {
        URI(raw)
    } catch (e: URISyntaxException) {
        throw PatchException("The 'server' option is not a valid address: '$raw'", e)
    }

    val scheme = uri.scheme?.lowercase()
    if (scheme != "https") {
        throw PatchException(
            "The 'server' option must be an HTTPS address, but '$raw' uses " +
                "'${scheme ?: ""}'. Android blocks cleartext traffic for this app, so only " +
                "an https:// origin can be used.",
        )
    }

    if (uri.host.isNullOrBlank()) {
        throw PatchException("The 'server' option must contain a host name: '$raw'")
    }

    val path = uri.path.orEmpty()
    if (path.isNotEmpty() && path != "/") {
        throw PatchException(
            "The 'server' option must be an origin without a path, but '$raw' carries the " +
                "path '$path'. Mount the server at the origin for now.",
        )
    }

    if (uri.query != null || uri.fragment != null || uri.userInfo != null) {
        throw PatchException(
            "The 'server' option must be a plain origin (no user, query or fragment): '$raw'",
        )
    }

    // uri.authority is host[:port]; path has been reduced to empty or "/", so this strips
    // exactly the trailing slash the spec allows.
    return "$scheme://${uri.authority}"
}

/**
 * (a) THE STREAMING POLICY POINT.
 *
 * Computes the WebSocket URL from the normalised API origin and the optional `streaming`
 * override. This is the single place that decides the streaming endpoint, so the policy can
 * change without touching the rewrite logic in [CustomSyncServerPatch]:
 *
 *  - no override → derive `wss://<origin-host[:port]>/stream` (TLS);
 *  - override    → use it verbatim, cleartext and paths included.
 *
 * The cleartext consequence of an override is handled separately by the resource patch
 * (see [cleartextStreamingHost]); this function only produces the string that is substituted
 * into the bytecode.
 */
fun resolveStreamingUrl(origin: String, optionValue: String?): String {
    val override = optionValue?.trim().orEmpty()
    if (override.isEmpty()) {
        return deriveStreamingUrl(origin)
    }

    val scheme = try {
        URI(override).scheme?.lowercase()
    } catch (e: URISyntaxException) {
        throw PatchException("The 'streaming' option is not a valid URL: '$override'", e)
    }

    if (scheme !in setOf("ws", "wss", "http", "https")) {
        throw PatchException(
            "The 'streaming' option must be a ws://, wss://, http:// or https:// URL, " +
                "but '$override' uses '${scheme ?: ""}'.",
        )
    }

    if (URI(override).host.isNullOrBlank()) {
        throw PatchException("The 'streaming' option must contain a host name: '$override'")
    }

    return override
}

/** Derives `wss://<origin-host[:port]>/stream` from an already-normalised origin. */
private fun deriveStreamingUrl(origin: String): String =
    "wss://${origin.substringAfter("://")}$STREAMING_PATH"

/**
 * (b) THE CLEARTEXT POLICY POINT.
 *
 * Returns the host that must be added to `network_security_config.xml` when the streaming URL
 * is cleartext, or null when the URL already uses TLS. Both patches agree on this single
 * definition so the bytecode rewrite and the resource exception cannot drift apart.
 */
fun cleartextStreamingHost(streamingUrl: String): String? {
    val uri = try {
        URI(streamingUrl)
    } catch (e: URISyntaxException) {
        throw PatchException("The streaming URL is not valid: '$streamingUrl'", e)
    }

    return when (uri.scheme?.lowercase()) {
        "ws", "http" -> uri.host?.takeIf { it.isNotBlank() }
            ?: throw PatchException("The streaming URL has no host: '$streamingUrl'")

        else -> null
    }
}
