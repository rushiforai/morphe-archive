package app.template.patches.shima.premium

import app.template.patches.shared.requireProgress

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.SHIMA_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Unlocks Shima+ Pro.
 *
 * ## How the entitlement works (recon of 0.5.1)
 * The app owns a single Pro product, `"pro_unlock"` (the SharedPreferences file is
 * `"island_pro"`, the persisted purchase JSON is HMAC-SHA256-signed with an
 * AndroidKeyStore device key, so the stored blob cannot simply be edited). Every
 * "is the user Pro?" decision in the app is an **owned-products membership test**:
 *
 * ```smali
 * const-string vX, "pro_unlock"
 * invoke-… {…}, L…;->contains(Ljava/lang/Object;)Z   # purchase.products / parsed JSON list
 * move-result vX
 * if-eqz vX, :paywall
 * ```
 *
 * The test runs both on **live Billing purchases** (`Purchase.products` iteration, e.g.
 * `ϲ̈`) and on the **signed persisted JSON** (`е̱.á(JSONObject)` → products list, e.g.
 * `аۢ`/`а͈`), and gates the paywall/feature paths app-wide.
 *
 * This patch forces **every** such membership test to `true` (replace the `move-result`
 * of each `contains("pro_unlock")` with `const/4 vX, 0x1`). That unlocks all client-side
 * Pro gates coherently, regardless of whether the entitlement came from Billing or the
 * signed store — the store itself is left untouched (no forged blob needed).
 */
@Suppress("unused")
val shimaUnlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Forces every \"pro_unlock\" entitlement check to true, unlocking the " +
        "client-side Pro features without touching the signed purchase store.",
    default = true,
) {
    compatibleWith(SHIMA_COMPATIBILITY)

    val unlockPro by booleanOption(
        key = "shimaUnlockPro",
        default = true,
        title = "Unlock Pro",
        description = "Force all pro_unlock entitlement checks to true.",
    )

    execute {
        if (unlockPro != true) return@execute

        data class Target(val classDef: ClassDef, val method: Method, val index: Int)

        val targets = ArrayList<Target>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val impl = method.implementation ?: return@forEach
                val insns = impl.instructions.toList()
                for (i in insns.indices) {
                    val ref = (insns[i] as? ReferenceInstruction)?.reference
                    if (ref is StringReference && ref.string == "pro_unlock") {
                        // The const-string feeds a contains(...) call whose boolean result
                        // lands in the move-result right after the invoke.
                        for (j in i + 1..minOf(i + 4, insns.size - 1)) {
                            val insn = insns[j]
                            if (insn.opcode == Opcode.INVOKE_VIRTUAL ||
                                insn.opcode == Opcode.INVOKE_VIRTUAL_RANGE ||
                                insn.opcode == Opcode.INVOKE_INTERFACE ||
                                insn.opcode == Opcode.INVOKE_INTERFACE_RANGE
                            ) {
                                val mref = (insn as? ReferenceInstruction)?.reference
                                    as? MethodReference ?: break
                                if (mref.name != "contains") break
                                val after = insns.getOrNull(j + 1)
                                if (after?.opcode == Opcode.MOVE_RESULT) {
                                    targets.add(Target(classDef, method, j + 1))
                                }
                                break
                            }
                        }
                        break
                    }
                }
            }
        }

        var forced = 0
        for (t in targets) {
            val mutableClass = mutableClassDefBy(t.classDef)
            val mm = mutableClass.methods.firstOrNull {
                it.name == t.method.name && it.returnType == t.method.returnType &&
                    it.parameterTypes == t.method.parameterTypes
            } ?: continue
            val impl = mm.implementation ?: continue
            val insn = impl.instructions.toList().getOrNull(t.index)
                as? OneRegisterInstruction ?: continue
            mm.replaceInstruction(t.index, "const/4 v${insn.registerA}, 0x1")
            forced++
        }
        println("[shimaUnlockPro] forced pro_unlock checks: $forced (of ${targets.size} found)")
        requireProgress(targets.size, forced, "shima pro_unlock checks")
    }
}
