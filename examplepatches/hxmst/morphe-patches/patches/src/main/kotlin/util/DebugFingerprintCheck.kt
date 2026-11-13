package util

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.vi.patches.rasp.disableAppDefenderPatch
import app.vi.patches.shared.RaspProxyOnCreateFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import java.io.File

fun main() {
    val apk = File("/home/daniel/Projects/my-morphe-patches/local-resources/com.mventus.selfcare.activity_antisplit.apk")
    val workspace = File("/tmp/opencode/patcher-work").apply { mkdirs() }

    val verifyPatch = bytecodePatch(name = "ZZZ Debug Verify Patch") {
        execute {
            // After disableAppDefenderPatch ran: resolve the proxy call chain in onCreate,
            // then print the rewritten getter body.
            val onCreate = RaspProxyOnCreateFingerprint.method
            val instructions = onCreate.implementation!!.instructions.toList()
            var getterRef: MethodReference? = null
            for ((index, instruction) in instructions.withIndex()) {
                if (instruction.opcode != Opcode.INVOKE_STATIC) continue
                val ref = (instruction as ReferenceInstruction).reference as MethodReference
                if (ref.returnType == "Ljava/lang/String;" && ref.parameterTypes.isEmpty()) {
                    getterRef = ref
                    break
                }
            }
            val ref = getterRef ?: error("getter invoke not found")
            val proxyClass = mutableClassDefBy(ref.definingClass)
            val getter = proxyClass.methods.first { it.name == ref.name && it.returnType == "Ljava/lang/String;" }
            println("VERIFY getter ${ref.definingClass} -> ${ref.name}:")
            getter.implementation!!.instructions.forEachIndexed { i, ins ->
                val detail = (ins as? ReferenceInstruction)?.reference?.let { r ->
                    try {
                        (r as com.android.tools.smali.dexlib2.iface.reference.StringReference).string
                    } catch (_: Throwable) {
                        r.toString()
                    }
                }
                println("  [$i] ${ins.opcode} $detail")
            }

            // Verify the lifecycle registration start() was neutralized.
            val start = app.vi.patches.shared.RaspLifecycleRegistrationFingerprint.method
            println("VERIFY start ${start.definingClass} -> ${start.name}:")
            start.implementation!!.instructions.forEachIndexed { i, ins ->
                println("  [$i] ${ins.opcode}")
            }

            // Verify the root checks now return false.
            for ((label, fp) in listOf(
                "rootbeer" to app.vi.patches.shared.RootBeerRootCheckFingerprint,
                "juspay" to app.vi.patches.shared.JuspayRootCheckFingerprint,
            )) {
                val m = fp.matchOrNull()?.method ?: error("$label root check not found")
                val head = m.implementation!!.instructions.take(2).joinToString(" ") { it.opcode.toString() }
                println("VERIFY $label ${m.definingClass} -> ${m.name}: $head")
            }
        }
    }

    val cfg = PatcherConfig(apk, workspace)
    val patcher = Patcher(cfg)
    try {
        patcher += setOf<app.morphe.patcher.patch.Patch<*>>(disableAppDefenderPatch, verifyPatch)
        runBlocking {
            for (r in patcher.invoke().toList()) {
                println("RESULT: $r")
                for (f in r.javaClass.declaredFields) {
                    f.isAccessible = true
                    println("  ${f.name} = ${f.get(r)}")
                }
            }
        }
    } finally {
        patcher.close()
    }
}
