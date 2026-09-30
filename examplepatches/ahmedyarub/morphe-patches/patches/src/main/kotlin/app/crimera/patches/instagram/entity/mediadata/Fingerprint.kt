/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.entity.mediadata

import app.crimera.patches.instagram.entity.decoder.MEDIA_CLASS_NAME
import app.crimera.patches.instagram.entity.decoder.MEDIA_EXT_CLASS
import app.crimera.patches.instagram.entity.decoder.USER_MODEL_CLASS_NAME
import app.crimera.patches.instagram.utils.Constants
import app.crimera.patches.instagram.utils.Constants.EDIT_MEDIA_INFO_FRAGMENT_CLASS
import app.crimera.patches.instagram.utils.Constants.ORIGINAL_SOUND_DATA_INTF
import app.crimera.patches.instagram.utils.Constants.USER_SESSION_CLASS
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal const val AUDIO_SRC_KEY = "audio_src"
internal const val EXTENSION_CLASS_DESCRIPTOR = "${Constants.ENTITY_CLASS}/MediaData;"

internal object GetHelperClassExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getHelperClass",
)

internal object GetMentionSetExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getMentionSet",
)

internal object GetImageVariantsExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getImageVariants",
)

internal object GetVideoVariantsV1ExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getVideoVariantsV1",
)

internal object GetVideoVariantsV2ExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getVideoVariantsV2",
)

internal object IsVideoExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "isVideo",
)

internal object GetMediaListExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getMediaList",
)

internal object GetUserDataWithoutUserSessionExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getUserDataWithoutUserSession",
)

internal object GetUserDataWithUserSessionExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getUserDataWithUserSession",
)

internal object GetMediaPkIdExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getMediaPkId",
)

internal object GetDescriptionTextExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getDescriptionText",
)

internal object GetOriginalSoundDataIntfExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getOriginalSoundDataIntf",
)

internal object GetTrackDataIntfExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getTrackDataIntf",
)

internal object GetMessageAudioUrlExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getMessageAudioUrl",
)

internal object GetMoreExtendedDataExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getMoreExtendedData",
)

/**
 * The field read, not the comparison. piko points this at getPostType, whose first string is the
 * literal "clips" the result is then compared against — so the field name overwrote it and no post
 * ever matched, which is the "for some reason clips are not recognised" TODO in the extension.
 */
internal object GetPostTypeExtensionFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getPostTypeKey",
)

internal object InstagramMainActivityNotificationRelatedFingerprint : Fingerprint(
    definingClass = "/InstagramMainActivity;",
    strings = listOf("nme_ig_post_post_creation_notif", "nme_ig_post_story_creation_notif"),
)

/**
 * The mapper that turns an image info object back into its json form, and so names every getter
 * on it next to the key it belongs to.
 */
/**
 * XDTImageCandidate is deliberately not required: R8 keeps that literal in the mapper on some
 * builds and hoists it into ExtendedImageUrl on others, so requiring it matched the APKMirror
 * bundle but not the build Play delivers. The remaining three keys plus the Map return type
 * identify the mapper uniquely on both.
 */
internal object ImageInfoMapperFingerprint : Fingerprint(
    returnType = "Ljava/util/Map;",
    strings = listOf("additional_candidates", "candidates", "scrubber_spritesheet_info_candidates"),
)

internal object AslSessionRelatedFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("asl_session_id", "is_video", "is_carousel"),
)

internal object EditMediaInfoFragmentMediaSizeFingerprint : Fingerprint(
    parameters = listOf(EDIT_MEDIA_INFO_FRAGMENT_CLASS),
    returnType = "F",
    definingClass = EDIT_MEDIA_INFO_FRAGMENT_CLASS,
)

internal object FanClubContentPreviewInteractorImplFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/fanclub/preview/impl/FanClubContentPreviewInteractorImpl;",
    strings = listOf("subscription_exclusive_content_public_preview_select", "creator_igid"),
)

internal object AudioIntfMapperFingerprint : Fingerprint(
    returnType = "Ljava/util/Map;",
    strings = listOf(AUDIO_SRC_KEY, "audio_src_expiration_timestamp_us", "codec", "duration", "fallback", "file_format"),
)

// Static: the instance mapper beside it writes the same keys from the same fields.
internal object ProductInfoMapperFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    strings =
        listOf(
            "product_suggestions",
            "product_tags",
            "product_type",
        ),
    returnType = "Ljava/util/Map;",
)

// The media class is compared when matching: decoderEntity only resolves it at patch time.
internal object GetOriginalSoundDataIntfFromMediaFingerprint : Fingerprint(
    definingClass = MEDIA_EXT_CLASS,
    returnType = ORIGINAL_SOUND_DATA_INTF,
    custom = { method, _ -> method.parameterTypes.singleOrNull()?.toString() == MEDIA_CLASS_NAME },
)

// The media and user classes are compared when matching: decoderEntity only resolves them at patch time.
internal object GetUserDataFromMediaFingerprint : Fingerprint(
    definingClass = MEDIA_EXT_CLASS,
    custom = { method, _ ->
        method.returnType == USER_MODEL_CLASS_NAME &&
            method.parameterTypes.map { it.toString() } == listOf(USER_SESSION_CLASS, MEDIA_CLASS_NAME)
    },
)

internal object CommentToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("Comment{mCreatedAtSeconds=%d, mUser=@%s, mText=\'%s\'}"),
)
