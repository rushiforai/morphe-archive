package app.template.patches.unifiedremote.premium

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_UNIFIEDREMOTE
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Unified Remote keeps the "Full" state in a `License.Status` SharedPreferences int
 * (0 = Free, 1 = Locked, 2 = Full). The canonical Full check is a single
 * `Z(Context)` method that reads the status int through a same-class `I(Context)`
 * getter and returns whether it equals 2 - it is called from ~20 feature sites.
 *
 * (RevenueCat only feeds the paywall UI for actual buyers: buyers have entitlements
 * in the map, non-buyers get an empty map, so forcing `EntitlementInfo.isActive()`
 * can never unlock anything. Do not re-anchor this patch on RevenueCat.)
 *
 * The holder class is R8-obfuscated (`bh0` on 3.25.1), so it is located by the unique
 * literal "License.Status" instead of its name, and the check by shape.
 */
private const val LICENSE_STATUS_KEY = "License.Status"
private const val CONTEXT = "Landroid/content/Context;"

private fun BytecodePatchContext.licenseStatusClass(): MutableClass {
    val classDef = classDefByStrings(LICENSE_STATUS_KEY).singleOrNull()
        ?: error("Unified Remote license status class not found (key '$LICENSE_STATUS_KEY')")
    return mutableClassDefBy(classDef)
}

private fun MutableMethod.isContextBoolean(): Boolean =
    returnType == "Z" && implementation != null &&
        parameterTypes.map(CharSequence::toString) == listOf(CONTEXT)

private fun MutableMethod.callsIntGetterOf(owner: String): Boolean =
    implementation!!.instructions.any { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref != null && ref.definingClass == owner && ref.returnType == "I" &&
            ref.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT)
    }

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Unlocks Unified Remote Full by forcing the local license status check."
) {
    compatibleWith(COMPATIBILITY_UNIFIEDREMOTE)

    execute {
        val licenseStatus = licenseStatusClass()

        // The Full check: the only Context-boolean in this class that consults the
        // status int getter. Fails loudly if the shape ever changes.
        val fullCheck = licenseStatus.methods.firstOrNull { method ->
            method.isContextBoolean() && method.callsIntGetterOf(licenseStatus.type)
        } ?: error("Unified Remote Full check not found in ${licenseStatus.type}")

        fullCheck.returnEarly(true)
    }
}
