# First-run dialogs recon — Opera Beta 104.0.5262.91143 (2026-11-10)

Source: `upload/beta_extract/apkm/base.apk` (7 dexes), jadx 1.5.1 `--no-res`
decompile of classes3.dex at `/tmp/jx3` (session-local; rebuild with
`work/tools/jadx/bin/jadx --no-res -j 4 --show-bad-code -d /tmp/jx3 /tmp/beta_dex/classes3.dex`).
Resource tables dumped with aapt/aapt2 (build-tools r34) to /tmp/beta_res*.txt.

## 1. Purple T&C dialog (first launch, Next button)

- Screen: `com.opera.android.startup.WelcomeActivity` (launcher chain: manifest
  launcher is `com.opera.InternetLauncherA` etc.; welcome flow screens are
  fragments inside WelcomeActivity).
- **Gate (WelcomeActivity onCreate, jadx line ~507):**
  ```java
  if (M().i("eula_accepted.gdpr")) {
      ((m9k) wznVar.get()).S();          // already accepted -> skip flow
  } else if (bundle == null) {
      new rml(...).a(new qfl(this, 19)).l();   // shows the EULA leaf flow
  }
  ```
- `M()`/`J()` = `com.opera.android.settings.SettingsManager`;
  `i(String)` → `n(str) != 0` → `y9j.getInt(str, fallback)`.
  **Storage = ContentProvider-backed store (`defpackage/wf2` implements `y9j`
  via ContentObserver + cursor; int 0/1)** — NOT a plain SharedPreferences file.
  => Pre-seeding the pref is invasive; patch the WelcomeActivity branch instead.
- Stable anchor: string constant `"eula_accepted.gdpr"` inside WelcomeActivity.
- Flow state bundle keys: `key.welcome_onboarding_flow.shown_leaves`,
  `key.welcome_onboarding_flow.current_index`.
- Side-effect chain to keep in mind: `defpackage/hjf` reads
  `eula_accepted.gdpr` and then touches `r65` (CMP consent controller) —
  if EULA is never marked accepted internally, the CMP consent request chain
  never fires (helps requirement 3). Other consumers found: s9.java (pref-change
  listener), dx3.java (lifecycle hook), s28/dw3/jv1/iyc/atf (verify at impl time).

## 2. "Help us make Opera better" consent dialog (Usercentrics CMP)

- Strings: `string/consent_onboarding_title` = "Help us make Opera better";
  toggles: `consent_onboarding_personalized_ads`, `consent_onboarding_personalized_news`,
  `consent_onboarding_message`, `consent_onboarding_footer`.
- CMP = **Usercentrics SDK** (`com.usercentrics.sdk.*`, 500+ refs in classes2.dex);
  Opera wrapper: `com.opera.android.cmpconsent.CmpConsentController`.
- Toggle type names in classes.dex: `ConsentForDataUsage`, `ConsentForAdsPersonalization`,
  `ConsentForAdStorage`.
- **Show-gate (defpackage/r65, jadx lines ~316-324):**
  ```java
  if (!i41.j0(ru9Var) && !ru9Var.a.getBoolean("startup.request_cmp_consent", true)) {
      return false;                      // don't show
  }
  return true;
  ```
  `ru9.a` = **SharedPreferences file `general_prefs`** (confirmed: `ru9.c(Context)`
  → `context.getSharedPreferences("general_prefs", 0)`).
  r65 also WRITES the flag: `putBoolean("startup.request_cmp_consent", !k() && ready.a)`
  and tracks `cmp_sdk_init_failure_count`.
- **Design: patch this gate to return false** (anchored by string
  `"startup.request_cmp_consent"`). Unasked Usercentrics consent = all services
  denied => all data-collection toggles OFF without user action (requirement met).
  Related pref keys seen: `key.asked_consents` (fragment args, int),
  `cmp_consent_may_show_after_timestamp`, `cmp_consent_settings_id`,
  `cmp_consent_response_timestamp`, `cmp_consent_config_version`,
  `personalization.onboarding.completed`, `oem.onboarding.completed`.

## 3. "Make Opera the default browser" startup prompt

- Resources: `drawable/default_browser_dialog_banner_background`, `illustration_default_browser`,
  `attr/onboardingIllustrationDefaultBrowser` (a welcome-flow default-browser leaf exists too).
- **Startpage dialog gate (defpackage/mm6, jadx line ~153):**
  ```java
  SharedPreferences sp6 = (SharedPreferences) b59Var.get();
  if (sp6.getBoolean("show_enable_default_browser_dialog_on_startpage", false)) {
      j.a(sp6, "show_enable_default_browser_dialog_on_startpage");
      if (z2) { km6Var = km6.e; }        // km6.e = show the dialog
  } else { ... }
  ```
  `b59` = lazy `context.getSharedPreferences(<name>, 0)` (file name passed via
  ctor — resolve exact file at impl time; candidates: c59/x7j composition roots).
  The flag is SET by `BrowserActivity` (~jadx line 2482):
  `edit2.putBoolean("show_enable_default_browser_dialog_on_startpage", true)`.
- Banner keys: `make_default_banner.dismissed` (30 refs), `make_default_banner.show_count`
  (12), `default_browser.first_set.timestamp`, `has_been_default_browser_previously`,
  `default_browser_removal_time`.
- Class `com.opera.android.defaultbrowser.DefaultBrowser` is referenced from
  classes3 but defined elsewhere (pv3/q0o/leanplum OperaSheet reference it).
- **Design: patch mm6 reader branch to never show** (anchor: string
  `"show_enable_default_browser_dialog_on_startpage"`); welcome-flow default-browser
  leaf is skipped automatically by fix #1 (whole welcome flow bypassed).

## Patch plan (new patch: "Skip first-run dialogs")

Three surgical bytecode edits, all anchored by stable string constants; no pref
pre-seeding (T&C store is a provider DB):
1. WelcomeActivity: force the `eula_accepted.gdpr` branch to the accepted path.
2. r65 CMP gate: force return false (dialog never shows; consents stay denied => OFF).
3. mm6 startpage gate: force the else path (default-browser dialog never shows).
Selection-wise it must compose with the crash fix from the C1/C2 bisect.

## Environment notes

- jadx 1.5.1 reinstalled at `work/tools/jadx/` (survives until next wipe; refetch
  URL https://github.com/skylot/jadx/releases/download/v1.5.1/jadx-1.5.1.zip).
- Dexes extracted at `/tmp/beta_dex/classes{,2,3,4,5,6,7}.dex` (session-local).
- classes3.dex decompile: 6581 classes, 17 recoverable errors (`--show-bad-code`).
