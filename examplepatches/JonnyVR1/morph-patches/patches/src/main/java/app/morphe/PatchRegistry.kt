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
 * 11. AB Test Override           - Override A/B test group assignments to force default behavior
 * 12. Remote Config Override     - Override remote configuration values to control feature flags
 * 13. Search Discovery           - Expand liked-user filter radius/age limits
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
        abTestOverridePatch,
        remoteConfigOverridePatch,
        searchDiscoveryPatch,
    )
}
