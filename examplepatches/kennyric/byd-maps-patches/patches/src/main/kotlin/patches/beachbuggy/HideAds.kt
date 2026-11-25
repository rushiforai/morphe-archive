package patches.beachbuggy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

internal const val ADS_POLICY = "Lcom/vectorunit/VuDevicePolicy;"

/**
 * The app itself uses this flag to turn ads, the UMP consent flow and Play Age Signals off on
 * televisions and cars; the flag also reaches the native engine through
 * MainActivity.nativeSetAdsAndAgeChecksEnabled. With it false, MobileAds never initializes,
 * consent screens never show, and every ad load/show falls back to the game's own
 * "unavailable" native callbacks before any ad network is contacted.
 */
internal val beachBuggyAdsGate = bytecodePatch {
    dependsOn(originalInput)
    execute {
        val owner = mutableClassDefBy(ADS_POLICY)
        val gate = owner.methods.singleOrNull {
            it.name == "areAdsAndAgeChecksEnabled" && it.parameterTypes.isEmpty() &&
                it.returnType == "Z"
        } ?: error("Beach Buggy ads policy gate changed")
        val body = gate.implementation?.instructions?.toList().orEmpty()
        check(body.size == 2 && body.last().opcode == Opcode.RETURN &&
            body.first().opcode == Opcode.SGET_BOOLEAN) {
            "Beach Buggy ads policy gate has unexpected code"
        }
        gate.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
@Suppress("unused")
val beachBuggyHideAds = bytecodePatch(
    name = "Hide ads",
    description = "Turns the ad support flag off, exactly like the game does on televisions and in cars. " +
        "No ad SDK is initialized, no consent screen or age check appears, and every interstitial and " +
        "rewarded request follows the game's own 'unavailable' path.",
    default = true,
) {
    compatibleWith(beachBuggy)
    dependsOn(beachBuggyAdsGate)
}
