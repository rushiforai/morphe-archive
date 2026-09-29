package app.patches.qqmusic.ldp924

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/** 寄生设置弹窗到关于页诊断入口（连点6次"已开启诊断入口!"Toast后）。 */
@Suppress("unused")
val aboutServerDialogPatch = bytecodePatch(
    name = "About page server switch",
    description = "Adds a hidden server (host/port) dialog to the About page diagnostic entrance (6-tap).",
) {
    compatibleWith("com.tencent.qqmusic")

    extendWith("server-runtime.mpe")

    execute {
        var patched = 0
        classDefForEach { classDef ->
            if (classDef.type != "Lcom/tencent/qqmusic/fragment/morefeatures/AboutFragment;") return@classDefForEach
            val mutable = mutableClassDefByOrNull(classDef.type) ?: return@classDefForEach
            mutable.methods.filter { it.name == "onClick" && it.implementation != null }.forEach { method ->
                val impl = method.implementation!!
                val insns: List<Instruction> = impl.instructions.toList()
                var bannerIdx = -1
                insns.forEachIndexed { i, ins ->
                    if (ins.opcode == Opcode.INVOKE_STATIC || ins.opcode == Opcode.INVOKE_STATIC_RANGE) {
                        val ref = (ins as? ReferenceInstruction)?.reference?.toString() ?: ""
                        if (ref.contains("BannerTips")) bannerIdx = i
                    }
                }
                if (bannerIdx >= 0) {
                    method.addInstructions(
                        bannerIdx + 1,
                        """
                            invoke-static {p0}, Lapp/patches/qqmusic/ldp924/ServerSettingsDialog;->show(Ljava/lang/Object;)V
                        """
                    )
                    patched++
                }
            }
        }
        require(patched > 0) { "AboutFragment diagnostic entrance not found" }
    }
}
