package app.plyrs1.patches.com_ogestudio_strukpertamini

import app.morphe.patcher.Fingerprint

/**
 * Fingerprint matching SettingFragment.onCreateView(LayoutInflater, ViewGroup, Bundle)
 * Used to inject SettingCreditHelper.setupCreditText(rootView)
 */
object SettingFragmentOnCreateViewFingerprint : Fingerprint(
    definingClass = "Lcom/ogestudio/strukpertamini/ui/setting/SettingFragment;",
    name = "onCreateView",
    returnType = "Landroid/view/View;",
    parameters = listOf(
        "Landroid/view/LayoutInflater;",
        "Landroid/view/ViewGroup;",
        "Landroid/os/Bundle;"
    )
)

/**
 * Fingerprint matching AppPreference.isPremium()
 * Returns boolean flag indicating if the app is in premium status.
 */
object AppPreferenceIsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/ogestudio/strukpertamini/preference/AppPreference;",
    name = "isPremium",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * Fingerprint matching AppPreference.getReview()
 * Returns Boolean indicating whether review has been handled.
 */
object AppPreferenceGetReviewFingerprint : Fingerprint(
    definingClass = "Lcom/ogestudio/strukpertamini/preference/AppPreference;",
    name = "getReview",
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList()
)

/**
 * Fingerprint matching BillingManager.setFreeAccount()
 * Neutralized to prevent resetting premium status when no Google Play purchases are returned.
 */
object BillingManagerSetFreeAccountFingerprint : Fingerprint(
    definingClass = "Lcom/ogestudio/strukpertamini/billing/BillingManager;",
    name = "setFreeAccount",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Fingerprint matching BannerAdsHelper.load()
 * Neutralized to completely prevent loading and displaying banner ads.
 */
object BannerAdsHelperLoadFingerprint : Fingerprint(
    definingClass = "Lcom/ogestudio/strukpertamini/admob/BannerAdsHelper;",
    name = "load",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Fingerprint matching InterstitialHelper.load()
 * Neutralized to prevent loading interstitial ads into memory.
 */
object InterstitialHelperLoadFingerprint : Fingerprint(
    definingClass = "Lcom/ogestudio/strukpertamini/admob/InterstitialHelper;",
    name = "load",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Fingerprint matching HomeFragment$4.onCreateMenu(Menu, MenuInflater)
 * Used to remove the premium action bar icon from HomeFragment options menu.
 */

/**
 * Fingerprint matching LicenseContentProvider.onCreate()
 * Used to neutralize Play Integrity / PairIP startup license check.
 */
object LicenseContentProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * Fingerprint matching LicenseClient.initializeLicenseCheck()
 * Used to neutralize license checking directly.
 */
object LicenseClientInitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Fingerprint matching LicenseClient.startErrorDialogActivity()
 * Neutralized to prevent launching the error dialog activity.
 */
object LicenseClientStartErrorDialogActivityFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startErrorDialogActivity",
    returnType = "V",
    parameters = emptyList()
)
object HomeFragmentOnCreateMenuFingerprint : Fingerprint(
    definingClass = "Lcom/ogestudio/strukpertamini/ui/home/HomeFragment$4;",
    name = "onCreateMenu",
    returnType = "V",
    parameters = listOf(
        "Landroid/view/Menu;",
        "Landroid/view/MenuInflater;"
    )
)

/**
 * Fingerprint matching SettingFragment.clickConfiguration()
 * Used to hide the btnPremium view in SettingFragment.
 */
object SettingFragmentClickConfigurationFingerprint : Fingerprint(
    definingClass = "Lcom/ogestudio/strukpertamini/ui/setting/SettingFragment;",
    name = "clickConfiguration",
    returnType = "V",
    parameters = emptyList()
)
