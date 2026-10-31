// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.api

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.all.misc.string.replaceStringPatch
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val REDREADER_CLIENT_ID = "yH0aTnJEt6qUgGn835B4vg"
private const val REDREADER_REDIRECT_URI = "redreader://rr_oauth_redir"
private const val REDREADER_USER_AGENT = "org.quantumbadger.redreader/1.25.1"

// Reddit stopped accepting BaconReader's OAuth client when BaconReader shut down in 2023, so
// logging in and loading anything fails. Another app's client still works, as long as the redirect
// URI and user agent match what Reddit has on record for it. RedReader's is the default.
@Suppress("unused")
val spoofClientPatch = bytecodePatch(
    name = "Spoof client",
    description = "Makes logging in to Reddit work again by using another Reddit app's client ID.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(
        // Reddit's redirects from ssl.reddit.com to www.reddit.com break logging in.
        replaceStringPatch("ssl.reddit.com", "www.reddit.com", comparison = StringComparisonType.CONTAINS),
    )

    val clientIdOption = stringOption(
        key = "clientId",
        default = REDREADER_CLIENT_ID,
        title = "Application client ID",
        description = "The client ID of an \"Installed app\" from https://www.reddit.com/prefs/apps.",
        required = true,
    )

    val redirectUriOption = stringOption(
        key = "redirectUri",
        default = REDREADER_REDIRECT_URI,
        title = "Application redirect URI",
        description = "The redirect URI of that Reddit app. Empty keeps BaconReader's own, $ORIGINAL_REDIRECT_URI.",
    )

    val userAgentOption = stringOption(
        key = "userAgent",
        default = REDREADER_USER_AGENT,
        title = "Application user agent",
        description = "The user agent of that Reddit app, ideally. Empty keeps BaconReader's own.",
    )

    execute {
        val clientId = clientIdOption.value!!
        val redirectUri = redirectUriOption.value?.takeIf { it.isNotBlank() }
        val userAgent = userAgentOption.value?.takeIf { it.isNotBlank() }

        /**
         * Replaces [from] with [to] in every string constant of the fingerprinted method.
         */
        fun Fingerprint.replaceInStrings(from: String, to: String) {
            val indices = method.instructions.withIndex().filter { (_, instruction) ->
                (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
                    instruction.getReference<StringReference>()?.string?.contains(from) == true
            }.map { it.index }

            if (indices.isEmpty()) throw PatchException("'$from' not found in ${method.name}")

            indices.forEach { index ->
                val register = method.getInstruction<OneRegisterInstruction>(index).registerA
                val string = method.getInstruction(index).getReference<StringReference>()!!.string
                method.replaceInstruction(index, "const-string v$register, \"${string.replace(from, to)}\"")
            }
        }

        GetAuthorizationUrlFingerprint.replaceInStrings("client_id=$ORIGINAL_CLIENT_ID", "client_id=$clientId")
        RequestTokenFingerprint.replaceInStrings(ORIGINAL_CLIENT_ID, clientId)

        if (redirectUri != null) {
            GetAuthorizationUrlFingerprint.replaceInStrings(
                "redirect_uri=$ORIGINAL_REDIRECT_URI",
                "redirect_uri=$redirectUri",
            )
            IsRedirectUrlFingerprint.replaceInStrings(ORIGINAL_REDIRECT_URI, redirectUri)
            CodeExchangeFingerprint.replaceInStrings(ORIGINAL_REDIRECT_URI, redirectUri)
        }

        if (userAgent != null) {
            RestClientUserAgentFingerprint.method.returnEarly(userAgent)
            RetrofitUserAgentFingerprint.method.returnEarly(userAgent)
        }
    }
}
