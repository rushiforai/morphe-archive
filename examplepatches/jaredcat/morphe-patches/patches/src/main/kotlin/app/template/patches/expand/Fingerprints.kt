package app.template.patches.expand

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for Expand's Adjust SDK (com.adjust.sdk).
 *
 * How these were chosen from the decompiled tree:
 * 1. Open decompiled/expand/sources/com/adjust/sdk/Adjust.java
 * 2. Find public static void initSdk(AdjustConfig) / trackEvent(AdjustEvent)
 * 3. Translate Java → smali descriptors for the Fingerprint
 *
 * Java:  com.adjust.sdk.Adjust
 * Smali: Lcom/adjust/sdk/Adjust;
 *
 * SDK classes are usually NOT obfuscated, so definingClass + name + parameters
 * is enough — no string/opcode filters required.
 */
object AdjustInitSdkFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "initSdk",
    parameters = listOf("Lcom/adjust/sdk/AdjustConfig;"),
)

object AdjustTrackEventFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "trackEvent",
    parameters = listOf("Lcom/adjust/sdk/AdjustEvent;"),
)

object AdjustIsActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/SubscriptionInfo;",
    name = "getIsActive",
)
