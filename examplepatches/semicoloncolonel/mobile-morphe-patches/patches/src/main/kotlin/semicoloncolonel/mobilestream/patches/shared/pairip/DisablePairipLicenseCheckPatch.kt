/*
 * Same approach as hoo-dles' "Disable Pairip license check" (GPL-3.0):
 * https://github.com/hoo-dles/morphe-patches/tree/main/patches/src/main/kotlin/hoodles/morphe/patches/all/pairip/license
 * CREDIT FOR THE APPROACH GOES TO hoo-dles.
 */

package semicoloncolonel.mobilestream.patches.shared.pairip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.dealnews.shared.Constants as DealNews
import semicoloncolonel.mobilestream.patches.dealseek.shared.Constants as DealSeek
import semicoloncolonel.mobilestream.patches.foxone.shared.Constants as FoxOne
import semicoloncolonel.mobilestream.patches.moviebase.shared.Constants as Moviebase
import semicoloncolonel.mobilestream.patches.whitehouse.shared.Constants as WhiteHouse
import semicoloncolonel.mobilestream.patches.nfg.shared.Constants as Nfg
import semicoloncolonel.mobilestream.patches.retailmenot.shared.Constants as RetailMeNot
import semicoloncolonel.mobilestream.patches.settingshome.shared.Constants as SettingsHome

// Google's Pairip licensing (com.pairip.licensecheck) asks the Play Store
// whether this install came from Play, and blocks the app when it did not.
// Every re-signed app fails that check. This is the on-device license check
// only; it does not touch Play Integrity attestation.

internal object PairipProcessResponseFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseClient;" && method.name == "processResponse"
    },
)

internal object PairipValidateResponseFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        (classDef.type == "Lcom/pairip/licensecheck/LicenseResponseHelper;" ||
            classDef.type == "Lcom/pairip/licensecheck/ResponseValidator;") &&
            method.name == "validateResponse"
    },
)

@Suppress("unused")
val disablePairipLicenseCheckPatch = bytecodePatch(
    name = "Disable Pairip license check",
    description = "Lets the patched app start by skipping Google's Pairip license check.",
) {
    compatibleWith(
        FoxOne.COMPATIBILITY,
        DealSeek.COMPATIBILITY,
        DealNews.COMPATIBILITY,
        RetailMeNot.COMPATIBILITY,
        SettingsHome.COMPATIBILITY,
        WhiteHouse.COMPATIBILITY,
        Nfg.COMPATIBILITY,
        Moviebase.COMPATIBILITY,
    )

    execute {
        // Some versions drop Pairip licensing (Moviebase 7.7.1 has no
        // com.pairip classes), and then there is nothing to turn off.
        PairipProcessResponseFingerprint.methodOrNull?.apply {
            // Turn off the repeated background check: the sget-boolean of
            // repeatedCheckEnabled becomes a constant false, in place.
            val instructions = implementation!!.instructions.toList()
            instructions.forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.SGET_BOOLEAN) return@forEachIndexed
                val field = (instruction as ReferenceInstruction).reference as FieldReference
                if (field.name != "repeatedCheckEnabled") return@forEachIndexed
                val register = (instruction as OneRegisterInstruction).registerA
                replaceInstruction(index, "const/4 v$register, 0x0")
            }
            // Treat every license response as code 0 (licensed).
            addInstructions(0, "const/4 p1, 0x0")
        }
        // Skip the signature check of the license response.
        PairipValidateResponseFingerprint.methodOrNull?.addInstructions(0, "return-void")
    }
}
