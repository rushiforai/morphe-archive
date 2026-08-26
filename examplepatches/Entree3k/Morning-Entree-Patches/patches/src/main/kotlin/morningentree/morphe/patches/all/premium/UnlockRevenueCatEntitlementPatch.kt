package morningentree.morphe.patches.all.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import morningentree.morphe.util.injectActiveRevenueCatEntitlements
import morningentree.morphe.util.returnEarly
import java.util.logging.Logger

internal object EntitlementInfosMapperFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/revenuecat/purchases/hybridcommon/mappers/EntitlementInfosMapperKt;" &&
            method.name == "map"
    },
)

internal object EntitlementInfoIsActiveFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/revenuecat/purchases/EntitlementInfo;" &&
            method.name == "isActive"
    },
)

@Suppress("unused")
val unlockRevenueCatEntitlementPatch = bytecodePatch(
    name = "Unlock RevenueCat",
    description = "Premium patch for apps that use RevenueCat",
) {
    execute {
        val logger = Logger.getLogger(this::class.java.name)

        val mapper = EntitlementInfosMapperFingerprint.methodOrNull
        if (mapper != null) {
            mapper.injectActiveRevenueCatEntitlements()
            EntitlementInfoIsActiveFingerprint.methodOrNull?.returnEarly(true)
            logger.info("RevenueCat: injected synthetic active entitlement at EntitlementInfosMapperKt.map.")
        } else {
            logger.info("RevenueCat hybrid mapper not found; app left unchanged.")
        }
    }
}
