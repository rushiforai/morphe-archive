package app.salaat.patches.rating

import app.salaat.patches.integrity.neutralizeSignatureCheckPatch
import app.salaat.patches.shared.Constants.COMPATIBILITY_SALAAT
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * `MainActivity.onCreate(Bundle)` — its tail builds `MainActivity$requestAppRating$1` and
 * `launch`es it on the lifecycle scope, which runs the Play In-App Review flow
 * (`requestReview` + `launchReviewFlow`). The lambda class is R8-merged with other suspend
 * lambdas (multiplexed by `$r8$classId`), so editing the lambda body is unsafe; instead we cut
 * the launch at the call site.
 */
private object OnCreateFingerprint : Fingerprint(
    definingClass = "Lorg/hicham/salaat/MainActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

@Suppress("unused")
val disableAppRatingPatch = bytecodePatch(
    name = "Disable App Rating Prompt",
    description = "Removes the Play In-App Review (\"rate this app\") prompt launched from " +
        "MainActivity.onCreate, so the review dialog is never requested.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SALAAT)

    dependsOn(neutralizeSignatureCheckPatch)

    execute {
        val method = OnCreateFingerprint.method

        // Find the `new-instance ...MainActivity$requestAppRating$1`. The following two
        // instructions are its <init> and the kotlinx `launch$default` call that starts the
        // review coroutine. Removing the trio leaves the trailing `return-void` intact and
        // every other onCreate side effect untouched.
        val newInstanceIndex = method.implementation!!.instructions
            .withIndex()
            .firstOrNull { (_, instruction) ->
                instruction.opcode == Opcode.NEW_INSTANCE &&
                    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)
                        ?.type == "Lorg/hicham/salaat/MainActivity\$requestAppRating\$1;"
            }
            ?.index
            ?: throw IllegalStateException(
                "requestAppRating\$1 construction not found in onCreate",
            )

        // new-instance + invoke-direct(<init>) + invoke-static(launch$default) = 3 instructions.
        method.removeInstructions(newInstanceIndex, 3)
    }
}
