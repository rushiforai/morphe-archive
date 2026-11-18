// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.fiximgur

import app.edbfi.patches.shared.returnEarlyEdit
import app.edbfi.patches.syncforreddit.SYNC_FOR_REDDIT
import app.edbfi.patches.syncforreddit.misc.extension.EXTENSION
import app.edbfi.patches.syncforreddit.misc.extension.extensionSwitch
import app.edbfi.patches.syncforreddit.misc.imageclient.imageClientHookPatch
import app.edbfi.patches.syncforreddit.misc.volley.volleyHookPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.matchSingle

// RedReader's public Imgur client ID. The app's own has no quota left (429).
private const val DEFAULT_CLIENT_ID = "c3713d9e7674477"

@Suppress("unused")
val fixImgurPatch =
    patch(
        name = "Fix Imgur",
        description = "Fixes Imgur albums failing to open, album previews in comments and posts staying blank, and Imgur uploads failing.",
        default = true,
    ) {
        compatibleWith(SYNC_FOR_REDDIT)
        dependsOn(volleyHookPatch, imageClientHookPatch)

        val clientId by stringOption(
            key = "Imgur client ID",
            default = DEFAULT_CLIENT_ID,
            description = "The Imgur API client ID to load albums and upload images with. The default is RedReader's.",
            required = true,
        ) { it?.matches(Regex("[A-Za-z0-9]+")) == true }

        execute {
            imgurRequestFingerprints.forEach { it.matchSingle() }
            // Newer Imgur links put a title before the ID (/a/funny-cat-AbC1234), which the app would cut to "funny".
            val idMethod = ImgurIdFingerprint.matchSingle().method
            if ((idMethod.implementation?.registerCount ?: 0) > 16) throw PatchException("${idMethod.name} has too many registers")
            val setClientId = ClientIdOptionFingerprint.matchSingle().method.returnEarlyEdit(clientId!!)
            val enable = extensionSwitch("Imgur")

            setClientId.apply()
            idMethod.addInstructions(
                0,
                """
                    invoke-static { p0 }, $EXTENSION/Imgur;->withoutTitle(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p0
                """,
            )
            enable.apply()
        }
    }
