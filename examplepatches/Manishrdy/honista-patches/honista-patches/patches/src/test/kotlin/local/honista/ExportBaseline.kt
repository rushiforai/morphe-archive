package local.honista
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import java.io.File
fun main(args: Array<String>) {
    val targets = File(args[1]).readLines().filter { it.isNotBlank() && it !in setOf("LX/LocalSponsoredFilter;", "LX/LocalModuleOverride;") }.toSet()
    val container = DexFileFactory.loadDexContainer(File(args[0]), Opcodes.getDefault())
    val result = mutableMapOf<String, String>()
    val pool = DexPool(Opcodes.getDefault())
    container.dexEntryNames.forEach { name -> container.getEntry(name)!!.dexFile.classes.forEach { def ->
        if (def.type in targets) {
            check(result.put(def.type, classDigest(def)) == null) { "Duplicate class: ${def.type}" }
            pool.internClass(def)
        }
    } }
    check(result.keys == targets)
    val expected = File(args[2]).readLines().filter { it.isNotBlank() }.associate {
        val (type, hash) = it.split('\t')
        type to hash
    }
    check(result == expected) { "Original APK does not match the frozen baseline; refusing to export" }
    val store = MemoryDataStore()
    pool.writeTo(store)
    File(args[3]).writeBytes(store.data.copyOf(store.size))
    println("Exported ${result.size} verified original classes")
}
