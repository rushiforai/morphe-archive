package arpit.morphe.patches.macrofactor.diet.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import arpit.morphe.patches.macrofactor.diet.shared.Constants.COMPATIBILITY_MACROFACTOR_DIET
import arpit.morphe.patches.macrofactor.premium.BuildCustomerInfoFingerprint
import arpit.morphe.patches.macrofactor.signature.gmsCertHashMethod
import arpit.morphe.patches.macrofactor.signature.injectCertHashSpoof
import arpit.morphe.patches.macrofactor.signature.inputCertSha1
import arpit.morphe.util.requireRootMount
import com.android.tools.smali.dexlib2.AccessFlags

private const val EXTENSION_CLASS = "Larpit/morphe/extension/macrofactor/diet/UnlockPremiumPatch;"

// Extension loading only. No activity context hook: 5.8.13 renamed the Flutter activity
// (`MainActivity` extends an obfuscated `Ls53;`, no `FlutterFragmentActivity` class left),
// and this patch's hook is context-free, so the context would be unused anyway.
internal val dietExtensionPatch = sharedExtensionPatch("macrofactor")

/**
 * MacroFactor (`com.sbs.diet`) premium unlock, for 5.8.11 and 5.8.13.
 *
 * Every `CustomerInfo` is built by RevenueCat's 5-arg `CustomerInfoFactory.buildCustomerInfo`
 * overload, so rewriting the subscriber JSON there covers the online, offline and cached parse
 * paths. That method is found by shape, which works on both builds:
 * - 5.8.11: `CustomerInfoFactory.buildCustomerInfo(...)` in `classes6`, `public final`, so the
 *   JSONObject body is `p1`;
 * - 5.8.13: whole-dex R8 renaming leaves `Lsob;->b(JSONObject, Date, Lw39;, Lvo1;, Z)Lmo1;`,
 *   `.locals 17`, static, so the body is `p0` and `invoke-static/range` is required (its
 *   parameter registers sit past v15).
 *
 * Also spoofs GMS's signing-certificate hash (resolved by shape, falling back to the
 * `AndroidUtilsLight` name) so Firebase App Check / Installations keep working on a build
 * mounted over the genuine Play-signed install.
 *
 * The app keeps Play Billing and Play Integrity, so a re-signed sideload still fails
 * attestation — root mount only.
 */
@Suppress("unused")
val unlockPremiumDietPatch = bytecodePatch(
    name = "Unlock Premium (Root)",
    description = "Unlocks all premium features. Requires root: the patched build must " +
        "be mounted over the genuine Play-signed install — a re-signed sideload " +
        "will not work.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MACROFACTOR_DIET)

    availability(requireRootMount)

    dependsOn(
        dietExtensionPatch,
        changePackageInstallerPatch()
    )

    execute {
        gmsCertHashMethod().injectCertHashSpoof(inputCertSha1())

        val customerInfoBuilder = BuildCustomerInfoShapeFingerprint.matchOrNull()?.method
            ?: BuildCustomerInfoFingerprint.matchOrNull()?.method
            ?: throw PatchException("CustomerInfo factory method not found")

        // invoke-static writes no registers, so injecting at index 0 is safe either way.
        val jsonRegister = if (AccessFlags.STATIC.isSet(customerInfoBuilder.accessFlags)) "p0" else "p1"

        customerInfoBuilder.addInstructions(
            0,
            """
                invoke-static/range { $jsonRegister .. $jsonRegister }, ${EXTENSION_CLASS}->updateCustomerInfo(Lorg/json/JSONObject;)V
            """
        )
    }
}
