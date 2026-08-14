package app.morphe

import app.morphe.patcher.patch.Patch
import com.p1.mobile.putong.data.*

/**
 * Registry of every patch shipped by this bundle.
 *
 * Categories:
 *  1. GMS Compatibility          - Signature spoofing, auth headers, MicroG support, GMS availability bypass
 *  2. Premium Unlock             - Tier statuses, privilege gates, subscription
 *                                  validation, regional gates, feature gates, display
 *  3. Messaging Enhancement      - Message limits, pin chat, voice/video calls, quick chat
 *  4. Privacy Controls           - Hide from nearby, visitor footprint, mysterious mode
 *  5. Analytics Disable          - Disable all analytics, telemetry, device fingerprinting
 *  6. Dialog Cleanup             - Remove annoying promotional dialogs
 *  7. UI Cleanup                 - Remove guides, banners, stickers, decorations, AI prompts
 *  8. Live Streaming             - Live entry animation, push limit bypass, swipe card unlimited
 *  9. Privacy Enhancement        - Root/emulator detection bypass, ShuMeng SDK blocking, package enumeration prevention
 * 10. Ad Removal                 - Navigation bar ads, native feed ads, live streaming ads, live square ads
 * 11. Remote Config Override     - Override remote config values for beneficial feature defaults
 * 12. AB Test Override           - Override A/B test values to enable beneficial features
 * 13. Search Discovery           - Expand search filters: unlimited distance, full age range
 */
object PatchRegistry {
    val allPatches: Set<Patch<*>> = setOf(
        gmsCompatibilityPatch,
        premiumUnlockPatch,
        analyticsDisablePatch,
        privacyControlsPatch,
        dialogCleanupPatch,
        messagingPatch,
        uiCleanupPatch,
        liveStreamingPatch,
        privacyEnhancementPatch,
        adRemovalPatch,
        remoteConfigOverridePatch,
        abTestOverridePatch,
        searchDiscoveryPatch,
    )
}
