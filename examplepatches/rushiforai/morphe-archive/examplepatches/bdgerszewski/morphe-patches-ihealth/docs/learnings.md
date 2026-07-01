# Session learnings: iHealth MyVitals 4.14.5

Findings and decisions made while building the ad-banner and rebranding patches. Intended as a reference when comparing against patches produced by other sessions.

---

## Ad banner system

The app has two independent ad banners served from iHealth's own backend (not AdMob/AdSense):

| Location | Fragment class | Show-banner method (obfuscated name in 4.14.5) | Ads list field |
|---|---|---|---|
| Devices tab | `com.ihealth.business.common.mydevices.DevicesFragment` | `d()` | `MyApplication.adsList` |
| Account tab | `com.ihealth.business.common.settings.SettingsFragment` | `a()` | `MyApplication.adsList2` |

Each method: loads the first ad image via `Glide.asBitmap().load().skipMemoryCache(true).into(SimpleTarget)`, then in the `onResourceReady` callback sets `bottomAdRel.setVisibility(VISIBLE or GONE)` based on a conjunction of SharedPrefs flags.

### Visibility condition (both fragments, same logic)

```java
!CountrySetUtils.b()                                   // not in a blocked country
&& ConstantsLanguage.LANGUAGE_ENGLISH.equals(...)      // language is English
&& "US".equals(Locale.getDefault().getCountry())       // locale is US
&& SharedPrefsUtils.d(AD_KEY_USER_SWITCH)              // user hasn't closed the banner
&& SharedPrefsUtils.d(AD_KEY_MASTER_SWITCH)            // server master switch
&& SharedPrefsUtils.d(AD_KEY_1_SWITCH / AD_KEY_2_SWITCH)  // per-banner server switch
&& ListUtils.a(MyApplication.adsList)                  // non-empty ads list
```

### "Cooldown" after tapping X

`cancel()` / the equivalent in SettingsFragment sets `AD_KEY_USER_SWITCH` / `AD_KEY_USER_SWITCH_2` to `false`. This hides the banner. The banner reappears when `MainActivity` receives a new ad response from the server **with a higher version number** — at that point it resets both user-switch flags to `true`. So the "cooldown" is just the polling interval until the server sends a new ad version.

### Patch approach: short-circuit the show-banner method

Rather than tweak SharedPrefs flags or the visibility condition (both fragile), we add `return-void` at instruction 0 of each show-banner method. This prevents any image loading or visibility change regardless of server state or flag values.

---

## Fingerprinting

The show-banner method in each fragment is identified by two stable, non-obfuscated Glide API calls that appear in sequence:

```kotlin
methodCall(definingClass = "Lcom/bumptech/glide/RequestManager;", name = "asBitmap")
methodCall(definingClass = "Lcom/bumptech/glide/request/BaseRequestOptions;", name = "skipMemoryCache")
```

Combined with `definingClass` set to the owning fragment (both class names are non-obfuscated in this app), this uniquely identifies the method.

The `X` button handler (`cancel()`) is annotated `@OnClick` and has a stable public name — it was not patched because patching the show-banner method upstream is sufficient and cleaner.

---

## Rebranding (package name + app name)

**Goal:** install alongside the original without conflicts.

**New package:** `com.ihealthlabs.MyVitalsMorphe`

**Approach:**
- `resourcePatch` (not `bytecodePatch`) is required because `document()` / `get()` live on `ResourcePatchContext`, not `BytecodePatchContext`.
- Walk every XML attribute in `AndroidManifest.xml` recursively and replace the old package string. This covers the root `package` attribute and all 9 `android:authorities` values for content providers (FileProvider, Firebase, Zendesk, Picasso, etc.).
- Directly set `app_name` string in `res/values/strings.xml` to "iHealth Morphe" via DOM.

**Firebase crash:**  
Renaming the package causes `FirebaseInitProvider.onCreate()` to get a 403 from the Firebase backend (new package not registered), which crashes the app at startup with a black screen. The fix is a companion `bytecodePatch` (referenced via `dependsOn`) that short-circuits the `onCreate()` method (return `false`), disabling Firebase initialization entirely. Fingerprinted via the unique string `"FirebaseApp initialization unsuccessful"` in `Lcom/google/firebase/provider/FirebaseInitProvider;`.

---

## Morphe API notes

- `document()` and `get()` are only available in `resourcePatch` / `ResourcePatchContext`.
- `bytecodePatch` and `resourcePatch` can be chained via `dependsOn`.
- A `bytecodePatch` with no `name` (anonymous) can be used as a private dependency of a `resourcePatch`.
- `Fingerprint` with `definingClass` set to the literal class descriptor narrows the match without needing a `classFingerprint` or `custom` lambda — prefer this when the class name is non-obfuscated.

---

## Files produced

```
patches/src/main/kotlin/app/template/patches/
  shared/Constants.kt                          — added COMPATIBILITY_IHEALTH
  ihealth/adBanner/Fingerprints.kt             — ShowAdBannerDevicesFingerprint, ShowAdBannerSettingsFingerprint
  ihealth/adBanner/DisableAdBannerPatch.kt     — disableAdBannerPatch
  ihealth/rebranding/RebrandingPatch.kt        — rebrandingPatch (resourcePatch) + disableFirebaseInitPatch (bytecodePatch dependency)
  ihealth/buyMoreLink/Fingerprints.kt          — BuyMoreDeviceLinkFingerprint
  ihealth/buyMoreLink/HideBuyMoreLinkPatch.kt  — hideBuyMoreLinkPatch
  ihealth/aiModal/Fingerprints.kt              — BpIncentiveIsShowDialogFingerprint
  ihealth/aiModal/DisableAiModalPatch.kt       — disableAiModalPatch
```

---

## "Buy more iHealth devices?" link

The link is a `TextView` (`android:id="@+id/tv_buy_more_device"`) inside a `ConstraintLayout` at the bottom of `mv_fragment_devices.xml`. It is not bound via `@BindView` in `DevicesFragment` — only a click handler (`@OnClick`) is registered. No field holds a reference to it, and nothing in `DevicesFragment` sets its visibility after creation.

**Injection point:** The ButterKnife-generated `DevicesFragment_ViewBinding.<init>` constructor finds the view via `Utils.findRequiredView(...)` and stores it before attaching the click listener. Inserting `setVisibility(GONE)` immediately after the `move-result-object` that captures the view reference hides it permanently.

**Fingerprint:** ButterKnife embeds a human-readable debug label string (`"method 'onBuyMoreClicked'"`) as a `const-string` immediately before each `findRequiredView` call. This is the most stable anchor — use it as the first filter, then `methodCall(Utils, findRequiredView)` as the second, so `instructionMatches[1]` points to the exact `findRequiredView` for this view.

```kotlin
object BuyMoreDeviceLinkFingerprint : Fingerprint(
    definingClass = "Lcom/ihealth/business/common/mydevices/DevicesFragment_ViewBinding;",
    strings = listOf("method 'onBuyMoreClicked'"),
    filters = listOf(
        string("method 'onBuyMoreClicked'"),
        methodCall(definingClass = "Lbutterknife/internal/Utils;", name = "findRequiredView"),
    )
)
```

---

## AI motivational modal

After a blood pressure reading, the app fetches a `BPIncentiveEntity` from the server (via `BpRepo.getBpIncentiveResult()`). This entity has two relevant fields:

| Field | Serialized name | Purpose |
|---|---|---|
| `isShowDialog` | `is_show_dialog` | Server flag: should the modal appear? |
| `incentiveDialogUrl` | `incentive_dialog_url` | URL loaded into the modal's WebView |

The consumer that shows the dialog lives in the synthetic RxJava `Consumer` class `com.ihealth.business.common.main.c` (compiled from a lambda in `MainActivity`). The gating condition is:

```java
if (bPIncentiveEntity == null
        || !bPIncentiveEntity.isShowDialog()
        || TextUtils.isEmpty(bPIncentiveEntity.getIncentiveDialogUrl())) {
    AndonToastUtil.c(...); // show "reading saved" toast
    return;
}
// ... create Dialog, load WebView, play TTS
```

The dialog itself is a plain `android.app.Dialog` with layout `mv_dialog_webview_incentive`, containing a `WebView` and a close `ImageView`. The WebView loads `incentiveDialogUrl` with JavaScript and media playback enabled (`setMediaPlaybackRequiresUserGesture(false)`), which is how TTS auto-plays.

The AI insight inline in `BPResultsActivity` (the `incentive_webview` WebView embedded in the result screen) is a separate feature from the modal dialog and is not patched.

### Patch approach: short-circuit `isShowDialog()`

Making `BPIncentiveEntity.isShowDialog()` always return `false` causes the consumer to hit the early-return branch every time, showing only the "reading saved" toast.

```kotlin
object BpIncentiveIsShowDialogFingerprint : Fingerprint(
    returnType = "Z",
    definingClass = "Lcom/ihealth/db/entity/bp/BPIncentiveEntity;",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/ihealth/db/entity/bp/BPIncentiveEntity;",
            name = "isShowDialog",
            type = "Z",
        )
    )
)
```

```kotlin
BpIncentiveIsShowDialogFingerprint.method.addInstructions(0, """
    const/4 v0, 0x0
    return v0
""")
```

The class and field names are non-obfuscated in 4.14.5, so `definingClass` + `fieldAccess(name = "isShowDialog")` is a stable fingerprint. The `returnType = "Z"` excludes `toString()` which also reads the same field.

---

## Smali correctness pitfalls

### `invoke-virtual` needs all argument registers, including `this`

`invoke-virtual {vObj}, Lsome/Class;->method(I)V` is **wrong** — it only passes the object, not the `int` argument. The verifier rejects it with:

```
VerifyError: expected 1 argument registers, method signature has 2 or more
```

The correct form is `invoke-virtual {vObj, vArg}, ...`. For `setVisibility(I)V`:

```smali
const/16 v0, 0x8
invoke-virtual {v$viewRegister, v0}, Landroid/view/View;->setVisibility(I)V
```

This caused a runtime `VerifyError` that only manifested when ButterKnife tried to instantiate the ViewBinding — i.e., when the Devices fragment first loaded. The patch compiled and "Applied" successfully, but the app crashed on that screen.

### `const/4` cannot encode `View.GONE` (8)

`const/4` holds a 4-bit signed value (−8 to 7). `GONE = 8` is out of range. Use `const/16`.

### Verifying patches landed in the right DEX

Morphe strips the patched class from its original DEX and writes it to a new one. When you decompile the patched APK with apktool, the class appears in the **highest-numbered** `smali_classesN` directory, not its original location. Diffing the original `smali_classesN` copy vs the patched one will always show no diff — always check the new directory.

---

## Firebase and rebranding

### Do NOT patch `getPackageName()` in Firebase classes

The intuitive fix for Firebase auth failures after a package rename is to patch `Context.getPackageName()` in Firebase/GMS classes to return the original package name. This breaks things:

`com.google.firebase.sessions.SessionEvents.getApplicationInfo()` calls `packageManager.getPackageInfo(context.packageName, ...)` to inspect the installed app. If `getPackageName()` returns the old name, PackageManager throws `NameNotFoundException` (the old package is not installed), crashing `FirebaseInitProvider` at startup.

### Firebase FIS 403 after rebranding is safe to ignore

After disabling `FirebaseInitProvider`, residual Firebase initialization triggered elsewhere emits 403 errors ("Requests from `com.ihealthlabs.MyVitalsMorphe` are blocked") in background threads. These are non-fatal — the app opens and all local features work. Firebase Installations / FCM will not function in the rebranded copy, which is acceptable for a side-by-side comparison install.

### `morphe-patches-library` is not bundled in `morphe-cli`

The `app.morphe.util` utility functions (`findInstructionIndicesReversed`, `findMutableMethodOf`, `getNode`, `asSequence`) live in `morphe-patches-library`, which is not present in the morphe-cli fat jar. Adding it as `compileOnly` won't work at runtime. Options: add as `implementation` (bundles into the .mpp) or implement the logic inline using `classDefForEach` + `MutableClass.methods` from morphe-patcher, which is already available.
