/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.entity.mediadata

import app.crimera.patches.instagram.entity.decoder.EditMediaInfoGetCurrentMediaIdFingerprint
import app.crimera.patches.instagram.entity.decoder.MEDIA_CLASS_NAME
import app.crimera.patches.instagram.entity.decoder.MEDIAEXT_CLASS_NAME
import app.crimera.patches.instagram.entity.decoder.USER_MODEL_CLASS_NAME
import app.crimera.patches.instagram.entity.decoder.decoderEntity
import app.crimera.patches.instagram.utils.Constants.MUSIC_INFO_CLASS
import app.crimera.utils.changeFirstString
import app.crimera.utils.cacheFieldOrNull
import app.crimera.utils.changeStringAt
import app.crimera.utils.classNameToExtension
import app.crimera.utils.fieldExtractor
import app.crimera.utils.methodExtractor
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import kotlin.math.abs

// How far from a json key the field holding its value can sit in the mapper.
private const val FIELD_SEARCH_WINDOW = 8

val mediaDataEntity =
    bytecodePatch(
        description = "This patch is used for decoding obfuscated code of the media data",
    ) {
        dependsOn(decoderEntity)
        execute {
            // Pin the getter class before any fingerprint resolves.
            mediaModelClass =
                if (classDefByOrNull(LIVE_TREE_MEDIA_DICT_CLASS) != null) LIVE_TREE_MEDIA_DICT_CLASS else MEDIA_CLASS_NAME

            GetHelperClassExtensionFingerprint.changeFirstString(classNameToExtension(MEDIAEXT_CLASS_NAME))

            // Extracting get original sound info data using media and user session.
            GetOriginalSoundDataIntfExtensionFingerprint.changeFirstString(GetOriginalSoundDataIntfFromMediaFingerprint.method.name)

            // Extracting get user data using media and user session.
            GetUserDataWithUserSessionExtensionFingerprint.changeFirstString(GetUserDataFromMediaFingerprint.method.name)

            // Extracting image variants list.
            //
            // The image info object exposes two lists — the image candidates and the spins
            // underlying media candidates — and piko picks whichever the last invoke-interface in
            // an unrelated helper happens to name, which on 446 is neither. The mapper that writes
            // this object back to json names each getter beside its own key, so the candidates
            // getter is the last list-returning call before the "candidates" key is put.
            ImageInfoMapperFingerprint.method.apply {
                val candidatesStringIndex =
                    instructions.indexOfFirst { instruction ->
                        (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
                            instruction.getReference<StringReference>()?.string == "candidates"
                    }
                if (candidatesStringIndex < 0) throw PatchException("The image info mapper has no candidates key")

                val candidatesGetter =
                    instructions
                        .take(candidatesStringIndex)
                        .lastOrNull { instruction ->
                            instruction.opcode == Opcode.INVOKE_INTERFACE &&
                                instruction.getReference<MethodReference>()?.returnType == "Ljava/util/List;"
                        } ?: throw PatchException("Could not identify the image candidates getter")
                GetImageVariantsExtensionFingerprint.changeStringAt(1, candidatesGetter.methodExtractor().name)
            }

            // Extracting the get mention set method used media helper class.
            val reelMentionsGetter =
                mediaModelGetter("reel_mentions", "Ljava/util/List;")
                    ?: LiveTreeMediaDictReelsMentionFingerprint.matchOrNull()?.method
                    ?: throw PatchException("Could not identify the reel mentions getter")
            GetMentionSetExtensionFingerprint.changeFirstString(reelMentionsGetter.name)

            InstagramMainActivityNotificationRelatedFingerprint.apply {
                val strIndex = stringMatches.last().index
                method.apply {
                    val getUserDataInvokeIndex =
                        instructions.indexOfLast {
                            it.opcode == Opcode.INVOKE_INTERFACE &&
                                it.location.index < strIndex
                        }
                    val methodName = getInstruction(getUserDataInvokeIndex).methodExtractor().name
                    GetMentionSetExtensionFingerprint.changeStringAt(1, methodName)
                }
            }

            // Extracting get video variants.
            val videoVariantsGetter =
                mediaModelGetter("video_versions", "Ljava/util/List;")
                    ?: throw PatchException("Could not identify the video variants getter")
            GetVideoVariantsV1ExtensionFingerprint.changeFirstString(videoVariantsGetter.name)

            // Extracting method is video used in media class.
            AslSessionRelatedFingerprint.method.apply {
                val stringIndex = AslSessionRelatedFingerprint.stringMatches[1].index
                val isVideoVirtualInvokeIndex = indexOfFirstInstruction(stringIndex, Opcode.INVOKE_VIRTUAL)
                val isVideoCallingMethodName = getInstruction(isVideoVirtualInvokeIndex).methodExtractor().name
                IsVideoExtensionFingerprint.changeFirstString(isVideoCallingMethodName)
            }

            // Extraction of the media list, and of the extended data field it hangs off when present.
            fun Method.resolveMediaList(): Boolean {
                val listInvokeIndex =
                    instructions.indexOfFirst {
                        it.opcode == Opcode.INVOKE_VIRTUAL && it.methodExtractor().returnType == "java.util.List"
                    }
                if (listInvokeIndex < 0) return false

                GetMediaListExtensionFingerprint.changeFirstString(getInstruction(listInvokeIndex).methodExtractor().name)

                val fieldReadIndex = listInvokeIndex - 1
                if (fieldReadIndex >= 0 && getInstruction(fieldReadIndex).opcode == Opcode.IGET_OBJECT) {
                    GetExtendedDataExtensionFingerprint.changeFirstString(getInstruction(fieldReadIndex).fieldExtractor().name)
                }
                return true
            }

            var foundMediaListMethod = EditMediaInfoFragmentMediaSizeFingerprint.method.resolveMediaList()

            // Backup for media list extraction if the first fingerprint fails.
            if (!foundMediaListMethod) {
                foundMediaListMethod =
                    GetAndroidLinkFromMediaObject.matchOrNull()?.method?.resolveMediaList() == true
            }
            if (!foundMediaListMethod) {
                throw PatchException("Could not resolve the media list method")
            }

            // Extraction of media pkid from media class.
            FanClubContentPreviewInteractorImplFingerprint.method.apply {
                val strIndex = FanClubContentPreviewInteractorImplFingerprint.stringMatches[1].index

                val mediaPkIdMethodName = instructions[indexOfFirstInstruction(strIndex, Opcode.INVOKE_VIRTUAL)].methodExtractor().name
                GetMediaPkIdExtensionFingerprint.changeFirstString(mediaPkIdMethodName)
            }

            // Extraction of user data used in extended media class.
            val userGetter =
                mediaModelGetter("user", USER_MODEL_CLASS_NAME)
                    ?: LiveTreeMediaDictGetUserFingerprint.matchOrNull()?.method
                    ?: throw PatchException("Could not identify the media user getter")
            GetUserDataWithoutUserSessionExtensionFingerprint.changeFirstString(userGetter.name)

            // Extraction of description
            val commentObjectClassName: String
            CommentToStringFingerprint.apply {
                commentObjectClassName = classDef.type
                method.apply {
                    val getCommentTextFieldName = instructions.last { it.opcode == Opcode.IGET_OBJECT }.fieldExtractor().name
                    GetDescriptionTextExtensionFingerprint.changeStringAt(1, getCommentTextFieldName)
                }
            }

            val getCommentDataFromMediaMethodName =
                mutableClassDefBy { it.type == MEDIAEXT_CLASS_NAME }
                    .methods
                    .first {
                        it.returnType ==
                            commentObjectClassName
                    }.name
            GetDescriptionTextExtensionFingerprint.changeFirstString(getCommentDataFromMediaMethodName)

            // Extraction of trackInfo: the media helper method that builds a container from a MusicInfo.
            val trackContainerBuilderName =
                mutableClassDefBy { it.type == MEDIAEXT_CLASS_NAME }
                    .methods
                    .firstOrNull { method ->
                        method.implementation?.instructions?.any {
                            it.opcode == Opcode.INVOKE_DIRECT &&
                                it.getReference<MethodReference>()?.let { ref ->
                                    ref.name == "<init>" &&
                                        ref.parameterTypes.singleOrNull()?.toString() == MUSIC_INFO_CLASS
                                } == true
                        } == true
                    }?.name

            if (trackContainerBuilderName != null) {
                GetTrackDataIntfExtensionFingerprint.changeFirstString(trackContainerBuilderName)
            }

            // Message audio (voice notes): media -> audio interface -> url. The interface is taken
            // from the "audio_src" getter, since its name changes between builds.
            val audioIntfClass =
                AudioIntfMapperFingerprint.run {
                    val strIndex = stringMatches.first { it.string == AUDIO_SRC_KEY }.index
                    val urlGetter =
                        method
                            .getInstruction(method.indexOfFirstInstruction(strIndex, Opcode.INVOKE_INTERFACE))
                            .methodExtractor()
                    GetMessageAudioUrlExtensionFingerprint.changeStringAt(1, urlGetter.name)
                    urlGetter.definingClass
                }

            val messageAudioMethodName =
                mutableClassDefBy { it.type == mediaModelClass }
                    .methods
                    .singleOrNull {
                        it.parameters.isEmpty() && classNameToExtension(it.returnType) == audioIntfClass
                    }?.name
            messageAudioMethodName?.let { GetMessageAudioUrlExtensionFingerprint.changeFirstString(it) }

            // More extended data: since v446 the model decodes lazily and caches each value on a
            // separate holder object, so the extension has to hop through the model field that
            // points at that holder. Older builds cached in place, where the holder is instead the
            // dict the json mapper writes to.
            val cacheField = videoVariantsGetter.cacheFieldOrNull()?.takeIf { it.definingClass != mediaModelClass }

            val moreExtendedMediaDataFieldName =
                if (cacheField != null) {
                    mutableClassDefBy { it.type == mediaModelClass }
                        .fields
                        .singleOrNull { it.type == cacheField.definingClass }
                        ?.name
                } else {
                    ExtMediaDictVideoInfoMapperFingerprint.matchOrNull()?.let { mapper ->
                        LiveTreeMediaDictReelsMentionFingerprint
                            .matchOrNull()
                            ?.classDef
                            ?.fields
                            ?.firstOrNull { it.type == mapper.classDef.type }
                            ?.name
                    }
                }
            moreExtendedMediaDataFieldName?.let { GetMoreExtendedDataExtensionFingerprint.changeFirstString(it) }

            if (cacheField != null) {
                GetVideoVariantsV2ExtensionFingerprint.changeFirstString(cacheField.name)

                mediaModelGetter("image_versions2") { it.endsWith("/ImageInfo;") }
                    ?.cacheFieldOrNull()
                    ?.let { GetImageVariantsExtensionFingerprint.changeFirstString(it.name) }
            } else {
                // Match by field type near the key, not a fixed offset — the read can sit on either
                // side of it, and for video_versions it is in the model's getter, not the mapper.
                mutableClassDefBy { it.type == mediaModelClass }
                    .methods
                    .firstNotNullOfOrNull { m ->
                        m.fieldNameNearString("video_versions") { type -> type == "Ljava/util/List;" }
                    }?.let { GetVideoVariantsV2ExtensionFingerprint.changeFirstString(it) }

                ExtMediaDictImageInfoMapperFingerprint
                    .matchOrNull()
                    ?.method
                    ?.fieldNameNearString("image_versions2") { it.endsWith("/ImageInfo;") }
                    ?.let { GetImageVariantsExtensionFingerprint.changeFirstString(it) }
            }

            ProductInfoMapperFingerprint.apply {
                val strIndex = stringMatches.last().index
                method.apply {
                    val productTypeIGetObjectInstruction = getInstruction(indexOfFirstInstruction(strIndex, Opcode.IGET_OBJECT))
                    val productTypeFieldName = productTypeIGetObjectInstruction.fieldExtractor().name
                    GetPostTypeExtensionFingerprint.changeFirstString(productTypeFieldName)
                }
            }

            // End.
        }
    }

/**
 * Name of the field read closest to where [value] is loaded, restricted to fields whose type
 * satisfies [matchesType]. Returns null when the string or a matching field read is absent.
 */
private fun Method.fieldNameNearString(
    value: String,
    matchesType: (String) -> Boolean,
): String? {
    val stringIndex =
        instructions.indexOfFirst {
            (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
                it.getReference<StringReference>()?.string == value
        }
    if (stringIndex < 0) return null

    return instructions
        .withIndex()
        .filter { (index, instruction) ->
            instruction.opcode == Opcode.IGET_OBJECT && abs(index - stringIndex) <= FIELD_SEARCH_WINDOW
        }.sortedBy { (index, _) -> abs(index - stringIndex) }
        .firstNotNullOfOrNull { (_, instruction) ->
            instruction.getReference<FieldReference>()?.takeIf { matchesType(it.type) }?.name
        }
}
