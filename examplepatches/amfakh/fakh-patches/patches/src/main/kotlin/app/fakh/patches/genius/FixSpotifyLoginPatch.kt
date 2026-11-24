/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.genius

import app.fakh.patches.genius.shared.Constants.COMPATIBILITY_GENIUS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private object SpotifyAuthStartFingerprint : Fingerprint(
    definingClass = "Lcom/spotify/sdk/android/auth/app/SpotifyAuthHandler;",
    name = "start",
    returnType = "Z",
    parameters = listOf("Landroid/app/Activity;", "Lcom/spotify/sdk/android/auth/AuthorizationRequest;"),
)

@Suppress("unused")
val fixSpotifyLoginPatch = patch(
    name = "Fix Spotify login",
    description = "Makes Spotify login work in the patched app by signing in on Spotify's web page instead of the Spotify app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GENIUS)
    category("Feature")
    extendWith("extensions/extension.mpe")

    execute {
        SpotifyAuthStartFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual { p2 }, Lcom/spotify/sdk/android/auth/AuthorizationRequest;->toUri()Landroid/net/Uri;
                move-result-object v0
                invoke-virtual { v0 }, Landroid/net/Uri;->toString()Ljava/lang/String;
                move-result-object v0
                invoke-virtual { p2 }, Lcom/spotify/sdk/android/auth/AuthorizationRequest;->getRedirectUri()Ljava/lang/String;
                move-result-object v1
                invoke-static { p1, v0, v1 }, Lapp/fakh/extension/genius/SpotifyWebLogin;->open(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
