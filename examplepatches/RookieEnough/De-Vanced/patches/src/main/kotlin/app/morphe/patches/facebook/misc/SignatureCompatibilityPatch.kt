/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.shared.Constants
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SIGNATURE_COMPATIBILITY =
    "Lapp/morphe/extension/facebook/SignatureCompatibility;"

private val extensionPatch = sharedExtensionPatch("facebook", false)

/**
 * Facebook reads its APK certificate through several independent trust,
 * permissions, provider, and attestation paths. Keep those paths intact while
 * substituting the official public certificate only when they read the
 * established De-Vanced signer.
 */
@Suppress("unused")
val signatureCompatibilityPatch = bytecodePatch(
    name = "Facebook signature compatibility",
    description = "Keeps Facebook first-party navigation working after signing with the established De-Vanced key.",
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(extensionPatch)

    execute {
        var signatureByteHooks = 0

        classDefForEach { classDef ->
            classDef.methods.forEach methodLoop@{ method ->
                val implementation =
                    method.implementation ?: return@methodLoop
                val instructions = implementation.instructions.toList()
                val callIndices = instructions.mapIndexedNotNull {
                        index,
                        instruction,
                    ->
                    val reference =
                        (instruction as? ReferenceInstruction)
                            ?.reference as? MethodReference
                    if (reference?.definingClass ==
                            "Landroid/content/pm/Signature;" &&
                        reference.name == "toByteArray" &&
                        reference.returnType == "[B" &&
                        reference.parameterTypes.isEmpty()
                    ) {
                        index
                    } else {
                        null
                    }
                }
                if (callIndices.isEmpty()) return@methodLoop

                val mutableMethod = mutableClassDefBy(classDef)
                    .findMutableMethodOf(method)
                callIndices.asReversed().forEach { index ->
                    val moveResult = requireNotNull(
                        instructions.getOrNull(index + 1)
                            as? OneRegisterInstruction,
                    ) {
                        "Signature.toByteArray result was not resolved in $method"
                    }
                    check(moveResult.opcode == Opcode.MOVE_RESULT_OBJECT) {
                        "Signature.toByteArray is not followed by move-result-object in $method"
                    }
                    val register = moveResult.registerA
                    mutableMethod.addInstructions(
                        index + 2,
                        """
                            invoke-static/range {v$register .. v$register}, $SIGNATURE_COMPATIBILITY->spoofSignatureBytes([B)[B
                            move-result-object v$register
                        """.trimIndent(),
                    )
                    signatureByteHooks++
                }
            }
        }
        check(signatureByteHooks > 0) {
            "No Facebook Signature.toByteArray consumers were found"
        }
        println(
            "[SignatureCompatibility] signatureByteHooks=$signatureByteHooks",
        )
    }
}
