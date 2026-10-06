/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.privacy

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

/** Google's advertising ID info class in both APKs, and the answer filters placed before its returns. */
class AdvertisingIdFixtureTest {
    @Test
    fun `each declared original APK filters both advertising ID answers before every return`() {
        for (build in Fixtures.declaredBuilds()) {
            val info = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + info)
            hideAdvertisingIdPatch.execute(context)
            for (flag in listOf("hideAdvertisingId", "advertisingId")) {
                val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.implementation!!.instructions.first()
                assertEquals("${build.name}: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
            }
            for ((getter, hook) in ADVERTISING_ID_GETTERS) {
                val original = info.methods.single { it.identity() == getter }.implementation!!.instructions.toList()
                val patched = context.mutableClassDefBy(ADVERTISING_INFO).methods.single { it.identity() == getter }
                    .implementation!!.instructions.toList()
                assertEquals("${build.name}: $getter keeps its own read", original.dropLast(1).map { it.opcode }, patched.take(original.size - 1).map { it.opcode })
                val returnAt = patched.indexOfLast { it.opcode == Opcode.RETURN || it.opcode == Opcode.RETURN_OBJECT }
                val register = (patched[returnAt] as OneRegisterInstruction).registerA
                assertEquals("${build.name}: $getter hook", hook, patched[returnAt - 2].callReference()?.identity())
                assertEquals(build.name, listOf(register), (patched[returnAt - 2] as FiveRegisterInstruction).let {
                    listOf(it.registerC).take(it.registerCount) })
                assertEquals(build.name, register, (patched[returnAt - 1] as OneRegisterInstruction).registerA)
                assertEquals(build.name, original.size + 2, patched.size)
            }
        }
    }

    @Test
    fun `missing info class getter or hook and an unusable return refuse before any change`() {
        val info = read(Fixtures.declaredBuilds().last())
        val extension = ExtensionDex.classes()
        val getId = info.methods.single { it.name == "getId" }
        val wideReturn = ImmutableMethod(getId.definingClass, getId.name, getId.parameters, getId.returnType, getId.accessFlags,
            getId.annotations, getId.hiddenApiRestrictions, ImmutableMethodImplementation(20, listOf(
                ImmutableInstruction21c(Opcode.CONST_STRING, 16, com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference("x")),
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 16)), null, null))
        val cases = linkedMapOf(
            "missing info class" to extension,
            "missing getter" to extension + copy(info, info.methods.filterNot { it.name == "isLimitAdTrackingEnabled" }),
            "missing hook" to extension.map { owner -> if (owner.type != ADVERTISING_ID) owner else
                copy(owner, owner.methods.filterNot { it.name == "limitTracking" }) } + info,
            "return register past v15" to extension + copy(info, info.methods.map { if (it.name == "getId") wideReturn else it }),
            "missing status stub" to extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
                copy(owner, owner.methods.filterNot { it.name == "advertisingId" }) } + info,
        )
        for ((reason, input) in cases) {
            val context = PatchContexts.of(input)
            val before = snapshot(context, input)
            assertThrows(reason, PatchException::class.java) { hideAdvertisingIdPatch.execute(context) }
            assertArrayEquals("$reason left retained edits", before, snapshot(context, input))
        }
    }

    private fun copy(owner: ClassDef, methods: Iterable<com.android.tools.smali.dexlib2.iface.Method>) = ImmutableClassDef(owner.type,
        owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile, owner.annotations, owner.fields, methods)

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

    private fun read(build: File): ClassDef {
        var info: ClassDef? = null
        FixtureDex.forEach(build) { dex ->
            dex.classes.firstOrNull { it.type == ADVERTISING_INFO }?.let { info = ImmutableClassDef.of(it) }
        }
        return info ?: throw AssertionError("${build.name} has no $ADVERTISING_INFO")
    }
}
