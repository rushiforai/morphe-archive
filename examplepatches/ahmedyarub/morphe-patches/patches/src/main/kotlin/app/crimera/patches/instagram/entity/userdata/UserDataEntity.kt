/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.entity.userdata

import app.crimera.patches.instagram.entity.decoder.USER_MODEL_CLASS_NAME
import app.crimera.patches.instagram.entity.decoder.decoderEntity
import app.crimera.utils.changeFirstString
import app.crimera.utils.liveTreeGetter
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val STRING = "Ljava/lang/String;"
private const val BOXED_BOOLEAN = "Ljava/lang/Boolean;"

/**
 * Names for the user getters the extension reflects into.
 *
 * piko reads these off a LiveTreeUserDict class that 446 removed, so each one is found by the json
 * key its getter carries instead — the same anchor the media model uses, and the one piko itself
 * already reaches for on the username getter.
 */
val userDataEntity =
    bytecodePatch(
        description = "This patch is used for decoding obfuscated code of the user data",
    ) {
        dependsOn(decoderEntity)
        execute {
            fun getterName(
                jsonKey: String,
                returnType: (String) -> Boolean,
            ) = liveTreeGetter(USER_MODEL_CLASS_NAME, jsonKey, returnType)?.name
                ?: throw PatchException("Could not identify the $jsonKey getter on the user model")

            GetUsernameExtensionFingerprint.changeFirstString(getterName("username") { it == STRING })
            GetFullNameExtensionFingerprint.changeFirstString(getterName("full_name") { it == STRING })
            GetBioExtensionFingerprint.changeFirstString(getterName("biography") { it == STRING })
            IsVerifiedExtensionFingerprint.changeFirstString(getterName("is_verified") { it == BOXED_BOOLEAN })
            GetProfilePictureUrlExtensionFingerprint.changeFirstString(
                getterName("hd_profile_pic_url_info") { it.endsWith("/ProfilePicUrlInfo;") },
            )
            GetLowResProfilePictureExtensionFingerprint.changeFirstString(
                getterName("profile_pic_url") { it.endsWith("/ImageUrl;") },
            )

            // Friendship status is only read by patches this bundle does not ship, and its type was
            // renamed in 446, so an unresolved name here is not worth failing the patch over.
            liveTreeGetter(USER_MODEL_CLASS_NAME, "friendship_status") { it.startsWith("Lcom/instagram/") }
                ?.let { GetUserFriendshipStatusExtensionFingerprint.changeFirstString(it.name) }
        }
    }
