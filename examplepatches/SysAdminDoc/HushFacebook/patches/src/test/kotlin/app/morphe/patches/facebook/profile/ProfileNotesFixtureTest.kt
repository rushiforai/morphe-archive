/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.profile

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Hide profile notes on every declared build: two Bloks node classes, their child getters, one of them
 * wrapping a lone child, and after the hook every list they return goes through the extension
 * first.
 *
 * Read from 584 (2026-10-23): `LX/3SH;` with getters `BAT` (the singletonList one) and `Bgi`,
 * and `LX/5Cl;` with its own two. None of those names is used here.
 */
class ProfileNotesFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    @Test
    fun `every list the Bloks node hands out goes through the extension, on each declared build`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val found = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex -> dex.classes.filterTo(found, ::isBloksNode) }
                // The node the interpreter builds and the lighter one read from a parsed layout.
                assertEquals("$name: two Bloks node classes, found ${found.map { it.type }}", 2, found.size)
                val nodes = found.map { ImmutableClassDef.of(it) }
                val getters = childGetters(nodes)
                for (node in nodes) {
                    assertEquals("$name: ${node.type} has a layout getter and a plain one", 2,
                        getters.count { it.definingClass == node.type })
                }
                assertEquals("$name: one getter wraps a lone child in singletonList", 1, getters.count(::wrapsALoneChild))
                val before = getters.associate { "${it.definingClass}->${it.name}" to it.implementation!!.instructions.toList() }

                val context = PatchContexts.of(nodes)
                with(context) {
                    childGetters(bloksNodes()).forEach { getter ->
                        mutableClassDefBy(getter.definingClass).methods.single { it.name == getter.name && isChildGetter(it) }
                            .filterChildren()
                    }
                }

                val hooked = nodes.flatMap { context.mutableClassDefBy(it.type).methods.filter(::isChildGetter) }
                assertEquals("$name: every getter is still there", before.keys, hooked.map { "${it.definingClass}->${it.name}" }.toSet())
                for (getter in hooked) {
                    val key = "${getter.definingClass}->${getter.name}"
                    val after = getter.implementation!!.instructions.toList()
                    val returns = after.indices.filter { after[it].opcode == Opcode.RETURN_OBJECT }
                    assertEquals("$name: $key returns as often as before",
                        before.getValue(key).count { it.opcode == Opcode.RETURN_OBJECT }, returns.size)
                    for (index in returns) {
                        val list = (after[index] as OneRegisterInstruction).registerA
                        val call = after[index - 2]
                        assertEquals("$name: $key asks the extension before it returns",
                            PROFILE_NOTES_CHILDREN, (call as ReferenceInstruction).reference.toString())
                        assertEquals("$name: $key hands it the list it returns", Opcode.INVOKE_STATIC_RANGE, call.opcode)
                        assertEquals("$name: $key returns the answer", Opcode.MOVE_RESULT_OBJECT, after[index - 1].opcode)
                        assertEquals("$name: $key into the same register", list,
                            (after[index - 1] as OneRegisterInstruction).registerA)
                    }
                    assertEquals("$name: $key is otherwise as it was",
                        before.getValue(key).size + 2 * returns.size, after.size)
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
