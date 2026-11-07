package app.diskwala.patches.ad

import app.diskwala.patches.shared.Constants.COMPATIBILITY_DISKWALA
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/**
 * Disables ads at the SDK boundary for DiskWala 26.9.
 *
 * The premium patch keeps the app on the PREMIUM branch, so the native ad
 * initialization call (j5/u.a) is normally never reached. This patch is the
 * safety net for provider auto-init and for any remaining direct SDK init.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Prevents AppLovin, Google MobileAds, Vungle, IronSource/LevelPlay, Mintegral, BigoAds, BidMachine and Meta Audience Network from initializing, so no ads are requested.",
    default = true
) {
    compatibleWith(COMPATIBILITY_DISKWALA)

    execute {
        fun MutableMethod.replaceBody(smali: String) {
            val count = implementation?.instructions?.count()
                ?: error("Method ${definingClass}->${name} has no implementation")
            removeInstructions(0, count)
            addInstructions(0, smali)
        }

        fun stubBooleanProvider(fingerprint: app.morphe.patcher.Fingerprint) {
            fingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // ---------------------------------------------------------------
        // 1. App-level Google MobileAds init wrapper
        // ---------------------------------------------------------------
        // This is the only ad initialization reachable from the launch-state
        // flow when the session is not premium. Stub it unconditionally.
        GoogleMobileAdsInitializerFingerprint.method.addInstructions(0, "return-void")

        // ---------------------------------------------------------------
        // 2. Google MobileAds auto-init provider
        // ---------------------------------------------------------------
        // The real initialization is in attachInfo(), not onCreate().
        MobileAdsInitProviderAttachInfoFingerprint.method.replaceBody(
            """
                invoke-super {p0, p1, p2}, Landroid/content/ContentProvider;->attachInfo(Landroid/content/Context;Landroid/content/pm/ProviderInfo;)V
                return-void
            """
        )
        stubBooleanProvider(MobileAdsInitProviderFingerprint)

        // ---------------------------------------------------------------
        // 3. Third-party ad provider auto-init
        // ---------------------------------------------------------------
        stubBooleanProvider(AppLovinInitProviderFingerprint)
        stubBooleanProvider(VungleProviderFingerprint)
        stubBooleanProvider(IronSourceLifecycleProviderFingerprint)
        stubBooleanProvider(IronSourceLevelPlayLifecycleProviderFingerprint)
        stubBooleanProvider(MBComponentLifecycleProviderFingerprint)
        stubBooleanProvider(BigoAdsProviderFingerprint)
        stubBooleanProvider(BidMachineInitProviderFingerprint)
        stubBooleanProvider(AudienceNetworkContentProviderFingerprint)
        stubBooleanProvider(AppMeasurementContentProviderFingerprint)

        // ---------------------------------------------------------------
        // 4. Direct SDK initialization fallback
        // ---------------------------------------------------------------
        // If the AppLovin provider is bypassed but something still calls the
        // SDK directly, keep it cold as well.
        AppLovinSdkInitializeFingerprint.method.addInstructions(0, "return-void")
    }
}
