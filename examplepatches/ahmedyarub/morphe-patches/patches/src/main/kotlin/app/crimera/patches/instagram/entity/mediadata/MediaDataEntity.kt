/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.entity.mediadata

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
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.library.instagram.patches.instagramExtensionPatch

val mediaDataEntity =
    bytecodePatch(
        description = "This patch is used for decoding obfuscated code of the media data",
    ) {
        dependsOn(instagramExtensionPatch)
        dependsOn(decoderEntity)
        execute {
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

            // Extraction of the carousel media list getter.
            EditMediaInfoFragmentMediaSizeFingerprint.method.apply {
                val listInvokeIndex =
                    instructions.indexOfFirst {
                        it.opcode == Opcode.INVOKE_VIRTUAL && it.methodExtractor().returnType == "java.util.List"
                    }
                if (listInvokeIndex < 0) throw PatchException("Could not resolve the media list method")

                GetMediaListExtensionFingerprint.changeFirstString(getInstruction(listInvokeIndex).methodExtractor().name)
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
                classDefBy(MEDIAEXT_CLASS_NAME)
                    .methods
                    .first {
                        it.returnType ==
                            commentObjectClassName
                    }.name
            GetDescriptionTextExtensionFingerprint.changeFirstString(getCommentDataFromMediaMethodName)

            // Extraction of trackInfo: the media helper method that builds a container from a MusicInfo.
            val trackContainerBuilderName =
                classDefBy(MEDIAEXT_CLASS_NAME)
                    .methods
                    .firstOrNull { method ->
                        method.implementation?.instructions?.any {
                            it.opcode == Opcode.INVOKE_DIRECT &&
                                it.getReference<MethodReference>()?.let { ref ->
                                    ref.name == "<init>" &&
                                        ref.parameterTypes.singleOrNull()?.toString() == MUSIC_INFO_CLASS
                                } == true
                        } == true
                    }?.name ?: throw PatchException("Could not identify the track data builder")
            GetTrackDataIntfExtensionFingerprint.changeFirstString(trackContainerBuilderName)

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
                classDefBy(MEDIA_CLASS_NAME)
                    .methods
                    .singleOrNull {
                        it.parameters.isEmpty() && classNameToExtension(it.returnType) == audioIntfClass
                    }?.name ?: throw PatchException("Could not identify the message audio getter")
            GetMessageAudioUrlExtensionFingerprint.changeFirstString(messageAudioMethodName)

            // More extended data: the model decodes lazily and caches each value on a separate
            // holder object, so the extension hops through the model field that points at it.
            val cacheField =
                videoVariantsGetter.cacheFieldOrNull()?.takeIf { it.definingClass != MEDIA_CLASS_NAME }
                    ?: throw PatchException("Could not identify the video variants cache field")

            val moreExtendedMediaDataFieldName =
                classDefBy(MEDIA_CLASS_NAME)
                    .fields
                    .singleOrNull { it.type == cacheField.definingClass }
                    ?.name ?: throw PatchException("Could not identify the media cache holder field")
            GetMoreExtendedDataExtensionFingerprint.changeFirstString(moreExtendedMediaDataFieldName)
            GetVideoVariantsV2ExtensionFingerprint.changeFirstString(cacheField.name)

            val imageVariantsCacheField =
                mediaModelGetter("image_versions2") { it.endsWith("/ImageInfo;") }
                    ?.cacheFieldOrNull()
                    ?: throw PatchException("Could not identify the image variants cache field")
            GetImageVariantsExtensionFingerprint.changeFirstString(imageVariantsCacheField.name)

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
