import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import kotlinx.coroutines.runBlocking
import java.io.File
import java.util.zip.ZipFile

private const val BOOST = "com.rubenmayayo.reddit"
private const val VERSION = "1.14.3"
private const val EXTENSION = "Lapp/morphe/extension/boost/"

/** What Manager selects by default for this APK. Patches that need a value the user must supply are reported. */
private fun selectable(patches: Set<Patch<*>>, source: String): List<Patch<*>> = patches.filter { patch ->
    val target = patch.compatibility?.any { app -> app.packageName == BOOST && (app.targets.isEmpty() || app.targets.any { it.version == null || it.version == VERSION }) } == true
    val missing = patch.options.values.filter { it.required && it.default == null }.map { it.key }
    if (target && patch.default && patch.name != null && missing.isNotEmpty()) println("SKIPPED $source: ${patch.name} needs ${missing.joinToString()}")
    target && patch.default && patch.name != null && missing.isEmpty()
}

private fun hooks(apk: File): Map<String, Int> {
    val found = HashMap<String, Int>()
    ZipFile(apk).use { zip -> zip.entries().asSequence().map { it.name }.filter { it.matches(Regex("classes\\d*\\.dex")) }.toList() }.forEach { name ->
        val dex = DexFileFactory.loadDexEntry(apk, name, true, Opcodes.getDefault()).dexFile
        for (type in dex.classes) {
            if (type.type.startsWith("Lapp/morphe/")) continue
            for (method in type.methods) check(method, found)
        }
    }
    return found
}

private fun check(method: Method, found: HashMap<String, Int>) {
    val instructions = method.implementation?.instructions?.toList() ?: return
    var pc = 0
    val addresses = instructions.map { instruction -> pc.also { pc += instruction.codeUnits } }.toSet()
    pc = 0
    for (instruction in instructions) {
        if (instruction is OffsetInstruction) check(pc + instruction.codeOffset in addresses) { "Branch targets a non-instruction address in ${method.definingClass}->${method.name}" }
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (reference != null && reference.definingClass.startsWith(EXTENSION)) {
            val key = reference.definingClass.removePrefix(EXTENSION).removeSuffix(";") + "." + reference.name
            found[key] = (found[key] ?: 0) + 1
        }
        pc += instruction.codeUnits
    }
}

fun main(args: Array<String>) = runBlocking {
    val (shikify, patcheddit, apk, directory) = args.map(::File)
    var failures = 0
    var baseline: Map<String, Int>? = null
    for (order in listOf("patcheddit-first", "shikify-first")) {
        val ours = selectable(loadPatchesFromJar(setOf(shikify)), "shikify")
        val theirs = selectable(loadPatchesFromJar(setOf(patcheddit)), "patcheddit")
        println("ORDER $order: ${ours.size} Shikify and ${theirs.size} Patcheddit patches")
        val selected = LinkedHashSet<Patch<*>>(if (order == "patcheddit-first") theirs + ours else ours + theirs)
        val work = directory.resolve(order).apply { deleteRecursively();mkdirs() }
        val output = work.resolve("combined.apk")
        Patcher(PatcherConfig(apkFile = apk, temporaryFilesPath = work.resolve("tmp"), useBytecodeMode = BytecodeMode.FULL, validate = true)).use { patcher ->
            patcher += selected
            patcher().collect { result ->
                val error = result.exception
                if (error == null) println("APPLIED: ${result.patch.name ?: "(internal)"}")
                else { failures++;println("FAILED: ${result.patch.name ?: "(internal)"}: ${error.message?.lines()?.take(4)?.joinToString(" | ")}") }
            }
            apk.copyTo(output, overwrite = true)
            patcher.get().applyTo(output)
        }
        val found = hooks(output)
        println("HOOKS $order: ${found.values.sum()} Shikify and Patcheddit calls into shared extension package, ${found.size} kinds")
        for ((name, required) in listOf("NoticeTweaks.show" to 50, "NoticeTweaks.make" to 50, "DialogTweaks.onShow" to 1, "ViewerPolishTweaks.settle" to 4, "MaterialYouTweaks.flairText" to 1, "CommentsChromeTweaks.onCommentBind" to 1, "CommentsChromeTweaks.onRowBound" to 3, "MaterialYouTweaks.onPostBound" to 4)) {
            val count = found[name] ?: 0
            if (count < required) { failures++;println("MISSING HOOK $order: $name $count < $required") }
        }
        if (baseline != null && baseline != found) println("ORDER DIFFERENCE: ${(baseline!!.keys + found.keys).filter { baseline!![it] != found[it] }}")
        baseline = found
    }
    check(failures == 0) { "Combined validation found $failures problems" }
    println("COMBINED PASS: both bundles apply together in both orders")
}
