package app.template.patches.fotmob.plus

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.fotmob.misc.extension.sharedExtensionPatch
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Stable, unobfuscated FotMob storage API class.
private const val SHARED_PREFS_REPOSITORY = "Lcom/fotmob/storage/sharedpreference/SharedPreferencesRepository;"

private fun MutableMethod?.returnEarlyIfImplemented(value: Boolean) =
    this?.takeIf { it.implementation != null }?.returnEarly(value)

@Suppress("unused")
val enablePlusPatch = bytecodePatch(
    name = "Enable FotMob+",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    dependsOn(sharedExtensionPatch)

    execute {
        // Disable the staff account bypass (forces the normal path).
        val staffMethod = StaffAccountFingerprint.methodOrNull
        staffMethod.returnEarlyIfImplemented(false)

        // The subscription getter is the manager's only no-arg boolean method that reads a
        // boolean preference through SharedPreferencesRepository (the `valid_subscription`
        // flag that the RevenueCat listener writes). The staff check reads a string pref
        // from the same repository, so match on the boolean `get` specifically.
        val subscriptionGetter = staffMethod?.definingClass
            ?.let { mutableClassDefBy(it) }
            ?.methods
            ?.firstOrNull { method ->
                method.parameterTypes.isEmpty() &&
                    method.returnType == "Z" &&
                    method.implementation != null &&
                    method.implementation!!.instructions.any { insn ->
                        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                        ref != null &&
                            ref.definingClass == SHARED_PREFS_REPOSITORY &&
                            ref.name == "get" &&
                            ref.returnType == "Z"
                    }
            }
        subscriptionGetter?.returnEarly(true)
    }
}
