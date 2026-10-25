package app.template.patches.truecaller.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.truecaller.shared.overrideFeatureToggle
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val MutableMethod.parameterList get() = parameterTypes.map(CharSequence::toString)

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // "Enable Premium" does not remove ads by itself: the ad views below never consult
        // Premium, and the master ads-allowed check (step 5) can stay true for Premium users
        // under a server experiment (EnableAdsForPremiumUsers).

        // 1. Banner and native ads. Each bind method makes its container VISIBLE and attaches
        // the ad view; instead it now sets the container GONE and returns, so no ad view is
        // attached, rendered or reported as inflated. Hooking the bind methods (rather than
        // pinning setVisibility to GONE) also skips the ad's own impression and click wiring.
        val bannerHolder = AdsSwitchViewBindFingerprint.method.parameterList.first()
        val adsContainer = mutableClassDefBy(ADS_CONTAINER)
        val adsContainerLight = mutableClassDefBy(ADS_CONTAINER_LIGHT)
        // The banner bind's second parameter is the layout config; the native binds take the same
        // config after their native ad holder, which gives the native holder types.
        val layoutConfig = adsContainer.methods.firstOrNull {
            it.returnType == "V" && it.parameterList.size >= 2 && it.parameterList.first() == bannerHolder
        }?.parameterList?.get(1) ?: throw PatchException("$ADS_CONTAINER has no banner bind method")
        val nativeHolders = (adsContainer.methods + adsContainerLight.methods)
            .map { it.parameterList }
            .filter { it.size >= 2 && it[1] == layoutConfig && it[0] != bannerHolder }
            .map { it.first() }
            .toSet()
        if (nativeHolders.isEmpty()) throw PatchException("No native ad bind method found")
        val adTypes = nativeHolders + bannerHolder + AD_LAYOUT_TYPE

        for (classDef in listOf(adsContainer, adsContainerLight, mutableClassDefBy(ADS_SWITCH_VIEW))) {
            val binds = classDef.methods.filter { method ->
                method.returnType == "V" && method.name != "<init>" && method.implementation != null &&
                    !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.parameterList.firstOrNull()?.startsWith("L") == true &&
                    method.parameterList.any { it in adTypes }
            }
            if (binds.isEmpty()) throw PatchException("${classDef.type} has no ad bind method")
            // p1 (an object reference) is free once the method returns at once; invoke/range
            // reaches p0..p1 whatever the register count.
            binds.forEach {
                it.addInstructionsChecked(
                    0,
                    """
                        const/16 p1, 0x8
                        invoke-virtual/range {p0 .. p1}, Landroid/view/View;->setVisibility(I)V
                        return-void
                    """,
                )
            }
        }

        // 2. Interstitial ads: the manager reports them as off, so each placement runs the user's
        // action (open WhatsApp, call details, block, pay, ...) at once. Closing the ad activities
        // instead dropped that action, which only runs when the ad is dismissed. The ads-router
        // interstitial and app-open flows start only from this gated flow. Rewarded ads, which
        // share AdInterstitialActivity, are not touched here, but step 5 turns them off too
        // (owner decision 2026-10-15): Who viewed me and the search soft-throttle then go
        // straight to their no-ad fallback.
        InterstitialAdsEnabledFingerprint.method.returnEarly(false)

        // 3. App-open loading screen: finish it right after super.onCreate, the point where the
        // framework expects onCreate to have run. It is only reached from the flow gated above.
        val onCreate = mutableClassDefBy(AD_APP_OPENING_ACTIVITY).methods.firstOrNull {
            it.name == "onCreate" && it.parameterList == listOf("Landroid/os/Bundle;") && it.implementation != null
        } ?: throw PatchException("$AD_APP_OPENING_ACTIVITY has no onCreate(Bundle)")
        val superCall = onCreate.implementation!!.instructions.indexOfFirst { instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            (instruction.opcode == Opcode.INVOKE_SUPER || instruction.opcode == Opcode.INVOKE_SUPER_RANGE) &&
                call?.name == "onCreate"
        }
        if (superCall < 0) throw PatchException("$AD_APP_OPENING_ACTIVITY.onCreate does not call super.onCreate")
        onCreate.addInstructionsChecked(
            superCall + 1,
            """
                invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->finish()V
                return-void
            """,
        )

        // 4. Ads V2 placements (Compose screens, which do not use the ad views above): the
        // placement check returns false at once, so no slot is laid out or loaded. This also
        // removes the "Truecaller Premium / Upgrade for an ad-free experience" row the call log
        // list shows when its slot is active but has no ad (#53); Enable Premium cannot hide it,
        // because the ads module does not read Premium. It is a suspend function, so the boxed
        // Boolean is returned directly.
        AdsV2PlacementEnabledFingerprint.method.addInstructionsChecked(
            0,
            """
                sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object p0
            """,
        )

        // 5. The master "ads allowed" check returns false, the value it has for Premium users, so
        // every ad gate that asks it takes the ad-free path (#53).
        AdsAllowedFingerprint.method.returnEarly(false)

        // 6. Ad toggles, overridden in the toggle resolver because each is read inline at several
        // sites (#53):
        // - "featureAdsOptimisationOnListView" on: only then do the contacts list and the classic
        //   call log ask the check above; otherwise they always merge an ad slot, which falls back
        //   to an "Explore Truecaller Premium" house ad.
        // - "featureAdsRestrictCampaignProcessing" on: the ad campaign fetches return null (every
        //   caller handles that), which stops the ads-segment-profile keyword requests and the
        //   launch prefetch.
        // - "featureConfigManagementSystem" off: the ads-config-engine config sync never runs and
        //   the ads config falls back to its defaults.
        // - "featureEnableOfflineAds" off: no offline ads sync with ads-router.
        // - "featureAdsOnOfferHub" off: the "Recommended Offers" row, which opens OfferHubActivity
        //   (ads-router offer feed), and the offer hub deep link are not offered; the deep link
        //   router then takes its fallback.
        // The tagging service is left alone: it serves the caller ID tag catalogue.
        overrideFeatureToggle("featureAdsOptimisationOnListView", true)
        overrideFeatureToggle("featureAdsRestrictCampaignProcessing", true)
        overrideFeatureToggle("featureConfigManagementSystem", false)
        overrideFeatureToggle("featureEnableOfflineAds", false)
        overrideFeatureToggle("featureAdsOnOfferHub", false)
    }
}
