package app.ahmedyarub.patches.x.premium

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** The subscription checks: "has any Premium tier" names all three entitlements. */
private object HasPremiumFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("feature/premium_basic", "feature/twitter_blue_verified", "feature/premium_plus"),
)

/**
 * The app asks one class whether the account has Premium, as a yes or no per tier set. This makes
 * every such check say yes. Features the server enforces still need a real subscription; what
 * this unlocks is what the app itself gates, such as downloading videos.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium checks",
    description = "Makes the app's own Premium subscription checks always pass. " +
        "Features the server enforces still need a subscription.",
) {
    compatibleWith(COMPATIBILITY_X)

    execute {
        // Each boolean check without parameters that tests only entitlements.
        val checks = mutableClassDefBy(HasPremiumFingerprint.classDef).methods.filter { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.mapNotNull { it.getReference<StringReference>()?.string }?.let { strings ->
                    strings.isNotEmpty() && strings.all { it.startsWith("feature/") }
                } == true
        }
        if (checks.isEmpty()) throw PatchException("The subscription class has no Premium checks")

        checks.forEach { it.returnEarly(true) }
    }
}
