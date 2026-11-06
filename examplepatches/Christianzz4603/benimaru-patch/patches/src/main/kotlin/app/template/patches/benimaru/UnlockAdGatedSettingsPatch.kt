package app.template.patches.benimaru

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Compatibility for Benimaru Tool (com.benimaru.official).
 * No targets = any version of the package.
 */
val COMPATIBILITY_BENIMARU = Compatibility(
    name = "Benimaru Tool",
    packageName = "com.benimaru.official"
)

/**
 * Private final handlePremiumFeature(Function0) that builds the Sheet dialog.
 * Verified against Benimaru Tool v3.2 Smali.
 */
object HandlePremiumFeatureFingerprint : Fingerprint(
    definingClass = "Lcom/benimaru/official/MainActivity;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lkotlin/jvm/functions/Function0;"),
    // Unordered strings – order does not matter
    strings = listOf(
        "Watch ad to unlock",
        "Get Premium",
        "Not now",
        "Premium feature"
    )
)

/**
 * Static lambda that currently launches the rewarded ad.
 * Signature taken directly from Smali:
 * handlePremiumFeature$lambda$6(MainActivity, Function0, MaterialButton) → Unit
 */
object HandlePremiumFeatureLambdaFingerprint : Fingerprint(
    definingClass = "Lcom/benimaru/official/MainActivity;",
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lkotlin/Unit;",
    parameters = listOf(
        "Lcom/benimaru/official/MainActivity;",
        "Lkotlin/jvm/functions/Function0;",
        "Lcom/google/android/material/button/MaterialButton;"
    ),
    strings = listOf("it")
)

@Suppress("unused")
val unlockAdGatedSettingsPatch = bytecodePatch(
    name = "Unlock ad-gated settings",
    description = "Changes the 'Watch ad to unlock' button label to 'Unlock' and makes the button invoke the original feature callback directly without showing a rewarded advertisement.",
    default = true
) {
    compatibleWith(COMPATIBILITY_BENIMARU)

    execute {
        // ------------------------------------------------------------------
        // 1. Change button label: "Watch ad to unlock" → "Unlock"
        // ------------------------------------------------------------------
        HandlePremiumFeatureFingerprint.method.apply {
            implementation!!.instructions.forEachIndexed { index, instruction ->
                if (instruction.opcode == Opcode.CONST_STRING) {
                    val ref = (instruction as? ReferenceInstruction)?.reference
                    if (ref is StringReference && ref.string == "Watch ad to unlock") {
                        val register = (instruction as OneRegisterInstruction).registerA
                        replaceInstruction(
                            index,
                            "const-string v$register, \"Unlock\""
                        )
                    }
                }
            }
        }

        // ------------------------------------------------------------------
        // 2. Bypass rewarded ad – call the original Function0 (p1) directly
        //
        // Original lambda body (from Smali):
        //   const-string v0, "it"
        //   invoke-static {p2, v0}, ...checkNotNullParameter...
        //   new-instance p2, ...Lambda75;
        //   invoke-direct {p2, p1}, ...<init>...
        //   invoke-direct {p0, p2}, ...showRewardedAd...
        //   sget-object p0, Lkotlin/Unit;->INSTANCE...
        //   return-object p0
        //
        // We remove the three instructions that create the wrapper + call
        // showRewardedAd and insert a direct invoke of p1 (the real callback).
        // ------------------------------------------------------------------
        val lambda = HandlePremiumFeatureLambdaFingerprint.method

        val showAdIndex = lambda.implementation!!.instructions.indexOfFirst { insn ->
            if (insn.opcode != Opcode.INVOKE_DIRECT) return@indexOfFirst false
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "showRewardedAd" &&
                ref.definingClass == "Lcom/benimaru/official/MainActivity;"
        }

        if (showAdIndex == -1) {
            throw PatchException(
                "Could not locate the showRewardedAd call inside the premium-feature lambda"
            )
        }

        val start = showAdIndex - 2
        if (start < 0) {
            throw PatchException("Unexpected instruction layout around showRewardedAd")
        }

        // Remove: new-instance, invoke-direct <init>, invoke-direct showRewardedAd
        lambda.removeInstructions(start, 3)

        // Insert direct call to the original unlock callback
        lambda.addInstructions(
            start,
            """
                invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
            """.trimIndent()
        )
    }
}
