/*
 * Original work for this bundle, added with the Trakt 3.28.0 port.
 */

package dev.hyzor.patches.trakt.auth

import app.morphe.patcher.Fingerprint
import dev.hyzor.patches.trakt.shared.Constants.AUTH_HELPER
import dev.hyzor.patches.trakt.shared.Constants.AUTH_REDIRECT_FLAG

/**
 * `jr8.v(Object)` — the coroutine that builds the Trakt OAuth URL and launches the browser.
 *
 * The method is an R8-obfuscated state machine, so it is matched by the unique
 * `mobile_https_auth_callback_enabled_2` Remote Config key it reads. When that flag is on it
 * uses `https://app.trakt.tv/callback/app/trakt`; when off it falls back to the retired
 * `trakt://auth` redirect that `auth.trakt.tv` now rejects. The `Object` return type keeps the
 * anchor on the state machine instead of a config-key constant table or an accessor.
 */
object HttpsAuthCallbackFingerprint : Fingerprint(
    // A suspend state machine's invokeSuspend always returns Object, so this keeps the string
    // anchor from matching a config-key constant table or a boolean accessor.
    returnType = "Ljava/lang/Object;",
    strings = listOf(AUTH_REDIRECT_FLAG),
)

/**
 * `s2j.b(MainActivity, String)Z` — whether the browser package supports AndroidX AuthTab.
 *
 * AuthTab hands the OAuth result straight back to the app, but only after Chrome verifies the
 * app's signing certificate against `https://app.trakt.tv/.well-known/assetlinks.json`. A
 * Morphe-signed build cannot match Trakt's certificate, so this path always dead-ends. The
 * patch makes the check answer `false`, which sends the auth flow down its regular Custom Tab
 * branch; Chrome then delivers the HTTPS callback through the app-link filter that
 * `MainActivity` already declares.
 */
object AuthTabSupportFingerprint : Fingerprint(
    definingClass = AUTH_HELPER,
    name = "b",
    returnType = "Z",
    parameters = listOf(
        "Ltv/trakt/trakt/MainActivity;",
        "Ljava/lang/String;",
    ),
)
