package app.morphe.patches.chmate

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.EncodedValue
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import com.android.tools.smali.dexlib2.rewriter.*
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.ByteArrayInputStream
import java.io.InputStream
import java.util.function.Supplier

/** R8 keep rules leave some Compose classes unrenamed. Relocate the extension's
 * own AndroidX/Kotlin types before merging, so ChMate's copies are never replaced.
 * Framework types, native JNI names and Haiagaru entry points stay unchanged. */
internal object ChMateExtensionIsolation {
    fun openAll(): List<Supplier<InputStream>> {
        val primary = checkNotNull(javaClass.getResourceAsStream("/extensions/chmate.mpe")) {
            "ChMate extension is missing"
        }.use { it.readBytes() }
        val shards = mutableListOf(primary)
        var index = 2
        while (true) {
            val stream = javaClass.getResourceAsStream("/extensions/chmate-$index.mpe") ?: break
            shards += stream.use { it.readBytes() }
            index++
        }
        val dexes = shards.map { CachedExtensionDex(it) }
        // References may cross shard boundaries, so every shard uses one map.
        val names = dexes.flatMap { dex -> dex.classes.map { it.type } }.filter {
            it.startsWith("Landroidx/") || it.startsWith("Lkotlin/") || it.startsWith("Lkotlinx/")
        }.associateWith { "Lapp/morphe/extension/isolated/original/" + it.substring(1) }
        val strings = names + names.mapKeys { it.key.substring(1, it.key.length - 1).replace('/', '.') }
            .mapValues { it.value.substring(1, it.value.length - 1).replace('/', '.') }
        val rewriter = DexRewriter(object : RewriterModule() {
            override fun getTypeRewriter(rewriters: Rewriters): Rewriter<String> = object : TypeRewriter() {
                override fun rewriteUnwrappedType(value: String) = names[value] ?: value
            }

            override fun getInstructionRewriter(rewriters: Rewriters): Rewriter<Instruction> {
                val standard = super.getInstructionRewriter(rewriters)
                return Rewriter { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
                    val replacement = reference?.string?.let(strings::get)
                    if (replacement == null) standard.rewrite(instruction)
                    else {
                        val register = (instruction as OneRegisterInstruction).registerA
                        val string = ImmutableStringReference(replacement)
                        when (instruction.opcode) {
                            Opcode.CONST_STRING -> ImmutableInstruction21c(instruction.opcode, register, string)
                            Opcode.CONST_STRING_JUMBO -> ImmutableInstruction31c(instruction.opcode, register, string)
                            else -> standard.rewrite(instruction)
                        }
                    }
                }
            }

            override fun getEncodedValueRewriter(rewriters: Rewriters): Rewriter<EncodedValue> {
                val standard = super.getEncodedValueRewriter(rewriters)
                return Rewriter { value ->
                    val replacement = (value as? StringEncodedValue)?.value?.let(strings::get)
                    if (replacement == null) standard.rewrite(value) else ImmutableStringEncodedValue(replacement)
                }
            }
        })
        println("ChMate extension: ${dexes.size} DEX shards, isolating ${names.size} retained AndroidX/Kotlin classes")
        return dexes.mapIndexed { shard, dex ->
            Supplier<InputStream> {
                val output = MemoryDataStore(shards[shard].size)
                DexPool.writeTo(output, rewriter.dexFileRewriter.rewrite(dex))
                ByteArrayInputStream(output.data)
            }
        }
    }
}
