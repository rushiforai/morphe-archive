# PDB Morphe Patch — Plan (Premium Unlock + Power-User Feature Menu)

Target app: **Pdb: Personality & Friends** — `pdb.app` v2.134.6 (versionCode 2694),
minSdk 32 / targetSdk 37, Compose + Room + AppLovin/bytedance/vungle/ironSource/yandex ads,
protected by **PairIP (license-check variant only)**.

Patch host repo: `patch/morphe-patches` (Morphe, Kotlin patch bundles → `.mpp`).
Reference implementations: `strava/UnlockSubscriptionPatch.kt`, `patch/tele_web_patch/patches/.../telegram/*`
and the architecture of `SysAdminDoc/HushTelegram` (HushGram is the Instagram sibling).

Working dir for analysis: `work/pdb/{apktool,jadx}`.

---

## 1. Environment (installed, permanent)

| Tool | Location | Status |
|---|---|---|
| JDK 21 | `/usr/bin/java` | present |
| apktool 2.11.1 | `~/tools/opt/apktool.jar` → wrapper `~/tools/bin/apktool` | installed |
| jadx 1.5.1 | `~/tools/opt/jadx` → wrapper `~/tools/bin/jadx` | installed |
| Android build-tools 35.0.0, platform-tools 37, platform 35 | `~/tools/android-sdk` | installed |
| aapt2 / apksigner / zipalign / d8 | `~/tools/android-sdk/build-tools/35.0.0` | installed |
| Gradle 9.7 wrapper + Morphe plugin 1.3.3 | `patch/morphe-patches` | **build verified (exit 0)** |
| AVD `Pixel_9_Pro` | `~/.android/avd` | present (for on-device testing) |

PATH additions written to `~/.zshrc` and `~/.bashrc`:
`~/tools/bin`, `ANDROID_SDK_ROOT=~/tools/android-sdk`, platform-tools, build-tools.

Build command (needs the local PAT for GitHub Packages):
```bash
cd patch/morphe-patches
export GITHUB_ACTOR=madushas GITHUB_TOKEN=$(cat ../../gh_token.txt)
./gradlew :patches:build            # → patches/build/release/patches-*.mpp
```

---

## 2. Reverse-engineering findings (what actually gates premium)

### 2.1 Obfuscation shape
* 6 dex, ~46k classes. Most app code is R8-obfuscated into the default package
  (`defpackage.*`, e.g. `zdf`, `l5b`, `h568`), but several modules are **kept non-obfuscated**:
  `pdb.app.*` (`billing`, `tweak`, `fundation.premium`, `user.appsetting`, `network.*`),
  `yads.*` (in-house ad wrapper), `com.pairip.*`.
* Practical effect: **premium model lives in `pdb.app.billing` (stable names)** but the
  **gate method is obfuscated** → we anchor by *strings*, not names.

### 2.2 The premium model
`pdb.app.billing` (all stable names):
`PremiumID` (sealed `Parcelable` interface with `getId()`), implemented by:
`PremiumNoAD`, `PremiumHideOnline`, `PremiumSuperChats`, `PremiumUnlimitedRewinds`,
`PremiumUnlimitedExtends`, `PremiumVisitor`, `PremiumViewRequest`, `PremiumVirtualTravel`,
`PremiumIRLSlot`, `PremiumPowerPDBServer`, `PremiumCoin`, `WonderChatReconnect`, `ByPremiumID`.

Plus DTOs: `PremiumItem(id,icon,content,description,freeCount)`, `FlashSale*`, `IntroductoryOffer*`,
`RelateOfferState`, `Testimony`.

`ProStatus` (obfuscated class `l5b`, Gson fields `isPro`, `isProInTrial`,
`subscriptionBackendConfirmed`; `toString` = `"ProStatus(isPro=…"`).

### 2.3 The single gate: `isProUser()` (obfuscated `zdf.V()Z`)
`zdf` implements the kept interface `jef` (`IUser`). `jef.V()Z` has a **default body returning false**;
only `zdf` overrides it. Decompiled logic:

```java
public final boolean V() {                 // == isProUser()
    if (prefs.getBoolean("mockIsProUser", false)) return true;   // ← dev backdoor, stable string
    if (proStatus != null && proStatus.getIsPro()) return true;  // server status (ProStatus)
    if (badges contain type == "proUser") return true;
    return false;
}
```

`zdf.V()` is called from **17 sites** (ads, chat, story, coin, IRL, profile …).
Other user impls (`ei0`,`spc`,`v9f`) inherit the default false → they are *other* users.

> ⚠️ Four other `jef` impls exist; only `zdf` (the signed-in user) is our target.

### 2.4 Built-in dev "Tweaks" screen (HUGE)
`pdb.app.tweak.TweaksActivity` (`android:exported="false"`, theme `Theme.Tweak`) backed by
`res/xml/root_preferences.xml` (androidx.preference). It is reachable from
`AppSettingActivity` (request code **911** → result 912 = "tweak changed, restart", 1010 = AppLovin
mediation debugger), i.e. the app's own Settings screen opens it via a (likely hidden) entry.

`root_preferences.xml` already contains, among ~50 toggles:
* **`mockIsProUser` — "Mock you as pro user"** (SwitchPreference) ← premium unlock the devs built in
* `isADLibDisabled` — "Do not init AK SDK!!!" (kills the ad SDK)
* `disableIRLMarkRead`, `ignoreIRLMore`, `autoConsumePDBCoin`, `forceEnglish`,
  `useNewPostComponent`, `showFullError`, `mockLatLng`, `webDevTestUrl`,
  `debugInstantChatUserId`, `debugAD`, `rememberGoogleAuth`, `apiIsStaging`, `api_domain`/`share_domain`/`cms_domain`
* a "quick_tweak" dialog that writes **any** key/value into the app's default SharedPreferences.

Every one of these keys is read by an existing obfuscated code path → **we get real behaviour for free**
by writing the pref. The generic reader for many of them is one big `switch` method in `tye.smali`.

### 2.5 Protection
* PairIP **license-check variant only**: `com/pairip/application/Application` +
  `com/pairip/licensecheck/{LicenseClient,LicenseActivity,LicenseContentProvider,TrialClient,RepeatedCheckMetadata,LicenseResponseHelper,…}`.
  **No** `SignatureCheck`/`VMRunner`/`StartupLauncher` → no DEX VM. Real code is plain.
* Real Application class present and usable: **`pdb.app.App`** (`implements aa8, cad`).
* Re-signing requires signature + install-source spoofing for the licensecheck path.

### 2.6 Ads
Ad module = `yads.*` (in-house wrapper) over AppLovin, bytedance/Pangle, Vungle, ironSource,
inMobi, Unity, Yandex, GMS ads. Gated by `isADLibDisabled` pref and (for PremiumNoAD) by `isProUser()`.

---

## 3. Target patch set

Proposed folder: `patches/src/main/kotlin/app/template/patches/pdb/`
(name per repo convention: app id folder; add `PDB_COMPATIBILITY` to `shared/Constants.kt`).

```
pdb/
  PDBFingerprints.kt                 # string-anchored fingerprints
  pairip/KillPairIpPatch.kt          # protection bypass (dependency)
  premium/UnlockPremiumPatch.kt      # isProUser() → true
  ads/RemoveAdsPatch.kt              # ad SDK / ad-load kill
  tweaks/                                # feature menu
      ExposeTweaksMenuPatch.kt       # reachable "PDB Tweaks" entry
      TweaksPreferencesPatch.kt      # inject extra switches into root_preferences.xml
  premium/HideUpsellPatch.kt         # hide paywall/banners (optional)
```

### 3.1 `KillPairIpPatch` (default = true, dependency of the rest)
* Manifest: swap `android:name` `com.pairip.application.Application` → **`pdb.app.App`**;
  remove/disable `LicenseContentProvider` + `LicenseActivity`.
* Bytecode: `killPairIpFull()` (already in `shared/PairIp.kt`, gracefully no-ops missing classes) —
  no-ops `LicenseClient.initializeLicenseCheck/connectToLicensingService/processResponse/
  startPaywallActivity/performLocalInstallerCheck`.
* Add `SpoofSignatureVerificationPatch` + `SpoofInstallSourcePatch` (both already in `shared`) so the
  re-signed APK is accepted by any remaining cert/installer checks.
* Mirrors the repo's `blurwall/pairip` example but simpler (no VM).

### 3.2 `UnlockPremiumPatch` (default = true)
Primary (robust, string-anchored — survives obfuscation renames):
* Locate the method containing `const-string "mockIsProUser"` (unique in smali) → that is `zdf.V()Z`.
  Two equivalent options:
  1. **Force the read**: replace the `getBoolean(...,false)` result with `1` — keeps app code identical otherwise.
  2. **`returnEarly(true)`**: `const/4 v0, 0x1; return v0` at method head.
  → Recommend **(2)** for `zdf.V()`; it covers all 17 call sites.
Secondary (belt-and-braces):
* Force `ProStatus.getIsPro()` → true (anchor the class by the `"ProStatus(isPro="` literal + the
  `dzc("isPro")`/`isProInTrial` field pair) so any code that reads the model directly also sees pro.
* Ensure `mockIsProUser=true` is written at startup (defence-in-depth, and makes the app's own
  UI consistent).
Normalise `PremiumID`-keyed entitlement checks so each PremiumX feature is granted
(`superchats`, `rewinds`, `extends`, `visitor`, `view_request`, `virtual_travel`, `irl_slot`,
`power_pdb_server`, `wonder_chat_reconnect`, `hide_online`, `no_ad`, monthly coins).

### 3.3 `RemoveAdsPatch` (default = true)
* Set `isADLibDisabled=true` (patch the pref read in `tye.smali`), which prevents ad-SDK init.
* No-op the in-house `yads` load/show entry points (fingerprint `yads` ad-show) as a fallback,
  so ads never render even if a variant re-enables the SDK.
* PremiumNoAD is then doubly satisfied (premium + SDK off).

### 3.4 Feature menu (Tier-1: reuse the app's own screen — recommended first)
`TweaksPreferencesPatch` injects new entries into `res/xml/root_preferences.xml` via
`ResourcePatchContext` DOM editing (`ResourceUtils.kt` already provides the helpers) and
`ExposeTweaksMenuPatch` makes `TweaksActivity` reachable (add a `Preference`/entry in the app
settings, or make the activity exported + a launcher alias).

Toggles we can expose **immediately, no new code** (backed by existing app keys):
| Toggle | Pref key | Effect |
|---|---|---|
| Unlock Premium | `mockIsProUser` | isProUser()=true |
| Disable ads SDK | `isADLibDisabled` | no ad init |
| Hide online status | (premium) `hide_online` | privacy |
| Disable IRL read receipt | `disableIRLMarkRead` | privacy |
| Ignore "see more" IRL | `ignoreIRLMore` | privacy |
| Auto-consume coins | `autoConsumePDBCoin` | qol |
| Force English | `forceEnglish` | qol |
| New post component | `useNewPostComponent` | ui |
| Mock location | `mockLatLng` | spoof |
| Switch server (staging/prod) | `apiIsStaging`, `api_domain` | net |
| Debug instant chat | `debugInstantChatUserId` | dev |
| Show full error toast | `showFullError` | dev |

New behaviours to add via bytecode hooks (Tier-1, each a small patch + a pref key):
* Anti-upsell: hide Premium banners / "Get %s OFF" popups / coin-paywall rows.
* Tracker/analytics suppression (AppLovin/ByteDance/ad-ID).
* Story/media download (save photos/videos) — scoped to media the user can already view.
* Remove "rate us" / promo nag.

### 3.5 Feature menu (Tier-2: full HushGram-style extension — later)
Ship a Java `extensions/pdb` module: a real settings screen (`PreferenceFragmentCompat`) injected as an
entry in `AppSettingActivity`, with:
* typed `Setting` storage, JSON import/export, **global pause**, crash-loop self-pause,
  build-vs-runtime gating (`SettingsStatus` pattern), diagnostics/report, quick presets.
* This is the "the more power-user options the better" end-state; Tier-1 is the fast path to value.

### 3.6 Candidate feature catalog (grounded in what PDB exposes)

**A. Premium entitlements (from `pdb.app.billing.PremiumID` subclasses)**
1. No ads (`PremiumNoAD`)
2. Hide online status (`PremiumHideOnline`)
3. Super Chats (`PremiumSuperChats`)
4. Unlimited conversation extends (`PremiumUnlimitedExtends`)
5. Unlimited rewinds (`PremiumUnlimitedRewinds`)
6. Sees who viewed you / visitors (`PremiumVisitor`)
7. View requests (`PremiumViewRequest`)
8. Virtual travel (`PremiumVirtualTravel`)
9. Extra IRL slots (`PremiumIRLSlot`)
10. Power PDB server / discovery boost (`PremiumPowerPDBServer`)
11. Wonder Chat reconnect (`WonderChatReconnect`)
12. Monthly premium coins (`PremiumCoin`)
13. Name colour / chat-bubble customisation (strings `premium_a_2`)
14. Custom launcher icon packs (aliases: aliasMoonso, aliasZenlight, … ~30 icons — currently `enabled=false`)
15. AI friends limit removal (strings `ai_create_friend_not_pro_alert_*`)

**B. Privacy / anti-detection**
16. Hide online status (already a premium feature)
17. Disable IRL read receipts (`disableIRLMarkRead`)
18. Ignore IRL "see more" tracking (`ignoreIRLMore`)
19. Disable typing indicator
20. Anti-screenshot / screen-capture block for chats
21. Analytics + ad-ID suppression; strip ad SDK network calls
22. Strip referral/UTM link tracking on share
23. Hide "last active"/`lastActive` field in user DB

**C. Locks / qol**
24. Keep/extend conversations without coins
25. Unlimited rewinds in discovery/IRL
26. Auto-consume coins (`autoConsumePDBCoin`)
27. Reveal chat by coins → free
28. Remove "rate us" / promo / flash-sale nag (`FlashSale*`, `close_premium_pop_*`)
29. Hide Premium paywall + banners (`PremiumBannerData`, `premium_banner`)
30. Force English (`forceEnglish`)
31. New post component (`useNewPostComponent`)

**D. Media**
32. Download stories / IRL media / photos (save locally)
33. Screenshot-friendly / higher image quality
34. Save profile pictures / chat images

**E. Network / dev (power user)**
35. Server switcher: staging ↔ prod (`apiIsStaging`), custom `api_domain`/`share_domain`/`cms_domain`
36. Mock location (`mockLatLng`)
37. Expose the full built-in Tweaks screen (all ~50 variant toggles) as a first-class menu item
38. Generic "quick tweak" pref editor in the menu
39. Verbose file logging (`fileLogLevel`), show full error toast (`showFullError`)
40. Debug instant chat (`debugInstantChatUserId`), AD debug (`debugAD`)

**F. Meta (HushGram-style, Tier-2 extension)**
41. Global Pause + crash-loop self-pause
42. Settings JSON import/export/backup
43. Diagnostics/report builder
44. Per-toggle build-vs-runtime gating (`SettingsStatus`)
45. Quick presets (Quiet / Privacy / Coins-max)

---

## 4. Fingerprinting & robustness strategy

Because app classes are R8-renamed every release, **never** key on `zdf`/`l5b`/`V`.
Use stable anchors:
1. `"mockIsProUser"` string (unique in smali) → premium gate.
2. `"ProStatus(isPro="` + `dzc("isPro")`/`isProInTrial` pair → ProStatus model.
3. `pdb.app.billing.*` / `pdb.app.tweak.*` / `com.pairip.*` **kept class names**.
4. `yads.*` ad module names.
5. Manifest components (`com.pairip.application.Application`, `LicenseContentProvider`).
6. Resource keys (`root_preferences.xml` keys, `R.xml.root_preferences`).
Add `PDB_COMPATIBILITY` pinned to versionCode 2694 and grow the `targets` list as new versions are verified
(repo convention: one `AppTarget` per verified build).

---

## 5. Build / test / verify workflow

```bash
# 1. build the bundle
cd patch/morphe-patches && export GITHUB_ACTOR=... GITHUB_TOKEN=$(cat ../../gh_token.txt)
./gradlew :patches:build

# 2. patch the APK (Morphe CLI/manager) → pdb_patched.apk
# 3. sign + align (debug key)
~/tools/android-sdk/build-tools/35.0.0/apksigner sign --ks ~/.android/debug.keystore pdb_patched.apk
# 4. install + smoke test on emulator
~/tools/android-sdk/platform-tools/adb install -r pdb_patched.apk
```
Verified artifact: `pdb_patched.apk` = 45,639,072 bytes,
sha256 `64112bfb774cb829ed0461cda7621a315aaaf6a8f15f1b879a828e997d56960b`
(`pdbverify` → `RESULT: PASS`).

Verification checklist (see `~/tools/bin/pdbverify` for the automated part):

* Manifest: `application android:name="pdb.app.App"`, no `requiredSplitTypes`, the
  four ad init providers `android:enabled="false"`, `PdbInitProvider` registered, no
  `com.pairip.*` leftovers.
* Resources (`res/xml/root_preferences.xml`): the two `Morphe — Pdb Extras` categories,
  the 12 flat `morphe_*` switches and the `Extras tools` row whose `<intent>` targets
  `app.template.extension.pdb.PdbExtrasActivity` (`aapt2 dump xmltree` shows the
  framework ids `targetPackage=0x01010021`, `data=0x0101002e`, `targetClass=0x0101002f`).
* DEX (apktool): `zdf.V()Z` is `const/4 v0,0x1; return v0`; `l5b.a()Z`/`b()Z` return
  `true`; the extension classes are present.
* Device (`pdbdevice`): installs, launches, `logcat` shows
  `I/PdbExtras: extras applied: mockPro=true adOff=true …`, no `FATAL`.
* Device, Tweaks screen: the 12 switches render flat at the bottom of the list
  (`work/pdb/device/menu2.png`); tapping *Extras tools* starts
  `app.template.extension.pdb.PdbExtrasActivity` with `dat=pdbx://tools`, and the tools
  screen draws all six buttons (`tools-screen.png`); tapping *Export* shows
  `Morphe Extras: settings copied as JSON` plus Android's clipboard preview with the
  JSON payload (`tools-export.png`).
* Pdb's own **“Mock you as pro user”** switch reads **on** in its Tweaks screen, i.e.
  the extension's write to `<pkg>_preferences` is live in the app.
* The premium *badge* and the Tweaks screen need a session, and Pdb only signs in by
  Google (impossible after re-signing) or email verification.

---

## 6. Risks / open questions

1. **Server-side enforcement.** Many premium actions (superchat, coins, virtual travel) are confirmed
   server-side (`subscriptionBackendConfirmed`). Client unlock will expose the *UI/features* but some
   *actions* may still be refused by the backend → need runtime testing to bound exactly what works.
2. **Ban / detection.** Editing premium entitlement can violate ToS and may be detected (the app has
   PairIP + integrity tooling). HushGram deliberately *avoids* premium bypass for this reason; we are
   deliberately choosing to do it — document the risk.
3. **PairIP attachBaseContext.** Swapping `android:name` to `pdb.app.App` must be validated on-device;
   if string holders NPE, fall back to keeping PairIP `Application` and only no-oping the licencecheck.
4. **Obfuscation churn.** Every app update can move anchors; the string anchors above are chosen to be
   stable, but each new version needs a re-verify pass (the repo pins verified versions).
5. **Play Integrity / "testIntegrity" tweak** exists → may be used to detect patches; watch for it.
6. **Legal/ethical**: confirm intent — this is a paid-subscription bypass. Proceed only on explicit user request.

---

## 7. Roadmap

1. ✅ Recon + tooling + build verified.
2. ✅ `BypassPairIpPatch` (license-check-only PairIP) + `UnlockPremiumPatch` implemented.
3. ✅ `RemoveAdsPatch` (manifest provider disabling).
4. ✅ Tier-1 feature menu (preferences injection into the app's Tweaks screen).
5. ✅ Tier-2 extension (startup provider + flat switch menu + `PdbExtrasActivity` tools screen: export/import JSON, diagnostics, presets, reset).
6. ✅ `PDB_COMPATIBILITY` pinned + README added.
7. ✅ On-device verification of the patched APK (launch, extras applied, menu renders, tools screen + export work; premium/ads bound by the sign-in limitation — see §6).
8. ⏳ Re-verify against the next PDB release; extend `AppTarget`s.

---

## 8. Implementation log

### Patches shipped (`patches/src/main/kotlin/app/template/patches/pdb/`)

| File | Patch | Type |
|---|---|---|
| `premium/UnlockPremiumPatch.kt` | Unlock Pro | bytecode |
| `pairip/BypassPairIpPatch.kt` | Bypass PairIP license check | bytecode |
| `ads/RemoveAdsPatch.kt` | Remove ads | resource |
| `manifest/PdbStandaloneInstallPatch.kt` | Allow standalone install | resource |
| `tweaks/FeatureMenuPatch.kt` | Pdb Extras — resources / feature menu | resource + bytecode |

### Extension (`extensions/extension/src/main/java/app/template/extension/pdb/`)

* `PdbSettings` — key constants + `<pkg>_preferences` helper.
* `PdbStartup` — applies the Morphe Extras switches to the app's own prefs.
* `PdbInitProvider` — ContentProvider that runs `PdbStartup` at app start.
* `PdbTools` — framework-only actions: JSON export/import (clipboard), diagnostics, max-privacy preset, reset.
* `PdbExtrasActivity` — tools screen built from plain framework widgets (opened through a `Preference` + `<intent>`).

### Anchors (obfuscation-proof)

* `isProUser()` — found by the dev backdoor string `mockIsProUser` (obfuscated `zdf.V()Z`). Forced `true`.
* `ProStatus` — found by `toString()` literal `ProStatus(isPro=`. Boolean getters forced `true`.
* `pdb.app.App` — kept class. `attachBaseContext(Context)` is the startup hook (2 registers, so `p1` is valid inline-smali).

### Gotchas learned

* **`InlineSmaliCompiler`** builds `.registers <method.registerCount>` with the method's own parameter list. For a no-param method with `.locals 16`, `p0` becomes `v16` → *invalid register*. Hook methods with parameters (or rely on the ContentProvider).
* `Element.getAttribute("android:name")` does **not** see namespaced manifest attributes; use `element.attributes.getNamedItem("android:name")`.
* `android:requiredSplitTypes` lives on `<manifest>` (not `<application>`).
* **Pdb's Tweaks host fragment supports no navigation.** `pdb.app.tweak.TweaksActivity$a` implements neither `OnPreferenceStartScreenCallback` (nested screens) nor `OnPreferenceStartFragmentCallback` (`android:fragment` rows) and does not override `onPreferenceTreeClick`. Both row types are therefore **dead on tap** — device-confirmed: tapping only logs `W/PreferenceFragment: onPreferenceStartFragment is not implemented in the parent activity …`. The menu is therefore flat `SwitchPreference`s (a `SwitchPreference` toggles inside `Preference.onClick()`, before the host is consulted) plus one `Preference` carrying an `<intent>`, which the platform handles in `Preference.performClick()`. `<intent>` attributes survive Morphe's resource encoder with real framework ids (`targetPackage=0x01010021`, `data=0x0101002e`, `targetClass=0x0101002f`) — check with `aapt2 dump xmltree --file res/xml/root_preferences.xml`.
* **`AlertDialog.Builder#setItems` renders nothing in Pdb.** The app's `alertDialogTheme` layout has no list panel, so a dialog shows its title and message but no items (device-confirmed). The tools screen is therefore built from plain framework widgets inside a normal `Activity`.
* `pdb_original.apk` is an App Bundle **base** APK → needs the split requirement removed to install standalone.
* **Pdb is ARM-only.** It ships only ARM MMKV in `assets/` (`libmmkv_32.so`, `libmmkv_64.so`) and `System.load()`s the extracted copy. On an x86_64 emulator it therefore needs `primaryCpuAbi=arm64-v8a` (ARM64 native bridge) — achieved by adding `lib/arm64-v8a/libmmkv.so`. Real ARM devices need nothing.
* **Google Sign-In can't work on a re-signed APK — and it can't be fixed in-app.** Google binds the OAuth client to `packageName` + signing-cert SHA-1, so the patched APK gets `not registered to use OAuth2.0`. The check runs in the **GMS process**, so the shared *Spoof app signature* patch (which hooks `PackageInfo.CREATOR` only in the app's own process) does not help. A `pdbFixGoogleSignInPatch` wrapper depending on it was written and **removed again** after a device test proved it ineffective. Users must sign in with **Continue with email verification** (behind the login screen's *More* button); routing/deep links (`pdb://app/tweak/setting`) still require a session.
* The emulator is a `google_apis_playstore` image → **`adb root` is unavailable**, so `shared_prefs` cannot be read back. Verify premium statically (disassembled `zdf.V()` / `l5b`) and via `logcat` (`PdbExtras`), and verify the menu statically in `res/xml/root_preferences.xml`.
* The AVD has a **PIN lock (`1234`)** on user 0 and no Gmail. After a cold boot the user is `RUNNING_LOCKED`, and while locked **no app components resolve** — `am start` fails with *“Activity class … does not exist”* and `monkey` finds no launcher activity, even though `dumpsys package` lists the filters. Unlock with `input text 1234` + `input keyevent 66`, and keep the screen on (`svc power stayon true`). Do **not** delete `snapshots/default_boot`; quick-boot preserved the unlocked session.
* An interrupted `adb install` shows as *“Performing Incremental Install”* followed by an unreadable package. `pdbdevice` now installs with `--no-incremental`.

