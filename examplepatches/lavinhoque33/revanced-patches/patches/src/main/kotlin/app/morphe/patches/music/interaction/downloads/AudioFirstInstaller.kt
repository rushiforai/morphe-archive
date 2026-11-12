/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.music.interaction.playlisttracktap.CommandResolverFingerprint
import app.morphe.patches.shared.misc.fix.proto.parseByteArrayMethodRef
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.util.fingerprint.matchSingle
import app.morphe.util.findMutableMethodOf
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val AUDIO_FIRST_PATH = "Lapp/morphe/extension/music/patches/downloads/"
private const val AUDIO_FIRST = "${AUDIO_FIRST_PATH}AudioFirst;"
private const val OVERRIDE_MODE = "$AUDIO_FIRST->overrideMode(Ljava/lang/Enum;)Ljava/lang/Enum;"
private const val ON_COMMAND = "$AUDIO_FIRST->onCommand(Ljava/lang/Object;)V"
private const val OVERRIDE_COMMAND = "$AUDIO_FIRST->overrideCommand(Ljava/lang/Object;)Ljava/lang/Object;"
private const val MODE_HOLDER = $$"$${AUDIO_FIRST_PATH}AudioFirst$ModeHolder;"
private const val QUEUE_ITEMS = "${AUDIO_FIRST_PATH}QueueItems;"
private const val QUEUE_ITEM = $$"$${AUDIO_FIRST_PATH}QueueItems$Item;"
private const val QUEUE_RENDERER = $$"$${AUDIO_FIRST_PATH}QueueItems$Renderer;"
private const val ON_QUEUE_ITEM = "$QUEUE_ITEMS->onQueueItem(Ljava/lang/Object;)V"
private const val PILL_OWNER = $$"$${AUDIO_FIRST_PATH}QueueItems$PillOwner;"
private const val START_INDEX = "$QUEUE_ITEMS->startIndex(Ljava/util/List;I)I"
private const val PILL_VIEW = $$"$${AUDIO_FIRST_PATH}QueueItems$PillView;"
private const val ON_PILL_OWNER = "$QUEUE_ITEMS->onPillOwner(Ljava/lang/Object;)V"
private const val START_POSITION = "$QUEUE_ITEMS->startPosition(Ljava/lang/Object;J)J"
private const val ON_PILL_CLICK = "$QUEUE_ITEMS->onPillClick(Ljava/lang/Object;)Z"
private const val PILL_GATE = $$"$${AUDIO_FIRST_PATH}PillAvailability$Gate;"
private const val ON_PILL_STATE = "${AUDIO_FIRST_PATH}PillAvailability;->onPillState(Ljava/lang/Object;)V"
private const val ON_PILL_LOOK = "${AUDIO_FIRST_PATH}PillAvailability;->onPillLook(Ljava/lang/Object;Z)Z"
private const val ON_TOGGLE_GATE = "${AUDIO_FIRST_PATH}PillAvailability;->onToggleGate(Z)Z"
private const val REGISTRY = "Lcom/google/protobuf/ExtensionRegistryLite;"
private const val CAPTURE_HOLDER = "$AUDIO_FIRST->captureHolder(Ljava/lang/Object;)V"
private const val OBJECT = "Ljava/lang/Object;"
private const val MAX_SETTER_INSTRUCTIONS = 6

/** The five-value audio/video mode enum, found by the names of its constants. */
private val audioVideoModeEnumFingerprint = Fingerprint(
    name = "<clinit>",
    strings = listOf("ATV_PREFERRED", "OMV_PREFERRED", "DONT_PLAY_VIDEO_OVERRIDE"),
)

/** A tiny setter: it hands its argument to one `(Object)V` call on a subject and does nothing else of note. */
private fun Method.callsOneObjectSubject(): Boolean {
    val instructions = implementation?.instructions?.toList() ?: return false
    if (instructions.size > MAX_SETTER_INSTRUCTIONS) return false

    val calls = instructions.filter { it.opcode == Opcode.INVOKE_VIRTUAL || it.opcode == Opcode.INVOKE_INTERFACE }
        .mapNotNull { it.getReference<MethodReference>() }
    return calls.size == 1 && calls[0].returnType == "V" &&
        calls[0].parameterTypes.map(CharSequence::toString) == listOf(OBJECT)
}

/**
 * Start downloaded songs in audio mode. Stock keeps one global audio/video mode (an enum of five values) in a state
 * holder, and falls back to `OMV_PREFERRED` for an account without Premium when a tap names no mode, so an album row
 * opens in video mode and requests the music video's id. Two hooks:
 *  - every command resolved by a tap is reported, which arms a short flag when its song has a stream copy. The
 *    command hook is installed by [installAudioFirstCommandHook] once every patch has run, see there;
 *  - the holder's setter is routed through the extension, which turns an armed `OMV_PREFERRED` into
 *    `ATV_PREFERRED` and never touches the user-triggered values. It also records the mode for the swap.
 *
 * Resolved by shape, in 9.40.51 / 9.15.51 / 8.30.54 order: enum `Lhzo` / `Lnuu` / `Lngq`; holder `Lgdh` / `Lnuv` /
 * `Lngr`; setter `q` / `e` / `e`. Everything is resolved before anything is changed, and an unfamiliar version only
 * warns: no audio-first start, and the swap then declines in every mode it cannot read.
 */
internal fun BytecodePatchContext.installAudioFirst() {
    audioFirstResolved = false
    try {
        val enumType = audioVideoModeEnumFingerprint.matchSingle().classDef.type
        val setter = Fingerprint(
            returnType = "V",
            parameters = listOf(enumType),
            custom = { method, owner ->
                !AccessFlags.STATIC.isSet(method.accessFlags) && !AccessFlags.ABSTRACT.isSet(method.accessFlags) &&
                    !AccessFlags.CONSTRUCTOR.isSet(method.accessFlags) && owner.type != enumType &&
                    method.callsOneObjectSubject() &&
                    owner.methods.any {
                        it.parameterTypes.isEmpty() && it.returnType == enumType &&
                            !AccessFlags.STATIC.isSet(it.accessFlags)
                    }
            },
        ).matchSingle()
        val commandResolver = CommandResolverFingerprint.method
        val supported = mutableClassDefBy(AUDIO_FIRST).methods.single { it.name == "supported" }

        mutableClassDefBy(setter.classDef.type).findMutableMethodOf(setter.method).addInstructions(0, """
            invoke-static {p0}, $CAPTURE_HOLDER
            invoke-static {p1}, $OVERRIDE_MODE
            move-result-object p1
            check-cast p1, $enumType
        """)
        supported.returnEarly(true)
        audioFirstResolved = true
        installModeHolderAccess(setter.classDef.type, setter.method, enumType)
        installQueueItemRetarget()
        printInfo("AudioFirst: mode enum $enumType, holder ${setter.classDef.type}, setter ${setter.method.name}, " +
            "taps ${commandResolver.definingClass}->${commandResolver.name}")
    } catch (ex: Exception) {
        printWarn("Start downloaded songs in audio mode is unavailable on this Music version: ${ex.message}")
    }
}

/**
 * Lets the extension read the mode and call the app's own setter, so a tap can start the audio mode and not only
 * answer the video fallback later. The holder gets two bridge methods (the setter and its one getter) and every
 * constructor reports the new instance. Kept apart: if the holder cannot be bridged, only this part is missing.
 */
private fun BytecodePatchContext.installModeHolderAccess(holderType: String, setter: Method, enumType: String) {
    try {
        val holder = mutableClassDefBy(holderType)
        val getters = holder.methods.filter {
            it.parameterTypes.isEmpty() && it.returnType == enumType && !AccessFlags.STATIC.isSet(it.accessFlags)
        }
        val getter = getters.singleOrNull() ?: throw IllegalStateException("${getters.size} mode getters")

        holder.interfaces.add(MODE_HOLDER)
        holder.addDownloadsBridge("rvxMode", emptyList(), OBJECT, 2, """
            invoke-virtual {p0}, $holderType->${getter.name}()$enumType
            move-result-object v0
            return-object v0
        """)
        holder.addDownloadsBridge("rvxSetMode", listOf(OBJECT), "V", 2, """
            check-cast p1, $enumType
            invoke-virtual {p0, p1}, $holderType->${setter.name}($enumType)V
            return-void
        """)

        // The setter reports the instances that set a mode. A single constructor is the holder itself and also reports
        // it, so the first tap after a start finds it; a merged class with many constructors is not hooked there.
        val constructors = holder.methods.filter { it.name == "<init>" }.takeIf { it.size == 1 }.orEmpty()
        for (constructor in constructors) {
            val returns = constructor.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
            for (index in returns.reversed()) {
                constructor.addInstructions(index, "invoke-static {p0}, $CAPTURE_HOLDER")
            }
        }
        printInfo("AudioFirst: mode holder bridged, getter ${getter.name}, constructor hooks ${constructors.size}")
    } catch (ex: Exception) {
        printWarn("Start downloaded songs in audio mode cannot start the audio mode from the tap on this Music " +
            "version, it only answers the app's video fallback: ${ex.message}")
    }
}

/** The queue item built from a response wrapper, found by the log string of its set-up, to name the renderer. */
private val wrapperItemFingerprint = Fingerprint(
    strings = listOf("Counterpart renderer absent in response. "),
)

/**
 * The queue item for a single panel renderer: a constructor of a long (or a Long), the renderer and a flag, a field of
 * each, and nothing else.
 */
private fun singleRendererItemFingerprint(rendererType: String) = Fingerprint(
    name = "<init>",
    custom = { method, owner ->
        val types = method.parameterTypes.map(CharSequence::toString)
        types.size == 3 && types[1] == rendererType && types[2] == "Z" &&
            (types[0] == "J" || types[0] == "Ljava/lang/Long;") && owner.fields.count() == 3 &&
            owner.fields.count { it.type == rendererType && !AccessFlags.STATIC.isSet(it.accessFlags) } == 1
    },
)

/**
 * The toggle's item listener: `instance-of <single item>`, negated and stored in a boolean (true for an item with a
 * counterpart), as its first three instructions. It only names the toggle's view class and the listener's name, which
 * the click hook resolves its view and the item reference by; nothing is injected into it.
 */
private fun pillItemListenerFingerprint(itemType: String) = Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val opcodes = method.implementation?.instructions?.take(3)?.map { it.opcode }
        method.parameterTypes.size == 1 &&
            opcodes == listOf(Opcode.INSTANCE_OF, Opcode.XOR_INT_LIT8, Opcode.IPUT_BOOLEAN) &&
            method.implementation!!.instructions.first().getReference<TypeReference>()?.type == itemType
    },
)

/**
 * The next songs of an album are queue items that hold only the music video's renderer, so in the audio mode Next
 * requested the video's id, which has no stream copy. The item keeps that renderer and a copy rebuilt around the song's
 * id, and shows the one the mode asks for, so the Song/Video pill still reaches the video: the item reports itself to
 * the extension when it is built or given another renderer, and the extension swaps the renderer (through the item's
 * two bridge methods, one reading its renderer field and one writing it, which is all its own replacing method does)
 * on every mode change. The renderer class gets one bridge, `rvxWithBytes`, which parses a renderer from bytes the way
 * the tap command's bridge does.
 *
 * Resolved by shape, 9.40.51 / 9.15.51 / 8.30.54: item `Lhxp` / `Lnox` / `Lnas`, renderer `Laopp` / `Lbxxg` / `Lbsez`,
 * replacing method `u` / `u` / `t`, toggle view `Lhvv` / `Lnkv` / `Lmxb`. Kept apart: if any part is missing
 * only this selection is, with a warning.
 */
private fun BytecodePatchContext.installQueueItemRetarget() {
    try {
        val wrapperItem = wrapperItemFingerprint.matchSingle().classDef
        // The renderer is the type of the four fields the wrapper item keeps its renderers in.
        val rendererType = wrapperItem.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
            .groupBy { it.type }.filter { it.value.size >= 4 }.keys.single()

        val itemMatch = singleRendererItemFingerprint(rendererType).matchSingle()
        val itemType = itemMatch.classDef.type
        val item = mutableClassDefBy(itemType)
        val replacer = item.methods.single {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == listOf(rendererType)
        }
        val rendererField = item.fields.single { it.type == rendererType && !AccessFlags.STATIC.isSet(it.accessFlags) }
        val pill = pillItemListenerFingerprint(itemType).matchSingle()

        // The queue items, the pill and the queue start work together: a song renderer on an item the pill cannot
        // reach the video from, or a queue that cannot start at the tapped row, is worse than none. Everything is
        // resolved before anything is changed.
        val installPill = preparePillClick(item, pill.method.name, pill.classDef.type)
        val installStart = prepareQueueStart()
        val installPosition = preparePillStartPosition()
        val installAvailability = preparePillAvailability(pill.classDef.type)
        val installToggleGate = preparePillToggleGate()

        val renderer = mutableClassDefBy(rendererType)
        val defaultRenderer = renderer.fields.single {
            it.type == rendererType && AccessFlags.STATIC.isSet(it.accessFlags)
        }
        val parserOwner = parseByteArrayMethodRef.get()!!.definingClass
        val parser = mutableClassDefBy(parserOwner).methods.single {
            it.name == "parseFrom" && it.parameterTypes == listOf(parserOwner, "[B", REGISTRY)
        }

        renderer.interfaces.add(QUEUE_RENDERER)
        renderer.addDownloadsBridge("rvxWithBytes", listOf("[B"), OBJECT, 4, """
            sget-object v0, $defaultRenderer
            invoke-static {}, $REGISTRY->getGeneratedRegistry()$REGISTRY
            move-result-object v1
            invoke-static {v0, p1, v1}, $parser
            move-result-object v0
            return-object v0
        """)

        item.interfaces.add(QUEUE_ITEM)
        item.addDownloadsBridge("rvxRenderer", emptyList(), OBJECT, 2, """
            iget-object v0, p0, $itemType->${rendererField.name}:$rendererType
            return-object v0
        """)
        item.addDownloadsBridge("rvxReplace", listOf(OBJECT), "V", 2, """
            check-cast p1, $rendererType
            iput-object p1, p0, $itemType->${rendererField.name}:$rendererType
            return-void
        """)

        // The extension tracks the item once it holds its renderer: before every return of both methods.
        for (method in listOf(itemMatch.method, replacer)) {
            val builder = item.findMutableMethodOf(method)
            builder.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.reversed()
                .forEach { builder.addInstructions(it, "invoke-static {p0}, $ON_QUEUE_ITEM") }
        }

        printInfo("AudioFirst: queue item tracking $itemType, renderer $rendererType, replacer ${replacer.name}, " +
            "toggle view ${pill.classDef.type}")

        printInfo(installPill())
        printInfo(installStart())
        installPosition?.let { printInfo(it()) }
        installAvailability?.let { printInfo(it()) }
        installToggleGate?.let { printInfo(it()) }
    } catch (ex: Exception) {
        printWarn("Start downloaded songs in audio mode cannot keep the next songs of an album on their song " +
            "renderers on this Music version, so the queue items, the song/video pill and the start at the " +
            "tapped row are all skipped: ${ex.message}")
    }
}

/**
 * A string only the app's own audio/video switch uses: its navigation hands the player the position to continue at,
 * under this key, and the consumers copy it into the playback start descriptor builder.
 */
private val avSwitchStartTimeFingerprint = Fingerprint(strings = listOf("avSwitchPlaybackStartTime"))

/** The registers the start position hook needs: the command, and the position (a pair). */
private const val START_POSITION_LOCALS = 3

/**
 * The Song/Video pill continues at the position the player had: the start descriptor of a playback (`Labjl` builder,
 * `Labjm` product) has a start position in milliseconds (`k`, -1 when none), which the app's own audio/video switch
 * fills from its navigation's `avSwitchPlaybackStartTime`. The pill's click navigates with the item's own command
 * instead, so its descriptor has none and the load starts at 0:00 (the command's own start time field is not read for a
 * new video). The builder is found by the field the switch's consumers store that time in (the one `iput-wide` that
 * follows a `Long.longValue()` in a method with that string); at the start of its build method the extension is asked
 * for the position of the command the descriptor holds, and answers the position the pill's click noted for it, else
 * the descriptor's own. Optional: a version where it is not found keeps the stock start (0:00), and the rest installs.
 */
private fun BytecodePatchContext.preparePillStartPosition(): (() -> String)? {
    try {
        val stores = avSwitchStartTimeFingerprint.matchAll(1..Int.MAX_VALUE).flatMap { match ->
            val instructions = match.method.implementation!!.instructions.toList()
            instructions.indices.filter { index ->
                index >= 2 && instructions[index].opcode == Opcode.IPUT_WIDE &&
                    instructions[index - 1].opcode == Opcode.MOVE_RESULT_WIDE &&
                    instructions[index - 2].getReference<MethodReference>()?.let {
                        it.definingClass == "Ljava/lang/Long;" && it.name == "longValue"
                    } == true
            }.mapNotNull { instructions[it].getReference<FieldReference>() }
        }.distinctBy { "${it.definingClass}->${it.name}" }
        val startField = stores.singleOrNull()
            ?: error("start position: ${stores.size} start position fields in the switch's consumers")

        val builder = mutableClassDefBy(startField.definingClass)
        val commandType = nativeDownloadsCommandResolverFingerprint.method.parameterTypes[1].toString()
        val commandField = builder.fields.singleOrNull {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == commandType
        } ?: error("start position: the builder has no single field of the command type $commandType")

        val builds = builder.methods.filter {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.isEmpty() &&
                it.returnType.startsWith("L") && !it.returnType.startsWith("Ljava/")
        }
        val build = builds.singleOrNull() ?: error("start position: ${builds.size} build methods")
        val implementation = build.implementation!!
        check(implementation.registerCount - 1 >= START_POSITION_LOCALS) {
            "start position: the build method has no free registers"
        }

        return {
            builder.findMutableMethodOf(build).addInstructions(0, """
                iget-object v0, p0, ${builder.type}->${commandField.name}:$commandType
                iget-wide v1, p0, ${builder.type}->${startField.name}:J
                invoke-static {v0, v1, v2}, $START_POSITION
                move-result-wide v1
                iput-wide v1, p0, ${builder.type}->${startField.name}:J
            """)

            "AudioFirst: pill start position ${builder.type}->${build.name}, start ${startField.name}, " +
                "command ${commandField.name}"
        }
    } catch (ex: Exception) {
        printWarn("The Song/Video switch of the Music player cannot keep the playback position on this Music " +
            "version, so it starts at 0:00: ${ex.message}")
        return null
    }
}

/**
 * Offline the pill stayed dim for a video with a video copy, and a press showed "Video not available" (the click
 * listener lets a press through only when the pill is lit). The app lights it in its state methods, which run on
 * every change of the playback, the queue item and the session, and sets the pill's look in the one look method. The
 * state methods have several exits (a kill switch and branches jump straight to their return) and the current one
 * (9.40.51 `Lhvv.f`, behind a flag of the app) returns before the look method when the state it computed is the one
 * the pill shows, so a dim pill stays dim and the look method is never reached. The extension is asked at the START
 * of every state method, where it lights a dim pill for a video with a copy, so the app's comparison fails and sets
 * the look; and at the START of the look method, which every path but the kill switch reaches with the view in its
 * first register: it may turn a dim look into a lit one for a video with a copy.
 *
 * Added to the toggle's view: `rvxBright` (the look method, lit) and `rvxShown` (its flag), which the click hook of
 * [preparePillClick] uses to light a dim pill before the listener's own check. Resolved by shape, in the view class:
 * the look method is the one `(Z)V` that sets the view's alpha and stores a boolean of its own; the state methods
 * are the `()V` methods that call one of the methods that call the look method (the older one calls the look method
 * itself, the current one only through them). `Lhvv.j` with `Lhvv.e` and `Lhvv.f` (9.40.51), `Lnkv.j` / `Lnkv.e`
 * (9.15.51), `Lmxb.h` / `Lmxb.e` (8.30.54). Optional: a version where it is not found keeps the app's own pill, and
 * the rest installs.
 */
private fun BytecodePatchContext.preparePillAvailability(viewType: String): (() -> String)? {
    try {
        val view = mutableClassDefBy(viewType)
        val methods = view.methods.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null }
        val look = methods.singleOrNull { method ->
            method.parameterTypes.map(CharSequence::toString) == listOf("Z") && method.returnType == "V" &&
                method.implementation!!.instructions.any { it.getReference<MethodReference>()?.name == "setAlpha" }
        } ?: error("pill availability: no single look method")
        val flag = look.implementation!!.instructions.filter { it.opcode == Opcode.IPUT_BOOLEAN }
            .mapNotNull { it.getReference<FieldReference>() }.filter { it.definingClass == viewType }
            .distinctBy { it.name }.singleOrNull() ?: error("pill availability: no single flag in ${look.name}")

        fun Method.callsOwn(): List<MethodReference> = implementation!!.instructions
            .mapNotNull { it.getReference<MethodReference>() }.filter { it.definingClass == viewType }
        fun MethodReference.isMethod(method: Method) = name == method.name &&
            parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)

        val callers = methods.filter { it !== look && it.callsOwn().any { call -> call.isMethod(look) } }
        val states = methods.filter { method ->
            method.parameterTypes.isEmpty() && method.returnType == "V" &&
                method.callsOwn().any { call -> callers.any { call.isMethod(it) } }
        }
        check(states.isNotEmpty()) { "pill availability: no state method" }

        val call = if (AccessFlags.PRIVATE.isSet(look.accessFlags)) "invoke-direct" else "invoke-virtual"
        return {
            view.interfaces.add(PILL_GATE)
            view.addDownloadsBridge("rvxBright", emptyList(), "V", 2, """
                const/4 v0, 0x1
                $call {p0, v0}, $viewType->${look.name}(Z)V
                return-void
            """)
            view.addDownloadsBridge("rvxShown", emptyList(), "Z", 2, """
                iget-boolean v0, p0, $viewType->${flag.name}:Z
                return v0
            """)

            view.findMutableMethodOf(look).addInstructions(0, """
                invoke-static/range {p0 .. p1}, $ON_PILL_LOOK
                move-result p1
            """)
            states.forEach { state ->
                view.findMutableMethodOf(state).addInstructions(0, "invoke-static/range {p0 .. p0}, $ON_PILL_STATE")
            }

            "AudioFirst: pill availability $viewType->${states.joinToString("/") { it.name }}, look ${look.name}, " +
                "flag ${flag.name}"
        }
    } catch (ex: Exception) {
        printWarn("The Song/Video pill of the Music player stays dim for a video with a video copy offline on this " +
            "Music version: ${ex.message}")
        return null
    }
}

/**
 * A press of the pill that the listener lets through runs the owner's press method, which asks its gate first: the
 * display mode is switched only when the gate is open (a per-video flag of the app, or a user setting), else the
 * press shows the app's own message or follows an endpoint. For a video with a copy the gate is opened: the
 * extension may turn the gate's `false` into `true`, before each of its returns.
 *
 * Resolved by shape: the gate is the owner's own `()Z` method that the press method calls first, the same press
 * method [preparePillClick] resolves. `Lhvr.g` (9.40.51), `Lnjz.i` (9.15.51), `Lmwg.h` (8.30.54). Optional: a
 * version where it is not found keeps the app's own gate, and the rest installs.
 */
private fun BytecodePatchContext.preparePillToggleGate(): (() -> String)? {
    try {
        val press = pillPressFingerprint.matchSingle()
        val owner = mutableClassDefBy(press.classDef.type)
        val first = press.method.implementation!!.instructions.firstOrNull()?.getReference<MethodReference>()
            ?: error("toggle gate: the press method starts with no call")
        val gate = owner.methods.singleOrNull {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.name == first.name && it.returnType == "Z" &&
                it.parameterTypes.isEmpty() && it.implementation != null && first.definingClass == owner.type
        } ?: error("toggle gate: the press method does not start with a boolean method of its own class")

        return {
            val builder = owner.findMutableMethodOf(gate)
            builder.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN }.map { it.index to it.value }.reversed()
                .forEach { (index, instruction) ->
                    val register = builder.registerName((instruction as OneRegisterInstruction).registerA)
                    builder.addInstructions(index, """
                        invoke-static/range {$register .. $register}, $ON_TOGGLE_GATE
                        move-result $register
                    """)
                }

            "AudioFirst: toggle gate ${owner.type}->${gate.name}"
        }
    } catch (ex: Exception) {
        printWarn("The Song/Video pill of the Music player cannot open its toggle for a video with a video copy on " +
            "this Music version: ${ex.message}")
        return null
    }
}

/** The method of the toggle's owner that persists the user's choice: it is what a press of the pill runs. */
private val pillPressFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf("Failed to update user last selected audio"),
)

/**
 * The pill's own press does nothing for an album item: the click listener lets it through only when the toggle's gate
 * is open, and the app then changes the mode and reloads only a queue item that has a counterpart, or, when its flag
 * for it is off, follows the switch endpoint of the player response, which an audio-only response of a song has not.
 * So the click is taken over, at the start of the listener, before any gate: the extension is asked first, and for the
 * item being played, when it is tracked, it changes the mode (the items then show the renderer of that mode) and has
 * the toggle's owner navigate to the item's own watch endpoint, as the app does for a tap on the row. Any other click
 * is the app's.
 *
 * Added to the toggle's view (the class of the item listener): `rvxOwner` (its field of the owner's type),
 * `rvxCurrentItem` (the queue's current item, asked as the view asks it when it binds). Added to the owner:
 * `rvxNavigate`, through the executor its press method navigates with, an interface method of the endpoint alone
 * (9.40.51, 9.15.51) or one of the endpoint, a context object and a null pair (8.30.54). The endpoint type is the
 * one the owner's one-argument calls of that kind take; the item gives the endpoint in a field of its watch
 * reference, the object its hash code is made of.
 *
 * Resolved by shape: listener `Lhvs.onClick` case 0 (9.40.51) / `Lnkd.onClick` (9.15.51) / `Lmwl.onClick` (8.30.54),
 * the one that calls the owner's press method `Lhvr.d` / `Lnjz.e` / `Lmwg.d`. The hook goes right after the listener
 * has its view, in the register that holds it, with a scratch register the listener overwrites before it reads it.
 * Resolved with the queue items and the queue start, see [installQueueItemRetarget]: all or none.
 */
private fun BytecodePatchContext.preparePillClick(
    item: ClassDef, listenerName: String, viewType: String,
): () -> String {
    val press = pillPressFingerprint.matchSingle()
    val owner = mutableClassDefBy(press.classDef.type)
    val view = mutableClassDefBy(viewType)

    // The endpoint is what the owner's one-argument calls take. The item gives it by its watch reference: the
    // object its hash code is made of, which holds the endpoint in a field of its own.
    val endpointTypes = owner.methods.flatMap { it.implementation?.instructions.orEmpty() }
        .filter { it.opcode == Opcode.INVOKE_INTERFACE }.mapNotNull { it.getReference<MethodReference>() }
        .filter { it.returnType == "V" && it.parameterTypes.size == 1 }
        .map { it.parameterTypes.single().toString() }.distinct()
    val hashed = item.methods.single { it.name == "hashCode" && it.parameterTypes.isEmpty() }
        .implementation!!.instructions.mapNotNull { it.getReference<MethodReference>() }
        .filter { it.definingClass == item.type && it.parameterTypes.isEmpty() }.map { it.name }.toSet()
    val holding = item.methods.filter { it.name in hashed }.mapNotNull { method ->
        val result = runCatching { classDefBy(method.returnType) }.getOrNull() ?: return@mapNotNull null
        val field = result.fields.singleOrNull {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.type in endpointTypes
        } ?: return@mapNotNull null
        method to field
    }.single()
    val referenceMethod = holding.first
    val endpointType = holding.second.type

    val calls = press.method.implementation!!.instructions
        .filter { it.opcode == Opcode.INVOKE_INTERFACE }.mapNotNull { it.getReference<MethodReference>() }
        .filter { it.returnType == "V" }.distinct()
    val single = calls.singleOrNull { it.parameterTypes.map(CharSequence::toString) == listOf(endpointType) }
    val triple = calls.singleOrNull {
        val types = it.parameterTypes.map(CharSequence::toString)
        types.size == 3 && types[0] == OBJECT && types[2] == "Landroid/util/Pair;"
    }
    val navigation = single ?: triple ?: error("no navigation call")
    val navigator = owner.fields.single {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == navigation.definingClass
    }

    val endpoint = "iget-object v0, v0, ${referenceMethod.returnType}->${holding.second.name}:$endpointType"
    val navigate = if (single != null) {
        "invoke-interface {v1, v0}, ${navigation.definingClass}->${navigation.name}($endpointType)V"
    } else {
        val context = owner.fields.single {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == navigation.parameterTypes[1].toString()
        }
        val signature = "$OBJECT${context.type}Landroid/util/Pair;"
        """
        iget-object v2, p0, ${owner.type}->${context.name}:${context.type}
        const/4 v3, 0x0
        invoke-interface {v1, v0, v2, v3}, ${navigation.definingClass}->${navigation.name}($signature)V
        """
    }

    // The view: where the listener has it, its owner field, and how the view asks the queue for the current item.
    val click = pillClickHook(owner.type, press.method.name, viewType)
    val ownerField = view.fields.single { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == owner.type }
    val current = currentItemCall(view, viewType, listenerName)
    val clickMethod = mutableClassDefBy(click.classType).findMutableMethodOf(click.method)
    val clickTarget = clickMethod.getInstruction(click.index)
    val ownerConstructors = owner.methods.filter { it.name == "<init>" }.takeIf { it.size == 1 }.orEmpty()

    return {
        owner.interfaces.add(PILL_OWNER)
        // The owner reports itself when it is built: the extension navigates with it when it starts a queue by itself.
        for (constructor in ownerConstructors) {
            constructor.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.reversed()
                .forEach { constructor.addInstructions(it, "invoke-static {p0}, $ON_PILL_OWNER") }
        }
        owner.addDownloadsBridge("rvxNavigate", listOf(OBJECT), "V", 6, """
            check-cast p1, ${item.type}
            invoke-virtual {p1}, ${item.type}->${referenceMethod.name}()${referenceMethod.returnType}
            move-result-object v0
            if-eqz v0, :done
            $endpoint
            iget-object v1, p0, ${owner.type}->${navigator.name}:${navigator.type}
            $navigate
            :done
            return-void
        """)

        view.interfaces.add(PILL_VIEW)
        view.addDownloadsBridge("rvxOwner", emptyList(), OBJECT, 2, """
            iget-object v0, p0, $viewType->${ownerField.name}:${owner.type}
            return-object v0
        """)
        view.addDownloadsBridge("rvxCurrentItem", emptyList(), OBJECT, 4, """
            iget-object v0, p0, $viewType->${current.queueField.name}:${current.queueField.type}
            iget-object v1, p0, $viewType->${current.flagField.name}:${current.flagField.type}
            invoke-virtual {v1}, ${current.flag}
            move-result v1
            invoke-virtual {v0, v1}, ${current.item}
            move-result-object v0
            return-object v0
        """)

        clickMethod.addInstructionsWithLabels(click.index, """
            invoke-static {${click.view}}, $ON_PILL_CLICK
            move-result ${click.scratch}
            if-eqz ${click.scratch}, :rvx_stock
            return-void
        """, ExternalLabel("rvx_stock", clickTarget))

        "AudioFirst: pill click ${click.classType}->${click.method.name}, owner press " +
            "${press.classDef.type}->${press.method.name}, navigates with ${navigation.definingClass}->" +
            "${navigation.name}, item reference ${referenceMethod.name}, owner reported by " +
            "${ownerConstructors.size} constructor"
    }
}

/** The method that builds a queue from a server response: it ends in the constructor of (items, selected, index). */
private val queueStartFingerprint = Fingerprint(
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            val call = it.getReference<MethodReference>()
            call != null && call.name == "<init>" && call.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/util/List;", "Lj\$/util/Optional;", "I")
        } == true
    },
)

/**
 * The queue of an album the app builds from the server's response starts at the item the response marks as selected,
 * and the response to a song's id marks none, so a queue started from the song of the third row would start at the
 * first. The method that builds the queue ends in the constructor of its result, which takes the list of items and the
 * position the queue starts at: the extension may choose another position, the row the user chose.
 *
 * Resolved by shape: `Liar.J` (9.40.51) / `Lnyb` (9.15.51) / `Lnko` (8.30.54), the one method that calls a constructor
 * of a list, an `Optional` and an int. Resolved with the queue items and the pill: all or none.
 */
private fun BytecodePatchContext.prepareQueueStart(): () -> String {
    val match = queueStartFingerprint.matchSingle()
    val method = mutableClassDefBy(match.classDef.type).findMutableMethodOf(match.method)
    val instructions = method.implementation!!.instructions.toList()
    val index = instructions.indexOfFirst {
        val call = it.getReference<MethodReference>()
        call != null && call.name == "<init>" && call.parameterTypes.size == 3 &&
            call.parameterTypes[2] == "I" && call.parameterTypes[0] == "Ljava/util/List;"
    }
    check(index >= 0) { "no queue constructor" }

    // invoke-direct {result, items, selected, position}
    val call = instructions[index] as FiveRegisterInstruction
    val items = method.registerName(call.registerD)
    val position = method.registerName(call.registerF)

    return {
        method.addInstructions(index, "invoke-static {$items, $position}, $START_INDEX\nmove-result $position")
        "AudioFirst: queue start ${match.classDef.type}->${match.method.name}, items $items, position $position"
    }
}

/**
 * The smali name of [register] in this method: the parameter registers (the receiver first, a long or a double taking
 * two) are the last of its registers and are named p0, p1, ...; every other is v<number>.
 */
internal fun Method.registerName(register: Int): String {
    val receiver = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val parameters = receiver + parameterTypes.sumOf { type ->
        if (type.toString() == "J" || type.toString() == "D") 2 else 1
    }
    val first = implementation!!.registerCount - parameters
    return if (register >= first) "p${register - first}" else "v$register"
}

/** Where the pill's click listener gets its view. */
private class PillClickHook(
    val classType: String,
    val method: Method,
    /** Index of the first instruction after the one that gives the listener its view. */
    val index: Int,
    /** Smali name of the register that holds the view there. */
    val view: String,
    /** Smali name of a register the listener overwrites before it reads it. */
    val scratch: String,
)

/** How the pill's view asks the queue for the current item: a flag read from one object, then `queue.item(flag)`. */
private class CurrentItemCall(
    val queueField: FieldReference,
    val flagField: FieldReference,
    val flag: String,
    val item: String,
)

private fun BytecodePatchContext.pillClickHook(
    ownerType: String, pressName: String, viewType: String,
): PillClickHook {
    val clickMatch = Fingerprint(
        name = "onClick",
        returnType = "V",
        custom = { method, classDef ->
            classDef.interfaces.contains("Landroid/view/View\$OnClickListener;") &&
                method.implementation?.instructions?.any {
                    val call = it.getReference<MethodReference>()
                    call != null && call.definingClass == ownerType && call.name == pressName &&
                        call.parameterTypes.isEmpty()
                } == true
        },
    ).matchSingle()

    val clickMethod = clickMatch.method
    val instructions = clickMethod.implementation!!.instructions.toList()

    // The listener's first use of the owner's field of the view is where it tests the gate and shows its message.
    val ownerIndex = instructions.indexOfFirst {
        it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>()?.let { field ->
            field.type == ownerType && field.definingClass == viewType
        } == true
    }
    if (ownerIndex < 0) error("the listener does not read the owner from the view")

    val ownerRead = instructions[ownerIndex] as TwoRegisterInstruction
    val viewRegister = ownerRead.registerB

    val viewIndex = (ownerIndex - 1 downTo 0).first {
        (instructions[it] as? OneRegisterInstruction)?.registerA == viewRegister
    }
    val insertion = viewIndex + 1
    val scratch = (0 until clickMethod.implementation!!.registerCount)
        .filter { it != viewRegister }.firstOrNull { instructions.overwritesBeforeReading(insertion, it) }
        ?: error("no register of the listener is free after it has its view")

    return PillClickHook(clickMatch.classDef.type, clickMethod, insertion, clickMethod.registerName(viewRegister),
        clickMethod.registerName(scratch))
}

/** The registers an instruction names. */
private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> emptyList()
}

private val DESTINATION_ONLY = setOf(
    Opcode.IGET, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN, Opcode.SGET, Opcode.SGET_OBJECT, Opcode.SGET_BOOLEAN,
    Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.NEW_INSTANCE, Opcode.MOVE_RESULT,
    Opcode.MOVE_RESULT_OBJECT,
)

/** Whether straight-line code from [from] writes [register] before anything reads it, with no branch in between. */
private fun List<Instruction>.overwritesBeforeReading(from: Int, register: Int): Boolean {
    for (instruction in subList(from, size)) {
        if (instruction is OffsetInstruction || !instruction.opcode.canContinue()) return false
        if (register !in instruction.registers()) continue

        val destination = (instruction as? OneRegisterInstruction)?.registerA
        val source = (instruction as? TwoRegisterInstruction)?.registerB
        return instruction.opcode in DESTINATION_ONLY && destination == register && source != register
    }
    return false
}

private fun currentItemCall(view: ClassDef, viewType: String, itemListenerName: String): CurrentItemCall {
    // `queue.item(flag)` is called right before the view's item listener gets its result, cast: it is the call three
    // instructions above the listener, and the flag is the boolean call two instructions above that, both in the one
    // method that calls the listener.
    for (method in view.methods) {
        val instructions = method.implementation?.instructions?.toList() ?: continue
        val listenerIndex = instructions.indexOfFirst {
            it.getReference<MethodReference>()?.let { call ->
                call.definingClass == viewType && call.name == itemListenerName && call.parameterTypes.size == 1
            } == true
        }
        if (listenerIndex < 5) continue

        val itemCall = instructions[listenerIndex - 3]
        val flagCall = instructions[listenerIndex - 5]
        val item = itemCall.getReference<MethodReference>() ?: continue
        val flag = flagCall.getReference<MethodReference>() ?: continue
        if (itemCall.opcode != Opcode.INVOKE_VIRTUAL && itemCall.opcode != Opcode.INVOKE_INTERFACE) continue
        if (flagCall.opcode != Opcode.INVOKE_VIRTUAL && flagCall.opcode != Opcode.INVOKE_INTERFACE) continue
        if (item.parameterTypes.map(CharSequence::toString) != listOf("Z") || item.returnType == "V") continue
        if (flag.parameterTypes.isNotEmpty() || flag.returnType != "Z") continue

        val instanceFields = view.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
        val queueFields = instanceFields.filter { it.type == item.definingClass }
        val flagFields = instanceFields.filter { it.type == flag.definingClass }
        if (queueFields.size != 1 || flagFields.size != 1) continue

        return CurrentItemCall(queueFields.single(), flagFields.single(), flag.toString(), item.toString())
    }
    error("the view does not read the current item before its item listener")
}

/**
 * The tap hook of [installAudioFirst]. It runs after every patch, because the playlist track tap patch hooks the very
 * same method at its start: installed last, this one runs FIRST whichever patch executed first, so the start is armed
 * (and a row of a downloaded album retargeted) on the command the app built, with its playlist, before the track tap
 * action turns it into a single-track or queue command. Each hook then continues with the command the previous
 * returned.
 *
 * When the command class cannot rebuild itself from bytes, only the arming is installed, with a warning.
 */
internal fun BytecodePatchContext.installAudioFirstCommandHook() {
    if (!audioFirstResolved) return

    try {
        val commandResolver = CommandResolverFingerprint.method
        val commandType = commandResolver.parameterTypes[0].toString()
        val rebuildable = mutableClassDefBy(commandType).interfaces.contains(NATIVE_COMMAND)

        if (rebuildable) {
            commandResolver.addInstructions(0, """
                invoke-static {p1}, $OVERRIDE_COMMAND
                move-result-object p1
                check-cast p1, $commandType
            """)
        } else {
            commandResolver.addInstructions(0, "invoke-static {p1}, $ON_COMMAND")
            printWarn("Start downloaded songs in audio mode cannot retarget an album row on this Music version: " +
                "$commandType cannot be rebuilt from bytes")
        }
        printInfo("AudioFirst: tap hook ${if (rebuildable) "rewrites" else "arms"} $commandType")
    } catch (ex: Exception) {
        printWarn("Start downloaded songs in audio mode lost its tap hook on this Music version: ${ex.message}")
    }
}

private var audioFirstResolved = false
