/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.sharesheet

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.comments.summaries.descriptor
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.namesString
import app.morphe.patches.facebook.feed.resolveStatic
import app.morphe.patches.facebook.misc.upsells.enumConstant
import app.morphe.patches.facebook.misc.upsells.isEnumNaming
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Share sheet items' group hooks on every Facebook build the bundle declares (#104): the footer's
 * Send to group button goes through the extension where its guards meet, so the paths that skip
 * the button run the hook too, and each of the three GROUP_PLUS new-group entries (two in the
 * sheet's body, one in its search row) has its boolean answered right after it's set and before
 * its if-eqz. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class ShareSheetGroupsFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun Instruction.called() = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

    private fun ClassDef.method(like: Method): Method = methods.single {
        it.name == like.name && it.returnType == like.returnType &&
            it.parameterTypes.map(CharSequence::toString) == like.parameterTypes.map(CharSequence::toString)
    }

    /** The renders loading [anchor] that [wanted] takes, as a literal or from a string table holding it (582's footer). */
    private fun renders(bundle: File, anchor: String, wanted: (Method) -> Boolean = { true }): List<Pair<ClassDef, Method>> {
        val holders = FixtureDex.classesHolding(bundle, anchor)
        val direct = holders.flatMap { owner ->
            owner.methods.filter { it.name == "render" && holdsString(it, anchor) && wanted(it) }.map { owner to it }
        }
        val tables = holders.associateBy { it.type }
        val resolve: (MethodReference) -> Method? = { call -> tables[call.definingClass]?.let { resolveStatic(it, call) } }
        val asked = FixtureDex.methodsWhere(bundle, { dex -> dex.methodSection.any { it.definingClass in tables } }) {
            it.name == "render" && !holdsString(it, anchor) && namesString(it, anchor, resolve) && wanted(it)
        }
        val owners = FixtureDex.classes(bundle, asked.map { it.definingClass }.toSet())
        return direct + asked.map { owners.getValue(it.definingClass) to it }
    }

    /** The code offset of each instruction in [code]. */
    private fun offsets(code: List<Instruction>): IntArray {
        val offsets = IntArray(code.size)
        var at = 0
        code.forEachIndexed { index, instruction -> offsets[index] = at; at += instruction.codeUnits }
        return offsets
    }

    @Test
    fun `each declared build's share sheet group buttons answer through the extension`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val icons = FixtureDex.classesHolding(bundle, GROUP_PLUS).filter { isEnumNaming(it, GROUP_ICON_NAMES) }
                assertEquals("$name: icon enums naming $GROUP_PLUS", 1, icons.size)
                val groupPlus = enumConstant(icons.single(), GROUP_PLUS)

                val footers = renders(bundle, SHARE_FOOTER_ANCHOR) { isShareFooter(it) }
                assertEquals("$name: share sheet footers", 1, footers.size)
                val (footerClass, footer) = footers.single()
                val button = sendToGroupButton(footer)
                assertNotNull("$name: the footer's Send to group button", button)
                val footerCode = footer.code()
                fun Instruction.buildsButton() = called()?.startsWith("$FDS_BUTTON-><init>(") == true
                assertEquals("$name: the footer builds two FDSButtons, Send to group then send", 2,
                    footerCode.count { it.buildsButton() })
                if (version == "582.0.0.50.54") {
                    // Positive control: 582 loads its "Send to group" label, string 0x7f144406 in the
                    // English pack it unpacks to app_strings, a few instructions before the first FDSButton.
                    val built = footerCode.indexOfFirst { it.buildsButton() }
                    assertTrue("$name: the first FDSButton isn't the one labelled Send to group",
                        footerCode.subList(0, built).takeLast(40).any { (it as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f144406 })
                }

                val bodies = renders(bundle, SHARE_BODY_ANCHOR)
                assertEquals("$name: share sheet bodies", 1, bodies.size)
                val (bodyClass, body) = bodies.single()
                val bodyGuards = newGroupGuards(body, groupPlus)
                assertEquals("$name: new-group entries in the sheet's body", 2, bodyGuards.size)
                val searches = renders(bundle, SHARE_SEARCH_ROW_ANCHOR)
                assertEquals("$name: share sheet search rows", 1, searches.size)
                val (searchClass, search) = searches.single()
                val searchGuards = newGroupGuards(search, groupPlus)
                assertEquals("$name: new-group buttons in the search row", 1, searchGuards.size)
                assertEquals("$name: the search row's guard is its own field", Opcode.IGET_BOOLEAN,
                    search.code()[searchGuards.single().insertAt - 1].opcode)

                // The footer anchor's holders too, since 582's footer asks one of them, a string table, for it.
                val pool = (icons + footerClass + bodyClass + searchClass + FixtureDex.classesHolding(bundle, SHARE_FOOTER_ANCHOR))
                    .associateBy { it.type }.values
                val context = PatchContexts.of(pool)
                shareSheetGroupsPatch.execute(context)

                // The footer: three instructions where the guards meet, and every branch that skipped
                // the button now lands on the first of them.
                val patchedFooter = context.mutableClassDefBy(footer.definingClass).method(footer).code()
                assertEquals("$name: three instructions in the footer", footerCode.size + 3, patchedFooter.size)
                val at = button!!.insertAt
                val call = patchedFooter[at]
                assertEquals("$name: the footer asks $SEND_TO_GROUP_BUTTON", SEND_TO_GROUP_BUTTON, call.called())
                assertEquals("$name: handed v${button.register}", listOf(button.register, 1),
                    listOf((call as RegisterRangeInstruction).startRegister, call.registerCount))
                assertEquals("$name: its answer back in v${button.register}", listOf(Opcode.MOVE_RESULT_OBJECT, button.register),
                    listOf(patchedFooter[at + 1].opcode, (patchedFooter[at + 1] as OneRegisterInstruction).registerA))
                assertEquals("$name: cast back to FDSButton", listOf(Opcode.CHECK_CAST, button.register, FDS_BUTTON),
                    listOf(patchedFooter[at + 2].opcode, (patchedFooter[at + 2] as OneRegisterInstruction).registerA,
                        ((patchedFooter[at + 2] as ReferenceInstruction).reference as TypeReference).type))
                assertEquals("$name: Facebook's own instruction follows", footerCode[at].opcode, patchedFooter[at + 3].opcode)
                val offsets = offsets(footerCode)
                val skips = (0 until at).filter {
                    val branch = footerCode[it] as? OffsetInstruction
                    branch != null && offsets[it] + branch.codeOffset == offsets[at]
                }
                assertTrue("$name: no branch skips the Send to group button", skips.isNotEmpty())
                skips.forEach {
                    assertSame("$name: the branch at $it lands on the hook", patchedFooter[at],
                        (patchedFooter[it] as BuilderOffsetInstruction).target.location.instruction)
                }

                // The body and the search row: two instructions after each guard's boolean is set.
                listOf(body to bodyGuards, search to searchGuards).forEach { (render, guards) ->
                    val original = render.code()
                    val patched = context.mutableClassDefBy(render.definingClass).method(render).code()
                    assertEquals("$name: two instructions per new-group entry in ${render.definingClass}",
                        original.size + 2 * guards.size, patched.size)
                    guards.sortedBy { it.insertAt }.forEachIndexed { earlier, guard ->
                        val placed = guard.insertAt + 2 * earlier
                        val ask = patched[placed]
                        assertEquals("$name: the entry asks $OFFER_NEW_GROUP", OFFER_NEW_GROUP, ask.called())
                        assertEquals("$name: handed v${guard.register}", listOf(guard.register, 1),
                            listOf((ask as RegisterRangeInstruction).startRegister, ask.registerCount))
                        assertEquals("$name: its answer back in v${guard.register}", listOf(Opcode.MOVE_RESULT, guard.register),
                            listOf(patched[placed + 1].opcode, (patched[placed + 1] as OneRegisterInstruction).registerA))
                        assertEquals("$name: Facebook's own instruction follows", original[guard.insertAt].opcode,
                            patched[placed + 2].opcode)
                    }
                    val guarded = guards.map { original[it.insertAt] }
                    assertTrue("$name: every hook sits right before its if-eqz",
                        guarded.zip(guards).all { (next, guard) ->
                            next.opcode == Opcode.IF_EQZ && (next as OneRegisterInstruction).registerA == guard.register
                        })
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun `the extension has both hooks`() {
        val methods = ExtensionDex.classDef(SHARE_SHEET_GROUPS).methods
        val button = methods.singleOrNull { it.name == "sendToGroupButton" }
        val entry = methods.singleOrNull { it.name == "offerNewGroup" }
        assertTrue("the extension has no ShareSheetGroups.sendToGroupButton", button != null)
        assertTrue("the extension has no ShareSheetGroups.offerNewGroup", entry != null)
        assertEquals("sendToGroupButton's shape", SEND_TO_GROUP_BUTTON, button!!.descriptor())
        assertEquals("offerNewGroup's shape", OFFER_NEW_GROUP, entry!!.descriptor())
    }
}
