/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.gstarmc.misc.jiagu

import app.morphe.patcher.patch.PatchException
import app.morphe.patches.shared.misc.jiagu.asJiaguDex
import app.morphe.patches.shared.misc.jiagu.withLoader
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import org.junit.jupiter.api.Assumptions.assumeTrue
import java.io.File
import java.nio.ByteBuffer
import java.util.zip.ZipFile
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val STUB_CLASS = "Lcom/stub/StubApp;"
private const val ATTACH = "attachBaseContext"
private const val LOADER = "hx"

internal class JiaguStubTest {
    private val configured: String? = System.getenv("JIAGU_STOCK_APK")
    private val corpus = configured
        ?.split(File.pathSeparatorChar)
        ?.filter { it.isNotBlank() }
        ?.map(::File)
        .orEmpty()

    private fun eachStock(action: (String, ByteArray) -> Unit) {
        assumeTrue(configured != null, "JIAGU_STOCK_APK is not set")
        assertTrue(corpus.isNotEmpty(), "JIAGU_STOCK_APK is set but lists no paths")
        corpus.forEach { apk ->
            assertTrue(apk.isFile, "configured stock APK does not exist: $apk")
            val classes = ZipFile(apk).use { it.getInputStream(it.getEntry("classes.dex")).readBytes() }
            action(apk.name, classes)
        }
    }

    @Test
    fun `replaces only the stub and keeps its size`() = eachStock { name, classes ->
        // given
        val stock = classes.asJiaguDex()

        // when
        val patched = stock.withLoader(bootLoaderSmali)

        // then
        assertEquals(classes.size, patched.size, name)
        assertEquals(stock.stubSize, patched.asJiaguDex().stubSize, name)
        assertContentEquals(
            classes.copyOfRange(stock.stubSize, classes.size),
            patched.copyOfRange(stock.stubSize, patched.size),
            "$name: payload after the stub",
        )
    }

    @Test
    fun `keeps every stock method and adds only the loader`() = eachStock { name, classes ->
        // given
        val stock = classes.asJiaguDex()

        // when
        val generated = stubClasses(stock.withLoader(bootLoaderSmali).copyOf(stock.stubSize))

        // then
        val original = stubClasses(stock.stub)
        assertEquals(original.keys, generated.keys, "$name: classes")
        original.forEach { (type, classDef) ->
            val expected = classDef.methods.map { it.signature() }.toSet() +
                if (type == STUB_CLASS) setOf("$LOADER()V") else emptySet()
            assertEquals(expected, generated.getValue(type).methods.map { it.signature() }.toSet(), "$name: $type methods")
            assertEquals(classDef.fields.map { it.toString() }, generated.getValue(type).fields.map { it.toString() }, "$name: $type fields")
            classDef.methods.filterNot { type == STUB_CLASS && it.name == ATTACH }.forEach { method ->
                assertEquals(
                    method.listing(),
                    generated.getValue(type).method(method.signature()).listing(),
                    "$name: $type->${method.signature()}",
                )
            }
        }
    }

    @Test
    fun `calls the loader right after the context store`() = eachStock { name, classes ->
        // given
        val stock = classes.asJiaguDex()

        // when
        val generated = stubClasses(stock.withLoader(bootLoaderSmali).copyOf(stock.stubSize))

        // then
        val original = stubClasses(stock.stub).getValue(STUB_CLASS).method("$ATTACH(Landroid/content/Context;)V")
        val instructions = original.implementation!!.instructions.toList()
        val store = instructions.indexOfFirst {
            it.opcode == Opcode.SPUT_OBJECT && (it as ReferenceInstruction).reference.toString().startsWith("$STUB_CLASS->d:")
        }
        val expected = instructions.map { it.describe(withOffset = false) }.toMutableList().apply {
            add(store + 1, "invoke-static 0 0 0 0 0 0 $STUB_CLASS->$LOADER()V")
        }
        val patched = generated.getValue(STUB_CLASS).method("$ATTACH(Landroid/content/Context;)V")
        assertEquals(expected, patched.implementation!!.instructions.map { it.describe(withOffset = false) }, name)
    }

    @Test
    fun `rejects a loader larger than the stub has room for`() = eachStock { name, classes ->
        // given
        val oversized = bootLoaderSmali.replace("const-string v1, \"Boot\"", "const-string v1, \"${"B".repeat(4096)}\"")

        // when
        val error = assertFailsWith<PatchException>(name) { classes.asJiaguDex().withLoader(oversized) }

        // then
        assertTrue(error.message!!.startsWith("The loader does not fit the Jiagu stub"), error.message)
    }

    private fun stubClasses(stub: ByteArray) =
        DexBackedDexFile(Opcodes.forDexVersion(35), ByteBuffer.wrap(stub)).classes.associateBy { it.type }

    private fun ClassDef.method(signature: String) = methods.single { it.signature() == signature }

    private fun Method.signature() = "$name(${parameterTypes.joinToString("")})$returnType"

    private fun Method.listing(): List<String> {
        val code = implementation ?: return emptyList()
        return code.instructions.map { it.describe(withOffset = true) } +
            code.tryBlocks.map { block ->
                "try ${block.startCodeAddress}+${block.codeUnitCount} " +
                    block.exceptionHandlers.joinToString { "${it.exceptionType}@${it.handlerCodeAddress}" }
            }
    }

    private fun Instruction.describe(withOffset: Boolean) = listOfNotNull(
        opcode.name,
        (this as? FiveRegisterInstruction)?.let { "${it.registerCount} ${it.registerC} ${it.registerD} ${it.registerE} ${it.registerF} ${it.registerG}" },
        (this as? RegisterRangeInstruction)?.let { "${it.startRegister}..${it.registerCount}" },
        (this as? OneRegisterInstruction)?.registerA,
        (this as? TwoRegisterInstruction)?.registerB,
        (this as? ThreeRegisterInstruction)?.registerC,
        (this as? WideLiteralInstruction)?.wideLiteral,
        (this as? OffsetInstruction)?.codeOffset?.takeIf { withOffset },
        (this as? ReferenceInstruction)?.reference,
        (this as? SwitchPayload)?.switchElements?.map { "${it.key}:${it.offset}" },
        (this as? ArrayPayload)?.arrayElements,
    ).joinToString(" ")
}
