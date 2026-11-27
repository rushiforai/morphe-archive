package io.github.bryceaspringfield.morphe.patches.youtube

import io.github.bryceaspringfield.morphe.patches.hookReturns
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.hasResourceId
import app.morphe.patcher.resource.resourceId
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.bryceaspringfield.morphe.patches.youtube.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

private const val EXTENSION = "Lio/github/bryceaspringfield/morphe/extension/youtube"
private const val FILTER_ARRAY = "[Lapp/morphe/extension/shared/patches/components/Filter;"

private const val MORPHE_LITHO_FILTER = "Lapp/morphe/extension/shared/patches/components/LithoFilterPatch;"
private const val MORPHE_SETTINGS_FRAGMENT =
    "Lapp/morphe/extension/youtube/settings/preference/YouTubePreferenceFragment;"

private const val MORPHE_REMEMBER_QUALITY = "Lapp/morphe/extension/youtube/patches/playback/quality/RememberVideoQualityPatch;"
private const val MORPHE_VIDEO_INFORMATION = "Lapp/morphe/extension/youtube/patches/VideoInformation;"

private const val MORPHE_RYD_ICON_COUNT =
    "Lapp/morphe/extension/shared/returnyoutubedislike/ReturnYouTubeDislikeButtons\$IconButtonCountDrawable;"
private const val MORPHE_FEED_CARD_LAYOUT = "Lapp/morphe/extension/youtube/patches/FeedCardLayoutPatch;"

private const val MORPHE_ORIGINAL_TITLES =
    "Lapp/morphe/extension/youtube/patches/originaltitles/RestoreOriginalTitlesPatch;"

private const val MORPHE_RYD = "Lapp/morphe/extension/shared/returnyoutubedislike/ReturnYouTubeDislike;"

private val logger = Logger.getLogger("YouTubeExtras")

internal val youtubeExtrasBasePatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/youtube-extras.mpe")

    execute {
        val setter = RollingNumberSetterFingerprint.method
        val cast = setter.instructions.indexOfFirst { it.opcode == Opcode.CHECK_CAST }
        val model = setter.getInstruction<OneRegisterInstruction>(cast).registerA
        val modelType = setter.getInstruction<com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction>(cast)
            .reference.let { (it as TypeReference).type }
        val count = setter.instructions.firstOrNull {
            it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>()?.let { f ->
                f.definingClass == modelType && f.type == "Ljava/lang/String;"
            } == true
        }?.getReference<FieldReference>()?.let { "${it.definingClass}->${it.name}:${it.type}" }
        val next = setter.getInstruction(cast + 1)
        val free = (next as? TwoRegisterInstruction)?.takeIf {
            next.opcode == Opcode.IGET_OBJECT && it.registerA != it.registerB && it.registerA != model
        }?.registerA
        if (count == null || free == null || model > 15 || free > 15) {
            logger.warning("YouTube's animated count setter changed, so the like count keeps its number.")
        } else {
            setter.addInstructions(
                cast + 1,
                """
                    iget-object v$free, v$model, $count
                    invoke-static { v$free }, $EXTENSION/RydText;->rollingNumber(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$free
                    iput-object v$free, v$model, $count
                """
            )
        }

        val disable = DisableAudioOnlyModeFingerprint.matchOrNull()?.method
        val modality = disable?.let { mutableClassDefByOrNull(it.definingClass) }
        val enable = modality?.methods?.firstOrNull {
            AccessFlags.PUBLIC.isSet(it.accessFlags) && it.returnType == "V" && it.parameterTypes.size == 2 &&
                it.parameterTypes.all { p -> p.toString() == "Z" }
        }
        val disablePublic = disable != null && AccessFlags.PUBLIC.isSet(disable.accessFlags) && disable.returnType == "V" &&
            disable.parameterTypes.size == 1 && disable.parameterTypes[0].toString() == "Z"
        if (disable == null || modality == null || enable == null || !disablePublic) {
            logger.warning("YouTube's audio-only mode changed, so Audio only falls back to the lowest quality.")
        } else {
            modality.methods.filter { it.name == "<init>" && it.implementation != null }.forEach { init ->
                val params = init.parameterTypes.sumOf { p -> if (p.toString() == "J" || p.toString() == "D") 2 else 1 } + 1
                if (init.implementation!!.registerCount - params < 1) {
                    logger.warning("YouTube's playback modality constructor has no free register, so Audio only is off.")
                } else {
                    init.hookReturns(
                        Opcode.RETURN_VOID,
                        """
                            const-string v0, "${enable.name}|${disable.name}"
                            invoke-static { p0, v0 }, $EXTENSION/AudioOnly;->setModality(Ljava/lang/Object;Ljava/lang/String;)V
                        """
                    )
                }
            }
        }
    }

    finalize {
        val litho = mutableClassDefByOrNull(MORPHE_LITHO_FILTER)
        val clinit = litho?.methods?.firstOrNull { it.name == "<clinit>" }
        if (clinit == null) {
            logger.warning("Morphe Patches' Litho filter is missing, so the filters are off. Also select Morphe Patches.")
        } else clinit.apply {
            val put = instructions.indexOfFirst {
                it.opcode == Opcode.SPUT_OBJECT && it.getReference<FieldReference>()?.let { f ->
                    f.name == "filters" && f.type == FILTER_ARRAY
                } == true
            }
            if (put < 0) {
                logger.warning("Morphe's filter list was not found, so the filters are off.")
            } else {
                val register = getInstruction<OneRegisterInstruction>(put).registerA
                addInstructions(
                    put,
                    """
                        invoke-static { v$register }, $EXTENSION/XHooks;->addFilters($FILTER_ARRAY)$FILTER_ARRAY
                        move-result-object v$register
                    """
                )
            }
        }

        mutableClassDefByOrNull(MORPHE_VIDEO_INFORMATION)?.methods?.firstOrNull {
            it.name == "setVideoId" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;")
        }?.addInstruction(0, "invoke-static { p0 }, $EXTENSION/AutoLike;->onVideo(Ljava/lang/String;)V")
            ?: logger.warning("Morphe's VideoInformation.setVideoId is missing, so Like every video is off.")

        mutableClassDefByOrNull(MORPHE_REMEMBER_QUALITY)?.methods?.firstOrNull {
            it.name == "userChangedQuality" && it.parameterTypes.map { p -> p.toString() } == listOf("I") && it.implementation != null
        }?.addInstruction(0, "invoke-static {}, $EXTENSION/QualityAudioRow;->resolutionPicked()V")
            ?: logger.warning("Morphe's userChangedQuality is missing, so a resolution pick leaves Audio only on.")

        mutableClassDefByOrNull(MORPHE_ORIGINAL_TITLES)?.methods?.firstOrNull {
            it.name == "onLithoTextLoaded" && it.returnType == "Ljava/lang/CharSequence;" &&
                    it.parameterTypes.size == 2 && it.parameterTypes[1].toString() == "Ljava/lang/CharSequence;"
        }?.apply {
            hookReturns(
                Opcode.RETURN_OBJECT,
                """
                    invoke-static { {reg} }, $EXTENSION/DeArrowToggle;->out(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
                    move-result-object {reg}
                """
            )
            addInstruction(
                0,
                "invoke-static { p0, p1 }, $EXTENSION/DeArrowToggle;->in(Ljava/lang/Object;Ljava/lang/CharSequence;)V"
            )
        } ?: logger.warning("Morphe's title hook is missing, so the DeArrow icon tap and title suggestions are off.")

        for ((name, method) in listOf("getFormattedDislikes" to "dislikes", "getFormattedLikes" to "likes")) {
            mutableClassDefByOrNull(MORPHE_RYD)?.methods?.firstOrNull {
                it.name == name && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" &&
                        (it.implementation?.registerCount ?: 0) >= 2
            }?.addInstructions(
                0,
                """
                    invoke-static { p0 }, $EXTENSION/RydText;->$method(Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v0
                    if-eqz v0, :yx_ryd_own
                    return-object v0
                    :yx_ryd_own
                    nop
                """
            ) ?: logger.warning("Morphe's RYD $name is missing, so the vote format option is off there.")
        }

        mutableClassDefByOrNull(MORPHE_RYD_ICON_COUNT)?.methods?.firstOrNull {
            it.name == "getText" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" && it.implementation != null
        }?.apply {
            hookReturns(
                Opcode.RETURN_OBJECT,
                """
                    invoke-static { {reg} }, $EXTENSION/RydText;->iconText(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object {reg}
                """
            )
        } ?: logger.warning("Morphe's RYD icon count is missing, so the like count under the icon stays a number.")

        mutableClassDefByOrNull(MORPHE_FEED_CARD_LAYOUT)?.methods?.firstOrNull {
            it.name == "findWatchLaterCommand" && it.implementation != null
        }?.apply {
            addInstruction(0, "invoke-static { p0 }, $EXTENSION/SaveChooser;->rememberMenu(Ljava/lang/Object;)V")
            hookReturns(
                Opcode.RETURN_OBJECT,
                """
                    invoke-static { {reg} }, $EXTENSION/SaveChooser;->cardSaveCommand(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object {reg}
                    check-cast {reg}, $returnType
                """
            )
        } ?: logger.warning("Morphe's card layout save command is missing, so card save buttons keep saving to Watch later.")

        val initialize = mutableClassDefByOrNull(MORPHE_SETTINGS_FRAGMENT)?.methods?.firstOrNull {
            it.name == "initialize" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        if (initialize == null) {
            logger.warning("Morphe Patches' settings screen is missing, so the settings cannot be edited.")
        } else initialize.apply {
            hookReturns(Opcode.RETURN_VOID, "invoke-static { }, $EXTENSION/SettingsUi;->addSettings()V")
            addInstruction(0, "invoke-static { p0 }, $EXTENSION/SettingsUi;->setFragment(Ljava/lang/Object;)V")
        }
    }
}

@Suppress("unused")
val youtubeExtrasPatch = bytecodePatch(
    name = "YouTube Extras",
    description = "Adds channel filters, video length, category, and topic filters, playlists on Home, " +
            "live chat on all messages, and the other options of Settings > Morphe > YouTube Extras.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(youtubeExtrasBasePatch)

    execute {
        LiveChatRequestFingerprint.let { fp ->
            val requestClass = fp.classDef
            val build = requestClass.methods.first { m ->
                m.parameterTypes.isEmpty() && m.name != "<init>" && m.implementation?.instructions?.any {
                    it.opcode == Opcode.INVOKE_STATIC &&
                            it.getReference<MethodReference>()?.let { r -> r.definingClass == "Landroid/text/TextUtils;" && r.name == "isEmpty" } == true
                } == true
            }
            val bytesField = requestClass.fields.first { it.type == "[B" }
            val tokenField = build.implementation!!.instructions.first {
                it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>()?.type == "Ljava/lang/String;"
            }.getReference<FieldReference>()!!
            build.addInstructions(
                0,
                """
                    iget-object v0, p0, ${bytesField.definingClass}->${bytesField.name}:[B
                    invoke-static { v0 }, $EXTENSION/LiveChat;->rewriteBytes([B)[B
                    move-result-object v0
                    iput-object v0, p0, ${bytesField.definingClass}->${bytesField.name}:[B
                    iget-object v0, p0, ${tokenField.definingClass}->${tokenField.name}:${tokenField.type}
                    invoke-static { v0 }, $EXTENSION/LiveChat;->rewriteToken(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v0
                    iput-object v0, p0, ${tokenField.definingClass}->${tokenField.name}:${tokenField.type}
                """
            )
        }

        SortFilterBindFingerprint.let {
            it.method.apply {
                val index = instructions.withIndex().filter { (i, ins) ->
                    i < it.instructionMatches.last().index && ins.opcode == Opcode.INVOKE_VIRTUAL &&
                            ins.getReference<MethodReference>()?.name == "setOnItemSelectedListener"
                }.last().index
                val spinner = getInstruction<FiveRegisterInstruction>(index).registerC
                addInstruction(
                    index + 1,
                    "invoke-static { v$spinner }, $EXTENSION/LiveChat;->onSortMenu(Landroid/widget/Spinner;)V"
                )
            }
        }

        run {
            val noticeId = if (hasResourceId(ResourceType.ID, "dismissal_reasons_text")) resourceId(ResourceType.ID, "dismissal_reasons_text") else null
            fun MethodLike(method: com.android.tools.smali.dexlib2.iface.Method, id: Long?) = id != null && method.name == "<init>" &&
                method.implementation?.instructions?.any { it.opcode == Opcode.CONST && it is NarrowLiteralInstruction && it.narrowLiteral.toLong() == id } == true
            val notices = mutableListOf<ClassDef>()
            classDefForEach { classDef ->
                if (classDef.type.startsWith("Lio/github/bryceaspringfield/") || classDef.type.startsWith("Lapp/morphe/")) return@classDefForEach
                if (classDef.methods.any { MethodLike(it, noticeId) && it.parameterTypes.firstOrNull()?.toString() == "Landroid/view/View;" }) notices.add(classDef)
            }
            notices.forEach { classDef ->
                mutableClassDefBy(classDef).methods.filter { MethodLike(it, noticeId) && it.parameterTypes.firstOrNull()?.toString() == "Landroid/view/View;" }.forEach {
                    it.addInstruction(0, "invoke-static { p1 }, $EXTENSION/AutoReason;->onNotice(Landroid/view/View;)V")
                }
            }
            if (notices.isEmpty()) logger.warning("YouTube Extras: the reason after Not interested is not hooked (no notice class)")
            else logger.info("YouTube Extras: the reason after Not interested hooks ${notices.map { it.type }}")
        }
    }
}
