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
import app.morphe.patches.facebook.media.progressbar.extendsType
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Share sheet items' people row on every Facebook build the bundle declares (#169): the body render
 * adds the row of people to its children three ways (built from its list when the sheet opens, from
 * a cache, and as the loading placeholder), and each of those adds becomes a call to the extension,
 * in place, with the same registers. On 585 the list-built and cached rows share one outlined add
 * (the cached row jumps to it), which becomes addRowThen. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it. Redex names differ between the arm64 and armv7
 * bundles (585 LX/0YkF on one, LX/0Yji on the other), so nothing here names a class.
 */
class ShareSheetPeopleFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun Instruction.called() = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

    @Test
    fun `each declared build's people row is added through the extension`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val holders = FixtureDex.classesHolding(bundle, SHARE_BODY_ANCHOR)
                val bodies = holders.flatMap { owner ->
                    owner.methods.filter { it.name == "render" && holdsString(it, SHARE_BODY_ANCHOR) }.map { owner to it }
                }
                assertEquals("$name: share sheet bodies", 1, bodies.size)
                val (bodyClass, body) = bodies.single()

                // Positive control on kept names: the same render builds the loading placeholder, and
                // the framework's own AbstractCollection.add is what the two rows go through.
                assertTrue("$name: the body never loads the placeholder's test id", holdsString(body, GLIMMER_ANCHOR))

                val code = body.code()
                // The classes the render's own static calls return, up their superclass chains, so a
                // helper returning a subclass of render's component (585) is judged as the patch does.
                val chain = mutableMapOf<String, ClassDef>()
                var wanted = code.mapNotNull { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                        ?.takeIf { it.definingClass == bodyClass.type && it.returnType.startsWith("L") }?.returnType
                }.toSet()
                while (wanted.isNotEmpty()) {
                    val found = FixtureDex.classes(bundle, wanted)
                    chain += found
                    wanted = found.values.mapNotNull { it.superclass }.filter { it !in chain }.toSet()
                }
                val superOf = { type: String -> chain[type]?.superclass }

                val helperAdds = helperRowAdds(body, superOf)
                val listAdds = listRowAdds(body)
                assertEquals("$name: helper-built people rows in the share sheet body", 2, helperAdds.size)
                assertEquals("$name: people rows built from their list", 1, listAdds.size)
                val adds = peopleRowAdds(body, superOf)
                assertEquals("$name: every people row add, once each",
                    (helperAdds + listAdds).map { it.index }.distinct().sorted(), adds.map { it.index })
                assertEquals("$name: nothing else reaches a people row add", null, sharedAddRefusal(code, helperAdds + listAdds))

                val adders = mutableListOf<ClassDef>()
                (helperAdds + listAdds).forEach { add ->
                    assertEquals("$name: the row at ${add.call} is its call's result", Opcode.MOVE_RESULT_OBJECT, code[add.call + 1].opcode)
                    val called = code[add.index].called()!!
                    if (add.next == null) {
                        assertEquals("$name: the add at ${add.index} is AbstractCollection.add",
                            "Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z", called)
                        assertEquals("$name: a plain add comes right after its row", add.call + 2, add.index)
                    } else {
                        // The shared add: the outlined "add the row, then the part after it" helper.
                        val owner = FixtureDex.classes(bundle, setOf(called.substringBefore("->"))).values.single()
                        val adder = owner.methods.single { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == called }
                        assertTrue("$name: $called adds the row, then the part after it", isPairAdd(adder))
                        adders += owner
                    }
                }
                helperAdds.forEach { add ->
                    val helper = (code[add.call] as ReferenceInstruction).reference as MethodReference
                    assertEquals("$name: its helper is the render class's own", bodyClass.type, helper.definingClass)
                    assertTrue("$name: its helper returns render's component or a subclass",
                        extendsType(helper.returnType, body.returnType, superOf))
                }
                // The list-built row is the one a share sheet opens with: its model is constructed
                // with the people list just before the builder call, and the placeholder anchor is
                // nowhere near it.
                val built = listAdds.single()
                val builder = (code[built.call] as ReferenceInstruction).reference as MethodReference
                val model = builder.parameterTypes.single().toString()
                val init = code.subList(built.call - 4, built.call).mapNotNull { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                        ?.takeIf { it.definingClass == model && it.name == "<init>" }
                }.single()
                assertTrue("$name: the row model takes the people list",
                    init.parameterTypes.any { it.toString() == "Ljava/util/List;" })
                assertTrue("$name: the list-built row comes before the placeholder",
                    built.call < helperAdds.maxOf { it.call })

                val context = PatchContexts.of((listOf(bodyClass) + chain.values + adders).distinctBy { it.type })
                shareSheetPeoplePatch.execute(context)
                val patched = context.mutableClassDefBy(body.definingClass).methods.single {
                    it.name == body.name && it.returnType == body.returnType &&
                        it.parameterTypes.map(CharSequence::toString) == body.parameterTypes.map(CharSequence::toString)
                }.code()
                assertEquals("$name: the hooks replace instructions in place", code.size, patched.size)
                adds.forEach { add ->
                    val hook = patched[add.index] as FiveRegisterInstruction
                    assertEquals("$name: it's an invoke-static", Opcode.INVOKE_STATIC, hook.opcode)
                    if (add.next == null) {
                        assertEquals("$name: the add at ${add.index} asks $ADD_PEOPLE_ROW", ADD_PEOPLE_ROW, hook.called())
                        assertEquals("$name: handed the children and the row", listOf(add.children, add.row),
                            listOf(hook.registerC, hook.registerD))
                    } else {
                        assertEquals("$name: the shared add at ${add.index} asks $ADD_PEOPLE_ROW_THEN", ADD_PEOPLE_ROW_THEN, hook.called())
                        assertEquals("$name: handed the row, the part after it and the children", listOf(add.row, add.next, add.children),
                            listOf(hook.registerC, hook.registerD, hook.registerE))
                    }
                }
                (helperAdds + listAdds).forEach { add ->
                    assertEquals("$name: Facebook's own result move stays put", code[add.call + 1].opcode, patched[add.call + 1].opcode)
                }
                assertEquals("$name: nothing else changed", code.indices.filter { code[it].called() != patched[it].called() }.toSet(),
                    adds.map { it.index }.toSet())
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun `the extension has the hook`() {
        val hook = ExtensionDex.classDef(SHARE_SHEET_PEOPLE).methods.singleOrNull { it.name == "addRow" }
        assertTrue("the extension has no ShareSheetPeople.addRow", hook != null)
        assertEquals("addRow's shape", ADD_PEOPLE_ROW, hook!!.descriptor())
        val shared = ExtensionDex.classDef(SHARE_SHEET_PEOPLE).methods.singleOrNull { it.name == "addRowThen" }
        assertTrue("the extension has no ShareSheetPeople.addRowThen", shared != null)
        assertEquals("addRowThen's shape", ADD_PEOPLE_ROW_THEN, shared!!.descriptor())
    }

    private companion object {
        const val GLIMMER_ANCHOR = "messenger_suggested_recipients_grid_glimmer"
    }
}
