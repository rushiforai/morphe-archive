/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.interaction.captions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.pinedrama.misc.extension.sharedExtensionPatch
import app.morphe.patches.pinedrama.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.pinedrama.misc.settings.configurableBytecodePatch as bytecodePatch
import app.morphe.patches.pinedrama.misc.settings.settingsPatch
import app.morphe.patches.pinedrama.shared.guardAtEntry
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstruction
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.addInstructionsWithLabels
import app.morphe.util.cloneMutableAndPreserveParameters
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.getReference
import app.morphe.util.implementationOrPatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION = "Lapp/morphe/extension/pinedrama/captions/TrackPreference;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val PATCH = "Subtitle and dub preference"
internal const val AWEME_TYPE = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
internal const val PREPARE_CAPTION_UTIL =
    "Lcom/ss/android/ugc/aweme/video/util/PrepareVideoCaptionUtilImpl;"
internal const val CAPTION_SERVICE = "Lcom/ss/android/ugc/aweme/service/CaptionServiceImpl;"
internal const val CAPTION_KEVA_SERVICE =
    "Lcom/ss/android/ugc/aweme/service/CaptionKevaServiceImpl;"
internal const val CAPTION_KEVA_INTERFACE =
    "Lcom/ss/android/ugc/aweme/service/ICaptionKevaService;"
internal const val CAPTION_ASSEM =
    "Lcom/ss/android/ugc/aweme/autocaption/refactor/CLACaptionAssemV2;"
internal const val AUTO_DUBBING_SERVICE =
    "Lcom/ss/android/ugc/aweme/translation/service/AutoDubbingServiceImpl;"
internal const val CAPTION_USER_SETTING = ", isCaptionUserSettingOn: "
internal const val HIDE_FOREIGN_ORIGINAL = ", shouldHideForeignOriginalSubtitle: "
internal const val STALE_TARGET_HIDDEN = "stale_target_lang_hidden"
private const val CAPTION_ITEM = "Lcom/ss/android/ugc/aweme/feed/model/CaptionItemModel;"
private const val TRANSLATION_KEVA = "Lcom/ss/android/ugc/aweme/translation/service/ITranslationKevaService;"
private val MOVES = setOf(
    Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16,
    Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16,
)

private fun MethodReference.takes(vararg types: String) =
    parameterTypes.map { it.toString() } == types.toList()

private fun Method.takes(vararg types: String) =
    parameterTypes.map { it.toString() } == types.toList()

private fun Method.code(): List<Instruction> = implementationOrPatchException(PATCH).instructions.toList()

/** The app's own diagnostic line, which names each caption check right before calling it. */
internal object SubtitleConfigLogFingerprint : Fingerprint(
    name = "invokeSuspend",
    strings = listOf("SubConfigController, getConfig, aweme: ", CAPTION_USER_SETTING),
)

/** The player's prepare step: of the two taking a video, the one that also names a scene. */
internal object PrepareCaptionConfigFingerprint : Fingerprint(
    definingClass = PREPARE_CAPTION_UTIL,
    parameters = listOf(AWEME_TYPE),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                instruction.getReference<MethodReference>()?.let {
                    it.returnType == method.returnType && it.takes(AWEME_TYPE, STRING)
                } == true
        } == true
    },
)

/** Answers the two playback flags from the dub decision it calls first. */
internal object DubDecisionUserFingerprint : Fingerprint(
    parameters = listOf(AWEME_TYPE, STRING),
    strings = listOf("mayConfigToPlayTranslatedVideo: enterFrom="),
)

/** Switches the audio language once a video's dub label is on screen. */
internal object AutoDubbingSwitchFingerprint : Fingerprint(
    definingClass = AUTO_DUBBING_SERVICE,
    returnType = "V",
    parameters = listOf(AWEME_TYPE),
    strings = listOf("updateAutoDubbingAudioLanguage aid:"),
)

/** Answers the "AI dubbed" label: of the service's checks, the one asking whether a dub exists. */
internal object DubLabelFingerprint : Fingerprint(
    definingClass = AUTO_DUBBING_SERVICE,
    returnType = "Z",
    parameters = listOf(AWEME_TYPE),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                instruction.getReference<MethodReference>()?.let {
                    it.returnType == "Z" && it.takes(AWEME_TYPE, "Z")
                } == true
        } == true
    },
)

/** The player's audio language switch, which looks the language up in its list of audio tracks. */
internal object AudioLanguageSwitchFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(STRING),
    strings = listOf("Enter switchAudioLanguage, languageCode="),
)

/** The player's report of the track it now plays, which builds that list on the first audio one. */
internal object TrackReportFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I", "I"),
    strings = listOf("Enter onInfoIdChanged: mediaType="),
)

/** Settles which track the caption overlay asks for, from the translation state it's handed. */
internal object OverlayTargetFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("L", "L", OBJECT, "L"),
    custom = { method, _ ->
        val code = method.implementation?.instructions
        code != null && code.any {
            it.opcode == Opcode.SGET_OBJECT && it.getReference<FieldReference>()?.name == "TRANSLATED"
        } && code.any {
            it.opcode == Opcode.INVOKE_INTERFACE &&
                it.getReference<MethodReference>()?.definingClass == TRANSLATION_KEVA
        }
    },
)

/** Decides whether the overlay shows, and names each reason it hides in the app's log. */
internal object CaptionDisplayStateFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("calculating UI display state.  ", STALE_TARGET_HIDDEN),
)

/** The check the log line calls right after printing [text]. */
internal fun checkAfter(code: List<Instruction>, text: String): MethodReference {
    val at = code.indexOfFirst { it.getReference<StringReference>()?.string == text }
    if (at < 0) throw PatchException("$PATCH: the caption log no longer says \"$text\".")
    for (index in at + 1 until code.size) {
        if (code[index].opcode != Opcode.INVOKE_STATIC) continue
        val call = code[index].getReference<MethodReference>()!!
        if (call.returnType == "Z" && call.parameterTypes.firstOrNull()?.toString() == AWEME_TYPE) return call
    }
    throw PatchException("$PATCH: no caption check follows \"$text\".")
}

/** The first static call in [code] taking only a video and answering [returnType]. */
internal fun staticFromVideo(code: Iterable<Instruction>, returnType: String): MethodReference =
    code.firstNotNullOfOrNull { instruction ->
        if (instruction.opcode != Opcode.INVOKE_STATIC) return@firstNotNullOfOrNull null
        instruction.getReference<MethodReference>()?.takeIf {
            it.returnType == returnType && it.takes(AWEME_TYPE)
        }
    } ?: throw PatchException("$PATCH: no static call answering $returnType from a video.")

/** The static call in the prepare step that works out a subtitle config from a video and a scene. */
internal fun configFromScene(code: Iterable<Instruction>, returnType: String): MethodReference =
    code.firstNotNullOfOrNull { instruction ->
        if (instruction.opcode != Opcode.INVOKE_STATIC) return@firstNotNullOfOrNull null
        instruction.getReference<MethodReference>()?.takeIf {
            it.returnType == returnType && it.takes(AWEME_TYPE, STRING)
        }
    } ?: throw PatchException("$PATCH: the prepare step no longer works out a subtitle config.")

/** The per-video "See original" lookup, and the singleton it's called on. */
internal class HandChoice(val owner: FieldReference, val lookup: MethodReference)

internal fun handChoice(check: Method): HandChoice {
    val code = check.code()
    val lookup = code.firstNotNullOfOrNull { instruction ->
        if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@firstNotNullOfOrNull null
        instruction.getReference<MethodReference>()?.takeIf {
            it.takes(STRING) && it.returnType.startsWith("L") && it.returnType != STRING
        }
    } ?: throw PatchException("$PATCH: the foreign subtitle check no longer reads the video's choice.")
    val owner = code.firstNotNullOfOrNull { instruction ->
        if (instruction.opcode != Opcode.SGET_OBJECT) return@firstNotNullOfOrNull null
        instruction.getReference<FieldReference>()?.takeIf { it.type == lookup.definingClass }
    } ?: throw PatchException("$PATCH: the video's choice has no singleton in front of it.")
    return HandChoice(owner, lookup)
}

/** Where a subtitle config gets built, and the registers holding its id, its model and the video. */
internal class ConfigSite(val at: Int, val id: Int, val model: Int, val video: Int)

/**
 * The config's constructor takes a range: flag, id, flag, model. The id and model may only be
 * copied up into that range right before the call, and it's the lower source a short invoke can
 * name, so a copy between the new-instance and the call gives the register to use.
 */
internal fun configSite(method: Method): ConfigSite {
    val code = method.code()
    val at = code.indexOfLast {
        it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == method.returnType
    }
    if (at < 0) throw PatchException("$PATCH: ${method.name} no longer builds a subtitle config.")
    val built = (at until code.size).firstOrNull { code[it].opcode == Opcode.INVOKE_DIRECT_RANGE }
        ?: throw PatchException("$PATCH: the subtitle config isn't built with a range call.")
    val start = (code[built] as RegisterRangeInstruction).startRegister
    fun source(target: Int): Int {
        for (index in at until built) {
            if (code[index].opcode !in MOVES) continue
            val move = code[index] as TwoRegisterInstruction
            if (move.registerA == target) return move.registerB
        }
        return target
    }
    val video = code.subList(0, at).lastOrNull {
        it.opcode == Opcode.INVOKE_VIRTUAL && it.getReference<MethodReference>()?.let { reference ->
            reference.definingClass == AWEME_TYPE && reference.name == "getAid"
        } == true
    } as? FiveRegisterInstruction
        ?: throw PatchException("$PATCH: ${method.name} no longer reads the video's id.")
    return ConfigSite(at, source(start + 2), source(start + 4), video.registerC)
}

/**
 * Two registers a short invoke can name that the code writes before reading at the config site.
 * They used to be v0 and v1, until 47.7.3's scene path kept the video in v1.
 */
internal fun configScratch(method: Method, site: ConfigSite): Pair<Int, Int> {
    val free = method.getFreeRegisterProvider(site.at, 2, site.video, site.model, site.id)
    return free.getFreeRegister4Bit() to free.getFreeRegister4Bit()
}

/** Lets the extension answer the id just before the config takes it. */
private fun MutableMethod.pickSubtitle(choice: HandChoice) {
    val site = configSite(this)
    val (aid, owner) = configScratch(this, site)
    addInstructionsAtControlFlowLabel(
        site.at,
        """
            invoke-virtual {v${site.video}}, $AWEME_TYPE->getAid()$STRING
            move-result-object v$aid
            sget-object v$owner, ${choice.owner.definingClass}->${choice.owner.name}:${choice.owner.type}
            invoke-virtual {v$owner, v$aid}, ${choice.lookup.definingClass}->${choice.lookup.name}($STRING)${choice.lookup.returnType}
            move-result-object v$aid
            invoke-static {v${site.video}, v${site.model}, v${site.id}, v$aid}, $EXTENSION->subtitleId($OBJECT${OBJECT}I$OBJECT)I
            move-result v${site.id}
        """,
    )
}

/**
 * Where the overlay's request has been filled in and is about to become what the overlay is told to
 * load. The method returns straight after, so the filling call's receiver and the register the
 * answer lands in are both free.
 */
internal class OverlaySite(val at: Int, val video: Int, val request: Int, val freeA: Int, val freeB: Int)

internal fun overlaySites(method: Method): List<OverlaySite> {
    val code = method.code()
    val sites = (0 until code.size - 2).mapNotNull { index ->
        if (code[index].opcode != Opcode.INVOKE_VIRTUAL || code[index + 1].opcode != Opcode.INVOKE_VIRTUAL ||
            code[index + 2].opcode != Opcode.MOVE_RESULT_OBJECT
        ) {
            return@mapNotNull null
        }
        val filling = code[index].getReference<MethodReference>()!!
        if (filling.returnType != "Z" || filling.parameterTypes.size != 2 ||
            filling.parameterTypes[0].toString() != AWEME_TYPE
        ) {
            return@mapNotNull null
        }
        val call = code[index] as FiveRegisterInstruction
        OverlaySite(
            index + 1,
            call.registerD,
            call.registerE,
            call.registerC,
            (code[index + 2] as OneRegisterInstruction).registerA,
        )
    }
    if (sites.size != 2) throw PatchException("$PATCH: the overlay fills ${sites.size} requests, not 2.")
    return sites
}

/** The fields of the overlay's request, read off the method that turns them into its target. */
internal class OverlayFields(
    val id: FieldReference,
    val language: FieldReference,
    val path: FieldReference,
    val translated: FieldReference,
    val realtime: FieldReference,
)

internal fun overlayFields(build: Method): OverlayFields {
    val code = build.code()
    val made = code.firstOrNull { it.opcode == Opcode.INVOKE_DIRECT_RANGE }
        ?: throw PatchException("$PATCH: the overlay's target isn't built with a range call.")
    if (!made.getReference<MethodReference>()!!.takes(STRING, "I", STRING, "Z", "Z")) {
        throw PatchException("$PATCH: the overlay's target no longer takes language, id, path and two flags.")
    }
    val first = (made as RegisterRangeInstruction).startRegister
    fun source(argument: Int) = code.firstNotNullOfOrNull { instruction ->
        (instruction as? TwoRegisterInstruction)?.takeIf { it.registerA == first + argument }
            ?.let { instruction.getReference<FieldReference>() }
    } ?: throw PatchException("$PATCH: argument $argument of the overlay's target isn't read from a field.")
    return OverlayFields(source(2), source(1), source(3), source(4), source(5))
}

private fun FieldReference.smali() = "$definingClass->$name:$type"

/** Puts the pick in the request. A track other than stock's has no realtime file to go with it. */
private fun MutableMethod.pickOverlayTrack(site: OverlaySite, fields: OverlayFields, choice: HandChoice) {
    val a = site.freeA
    val b = site.freeB
    val video = site.video
    val request = site.request
    addInstructionsAtControlFlowLabel(
        site.at,
        """
            invoke-virtual {v$video}, $AWEME_TYPE->getAid()$STRING
            move-result-object v$a
            sget-object v$b, ${choice.owner.definingClass}->${choice.owner.name}:${choice.owner.type}
            invoke-virtual {v$b, v$a}, ${choice.lookup.definingClass}->${choice.lookup.name}($STRING)${choice.lookup.returnType}
            move-result-object v$a
            iget v$b, v$request, ${fields.id.smali()}
            invoke-static {v$video, v$b, v$a}, $EXTENSION->overlaySubtitle(${OBJECT}I$OBJECT)I
            move-result v$a
            if-eq v$a, v$b, :morphe_overlay_stock
            iput v$a, v$request, ${fields.id.smali()}
            invoke-static {v$video, v$a}, $EXTENSION->subtitleLanguage(${OBJECT}I)$STRING
            move-result-object v$b
            iput-object v$b, v$request, ${fields.language.smali()}
            invoke-static {v$video, v$a}, $EXTENSION->subtitleTranslated(${OBJECT}I)Z
            move-result v$b
            iput-boolean v$b, v$request, ${fields.translated.smali()}
            const/4 v$b, 0x0
            iput-object v$b, v$request, ${fields.path.smali()}
            iput-boolean v$b, v$request, ${fields.realtime.smali()}
            :morphe_overlay_stock
            nop
        """,
    )
}

/** Where the "stale translation" verdict has settled on every path, and the registers it came from. */
internal class StaleGate(val at: Int, val flag: Int, val video: Int, val shown: Int)

internal fun staleGate(method: Method): StaleGate {
    val code = method.code()
    val named = code.indexOfFirst { it.getReference<StringReference>()?.string == STALE_TARGET_HIDDEN }
    if (named < 0) throw PatchException("$PATCH: the overlay no longer logs \"$STALE_TARGET_HIDDEN\".")
    val check = (named downTo 0).firstOrNull { code[it].opcode == Opcode.IF_EQZ }
        ?: throw PatchException("$PATCH: nothing checks the verdict before the stale reason is named.")
    val flag = (code[check] as OneRegisterInstruction).registerA
    val set = code.indexOfFirst {
        it.opcode == Opcode.CONST_4 && (it as OneRegisterInstruction).registerA == flag &&
            (it as WideLiteralInstruction).wideLiteral == 1L
    }
    if (set < 0) throw PatchException("$PATCH: the stale verdict is no longer set to true.")
    val before = code.subList(0, set)
    val shown = before.firstOrNull {
        it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>()?.let { field ->
            field.definingClass == method.definingClass && field.type == "Ljava/lang/Integer;"
        } == true
    } as? TwoRegisterInstruction ?: throw PatchException("$PATCH: the overlay no longer reads the track it shows.")
    val video = before.firstOrNull {
        it.opcode == Opcode.INVOKE_STATIC && it.getReference<MethodReference>()?.let { call ->
            call.returnType == CAPTION_ITEM && call.takes(AWEME_TYPE)
        } == true
    } as? FiveRegisterInstruction ?: throw PatchException("$PATCH: the overlay no longer looks up the original track.")
    return StaleGate(set + 1, flag, video.registerC, shown.registerA)
}

/** The caption overlay's switch writes one setting per caption kind, and both mean the same to us. */
internal fun captionSwitchWriters(assem: Iterable<Method>, setting: MethodReference): List<String> {
    val toggle = assem.firstOrNull { method ->
        method.returnType == "V" && method.takes("Z") && method.implementation?.instructions?.any {
            it.opcode == Opcode.INVOKE_STATIC && it.getReference<MethodReference>()?.let { reference ->
                reference.definingClass == setting.definingClass && reference.name == setting.name
            } == true
        } == true
    } ?: throw PatchException("$PATCH: the caption overlay no longer has a switch.")
    val writers = toggle.code().mapNotNull { instruction ->
        if (instruction.opcode != Opcode.INVOKE_INTERFACE) return@mapNotNull null
        instruction.getReference<MethodReference>()?.takeIf {
            it.definingClass == CAPTION_KEVA_INTERFACE && it.returnType == "V" && it.takes("Z")
        }?.name
    }.distinct()
    if (writers.size != 2) {
        throw PatchException("$PATCH: the caption switch writes ${writers.size} settings, not 2.")
    }
    return writers
}

/** The dub decision's positions and registers, read off the method as it stands. */
internal class DubDecisionSites(
    val target: Int,
    val targetAt: Int,
    val joinAt: Int,
    val toggle: Int,
    val skipList: Int,
)

/**
 * The decision reads one feature flag three times: to get in, to pick the kind of dub, and where
 * the answers for the dubbing switch and the skip list join. The target language lands in one
 * register right before the video's audio is first read, and both ways of setting it arrive there.
 */
internal fun dubDecisionSites(method: Method): DubDecisionSites {
    val code = method.code()
    val flag = code.first { it.opcode == Opcode.INVOKE_STATIC }.getReference<MethodReference>()!!
    val flagReads = code.indices.filter { index ->
        code[index].opcode == Opcode.INVOKE_STATIC && code[index].getReference<MethodReference>()?.let {
            it.definingClass == flag.definingClass && it.name == flag.name
        } == true
    }
    if (flagReads.size < 3) {
        throw PatchException("$PATCH: the dub decision reads its flag ${flagReads.size} times.")
    }
    val joinAt = flagReads[2]

    val targetAt = code.indexOfFirst {
        it.getReference<MethodReference>()?.let { reference ->
            reference.definingClass == AWEME_TYPE && reference.name == "getAudio"
        } == true
    }
    if (targetAt < 1) throw PatchException("$PATCH: the dub decision no longer reads the audio.")
    val target = (targetAt - 1 downTo 0).firstOrNull { code[it].opcode == Opcode.MOVE_RESULT_OBJECT }
        ?: throw PatchException("$PATCH: the dub target isn't read before the audio.")

    val zeroChecks = (joinAt + 1 until code.size).filter { code[it].opcode == Opcode.IF_EQZ }
    if (zeroChecks.size < 2) throw PatchException("$PATCH: the dub decision lost its switch check.")
    val skipAt = (joinAt + 1 until code.size).firstOrNull { code[it].opcode == Opcode.IF_NEZ }
        ?: throw PatchException("$PATCH: the dub decision lost its skip list check.")
    return DubDecisionSites(
        (code[target] as OneRegisterInstruction).registerA,
        targetAt,
        joinAt,
        (code[zeroChecks[1]] as OneRegisterInstruction).registerA,
        (code[skipAt] as OneRegisterInstruction).registerA,
    )
}

/** The audio switch's language check, and the registers holding the language and the hand choice. */
internal class DubSwitchSite(val at: Int, val language: Int, val choice: Int)

internal fun dubSwitchSite(method: Method): DubSwitchSite {
    val code = method.code()
    val switching = code.indices.firstOrNull { index ->
        code[index].opcode == Opcode.INVOKE_INTERFACE &&
            code[index].getReference<MethodReference>()?.let {
                it.returnType == "V" && it.takes(STRING)
            } == true
    } ?: throw PatchException("$PATCH: the dub service no longer switches the audio language.")
    val check = (switching downTo 0).firstOrNull { index ->
        code[index].opcode == Opcode.INVOKE_STATIC &&
            code[index].getReference<MethodReference>()?.let {
                it.returnType == "Z" && it.takes(STRING)
            } == true
    } ?: throw PatchException("$PATCH: the audio switch has no language check.")
    val translated = code.indexOfFirst {
        it.opcode == Opcode.SGET_OBJECT && it.getReference<FieldReference>()?.name == "OVERRIDE_TO_TRANSLATED"
    }
    val compared = if (translated < 0) null else (translated until code.size).firstOrNull {
        code[it].opcode == Opcode.IF_NE
    }
    if (compared == null) throw PatchException("$PATCH: the dub service no longer reads the video's choice.")
    return DubSwitchSite(
        check,
        (code[check] as FiveRegisterInstruction).registerC,
        (code[compared] as TwoRegisterInstruction).registerA,
    )
}

/**
 * How the audio switch reaches the engine: the player state it reads, the field and call that
 * hand it the player, and the engine call with the option number that picks an audio track.
 */
internal class EngineSwitch(
    val state: String,
    val player: FieldReference,
    val getPlayer: MethodReference,
    val engine: MethodReference,
    val option: Long,
)

internal fun engineSwitch(method: Method): EngineSwitch {
    val code = method.code()
    val getAt = code.indices.firstOrNull { index ->
        index > 0 && code[index].opcode == Opcode.INVOKE_INTERFACE &&
            code[index - 1].opcode == Opcode.IGET_OBJECT &&
            code[index].getReference<MethodReference>()?.let { call ->
                call.parameterTypes.isEmpty() &&
                    call.definingClass == code[index - 1].getReference<FieldReference>()?.type
            } == true
    } ?: throw PatchException("$PATCH: the audio switch no longer asks for its player.")
    val playerRead = code[getAt - 1] as TwoRegisterInstruction
    val stateRead = (getAt - 2 downTo 0).firstOrNull { index ->
        code[index].opcode == Opcode.IGET_OBJECT &&
            (code[index] as TwoRegisterInstruction).registerA == playerRead.registerB
    } ?: throw PatchException("$PATCH: the audio switch no longer reads its player state.")
    val playerAt = (getAt + 1).takeIf { code.getOrNull(it)?.opcode == Opcode.MOVE_RESULT_OBJECT }
        ?: throw PatchException("$PATCH: the audio switch drops its player.")
    val player = (code[playerAt] as OneRegisterInstruction).registerA
    val call = code.indices.firstOrNull { index ->
        code[index].opcode == Opcode.INVOKE_VIRTUAL &&
            (code[index] as FiveRegisterInstruction).registerC == player &&
            code[index].getReference<MethodReference>()?.let {
                it.returnType == "V" && it.takes("I", "I")
            } == true
    } ?: throw PatchException("$PATCH: the audio switch no longer tells the engine.")
    val optionRegister = (code[call] as FiveRegisterInstruction).registerD
    val option = (call downTo 0).firstNotNullOfOrNull { index ->
        val instruction = code[index]
        if (instruction is WideLiteralInstruction && instruction is OneRegisterInstruction &&
            instruction.registerA == optionRegister
        ) instruction.wideLiteral else null
    } ?: throw PatchException("$PATCH: the audio switch's engine option isn't a constant.")
    return EngineSwitch(
        code[stateRead].getReference<FieldReference>()!!.type,
        code[getAt - 1].getReference<FieldReference>()!!,
        code[getAt].getReference<MethodReference>()!!,
        code[call].getReference<MethodReference>()!!,
        option,
    )
}

/**
 * Where the track report has logged the track and has two registers to spare: the read of the
 * player state that starts the listener step, whose register and the next read's are both written
 * before anything reads them. Also the state's video id and audio list, and the registers the
 * report copies its kind and track into.
 */
internal class TrackReportSite(
    val at: Int,
    val holder: Int,
    val state: FieldReference,
    val first: Int,
    val second: Int,
    val video: FieldReference,
    val tracks: FieldReference,
    val kind: Int,
    val kindParameter: Int,
    val playing: Int,
)

internal fun trackReportSite(method: Method, stateType: String): TrackReportSite {
    val code = method.code()
    val registers = method.implementation!!.registerCount
    fun copyOf(parameter: Int) = code.firstOrNull {
        it.opcode == Opcode.MOVE_FROM16 && (it as TwoRegisterInstruction).registerB == parameter
    }?.let { (it as TwoRegisterInstruction).registerA }
        ?: throw PatchException("$PATCH: the track report no longer copies its arguments.")
    val kindParameter = registers - 1
    val kind = copyOf(kindParameter)
    val playing = copyOf(registers - 2)

    val logged = code.indexOfFirst { it.getReference<StringReference>()?.string == "onInfoIdChanged: mediaType=" }
    if (logged < 0) throw PatchException("$PATCH: the track report no longer logs the track.")
    val at = (logged + 1 until code.size - 1).firstOrNull { index ->
        val read = code[index]
        val next = code[index + 1]
        read.opcode == Opcode.IGET_OBJECT && next.opcode == Opcode.IGET_OBJECT &&
            read.getReference<FieldReference>()?.type == stateType &&
            (read as TwoRegisterInstruction).registerA != read.registerB &&
            (next as TwoRegisterInstruction).registerB == read.registerA &&
            next.registerA != read.registerA
    } ?: throw PatchException("$PATCH: the track report has no listener step after its log.")
    val read = code[at] as TwoRegisterInstruction

    fun stateField(type: String, after: Int = 0) = (after until code.size).firstNotNullOfOrNull { index ->
        code[index].takeIf { it.opcode == Opcode.IGET_OBJECT }?.getReference<FieldReference>()
            ?.takeIf { it.definingClass == stateType && it.type == type }
    } ?: throw PatchException("$PATCH: the track report's player state lost its $type.")
    val named = code.indexOfFirst { it.getReference<StringReference>()?.string == ", mSourceId=" }
    if (named < 0) throw PatchException("$PATCH: the track report no longer names its video.")

    val site = TrackReportSite(
        at,
        read.registerB,
        code[at].getReference<FieldReference>()!!,
        read.registerA,
        (code[at + 1] as TwoRegisterInstruction).registerA,
        stateField(STRING, named),
        stateField("Ljava/util/Map;"),
        kind,
        kindParameter,
        playing,
    )
    if (listOf(site.holder, site.first, site.second, site.kind, site.playing).any { it > 15 }) {
        throw PatchException("$PATCH: the track report's registers moved past v15.")
    }
    return site
}

val subtitleDubPreferencePatch = bytecodePatch(
    name = "Subtitle and dub preference",
    description = "Lets you choose which subtitle and dub videos use, by language, and hide " +
        "videos without them. Everything starts off. Set it up in HushPine settings under " +
        "Playback and Feed filter.",
    default = true,
) {
    category("Playback")
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.pineDrama())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/pinedrama/settings/SettingsStatus;->enableSubtitleDubPreference()V",
        )

        fun mutable(reference: MethodReference) =
            mutableClassDefBy(reference.definingClass).findMutableMethodOf(reference)

        val log = SubtitleConfigLogFingerprint.method.code()
        val setting = checkAfter(log, CAPTION_USER_SETTING)
        val hideForeign = mutable(checkAfter(log, HIDE_FOREIGN_ORIGINAL))
        val choice = handChoice(hideForeign)

        // The player gets its subtitle down one of two paths, by a server flag, and each builds
        // its own config from an id it worked out itself.
        val prepare = PrepareCaptionConfigFingerprint.method
        val config = prepare.returnType
        mutable(configFromScene(prepare.code(), config)).pickSubtitle(choice)
        val service = mutableClassDefBy(CAPTION_SERVICE).methods.firstOrNull { method ->
            method.returnType == config && method.takes(AWEME_TYPE)
        } ?: throw PatchException("$PATCH: the caption service no longer answers a config.")
        mutable(staticFromVideo(service.code(), config)).pickSubtitle(choice)

        // Those only set the track the player starts on. The overlay works out its own target and
        // switches the player to it, so it needs the same pick or it undoes the one above.
        val overlayTarget = OverlayTargetFingerprint.method
        val requests = overlaySites(overlayTarget)
        val building = overlayTarget.code()[requests.first().at].getReference<MethodReference>()!!
        val requestFields = overlayFields(mutable(building))
        requests.reversed().forEach { overlayTarget.pickOverlayTrack(it, requestFields, choice) }

        // A translation outside the app's language would then be hidden as a leftover.
        val displayState = CaptionDisplayStateFingerprint.method
        val gate = staleGate(displayState)
        displayState.addInstructionsAtControlFlowLabel(
            gate.at,
            """
                invoke-static {v${gate.video}, v${gate.shown}, v${gate.flag}}, $EXTENSION->staleSubtitle($OBJECT${OBJECT}Z)Z
                move-result v${gate.flag}
            """,
        )

        // A foreign original would otherwise be hidden as if it were the wrong language.
        hideForeign.guardAtEntry(
            PATCH,
            "invoke-static {p0}, $EXTENSION->originalStaysShown($OBJECT)Z",
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // This check has one register, the video itself, and overwrites it with its answer. The
        // copy with room keeps the video in a register of its own for each return.
        val settingClass = mutableClassDefBy(setting.definingClass)
        val roomy = settingClass.findMutableMethodOf(setting).cloneMutableAndPreserveParameters(settingClass)
        val video = roomy.implementation!!.registerCount - 1
        roomy.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
            index.takeIf { instruction.opcode == Opcode.RETURN }
        }.reversed().forEach { index ->
            val answer = roomy.getInstruction<OneRegisterInstruction>(index).registerA
            roomy.addInstructionsAtControlFlowLabel(
                index,
                """
                    invoke-static {v$video, v$answer}, $EXTENSION->captionsOn(${OBJECT}Z)Z
                    move-result v$answer
                """,
            )
        }

        // The switch's own writes are how a forced subtitle learns someone turned captions off.
        val writers = captionSwitchWriters(mutableClassDefBy(CAPTION_ASSEM).methods, setting)
        val keva = mutableClassDefBy(CAPTION_KEVA_SERVICE)
        for (writer in writers) {
            keva.methods.first { it.name == writer && it.returnType == "V" && it.takes("Z") }
                .addInstruction(0, "invoke-static {p1}, $EXTENSION->captionSwitch(Z)V")
        }

        val decisionUser = DubDecisionUserFingerprint.method
        val decision = mutable(staticFromVideo(decisionUser.code(), decisionUser.returnType))
        val sites = dubDecisionSites(decision)
        val decisionVideo = decision.implementation!!.registerCount - 1
        // The later position first, so the earlier index still means what it did.
        decision.addInstructionsAtControlFlowLabel(
            sites.joinAt,
            """
                invoke-static {v$decisionVideo}, $EXTENSION->dubForced($OBJECT)Z
                move-result v0
                if-eqz v0, :morphe_dub_as_asked
                const/4 v${sites.toggle}, 0x1
                const/4 v${sites.skipList}, 0x0
                :morphe_dub_as_asked
                nop
            """,
        )
        decision.addInstructionsAtControlFlowLabel(
            sites.targetAt,
            """
                invoke-static {v$decisionVideo, v${sites.target}}, $EXTENSION->dubTarget($OBJECT$STRING)$STRING
                move-result-object v${sites.target}
            """,
        )

        val switching = AutoDubbingSwitchFingerprint.method
        val switchSite = dubSwitchSite(switching)
        val switchVideo = switching.implementation!!.registerCount - 1
        switching.addInstructionsAtControlFlowLabel(
            switchSite.at,
            """
                invoke-static {v$switchVideo, v${switchSite.language}, v${switchSite.choice}}, $EXTENSION->dubLanguage($OBJECT$STRING$OBJECT)$STRING
                move-result-object v${switchSite.language}
            """,
        )

        // That switch can reach the player before its list of audio tracks exists, and then it's
        // dropped. The player's first audio report, once the list is built, gets the dub instead.
        val engine = engineSwitch(AudioLanguageSwitchFingerprint.method)
        val report = TrackReportFingerprint.method
        val track = trackReportSite(report, engine.state)
        report.addInstructionsAtControlFlowLabel(
            track.at,
            """
                iget-object v${track.first}, v${track.holder}, ${track.state.smali()}
                iget-object v${track.second}, v${track.first}, ${track.video.smali()}
                iget-object v${track.first}, v${track.first}, ${track.tracks.smali()}
                invoke-static {v${track.second}, v${track.first}, v${track.kind}, v${track.playing}}, $EXTENSION->dubTrack($STRING${OBJECT}II)I
                move-result v${track.first}
                if-ltz v${track.first}, :morphe_track_as_played
                iget-object v${track.second}, v${track.holder}, ${track.state.smali()}
                iget-object v${track.second}, v${track.second}, ${engine.player.smali()}
                invoke-interface {v${track.second}}, ${engine.getPlayer.definingClass}->${engine.getPlayer.name}()${engine.getPlayer.returnType}
                move-result-object v${track.second}
                instance-of v${track.kind}, v${track.second}, ${engine.engine.definingClass}
                if-eqz v${track.kind}, :morphe_track_as_played
                check-cast v${track.second}, ${engine.engine.definingClass}
                const v${track.kind}, ${engine.option}
                invoke-virtual {v${track.second}, v${track.kind}, v${track.first}}, ${engine.engine.definingClass}->${engine.engine.name}(II)V
                :morphe_track_as_played
                move/from16 v${track.kind}, v${track.kindParameter}
            """,
        )

        // The label only asks whether a dub exists, so it would still say AI dubbed over the
        // video's own audio.
        DubLabelFingerprint.method.addInstructionsWithLabels(
            0,
            """
                if-eqz p1, :morphe_label_as_asked
                invoke-virtual {p1}, $AWEME_TYPE->getAid()$STRING
                move-result-object v0
                sget-object v1, ${choice.owner.definingClass}->${choice.owner.name}:${choice.owner.type}
                invoke-virtual {v1, v0}, ${choice.lookup.definingClass}->${choice.lookup.name}($STRING)${choice.lookup.returnType}
                move-result-object v0
                invoke-static {p1, v0}, $EXTENSION->dubLabelOff($OBJECT$OBJECT)Z
                move-result v0
                if-eqz v0, :morphe_label_as_asked
                const/4 v0, 0x0
                return v0
                :morphe_label_as_asked
                nop
            """,
        )
    }
}
