# ggyasin-morphe-patches

Local [Morphe](https://github.com/MorpheApp) patches for Android apps.

## Add to Morphe

[Add this patch source to Morphe](https://morphe.software/add-source?github=ggYasin/ggyasin-morphe-patches)

Or in Morphe Manager open **Sources**, tap **+**, choose **Remote**, and enter
`github.com/ggYasin/ggyasin-morphe-patches`.

The source follows the standard release flow: stable patches come from `main`, and
turning on **Pre-release patches** in the source's options follows `dev`.

## Compatibility

- App: ZenSMS
- Package: `com.zensms.app`
- Version: `1.2.04` (`141`)
- Input format: XAPK

- App: Offline Games
- Package: `com.JindoBlu.OfflineGames`
- Versions: `3.15.3` (`3327`, `arm64-v8a`), `3.14.1` (`3204`, `armeabi-v7a`)
- Input format: complete APKS or XAPK bundle

- App: 9GAG
- Package: `com.ninegag.android.app`
- Version: `8.23.0` (`80230000`)
- Input format: APK

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.6.0](https://github.com/ggYasin/ggyasin-morphe-patches/releases/tag/v1.6.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 9GAG&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 8.23.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Deactivate Firebase Analytics (9GAG 8.23.0)](#deactivate-firebase-analytics-9gag-8-23-0) | Optional: disables Firebase Analytics collection using its documented manifest setting. Does not remove Firebase services. |  |
| [Remove 9GAG ads, promoted posts and trackers (8.23.0)](#remove-9gag-ads-promoted-posts-and-trackers-8-23-0) | Disables ad gates and bottom-banner initialization, filters promoted feed posts, and blocks listed ad/tracking hosts. |  |

</details>

<details open>
<summary>📦 ZenSMS&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.2.04 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Expanded OTP detection](#expanded-otp-detection) | Extends ZenSMS's original OTP extractor with universal and Persian patterns. |  |
| [RTL SMS lists](#rtl-sms-lists) | Adds RTL conversation rows while keeping conversation titles left to right. |  |
| [enable premium state](#enable-premium-state) | Makes synchronous and reactive premium checks report true. |  |

</details>

<details open>
<summary>📦 Offline Games&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 3.15.3 | 3.14.1 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fast Offline Games startup](#fast-offline-games-startup) | Stops the loading screen waiting for Firebase/Remote Config and country lookup, and initializes ads in the background. Network requests may continue after startup. |  |
| [In-house ad not clickable](#in-house-ad-not-clickable) | Stops the in-house ad from opening the Play Store when tapped, so an accidental click does not leave the game. The ad and its close button are otherwise unchanged. |  |
| [In-house ad only](#in-house-ad-only) | Stops Offline Games from requesting rewarded ads, so the game always falls back to its own in-house ad. Banners and interstitials are untouched. |  |
| [Instant in-house ad close](#instant-in-house-ad-close) | Shows the house-ad close button on opening, hides the countdown, and initializes its counter as complete. Loads patched native code for mounted installs. |  |

</details>

<!-- PATCHES_END -->

## Patch details

### Enable premium state

Makes ZenSMS's synchronous and reactive premium-state checks report enabled.

### Expanded OTP detection

Keeps ZenSMS's original OTP handler and extends only its existing extractor.
Three stock regex slots gain universal one-time-password wording plus Persian
`کد`, `رمز`, and `رمز پویا` contexts, including Persian and Arabic-Indic digits.
The stock candidate validator remains in control, with a maximum length of ten
characters. Each expanded regex rejects its match when `تخفیف` occurs anywhere
in the SMS body. ZenSMS's other stock regex and fallback paths are unchanged.

The patterns avoid Java's unsupported `UNICODE_CHARACTER_CLASS` flag and use
explicit Persian/Arabic character boundaries where needed.

The patch has no OTP runtime extension, custom handler, configuration option,
or injected validator instructions. It changes three existing regex constants
and the stock validator's maximum-length constant.

### RTL SMS lists

Adds one switch at the bottom of **Settings → Appearance**:

- **RTL conversation list** mirrors conversation rows and previews while keeping
  contact names and phone numbers left to right and physically right-aligned.

The patch is selected by default. Its in-app switch defaults to off and stores
its state in app-private local preferences.

### In-house ad only

Routes the shared rewarded-ad decision to the game's existing house-ad fallback
and disables the dedicated rewarded-ad download adapter. The callback is already
initialized before the redirect. Banner and interstitial adapters are separate.

### Instant in-house ad close

Activates the house-ad close button when the popup opens, hides its countdown
wrapper, and initializes the counter to zero. The normal close handler and its
reward callback are preserved. This applies to the shared Save-me/hint house-ad
popup across the collection.

### In-house ad not clickable

Makes the verified `HouseAdPopupView.OpenStorePage()` handler return immediately.
The close handler remains functional.

### Fast Offline Games startup

Stops the loading screen waiting for Firebase/Remote Config around the 35–40%
stage and for a pending country lookup. Advertising initialization uses the
game's existing parallel path. Requests can continue in the background; this
does not disable the game's internet access. Cached/default configuration and
normal consent handling remain available. See the [startup analysis](docs/offlinegames-startup.md).

All four Offline Games patches are opt-in and support `3.15.3` (`3327`) ARM64
and `3.14.1` (`3204`) ARMv7, from a complete XAPK or APKS. Each build has its own
independently verified native instruction table. A normalized whole-library
SHA-256 check accepts original and known previously patched inputs, while
rejecting unknown changes. Obsolete edits from earlier releases are restored.

**Mounted installations:** all four depend on a shared Unity native loader fix.
Unity normally loads Android's extracted original libraries, which mounting only
the base APK does not update. The fix extracts and verifies the Unity libraries
from the mounted APK into an app-private, content-addressed directory and points
Unity there. First launch requires roughly 88 MB extra storage for ARMv7 or
110 MB for ARM64. Repatch and
replace the mount after updating the source; a source update alone cannot change
the running game. See [native-loading investigation and device checks](docs/offlinegames-native-loading.md).

A startup toast now reports whether the expected `libil2cpp.so` is actually mapped
after Unity loads. Please include that message and the exported patched APK when
reporting unchanged behavior. File preparation alone does not prove that the
game loaded those files. The prior ad behavior failure remains under investigation.

The three ZenSMS patches are selected by default. The Offline Games patches are
opt-in.

### Remove 9GAG ads, promoted posts and trackers (8.23.0)

The main 9GAG patch, selected by default. Derived from the Adobo patch project
under the same GPLv3 licence; see [NOTICE](NOTICE) for attribution and the
upstream baseline commit.

It does four things:

- **Disables the ad gate.** The boolean state-flow gate and its
  `invokeSuspend` continuation both return `false`.
- **Filters promoted feed posts.** It forces the existing hide-promoted argument
  of the display query `Lhx3;->j(ILjava/lang/String;Z)Ljava/util/List;` to true,
  reusing 9GAG's own filter rather than editing the underlying `d()` query
  builder, whose other callers perform database maintenance.
- **Stops the bottom banner.** The dedicated bottom-adhesion initializer
  `Lo02;->i(Landroid/widget/FrameLayout;Lmc;)V` is made to set its supplied
  frame to `GONE`, clear its children and return, after which four compiled
  layouts also set the banner container to zero height and `gone`.
- **Blocks ad and tracking hosts.** A fixed list of ad, analytics and attribution
  hosts is rewritten to `0.0.0.0` in both string constants and bytecode string
  references. This is a finite list, not proof that every tracker is blocked.

Every fingerprint is validated against the exact instruction shape before it is
edited, and each edit is required to match exactly one method, so a changed
build is rejected rather than patched blindly.

### Deactivate Firebase Analytics (9GAG 8.23.0)

Optional and disabled by default. Sets the SDK's documented
`firebase_analytics_collection_deactivated` manifest flag. Firebase
initialization, services, messaging and Remote Config stay intact, and no
Firebase service is removed.

## Build

Run the **Build MPP** GitHub Actions workflow, or build locally with:

```shell
./gradlew :extensions:extension:testDebugUnitTest :extensions:offlinegames:testDebugUnitTest :patches:buildAndroid
```

The bundle is written under `patches/build/libs/`. See [LAB_GUIDE.md](LAB_GUIDE.md)
for local import and test-device instructions.

## License

This project is licensed under the [GNU General Public License v3.0](LICENSE).
