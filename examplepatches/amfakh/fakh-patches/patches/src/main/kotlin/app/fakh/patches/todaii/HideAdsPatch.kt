/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaii

import app.fakh.patches.shared.disableProviders
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The Google Mobile Ads and AppLovin SDKs start from content providers before Application.onCreate.
 */
private val adSdkManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            manifest.disableProviders(
                "com.google.android.gms.ads.MobileAdsInitProvider",
                "com.applovin.sdk.AppLovinInitProvider",
            )
        }
    }
}

/** MobileAdsState.init: starts a coroutine on Dispatchers.Default that calls MobileAds.initialize. */
private object MobileAdsStateInitFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/google/admob/d0;",
    name = "d",
    returnType = "V",
    parameters = listOf(),
)

/** AnalyticsApp.onCreate initializes AppLovinSdk; replace getInstance+initialize so AppLovin is never instantiated. */
private object AnalyticsAppOnCreateFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/google/admob/AnalyticsApp;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/** AdsBanner.shouldShowAd: checked by attachContainer (q) and onResume before creating an AdView. */
private object AdsBannerShouldShowFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/google/admob/a;",
    name = "v",
    returnType = "Z",
    parameters = listOf(),
)

/** AdsBanner.attachContainer: receives the @id/adView LinearLayout on every screen that includes layout_ads_banner. */
private object AdsBannerAttachFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/google/admob/a;",
    name = "q",
    returnType = "V",
    parameters = listOf("Landroid/widget/LinearLayout;"),
)

/** AdsReward.preload: loads a RewardedAd in the background on MainActivity and article detail screens. */
private object AdsRewardPreloadFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/google/admob/i;",
    name = "k",
    returnType = "V",
    parameters = listOf(),
)

/** AdsReward.show: shows the rewarded ad and invokes the reward callback (p1) or AfterRewardAction (p2). */
private object AdsRewardShowFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/google/admob/i;",
    name = "m",
    returnType = "V",
    parameters = listOf("Lhi/a;", "Lmobi/eup/jpnews/google/admob/j;"),
)

/** FeatureAdUnlockManager.requiresAd: returns true when AUDIO_SETTINGS or CAMERA_ANALYSIS needs a rewarded ad. */
private object FeatureRequiresAdFingerprint : Fingerprint(
    definingClass = "Lul/m;",
    name = "d",
    returnType = "Z",
    parameters = listOf("Lul/a;"),
)

/**
 * MainNewsFragment appends NewsHomeViewItem.Ads (Lrk/b$c;->a) via CollectionsKt.plus(Collection, Object) before
 * handing the list to NewsHomeAdapter.m(List).
 */
private object MainNewsAppendAdRowFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/fragment/main/y0;",
    returnType = "V",
    parameters = listOf("Lbr/e1;"),
)

/** MainActivity.c3: decides whether the automatic Premium upsell sheet opens on launch. */
private object MainUpsellGateFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/activity/MainActivity;",
    name = "c3",
    returnType = "Z",
    parameters = listOf(),
)

/** MainActivity.B3: shows the remote-config marketing event icon (MKT_event_popup). */
private object MainMarketingPopupFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/activity/MainActivity;",
    name = "B3",
    returnType = "V",
    parameters = listOf(),
)

/** Ad removal that the Premium unlock pulls in: the app has its own ad paths that Premium alone leaves open. */
internal val hideAdsPatch = patch {
    dependsOn(adSdkManifestPatch)

    execute {
        MobileAdsStateInitFingerprint.method.addInstructions(0, "return-void")

        val onCreate = AnalyticsAppOnCreateFingerprint.method
        val appLovinGetIndex = onCreate.instructions.indexOfFirst {
            it.opcode == Opcode.INVOKE_STATIC &&
                (it as ReferenceInstruction).reference.let { ref ->
                    ref is MethodReference &&
                        ref.definingClass == "Lcom/applovin/sdk/AppLovinSdk;" &&
                        ref.name == "getInstance"
                }
        }
        val appLovinInitIndex = onCreate.instructions.indexOfFirst {
            it.opcode == Opcode.INVOKE_VIRTUAL &&
                (it as ReferenceInstruction).reference.let { ref ->
                    ref is MethodReference &&
                        ref.definingClass == "Lcom/applovin/sdk/AppLovinSdk;" &&
                        ref.name == "initialize"
                }
        }
        if (appLovinGetIndex < 0 || appLovinInitIndex < 0) {
            throw PatchException("Todaii: AppLovinSdk init not found in AnalyticsApp.onCreate.")
        }
        onCreate.replaceInstruction(appLovinInitIndex, "nop")
        onCreate.replaceInstruction(appLovinGetIndex + 1, "const/4 v1, 0x0")
        onCreate.replaceInstruction(appLovinGetIndex, "nop")

        AdsBannerShouldShowFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        AdsBannerAttachFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual { p1, v0 }, Landroid/view/View;->setVisibility(I)V
                return-void
            """,
        )

        // AdsInterval.j (force show) and p (interval check): every full-screen interstitial goes through them.
        val intervalMethods = mutableClassDefBy("Lmobi/eup/jpnews/google/admob/g;").methods
            .filter { (it.name == "j" || it.name == "p") && it.parameterTypes == listOf("Landroidx/fragment/app/v;") }
        if (intervalMethods.size != 2) {
            throw PatchException("Todaii: expected 2 AdsInterval show methods, found ${intervalMethods.size}")
        }
        intervalMethods.forEach { it.addInstructions(0, "return-void") }

        MainUpsellGateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        MainMarketingPopupFingerprint.method.addInstructions(0, "return-void")

        AdsRewardPreloadFingerprint.method.addInstructions(0, "return-void")
        AdsRewardShowFingerprint.method.addInstructions(
            0,
            """
                const-string v0, ""
                invoke-static { p1, p0, p2, v0 }, Lmobi/eup/jpnews/google/admob/i;->n(Lhi/a;Lmobi/eup/jpnews/google/admob/i;Lmobi/eup/jpnews/google/admob/j;Lcom/google/android/gms/ads/rewarded/RewardItem;)V
                if-eqz p2, :done
                invoke-virtual { p2 }, Lmobi/eup/jpnews/google/admob/j;->a()V
                :done
                return-void
            """,
        )
        FeatureRequiresAdFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // Replace `CollectionsKt.plus(items, NewsHomeViewItem$Ads.INSTANCE)` with `CollectionsKt.toList(items)` so the
        // "Remove ads / Upgrade" row is never appended to the Easy News or Normal News feed.
        val feedMethod = MainNewsAppendAdRowFingerprint.method
        val sgetIndex = feedMethod.instructions.indexOfFirst {
            it.opcode == Opcode.SGET_OBJECT &&
                ((it as ReferenceInstruction).reference as FieldReference).definingClass == "Lrk/b\$c;"
        }
        if (sgetIndex < 0) throw PatchException("Todaii: NewsHomeViewItem.Ads append not found in MainNewsFragment.")
        feedMethod.replaceInstruction(
            sgetIndex + 1,
            "invoke-static { p1 }, Lkotlin/collections/r;->I0(Ljava/lang/Iterable;)Ljava/util/List;",
        )

        // AdsInHouseViewModel.D fetches in-house promo banners and popups from product.eupgroup.net/resapi/ads/;
        // AdsInHouseRefresher.b does the same from background workers.
        val inHouseFetch = mutableClassDefBy("Lbr/e;").methods.singleOrNull {
            it.name == "D" && it.parameterTypes.isEmpty() && it.returnType == "V"
        } ?: throw PatchException("Todaii: AdsInHouseViewModel.D not found.")
        inHouseFetch.addInstructions(0, "return-void")

        val inHouseRefresh = mutableClassDefBy("Lbp/b;").methods.singleOrNull {
            it.name == "b" && it.parameterTypes.size == 2
        } ?: throw PatchException("Todaii: AdsInHouseRefresher.b not found.")
        inHouseRefresh.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """,
        )
    }
}
