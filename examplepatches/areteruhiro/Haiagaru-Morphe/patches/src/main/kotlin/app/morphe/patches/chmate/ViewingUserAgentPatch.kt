package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val VIEWING_UA = "Lapp/morphe/extension/chmate/ViewingUserAgent;"

internal fun BytecodePatchContext.patchViewingUserAgent(version: String) {
    val requestType = when (version) {
        "0.8.10.191 dev" -> "Lo/r8lambda17vlhACr7B0IDgCdn1Q67LKhir8;"
        "0.8.10.226 dev" -> "Lo/zzdA;"
        "0.8.10.242 dev" -> "Lo/zzcvq;"
        else -> return
    }
    val request = mutableClassDefBy(requestType)
    check(request.instanceFields.count { it.type == "Lokhttp3/Headers;" } == 1)
    val urlField = when (version) {
        "0.8.10.191 dev" -> "f" to "Lo/r8lambdaDTvcCbM00GfL6vhIvhD78yZ0Us;"
        "0.8.10.226 dev" -> "h" to "Lo/zzgb;"
        else -> "f" to "Lo/zzcvl;"
    }
    check(request.instanceFields.any { it.name == urlField.first && it.type == urlField.second }) {
        "UA: native request URL field changed"
    }
    val constructors = request.methods.filter { it.name == "<init>" && it.implementation != null }
    check(constructors.isNotEmpty()) { "UA: native request constructor missing" }
    constructors.forEach { method ->
        val code = method.implementation!!.instructions.toList()
        val words = method.parameterTypes.sumOf { if (it.toString() in setOf("J", "D")) 2 else 1 }
        val receiver = method.implementation!!.registerCount - words - 1
        check(code.none { it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == receiver }) {
            "UA: request constructor reuses its receiver register"
        }
        val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_VOID }
        check(returns.isNotEmpty())
        returns.asReversed().forEach { index ->
            // Retain labels on the hook, so a native branch to return cannot skip it.
            method.replaceInstruction(index, "invoke-static/range {p0 .. p0}, $VIEWING_UA->prepareRequest(Ljava/lang/Object;)V")
            method.addInstruction(index + 1, "return-void")
        }
    }
    var connections = 0
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        val mutable by lazy { mutableClassDefBy(cls) }
        cls.methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            code.indices.reversed().forEach instruction@ { index ->
                val instruction = code[index]
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@instruction
                if (instruction.opcode !in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)) return@instruction
                if (ref.definingClass !in setOf("Ljava/net/URLConnection;", "Ljava/net/HttpURLConnection;",
                        "Ljavax/net/ssl/HttpsURLConnection;")) return@instruction
                val setter = ref.name in setOf("setRequestProperty", "addRequestProperty") &&
                        ref.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;")
                val prepare = ref.name in setOf("connect", "getInputStream", "getOutputStream", "getResponseCode") && ref.parameterTypes.isEmpty()
                if (!setter && !prepare) return@instruction
                val registers: List<Int> = when (instruction) {
                    is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD,
                        instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount)
                    is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
                    else -> error("UA: unsupported connection invocation")
                }
                val target = mutable.findMutableMethodOf(method)
                if (setter) {
                    val call = if (instruction is RegisterRangeInstruction)
                        "invoke-static/range {v${registers.first()} .. v${registers.last()}}" else
                        "invoke-static {${registers.joinToString(", ") { "v$it" }}}"
                    target.replaceInstruction(index, "$call, $VIEWING_UA->${ref.name}(Ljava/net/URLConnection;Ljava/lang/String;Ljava/lang/String;)V")
                } else {
                    val originalCall = if (instruction is RegisterRangeInstruction)
                        "invoke-virtual/range {v${registers.first()} .. v${registers.last()}}, $ref" else
                        "invoke-virtual {${registers.joinToString(", ") { "v$it" }}}, $ref"
                    target.replaceInstruction(index,
                        "invoke-static/range {v${registers.first()} .. v${registers.first()}}, $VIEWING_UA->prepare(Ljava/net/URLConnection;)V")
                    target.addInstruction(index + 1, originalCall)
                }
                connections++
            }
        }
    }
    check(connections > 0) { "UA: native connection calls missing" }
    println("Viewing UA: $version, ${constructors.size} request constructors, $connections java.net boundaries")
}
