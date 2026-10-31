/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.feedsound

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.junit.Assert.assertEquals
import org.junit.Test
import java.io.File

/**
 * Keep feed videos muted on each declared Facebook build: the feed sound state's session setter
 * asks the extension for its flag before anything reads it, and its reasoned setter asks right
 * after reading the flag the state holds, each answer going back in the flag's own register, with
 * the rest of both methods as Facebook wrote it.
 */
class KeepFeedVideosMutedFixtureTest {
    private fun bundles(check: (File) -> Unit) {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                check(bundle)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun same(a: Method, b: Method) = a.name == b.name && a.returnType == b.returnType &&
        a.parameterTypes.map(CharSequence::toString) == b.parameterTypes.map(CharSequence::toString)

    @Test
    fun `each declared build's feed sound setters ask before the flag is used`() = bundles { bundle ->
        val starts = FixtureDex.methodsWhere(bundle, { true }, ::startsSession)
        // Probed on 583 (2026-10-21): one sound state, whose session start hands a flag to EkI.
        assertEquals("${bundle.name}: classes starting a sound session", 1, starts.size)
        val type = starts.single().definingClass
        val owners = FixtureDex.classes(bundle, setOf(type))
        val context = PatchContexts.of(owners.values)
        val state = context.feedSoundState()
        assertEquals("${bundle.name}: the sound state", type, state.owner)
        assertEquals("${bundle.name}: the sound flag's type", "Z", state.field.type)

        val change = owners.getValue(type).methods.single { same(it, state.change) }
        val changeCode = change.implementation!!.instructions.toList()
        val session = owners.getValue(type).methods.single { same(it, state.session) }
        val sessionCode = session.implementation!!.instructions.toList()
        context.askFeedSound(state)
        val mutable = context.mutableClassDefBy(type)

        val where = "${bundle.name}: $type->${change.name}"
        val body = mutable.methods.single { same(it, change) }.implementation!!.instructions.toList()
        assertEquals("$where: two instructions added", changeCode.size + 2, body.size)
        val at = state.askAt
        // 585 bumps a counter before the read, so the read is not always first; the ask sits right after it.
        assertEquals("$where: the read stays right before the ask", Opcode.IGET_BOOLEAN, body[at - 1].opcode)
        assertEquals("$where: the read is of the sound flag", state.field.toString(), (body[at - 1] as ReferenceInstruction).reference.toString())
        assertEquals("$where: the read lands in the current flag's register", state.current, (body[at - 1] as OneRegisterInstruction).registerA)
        val ask = body[at]
        assertEquals("$where: the ask's form", Opcode.INVOKE_STATIC, ask.opcode)
        assertEquals("$where: the ask", OWN_SOUND_CHANGE, (ask as ReferenceInstruction).reference.toString())
        val asked = ask as FiveRegisterInstruction
        assertEquals("$where: the ask's registers", listOf(state.reason, state.changeFlag, state.current),
            listOf(asked.registerC, asked.registerD, asked.registerE))
        val answer = body[at + 1]
        assertEquals("$where: the answer's form", Opcode.MOVE_RESULT, answer.opcode)
        assertEquals("$where: the answer's register", state.changeFlag, (answer as OneRegisterInstruction).registerA)
        for (index in changeCode.indices) {
            val patchedIndex = if (index < at) index else index + 2
            assertEquals("$where: instruction $index", changeCode[index].opcode, body[patchedIndex].opcode)
        }

        val sessionWhere = "${bundle.name}: $type->${session.name}"
        val sessionBody = mutable.methods.single { same(it, session) }.implementation!!.instructions.toList()
        assertEquals("$sessionWhere: two instructions added", sessionCode.size + 2, sessionBody.size)
        val sessionAsk = sessionBody[0]
        assertEquals("$sessionWhere: the ask's form", Opcode.INVOKE_STATIC_RANGE, sessionAsk.opcode)
        assertEquals("$sessionWhere: the ask", OWN_SESSION_SOUND, (sessionAsk as ReferenceInstruction).reference.toString())
        assertEquals("$sessionWhere: the ask reads the flag", state.sessionFlag, (sessionAsk as RegisterRangeInstruction).startRegister)
        assertEquals("$sessionWhere: the ask reads one register", 1, sessionAsk.registerCount)
        val sessionAnswer = sessionBody[1]
        assertEquals("$sessionWhere: the answer's form", Opcode.MOVE_RESULT, sessionAnswer.opcode)
        assertEquals("$sessionWhere: the answer's register", state.sessionFlag, (sessionAnswer as OneRegisterInstruction).registerA)
        for (at in sessionCode.indices) assertEquals("$sessionWhere: instruction $at", sessionCode[at].opcode, sessionBody[at + 2].opcode)
    }
}
