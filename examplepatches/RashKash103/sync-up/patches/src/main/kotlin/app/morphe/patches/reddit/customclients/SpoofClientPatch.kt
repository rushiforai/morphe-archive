/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.patches.reddit.customclients

import app.morphe.patcher.patch.BytecodePatchBuilder
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption

/**
 * Base class for patches that spoof the Reddit client.
 *
 * @param block The patch block. It is called with the client ID option and redirect URI option.
 */
fun spoofClientPatch(
    name: String,
    description: String,
    block: BytecodePatchBuilder.(
        clientIdOption: Option<String>,
        redirectUriOption: Option<String>,
        userAgentOption: Option<String>
    ) -> Unit,
) = bytecodePatch(
    name = name,
    description = description,
    default = true
) {
    val clientIdOption = stringOption(
        "client-id",
        null,
        null,
        "OAuth client ID",
        "The Reddit OAuth client ID. Refer to Sync Up documentation for more " +
                "information on what to put here. It can be left empty and set in the app " +
                "afterwards, under Settings > Everything else > Sync Up client; the app " +
                "cannot sign in until one is given in one place or the other.",
        false,
        validator = { value ->
            // Empty is allowed: it can be set in the app instead, which is what lets a copy be
            // built by something that has no client id of its own to give.
            value.isNullOrBlank() || value.matches(Regex("^[\\w-]{22}$"))
        }
    )
    val redirectUriOption = stringOption(
        "redirect-uri",
        "redreader://rr_oauth_redir",
        null,
        "Redirect URI",
        "The Reddit OAuth redirect URI. Refer to Sync Up documentation for more " +
                "information on what to put here. Default value is RedReader's redirect URI. " +
                "It can also be changed in the app, under Settings > Everything else > " +
                "Sync Up client.",
        false,
    )
    val userAgentOption = stringOption(
        "user-agent",
        "org.quantumbadger.redreader/1.25.1",
        null,
        "User agent",
        "The app's user agent. Refer to Sync Up documentation for more information " +
                "on what to put here. Default value is RedReader's user agent. It can also be " +
                "changed in the app, under Settings > Everything else > Sync Up client.",
        false
    )

    block(
        clientIdOption, redirectUriOption, userAgentOption
    )
}

fun spoofClientPatch(
    block: BytecodePatchBuilder.(
        clientIdOption: Option<String>,
        redirectUriOption: Option<String>,
        userAgentOption: Option<String>
    ) -> Unit,
) = spoofClientPatch(
    name = "Spoof client",
    description = "Restores functionality of the app by using custom client ID.",
    block = block,
)
