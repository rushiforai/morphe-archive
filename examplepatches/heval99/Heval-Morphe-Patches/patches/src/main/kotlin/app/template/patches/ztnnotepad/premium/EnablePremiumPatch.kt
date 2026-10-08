package app.template.patches.ztnnotepad.premium

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_ZTNNOTEPAD
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val USER_PREMIUM_DATA = "Lcom/ztnstudio/notepad/buy_ad_free/billing/model/UserPremiumData;"
private const val AD_FREE_HELPER = "Lcom/ztnstudio/notepad/buy_ad_free/BuyAdFreePreferenceHelper;"

/** The single concrete no-arg boolean method on [type] (optionally reading [string]). */
private fun BytecodePatchContext.booleanGetter(type: String, string: String? = null) =
    mutableClassDefBy(type).methods.singleOrNull { method ->
        method.implementation != null &&
            method.returnType == "Z" &&
            method.parameterTypes.isEmpty() &&
            (string == null || method.implementation!!.instructions.any {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == string
            })
    } ?: throw PatchException("Boolean getter not found on $type")

/**
 * Every premium gate (paywall, note list/editor, checklist, deleted notes and the in-app ad
 * slots) reads UserPremiumData's premium getter; a few also accept the legacy "isPurchased"
 * ad-free preference. Both classes keep their names; the getters are R8-renamed (b()/a() in
 * 5.4.3), so they are matched by shape: UserPremiumData's only no-arg boolean, and the
 * helper's no-arg boolean that reads "isPurchased".
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks #Notepad premium and hides the paywall and in-app ad slots."
) {
    compatibleWith(COMPATIBILITY_ZTNNOTEPAD)

    execute {
        booleanGetter(USER_PREMIUM_DATA).returnEarly(true)
        booleanGetter(AD_FREE_HELPER, "isPurchased").returnEarly(true)
    }
}
