/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.volume

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructions
import app.morphe.util.names.loadsInt
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val VIDEO_TRACKS = "$EXTENSION_PACKAGE/misc/VideoTracks;"
internal const val TRACKS_MENU_HOOK = "$VIDEO_TRACKS->menu(Ljava/lang/Object;)V"
internal const val TRACKS_CHOICE_HOOK = "$VIDEO_TRACKS->menuChoice(I)V"
internal const val TRACKS_CUES_HOOK = "$VIDEO_TRACKS->cues(Ljava/lang/Object;Ljava/util/List;)V"
private const val TRACKS_OBJECT = "Ljava/lang/Object;"
private const val TRACKS_LIST = "Ljava/util/List;"
private const val TRACKS_STRING = "Ljava/lang/String;"
private const val TRACKS_PARSE_INT = "Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I"
private const val TRACKS_MAP_PUT = "Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
private const val TRACKS_HASH_MAP = "Ljava/util/HashMap;"
private const val TRACKS_HASH_SET = "Ljava/util/HashSet;"
/** The viewer's Loop video row: its menu id and icon. */
private const val LOOP_ROW_ID = 22L
private const val LOOP_ROW_ICON = "Lorg/telegram/messenger/R\$drawable;->menu_video_loop:I"
/** addSubItem(id, icon, text): 13.2's R8 folded the String overload into the CharSequence one. */
private val TRACKS_SUB_ITEM_TAKES = listOf(listOf("I", "I", "Ljava/lang/CharSequence;"), listOf("I", "I", TRACKS_STRING))
private val TRACKS_CONSTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)

/** The extension's stubs the track choice writes: name, parameters and result. */
private val TRACKS_STUBS = listOf(
    Triple("player", listOf(TRACKS_OBJECT), TRACKS_OBJECT),
    Triple("videoMenu", listOf(TRACKS_OBJECT), TRACKS_OBJECT),
    Triple("addRow", listOf(TRACKS_OBJECT, "I", "I", "Ljava/lang/CharSequence;"), TRACKS_OBJECT),
    Triple("mapped", listOf(TRACKS_OBJECT), TRACKS_OBJECT),
    Triple("renderers", listOf(TRACKS_OBJECT), "I"),
    Triple("groups", listOf(TRACKS_OBJECT, "I"), TRACKS_OBJECT),
    Triple("support", listOf(TRACKS_OBJECT, "I", "I", "I"), "I"),
    Triple("groupCount", listOf(TRACKS_OBJECT), "I"),
    Triple("group", listOf(TRACKS_OBJECT, "I"), TRACKS_OBJECT),
    Triple("trackType", listOf(TRACKS_OBJECT), "I"),
    Triple("trackCount", listOf(TRACKS_OBJECT), "I"),
    Triple("format", listOf(TRACKS_OBJECT, "I"), TRACKS_OBJECT),
    Triple("language", listOf(TRACKS_OBJECT), TRACKS_STRING),
    Triple("label", listOf(TRACKS_OBJECT), TRACKS_STRING),
    Triple("builder", listOf(TRACKS_OBJECT), TRACKS_OBJECT),
    Triple("overrides", listOf(TRACKS_OBJECT), "Ljava/util/Map;"),
    Triple("disabled", listOf(TRACKS_OBJECT), "Ljava/util/Set;"),
    Triple("override", listOf(TRACKS_OBJECT, "I"), TRACKS_OBJECT),
    Triple("apply", listOf(TRACKS_OBJECT, TRACKS_OBJECT), "V"),
)

/**
 * The player's media3 pieces the extension's stubs reach, each a type, field or method reference
 * as this build's dex names it, and the viewer's fields that lead to them.
 */
internal class TrackRefs(
    val player: String,
    /** The player's DefaultTrackSelector field, and the MappingTrackSelector field holding its MappedTrackInfo. */
    val selector: String,
    val mappedInfo: String,
    val mapped: String,
    val renderers: String,
    val groups: String,
    val support: String,
    /** TrackGroupArray: its length field and get(int). */
    val array: String,
    val arrayLength: String,
    val groupAt: String,
    /** TrackGroup: its length, type and formats fields. */
    val group: String,
    val groupLength: String,
    val groupType: String,
    val formats: String,
    /** Format's label and language. */
    val format: String,
    val label: String,
    val language: String,
    /** DefaultTrackSelector.getParameters(), its Parameters.Builder, built back and handed to setParameters. */
    val getParameters: String,
    val builder: String,
    val builderInit: String,
    val params: String,
    val paramsInit: String,
    val setParameters: String,
    /** TrackSelectionParameters.Builder's overrides map and disabled track types. */
    val baseBuilder: String,
    val overrides: String,
    val disabled: String,
    val override: String,
    val overrideInit: String,
    /** The viewer's player and its video settings menu, the menu's addSubItem, and the color the Loop row's selector gets. */
    val viewerPlayer: String,
    val menu: String,
    val addSubItem: String,
    val selectorColor: Pair<String, Long>?,
)

/**
 * Where the audio track and subtitle choice goes in: the stubs from [refs], and one call in each
 * of [edits]. [missing] is why this build can't have it.
 */
internal class TracksHooks(val refs: TrackRefs?, val edits: List<Edit>, val missing: String?) {
    class Edit(val type: String, val signature: String, val index: Int, val smali: String) {
        fun method(context: BytecodePatchContext) = context.tgMutableClassDefBy(type).methods.single { it.toString() == signature }
    }

    /** The same calls on copies, so a smali problem refuses before the app is touched. */
    fun rehearse(context: BytecodePatchContext) {
        for (edit in edits) insert(MutableMethod(ImmutableMethod.of(edit.method(context))), edit)
    }

    /** The stubs first, then the calls into the extension. */
    fun apply(context: BytecodePatchContext) {
        writeTrackStubs(context, refs!!)
        for (edit in edits) insert(edit.method(context), edit)
    }

    private fun insert(method: MutableMethod, edit: Edit) {
        val stock = method.implementation!!.instructions.count { it.opcode != Opcode.NOP }
        method.addInstructions(edit.index, edit.smali)
        // smali drops an instruction it can't build and only logs it.
        if (method.implementation!!.instructions.count { it.opcode != Opcode.NOP } - stock != 1) {
            throw PatchException("the video track call in ${edit.signature} didn't compile whole")
        }
    }
}

/**
 * Telegram's video viewer picks a video's quality by handing its player's track selector an
 * override for the video track whose id matches, and never offers the other tracks a video can
 * carry: a second audio track or subtitles (#79). Its player is a media3 listener that drops the
 * cues it's given.
 *
 * The quality method names every media3 piece a track choice needs: the selector, its mapped
 * track info, the track groups and their formats, the parameters builder with its overrides map,
 * and the override itself. The viewer builds its video settings menu once, with Loop video added
 * to it by id 22; the extension's rows go in right after it, a tap on one reaches the extension
 * first in the action bar's click handler, and the player's cues go to the extension before its
 * own empty listener method.
 */
internal fun BytecodePatchContext.resolveVideoTracks(): TracksHooks {
    controlHook(VIDEO_TRACKS, "menu", listOf(TRACKS_OBJECT), "V")
    controlHook(VIDEO_TRACKS, "menuChoice", listOf("I"), "V")
    controlHook(VIDEO_TRACKS, "cues", listOf(TRACKS_OBJECT, TRACKS_LIST), "V")
    for ((name, parameters, result) in TRACKS_STUBS) controlHook(VIDEO_TRACKS, name, parameters, result)
    requireStatusMethod("videoTracks")
    return try {
        videoTracks()
    } catch (missing: TracksMissing) {
        TracksHooks(null, emptyList(), missing.message)
    }
}

private class TracksMissing(why: String) : Exception(why)

private fun tracksFit(ok: Boolean, why: String) {
    if (!ok) throw TracksMissing(why)
}

/** The track pieces the quality method reads, before the viewer's are added. */
private class QualityRefs(
    val player: String, val selector: FieldReference, val mappedInfo: FieldReference, val renderers: FieldReference,
    val groups: FieldReference, val array: String, val arrayLength: FieldReference, val groupAt: MethodReference,
    val group: String, val groupLength: FieldReference, val formats: FieldReference, val format: String, val id: FieldReference,
    val getParameters: MethodReference, val builderInit: MethodReference, val paramsInit: MethodReference,
    val setParameters: MethodReference, val overrides: FieldReference, val override: String, val overrideInit: MethodReference,
)

private fun BytecodePatchContext.videoTracks(): TracksHooks {
    val found = mutableListOf<QualityRefs>()
    forEachClassMentioning(Mention.reference(TRACKS_PARSE_INT) and Mention.reference(TRACKS_MAP_PUT)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (m in cls.methods) qualityRefs(cls.type, m)?.let { found += it }
    }
    tracksFit(found.size == 1, "the video player no longer picks a video's quality in one place (${found.size})")
    val q = found.single()

    // The player's own media3 classes: what each field the quality method reads is, read off the class.
    val mapped = q.renderers.definingClass
    val mappedClass = tgClassDefByOrNull(mapped)
    tracksFit(mappedClass != null, "the player's track info is missing")
    val support = mappedClass!!.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "[[[I" }
    tracksFit(support.size == 1, "the player's track info no longer says which tracks it can play")
    val groupClass = tgClassDefByOrNull(q.group)
    tracksFit(groupClass != null, "the player's track group is missing")
    val types = groupClass!!.fields.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags) && it.type == "I" && it.name != q.groupLength.name
    }
    tracksFit(types.size == 1, "the player's track group no longer says what kind of track it holds")
    val formatClass = tgClassDefByOrNull(q.format)
    val describe = formatClass?.methods?.singleOrNull { it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == TRACKS_STRING }
    tracksFit(describe != null, "the player's track format no longer describes itself")
    val described = describe!!.controlBody()
    val brackets = described.indexOfFirst { it.controlString() == ", [" }
    val strings = described.take(maxOf(brackets, 0)).filter { it.opcode == Opcode.IGET_OBJECT }.mapNotNull { it.controlField() }
        .filter { it.definingClass == q.format && it.type == TRACKS_STRING }
    tracksFit(brackets > 0 && strings.size >= 3 && strings.first().toString() == q.id.toString(),
        "the player's track format no longer names its label and language")
    val baseBuilder = q.overrides.definingClass
    val disabled = tgClassDefByOrNull(baseBuilder)?.fields?.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == TRACKS_HASH_SET }
    tracksFit(disabled?.size == 1, "the player's track settings no longer turn off a kind of track")

    val viewer = tgClassDefByOrNull(PHOTO_VIEWER)
    tracksFit(viewer != null, "the video viewer is missing")
    val loops = viewer!!.methods.mapNotNull { m -> loopRow(m)?.let { m to it } }
    tracksFit(loops.size == 1, "the video viewer no longer adds Loop video to its video menu in one place (${loops.size})")
    val (build, loop) = loops.single()
    val flow = try {
        ControlFlow.of(build)
    } catch (failed: IllegalArgumentException) {
        throw TracksMissing("the video viewer's menu can't be read (${failed.message})")
    }
    tracksFit(flow.normal.withIndex().none { (index, next) -> loop.at in next && index != loop.at - 1 } && flow.exceptional.none { loop.at in it },
        "something jumps into the video viewer's Loop video row")

    // The action bar's click handler: a class of its own reading the Loop row, telling ids apart from back.
    val clicks = mutableListOf<Pair<String, Method>>()
    forEachClassMentioning(Mention.reference(loop.row.toString())) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/") || cls.type == viewer.type) return@forEachClassMentioning
        cls.methods.filter { it.isTracksClick(loop.row) }.forEach { clicks += cls.type to it }
    }
    tracksFit(clicks.size == 1, "the video viewer's menu click handler is missing or ambiguous (${clicks.size})")
    val (clickOwner, click) = clicks.single()
    tracksFit(tracksStartClean(click), "something jumps back to the start of the video viewer's menu click handler")
    val clickBody = click.controlBody()
    val loopRead = clickBody.indexOfFirst { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.toString() == loop.row.toString() }
    val viewerPlayer = (loopRead - 1 downTo 0).map { clickBody[it] }.firstOrNull {
        it.opcode == Opcode.IGET_OBJECT && it.controlField()?.let { f -> f.definingClass == viewer.type && f.type == q.player } == true
    }?.controlField()
    tracksFit(viewerPlayer != null, "the video viewer's Loop video no longer reaches its player")

    // The player's cues: its one method taking a list that's the only such method of one of its listeners.
    val playerClass = tgClassDefByOrNull(q.player)!!
    val listened = playerClass.interfaces.flatMap { face ->
        tgClassDefByOrNull(face)?.methods?.filter { it.isCueMethod() }?.takeIf { it.size == 1 }?.map { it.name }.orEmpty()
    }.toSet()
    val cueMethods = playerClass.methods.filter {
        it.name in listened && it.isCueMethod() && !AccessFlags.STATIC.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
            it.implementation != null
    }
    tracksFit(cueMethods.size == 1, "the video player no longer gets its subtitles in one place (${cueMethods.size})")
    val cue = cueMethods.single()
    tracksFit(tracksStartClean(cue), "something jumps back to the start of the video player's subtitles")

    val refs = TrackRefs(
        player = q.player,
        selector = q.selector.toString(),
        mappedInfo = q.mappedInfo.toString(),
        mapped = mapped,
        renderers = q.renderers.toString(),
        groups = q.groups.toString(),
        support = "$mapped->${support.single().name}:[[[I",
        array = q.array,
        arrayLength = q.arrayLength.toString(),
        groupAt = q.groupAt.toString(),
        group = q.group,
        groupLength = q.groupLength.toString(),
        groupType = "${q.group}->${types.single().name}:I",
        formats = q.formats.toString(),
        format = q.format,
        label = strings[1].toString(),
        language = strings.last().toString(),
        getParameters = q.getParameters.toString(),
        builder = q.builderInit.definingClass,
        builderInit = q.builderInit.toString(),
        params = q.paramsInit.definingClass,
        paramsInit = q.paramsInit.toString(),
        setParameters = q.setParameters.toString(),
        baseBuilder = baseBuilder,
        overrides = q.overrides.toString(),
        disabled = "$baseBuilder->${disabled!!.single().name}:$TRACKS_HASH_SET",
        override = q.override,
        overrideInit = q.overrideInit.toString(),
        viewerPlayer = viewerPlayer!!.toString(),
        menu = loop.menu.toString(),
        addSubItem = loop.addSubItem.toString(),
        selectorColor = loop.selectorColor,
    )
    // A piece the extension can't call leaves the track choice out, never the rest of the patch.
    val fields = listOf(refs.selector, refs.mappedInfo, refs.renderers, refs.groups, refs.support, refs.arrayLength, refs.groupLength,
        refs.groupType, refs.formats, refs.label, refs.language, refs.overrides, refs.disabled, refs.viewerPlayer, refs.menu)
    val methods = listOfNotNull(refs.groupAt, refs.getParameters, refs.builderInit, refs.paramsInit, refs.setParameters, refs.overrideInit,
        refs.addSubItem, refs.selectorColor?.first)
    for (reference in fields + methods) {
        try {
            requireReachable(reference, false)
        } catch (unreachable: PatchException) {
            throw TracksMissing("$reference can't be reached from the extension")
        }
    }

    // A stub Android would refuse takes the whole extension class down with it, so it leaves the track choice out.
    try {
        writeTrackStubs(this, refs, install = false)
    } catch (refused: PatchException) {
        throw TracksMissing("the track choice's calls into the player wouldn't load (${refused.message})")
    }

    val clickId = click.localRegisterCount() + 1
    val self = cue.localRegisterCount()
    return TracksHooks(refs, listOf(
        TracksHooks.Edit(viewer.type, build.toString(), loop.at, "invoke-static/range {v${loop.viewer} .. v${loop.viewer}}, $TRACKS_MENU_HOOK"),
        TracksHooks.Edit(clickOwner, click.toString(), 0, "invoke-static/range {v$clickId .. v$clickId}, $TRACKS_CHOICE_HOOK"),
        TracksHooks.Edit(q.player, cue.toString(), 0, "invoke-static/range {v$self .. v${self + 1}}, $TRACKS_CUES_HOOK"),
    ), null)
}

/**
 * The track pieces [method] reads when it's the player's quality choice, or null: it parses a
 * format's id, walks the mapped track info's groups and their formats, builds an override for the
 * matching track, puts it in a parameters builder's overrides and hands the parameters back to the
 * selector it got them from.
 */
private fun qualityRefs(owner: String, method: Method): QualityRefs? {
    if (AccessFlags.STATIC.isSet(method.accessFlags)) return null
    val body = method.controlBody()
    if (body.none { it.controlRef() == TRACKS_PARSE_INT } || body.none { it.controlRef() == TRACKS_MAP_PUT }) return null
    val calls = body.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
    val fields = body.filter { it.opcode == Opcode.IGET_OBJECT || it.opcode == Opcode.IGET }.mapNotNull { it.controlField() }

    // overrides.put(override.group, override), the override built as new Override(group, track).
    val put = body.indexOfFirst { it.controlRef() == TRACKS_MAP_PUT }
    val key = body.getOrNull(put - 1)?.takeIf { it.opcode == Opcode.IGET_OBJECT }?.controlField() ?: return null
    val map = body.getOrNull(put - 2)?.takeIf { it.opcode == Opcode.IGET_OBJECT }?.controlField() ?: return null
    if (map.type != TRACKS_HASH_MAP) return null
    val override = key.definingClass
    val group = key.type
    val overrideInit = calls.filter { it.definingClass == override && it.name == "<init>" &&
        it.parameterTypes.map(CharSequence::toString) == listOf(group, "I") }.distinctBy { it.toString() }.singleOrNull() ?: return null

    val groupAt = calls.filter { it.returnType == group && it.parameterTypes.map(CharSequence::toString) == listOf("I") }
        .distinctBy { it.toString() }.singleOrNull() ?: return null
    val array = groupAt.definingClass
    val arrayLength = fields.filter { it.definingClass == array && it.type == "I" }.distinctBy { it.toString() }.singleOrNull() ?: return null
    val groupLength = fields.filter { it.definingClass == group && it.type == "I" }.distinctBy { it.toString() }.singleOrNull() ?: return null
    val formats = fields.filter { it.definingClass == group && it.type.startsWith("[L") }.distinctBy { it.toString() }.singleOrNull() ?: return null
    val format = formats.type.substring(1)
    val parse = body.indexOfFirst { it.controlRef() == TRACKS_PARSE_INT }
    val id = body.getOrNull(parse - 1)?.takeIf { it.opcode == Opcode.IGET_OBJECT }?.controlField()
    if (id?.definingClass != format || id.type != TRACKS_STRING) return null
    val groups = fields.filter { it.type == "[$array" }.distinctBy { it.toString() }.singleOrNull() ?: return null
    val mapped = groups.definingClass
    val renderers = fields.filter { it.definingClass == mapped && it.type == "I" }.distinctBy { it.toString() }.singleOrNull() ?: return null
    val mappedInfo = fields.filter { it.type == mapped }.distinctBy { it.toString() }.singleOrNull() ?: return null

    // selector.getParameters() into new Builder(parameters); new Parameters(builder) into selector.setParameters.
    // Each builds the other: the parameters are what the selector hands out.
    val pairs = calls.filter { it.name == "<init>" && it.parameterTypes.size == 1 }.distinctBy { it.toString() }.mapNotNull { b ->
        val params = b.parameterTypes[0].toString()
        val back = calls.firstOrNull { p -> p.name == "<init>" && p.definingClass == params && p.parameterTypes.map(CharSequence::toString) == listOf(b.definingClass) }
        val handedOut = calls.filter { it.parameterTypes.isEmpty() && it.returnType == params }.distinctBy { it.toString() }.singleOrNull()
        if (back != null && handedOut != null) Triple(b, back, handedOut) else null
    }
    val (builderInit, paramsInit, getParameters) = pairs.singleOrNull() ?: return null
    val selectorType = getParameters.definingClass
    val built = body.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == paramsInit.toString() }
    val setParameters = body.getOrNull(built + 1)?.takeIf { it.opcode == Opcode.INVOKE_VIRTUAL }
        ?.let { (it as ReferenceInstruction).reference as MethodReference }
        ?.takeIf { it.definingClass == selectorType && it.returnType == "V" && it.parameterTypes.size == 1 &&
            body[built + 1].namedRegisters().getOrNull(1) == body[built].namedRegisters().firstOrNull() } ?: return null
    val selector = fields.filter { it.definingClass == owner && it.type == selectorType }.distinctBy { it.toString() }.singleOrNull() ?: return null
    return QualityRefs(owner, selector, mappedInfo, renderers, groups, array, arrayLength, groupAt, group, groupLength, formats, format, id,
        getParameters, builderInit, paramsInit, setParameters, map!!, override, overrideInit)
}

/** Where the viewer adds Loop video to its video menu: the call, the menu field it's made on, and the row's field. */
private class LoopRow(
    val at: Int,
    val viewer: Int,
    val menu: FieldReference,
    val addSubItem: MethodReference,
    val row: FieldReference,
    val selectorColor: Pair<String, Long>?,
)

/**
 * `menu.addSubItem(22, R.drawable.menu_video_loop, text)` in [method], its row kept in a viewer
 * field; the extension's rows go in right after that store.
 */
private fun loopRow(method: Method): LoopRow? {
    val body = method.controlBody()
    val rows = body.indices.mapNotNull { i ->
        val call = (body[i] as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        if (body[i].opcode != Opcode.INVOKE_VIRTUAL || call.parameterTypes.map(CharSequence::toString) !in TRACKS_SUB_ITEM_TAKES ||
            !call.returnType.startsWith("L")) return@mapNotNull null
        val handed = body[i].namedRegisters()
        if (handed.size != 4) return@mapNotNull null
        trackLastWrite(body, i, handed[2])?.takeIf { it.loadsInt() && it.controlRef() == LOOP_ROW_ICON } ?: return@mapNotNull null
        trackLastWrite(body, i, handed[1])?.takeIf { it.opcode in TRACKS_CONSTS && (it as WideLiteralInstruction).wideLiteral == LOOP_ROW_ID }
            ?: return@mapNotNull null
        val menu = trackLastWrite(body, i, handed[0])?.takeIf { it.opcode == Opcode.IGET_OBJECT }?.controlField()
            ?.takeIf { it.definingClass == PHOTO_VIEWER && it.type == call.definingClass } ?: return@mapNotNull null
        val result = body.getOrNull(i + 1)
        val store = body.getOrNull(i + 2)
        if (result?.opcode != Opcode.MOVE_RESULT_OBJECT || store?.opcode != Opcode.IPUT_OBJECT) return@mapNotNull null
        val row = store.controlField()?.takeIf { it.definingClass == PHOTO_VIEWER && it.type == call.returnType } ?: return@mapNotNull null
        val kept = (result as OneRegisterInstruction).registerA
        val self = (store as TwoRegisterInstruction).registerB
        // The viewer the row was stored on is what the extension gets.
        if (store.registerA != kept || self == kept) return@mapNotNull null
        // The row's selector color, loaded right after the store and set on the row.
        val color = body.getOrNull(i + 3)?.takeIf { it.opcode in TRACKS_CONSTS }
        val paint = body.getOrNull(i + 4)?.takeIf { it.opcode == Opcode.INVOKE_VIRTUAL }
        val paints = (paint as? ReferenceInstruction)?.reference as? MethodReference
        val selectorColor = if (color != null && paints != null && paints.definingClass == call.returnType &&
            paints.parameterTypes.map(CharSequence::toString) == listOf("I") && paints.returnType == "V" &&
            paint.namedRegisters() == listOf(kept, (color as OneRegisterInstruction).registerA)) {
            paints.toString() to (color as WideLiteralInstruction).wideLiteral
        } else null
        LoopRow(i + 3, self, menu, call, row, selectorColor)
    }
    return rows.singleOrNull()
}

/** The last instruction before [at] that writes [register], in straight-line code. */
private fun trackLastWrite(body: List<Instruction>, at: Int, register: Int): Instruction? =
    (at - 1 downTo 0).map { body[it] }.firstOrNull { it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == register }

private fun Method.isTracksClick(row: FieldReference) =
    !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" && parameterTypes.map(CharSequence::toString) == listOf("I") &&
        controlBody().let { body ->
            val literals = body.filter { it.opcode in TRACKS_CONSTS }.map { (it as WideLiteralInstruction).wideLiteral }.toSet()
            body.any { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.toString() == row.toString() } &&
                LOOP_ROW_ID in literals && -1L in literals
        }

private fun Method.isCueMethod() = returnType == "V" && parameterTypes.map(CharSequence::toString) == listOf(TRACKS_LIST)

/** Whether nothing jumps back to [method]'s first instruction, so a call put there runs once, with the parameters as they came. */
private fun tracksStartClean(method: Method): Boolean {
    val flow = try {
        ControlFlow.of(method)
    } catch (failed: IllegalArgumentException) {
        return false
    }
    return flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it }
}

/** Gives each of the extension's track stubs the body that reaches this build's piece, or with [install] false only checks them. */
private fun writeTrackStubs(context: BytecodePatchContext, r: TrackRefs, install: Boolean = true) {
    fun stub(name: String, registers: Int, smali: String) = context.writeStub(VIDEO_TRACKS, name, registers, smali, install)
    stub("player", 2, """
        check-cast p0, $PHOTO_VIEWER
        iget-object v0, p0, ${r.viewerPlayer}
        return-object v0
    """)
    stub("videoMenu", 2, """
        check-cast p0, $PHOTO_VIEWER
        iget-object v0, p0, ${r.menu}
        return-object v0
    """)
    val menuType = r.menu.substringAfterLast(':')
    val textCast = if (r.addSubItem.contains("(II$TRACKS_STRING)")) "check-cast p3, $TRACKS_STRING" else ""
    val paint = r.selectorColor?.let { (call, color) -> """
        const v1, $color
        invoke-virtual {v0, v1}, $call
    """ }.orEmpty()
    stub("addRow", 6, """
        check-cast p0, $menuType
        $textCast
        invoke-virtual {p0, p1, p2, p3}, ${r.addSubItem}
        move-result-object v0
        $paint
        return-object v0
    """)
    stub("mapped", 3, """
        check-cast p0, ${r.player}
        iget-object v0, p0, ${r.selector}
        if-nez v0, :has
        const/4 v1, 0x0
        return-object v1
        :has
        iget-object v1, v0, ${r.mappedInfo}
        return-object v1
    """)
    stub("renderers", 2, """
        check-cast p0, ${r.mapped}
        iget v0, p0, ${r.renderers}
        return v0
    """)
    stub("groups", 3, """
        check-cast p0, ${r.mapped}
        iget-object v0, p0, ${r.groups}
        aget-object v0, v0, p1
        return-object v0
    """)
    stub("support", 5, """
        check-cast p0, ${r.mapped}
        iget-object v0, p0, ${r.support}
        aget-object v0, v0, p1
        aget-object v0, v0, p2
        aget v0, v0, p3
        return v0
    """)
    stub("groupCount", 2, """
        check-cast p0, ${r.array}
        iget v0, p0, ${r.arrayLength}
        return v0
    """)
    stub("group", 3, """
        check-cast p0, ${r.array}
        invoke-virtual {p0, p1}, ${r.groupAt}
        move-result-object v0
        return-object v0
    """)
    stub("trackType", 2, """
        check-cast p0, ${r.group}
        iget v0, p0, ${r.groupType}
        return v0
    """)
    stub("trackCount", 2, """
        check-cast p0, ${r.group}
        iget v0, p0, ${r.groupLength}
        return v0
    """)
    stub("format", 3, """
        check-cast p0, ${r.group}
        iget-object v0, p0, ${r.formats}
        aget-object v0, v0, p1
        return-object v0
    """)
    for ((name, field) in listOf("label" to r.label, "language" to r.language)) stub(name, 2, """
        check-cast p0, ${r.format}
        iget-object v0, p0, $field
        return-object v0
    """)
    stub("builder", 4, """
        check-cast p0, ${r.player}
        iget-object v0, p0, ${r.selector}
        if-nez v0, :has
        const/4 v1, 0x0
        return-object v1
        :has
        invoke-virtual {v0}, ${r.getParameters}
        move-result-object v1
        new-instance v2, ${r.builder}
        invoke-direct {v2, v1}, ${r.builderInit}
        return-object v2
    """)
    for ((name, field) in listOf("overrides" to r.overrides, "disabled" to r.disabled)) stub(name, 2, """
        check-cast p0, ${r.baseBuilder}
        iget-object v0, p0, $field
        return-object v0
    """)
    stub("override", 3, """
        check-cast p0, ${r.group}
        new-instance v0, ${r.override}
        invoke-direct {v0, p0, p1}, ${r.overrideInit}
        return-object v0
    """)
    stub("apply", 4, """
        check-cast p0, ${r.player}
        check-cast p1, ${r.builder}
        iget-object v0, p0, ${r.selector}
        if-eqz v0, :none
        new-instance v1, ${r.params}
        invoke-direct {v1, p1}, ${r.paramsInit}
        invoke-virtual {v0, v1}, ${r.setParameters}
        :none
        return-void
    """)
}
