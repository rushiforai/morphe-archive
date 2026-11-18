import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchLoader
import java.io.File
import java.util.Collections
import java.util.IdentityHashMap

/** Checks the actual Desktop bundle loader, public selection and dependency graph. */
fun main(args: Array<String>) {
    val expected = File(args[1]).readLines().associate { line ->
        val fields = line.split('\t')
        fields[0] to fields[1].toBooleanStrict()
    }
    val loaded = PatchLoader.Jar(setOf(File(args[0])))
    val named = loaded.filter { it.name != null }
    check(named.map { it.name }.toSet().size == named.size) { "Duplicate public patch names" }
    check(named.map { it.name }.toSet() == expected.keys) {
        "Loader/export mismatch: loaded=${named.map { it.name }.sortedBy { it }} expected=${expected.keys}"
    }
    for (patch in named) check(patch.default == expected[patch.name]) { "Wrong default: ${patch.name}" }
    val done = Collections.newSetFromMap(IdentityHashMap<Patch<*>, Boolean>())
    val pending = Collections.newSetFromMap(IdentityHashMap<Patch<*>, Boolean>())
    fun visit(patch: Patch<*>) {
        if (patch in done) return
        check(pending.add(patch)) { "Dependency cycle at $patch" }
        patch.dependencies.forEach(::visit)
        pending.remove(patch)
        done.add(patch)
    }
    named.forEach(::visit)
    // Imported patch options must be the original Option instances, so changes
    // made by Manager/Desktop reach the implementation's delegated properties.
    var forwardedOptions = 0
    for (patch in named) {
        for (option in patch.options.values) {
            if (patch.dependencies.any { dependency -> dependency.options.values.any { it === option } }) forwardedOptions++
        }
    }
    println("PASS ${named.size} public patches; ${named.count { it.default }} default selections; " +
        "${done.size} acyclic dependency objects; $forwardedOptions forwarded options")
    named.sortedBy { it.name }.forEach { println("${it.name}\t${it.default}") }
}
