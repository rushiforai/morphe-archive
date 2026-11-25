package local.honista

import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import java.io.File

fun main(args: Array<String>) {
    val container = DexFileFactory.loadDexContainer(File(args[0]), Opcodes.getDefault())
    val classes = mutableMapOf<String, ClassDef>()
    container.dexEntryNames.forEach { name -> container.getEntry(name)!!.dexFile.classes.forEach { classes[it.type] = it } }
    val payload = DexFileFactory.loadDexFile(File(args[1]), Opcodes.getDefault())
    val helpers = DexFileFactory.loadDexFile(File(args[2]), Opcodes.getDefault())
    helpers.classes.forEach { classes[it.type] = it }
    val issues = referenceProblems(payload.classes + helpers.classes, classes::get).toMutableList()
    for (c in payload.classes) for (m in c.methods) {
        val original = classes[c.type]?.methods?.find { it.name == m.name && it.parameterTypes == m.parameterTypes && it.returnType == m.returnType }
        if (original == null) issues += "Missing replacement target: ${c.type}->${m.name}"
        else if (original.accessFlags and 0x100 != 0) issues += "Native method replacement: ${c.type}->${m.name}"
    }
    File(args[3]).writeText(issues.joinToString("\n") + "\n")
    if (args.getOrNull(4) == "reject") {
        check(issues.any { "Missing method" in it } && issues.any { "Native method replacement" in it }) {
            "Expected stale-reference and native-replacement regressions in old payload"
        }
        println("PASS: Old payload rejected with ${issues.size} reference/native replacement problems")
        return
    }
    check(issues.isEmpty()) { issues.joinToString("\n") }
    println("PASS: All replacement/helper app references resolve; no native methods replaced")
}
