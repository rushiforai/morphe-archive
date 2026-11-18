package app.template.patches.putmask

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_PUTMASK
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val LICENSE_ENUM = "Lcom/putmask/facefilter/license/drplAgue1\$Drplague1;"
private const val PREMIUM_CLASS = "LdrplAgUE/Drplague1;"
private const val FLAG_CLASS = "Lcom/almeros/android/multitouch/dRplague1;"
private const val FLAG_FIELD = "o"

@Suppress("unused")
val unlockPutMaskPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all PutMask premium features.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PUTMASK)

    execute {
        // License check always returns ENTITLED.
        mutableClassDefBy("Lcom/putmask/facefilter/license/drplAgue1;").apply {
            methods.firstOrNull {
                it.name == "l" && it.returnType == LICENSE_ENUM && it.parameterTypes.size == 2
            }?.apply {
                removeInstructions(0, implementation!!.instructions.count())
                addInstructions(
                    0,
                    "sget-object v0, $LICENSE_ENUM->ENTITLED:$LICENSE_ENUM\nreturn-object v0"
                )
            }
        }

        // Global premium flag = true in static initializer.
        mutableClassDefBy(FLAG_CLASS).apply {
            methods.firstOrNull { it.name == "<clinit>" }?.apply {
                addInstructions(
                    implementation!!.instructions.count() - 1,
                    "const/4 v0, 0x1\nsput-boolean v0, $FLAG_CLASS->$FLAG_FIELD:Z"
                )
            }
        }

        // MainActivity.Nd(boolean): always premium.
        mutableClassDefBy("Lcom/putmask/facefilter/MainActivity;").apply {
            methods.firstOrNull {
                it.name == "Nd" && it.returnType == "V" &&
                    it.parameterTypes.size == 1 && it.parameterTypes[0] == "Z"
            }?.apply {
                removeInstructions(0, implementation!!.instructions.count())
                addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        iput-boolean v0, p0, Lcom/putmask/facefilter/MainActivity;->n7:Z
                        invoke-static {p0}, Lcom/putmask/facefilter/MainActivity;->C2(Lcom/putmask/facefilter/MainActivity;)V
                        return-void
                    """.trimIndent()
                )
            }
        }

        mutableClassDefBy(PREMIUM_CLASS).apply {
            // Readers c/d/a always return true; writers e/g (reset prefs) do nothing.
            listOf("c", "d", "a").forEach { name ->
                methods.firstOrNull { it.name == name && it.returnType == "Z" }?.apply {
                    removeInstructions(0, implementation!!.instructions.count())
                    addInstructions(0, "const/4 v0, 0x1\nreturn v0")
                }
            }
            listOf("e", "g").forEach { name ->
                methods.firstOrNull { it.name == name && it.returnType == "V" }?.apply {
                    removeInstructions(0, implementation!!.instructions.count())
                    addInstructions(0, "return-void")
                }
            }
        }

        // Hide the TRY AGAIN / NOT NOW license popup; unlock all features at startup.
        mutableClassDefBy("Lcom/putmask/facefilter/HomeActivity;").apply {
            methods.firstOrNull {
                it.name == "O2" && it.returnType == "V" && it.parameterTypes.size == 2 &&
                    it.parameterTypes[0] == "Lcom/putmask/facefilter/HomeActivity;" &&
                    it.parameterTypes[1] == "Z"
            }?.apply {
                removeInstructions(0, implementation!!.instructions.count())
                addInstructions(0, "return-void")
            }

            methods.firstOrNull { it.name == "onCreate" }?.apply {
                val unlockAll = (1..7).joinToString("\n") {
                    "const/4 v0, 0x$it\ninvoke-static {v0, v1}, $PREMIUM_CLASS->j(ILandroid/content/Context;)V"
                }
                addInstructions(
                    implementation!!.instructions.count() - 1,
                    """
                        invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
                        move-result-object v1
                    """.trimIndent() + "\n" + unlockAll + "\n" +
                        "const/4 v0, 0x1\ninvoke-static {v1, v0}, $PREMIUM_CLASS->h(Landroid/content/Context;Z)V"
                )
            }
        }

        // Flip every `FLAG = false` write in the license classes to true.
        listOf(
            "Lcom/putmask/facefilter/license/drplAgue1;",
            "Lsecurity/inappbilling/drplAgue1;"
        ).forEach { className ->
            mutableClassDefBy(className).apply {
                methods.forEach { method ->
                    val impl = method.implementation ?: return@forEach
                    val toPatch = mutableListOf<Pair<Int, Int>>() // (index of const/4, register)
                    impl.instructions.forEachIndexed { index, insn ->
                        if (index == 0 || insn.opcode.name != "sput-boolean") return@forEachIndexed
                        val ref = (insn as? BuilderInstruction21c)?.reference as? FieldReference
                            ?: return@forEachIndexed
                        if (ref.definingClass != FLAG_CLASS || ref.name != FLAG_FIELD) return@forEachIndexed
                        val prev = impl.instructions.elementAt(index - 1) as? BuilderInstruction11n
                            ?: return@forEachIndexed
                        if (prev.narrowLiteral == 0) toPatch.add(index - 1 to prev.registerA)
                    }
                    // Reverse so indices don't shift.
                    toPatch.reversed().forEach { (idx, reg) ->
                        method.removeInstructions(idx, 1)
                        method.addInstructions(idx, "const/4 v$reg, 0x1")
                    }
                }
            }
        }
    }
}
