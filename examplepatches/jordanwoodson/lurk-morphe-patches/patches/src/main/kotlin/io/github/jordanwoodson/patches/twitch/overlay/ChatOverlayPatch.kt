package io.github.jordanwoodson.patches.twitch.overlay

import app.morphe.patcher.Fingerprint
import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import io.github.jordanwoodson.patches.twitch.shared.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.jordanwoodson.patches.shared.settings.ChoiceSetting
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.requireLocals
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.twitch.shared.freeRegister
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.chat.printedField
import io.github.jordanwoodson.patches.twitch.chat.LiveChatLineFingerprint
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val OVERLAY = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchChatOverlay;"
private const val CONTEXT_WRAPPER = "Landroid/content/ContextWrapper;"

@Suppress("unused")
val chatOverlayPatch = bytecodePatch(
    name = "Chat overlay",
    description = "Adds a switch that scrolls live chat messages right to left across the top of the video in " +
        "landscape (danmaku), as plain white text with the sender's name. Off until turned on in Lurk settings, " +
        "with choices for speed and number of lines. Native live channels only: not React Native chat, VODs or " +
        "chat replay. The overlay never takes touches.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)
    execute {
        val message = LiveChatLineFingerprint.twitchMatch("live chat message")
        val type = message.classDef.type
        val parent = message.classDef.superclass ?: throw PatchException("Twitch: live chat message has no parent")
        val sender = message.method.printedField(", sender=")
        val tokens = message.method.printedField(", messageTokens=")
        val tags = message.method.printedField(", messageTags=")
        if (tags.type != "Ljava/util/Map;") throw PatchException("Twitch: live message tags aren't a map")
        if (tokens.type != "Ljava/util/List;") throw PatchException("Twitch: live chat message tokens aren't a list")

        // The chat list's feeder: takes any chat list event and appends live messages to the list.
        val feeder = Fingerprint(
            returnType = "V",
            parameters = listOf(parent),
            custom = { method, classDef ->
                classDef.fields.any { it.type == CONTEXT_WRAPPER } &&
                    method.implementation?.instructions?.any {
                        it.opcode == Opcode.INSTANCE_OF && ((it as ReferenceInstruction).reference as TypeReference).type == type
                    } == true
            },
        ).twitchMatch("chat list feeder")
        val context = feeder.classDef.fields.singleOrNull { it.type == CONTEXT_WRAPPER }
            ?: throw PatchException("Twitch: chat list feeder has no single context")

        feeder.method.apply {
            val instructions = implementation!!.instructions
            val check = instructions.indexOfFirst {
                it.opcode == Opcode.INSTANCE_OF && ((it as ReferenceInstruction).reference as TypeReference).type == type
            }
            val cast = (check + 1 until instructions.size).firstOrNull {
                instructions[it].opcode == Opcode.CHECK_CAST &&
                    ((instructions[it] as ReferenceInstruction).reference as TypeReference).type == type
            } ?: throw PatchException("Twitch: chat list feeder doesn't cast live messages")
            if (cast - check > 4) throw PatchException("Twitch: live message branch changed")
            val live = (instructions[cast] as OneRegisterInstruction).registerA
            if (live > 15) throw PatchException("Twitch: live message register out of range")
            // Right after the cast: the message is about to be added to the list.
            val insert = cast + 1
            requireNotBranchTarget(insert, "live message branch")
            val a = freeRegister(insert, listOf(live), "chat overlay")
            val b = freeRegister(insert, listOf(live, a), "chat overlay")
            val c = freeRegister(insert, listOf(live, a, b), "chat overlay")
            val d = freeRegister(insert, listOf(live, a, b, c), "chat overlay tags")
            val e = freeRegister(insert, listOf(live, a, b, c, d), "chat overlay owner")
            addInstructions(insert, """
                move-object/from16 v$a, p0
                iget-object v$a, v$a, ${context.definingClass}->${context.name}:${context.type}
                iget-object v$b, v$live, $sender
                iget-object v$c, v$live, $tokens
                iget-object v$d, v$live, $tags
                move-object/from16 v$e, p0
                invoke-static { v$a, v$b, v$c, v$d, v$e }, $OVERLAY->onMessage(Landroid/content/Context;Ljava/lang/Object;Ljava/util/List;Ljava/util/Map;Ljava/lang/Object;)V
            """)
        }
        overlayLifecycle(feeder.classDef.type)

        twitchSettings.add(
            SwitchSetting("chat_overlay", "Chat overlay",
                "In landscape, live chat messages scroll across the top of the video. Native live channels only; " +
                    "touches still reach the player.",
                Section.CHAT, default = false),
            ChoiceSetting("chat_overlay_speed", "Chat overlay speed", "How fast messages cross the video.",
                Section.CHAT, "1", listOf("Slow" to "0", "Normal" to "1", "Fast" to "2")),
            ChoiceSetting("chat_overlay_lines", "Chat overlay lines", "How many lines of messages scroll at once.",
                Section.CHAT, "5", listOf("3" to "3", "5" to "5", "8" to "8")),
        )
    }
}

/** Exact viewer feeder ownership: view teardown and the stream observer, before another message arrives. */
private fun BytecodePatchContext.overlayLifecycle(feeder: String) {
    val fragment = "Ltv/twitch/android/feature/theatre/vertical/VerticalTheatreFragment;"
    val getter = Fingerprint(definingClass = fragment, returnType = feeder, parameters = emptyList(),
        strings = listOf("chatMessagesAdapterBinder")).twitchMatch("viewer overlay feeder")
    val owner = getter.method.implementation!!.instructions.mapNotNull {
        (it as? ReferenceInstruction)?.reference as? FieldReference
    }.singleOrNull { it.definingClass == fragment && it.type == feeder }
        ?: throw PatchException("Twitch: viewer feeder field changed")
    Fingerprint(definingClass = fragment, name = "onDestroyView", returnType = "V", parameters = emptyList())
        .twitchMatch("viewer overlay teardown").method.apply {
            // v0 is scratch at the method's start only while it is a local, not this.
            requireLocals(1)
            addInstructions(0, """
                move-object/from16 v0, p0
                iget-object v0, v0, $owner
                ${invokeStatic("$OVERLAY->dispose(Ljava/lang/Object;)V", 0)}
            """)
        }
    val stream = "Ltv/twitch/android/models/streams/StreamModel;"
    val channel = "Ltv/twitch/android/models/channel/ChannelModel;"
    val observer = Fingerprint(name = "emit", custom = { method, classDef ->
        classDef.fields.any { it.type == fragment } && method.implementation?.instructions?.any {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == stream && ref.name == "getChannel"
        } == true
    }).twitchMatch("viewer stream observer").method
    val instructions = observer.implementation!!.instructions.toList()
    val at = instructions.indices.singleOrNull { i ->
        val ref = (instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
        val consumer = (instructions.getOrNull(i+2) as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == stream && ref.name == "getChannel" && consumer?.returnType == "V" &&
            consumer.parameterTypes.map { it.toString() } == listOf(channel)
    } ?: throw PatchException("Twitch: viewer stream consumer changed")
    val start = at - 6
    val shape = listOf(Opcode.CHECK_CAST, Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL)
    if (start < 0 || instructions.subList(start,at+1).map { it.opcode } != shape ||
        ((instructions[start] as ReferenceInstruction).reference as? TypeReference)?.type != stream ||
        (instructions[start] as OneRegisterInstruction).registerA != 1 ||
        (instructions[start+2] as TwoRegisterInstruction).registerA != 0 ||
        (instructions[start+2] as TwoRegisterInstruction).registerB != 0 ||
        ((instructions[start+2] as ReferenceInstruction).reference as? FieldReference)?.definingClass != fragment ||
        (instructions[at] as FiveRegisterInstruction).registerC != 1) {
        throw PatchException("Twitch: viewer stream/fragment registers changed")
    }
    val insert = start+1
    observer.requireNotBranchTarget(insert,"viewer channel observer")
    // This switch case has two successors, both ending at the same return. The generic
    // straight-line allocator stops at IF_EQZ; prove this complete bounded tail instead.
    val end = at + 3
    val tail = instructions.subList(start, end + 1)
    val expected = shape + listOf(Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_OBJECT)
    val nullBranch = instructions[start + 1] as? BuilderOffsetInstruction
    if (tail.map { it.opcode } != expected || nullBranch?.target?.location?.index != end ||
        observer.implementation!!.tryBlocks.isNotEmpty() ||
        (instructions[end] as OneRegisterInstruction).registerA != 6 ||
        tail.any { instruction ->
            val registers = when (instruction) {
                is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD,
                    instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount)
                is TwoRegisterInstruction -> listOf(instruction.registerA, instruction.registerB)
                is OneRegisterInstruction -> listOf(instruction.registerA)
                else -> emptyList()
            }
            registers.any { it == 2 || it == 3 }
        }) throw PatchException("Twitch: viewer stream branch scratch registers changed")
    val a = 2
    val b = 3
    // A snippet with a label of its own must go in through addInstructionsWithLabels: plain addInstructions keeps
    // the label's address relative to the snippet, which is only right at index 0 (issue 49: the verifier
    // rejected this method, so every dual-format stream crashed the app).
    observer.addInstructionsWithLabels(insert,"""
        iget-object v$a, v0, $owner
        move-object v$b, v1
        if-eqz v$b, :lurk_overlay_no_channel
        invoke-virtual { v$b }, $stream->getChannelId()Ltv/twitch/android/models/Tuid;
        move-result-object v$b
        :lurk_overlay_no_channel
        invoke-static { v$a, v$b }, $OVERLAY->channel(Ljava/lang/Object;Ljava/lang/Object;)V
    """)
}
