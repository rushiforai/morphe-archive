package app.template.patches.ccleaner.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// BaseAdService.areAdsAllowed() is the app's own ad switch: it asks the premium boolean first and
// otherwise the remote advertising setting. Method names are obfuscated glyphs, so the anchor is
// the stable log string plus the no-arg boolean call on the PremiumService interface.
internal object AdsAllowedFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf(".areAdsAllowed() - result: false"),
    custom = { method, classDef ->
        classDef.type == "Lcom/avast/android/cleaner/advertisement/BaseAdService;" &&
            method.implementation != null &&
            method.implementation!!.instructions.any { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass ==
                    "Lcom/avast/android/cleaner/subscription/premiumService/PremiumService;" &&
                    ref.returnType == "Z" &&
                    ref.parameterTypes.isEmpty()
            }
    },
)
