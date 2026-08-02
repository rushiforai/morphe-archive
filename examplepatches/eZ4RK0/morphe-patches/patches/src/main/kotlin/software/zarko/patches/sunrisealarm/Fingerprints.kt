package software.zarko.patches.sunrisealarm

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/**
 * Matches the BillingManager method that turns a Play Billing purchase list into the
 * "ads_removed" / "pro_purchased" flags. The class/method names are obfuscated and change
 * between builds, so this is anchored on the in-app product IDs (which don't change) plus
 * the two adjacent `move` instructions that reset both flags to false at the top of the method.
 */
object PurchaseStateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
    filters = listOf(
        // const/4 v0, 0x0
        opcode(Opcode.CONST_4),
        // move v1, v0  (z2 = false)
        opcode(Opcode.MOVE),
        // move v2, v1  (z3 = false), must immediately follow the previous move.
        opcode(Opcode.MOVE, MatchAfterImmediately()),
        string("remove_ads"),
        string("pro"),
        string("pro_discount"),
    )
)

/**
 * Matches PairIP's Application.attachBaseContext(), which calls LicenseClient.checkLicense()
 * on every app start. That check verifies the app was installed from the Play Store with a
 * matching signature and force-closes the app after a delay otherwise - it must be removed for
 * a re-signed, sideloaded patched APK to keep running. Both classes are part of the PairIP
 * protection SDK, not the app's own obfuscated code, so their names are stable across builds.
 */
object LicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/application/Application;",
    name = "attachBaseContext",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
            name = "checkLicense",
        ),
    )
)
