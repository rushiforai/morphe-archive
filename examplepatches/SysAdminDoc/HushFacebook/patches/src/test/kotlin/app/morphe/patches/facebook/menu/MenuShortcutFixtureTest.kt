/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.menu

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Test

/**
 * The Meta AI shortcut's anchor on every Facebook build the bundle declares: one Menu bookmarks
 * folder section whose children builder reads one bookmark list of its own class. Then the hook:
 * a list that's there goes through the extension and back through ImmutableList.copyOf into the
 * same register, a missing one skips straight to the builder's own next instruction, and the rest
 * of the builder is untouched. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips
 * without it.
 */
class MenuShortcutFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun Instruction.call(): String = ((this as ReferenceInstruction).reference as MethodReference).toString()

    @Test
    fun `each declared build hands the Menu's shortcut bookmarks to the extension as the section reads them`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val holders = FixtureDex.classesHolding(bundle, FOLDER_SECTION)
                    .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val builders = folderSectionBuilders(holders)
                assertEquals("$name: folder section builders loading \"$FOLDER_SECTION\"", 1, builders.size)
                val builder = builders.single()
                val section = holders.single { it.type == builder.definingClass }
                val read = bookmarkListRead(builder)
                assertNotNull("$name: no bookmark list read in ${builder.definingClass}->${builder.name}", read)
                val original = builder.code()

                val context = PatchContexts.of(listOf(section))
                val mutable = context.mutableClassDefBy(section.type).methods.single {
                    it.name == builder.name && it.parameterTypes.map(Any::toString) == builder.parameterTypes.map(Any::toString)
                }
                mutable.passBookmarksThroughShortcuts(read!!)
                val patched = mutable.code()

                assertEquals("$name: five instructions added", original.size + 5, patched.size)
                assertEquals("$name: the read stays where it was", original[read.index].opcode, patched[read.index].opcode)
                val check = patched[read.index + 1]
                assertEquals("$name: a missing list is left alone", Opcode.IF_EQZ, check.opcode)
                assertEquals("$name: the check reads the list", read.register, (check as OneRegisterInstruction).registerA)
                assertEquals("$name: and skips to the builder's own next instruction", read.index + 6,
                    (check as BuilderOffsetInstruction).target.location.index)
                val kept = patched[read.index + 2]
                assertEquals("$name: the extension", SHORTCUTS_KEPT, kept.call())
                assertEquals("$name: is handed the list", read.register, (kept as RegisterRangeInstruction).startRegister)
                assertEquals("$name: its answer", read.register, (patched[read.index + 3] as OneRegisterInstruction).registerA)
                val copy = patched[read.index + 4]
                assertEquals("$name: goes back into an ImmutableList", LIST_COPY_OF, copy.call())
                assertEquals("$name: from the same register", read.register, (copy as RegisterRangeInstruction).startRegister)
                assertEquals("$name: into the list's register", read.register,
                    (patched[read.index + 5] as OneRegisterInstruction).registerA)
                assertEquals("$name: the rest of the builder is untouched",
                    original.drop(read.index + 1).map { it.opcode }, patched.drop(read.index + 6).map { it.opcode })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
