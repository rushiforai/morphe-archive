package app.template.patches.bplace

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val allowLandscapeOrientationPatch = bytecodePatch(
    name = "Allow landscape orientation",
    description = "Removes Better Place's portrait orientation lock so the app can rotate to landscape.",
    default = true
) {
    compatibleWith(Compatibility(
        name = "Better Place",
        packageName = "com.bplace",
        appIconColor = 0x2196f2,
        targets = listOf(AppTarget(null), AppTarget("1.0.7"))
    ))

    execute {
        val orientationMethods = listOf(
            SplashScreenActivityFingerprint.method,
            SplashScreenFingerprint.method,
            MainActivityFingerprint.method
        )

        orientationMethods.forEach { method ->
            val orientationCallIndices = method.implementation!!.instructions
                .withIndex()
                .filter { (_, instruction) ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass == "Landroid/app/Activity;" &&
                        reference.name == "setRequestedOrientation" &&
                        reference.parameterTypes == listOf("I") &&
                        reference.returnType == "V"
                }
                .map { it.index }

            check(orientationCallIndices.isNotEmpty()) {
                "Expected an orientation call in ${method.definingClass}."
            }

            orientationCallIndices.forEach { index ->
                method.replaceInstruction(index, "nop")
            }
        }
    }
}
