package io.github.sabopura.morphe.patches.twitch.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.registerDeadAt
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import java.util.logging.Logger

private object AddHighlightRequested : Fingerprint(strings = listOf("AddHighlightRequested(highlightId="))
private object AddCommunityHighlight : Fingerprint(strings = listOf("AddCommunityHighlight(model="))
private object AddCommunityPill : Fingerprint(strings = listOf("AddCommunityPill(eventType="))
private object LeaderboardSettings : Fingerprint(strings = listOf("ChannelLeaderboardSettings(defaultLeaderboard=", ", isCheerEnabled="))
private object PrivateCalloutModel : Fingerprint(strings = listOf("PrivateCalloutsCommonModel(id=", ", type="))
private object PrivateCalloutReceived : Fingerprint(strings = listOf("PrivateCalloutReceived(privateCalloutsCommonModel="))

private fun Instruction.type() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type
private fun Instruction.call() = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

/** Clears the Bits and gift leaderboard flags where the settings object is built. Clips stay. */
private fun BytecodePatchContext.hideBitsLeaderboards() {
    val settings = LeaderboardSettings.originalClassDef
    val described = describedFields(settings)
    for (label in listOf(", isCheerEnabled=", ", isGiftSubEnabled=")) {
        val field = described[label] ?: throw PatchException("Highlights: leaderboard field $label moved")
        filterConstructorFlag(settings, field, "$LINE_HOOKS->leaderboardEnabled(Z)Z", this)
    }
}

/** Private pop-ups (watch streak reached, ...) all enter their presenter through one lambda case. */
private fun BytecodePatchContext.hideWatchStreaks() {
    val model = PrivateCalloutModel.originalClassDef
    val received = PrivateCalloutReceived.originalClassDef.type
    val typeField = model.fields.filter { field ->
        !AccessFlags.STATIC.isSet(field.accessFlags) && classDefByOrNull(field.type)?.fields?.any { it.name == "WATCH_STREAK_REACHED" } == true
    }.uniqueContract("private callout type field")
    fun isDispatch(m: Method) = m.name == "invoke" && m.returnType == "Ljava/lang/Object;" &&
        m.implementation?.instructions?.any { it.opcode == Opcode.NEW_INSTANCE && it.type() == received } == true
    val owner = classesMatching { c -> c.methods.any(::isDispatch) }.uniqueContract("private callout dispatch")
    val method = mutableClassDefBy(owner).methods.filter(::isDispatch).uniqueContract("private callout dispatch method")
    val code = method.instructions.toList()
    val create = code.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.type() == received }
    val cast = (create - 1 downTo 0).first { code[it].opcode == Opcode.CHECK_CAST }
    if (code[cast].type() != model.type) throw PatchException("Highlights: private callout model no longer cast first")
    val modelRegister = (code[cast] as OneRegisterInstruction).registerA
    val scratch = (code[create] as OneRegisterInstruction).registerA
    if (modelRegister > 15 || scratch > 15 || scratch == modelRegister || !registerDeadAt(method, cast + 1, scratch))
        throw PatchException("Highlights: no free register in the private callout dispatch")
    val unit = code.filter { it.opcode == Opcode.SGET_OBJECT }
        .map { (it as ReferenceInstruction).reference as FieldReference }
        .filter { it.type == it.definingClass }.distinct().uniqueContract("Unit in the private callout dispatch")
    method.addInstructionsWithLabels(cast + 1, """
        iget-object v$scratch, v$modelRegister, ${model.type}->${typeField.name}:${typeField.type}
        invoke-static {v$scratch}, $LINE_HOOKS->hideCallout(Ljava/lang/Enum;)Z
        move-result v$scratch
        if-eqz v$scratch, :keep
        sget-object v$scratch, $unit
        return-object v$scratch
    """, ExternalLabel("keep", method.getInstruction(cast + 1)))
}

/**
 * Twitch filters every community highlight event (hype trains, pinned messages, polls, …) before
 * its chat shows it. The filter is the case of a merged lambda that starts by casting the event
 * and returns Boolean.valueOf; right after the cast it gets a first check of its own, so the hide
 * options can drop additions of a highlight type. Only the two addition events (a highlight, a
 * hype train pill) are asked about; removals and everything else go straight on, so nothing
 * stays stuck on screen.
 */
internal val highlightFilterHook = bytecodePatch {
    extendWith("extensions/twitch.mpe")
    execute {
        val request = AddHighlightRequested.originalClassDef.type
        val added = AddCommunityHighlight.originalClassDef
        val event = added.superclass ?: throw PatchException("Highlights: event base type missing")
        val pill = AddCommunityPill.originalClassDef
        if (pill.superclass != event) throw PatchException("Highlights: the pill event has another base type")
        fun isFilter(m: Method) = m.name == "invoke" && m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;") &&
            m.implementation?.instructions?.let { code ->
                code.any { it.opcode == Opcode.NEW_INSTANCE && it.type() == request } &&
                    code.any { it.opcode == Opcode.INSTANCE_OF && it.type() == added.type }
            } == true
        val owner = classesMatching { c -> c.methods.any(::isFilter) }.uniqueContract("community highlight event filter")
        val method = mutableClassDefBy(owner).methods.filter(::isFilter).uniqueContract("community highlight filter method")
        val code = method.instructions.toList()
        val event1 = method.implementation!!.registerCount - 1
        val start = code.indices.filter { i ->
            code[i].opcode == Opcode.CHECK_CAST && (code[i] as OneRegisterInstruction).registerA == event1 &&
                code[i].type() == event && run {
                    val end = (i + 1 until code.size).firstOrNull { code[it].opcode == Opcode.RETURN_OBJECT } ?: code.size
                    (i until end).any { code[it].call() == "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" }
                }
        }.uniqueContract("community highlight filter case")
        val selector = code.filter { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH }
            .uniqueContract("community highlight lambda switch") as OneRegisterInstruction
        val scratch = selector.registerA
        if (scratch > 15 || event1 > 15 || !registerDeadAt(method, start + 1, scratch))
            throw PatchException("Highlights: no free register at the filter (selector v$scratch, event v$event1)")
        // After the cast, so the case still starts with it. "keep" is Twitch's own next
        // instruction: the label must name an instruction that occurs once in the method.
        val next = method.getInstruction(start + 1)
        method.addInstructionsWithLabels(start + 1, """
            instance-of v$scratch, v$event1, ${added.type}
            if-nez v$scratch, :ask
            instance-of v$scratch, v$event1, ${pill.type}
            if-eqz v$scratch, :keep
            :ask
            invoke-static {v$event1}, Lio/github/sabopura/morphe/extension/twitch/chat/ViewCustomization;->keepHighlight(Ljava/lang/Object;)Z
            move-result v$scratch
            if-nez v$scratch, :keep
            sget-object v$scratch, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            return-object v$scratch
        """, ExternalLabel("keep", next))
        Logger.getLogger("Sabopura.Chat").info("Highlights: filter hook in $owner after $start (event v$event1, scratch v$scratch)")
        hideBitsLeaderboards()
        hideWatchStreaks()
    }
}
