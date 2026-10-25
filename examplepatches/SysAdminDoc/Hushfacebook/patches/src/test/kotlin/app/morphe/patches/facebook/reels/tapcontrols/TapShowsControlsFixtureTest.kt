/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels.tapcontrols

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Tap shows the controls on each declared Facebook build: the reel tap handler's config gate, its
 * unified player check and unified hide delay, and the controls' controller's hide wait, each go through the extension
 * into the same register right after Facebook reads them, with the rest of both methods as Facebook
 * wrote it. SettingsStatus says the patch is in.
 *
 * Read from 584 (2026-10-24): the handler `LX/8bK;->A0E`, its gate `LX/A6n;->AlR()Z`, its check `LX/8mO;->A01`, and the show
 * method `LX/8rP;->A04` with its 1000 ms wait. None of those names is used here.
 */
class TapShowsControlsFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    private fun same(a: Method, b: Method) = a.name == b.name && a.returnType == b.returnType &&
        a.parameterTypes.map(CharSequence::toString) == b.parameterTypes.map(CharSequence::toString)

    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    /** Checks the ask and its move-result at [at] in [body], and returns the two indices it added. */
    private fun assertAsk(where: String, body: List<Instruction>, at: Int, call: String, site: Site, wide: Boolean): List<Int> {
        val ask = body[at]
        assertEquals("$where: the ask's form", Opcode.INVOKE_STATIC_RANGE, ask.opcode)
        assertEquals("$where: the ask", call, (ask as ReferenceInstruction).reference.toString())
        assertEquals("$where: the ask reads the answer", site.register, (ask as RegisterRangeInstruction).startRegister)
        assertEquals("$where: the ask reads the whole answer", if (wide) 2 else 1, ask.registerCount)
        val answer = body[at + 1]
        assertEquals("$where: the answer", if (wide) Opcode.MOVE_RESULT_WIDE else Opcode.MOVE_RESULT, answer.opcode)
        assertEquals("$where: the answer's register", site.register, (answer as OneRegisterInstruction).registerA)
        return listOf(at, at + 1)
    }

    @Test
    fun `each declared build's reel tap asks the extension`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val classes = mutableMapOf<String, ClassDef>()
                FixtureDex.forEach(bundle) { dex -> dex.classes.associateByTo(classes) { it.type } }

                val handlers = classes.values.flatMap { owner -> owner.methods.filter(::isTapHandler) }
                assertEquals("$name: one reel tap handler, found ${handlers.map { "${it.definingClass}->${it.name}" }}",
                    1, handlers.size)
                val handler = handlers.single()
                val gate = gateOf(handler)
                val unifiedWait = unifiedWaitOf(handler)
                val skip = unifiedSkipOf(handler, unifiedWait)
                val showCall = controllerShowOf(handler)
                val showOwner = classes[showCall.definingClass]
                assertTrue("$name: the controller ${showCall.definingClass} is in the app", showOwner != null)
                val show = showOwner!!.methods.single {
                    it.name == showCall.name && it.parameterTypes.map(CharSequence::toString) == showCall.parameterTypes.map(CharSequence::toString)
                }
                val wait = hideWaitOf(show)
                assertEquals("$name: Facebook's own wait is a second", 1000L,
                    (show.code()[wait.after] as WideLiteralInstruction).wideLiteral)

                val owners = setOf(handler.definingClass, show.definingClass).map { classes.getValue(it) }
                val context = PatchContexts.of(owners + ExtensionDex.classDef(SETTINGS_STATUS))
                tapShowsControlsPatch.execute(context)

                val code = handler.code()
                val body = context.mutableClassDefBy(handler.definingClass).methods.single { same(it, handler) }.code()
                val where = "$name: ${handler.definingClass}->${handler.name}"
                assertEquals("$where: two instructions added after the gate, the check and the wait", code.size + 6, body.size)
                assertEquals("$where: the check sits right before the wait's read", unifiedWait.after - 3, skip.after)
                val inOrder = listOf(gate to GATE_CALL, skip to SKIP_CALL, unifiedWait to UNIFIED_WAIT_CALL).sortedBy { it.first.after }
                val added = inOrder.flatMapIndexed { shifted, (site, call) ->
                    assertAsk("$where after ${site.after}", body, site.after + 1 + 2 * shifted, call, site, wide = false)
                }
                assertEquals("$where: everything else as Facebook wrote it", code.map { it.opcode },
                    body.indices.filterNot { it in added }.map { body[it].opcode })

                val showCode = show.code()
                val showBody = context.mutableClassDefBy(show.definingClass).methods.single { same(it, show) }.code()
                val showWhere = "$name: ${show.definingClass}->${show.name}"
                assertEquals("$showWhere: two instructions added after the wait", showCode.size + 2, showBody.size)
                val showAdded = assertAsk(showWhere, showBody, wait.after + 1, WAIT_CALL, wait, wide = true)
                assertEquals("$showWhere: everything else as Facebook wrote it", showCode.map { it.opcode },
                    showBody.indices.filterNot { it in showAdded }.map { showBody[it].opcode })

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "tapShowsControls" }.code()
                assertEquals("$name: SettingsStatus answers first", listOf(Opcode.CONST_4, Opcode.RETURN),
                    status.take(2).map { it.opcode })
                assertEquals("$name: SettingsStatus says the patch is in", 1L,
                    (status.first() as WideLiteralInstruction).wideLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
