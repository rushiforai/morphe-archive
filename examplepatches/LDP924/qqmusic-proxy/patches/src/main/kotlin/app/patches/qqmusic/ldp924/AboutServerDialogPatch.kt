package app.patches.qqmusic.ldp924

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11x
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c

/**
 * 关于页 → 服务器设置入口。
 *
 * 运行时类(ServerSettingsDialog/ServerConfig/ServerHost)在 server-runtime.mpe extension 里
 * （extendWith 声明后 patcher 才会把它们合并进宿主 APK——patch 源码树里的同名类
 * 只活在 patcher 执行期，不会进 APK，之前的版本全部因此 NoClassDefFoundError）。
 */
@Suppress("unused")
val aboutServerDialogPatch = bytecodePatch(
    name = "About page server switch",
    description = "Adds a server settings entry to the About page.",
) {
    compatibleWith("com.tencent.qqmusic")

    extendWith("server-runtime.mpe")

    execute {
        var patched = 0
        classDefBy("Lcom/tencent/qqmusic/fragment/morefeatures/AboutFragment;")?.let { classDef ->
            val mutable = mutableClassDefByOrNull(classDef.type) ?: return@let
            mutable.methods.forEach { method ->
                val impl = method.implementation ?: return@forEach
                impl.instructions.forEachIndexed { idx, ins ->
                    // 找 AboutFragment 的 onViewCreated(onCreateView)：p0=this, p1=view
                    if (ins.opcode == Opcode.RETURN_VOID || ins.opcode == Opcode.RETURN_OBJECT || ins.opcode == Opcode.RETURN) {
                        val name = method.name
                        if (name == "onViewCreated") {
                            method.addInstructions(
                                idx,
                                """
                                    invoke-static {p0}, Lapp/patches/qqmusic/ldp924/ServerSettingsDialog;->show(Ljava/lang/Object;)V
                                """,
                            )
                            patched++
                        }
                    }
                }
            }
        }
        require(patched > 0) { "AboutFragment onViewCreated not found" }
    }
}
