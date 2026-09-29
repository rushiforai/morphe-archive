# ADM 14.0.27 reference notes

## Source and target record

- Reference: `~/storage/downloads/1DM/Programs/com.dv.adm_14.0.27-140027_minAPI26(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk`
- SHA-256: `6f1d3aee879fe58cbd77e8ef01b3ce6e4d3f77aadd3e8276ec8232d0bdf006c1`
- Size: `58,716,075` bytes.
- Format: regular APK/ZIP containing 2,190 entries, not a split APKM container.
- Package: `com.dv.adm`.
- Version name: `14.0.27`.
- Version code: `140027`.
- Minimum SDK: `26`.
- Target SDK: `33`.
- Launcher activity: `com.dv.get.Main`.
- Application class: `com.dv.get.AApp`.
- The reference is user-supplied and has not been independently verified as the original publisher build.

## APK structure

- DEX files: `classes.dex`, `classes2.dex`, `classes3.dex`, `classes4.dex`.
- DEX class counts: 9,742; 6,082; 11,778; 7,198 respectively.
- The app's own classes are concentrated in `classes2.dex`: 276 classes under `Lcom/dv/`.
- `classes.dex` contains one app-named class, `Lcom/dv/adm/AEditor;`.
- `classes3.dex` and `classes4.dex` contain no `Lcom/dv/` classes.
- Native libraries are present for `arm64-v8a`, `armeabi-v7a`, `x86`, and `x86_64`.
- Notable native libraries: `libjlibtorrent-1.2.19.0.so`, `libPglmetasec_ov.so`, `libEncryptorP.so`, `libapminsighta.so`, `libapminsightb.so`, `libsentry-android.so`, and `libsentry.so`.
- The manifest declares 22 permissions, including internet access, external-storage access, boot completion, exact alarms, overlay windows, notifications, and Google Play billing.

## Application surface

- `com.dv.get.Main` is the launcher and download-list UI.
- `com.dv.get.AEditor` accepts `ACTION_SEND` and `ACTION_SEND_MULTIPLE` and also exposes start/stop actions.
- `com.dv.get.Web` accepts shared `text/*` and other content through `ACTION_SEND`.
- `com.dv.get.Back` is the persistent download/torrent service.
- `com.dv.get.Deep` handles boot, widget, and exact-alarm permission events.
- `com.dv.get.Pref` is the settings activity and accepts the quick-settings tile preference action.
- Two quick-settings tile services are exported with `BIND_QUICK_SETTINGS_TILE`.
- `com.dv.get.all.receiver.ReceiverStart`, `ReceiverStop`, `ReceiverOpen`, `ReceiverPlan`, and `ReceiverExit` provide broadcast-driven service and schedule controls.

## Billing and ad-free state

- `Lcom/dv/get/f3;` is the central monetization and ad helper.
- `f3.a:boolean` is initialized to `false` in `f3.<clinit>`.
- `f3.B(List<Purchase>)` checks a purchase whose product list contains `ads_disable`; after acknowledgement it sets `f3.a` to `false` and persists `hua_voice=false`.
- `Lcom/dv/get/e3;->c(BillingResult)` queries the `ads_disable` SKU and registers purchase callbacks.
- `f3.l(MyActivity)` initializes billing and reads the stored ad-free state.
- `t0.X2()` appends ` Pro` to the displayed version when `f3.a` is false. This confirms that the observed entitlement is an ad-free/Pro label, not evidence of a broader feature unlock.
- `f3.i(Activity)` initializes Appodeal interstitials.
- `f3.h()` shows the Appodeal banner only when `f3.a` is true.
- `f3.j(MyActivity)` shows an Appodeal interstitial after a short delay.
- `f3.n(MyActivity)` coordinates remote configuration, ad initialization, banner/interstitial scheduling, and Huawei prompts.
- `f3.c()` creates an AppBrain banner, while the manifest also contains AppLovin, AdMob, Unity Ads, Vungle, Appodeal, Criteo, Pangle, Bigo, Mintegral, Fyber, and other ad SDK components.
- `Back.onDestroy()` tracks `MAIN_ADS6`, `RATE_APP10`, and `RATE_ADS22` and increments rating/ad counters. This is a separate rating-prompt surface from the Appodeal calls.

## Patch 1 — Disable ads

- Compatibility: `com.dv.adm`, version `14.0.27`, regular APK.
- The patch returns early from the four app-owned ad entry points: `f3.c()` for AppBrain/Appodeal setup, `f3.i(Activity)` for Appodeal interstitial initialization, `f3.h()` for banner display, and `f3.j(MyActivity)` for interstitial display.
- `Lcom/dv/get/Main;->s3()V` is the only automatic Telegram join-prompt inflation site. It reads `TELE1_KEY` and `TELE2_KEY`, then inflates the `Lh2/c;->s` `ViewStub` through `Lh2/u0;->a(View)` and `Lh2/u0;->b()`. The gate constant `const/4 v9, 2` is at instruction index 98.
- The patch replaces that gate constant with `const/4 v9, 0`, causing the existing `if-ge v6, v9` at index 99 to skip the prompt block for the app-written counter values without changing instruction width.
- The Telegram URL `https://t.me/adm_torrent` is also used by the explicit `Main.onOptionsItemSelected` menu item at index 105; that user-initiated link is intentionally left intact.
- Fingerprints use the verified `main-toolend`, Appodeal key, `AppoInterShow`, and Telegram preference-key strings plus exact method signatures and ordered instruction anchors. Each anchor occurs once in the reference DEX.
- The patch does not alter downloader, torrent, browser, billing, Huawei, or remote-configuration methods.
- Static fingerprint validation passed. Gradle compilation and device application are pending because Java is unavailable in the current environment.

## Patch 2 — Disable rating prompts

- Compatibility: `com.dv.adm`, version `14.0.27`, regular APK.
- The patch returns early from `Main.W(Main)`, the dedicated wrapper that calls `Main.Y1(7)` for the `RATE_APP10` rating dialog.
- `Main.W(Main)` has one verified caller: the delayed `Lcom/dv/get/g0;` callback used by the rating flow. `Back.onDestroy()` is intentionally untouched so service cleanup and normal teardown continue.
- The fingerprint uses the exact method signature, literal case value `7`, and the `Main.Y1` call.
- Static fingerprint validation passed. Gradle compilation and device application are pending because Java is unavailable in the current environment.

## Downloader controls

The following preference keys are loaded by `Lcom/dv/get/Pref;` and are strong candidates for narrowly scoped client-side patches:

- `DOWN_LOADS_3G`, `DOWN_LOADS_WF`, `DOWN_LOADS_3GWF`: simultaneous download limits by network profile.
- `DOWN_THREADS_3G`, `DOWN_THREADS_WF`, `DOWN_THREADS_3GWF`: connection count per download.
- `DOWN_MINSIZE_*`, `DOWN_ERRORS_*`, `DOWN_TIMEOUT_*`: minimum chunk size, retry count, and timeout.
- `DOWN_ALGORITM_*` and `DOWN_USERAGENT_*`: download algorithm and user-agent profile.
- `DOWN_DIRS`, `DOWN_FILENEW`, `DOWN_RESTART`, `DOWN_PROFILE`, and `DOWN_PROXY`: storage and transfer behavior.
- `WIFI_FLAG`, `WIFI_AUTO`, `WIFI_AUTO_S`, `SERV_AUTO`, and `SERV_STOP_2`: network and background-service controls.
- `TORR_*`: torrent enablement, sequential mode, trackers, connection and upload-slot limits, upload speed/time limits, watch folder, Wi-Fi/charging restrictions, and encryption mode.
- `SCHD_FLAG`, `SCHD_START`, `SCHD_STOP`, `SCHD_WIFI`, `SCHD_MOBI`, `SCHD_REPE`, and `SCHD_ALARM`: scheduler behavior.

`Back.onCreate()` registers a receiver for battery, power, Wi-Fi, widget, and exact-alarm changes. `t0.N()` checks the battery level against `Pref.C2`; `t0.W1()` opens the exact-alarm settings screen; `Deep.onReceive()` dispatches service and widget events.

## Patch 3 — Increase connection limits

- Compatibility: `com.dv.adm`, version `14.0.27`, regular APK.
- `Lcom/dv/get/Pref$o;->f(Lcom/dv/get/Pref$o;)V` is the single verified synthetic accessor for the `s213` (`Simultaneous downloads`) and `s215` (`Threads per download`) slider. Its `const/16 v1, 32` instruction at index 6 is the shared ceiling; replacing it with `const/16 v1, 64` raises both controls from 32 to 64. The lower bound remains 4.
- `Lcom/dv/get/Pref;->G1(Landroid/app/Activity;)V` loads `TORR_MAXCONNECT` with the default string `210` at instruction index 1222 and `TORR_MAXCONNECTPER` with `70` at index 1227. The patch changes those defaults to `500` and `100` respectively.
- The torrent dialog already installs `InputFilter.LengthFilter(9)`, so the torrent change is a default-value change rather than a new hard UI ceiling. Existing saved preferences are not overwritten.
- Fingerprints use the exact synthetic accessor signature, the two resource IDs, the unique `32` literal, both preference keys/default strings, and the `Pref.E1(String,String)` call.
- Selected values: download ceiling `64`; torrent global default `500`; torrent per-torrent default `100`.
- Static DEX anchor validation passed. Gradle compilation and device application are pending because Java is unavailable in the current environment.

## Patcher pitfalls

- `BuilderInstruction3rc` encodes an `invoke-*/range` register count that must equal the referenced method's parameter count, otherwise ART rejects the class. A shared helper that hardcodes a literal count silently breaks for any hook with a different arity, so derive it from `parameters.size`.
- `newLabelForIndex` attaches a label to the instruction object occupying that index when the call is made, and that object keeps its identity as later insertions shift it. When several instructions are inserted at indices `0..n`, bind the continue label to `1`, not to the post-insertion final index, or the false branch skips the injected block and leaves later registers undefined, which surfaces as a `VerifyError` when the class loads.
- The DEX prototype for `Landroid/view/MenuItem;->setShowAsAction(I)` in this build is `(I)V`, while the public SDK method returns `MenuItem`, so a fingerprint written from the SDK signature never matches and must declare `returnType = "V"`. `setIcon(I)` does return `Landroid/view/MenuItem;` in the same method, so the two cannot be assumed to agree.

## Build environment

- `openjdk-21` is installed at `/data/data/com.termux/files/usr/lib/jvm/java-21-openjdk` and exported through `/data/data/com.termux/files/usr/etc/profile.d/openjdk.sh`.
- A local Gradle build is not possible: `https://maven.pkg.github.com/MorpheApp/registry` returns `401` for the available `gh` token, which lacks the `read:packages` scope, so `app.morphe.patches` plugin `1.3.4` cannot be resolved. Compilation is delegated to CI.

## Browser and remote data

- `Lcom/dv/get/Web;` owns the built-in browser and creates its WebView in `S2()Landroid/webkit/WebView;`, which installs `Web$h;` as the `WebChromeClient`, `Web$i;` as the `WebViewClient`, `La2/m4;` as the long-click listener, and `La2/o4;` as the `DownloadListener`.
- `Web.onOptionsItemSelected()` toggles `BROW_ADSB` through `Pref.m5`.
- Browser menu handling does **not** use the framework options menu. `Web.onCreateOptionsMenu(Menu)` is called only from `Web.o3()` and its return value is discarded, so the `Menu` it fills is never displayed. The visible browser overflow is a `PopupMenu` wrapped by `Lb2/f;`, created inside `Web.onOptionsItemSelected(MenuItem)`, filled through `Lb2/f;->d()Landroid/view/Menu;`, and shown by `Lb2/f;->e()V`. Item clicks reach the `Lb2/f$b;` callback installed by `Lb2/f;->c(Lb2/f$b;)V` through `Lb2/e;->onMenuItemClick(MenuItem)`.
- Register windows: `Lb2/f;->e()V` has 8 registers with `this` in `v7` and the `PopupMenu` in `v0` at original indices 3 and 6 before the two `SDK_INT >= 29` branches. `Lb2/e;->onMenuItemClick` has 3 registers with `this` in `v1` and the item in `v2`, delegating to `Lb2/f$b;->b(MenuItem)` at index 1. `Web$i;->onPageStarted` and `Web$i;->shouldInterceptRequest` both place `this` in `v3`, so `(WebView,String)` is `v4,v5`.
- `Web.onCreateOptionsMenu(Menu)` has 18 registers and 412 instructions; `this` is `v16` and the `Menu` argument is `v17`, and the returns sit at indices `19, 60, 140, 293, 411`. `Web.onOptionsItemSelected(MenuItem)` has the same register layout, calls `MenuItem.getItemId()` at index `2` into `v1`, and consumes the id with a `sparse-switch` at index `25` whose payloads are resource ids such as `0x7f09003a`.
- `Lb2/f;` has a single private field `a` of type `Landroid/widget/PopupMenu;`, and `d()Landroid/view/Menu;` simply returns `a.getMenu()`. `android.widget.PopupMenu` exposes no `getAnchorView()`, so a hook needing the host `Activity` has to capture it from the `WebView` context earlier and cache it, for example in a `WeakReference`; the click path's `host` is the `Lb2/e;` wrapper, not an `Activity`.
- The default resource table contains `alive_hosts` and an `https://adm.dimonvideo.ru/alive_hosts.txt` value, confirming a remote host/ad-block list path.
- `Web` also manages cookies, history, JavaScript, image loading, dark mode, saved tabs, search engines, and the `file://` URL bridge.
- DEX recon resolves the existing direct-download intents in `C0` and `c1` to `Lcom/dv/get/AEditor;`; `Lcom/dv/adm/AEditor;` is a separate class.
- `f3.g()` reads a remote response through resource ID `str07` and stores key/value pairs in the `xyz` shared-preference file. The resource table identifies the endpoint as `https://adm.dimonvideo.ru/data`; the request adds `?jack=927`.
- `f3.E()`, `f3.F()`, and `f3.G()` read Huawei/AppGallery state and message data. `f3.p()` and `f3.q()` invoke Huawei/AppGallery-related paths.

## Privacy and diagnostics

- `AApp.onCreate()` installs a custom uncaught-exception handler in `Lf2/a;`, creates a `crash_reports` directory, and starts a `Lf2/b;` worker thread.
- The package includes Sentry native libraries, APM Insight native crash libraries, Google data transport, AppBrain components, and advertising identifiers.
- `t0.p2(Activity)` reads the `firebase.test.lab` system setting into `t0.n`; this is a verified control-flow path, not proof of a particular Firebase event.

## Next implementation suggestions

1. **Disable Huawei/AppGallery prompts and remote configuration:** target the `HUA_*` branches in `f3` and the `f3.g()` remote-config read separately from ad removal.
2. **Privacy mode:** disable the custom crash handler and diagnostic worker in `AApp.onCreate()`; assess Sentry/AppBrain separately because they are separate SDKs.
3. **Download tuning:** change or expose the existing `DOWN_*` limits rather than inventing new downloader code; test against real servers because server-side limits still apply.
4. **Torrent tuning:** adjust the existing `TORR_*` settings, but validate the native jlibtorrent boundary and do not assume a DEX-only edit changes native engine behavior.
5. **Scheduler/background reliability:** inspect the `Back`, `Deep`, and `t0` battery/Wi-Fi/exact-alarm paths; this is feasible but device- and Android-version-sensitive.
6. **Browser ad blocking:** force or repair the existing `BROW_ADSB`/hosts path instead of adding a new blocking engine.

## Unresolved risks

- The ADM compatibility declaration and first two patches are written, but not compiled or applied yet.
- The native protection libraries may perform integrity or runtime checks outside the reach of a DEX patch.
- SDK providers may still initialize independently even after the app-owned ad entry points are skipped.
- The remote ad, Huawei, Firebase, and diagnostic paths may continue independently.
- Download and torrent behavior is constrained by servers, network conditions, Android background execution, and native code.
- A device-applied bundle test is still required for both patches and every later candidate.
