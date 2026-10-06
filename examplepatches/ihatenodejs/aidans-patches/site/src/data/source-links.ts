// Deterministic mapping of patch names to their Kotlin source definitions in aidans-patches
export const GITHUB_REPO = 'https://github.com/ihatenodejs/aidans-patches';
export const GITHUB_BLOB_BASE = `${GITHUB_REPO}/blob/main`;

export const PATCH_SOURCE_FILES: Record<string, string> = {
  // Adobe Scan
  'adobe-scan:Remove Ads and Tracking': 'patches/src/main/kotlin/app/aidan/patches/adobescan/ads/RemoveAdsAndTrackingPatch.kt',
  'adobe-scan:Remove Login': 'patches/src/main/kotlin/app/aidan/patches/adobescan/auth/RemoveLoginPatch.kt',
  'adobe-scan:Remove Useless/Promotional Items': 'patches/src/main/kotlin/app/aidan/patches/adobescan/customization/RemoveUselessPromotionalItemsPatch.kt',
  'adobe-scan:Unlock Premium': 'patches/src/main/kotlin/app/aidan/patches/adobescan/customization/PremiumPatch.kt',
  'adobe-scan:Use System Font': 'patches/src/main/kotlin/app/aidan/patches/adobescan/customization/UseSystemFontPatch.kt',

  // AfterShip
  'aftership:Add Copy Tracking Number Option': 'patches/src/main/kotlin/app/aidan/patches/aftership/customization/AddCopyTrackingNumberOptionPatch.kt',
  'aftership:Bypass Native Signature Check': 'patches/src/main/kotlin/app/aidan/patches/aftership/auth/RemoveLoginPatch.kt',
  'aftership:Custom Google Maps API Key': 'patches/src/main/kotlin/app/aidan/patches/aftership/customization/CustomGoogleMapsApiKeyPatch.kt',
  'aftership:Full AMOLED Theme': 'patches/src/main/kotlin/app/aidan/patches/aftership/customization/FullAmoledThemePatch.kt',
  'aftership:Hide Broken Tracking Map': 'patches/src/main/kotlin/app/aidan/patches/aftership/customization/HideBrokenTrackingMapPatch.kt',
  'aftership:OpenStreetMap Drop-in Replacement': 'patches/src/main/kotlin/app/aidan/patches/aftership/customization/OpenStreetMapPatch.kt',
  'aftership:Remove Ads and Tracking': 'patches/src/main/kotlin/app/aidan/patches/aftership/ads/RemoveAdsAndTrackingPatch.kt',
  'aftership:Remove AfterShip Account Page Links': 'patches/src/main/kotlin/app/aidan/patches/aftership/account/RemoveAfterShipAccountPageLinksPatch.kt',
  'aftership:Remove Feedback': 'patches/src/main/kotlin/app/aidan/patches/aftership/feedback/RemoveFeedbackPatch.kt',
  'aftership:Remove Login': 'patches/src/main/kotlin/app/aidan/patches/aftership/auth/RemoveLoginPatch.kt',
  'aftership:Remove Shipment Sync': 'patches/src/main/kotlin/app/aidan/patches/aftership/sync/RemoveShipmentSyncPatch.kt',

  // Blackjack
  'blackjack:Add Custom Chip Store': 'patches/src/main/kotlin/app/aidan/patches/blackjack/customization/AddCustomChipStorePatch.kt',
  'blackjack:Custom Chip Store Binary Hook': 'patches/src/main/kotlin/app/aidan/patches/blackjack/customization/AddCustomChipStorePatch.kt',
  'blackjack:Remove Ads': 'patches/src/main/kotlin/app/aidan/patches/blackjack/ads/RemoveAdsPatch.kt',
  'blackjack:Remove Internet Permissions': 'patches/src/main/kotlin/app/aidan/patches/blackjack/permissions/RemoveInternetPermissionsPatch.kt',
  'blackjack:Remove Notifications': 'patches/src/main/kotlin/app/aidan/patches/blackjack/notifications/RemoveNotificationsPatch.kt',
  'blackjack:Remove Tracking and Analytics': 'patches/src/main/kotlin/app/aidan/patches/blackjack/tracking/RemoveTrackingAndAnalyticsPatch.kt',
  'blackjack:Skip to Next Level': 'patches/src/main/kotlin/app/aidan/patches/blackjack/customization/SkipToNextLevelPatch.kt',

  // Canvas Student
  'canvas-student:Remove Tracking and Analytics': 'patches/src/main/kotlin/app/aidan/patches/canvas/tracking/RemoveTrackingAndAnalyticsPatch.kt',

  // Fizz
  'fizz:Enable Developer Settings': 'patches/src/main/kotlin/app/aidan/patches/fizz/dev/EnableDeveloperSettingsPatch.kt',
  'fizz:Remove Tracking and Analytics': 'patches/src/main/kotlin/app/aidan/patches/fizz/tracking/RemoveTrackingAndAnalyticsPatch.kt',
  'fizz:Replace Emoji Font with iOS': 'patches/src/main/kotlin/app/aidan/patches/fizz/customization/ReplaceEmojiFontWithIosPatch.kt',
  'fizz:Replace Emoji Font with iOS Asset': 'patches/src/main/kotlin/app/aidan/patches/fizz/customization/ReplaceEmojiFontWithIosPatch.kt',

  // Navigate360 Student
  'navigate360-student:Remove Tracking and Telemetry': 'patches/src/main/kotlin/app/aidan/patches/navigate360/tracking/RemoveTrackingAndTelemetryPatch.kt',
  'navigate360-student:Remove Web Telemetry': 'patches/src/main/kotlin/app/aidan/patches/navigate360/tracking/RemoveWebTrackingAndTelemetryPatch.kt',

  // Sezzle
  'sezzle:Clean Authentication': 'patches/src/main/kotlin/app/aidan/patches/sezzle/auth/CleanAuthenticationPatch.kt',
  'sezzle:Configure Shortcuts': 'patches/src/main/kotlin/app/aidan/patches/sezzle/navigation/ConfigureShortcutsPatch.kt',
  'sezzle:Enable App Debugging': 'patches/src/main/kotlin/app/aidan/patches/sezzle/dev/EnableAppDebuggingPatch.kt',
  'sezzle:Hide Sezzle Mobile': 'patches/src/main/kotlin/app/aidan/patches/sezzle/navigation/HideSezzleMobilePatch.kt',
  'sezzle:Patch Consent Screen': 'patches/src/main/kotlin/app/aidan/patches/sezzle/security/PatchConsentScreenPatch.kt',
  'sezzle:Remove Ads and Tracking': 'patches/src/main/kotlin/app/aidan/patches/sezzle/ads/HideBannerAdsPatch.kt',
  'sezzle:Remove Ads and Tracking from JS Bundle': 'patches/src/main/kotlin/app/aidan/patches/sezzle/ads/HideBannerAdsPatch.kt',
  'sezzle:Remove Promos & Giveaways': 'patches/src/main/kotlin/app/aidan/patches/sezzle/navigation/RemovePromosAndGiveawaysPatch.kt',
  'sezzle:Remove Rewards': 'patches/src/main/kotlin/app/aidan/patches/sezzle/navigation/RemoveRewardsPatch.kt',
  'sezzle:Replace AI Discover with Products': 'patches/src/main/kotlin/app/aidan/patches/sezzle/navigation/ReplaceAiDiscoverWithProductsPatch.kt',
  'sezzle:Replace Shop with Home': 'patches/src/main/kotlin/app/aidan/patches/sezzle/navigation/ReplaceShopWithHomePatch.kt',
  'sezzle:Suppress In-App Updates and Rating Prompts': 'patches/src/main/kotlin/app/aidan/patches/sezzle/security/SuppressUpdatesAndIntegrityPatch.kt',
  'sezzle:Suppress Updates and Integrity Checks': 'patches/src/main/kotlin/app/aidan/patches/sezzle/security/SuppressUpdatesAndIntegrityPatch.kt',
  'sezzle:Unlock Custom App Icons': 'patches/src/main/kotlin/app/aidan/patches/sezzle/customization/UnlockCustomAppIconsPatch.kt',
  'sezzle:Unlock Developer Settings': 'patches/src/main/kotlin/app/aidan/patches/sezzle/dev/UnlockDevSettingsPatch.kt',
  'sezzle:Unlock Receipt Scanner': 'patches/src/main/kotlin/app/aidan/patches/sezzle/features/UnlockReceiptScannerPatch.kt',

  // SidelineSwap
  'sidelineswap:Block Tracking and Telemetry': 'patches/src/main/kotlin/app/aidan/patches/sidelineswap/tracking/BlockTrackingAndTelemetryPatch.kt',
  'sidelineswap:Change Brand Color': 'patches/src/main/kotlin/app/aidan/patches/sidelineswap/customization/ChangeBrandColorPatch.kt',
};

export function getPatchSourceUrl(patchName: string, appId?: string): string {
  const relativePath = (appId && PATCH_SOURCE_FILES[`${appId}:${patchName}`]) || PATCH_SOURCE_FILES[patchName];
  if (!relativePath) {
    return `${GITHUB_BLOB_BASE}/patches`;
  }
  return `${GITHUB_BLOB_BASE}/${relativePath}`;
}
