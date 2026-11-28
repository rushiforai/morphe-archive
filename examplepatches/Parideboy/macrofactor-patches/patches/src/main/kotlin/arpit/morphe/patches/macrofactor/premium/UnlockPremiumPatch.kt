package arpit.morphe.patches.macrofactor.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import arpit.morphe.patches.macrofactor.shared.Constants.COMPATIBILITY_MACROFACTOR_DIET
import arpit.morphe.patches.macrofactor.shared.BuildCustomerInfoFingerprint
import arpit.morphe.patches.macrofactor.shared.BuildCustomerInfoShapeFingerprint
import arpit.morphe.patches.macrofactor.shared.Constants.COMPATIBILITY_MACROFACTOR_WORKOUTS
import arpit.morphe.patches.macrofactor.signature.signatureHashSpoofPatch
import arpit.morphe.util.requireRootMount
import com.android.tools.smali.dexlib2.AccessFlags

private const val EXTENSION_CLASS = "Larpit/morphe/extension/macrofactor/UnlockPremiumPatch;"

/**
 * RevenueCat product id and entitlement ids per app. They are RevenueCat dashboard ids, so they
 * do not appear in the app's binaries; the values are the ones the upstream MacroFactor patches
 * have been shipping against.
 */
private val PRODUCT_AND_ENTITLEMENTS = mapOf(
    COMPATIBILITY_MACROFACTOR_DIET.packageName!! to (
        "com.sbs.diet.1y0599.2w0" to listOf("subscription", "subscription_workouts")
        ),
    COMPATIBILITY_MACROFACTOR_WORKOUTS.packageName!! to (
        "com.sbs.train.subscription.1" to listOf("subscription_workouts", "subscription")
        ),
)

/**
 * The injected block: arguments land in v0..v2 as (JSONObject, String, String[]) for the
 * `/range` call, v3/v4 are scratch. `.locals 17` puts the static form's parameters past
 * v15, hence `move-object/from16`.
 */
internal fun hookSmali(
    productId: String,
    entitlementIds: List<String>,
    jsonRegister: String,
): String {
    // v0 = JSONObject, v1 = product id, v2 = entitlement array.
    val arraySetup = entitlementIds.mapIndexed { index, entitlementId ->
        """
            const/4 v3, 0x$index
            const-string v4, "$entitlementId"
            aput-object v4, v2, v3
        """
    }.joinToString(separator = "\n")

    return """
        move-object/from16 v0, $jsonRegister
        const-string v1, "$productId"
        const/4 v3, 0x${entitlementIds.size}
        new-array v2, v3, [Ljava/lang/String;
$arraySetup
        invoke-static/range { v0 .. v2 }, $EXTENSION_CLASS->updateCustomerInfo(Lorg/json/JSONObject;Ljava/lang/String;[Ljava/lang/String;)V
    """
}

// Extension loading only. No activity context hook: 5.8.13 renamed the Flutter activity
// (`MainActivity` extends an obfuscated `Ls53;`, no `FlutterFragmentActivity` class left),
// and this patch's hook is context-free, so the context would be unused anyway.
internal val extensionPatch = sharedExtensionPatch("macrofactor")

/**
 * Premium unlock for both MacroFactor apps: MacroFactor Workouts (`com.sbs.train`) and
 * MacroFactor (`com.sbs.diet`), the latter on 5.8.11 and 5.8.13.
 *
 * Every `CustomerInfo` is built by RevenueCat's 5-arg `CustomerInfoFactory.buildCustomerInfo`
 * overload, so rewriting the subscriber JSON there covers the online, offline and cached parse
 * paths. That method is found by shape first, which works on both diet builds:
 * - 5.8.11: `CustomerInfoFactory.buildCustomerInfo(...)` in `classes6`, `public final`, so the
 *   JSONObject body is `p1`;
 * - 5.8.13: whole-dex R8 renaming leaves `Lsob;->b(JSONObject, Date, Lw39;, Lvo1;, Z)Lmo1;`,
 *   `.locals 17`, static, so the body is `p0` and `invoke-static/range` is required (its
 *   parameter registers sit past v15).
 *
 * The product id and entitlement ids differ per app, so they are passed to the extension as
 * arguments instead of being baked into it.
 *
 * GMS's signing-certificate hash comes from [signatureHashSpoofPatch] (resolved by shape,
 * falling back to the `AndroidUtilsLight` name), so Firebase App Check / Installations keep
 * working on a build mounted over the genuine Play-signed install.
 *
 * The app keeps Play Billing and Play Integrity, so a re-signed sideload still fails
 * attestation — root mount only.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium (Root)",
    description = "Unlocks all premium features. Requires root: the patched build must " +
        "be mounted over the genuine Play-signed install — a re-signed sideload " +
        "will not work.",
    default = true
) {
    compatibleWith(
        COMPATIBILITY_MACROFACTOR_DIET,
        COMPATIBILITY_MACROFACTOR_WORKOUTS
    )

    availability(requireRootMount)

    dependsOn(
        extensionPatch,
        signatureHashSpoofPatch,
        changePackageInstallerPatch()
    )

    execute {
        val (productId, entitlementIds) =
            PRODUCT_AND_ENTITLEMENTS[packageMetadata.packageName]
                ?: throw PatchException("No RevenueCat ids for ${packageMetadata.packageName}")

        // Intercepts every production CustomerInfo parse path (online, offline and
        // cached) because all of them funnel into this 5-arg overload.
        val customerInfoBuilder = BuildCustomerInfoShapeFingerprint.matchOrNull()?.method
            ?: BuildCustomerInfoFingerprint.matchOrNull()?.method
            ?: throw PatchException("CustomerInfo factory method not found")

        // `invoke-static` writes no registers, so injecting at index 0 is safe either way.
        val jsonRegister = if (AccessFlags.STATIC.isSet(customerInfoBuilder.accessFlags)) "p0" else "p1"

        // v0 = product id, v1 = scratch, v2 = entitlement array, v3 = scratch; the three
        // arguments then sit in v0..v2 for the /range call.
        customerInfoBuilder.addInstructions(0, hookSmali(productId, entitlementIds, jsonRegister))
    }
}
