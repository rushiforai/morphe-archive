package app.patches.qqmusic.ldp924

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31c
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * 主域运行时重定向。
 *
 * 只换普通用户一打开 App 就走的主域：
 *  - t.y.qq.com  : emua 老栈 getHost()（CgiUtil.c()==0 正式环境，musicu.fcg）
 *  - vc.y.qq.com : cyclone 新栈 DomainSwitchItem 的 origin（get key + 构造 origin + put key 三处都要换）
 *
 * ut/ud/ct 等测试调试域不动（普通用户接触不到，CgiUtil.c()!=0 才会走到）。
 *
 * 正确性要点（连环坑史）：
 *  1. const-string 有普通(21c)/jumbo(31c)两种格式，都要匹配
 *  2. move-result-object 写回原指令的目标寄存器，不能固定 v0
 *  3. 1条换1条+插入1条（replaceInstructions 是等量替换语义，会吞掉后续原指令）
 *  4. 每处替换净增1条指令 → 必须倒序替换，否则后续命中点的快照索引全部错位
 */
@Suppress("unused")
val cgiHostRedirectPatch = bytecodePatch(
    name = "CGI host redirect",
    description = "Redirects main CGI hosts (t.y.qq.com / vc.y.qq.com) to a configured server. Falls back to official domains when unset.",
) {
    compatibleWith("com.tencent.qqmusic")

    dependsOn(aboutServerDialogPatch)

    extendWith("server-runtime.mpe")

    execute {
        val targets = mapOf(
            "t.y.qq.com" to "t_y_qq_com",
            "vc.y.qq.com" to "vc_y_qq_com",
        )
        var replaced = 0
        classDefForEach { classDef ->
            if (!classDef.type.startsWith("Lcom/tencent/qqmusic/emua/") &&
                !classDef.type.startsWith("Lcom/tencent/qqmusiccommon/")
            ) return@classDefForEach
            // 关键：先只读扫描，方法级命中才 mutable 化这个类。
            // mutableClassDefByOrNull 本身会把类注册为已修改→从原dex剥离重组；
            // 对全包调它=几千个类被重排（26dex→28dex全量重洗），
            // 对带Sword热更代理的腾讯App是结构性破坏面。只 mutable 真正改动的类。
            data class Hit(val idx: Int, val getter: String, val reg: Int)
            val classHits = LinkedHashMap<com.android.tools.smali.dexlib2.iface.Method, ArrayList<Hit>>()
            classDef.methods.forEach { method ->
                val impl = method.implementation ?: return@forEach
                val hits = ArrayList<Hit>()
                impl.instructions.forEachIndexed { idx, ins ->
                    if (ins.opcode != Opcode.CONST_STRING && ins.opcode != Opcode.CONST_STRING_JUMBO) return@forEachIndexed
                    val str = when (ins) {
                        is Instruction21c -> (ins.reference as? StringReference)?.string
                        is Instruction31c -> (ins.reference as? StringReference)?.string
                        else -> null
                    } ?: return@forEachIndexed
                    val getter = targets[str] ?: return@forEachIndexed
                    val reg = when (ins) {
                        is Instruction21c -> ins.registerA
                        is Instruction31c -> ins.registerA
                        else -> return@forEachIndexed
                    }
                    hits.add(Hit(idx, getter, reg))
                }
                if (hits.isNotEmpty()) classHits[method] = hits
            }
            if (classHits.isEmpty()) return@classDefForEach
            val mutable = mutableClassDefByOrNull(classDef.type) ?: return@classDefForEach
            mutable.methods.forEach { method ->
                val hits = classHits[method] ?: return@forEach
                // 倒序替换（从后往前，前面索引不偏移）
                hits.sortedByDescending { it.idx }.forEach { h ->
                    method.replaceInstruction(
                        h.idx,
                        "invoke-static {}, Lapp/patches/qqmusic/ldp924/ServerHost;->" + h.getter + "()Ljava/lang/String;",
                    )
                    method.addInstruction(
                        h.idx + 1,
                        "move-result-object v" + h.reg,
                    )
                    replaced++
                }
            }
        }
        require(replaced > 0) { "no main CGI domain constants found" }
    }
}
