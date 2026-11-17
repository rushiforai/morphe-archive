# Waypoint (com.greycastel.waypoint)

A React Native compass app. The "Waypoint Pro" unlock (products `waypoint_lifetime`,
`waypoint_monthly`, `waypoint_yearly`; entitlement id `Waypoint Pro`) is enforced
client-side through RevenueCat (react-native-purchases 9.15.0) and the APK is
protected by Google Play PairIP. Supported version: 1.10.1 (versionCode 83).

## Unlock Waypoint Pro

Two edits work together:

1. `RNPurchasesModule.getCustomerInfo(Promise)` is rewritten to resolve immediately
   with a fabricated CustomerInfo map that carries an active, lifetime `Waypoint Pro`
   entitlement. The JS SDK calls it at startup, so the app sees Pro even when
   api.revenuecat.com is unreachable (DNS blockers, MITM, offline). The replacement
   body uses registers v0-v5, so the method register count is raised to 8.
2. `EntitlementInfosMapperKt.map()` is rewritten to return the same entitlement map.
   This covers the `Purchases-CustomerInfoUpdated` event path on installs where
   RevenueCat is reachable.

Why both: a mapper-only variant unlocked nothing on devices where the RevenueCat
backend request fails, because no CustomerInfo is ever delivered and the mapper never
runs.

## Disable PairIP license check

Empties `com.pairip.licensecheck.LicenseClient.checkLicense(Context)`, with the
`licensecheck3` package variant as a fallback. Without this, PairIP kills a
re-signed APK. This app has no `assets/pairipcore` VM layer.

## Skip Waypoint onboarding paywall

Patches `assets/index.android.bundle` (Hermes bytecode). The `/(onboarding)/paywall`
route component runs its env setup (router, `completeOnboarding` store action), then
invokes the app's own free-choice handler instead of rendering the PaywallSheet and
returns null. The tutorial finishes straight into the app, `hasCompletedOnboarding`
is genuinely persisted by the app itself (no redirect loop), and the paywall never
appears. The patch matches a 24-byte window unique to this build and fails loudly if
the bundle changed. Upgrade upsell buttons elsewhere also just return to the app,
which matches an unlocked build.

## Known limits (server-side, not unlockable locally)

- The MapLibre maps token worker (`waypoint-maps-token.pyerschris.workers.dev`)
  rejects requests without a real Pro entitlement ("Maps token denied: no active
  Pro entitlement").
- Cloud backup/sync and Rally live location depend on Waypoint's backend and may
  still require a real Pro account.

## Install notes

- Morphe re-signs the APK with its own key: uninstall the Play-installed original
  first, and back up app data (pins, settings, trails).
- Verified on-device against 1.10.1 by applying the identical three smali edits with
  MT Manager: pairip kill + bridge promise resolve + mapper injection. Pro unlocked
  with RevenueCat unreachable (`CertPathValidatorException` on every
  /v1/subscribers call).

## Version bumping

1. Open the new APK and confirm these still exist:
   - `Lcom/revenuecat/purchases/react/RNPurchasesModule;->getCustomerInfo(Lcom/facebook/react/bridge/Promise;)V`
   - `Lcom/revenuecat/purchases/hybridcommon/mappers/EntitlementInfosMapperKt;->map(Lcom/revenuecat/purchases/EntitlementInfos;)Ljava/util/Map;`
   - `Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V`
2. Check `RNPurchasesModule.PLUGIN_VERSION` (react-native-purchases). The mapper
   shape is stable across SDK 8.x/9.x releases; `getCustomerInfo` is a stable
   bridge method.
3. For the paywall patch, run `scripts/derive-paywall-pattern.py` on the new
   `assets/index.android.bundle` (needs `pip install hermes-dec`) and paste the
   printed `pattern` into `SkipOnboardingPaywallPatch.kt`.
4. Add the new version string to `COMPATIBILITY_WAYPOINT` targets and rebuild.
