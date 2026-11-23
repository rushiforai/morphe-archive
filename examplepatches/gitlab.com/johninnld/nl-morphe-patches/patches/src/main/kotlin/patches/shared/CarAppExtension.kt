package patches.shared

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
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
import com.android.tools.smali.dexlib2.rewriter.DexRewriter
import com.android.tools.smali.dexlib2.rewriter.EncodedValueRewriter
import com.android.tools.smali.dexlib2.rewriter.InstructionRewriter
import com.android.tools.smali.dexlib2.rewriter.RewriterModule
import com.android.tools.smali.dexlib2.rewriter.Rewriters
import com.android.tools.smali.dexlib2.rewriter.TypeRewriter
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool

/** A Car App Library extension dex after dependency isolation: merge [bytes], relink resources in [types]. */
internal data class CarAppExtension(val bytes: ByteArray, val types: List<String>)

/**
 * Where an extension keeps its stand-ins for obfuscated app classes. The extension compiles
 * against stubs in the named package `nl.johninnl.<app>.app`; the app's classes sit in the
 * default package, which Java source cannot name. Every reference to `Lnl/.../app/X;` is
 * rewritten to `LX;` before the extension is merged. Subpackages are refused.
 */
internal fun stubTypeToAppType(stubNamespace: String, type: String): String? {
    if (!type.startsWith(stubNamespace)) return null
    val name = type.substring(stubNamespace.length)
    require(name.isNotEmpty() && '/' !in name && name.endsWith(";")) { "Unsupported app stub type $type" }
    return "L$name"
}

/**
 * R8 consumer keep rules retain some dependency names. Relocate those definitions AND
 * every reference before merging; external compat token classes are deliberately absent
 * from this map and continue to use the app's real Parcelable ABI across the host boundary.
 *
 * @param resource classpath location of the extension DEX produced by its module.
 * @param label app name used in failure messages.
 * @param ownNamespace type prefix (`Lnl/johninnl/<app>/auto/`) the extension itself owns.
 * @param appStubNamespace when set, stub types under this prefix are relocated to the app's
 *   default package (see [stubTypeToAppType]).
 */
internal fun carAppExtension(
    resource: String,
    label: String,
    ownNamespace: String,
    appStubNamespace: String? = null,
): CarAppExtension {
    val stream = checkNotNull(CarAppExtension::class.java.getResourceAsStream(resource)) {
        "$label extension DEX is missing from the patch bundle classloader"
    }
    val dex = stream.buffered().use { DexBackedDexFile.fromInputStream(null, it) }
    val relocation = dex.classes.map { it.type }.filterNot {
        it.startsWith("Landroidx/car/app/") || it.startsWith(ownNamespace)
    }.associateWith { "${ownNamespace}internal/retained/${it.substring(1)}" }
    val binaryNames = relocation.mapKeys { it.key.substring(1, it.key.length - 1).replace('/', '.') }
        .mapValues { it.value.substring(1, it.value.length - 1).replace('/', '.') }
    fun string(value: String) = binaryNames[value] ?: relocation[value] ?: value
    fun type(value: String): String = relocation[value]
        ?: appStubNamespace?.let { stubTypeToAppType(it, value) }
        ?: value
    val rewriter = DexRewriter(object : RewriterModule() {
        override fun getTypeRewriter(rewriters: Rewriters) = object : TypeRewriter() {
            override fun rewriteUnwrappedType(value: String): String = type(value)
        }
        override fun getEncodedValueRewriter(rewriters: Rewriters) = object : EncodedValueRewriter(rewriters) {
            override fun rewrite(value: EncodedValue): EncodedValue = if (value is StringEncodedValue)
                ImmutableStringEncodedValue(string(value.value)) else super.rewrite(value)
        }
        override fun getInstructionRewriter(rewriters: Rewriters) = object : InstructionRewriter(rewriters) {
            override fun rewrite(value: Instruction): Instruction {
                val reference = (value as? ReferenceInstruction)?.reference as? StringReference
                if (reference != null && value.opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO)) {
                    val text = string(reference.string)
                    val register = (value as OneRegisterInstruction).registerA
                    return if (value.opcode == Opcode.CONST_STRING)
                        ImmutableInstruction21c(value.opcode, register, ImmutableStringReference(text))
                    else ImmutableInstruction31c(value.opcode, register, ImmutableStringReference(text))
                }
                return super.rewrite(value)
            }
        }
    }).dexFileRewriter.rewrite(dex)
    val store = MemoryDataStore()
    try {
        DexPool.writeTo(store, rewriter)
        val bytes = store.data
        val types = DexBackedDexFile.fromInputStream(null, bytes.inputStream()).classes.map { it.type }
        check(types.distinct().size == types.size && types.all {
            it.startsWith("Landroidx/car/app/") || it.startsWith(ownNamespace)
        }) { "$label extension dependency isolation failed" }
        return CarAppExtension(bytes, types)
    } finally { store.close() }
}
