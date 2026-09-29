package app.template.patches.jetaudio.premium

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_JETAUDIO
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * jetAudio keeps every purchase state in one class (compiled from JInAppInfo.java): a set
 * of static booleans with per-plugin getters that OR the fields, plus a fallback helper
 * `a(Context)`. The class is obfuscated (default-package `uy` on 13.1.2) but holds unique
 * literals, so it is located by the "ok_purchased_plugin_yes" marker instead of its name.
 *
 * Forcing every *leaf* boolean getter to true unlocks Premium, all sound/UI/widget/pebble
 * plugins and the ad unlocker. Compound getters and the inverted upsell check are left
 * alone - they OR the patched leaves, so they flip to the purchased state by themselves.
 */
private const val PURCHASE_MARKER = "IAB: QueryInventory info: BGV(%d), XTAL(%d), AM3D(%d), MAXX(%d), VIS(%d), CLOUD(%d), AD(%d), UI(%d), Pebble(%d)"

private fun BytecodePatchContext.purchaseInfoClass(): MutableClass {
    val classDef = classDefByStrings(PURCHASE_MARKER).singleOrNull()
        ?: error("jetAudio purchase info class not found (marker '$PURCHASE_MARKER')")
    return mutableClassDefBy(classDef)
}

private fun MutableMethod.isPurchaseGetter(): Boolean =
    returnType == "Z" && implementation != null &&
        (parameterTypes.isEmpty() || parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;"))

private fun MutableMethod.callsAnyOf(targets: Set<String>): Boolean =
    implementation!!.instructions.any { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref != null && "${ref.name}(${ref.parameterTypes.joinToString("")})" in targets
    }

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Unlocks jetAudio Premium, all plugins and the ad unlocker."
) {
    compatibleWith(COMPATIBILITY_JETAUDIO)

    execute {
        val purchaseInfo = purchaseInfoClass()
        val getters = purchaseInfo.methods.filter { it.isPurchaseGetter() }
        val getterSignatures = getters.map { "${it.name}(${it.parameterTypes.joinToString("")})" }.toSet()

        // Only patch leaf getters (those that do not call another getter of this class).
        // The compound ones (e.g. "purchased any plugin") then follow the patched leaves.
        getters
            .filterNot { it.callsAnyOf(getterSignatures) }
            .forEach { it.returnEarly(true) }
    }
}
