package dev.custom.gboardpatches.patches.haptics

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Resolved bytecode signatures for Gboard's native press effect player.
 */
data class PressEffectPlayerBindings(
    val getterClass: String,
    val getterMethod: String,
    val playerInterface: String,
    val playMethod: String
)

object PressEffectPlayerFinder {

    /**
     * Dynamically locates the field storing `SoftKeyView` in the PointerTracker class.
     * In Gboard 18.0.3, this is `Lpvi;->m:Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;`.
     */
    fun findSoftKeyViewFieldName(ownerClass: MutableClass): String {
        return ownerClass.fields.firstOrNull {
            it.type == "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"
        }?.name ?: "m"
    }

    /**
     * Dynamically discovers Gboard's native `PressEffectPlayer` module by scanning methods
     * in the PointerTracker class (such as the release-haptic dispatcher `pvi.w` or `pvi.D`).
     *
     * This dynamically resolves the obfuscated getter (`phk.a()`) and play method (`phm.d(View, int)`),
     * ensuring resilience across different Gboard releases and obfuscation passes.
     */
    fun findPressEffectPlayer(ownerClass: MutableClass): PressEffectPlayerBindings? {
        for (method in ownerClass.methods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            for (i in instructions.indices) {
                val inst = instructions[i]
                val opName = inst.opcode.name.uppercase()
                if (opName.contains("INVOKE_INTERFACE") || opName.contains("INVOKE-INTERFACE")) {
                    val methodRef = (inst as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                    val paramTypes = methodRef.parameterTypes.map { it.toString() }
                    if (paramTypes.size == 2 &&
                        paramTypes[0] == "Landroid/view/View;" &&
                        paramTypes[1] == "I" &&
                        methodRef.returnType == "V"
                    ) {
                        val playerInterface = methodRef.definingClass
                        val playMethod = methodRef.name

                        // Look backward within the method for the static call that acquired the player instance
                        for (j in (i - 1) downTo 0) {
                            val prevInst = instructions[j]
                            val prevOpName = prevInst.opcode.name.uppercase()
                            if (prevOpName.contains("INVOKE_STATIC") || prevOpName.contains("INVOKE-STATIC")) {
                                val prevRef = (prevInst as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                                if (prevRef.returnType == playerInterface && prevRef.parameterTypes.isEmpty()) {
                                    return PressEffectPlayerBindings(
                                        getterClass = prevRef.definingClass,
                                        getterMethod = prevRef.name,
                                        playerInterface = playerInterface,
                                        playMethod = playMethod
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
        return null
    }
}
