package app.template.patches.aiscore.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_AISCORE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val USER_PREFERENCE = "Lcom/onesports/score/base/preference/UserPreference;"

private fun Method.sameClassNoArgCalls(returnType: String): List<MethodReference> =
    implementation?.instructions?.toList().orEmpty()
        .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .filter {
            it.definingClass == USER_PREFERENCE && it.parameterTypes.isEmpty() && it.returnType == returnType
        }

/**
 * The server's VIP state is cached in MMKV and every client gate reads it through
 * UserPreference (name kept, getters R8-renamed): a "logged in AND vip == 1" boolean and the
 * raw vip int. The boolean gate is the only no-arg boolean getter that calls both a same-class
 * boolean (logged in) and a same-class int (vip); the vip getter is the int it calls.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the VIP interface and removes ads. Premium data the AiScore " +
            "server delivers (e.g. predictions, dropping odds) is validated server-side and " +
            "is not unlocked."
) {
    compatibleWith(COMPATIBILITY_AISCORE)

    execute {
        val methods = mutableClassDefBy(USER_PREFERENCE).methods
        val vipGate = methods.singleOrNull { method ->
            method.implementation != null &&
                method.returnType == "Z" &&
                method.parameterTypes.isEmpty() &&
                method.sameClassNoArgCalls("Z").isNotEmpty() &&
                method.sameClassNoArgCalls("I").isNotEmpty()
        } ?: throw PatchException("VIP gate not found on $USER_PREFERENCE")

        val vipLevelName = vipGate.sameClassNoArgCalls("I").single().name
        val vipLevel = methods.single {
            it.name == vipLevelName && it.parameterTypes.isEmpty() && it.returnType == "I"
        }

        vipGate.returnEarly(true)
        vipLevel.returnEarly(1)
    }
}
