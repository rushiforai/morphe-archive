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
import app.crimera.patches.instagram.utils.Constants.TRACK_DATA_CLASS
import app.crimera.utils.changeFirstString
import app.crimera.utils.cacheFieldOrNull
import app.crimera.utils.changeStringAt
import app.crimera.utils.classNameToExtension
import app.crimera.utils.fieldExtractor
import app.crimera.utils.liveTreeGetter
import app.crimera.utils.methodExtractor
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.Fingerprint
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

            // Extracting method is video used in media class: the boolean a media logger computes
            // right before it logs "is_video" (piko's anchor). Up to 452 that is the media getter
            // itself; from 453 the logger calls the getter's static helper inline, and the getter is
            // the one media method that calls that helper.
            val isVideoCall = MediaIsVideoLoggerFingerprint.method.instructions.toList().let { instructions ->
                val label = instructions.indexOfFirst { it.getReference<StringReference>()?.string == "is_video" }
                instructions.take(label).lastOrNull { instruction ->
                    instruction.opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_STATIC) &&
                        instruction.getReference<MethodReference>()?.returnType == "Z"
                }?.getReference<MethodReference>()
            } ?: throw PatchException("The media logger computes no boolean before is_video")
            val isVideoGetter =
                if (isVideoCall.definingClass == MEDIA_CLASS_NAME) {
                    isVideoCall.name
                } else {
                    classDefBy(MEDIA_CLASS_NAME).methods.singleOrNull { getter ->
                        getter.returnType == "Z" && getter.parameterTypes.isEmpty() &&
                            getter.implementation?.instructions?.any { it.getReference<MethodReference>() == isVideoCall } == true
                    }?.name ?: throw PatchException("Could not identify the media is video getter")
                }
            IsVideoExtensionFingerprint.changeFirstString(isVideoGetter)

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

            // Extraction of description: the media's "caption" tree and that tree's "text". piko went
            // through a comment class found by its toString and a media helper returning it; 453
            // dropped both, while the caption's json keys hold.
            val captionGetter =
                mediaModelGetter("caption") { it.startsWith("L") && it != "Ljava/lang/String;" }
                    ?: throw PatchException("Could not identify the media caption getter")
            // The caption type is an interface; the getters reading its json keys are on the classes
            // implementing it, under the interface's method names.
            val captionTypes = mutableListOf(captionGetter.returnType)
            classDefForEach { classDef -> if (captionGetter.returnType in classDef.interfaces) captionTypes += classDef.type }
            val captionTextGetter =
                captionTypes.firstNotNullOfOrNull { type -> liveTreeGetter(type, "text") { it == "Ljava/lang/String;" } }
                    ?: throw PatchException("Could not identify the caption text getter")
            GetDescriptionTextExtensionFingerprint.changeFirstString(captionGetter.name)
            GetDescriptionTextExtensionFingerprint.changeStringAt(1, captionTextGetter.name)

            // Extraction of trackInfo. Up to 451 a media helper built a container from the MusicInfo
            // of either of the media's two music models; 452 dropped it. The extension follows the
            // models itself: each is a media getter whose type has a MusicInfo getter. All names are
            // taken by type, since the extension's old hard-coded ones were already stale on 451.
            val musicModels =
                classDefBy(MEDIA_CLASS_NAME).methods.filter { it.parameterTypes.isEmpty() }.mapNotNull { modelGetter ->
                    classDefByOrNull(modelGetter.returnType)?.methods
                        ?.singleOrNull { it.parameterTypes.isEmpty() && it.returnType == MUSIC_INFO_CLASS }
                        ?.let { musicInfoGetter -> modelGetter.name to musicInfoGetter.name }
                }
            if (musicModels.size != 2) throw PatchException("Expected two media music models, found ${musicModels.size}")
            musicModels.forEachIndexed { model, (modelGetter, musicInfoGetter) ->
                GetTrackDataIntfExtensionFingerprint.changeStringAt(2 * model, modelGetter)
                GetTrackDataIntfExtensionFingerprint.changeStringAt(2 * model + 1, musicInfoGetter)
            }

            val trackDataGetter = classDefBy(MUSIC_INFO_CLASS).methods
                .singleOrNull { it.parameterTypes.isEmpty() && it.returnType == TRACK_DATA_CLASS }
                ?: throw PatchException("Could not identify the music info's track data getter")
            GetTrackDataExtensionFingerprint.changeFirstString(trackDataGetter.name)

            val trackMapGetter = classDefBy(TRACK_DATA_CLASS).interfaces.mapNotNull { classDefByOrNull(it) }
                .flatMap { it.methods }
                .singleOrNull { it.parameterTypes.isEmpty() && it.returnType == "Ljava/util/Map;" }
                ?: throw PatchException("Could not identify the track data's map getter")
            GetTrackMappingsExtensionFingerprint.changeFirstString(trackMapGetter.name)

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

/** A media logger that logs whether a media is a video, under the key "is_video". */
private object MediaIsVideoLoggerFingerprint : Fingerprint(
    parameters = listOf("Lcom/instagram/feed/media/Media;"),
    returnType = "V",
    strings = listOf("is_carousel", "is_video"),
)
