package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** Keep the finger's original scrub position at the native chapter-release boundary. */
internal val chapterSnapHookPatch = bytecodePatch {
    dependsOn(afterglowExtensionPatch)
    execute {
        val bar = Fingerprint(name = "onDraw", returnType = "V", strings = listOf("timed_markers_width"))
        val release = Fingerprint(classFingerprint = bar,
            accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.FINAL),
            parameters = listOf(), returnType = "V", filters = listOf(
                fieldAccess(opcode = Opcode.IGET_WIDE, type = "J"),
                methodCall(smali = "Ljava/lang/Math;->abs(J)J"),
                literal(0.1f), literal(500L),
                methodCall(parameters = listOf("J"), returnType = "V", location = MatchAfterWithin(6)),
                fieldAccess(opcode = Opcode.IGET_WIDE, type = "J", location = MatchAfterImmediately())
            ))
        val method = release.method
        val instructions = method.implementation!!.instructions
        val requested = (instructions[release.instructionMatches.first().index] as ReferenceInstruction)
            .reference as FieldReference
        val compared = (instructions[release.instructionMatches.last().index] as ReferenceInstruction)
            .reference as FieldReference
        require(requested == compared) { "Chapter snap no longer compares its original scrub position" }
        val callIndex = release.instructionMatches[4].index
        val call = instructions[callIndex]
        val commit = (call as ReferenceInstruction).reference as MethodReference
        val registers = call.invokeRegisters
        require(call.opcode == Opcode.INVOKE_VIRTUAL && registers.size == 3
                && registers.all { it < 16 } && registers[2] == registers[1] + 1
                && commit.definingClass == requested.definingClass) { "Native scrub commit boundary changed" }
        val host = release.classDef
        val helper = "afterglow_scrubReleasePosition"
        require(host.methods.none { it.name == helper })
        host.methods.add(ImmutableMethod(host.type, helper,
            listOf(ImmutableMethodParameter("J", null, null)), "J",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
            MutableMethodImplementation(4)).toMutable().apply {
                addInstructionsWithLabels(0, """
                    invoke-static {}, $EXTENSION_PACKAGE/playback/PlayerBehavior;->disableChapterSnap()Z
                    move-result v0
                    if-eqz v0, :native_position
                    iget-wide p1, p0, ${requested.smali}
                    :native_position
                    return-wide p1
                """)
            })
        val args = registers.joinToString(", ") { "v$it" }
        // Replace the original branch target so every native release path reaches
        // the gate. Keep its seek and changed-position feedback after the decision.
        method.replaceInstruction(callIndex, "invoke-virtual { $args }, ${host.type}->$helper(J)J")
        method.addInstructions(callIndex + 1, """
            move-result-wide v${registers[1]}
            invoke-virtual { $args }, ${commit.smali}
        """)
        println("Afterglow chapter snap: ${method.definingClass}->${method.name}, original=${requested.smali}")
    }
}
