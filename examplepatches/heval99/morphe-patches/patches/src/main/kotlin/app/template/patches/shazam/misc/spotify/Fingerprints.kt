package app.template.patches.shazam.misc.spotify

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

internal const val SPOTIFY_AUTH_PACKAGE = "Lcom/spotify/sdk/android/auth"
internal const val AUTHORIZATION_REQUEST = "$SPOTIFY_AUTH_PACKAGE/AuthorizationRequest;"
internal const val AUTHORIZATION_RESPONSE = "$SPOTIFY_AUTH_PACKAGE/AuthorizationResponse;"
internal const val ON_COMPLETE_LISTENER = "$SPOTIFY_AUTH_PACKAGE/AuthorizationHandler\$OnCompleteListener;"
internal const val WEBVIEW_AUTH_HANDLER = "$SPOTIFY_AUTH_PACKAGE/webview/WebViewAuthHandler;"

// Spotify Auth SDK 1.2.3 is bundled un-renamed (public library API). startAuthActivity()
// sends the request to the installed Spotify app (com.spotify.sso.action.START_AUTH_FLOW);
// the intent extras it fills in are inlined as const-strings in this method.
object SpotifyNativeStartAuthActivityFingerprint : Fingerprint(
    definingClass = "$SPOTIFY_AUTH_PACKAGE/app/SpotifyNativeAuthUtil;",
    name = "startAuthActivity",
    returnType = "Z",
    parameters = listOf(),
    strings = listOf(
        string("CLIENT_ID", StringComparisonType.CONTAINS),
        string("REDIRECT_URI", StringComparisonType.CONTAINS),
    ),
)

// The SDK's fallback handler: shows LoginDialog (the WebView login) and returns true.
object WebViewAuthHandlerStartFingerprint : Fingerprint(
    definingClass = WEBVIEW_AUTH_HANDLER,
    name = "start",
    returnType = "Z",
    parameters = listOf("Landroid/app/Activity;", AUTHORIZATION_REQUEST),
)

// Used by the extension through reflection (the full accounts.spotify.com/authorize URL).
object AuthorizationRequestToUriFingerprint : Fingerprint(
    definingClass = AUTHORIZATION_REQUEST,
    name = "toUri",
    returnType = "Landroid/net/Uri;",
    parameters = listOf(),
)

// Used by the extension through reflection: parses the redirect (?code= / ?error= / #token).
object AuthorizationResponseFromUriFingerprint : Fingerprint(
    definingClass = AUTHORIZATION_RESPONSE,
    name = "fromUri",
    returnType = AUTHORIZATION_RESPONSE,
    parameters = listOf("Landroid/net/Uri;"),
)
