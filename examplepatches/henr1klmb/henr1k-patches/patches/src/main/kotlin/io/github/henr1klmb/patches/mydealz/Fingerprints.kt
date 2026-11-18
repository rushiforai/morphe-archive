package io.github.henr1klmb.patches.mydealz

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal val MYDEALZ_COMPATIBILITY = Compatibility(
    packageName = "com.tippingcanoe.mydealz",
    name = "mydealz",
    targets = listOf(AppTarget("8.21.01")),
)

// Tracking & Analytics Fingerprints

internal object AdjustInitSdkFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "initSdk",
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustConfig;"),
)

internal object AdjustLifecycleProviderFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/SystemLifecycleContentProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList(),
)

internal object MobileAdsInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAds;",
    name = "initialize",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

internal object MobileAdsInitializeWithListenerFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAds;",
    name = "initialize",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/google/android/gms/ads/initialization/OnInitializationCompleteListener;",
    ),
)

internal object MobileAdsInitProviderFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAdsInitProvider;",
    name = "attachInfo",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/pm/ProviderInfo;"),
)

internal object FirebaseAnalyticsSetCurrentScreenFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "setCurrentScreen",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object FirebaseAnalyticsSetConsentFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "a",
    returnType = "V",
    parameters = listOf("Ljava/util/Map;"),
    strings = listOf("granted", "denied"),
)

// Sponsored Deals & Feed Ads Fingerprints

internal object DisplayInformationSponsoredTitleFingerprint : Fingerprint(
    definingClass = "Lcom/pepper/network/apirepresentation/DisplayInformationApiRepresentation;",
    name = "getSponsoredTitle",
    returnType = "Lcom/pepper/network/apirepresentation/DisplayInformationApiRepresentation\$SponsoredTitleApiRepresentation;",
    parameters = emptyList(),
)

internal object DisplayInformationSponsoredLogoUrlsFingerprint : Fingerprint(
    definingClass = "Lcom/pepper/network/apirepresentation/DisplayInformationApiRepresentation;",
    name = "getSponsoredLogoUrls",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

internal object AdContainerViewHolderBindFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;", "Lpc;"),
    custom = { method, _ ->
        method.name == "d" && method.implementation?.instructions?.any {
            it is ReferenceInstruction && it.reference.toString().contains("Lcom/pepper/presentation/ads/AdViewContainer;")
        } == true
    },
)

internal object SponsoredDealViewHolderBindFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;", "Lpc;"),
    custom = { method, _ ->
        method.name == "d" && method.implementation?.instructions?.any {
            it is ReferenceInstruction && it.reference.toString().contains("Ld3e;")
        } == true
    },
)

internal object SponsoredDiscussionViewHolderBindFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;", "Lpc;"),
    custom = { method, _ ->
        method.name == "d" && method.implementation?.instructions?.any {
            it is ReferenceInstruction && it.reference.toString().contains("Le3e;")
        } == true
    },
)

internal object SponsoredFeedbackViewHolderBindFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;", "Lpc;"),
    custom = { method, _ ->
        method.name == "d" && method.implementation?.instructions?.any {
            it is ReferenceInstruction && it.reference.toString().contains("Lf3e;")
        } == true
    },
)

// Popups & Review Prompts Fingerprints

internal object PlayCoreReviewFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/play/core/review/b;",
    name = "a",
    returnType = "Lcom/google/android/gms/tasks/Task;",
    parameters = listOf("Landroid/app/Activity;", "Lcom/google/android/play/core/review/ReviewInfo;"),
    strings = listOf("confirmation_intent"),
)

internal object NotificationPermissionPromptFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroidx/fragment/app/Fragment;", "Lkotlin/jvm/functions/Function0;"),
    strings = listOf("NotificationsPermissionBottomSheetFragment", "android.permission.POST_NOTIFICATIONS"),
)

internal object CsatSurveyDialogFingerprint : Fingerprint(
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    strings = listOf("arg:show_csat_params", "Argument arg:show_csat_params should be set."),
)
