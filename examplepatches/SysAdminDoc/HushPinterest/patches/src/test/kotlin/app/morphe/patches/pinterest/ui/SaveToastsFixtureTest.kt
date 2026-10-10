/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** Pinterest's toast container and the save confirmation models in each declared APK. */
@Category(FixtureTests::class)
class SaveToastsFixtureTest {
    @Test
    fun `each declared original APK drops only the save toasts before the container builds them`() {
        for (build in Fixtures.declaredBuilds()) {
            val (classes, model) = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            hideSaveToastsPatch.execute(context)
            for (flag in listOf("hideSaveToasts", "saveToasts")) {
                val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.implementation!!.instructions.first()
                assertEquals("${build.name}: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
            }
            val readers = { names: (FieldReference) -> Boolean -> classes.filter { owner -> owner.type != model &&
                owner.methods.any { method -> method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let(names) == true } == true } }.map { it.type }.toSet() }
            val saved = readers { it.type == "I" && it.name in SAVE_TOAST_STRINGS }
            val follow = readers { it.name == FOLLOW_UPSELL && it.type == it.definingClass }
            assertTrue("${build.name}: saved-to toasts $saved", saved.size >= 3)
            assertEquals("${build.name}: follow suggestion", 1, follow.size)
            val stub = context.mutableClassDefBy(UI_HOOKS).methods.single { it.name == "isSaveToast" }.implementation!!.instructions.toList()
            val checked = stub.filter { it.opcode == Opcode.INSTANCE_OF }.map { ((it as ReferenceInstruction).reference as TypeReference).type }
            assertEquals(build.name, (saved + follow).sorted(), checked.sorted())
            val show = context.mutableClassDefBy(TOAST_CONTAINER).methods.single { method ->
                method.parameterTypes.singleOrNull()?.toString() == model }
            val body = show.implementation!!.instructions.toList()
            val hook = (body[0] as ReferenceInstruction).reference as MethodReference
            assertEquals(build.name, "$UI_HOOKS->hideSaveToast(Ljava/lang/Object;)Z", "${hook.definingClass}->${hook.name}(Ljava/lang/Object;)Z")
            assertEquals(build.name, listOf(show.implementation!!.registerCount - 1), (body[0] as FiveRegisterInstruction).let {
                listOf(it.registerC).take(it.registerCount) })
            assertEquals(build.name, listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), body.subList(1, 4).map { it.opcode })
        }
    }

    @Test
    fun `missing container or status stub refuses before any change`() {
        val (classes, _) = read(Fixtures.declaredBuilds().last())
        val extension = ExtensionDex.classes()
        val cases = linkedMapOf(
            "missing container" to extension + classes.filterNot { it.type == TOAST_CONTAINER },
            "missing status stub" to classes + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
                ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                    owner.annotations, owner.fields, owner.methods.filterNot { it.name == "saveToasts" }) },
            "no save toasts" to extension + classes.filter { it.type == TOAST_CONTAINER },
        )
        for ((reason, input) in cases) {
            val context = PatchContexts.of(input)
            val before = snapshot(context, input)
            assertThrows(reason, PatchException::class.java) { hideSaveToastsPatch.execute(context) }
            assertArrayEquals("$reason left retained edits", before, snapshot(context, input))
        }
    }

    private fun snapshot(context: BytecodePatchContext, classes: List<ClassDef>): ByteArray {
        val pool = DexPool(Opcodes.getDefault())
        classes.forEach { pool.internClass(context.mutableClassDefBy(it.type)) }
        val store = MemoryDataStore()
        try {
            pool.writeTo(store)
            return store.data
        } finally {
            store.close()
        }
    }

    /** The container, the toast model base and every class extending it. */
    private fun read(build: File): Pair<List<ClassDef>, String> {
        val all = mutableMapOf<String, ClassDef>()
        FixtureDex.forEach(build) { dex -> dex.classes.forEach { all[it.type] = it } }
        val container = all.getValue(TOAST_CONTAINER)
        val model = container.methods.mapNotNull { method -> method.parameterTypes.singleOrNull()?.toString()?.takeIf { type ->
            method.implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { call ->
                call.definingClass == type && call.parameterTypes.map(CharSequence::toString) == listOf(TOAST_CONTAINER) } == true } == true
        } }.single()
        fun extends(type: String): Boolean {
            var at: String? = type
            repeat(20) {
                if (at == model) return true
                at = all[at ?: return false]?.superclass
            }
            return false
        }
        val selected = all.values.filter { it.type == TOAST_CONTAINER || extends(it.type) }.map { ImmutableClassDef.of(it) }
        return selected to model
    }
}
