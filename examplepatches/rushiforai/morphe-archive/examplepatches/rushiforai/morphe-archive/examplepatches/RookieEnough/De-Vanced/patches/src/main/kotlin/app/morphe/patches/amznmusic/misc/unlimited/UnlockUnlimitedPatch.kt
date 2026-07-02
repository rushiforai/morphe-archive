/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/amznmusic/misc/unlimited/UnlockUnlimitedPatch.kt
 */
package app.morphe.patches.amznmusic.misc.unlimited

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.amznmusic.misc.extension.sharedExtensionPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.registersUsed
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val USER_CLASS = "Lcom/amazon/music/account/User;"

internal object UserConstructorFingerprint : Fingerprint(
    definingClass = USER_CLASS,
    name = "<init>",
    returnType = "V",
    custom = { method, _ -> method.name == "<init>" },
)

@Suppress("unused")
val unlockUnlimitedPatch = bytecodePatch(
    name = "Unlock Unlimited",
    description = "Unlock Music Unlimited features.",
) {
    compatibleWith(AppCompatibilities.AMAZON_MUSIC)

    dependsOn(sharedExtensionPatch)

    execute {
        val ctor = UserConstructorFingerprint.method
        val benefitsInstructionIndex = ctor.indexOfFirstInstructionOrThrow {
            getReference<FieldReference>()?.name == "benefits"
        }

        // Upstream uses the first register from the instruction's registersUsed list.
        val register = ctor.getInstruction(benefitsInstructionIndex).registersUsed[0]

        ctor.addInstructions(
            benefitsInstructionIndex,
            """
                invoke-static {}, Lapp/morphe/extension/amznmusic/patches/UnlockUnlimitedPatch;->createBenefitSet()Ljava/util/Set;
                move-result-object p$register
            """,
        )
    }
}

