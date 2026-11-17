package app.template.patches.ccleaner.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

// The app-wide Pro answer is the no-arg boolean on PremiumServiceImpl that reads the active flag
// of the AclLicenseInfo in the billing license flow (the other no-arg boolean only compares the
// product type with CCA_MULTI). Method names are Avast's private-use glyphs, so the shape and the
// AclLicenseInfo read are the anchor; 75 call sites ask this one, including the ad service.
internal object PremiumGateFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type ==
            "Lcom/avast/android/cleaner/subscription/premiumService/PremiumServiceImpl;" &&
            method.implementation != null &&
            method.implementation!!.instructions.any { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
                ref?.definingClass == "Lcom/avast/cleaner/billing/api/AclLicenseInfo;"
            }
    },
)
