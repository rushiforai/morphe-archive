/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.downloads.photo

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.comments.options.GRAPHQL_COMMENT
import app.morphe.patches.facebook.downloads.video.ATTACHMENTS_FIELD
import app.morphe.patches.facebook.downloads.video.IMMUTABLE_LIST
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.layout.theme.branchTargets
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Download any photo's Save GIF row (#226) on every Facebook build the bundle declares (arm64 and
 * armv7): one comment sheet render builds Save photo's row from the comment's attachments, and after
 * the hook the render asks the extension for a GIF row right after its rows are counted, builds it
 * with Save photo's own builder and icon, and leaves the rest Facebook's. Reads the fixture bundles
 * from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class CommentGifFixtureTest {
    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.called() = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

    /** GraphQLComment and every class with a method holding the sheet's name, in [bundle]. */
    private fun classes(bundle: java.io.File): Pair<ClassDef?, List<ClassDef>> {
        var comment: ClassDef? = null
        val sheets = mutableListOf<ClassDef>()
        FixtureDex.forEach(bundle) { dex ->
            for (classDef in dex.classes) {
                if (classDef.type == GRAPHQL_COMMENT) comment = ImmutableClassDef.of(classDef)
                if (classDef.methods.any { holdsString(it, COMMENT_SHEET_SOCKET) }) sheets += ImmutableClassDef.of(classDef)
            }
        }
        return comment to sheets
    }

    @Test
    fun `each declared build's comment sheet asks the extension for a GIF row after Save photo`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        val abis = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val (comment, sheets) = classes(bundle)
                assertNotNull("$name: no GraphQLComment", comment)
                val getters = comment!!.methods.filter { method ->
                    method.parameterTypes.isEmpty() && method.returnType == IMMUTABLE_LIST &&
                        method.body().any { (it as? NarrowLiteralInstruction)?.narrowLiteral == ATTACHMENTS_FIELD }
                }
                assertEquals("$name: GraphQLComment's attachments getters", 1, getters.size)
                val getter = getters.single().name

                val taken = sheets.flatMap { owner -> owner.methods.filter { commentGifPoint(it, getter) != null }.map { owner to it } }
                assertEquals("$name: methods the patch takes", 1, taken.size)
                val (owner, render) = taken.single()
                // Negative control: the same render read through another getter isn't taken.
                assertNull("$name: a wrong getter still matched", commentGifPoint(render, getter + "x"))
                val point = commentGifPoint(render, getter)!!
                val original = render.body()
                assertEquals("$name: the hook follows the empty test", Opcode.IF_NEZ, original[point.insert - 1].opcode)
                assertTrue("$name: the short call forms take the context and list", point.context <= 15 && point.list <= 15)

                val context = PatchContexts.of(listOf(owner, comment))
                with(context) { commentSheetGifRow()() }
                val hooked = context.mutableClassDefBy(owner.type).methods.single {
                    it.name == render.name && it.parameterTypes.map(CharSequence::toString) == render.parameterTypes.map(CharSequence::toString)
                }.body()
                val added = 14
                assertEquals("$name: the row's code and nothing else", original.size + added, hooked.size)
                val at = point.insert
                assertEquals("$name: hands over the comment", point.comment,
                    (hooked[at] as TwoRegisterInstruction).registerB)
                assertEquals("$name: asks for the row's tap", GIF_ROW_CLICK, hooked[at + 1].called())
                assertEquals("$name: news up Facebook's row-click", point.wrapperInit, hooked[at + 6].called())
                assertEquals("$name: asks for the title", GIF_ROW_TITLE, hooked[at + 7].called())
                assertEquals("$name: with Save photo's icon", point.icon, (hooked[at + 9] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals("$name: builds it with Save photo's builder", point.builder, hooked[at + 10].called())
                assertEquals("$name: in the component context", point.context, (hooked[at + 10] as FiveRegisterInstruction).registerD)
                assertEquals("$name: adds it to the rows", point.add, hooked[at + 13].called())
                assertEquals("$name: to the list", point.list, (hooked[at + 13] as FiveRegisterInstruction).registerC)
                assertTrue("$name: no row jumps to Facebook's next instruction", (at + added) in branchTargets(hooked))
                assertEquals("$name: Facebook's code goes on", original[at].opcode, hooked[at + added].opcode)
                val rest = hooked.filterIndexed { index, _ -> index !in at until at + added }
                assertEquals("$name: the rest is Facebook's", original.map { it.opcode }, rest.map { it.opcode })
                for (index in at until at + added) {
                    val registers = when (val instruction = hooked[index]) {
                        is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE,
                            instruction.registerF, instruction.registerG).take(instruction.registerCount)
                        is OneRegisterInstruction -> listOf(instruction.registerA)
                        else -> emptyList()
                    }
                    val written = (hooked[index] as? OneRegisterInstruction)
                        ?.takeIf { hooked[index].opcode.setsRegister() }?.registerA
                    assertTrue("$name: the row writes over the comment, context or list",
                        written == null || written !in listOf(point.comment, point.context, point.list))
                    assertTrue("$name: a register past v15", registers.all { it <= 15 })
                }
                checked += version
                abis += name.substringAfter("-$version-").substringBefore(".apkm")
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
        assertEquals("an ABI went unchecked", Fixtures.declaredAbis(), abis)
    }

    @Test
    fun `the extension has the hooks`() {
        for (hook in listOf(GIF_ROW_CLICK, GIF_ROW_TITLE)) {
            val type = hook.substringBefore("->")
            val name = hook.substringAfter("->").substringBefore("(")
            val method = ExtensionDex.classDef(type).methods.singleOrNull { it.name == name }
            assertNotNull("the extension has no CommentGif.$name", method)
            assertEquals("$name's shape", hook,
                "${method!!.definingClass}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}")
            assertTrue("$name isn't static", AccessFlags.STATIC.isSet(method.accessFlags))
            assertTrue("$name isn't public", AccessFlags.PUBLIC.isSet(method.accessFlags))
        }
    }
}
