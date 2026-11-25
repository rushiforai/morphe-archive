package patches.abrp

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File

/** Supply the publisher base APK through ABRP_ORIGINAL_APK; do not commit it as a fixture. */
class AutomotivePremiumPatchTest {
    @Test fun flagsReachTheNestedConfigMapAfterDexAssembly() {
        val path = System.getenv("ABRP_ORIGINAL_APK")
        assumeNotNull(path)
        val opcodes = Opcodes.forApi(26)
        val container = DexFileFactory.loadDexContainer(File(path!!), opcodes)
        val owner = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }
            .single { it.type == "Lcom/lugg/RNCConfig/RNCConfigModule;" }
        val original = owner.methods.single { it.name == "getConfig" }
        val method = MutableMethod(original)
        enableAutomotivePremium(method)

        val changedOwner = ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass,
            owner.interfaces, owner.sourceFile, owner.annotations, owner.fields,
            owner.methods.map { if (it == original) method else it })
        val store = MemoryDataStore()
        DexPool.writeTo(store, ImmutableDexFile(opcodes, listOf(changedOwner)))
        val assembled = DexBackedDexFile(opcodes, java.nio.ByteBuffer.wrap(store.data)).classes.single().methods
            .single { it.name == "getConfig" }
        assertEquals(original.implementation!!.registerCount, assembled.implementation!!.registerCount)
        val code = assembled.implementation!!.instructions.toList()
        val start = code.indices.single { index ->
            (code[index] as? ReferenceInstruction)?.reference?.let { it as? StringReference }
                ?.string == "ANDROID_AUTOMOTIVE"
        }
        val outer = mutableMapOf<String, Any?>()
        val config = mutableMapOf<String, Any?>("original" to "preserved")
        // Use the unmodified wrapping call's operands as the independent map identities.
        val wrap = code[start - 1] as FiveRegisterInstruction
        assertEquals(Opcode.INVOKE_VIRTUAL, code[start - 1].opcode)
        val registers = mutableMapOf<Int, Any?>(wrap.registerC to outer, wrap.registerE to config)
        for (instruction in code.subList(start - 2, start + 5)) {
            when (instruction.opcode) {
                Opcode.CONST_STRING -> registers[(instruction as OneRegisterInstruction).registerA] =
                    ((instruction as ReferenceInstruction).reference as StringReference).string
                Opcode.INVOKE_VIRTUAL -> {
                    assertEquals("Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
                        (instruction as ReferenceInstruction).reference.toString())
                    val invoke = instruction as FiveRegisterInstruction
                    @Suppress("UNCHECKED_CAST")
                    val receiver = registers[invoke.registerC] as MutableMap<String, Any?>
                    receiver[registers[invoke.registerD] as String] = registers[invoke.registerE]
                }
                else -> error("Unexpected config assembly opcode ${instruction.opcode}")
            }
        }
        assertSame(config, outer["config"])
        assertEquals(setOf("config"), outer.keys)
        assertEquals(mapOf("original" to "preserved", "ANDROID_AUTOMOTIVE" to "true",
            "USE_AUTOMOTIVE_TEMPLATES" to "true"), config)

        // The reflection-loop exit must reach the wrapper and then the flag writes.
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        val exits = code.withIndex().filter { it.value.opcode == Opcode.IF_GE }
        assertEquals(1, exits.size)
        val exit = exits.single()
        assertEquals(addresses[start - 2], addresses[exit.index] + (exit.value as OffsetInstruction).codeOffset)
        assertEquals(Opcode.INVOKE_STATIC, code[start + 5].opcode)
        assertEquals(wrap.registerC, (code[start + 5] as FiveRegisterInstruction).registerC)
    }
}
