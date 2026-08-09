package app.template.patches.findthefire.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters
import app.template.patches.shared.returnEarly

val FIND_THE_FIRE_COMPATIBILITY = Compatibility(
    name = "Skimboarding",
    packageName = "com.findthefirellc.findthefire",
    apkFileType = ApkFileType.XAPK,
    appIconColor = 0xFF6B35,
    targets = listOf(
        AppTarget(version = "1.0.0", versionCode = 19)
    )
)

/**
 * Find the Fire (Skimboarding) — Unlock FirePass Premium
 *
 * Architecture: Expo / React Native app with RevenueCat Purchases SDK
 * for subscription management. The premium tier is called "FirePass".
 *
 * RevenueCat data flow:
 *   CustomerInfo → EntitlementInfos { all, active } → JS via RN bridge
 *
 * Patch strategy — two key patches:
 *
 *   1. EntitlementInfo.isActive() → always return true
 *      Makes every entitlement entry report as active.
 *
 *   2. EntitlementInfos.getActive() → return getAll() instead
 *      The getActive() method reads the `active` field (built in constructor
 *      by filtering all entries where isActive() is true). But the constructor
 *      runs BEFORE our isActive() patch takes effect, so the active map
 *      is already built with the original values. By patching getActive()
 *      to return `all` instead of `active`, we include all entitlement entries.
 *
 *   Combined effect: any entitlement in CustomerInfo (including "firepass"
 *   if configured in RevenueCat dashboard) will appear active in JS.
 *
 *   Note: If RevenueCat returns an EMPTY entitlement map for free users
 *   (no "firepass" entry at all), additional injection is needed at the
 *   CustomerInfoMapperKt.map() level.
 */
@Suppress("unused")
val findTheFireUnlockFirePassPatch = bytecodePatch(
    name = "Unlock FirePass Premium",
    description = "Unlocks FirePass premium features in Skimboarding: spot filtering " +
        "by skill level, advanced map features, and session log tools.",
) {
    compatibleWith(FIND_THE_FIRE_COMPATIBILITY)

    execute {
        EntitlementInfoIsActiveFingerprint.method.returnEarly(true)

        EntitlementInfosMapperKtMapFingerprint.method.ensureRegisters(9)
        EntitlementInfosMapperKtMapFingerprint.method.clearBody()
        EntitlementInfosMapperKtMapFingerprint.method.addInstructions(
            0,
            """
            const-string v0, "firepass"
            new-instance v1, Ljava/util/HashMap;
            invoke-direct {v1}, Ljava/util/HashMap;-><init>()V
            const-string v2, "identifier"
            invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            const-string v2, "isActive"
            sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            const-string v2, "willRenew"
            sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            const-string v2, "productIdentifier"
            invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            const-string v2, "periodType"
            const-string v3, "NORMAL"
            invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            const-string v2, "store"
            const-string v3, "PLAY_STORE"
            invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            const-string v2, "isSandbox"
            sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            const-string v2, "ownershipType"
            const-string v3, "PURCHASED"
            invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            const-string v2, "verification"
            const-string v3, "NOT_REQUESTED"
            invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            new-instance v4, Ljava/util/LinkedHashMap;
            invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V
            invoke-virtual {v4, v0, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            const-string v2, "all"
            const-string v3, "active"
            new-instance v5, Ljava/util/LinkedHashMap;
            invoke-direct {v5}, Ljava/util/LinkedHashMap;-><init>()V
            invoke-virtual {v5, v2, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            invoke-virtual {v5, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            const-string v3, "verification"
            const-string v4, "NOT_REQUESTED"
            invoke-virtual {v5, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            return-object v5
            """.trimIndent(),
        )
    }
}
