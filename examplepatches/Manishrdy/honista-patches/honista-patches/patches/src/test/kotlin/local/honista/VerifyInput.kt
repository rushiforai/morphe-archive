package local.honista

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File

private fun expectRejection(reason: String, find: (String) -> ClassDef?) {
    try {
        validateOriginalClasses(find)
        error("Accepted $reason")
    } catch (exception: PatchException) {
        check("Unsupported input" in exception.message.orEmpty())
    }
}

fun main(args: Array<String>) {
    val targets = File(args[1]).readLines().filter { it.isNotBlank() }.toSet()
    val container = DexFileFactory.loadDexContainer(File(args[0]), Opcodes.getDefault())
    val originals = mutableMapOf<String, ClassDef>()
    container.dexEntryNames.forEach { name ->
        container.getEntry(name)!!.dexFile.classes.forEach {
            if (it.type in targets) originals[it.type] = it
        }
    }
    check(originals.keys == targets)
    val loader = Class.forName("local.honista.HonistaPatchesKt").classLoader
    fun payload(name: String) = loader.getResourceAsStream("honista/$name")!!.use {
        DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it.buffered())
    }
    check(payload("baseline.dex").classes.map { it.type }.toSet() == targets)
    validateOriginalClasses(originals::get)
    println("PASS: All ${targets.size} original classes accepted")

    // Different DEX versions/layouts must not change compatibility.
    for (api in listOf(23, 28)) {
        val pool = DexPool(Opcodes.forApi(api))
        originals.values.reversed().forEach(pool::internClass)
        val store = MemoryDataStore()
        pool.writeTo(store)
        val rewritten = DexBackedDexFile.fromInputStream(Opcodes.forApi(api), store.data.copyOf(store.size).inputStream())
            .classes.associateBy { it.type }
        validateOriginalClasses(rewritten::get)
    }
    println("PASS: Reserialized originals accepted across DEX versions")

    for ((type, original) in originals) {
        expectRejection("missing $type") { if (it == type) null else originals[it] }
        val changed = object : ClassDef by original {
            override fun getAccessFlags() = original.accessFlags xor 0x10
        }
        expectRejection("changed flags for $type") { if (it == type) changed else originals[it] }
    }
    for (replacement in payload("methods.dex").classes.filter { it.type in targets }) {
        val original = originals.getValue(replacement.type)
        fun signature(method: com.android.tools.smali.dexlib2.iface.Method) =
            method.name + method.parameterTypes.joinToString() + method.returnType
        val replacements = replacement.methods.associateBy(::signature)
        val changed = ImmutableClassDef(original.type, original.accessFlags, original.superclass,
            original.interfaces, original.sourceFile, original.annotations, original.fields,
            original.methods.map { replacements[signature(it)] ?: it })
        expectRejection("patched methods for ${original.type}") {
            if (it == original.type) changed else originals[it]
        }
    }
    for (helper in listOf("LX/LocalSponsoredFilter;", "LX/LocalModuleOverride;")) {
        expectRejection("existing $helper") { if (it == helper) originals.values.first() else originals[it] }
    }
    println("PASS: Missing classes, changed flags, patched methods and existing helpers rejected")
}
