package mightymich.morphe.patches.com.camerasideas.instashot

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Unlocks InShot Pro:
 *
 * Whole-app Pro check funnels through one read in UserManager (obfuscated class):
 * instance method ()Z that reads the pref key "DebugPro".
 *
 * Class is found by unique pref literal "SubscribeProOfHw" (R8 keeps string constants).
 * Forcing that gate to true unlocks watermark-off, remove-ads SKU gate, paid packs, HD export.
 *
 * On-device AI tools may still fail on re-signed builds (native signing-key check).
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks InShot Pro: no export watermark, no ads, paid filters/effects/HD. " +
        "On-device AI tools may still require original signing key.",
    default = true
) {
    compatibleWith(InShotCompatibility.INSHOT)

    execute {
        // Pin UserManager by unique pref key (stable across R8 renames)
        val userManagerDef = classDefByStrings("SubscribeProOfHw")
            .singleOrNull()
            ?: throw PatchException(
                "InShot: UserManager (Pro gate) not found by pref key \"SubscribeProOfHw\". " +
                    "Obfuscation map may have changed."
            )
        val userManager = mutableClassDefBy(userManagerDef)

        // Pro decision: lone instance ()Z that reads "DebugPro"
        val isProGate = userManager.methods.singleOrNull { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "Z" &&
                method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any { instruction ->
                    (instruction as? ReferenceInstruction)?.reference
                        ?.let { it as? StringReference }
                        ?.string == "DebugPro"
                } == true
        } ?: throw PatchException(
            "InShot: Pro decision ()Z reading \"DebugPro\" not found uniquely in UserManager."
        )

        isProGate.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}