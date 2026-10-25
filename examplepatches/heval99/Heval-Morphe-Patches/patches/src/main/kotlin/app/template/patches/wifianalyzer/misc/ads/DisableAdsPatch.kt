package app.template.patches.wifianalyzer.misc.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_WIFIANALYZER
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Ads are gated by Settings.a(Context), which reads the "next_show_ad_time_millisec"
 * preference and returns true once the hide-until date passes. Every ad checks it:
 * the main banner and the interstitial (through MainScreen's gate wrapper) and the
 * LAN neighbors banner (directly). Forcing the gate false disables all three.
 *
 * Settings is not obfuscated, but the gate is located by its stable preference
 * key plus shape (the only static single-Context boolean with a body reading the
 * key), so the patch survives any future rename.
 */
private const val HIDE_AD_KEY = "next_show_ad_time_millisec"
private const val CONTEXT = "Landroid/content/Context;"

private fun Method.readsHideAdKey() = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == HIDE_AD_KEY
} == true

private fun BytecodePatchContext.adGateClass(): MutableClass {
    val classDef = classDefByStrings(HIDE_AD_KEY).singleOrNull()
        ?: error("WiFi Analyzer ad gate class not found (key '$HIDE_AD_KEY')")
    return mutableClassDefBy(classDef)
}

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_WIFIANALYZER)

    execute {
        // The show-ad gate: the only static single-Context boolean with a body reading
        // the hide-until preference key, in the class owning that key (3.11.2 has one).
        val settings = adGateClass()
        val adGate = settings.methods.filter { method ->
            method.returnType == "Z" && AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT) &&
                method.readsHideAdKey()
        }.singleOrNull() ?: throw PatchException("Expected one WiFi Analyzer ad gate in ${settings.type}")

        adGate.returnEarly(false)
    }
}
