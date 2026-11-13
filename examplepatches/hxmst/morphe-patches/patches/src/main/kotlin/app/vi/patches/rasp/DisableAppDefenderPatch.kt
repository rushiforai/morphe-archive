package app.vi.patches.rasp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.vi.patches.shared.Constants.COMPATIBILITY_VI
import app.vi.patches.shared.JuspayRootCheckFingerprint
import app.vi.patches.shared.RaspExitProcessFingerprint
import app.vi.patches.shared.RaspHandlerInstallFingerprint
import app.vi.patches.shared.RaspKillHandlerFingerprint
import app.vi.patches.shared.RaspLifecycleRegistrationFingerprint
import app.vi.patches.shared.RaspLoadFingerprint
import app.vi.patches.shared.RaspProxyOnCreateFingerprint
import app.vi.patches.shared.RootBeerRootCheckFingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val disableAppDefenderPatch = bytecodePatch(
    name = "Disable RASP",
    description = "Bypasses device security checks such as root, USB debugging, and modified environment " +
            "detection, so the app can be used normally on any device.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VI)

    execute {
        runCatching {
            RaspLoadFingerprint.method.addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        runCatching {
            RaspExitProcessFingerprint.method.addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        runCatching {
            RaspKillHandlerFingerprint.method
        }

        runCatching {
            RaspHandlerInstallFingerprint.method.addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        runCatching {
            val appClassName = "com.mventus.selfcare.activity.MainApplication"

            val onCreate = RaspProxyOnCreateFingerprint.method
            val instructions = onCreate.implementation!!.instructions.toList()

            var getterRef: MethodReference? = null
            for ((index, instruction) in instructions.withIndex()) {
                if (instruction.opcode != Opcode.INVOKE_STATIC) continue
                val ref = (instruction as ReferenceInstruction).reference as MethodReference
                if (ref.returnType != "Ljava/lang/String;" || ref.parameterTypes.isNotEmpty()) continue
                val feedsProxyCall = instructions.drop(index + 1).take(3).any { next ->
                    next.opcode == Opcode.INVOKE_STATIC &&
                            ((next as ReferenceInstruction).reference as MethodReference).let { nextRef ->
                                nextRef.returnType == "Landroid/app/Application;" && nextRef.parameterTypes.size == 2
                            }
                }
                if (feedsProxyCall) {
                    getterRef = ref
                    break
                }
            }
            val proxyGetterRef = getterRef ?: throw IllegalStateException(
                "Could not locate the RASP proxy Application name getter in onCreate"
            )

            val proxyClass = mutableClassDefBy(proxyGetterRef.definingClass)
            val getter = proxyClass.methods.first { method ->
                method.name == proxyGetterRef.name &&
                        method.returnType == "Ljava/lang/String;" &&
                        method.parameters.isEmpty() &&
                        AccessFlags.STATIC.isSet(method.accessFlags)
            }
            val getterInstructions = getter.implementation!!.instructions.toList()
            val sget = getterInstructions.first { it.opcode == Opcode.SGET_OBJECT }
            val register = (sget as OneRegisterInstruction).registerA
            getter.replaceInstruction(
                getterInstructions.indexOf(sget),
                "const-string v$register, \"$appClassName\""
            )
        }

        runCatching {
            RaspLifecycleRegistrationFingerprint.method.addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        runCatching {
            RootBeerRootCheckFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }

        runCatching {
            JuspayRootCheckFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }
    }
}
