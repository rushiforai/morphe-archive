package io.github.henr1klmb.patches.mobilede

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val MOBILE_DE_COMPATIBILITY = Compatibility(
    packageName = "de.mobile.android.app",
    name = "mobile.de",
    targets = listOf(AppTarget("10.28.2")),
)

private const val SRP_LISTING_CLASS = "Lde/mobile/android/srp/SRPListing;"
private const val AD_REQUEST_CONFIG_CLASS = "Lde/mobile/android/advertisement/request/AdRequestConfig;"
private const val COMPOSITE_TRACKING_BACKEND_CLASS = "Lde/mobile/android/tracking/backend/CompositeTrackingBackend;"
private const val PARTNERSHIP_PROVIDER_CLASS = "Lde/mobile/android/vip/details/partnership/PartnershipProvider;"
private const val HOME_FEED_ITEM_SEARCH_CHAT_TEASER_CLASS = "Lde/mobile/android/homefeed/HomeFeedItem\$SearchChatTeaser;"
private const val HOME_FEED_UI_ITEM_SEARCH_CHAT_TEASER_CLASS = "Lde/mobile/android/homefeed/ui/HomeFeedUiItem\$SearchChatTeaser;"
private const val HOME_FEED_DATA_ITEM_CLASS = "Lde/mobile/android/homefeed/model/HomeFeedData\$Item;"

// Sponsored & In-Feed Ads Fingerprints

internal object SrpListingIsTopAdFingerprint : Fingerprint(
    definingClass = SRP_LISTING_CLASS,
    name = "isTopAd",
    returnType = "Z",
    parameters = emptyList(),
)

internal object SrpListingIsTopOfPageAdFingerprint : Fingerprint(
    definingClass = SRP_LISTING_CLASS,
    name = "isTopOfPageAd",
    returnType = "Z",
    parameters = emptyList(),
)

internal object SrpListingIsOnePageAdFingerprint : Fingerprint(
    definingClass = SRP_LISTING_CLASS,
    name = "isOnePageAd",
    returnType = "Z",
    parameters = emptyList(),
)

internal object MobeeSrpListingItemIsTopAdFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/searchchat/MobeeSRPListingItem;",
    name = "isTopAd",
    returnType = "Z",
    parameters = emptyList(),
)

internal object SrpListingReferenceDataIsSponsoredFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/searchchat/model/SrpListingReferenceData;",
    name = "isSponsored",
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList(),
)

internal object AdvertisementContainerLoadPublisherAdFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/advertisement/ui/AdvertisementContainer;",
    name = "loadPublisherAd",
    returnType = "V",
    parameters = listOf(
        "Lde/mobile/android/advertisement/utils/AdvertisingFacade;",
        AD_REQUEST_CONFIG_CLASS,
        AD_REQUEST_CONFIG_CLASS,
    ),
)

internal object DefaultAdvertisingFacadeLoadPublisherAdFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/advertisement/DefaultAdvertisingFacade;",
    name = "loadPublisherAd",
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Lde/mobile/android/advertisement/utils/AdvertisingFacade\$AdvertisingFacadePresenter;",
        AD_REQUEST_CONFIG_CLASS,
        AD_REQUEST_CONFIG_CLASS,
    ),
)

internal object InlineAdvertisementViewHolderBindFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/srp/ui/adapter/InlineAdvertisementViewHolder;",
    name = "bind",
    returnType = "V",
    parameters = listOf("Lde/mobile/android/srp/ui/model/SRPItem;"),
)

// Tracking & Analytics Fingerprints

internal object AdjustInitSdkFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "initSdk",
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustConfig;"),
)

internal object AdjustTrackingSdkManagerInitializeFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/tracking/AdjustTrackingSDKManager;",
    name = "initialize",
    returnType = "V",
    parameters = emptyList(),
)

internal object AdjustTrackingSdkManagerOnConsentChangedFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/tracking/AdjustTrackingSDKManager;",
    name = "onConsentChanged",
    returnType = "V",
    parameters = emptyList(),
)

internal object CompositeTrackingBackendTrackEventFingerprint : Fingerprint(
    definingClass = COMPOSITE_TRACKING_BACKEND_CLASS,
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Lde/mobile/android/tracking/event/Event;"),
)

internal object CompositeTrackingBackendTrackScreenFingerprint : Fingerprint(
    definingClass = COMPOSITE_TRACKING_BACKEND_CLASS,
    name = "trackScreen",
    returnType = "V",
    parameters = listOf("Lde/mobile/android/tracking/event/ScreenView;"),
)

internal object CompositeTrackingBackendTrackUserParameterFingerprint : Fingerprint(
    definingClass = COMPOSITE_TRACKING_BACKEND_CLASS,
    name = "trackUserParameter",
    returnType = "V",
    parameters = listOf("Lde/mobile/android/tracking/event/UserParameter;"),
)

internal object CompositeTrackingBackendTrackDefaultPushPermissionStateFingerprint : Fingerprint(
    definingClass = COMPOSITE_TRACKING_BACKEND_CLASS,
    name = "trackDefaultPushPermissionState",
    returnType = "V",
    parameters = listOf("Lde/mobile/android/tracking/parameters/PushNotificationPermissionState;"),
)

// AI Summary Fingerprints

internal object LeadHistoryCallDataGetAiSummaryFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/dealer/leaddetails/remote/LeadHistoryCallData;",
    name = "getAiSummary",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

internal object LeadHistoryItemCallGetAiSummaryFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/lead/LeadHistoryItem\$Call;",
    name = "getAiSummary",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

// Mobee AI Assistant Fingerprints

internal object MobeeSrpVariationGetShowsFabFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/abtesting/experiments/MobeeSrpVariation;",
    name = "getShowsFab",
    returnType = "Z",
    parameters = emptyList(),
)

internal object AiExtendedFloatingActionButtonExtendFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/ui/view/AiExtendedFloatingActionButton;",
    name = "extend",
    returnType = "V",
    parameters = emptyList(),
)

internal object HomeFeedDataToEntityMapperMapSearchChatTeaserItemFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/homefeed/mapper/HomeFeedDataToEntityMapper;",
    name = "mapSearchChatTeaserItem",
    returnType = HOME_FEED_ITEM_SEARCH_CHAT_TEASER_CLASS,
    parameters = listOf(HOME_FEED_DATA_ITEM_CLASS),
)

internal object HomeFeedToHomeFeedUiMapperMapSearchChatTeaserFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/homefeed/data/HomeFeedToHomeFeedUiMapper;",
    name = "mapSearchChatTeaser",
    returnType = HOME_FEED_UI_ITEM_SEARCH_CHAT_TEASER_CLASS,
    parameters = listOf(HOME_FEED_ITEM_SEARCH_CHAT_TEASER_CLASS),
)

internal object HomeFeedSearchChatTeaserViewHolderBindFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/homefeed/ui/HomeFeedAdapter\$HomeFeedViewHolder\$SearchChatTeaser;",
    name = "bind",
    returnType = "V",
    parameters = listOf("Lde/mobile/android/homefeed/ui/HomeFeedUiItem;"),
)

// CHECK24 Insurance Fingerprints

internal object VipListingGetInsurancePlansFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/vip/VIPListing;",
    name = "getInsurancePlans",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

internal object Check24PartnershipItemBindFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/vip/details/partnership/PartnershipAdapter\$PartnershipDataViewHolder\$Check24PartnershipItem;",
    name = "bind",
    returnType = "V",
    parameters = listOf(PARTNERSHIP_PROVIDER_CLASS),
)

internal object InsurancePartnershipItemBindFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/vip/details/partnership/PartnershipAdapter\$PartnershipDataViewHolder\$InsurancePartnershipItem;",
    name = "bind",
    returnType = "V",
    parameters = listOf(PARTNERSHIP_PROVIDER_CLASS),
)
