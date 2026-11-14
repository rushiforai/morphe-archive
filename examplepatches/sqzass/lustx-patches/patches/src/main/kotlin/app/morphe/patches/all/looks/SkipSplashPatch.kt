
package app.morphe.patches.all.splash

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val ANIM_RE = Regex(
    "^(show|play|animate|start|init|setup|load|display|handle|run|fade)" +
        ".*(splash|intro|welcome|brand|logo|animation|fade|delay|timer|countdown)$",
    RegexOption.IGNORE_CASE,
)
private val SPLASH_CLASS_RE = Regex("(splash|launch|welcome|intro|brand|boot)", RegexOption.IGNORE_CASE)

private fun argRegisters(ins: Instruction): List<Int>? = when (ins) {
    is FiveRegisterInstruction -> listOf(ins.registerC, ins.registerD, ins.registerE, ins.registerF, ins.registerG).take(ins.registerCount)
    is RegisterRangeInstruction -> (ins.startRegister until ins.startRegister + ins.registerCount).toList()
    else -> null
}

private fun Instruction.isDelayedPost(): Boolean {
    val m = getReference<MethodReference>() ?: return false
    val n = m.name
    return (n == "postDelayed" || n == "postAtTime") &&
        m.definingClass.let { it == "Landroid/os/Handler;" || it == "Landroid/view/View;" }
}
private fun Instruction.isSleep(): Boolean {
    val m = getReference<MethodReference>() ?: return false
    return m.definingClass == "Ljava/lang/Thread;" && m.name == "sleep"
}

@Suppress("unused")
val skipSplashPatch = bytecodePatch(
    name = "Skip splash",
    description = "Skips splash/intro screens by running their deferred navigation immediately and " +
        "removing artificial sleeps. Scoped to splash-named Activity/Fragment classes.",
    default = false,
) {
    val convertDelays by booleanOption(
        key = "convertDelays", default = true,
        title = "Convert splash delays to immediate",
        description = "Replaces postDelayed/sleep inside splash classes with immediate execution. " +
            "If a splash blanks or hangs, disable this.",
    )

    execute {
        // Safe tier: no-op splash-named animation helpers anywhere.
        classDefForEach { classDef ->
            val targets = classDef.methods.filter { it.returnType == "V" && ANIM_RE.matches(it.name) }
            if (targets.isEmpty()) return@forEach
            val mc = mutableClassDefBy(classDef)
            targets.forEach { mc.findMutableMethodOf(it).returnEarly() }
        }

        if (convertDelays != true) return@execute

        // Scoped tier: within splash Activity/Fragment classes, run delayed nav now / drop sleeps.
        classDefForEach { classDef ->
            val sc = classDef.superclass ?: return@forEach
            if (!SPLASH_CLASS_RE.containsMatchIn(classDef.type)) return@forEach
            if (!(sc.contains("Activity") || sc.contains("Fragment"))) return@forEach

            val mc = mutableClassDefBy(classDef)
            classDef.methods.forEach { method ->
                val impl = method.implementation ?: return@forEach
                if (impl.instructions.none { it.isDelayedPost() || it.isSleep() }) return@forEach
                val mm = mc.findMutableMethodOf(method)
                val idxs = mm.instructions.withIndex()
                    .filter { it.value.isDelayedPost() || it.value.isSleep() }
                    .map { it.index }
                for (i in idxs) {
                    val ins = mm.getInstruction(i)
                    if (ins.isSleep()) {
                        mm.replaceInstruction(i, "nop")
                    } else {
                        val regs = argRegisters(ins) ?: continue
                        if (regs.isEmpty()) continue
                        val rReg = regs[1]  // Runnable arg
                        mm.replaceInstruction(i, "invoke-interface {v$rReg}, Ljava/lang/Runnable;->run()V")
                        val ri = i + 1
                        if (ri < mm.instructions.size && mm.getInstruction(ri).opcode == Opcode.MOVE_RESULT) {
                            val mr = (mm.getInstruction(ri) as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
                            mm.replaceInstruction(ri, "const/4 v$mr, 0x1")
                        }
                    }
                }
            }
        }
    }
}