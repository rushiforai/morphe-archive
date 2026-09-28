package app.tkiethuynh.patches.proxman

// 20 fields the RN-RevenueCat bridge serializes per EntitlementInfo — mirrors
// EntitlementInfoMapperKt's output so the JS-side `Subscription check:` path finds a value for
// every getter and never throws. Synthetic; dates set to never-expires defaults.
private val FAKE_PRO_FIELDS = listOf(
    "identifier" to V2.string("Pro"),
    "isActive" to V2.TRUE,
    "willRenew" to V2.TRUE,
    "periodType" to V2.string("NORMAL"),
    "latestPurchaseDateMillis" to V2.BOXED_ZERO,
    "latestPurchaseDate" to V2.string("2026-05-16T10:00:00.000Z"),
    "originalPurchaseDateMillis" to V2.BOXED_ZERO,
    "originalPurchaseDate" to V2.string("2026-05-16T10:00:00.000Z"),
    "expirationDateMillis" to V2.NULL,
    "expirationDate" to V2.NULL,
    "store" to V2.string("PLAY_STORE"),
    "productIdentifier" to V2.string("Pro"),
    "productPlanIdentifier" to V2.NULL,
    "isSandbox" to V2.FALSE,
    "unsubscribeDetectedAt" to V2.NULL,
    "unsubscribeDetectedAtMillis" to V2.NULL,
    "billingIssueDetectedAt" to V2.NULL,
    "billingIssueDetectedAtMillis" to V2.NULL,
    "ownershipType" to V2.string("PURCHASED"),
    "verification" to V2.string("VERIFIED"),
)

// Replacement body for EntitlementInfosMapperKt.map(). Uses v0..v5; depends on the original
// method declaring >= 6 registers (Kotlin compiles the iterator/Pair locals into well over
// that). Returns Map<String, Object> with the shape JS expects:
//   { "all": {"Pro": <20-field map>}, "active": {"Pro": same}, "verification": "VERIFIED" }
internal val FAKE_ENTITLEMENT_INFOS_BODY: String = buildString {
    // v0 = synthetic Pro entitlement (the 20 fields above)
    append(linkedHashMapInit("v0"))
    FAKE_PRO_FIELDS.forEach { (k, v) -> append(mapPutConst("v0", k, v)) }
    // v3 = entitlements.active = { "Pro" -> v0 }
    append(linkedHashMapInit("v3"))
    append(mapPutRef("v3", "Pro", "v0"))
    // v4 = entitlements.all = { "Pro" -> v0 } (same reference; JS only reads from it)
    append(linkedHashMapInit("v4"))
    append(mapPutRef("v4", "Pro", "v0"))
    // v5 = top-level wrapper { all, active, verification }
    append(linkedHashMapInit("v5"))
    append(mapPutRef("v5", "all", "v4"))
    append(mapPutRef("v5", "active", "v3"))
    append(mapPutConst("v5", "verification", V2.string("VERIFIED")))
    append("return-object v5\n")
}
