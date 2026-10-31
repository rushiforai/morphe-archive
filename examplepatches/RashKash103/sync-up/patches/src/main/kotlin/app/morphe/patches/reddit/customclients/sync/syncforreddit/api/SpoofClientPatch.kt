/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.patches.reddit.customclients.sync.syncforreddit.api

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patches.all.misc.string.replaceStringPatch
import app.morphe.patches.reddit.customclients.spoofClientPatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.detection.piracy.disablePiracyDetectionPatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.Base64

/**
 * What Sync identifies itself to Imgur as when uploading a picture. Its own is shared by every
 * copy of the app and has spent its daily allowance — Imgur answers an upload with it
 * `x-ratelimit-clientremaining: 0` — so uploading works only with one of your own.
 */
private const val SYNCS_OWN_IMGUR_CLIENT_ID = "981c2f80e996ca3"

/** What Imgur issues: an even number of hex digits, and not many of them. */
private val LOOKS_LIKE_A_CLIENT_ID = Regex("^[0-9a-fA-F]{15,16}$")

/** How the Client-ID is written in the header Sync sends. */
private const val CLIENT_ID_HEADER = "Client-ID "

val spoofClientPatch = spoofClientPatch { clientId, redirectUri, userAgent ->
    val imgurClientId = stringOption(
        "imgur-client-id",
        SYNCS_OWN_IMGUR_CLIENT_ID,
        null,
        "Imgur client ID",
        "What to identify as when uploading a picture to Imgur. Sync's own has run out of its " +
                "daily allowance, so uploading fails until this is one of your own; refer to Sync " +
                "Up documentation for how to get one.",
        false,
        validator = { value -> value != null && LOOKS_LIKE_A_CLIENT_ID.matches(value) }
    )

    dependsOn(
        disablePiracyDetectionPatch,
        // Redirects from SSL to WWW domain are bugged causing auth problems.
        // Manually rewrite the URLs to fix this.
        replaceStringPatch("ssl.reddit.com", "www.reddit.com", comparison = StringComparisonType.CONTAINS)
    )

    compatibleWith(*SyncForRedditCompatible)

    execute {
        // region Patch client id.
        getBearerTokenFingerprint.method.apply {
            val auth = Base64.getEncoder().encodeToString("$clientId:".toByteArray(Charsets.UTF_8))
            returnEarly("Basic $auth")

            val occurrenceIndex =
                getAuthorizationStringFingerprint.stringMatches.first().index

            getAuthorizationStringFingerprint.method.apply {
                val authorizationStringInstruction = getInstruction<ReferenceInstruction>(occurrenceIndex)
                val targetRegister = (authorizationStringInstruction as OneRegisterInstruction).registerA
                val reference = authorizationStringInstruction.reference as StringReference

                val newAuthorizationUrl = reference.string.replace(
                    "client_id=.*?&".toRegex(),
                    "client_id=$clientId&",
                )

                replaceInstruction(
                    occurrenceIndex,
                    "const-string v$targetRegister, \"$newAuthorizationUrl\"",
                )
            }
        }
        // endregion

        // region Patch redirect URI.
        getRedirectUriFingerprint.method.returnEarly(redirectUri.value!!)
        // endregion

        // region Patch user agent.
        getUserAgentFingerprint.method.returnEarly(userAgent.value!!)
        // endregion

        // region Patch Imgur API URL.

        imgurImageAPIFingerprint.let {
            val apiUrlIndex = it.stringMatches.first().index
            it.method.replaceInstruction(
                apiUrlIndex,
                "const-string v1, \"https://api.imgur.com/3/image\"",
            )
        }

        // endregion

        // region Patch the Imgur client id.

        // Sending the upload to Imgur rather than to the proxy above only gets as far as the
        // Client-ID it is sent with, and Sync's is spent.
        imgurUploadHeadersFingerprint.method.apply {
            val at = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                        it.getReference<StringReference>()?.string?.startsWith(CLIENT_ID_HEADER) == true
            }
            if (at < 0) {
                throw PatchException("The Imgur upload does not name a client id")
            }

            val register = getInstruction<OneRegisterInstruction>(at).registerA
            replaceInstruction(
                at,
                "const-string v$register, \"$CLIENT_ID_HEADER${imgurClientId.value}\"",
            )
        }

        // endregion
    }
}
