# Meesho patches

**App:** Meesho: Online Shopping App (`com.meesho.supply`, FashNear Technologies)
**Bundle format:** APKM (base + config splits) · **minSdk 21**
**Targets:** 29.7 (2026-10-28), 29.6 — version-only for now; add `versionCode`
once read from a real APKM (29.3 = 864, 28.6 = 846 per APKMirror).

Meesho's payments (JusPay), login (Truecaller/Otpless), Google sign-in and the
Shield anti-fraud check are server-/signature-side. **No patch here bypasses
them**, and no patch touches order data, prices or coins ("Unlimited Money"
mods are server-side and fake).

Analysis sources: decoded `AndroidManifest.xml` of a real build,
εxodus report 766078 (v28.8: 5 trackers / 39 permissions), APKMirror/AppBrain,
public jadx write-ups. See `MEESHO_PATCH_PLAN.md` at the repo root.

## Patch list

| Patch | Default | Mechanism | Limitations |
|---|---|---|---|
| Block analytics & tracking | **on** | `nop`s void call sites into AppsFlyer, Mixpanel, Facebook App Events, Firebase Analytics, GMS AppMeasurement, Crashlytics | FCM push, install attribution, Shield, payment/login SDKs untouched |
| Remove dangerous permissions (keep storage & SMS) | **on** | Deletes `uses-permission` entries: contacts R/W, phone state/numbers/basic, RECORD_AUDIO/AUDIO_CAPTURE, fine+coarse location, DETECT_SCREEN_CAPTURE, AD_ID, ACCESS_ADSERVICES_*. **Storage (READ/WRITE_EXTERNAL_STORAGE) and SMS (READ_SMS/SEND_SMS) are kept** | Truecaller login, support voice calls (Verloop), location auto-address may degrade; OTP autofill via SMS_RETRIEVED does not need READ_SMS |
| Hide sponsored listings & ad slots | off | Forces Z-returning ad-gate methods (`isAd`, `isSponsored`, `shouldShowAd`, …) to `false` in classes referencing "sponsored"/"adslot" strings | Heuristic, unverified anchors; server still serves ads, client just hides them |
| Disable in-app popup upsells | off | `android:enabled="false"` on `com.meesho.inapppopup.impl.InAppPopupActivity` | May break a required flow routed through that activity |
| Stop pull-notification alarms (keep push) | off | `android:enabled="false"` on the three `pushnotify.pullnotifications.br.*` receivers | FCM push unaffected; pull-based marketing nags stop |
| Bypass forced update | off | `nop` + constant `move-result`: `AppUpdateInfo.updateAvailability()`→1, `isUpdateTypeAllowed()`→false | Outdated builds can break against the API |
| Prefer external browser over Custom Tabs | **on** | Removes the `CustomTabsService` `<queries><intent>` entry | No effect where `CustomTabsIntent.launchUrl` is called directly |
| Lock exported share-in / bank-link activities | off | `android:exported="false"` on `SharedTextRedirectionActivity`, `MyBankActivity` | Internal navigation unaffected; launcher/trampoline/SEARCH stay exported |
| Disable reels autoplay | off | `setPlayWhenReady(true)` literal → `false`, only in classes with "reel" in the name | Heuristic; ExoPlayer usage unverified; manual play still works |
| Allow screenshots & screen recording | off | Clears `FLAG_SECURE` (0x2000) bit from `Window.addFlags`/`setFlags` literals; flips literal `SurfaceView.setSecure(true)` | Payment screens may still capture black; non-literal flags left stock |
| Change package name | off | Manifest: package, `com.meesho.supply.*` permission ids, provider authorities, taskAffinity, launcher label. Component class names never renamed | Re-signed clone: JusPay, Truecaller/Otpless, Google sign-in, Shield may fail |
| Packaging toolkit (signature, install source, MicroG) | off | `dependsOn` shared spoof-signature / install-source / GmsCore patches | No Play Integrity / Shield bypass; cannot fix payments on a clone |

## Design rules

1. **Structural, not fingerprinted** where possible — scans key off stable API
   calls (`Window.addFlags`, `Player.setPlayWhenReady`, Play Core
   `AppUpdateInfo`, SDK owner prefixes) and exact manifest component names.
2. **Fail-safe** — absent class/element or non-literal argument → stock.
3. **Void call sites only** for `nop`; value-returning invokes get a constant
   `move-result` instead.
4. **Manifest edits never delete the only host/path of an intent filter** and
   never rename component class names.
5. Heuristic patches (ad gates, reels autoplay) default to **off** and say so.

## Verifying against the real APK (29.7)

`apktool d` / `jadx -d` on the merged APKM, then check: versionCode;
`res/values/strings.xml` deep-link scheme/hosts (`app_uri_scheme`,
`app_links_host*`); ad-model strings/classes ("sponsored", "adslot", "isAd");
ExoPlayer presence in reel classes; FLAG_SECURE call sites; Play Core
`AppUpdateInfo` usage; whether `InAppPopupActivity` hosts only marketing.
