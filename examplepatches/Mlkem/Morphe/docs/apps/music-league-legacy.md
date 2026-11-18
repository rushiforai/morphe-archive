# Music League patches compatible with Morphe

Custom Morphe patch bundle for the Android version of Music League.

## Target inspected APK

* App: Music League
* Package: `com.musicleague.app`
* Version name: `1.4.9`
* Version code: `357`
* Runtime: Expo / React Native
* Main app bundle: `assets/index.android.bundle`
* Bundle type: Hermes JavaScript bytecode
* Hermes bytecode version: `96`

## Add to Morphe

Use this source URL in Morphe Manager:

```text
https://github.com/Mlkem/Morphe
```

Or use the add-source link:

```text
https://morphe.software/add-source?github=Mlkem/Morphe
```

## Current patch bundle

This bundle contains patches for Music League’s Android APK.

### Stable patches

1. `Disable Expo updates`

   Changes the Android manifest so Expo OTA updates do not replace patched local code at launch. Also disables Android backup/restore behavior that may restore cached app state.

2. `Pin local Expo config`

   Rewrites `assets/app.config` to remove or disable the Expo update URL and force the app toward the local bundled assets.

3. `Disable ad SDK manifest components`

   Removes or disables ad SDK manifest components and ad identifier permissions where safe.

   Important: this patch must not remove or corrupt the real AdMob application ID. The AdMob app ID uses `~`, for example:

   ```text
   ca-app-pub-xxxxxxxxxxxxxxxx~xxxxxxxxxx
   ```

   That app ID must stay valid or the app can fail with publisher configuration errors.

4. `Neutralize bundled ad unit IDs`

   Replaces bundled AdMob ad unit IDs in the Hermes bundle with same-length non-serving placeholders.

   This patch only targets AdMob IDs containing `/`, for example:

   ```text
   ca-app-pub-xxxxxxxxxxxxxxxx/xxxxxxxxxx
   ```

   It intentionally skips app IDs containing `~`.

5. `Neutralize premium and reward-ad prompts`

   Attempts to remove bundled premium, reward-ad, and ad-related prompt text from `assets/index.android.bundle` using same-length text replacement.

   This is a safe string-level patch. It does not modify Hermes opcodes or function bodies.

6. `Disable ad and promo remote config`

   Blackholes known ad, reward, paywall, and premium-banner remote-config keys inside the local Hermes bundle and app config.

   This targets bundled/default config keys such as:

   ```text
   banner_ads_enabled
   interstitial_ads_enabled
   mrec_ads_enabled
   rewarded_ads_enabled
   paywall_feature_enabled
   paywall_modal_config_content
   ad_reward
   ads_card_description
   subscription_headline
   subscription_subtitle
   rewarded_headline
   bannerEnabled
   rewardedEnabled
   paywallFeatureEnabled
   ```

   The goal is to prevent local/default config from enabling premium or ad-promo UI surfaces.

### Disabled safety patch

7. `Hermes hide ad promo surfaces`

   This patch is intentionally disabled by default.

   Direct Hermes bytecode function modification caused the app to hang on the intro/loading screen. It remains in the repo only as a disabled safety stub.

   Do not enable this patch unless the Hermes function mapping has been fully verified.

## Why Expo updates are patched first

The APK has Expo updates enabled in `AndroidManifest.xml`:

* `expo.modules.updates.ENABLED=true`
* `EXPO_UPDATES_CHECK_ON_LAUNCH=ALWAYS`
* update URL: `https://u.expo.dev/c0a173c1-8772-4ecc-ab1d-821cd556380d`

Because the real app UI/business logic is inside Hermes bytecode, any local bundle patch can be overwritten by Expo OTA updates unless updates are pinned off first.

## Ad-disable approach

The APK uses a mediated ad stack. The patch approach is intentionally layered:

1. Disable or remove ad SDK manifest components where safe.
2. Keep the real AdMob app ID intact so the app does not fail startup validation.
3. Neutralize AdMob ad unit IDs so ad requests cannot use valid placements.
4. Disable Expo OTA updates so patched local bundle changes are not replaced.
5. Neutralize bundled ad/premium prompt strings.
6. Blackhole known ad, reward, and paywall remote-config keys.
7. Avoid direct Hermes opcode/function patching unless absolutely necessary.

This avoids resizing the Hermes bytecode bundle and reduces the risk of corrupting the app startup path.

## What these patches do not do

These patches do not modify:

* account access
* paid account entitlements
* server-side account status
* licensing
* authentication
* app security controls
* backend behavior

The patches are focused on local APK behavior, ad SDK initialization, ad unit references, local config, Expo update behavior, and bundled UI strings/config keys.

## Build

This follows the Morphe patch template pattern.

Build the Android `.mpp` bundle with:

```bash
./gradlew :patches:buildAndroid
```

Expected output:

```text
patches/build/libs/patches-0.3.0.mpp
```

The exact file name depends on the `version` value in:

```text
gradle.properties
```

Example:

```properties
version=0.3.0
```

## Release workflow

If publishing as a Morphe repo source, use the release workflow to generate/update:

```text
patches-bundle.json
patches-list.json
```

These files are used by Morphe Manager when adding the GitHub repository as a source.

Do not manually edit generated release files unless you know exactly what Morphe expects.

## Repo icon

To show a custom icon in Morphe Manager, place a square PNG at the repo root:

```text
patches-bundle.png
```

Recommended size:

```text
512x512 PNG
```

Correct location:

```text
.github/
gradle/
patches/
README.md
gradle.properties
settings.gradle.kts
patches-bundle.png
```

## Testing

Always patch the original APK, not an APK already modified by an earlier failed patch attempt.

Recommended install flow:

```bash
adb uninstall com.musicleague.app
adb install patched.apk
```

If the app behaves strangely after installing a new patched APK, clear data or fully uninstall before reinstalling.

If the app hangs on the intro/loading screen, confirm that `Hermes hide ad promo surfaces` is disabled.

If a publisher configuration error appears, confirm that the AdMob app ID containing `~` was not modified or removed.

## Next patch point

Actual Music League behavior is inside:

```text
assets/index.android.bundle
```

That file is Hermes bytecode. For deeper UI/logic changes, the next realistic options are:

1. Replace `assets/index.android.bundle` with a properly rebuilt Hermes bundle from source.
2. Safely patch bundled config/defaults so ad and premium UI surfaces are never enabled.
3. Write a verified Hermes bytecode-level patch only after exact function mapping is confirmed.

Normal Java/Kotlin Morphe bytecode fingerprints will mostly hit Expo, React Native, Google, billing, ads, and SDK wrapper code — not the app’s own screen logic.
