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
- A second copy of the same APKM (`...apkmirror.com (1).apkm`) is intact: `base.apk` inflates to its full 90,777,380 bytes, and all eleven DEX files plus the whole `res/` tree are present, including the `classes8.dex` and `classes9.dex` that the first copy lost. The two files are byte-different and share a name, and only the `(1)` copy is usable.

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

- The native protection libraries may perform integrity or runtime checks outside the reach of a DEX patch.
- SDK providers may still initialize independently even after the app-owned ad entry points are skipped.
- The remote ad, Huawei, Firebase, and diagnostic paths may continue independently.
- Download and torrent behavior is constrained by servers, network conditions, Android background execution, and native code.
- The three patches compile and apply, but their runtime effect is still unconfirmed on a device.
- The 14.0.27 fingerprints were removed when the patches were retargeted, so 14.0.27 is no longer declared as a target. Declaring it would advertise support that fails with a fingerprint error, because every fingerprint is 14.0.39-only. Re-adding it means either re-deriving the 14.0.27 fingerprints or selecting between two fingerprint sets per patch, which is a larger change than the retarget.

# ADM 14.0.39 reference notes

## Source and target record

- Reference: `~/storage/downloads/com.dv.adm_14.0.39-140039_4arch_7dpi_19lang_1feat_24af8dcba9ae0566c68f55845c95e1ef_apkmirror.com.apkm`
- Format: APKM bundle. Only `base.apk` was analysed; the ABI, density, and language splits were ignored because they contain no DEX.
- `base.apk` size: `41,687,635` bytes. DEX files: `classes.dex` through `classes6.dex` (9,405 / 5,551 / 10,626 / 5,447 / 2,319 / 2,339 classes).
- Package: `com.dv.adm`. Version name: `14.0.39`. Version code: `140039`.
- The app's own code moved from `classes2.dex` (14.0.27) into `classes.dex` (14.0.39).
- `com.dv.get` activity and service classes keep their names, but every obfuscated member was renamed: `f3` became `Lv2/o5;`, `f3.g()` became `Lv2/e3;->run()`, the rating wrapper's dispatcher became `Lv2/p1;`, and `Main.s3()`/`Main.Y1()`/`Main.W()` became `Main.K()`/`Main.n()`/inlined.
- `Lcom/dv/get/Pref$o;` no longer exists. 14.0.39 has no inner classes under `Lcom/dv/get/Pref;` at all.
- `Pref.E1(String, String)` became `Pref.A(String, String)`. `Pref.G1(Activity)` became `Pref.C(Activity)`.
- Every fingerprint below was re-derived from this DEX. None of the 14.0.27 fingerprints resolve against 14.0.39.

## Monetization surface

- `Lv2/o5;` is the monetization and ad helper, the successor of `Lcom/dv/get/f3;`.
- `Lv2/o5;->a Z` is the ad-free flag: `o5.b()` returns immediately when it is set, so `false` means "show ads".
- `Lv2/o5;->c(Activity)` initializes Appodeal with the publisher key, guarded by a one-shot `o5.p` latch.
- `Lv2/o5;->b()` shows the Appodeal banner: it requests the banner view, attaches it to the app's ad container, broadcasts `main-toolend`, and otherwise calls `Appodeal.show(activity, 64)`.
- `Lv2/o5;->d(Activity)` shows the Appodeal interstitial, rate limited by the `AppoInterShow` timestamp preference.
- `Lv2/o5;->n()` is the single accessor for the ad container, resolving `findViewById(2131296377)` or `2131296356` depending on `o5.d`. It has exactly four callers, all of which null-check the result: `Lv2/e3;->run()` at two sites, `Lv2/o5;->b()`, and `Ls3/g;->onInterstitialClosed()`.
- 14.0.27 combined banner creation and Appodeal setup in one `f3.c()`. 14.0.39 split them: the Appodeal banner moved to `o5.b()` and the AppBrain banner moved into a remote-configuration dispatch case of `Lv2/e3;->run()`.
- `Lv2/e3;->run()` is a packed-switch runnable over `e3.a` with cases 8, 4, 24, 0, and 1. Its AppBrain case constructs `AppBrainBanner` (index 89), attaches it (93), reveals the container (94), and broadcasts `main-toolend` (96) before continuing into the Appodeal banner setup and returning at 152.
- The Appodeal application key `18b2becc3142993292bf348e92467eded74e23229100a646` is user supplied and unchanged between the two versions. `main-toolend` is an app broadcast action, not an SDK key; it also appears in `o5.b()` and in `Main.K()`.
- `Lcom/dv/get/Main;->K()V` performs activity start-up and inflates the Telegram prompt. Both `ViewStub.inflate()` (108) and `View.setVisibility()` (126) occur exactly once in the method, which makes them reliable anchors.
- The Telegram prompt is gated by two view counters: `if-ge v4, v7` at 103 skips the prompt once `TELE1_KEY` reaches the `const/4 v7, 2` threshold at 101, and `if-ge v6, v7` at 105 applies the same test to `TELE2_KEY` against 9. Setting the first threshold to 0 makes the comparison always hold and lands on the normal start-up path at 163. 14.0.39 inserts one `const/4 v8, 1` between the threshold and the branch, which is why the branch anchor allows one intervening instruction.

## Patch 1 — Disable ads (14.0.39)

- Compatibility: `com.dv.adm`, version `14.0.39`. `ApkFileType.APK` is non-required, so the APKM bundle is also accepted.
- `Lv2/o5;->c(Activity)`, `Lv2/o5;->b()`, and `Lv2/o5;->d(Activity)` return early, which is the same three entry points 14.0.27 patched under different names.
- The AppBrain banner is not in its own method in 14.0.39, so the patch does not return early from `Lv2/e3;->run()`. It replaces `ViewGroup.addView(View)` at index 93 and `View.setVisibility(I)` at index 94, each a three-code-unit `invoke-virtual`, with three `nop`s of the same width. Leaving the remote-configuration fetch and the rest of that dispatch case intact, and leaving every address in the method unmoved. The registers the two calls read (`v0` at 83, `v1` at 87, `v4` at 4) are still assigned, so no undefined read is introduced.
- The `main-toolend` broadcast at 96 still fires, so any component that reacts to it is unaffected.
- The Telegram gate constant is replaced with `const/4 v7, 0`, keeping the register and the instruction width.
- Fingerprints: the Appodeal key, `AppoInterShow`, `main-toolend`, the `TELE*_KEY` preference keys, the unobfuscated `Lcom/appbrain/AppBrainBanner;` type, and the SDK classes `Lcom/appodeal/ads/Appodeal;`, `Landroid/view/ViewStub;`, `Landroid/view/ViewGroup;`, and `Landroid/view/View;`. Each anchor was confirmed to occur exactly once inside its own method.
- The app's own "remove ads" placeholder at `Lv2/e3;->run()` 168-208 is intentionally left intact; it is a house promo, not an ad SDK view.

## Patch 2 — Disable rating prompts (14.0.39)

- The dedicated `Main.W(Main)` wrapper is gone. `Main.n(7)` is now called from `Lv2/p1;->run()` at index 724, one of three calls in that dispatcher, inside the case bounded by `Main.s()` at 719 and `return-void` at 725.
- The patch replaces only the `Main.n(I)` invocation with three `nop`s, so the delayed case still returns normally and the other eleven cases are unaffected. `v0` (721) and `v5` (723) are still assigned.
- The user-initiated rating menu item calls `Main.n(7)` directly from `Main.onOptionsItemSelected`, so it still opens the dialog. This matches the 14.0.27 intent of silencing only the automatic prompt.
- `Back.onDestroy()` and its `RATE_APP10` / `RATE_ADS22` / `MAIN_ADS6` counters are untouched, so service teardown is unaffected.

## Patch 3 — Increase connection limits (14.0.39)

- `Lcom/dv/get/Pref;->U()V` builds the download settings screen. Each control is a `Lv2/j4;` preference whose bounds are the `a` and `b` fields; `Lv2/j4;->showDialog` sets the seek bar range to `b - a`.
- The bounds are register constants loaded once at the top of the method, not per-control literals, so the 14.0.27 `Pref$o.f` slider accessor has no successor. The constants are `v2=0`, `v3=6`, `v6=961`, `v7=5`, `v8=16`, `v9=1`.
- `v7` is the ceiling for all three simultaneous-download controls. It is also reassigned and reused for unrelated case identifiers and objects later in the method, but a proper liveness pass shows its value reaches exactly the three `DOWN_LOADS_*` maxima and nothing else, so raising `const/4 v7, 5` to `const/16 v7, 32` affects only those. `const/4` cannot encode 32, so the replacement is one code unit wider; the method has no switch or array payload and the patcher recomputes branch offsets.
- **The per-download ceiling needs a different mechanism.** `v8=16` is the ceiling for all three `DOWN_THREADS_*` controls, but the same constant is also the *minimum* of the three chunk-size controls at indices 46, 184, and 330, where the maximum is `v6=961`. Editing `v8` would silently raise the minimum chunk size from 16 to the new ceiling, changing download chunking behaviour.
- Instead, a `const/16` is written immediately before each `DOWN_THREADS_*` maximum store, and the store is rewritten to read that constant. `v5` is the register used: it is assigned four times in `Pref.U()` (indices 5, 106, 246, 393) and **never read**, so it is dead and cannot disturb any other value. Each control's maximum is written independently, and each site's `j4` target register and field are taken from the original instruction rather than hardcoded.
- The three maxima are at indices 33, 170, and 317, each written just *before* its own preference key at 38, 175, and 322. Note that a control's bounds precede its key, so a fingerprint that searches forward from the key finds the next control's bounds instead. The `ThreadCeilingFingerprint` chain therefore walks shared minimum constant, `DOWN_LOADS_*` maximum, `DOWN_THREADS_*` minimum, `DOWN_THREADS_*` maximum, then the key, which lands on 9, 16, 32, 33, and 38.
- `Lcom/dv/get/Pref;->C(Activity)` still reads `TORR_MAXCONNECT` with the default `210` at 1222 and `TORR_MAXCONNECTPER` with `70` at 1227, through `Pref.A(String, String)`. Both are `const-string` replacements that keep the original width and destination register, so the surrounding reads are untouched. Already saved preferences still win.
- Resulting defaults: at most 32 simultaneous downloads and 64 connections per download, torrent defaults 500 global and 100 per torrent, chunk size still 16 to 961.
- 14.0.39 is more restrictive than 14.0.27 here: 14.0.27 capped simultaneous downloads at 32 with a minimum of 4 and threads at a single shared ceiling, while 14.0.39 caps downloads at 5 with a minimum of 1 and threads at 16.

## Verification performed for 14.0.39

- A re-implementation of Morphe's own matching algorithm (type-declaration comparison, `parametersMatch`, the `matchFilters` backtracking loop, and `MatchAfterWithin` distance rules) was run against the 14.0.27 DEX first. It reproduced every instruction index recorded in the 14.0.27 notes above, including the Telegram gate at 98, the slider ceiling at 6, and the torrent defaults at 1222 and 1227, which is what makes it trustworthy for 14.0.39.
- All nine 14.0.39 fingerprints were then resolved against the 14.0.39 DEX and each reported the expected instruction indices.
- Every replacement instruction keeps the source register of the instruction it replaces. An earlier draft of this note also claimed the two methods holding a `packed-switch` payload (`Lv2/e3;->run()` at byte `0x052c` and `Lv2/p1;->run()` at byte `0x0c60`) kept that payload at its original 4-byte-aligned address. That was wrong, and is corrected under "Second device crash" below: `replaceInstructions` removed the two instructions after each invoke as well, so those methods shrank by 6 and 3 code units and their payloads did move. Both now remove the invoke on its own and pad it back to its original width, which keeps both method sizes unchanged.
- `Pref.U()` was additionally checked by a register liveness pass and by simulating the patched instruction stream. Those first passes were linear and could not model per-merge-point typing or block termination, and they were redone as a control-flow analysis with liveness and reaching definitions; the results are recorded under "The shared download constant does reach all three profiles". The simulation confirms all six download controls receive the intended bounds, the three chunk-size controls keep minimum 16 and maximum 961, and the patch introduces no uninitialised read and no int/object type violation on any instruction it writes. The four findings the simulation reports exist identically before and after patching and are in untouched app code, where a linear pass cannot model per-merge-point register typing.
- Note for future work: androguard's `Instruction.get_length()` returns a nibble count, not code units, so instruction addresses derived from it are wrong. The widths used above come from the DEX instruction format table instead.
- Verified in CI: the patch project compiles and the bundle builds and publishes as a release asset.

### Device crash in `Pref.U()` — root cause (v0.2.1 and later)

A patched 14.0.39 build dies with a hard verifier failure the moment the download
settings screen is built:

```
java.lang.VerifyError: Verifier rejected class com.dv.get.Pref: void com.dv.get.Pref.U()
failed to verify: void com.dv.get.Pref.U(): [0x5A] register v12 has type IntegerConstant
but expected Reference: f5.g
    at f3.j.j  at b3.c.b  at b3.c.run
```

Re-analysed against the pinned 14.0.39 DEX (`classes.dex`, `.registers 23`, 1 002 code
units). Measured facts, not inference:

- **The two register assumptions both hold.** `v5` is written at indices 5, 106, 246 and
  393 and read at none of them, so the `const/16 v5, 64` scratch is safe. `v7` is written
  at index 7 and only read from index 16 onward, so raising `const/4 v7, 5` to
  `const/16 v7, 32` is type-safe and reaches only the three `DOWN_LOADS_*` maxima.
- **The cause is `replaceInstructions`, not the registers.** Morphe's extension is
  implemented in `app.morphe.patcher.extensions.InstructionExtensions` as

  ```kotlin
  fun MutableMethodImplementation.replaceInstructions(index, instructions) {
      removeInstructions(index, instructions.size)
      addInstructions(index, instructions)
  }
  ```

  It removes as many instructions as it is given. The thread edit supplies two
  instructions, so it deleted index 33 *and* index 34. Index 33 is the intended
  `iput v8, v11, Lv2/j4;->b:I`, but index 34 is
  `iget-object v12, v0, Lcom/dv/get/Pref;->f:Lf5/g;` — the instruction that gives `v12`
  its `f5/g` reference type. With it deleted, `v12` keeps the `const v12, 2131755440`
  written at index 23, so `v12` is an `IntegerConstant` where the later
  `Lv2/j4;->h(Lf5/g; I Lv2/o4; Ljava/lang/String; ...)` invocation reads it. That is
  exactly the reported mismatch, and it explains why the message names `v12` and `f5/g`
  when neither register appears in the patch's own text.
- **Branch offsets were never the problem.** Branch targets in dexlib2 are `Label`
  objects bound to instruction identity, and offsets are only assigned when the method
  is written, so an insertion cannot invalidate them. `Pref.U()` has five branches, two
  of which cross the edit point (`if-eqz` at index 10 targeting index 289, and `if-nez`
  at index 12 targeting index 150, `new-instance v12, Lv2/j4;`); both stay correct
  because the labels move with their instructions. An earlier draft of this note blamed
  those two branches; that was wrong, and the real fault is the extra deletion above.
- The prior register liveness pass and patched-stream simulation both missed this
  because they checked the registers the patch *writes* and never checked which
  instructions the patch *removes*.

The fix removes the original store explicitly and then inserts, so exactly one
instruction is deleted:

```kotlin
fingerprint.method.removeInstruction(maximum.index)
fingerprint.method.addInstructions(maximum.index, "const/16 v5, 64\niput v5, v11, ...")
```

### Second device crash: `Lv2/p1;->run()` (v0.3.3)

With the `Pref.U()` fix in place, v0.3.3 still died on launch, this time before any
screen was built:

```
VerifyError: void v2.p1.run() failed to verify: [0x5FC] tried to get class from
non-reference register v0 (type=Conflict)
    at com.dv.get.Main.onCreate
```

`Lv2/p1;->run()` is the delayed-callback dispatcher that `DisableRatingPromptsPatch`
edits. The same `replaceInstructions` trap as the `Pref.U()` crash, reached from a
different direction. The patch passes three `nop`s to silence one `invoke-virtual`, and
that removes three instructions, so it deleted:

- 724 `invoke-virtual` — the intended target, three code units
- 725 `return-void` — the dispatch case's own return
- 726 `iget-object v0, v1, ...` — **the only assignment of a reference to `v0` on that
  path**

Without 726, `v0` holds a reference on the paths that kept the `iget-object` and something
else everywhere else, so the verifier sees a `Conflict` the first time `v0` is used as a
receiver. `DisableAdsPatch` has the identical defect in `Lv2/e3;->run()`: its first site
ate the second invoke outright, and both sites ate the `new-instance` that writes `v0`.

Measured, not inferred: each matched invoke is a 35c, three code units wide, and
`replaceInstructions` left `Lv2/p1;->run()` at 1 607 code units instead of 1 610 and
`Lv2/e3;->run()` at 668 instead of 674, so the "same width, so no payload moves" reasoning
in the original comments never held.

The fix removes the invoke on its own and pads it back to its original width, which keeps
both methods byte-for-byte the same size. `DisableAdsPatch` additionally reads both
indices before editing and applies them highest first, because removing one invoke and
adding three nops moves every later index up by two.

### `DOWN_THREADS_*` ceilings extended to all three profiles

The patch previously raised only the `DOWN_THREADS_3G` maximum, while its description
claimed "64 connections per download". `Pref.U()` contains three structurally identical
profile blocks. Every access to `Lv2/j4;->a:I` and `->b:I` in the method, in order, is:

| indices | control | value written to `b` |
| --- | --- | --- |
| 15, 16 | `DOWN_LOADS_3G` min/max | `v7` |
| 32, 33 | `DOWN_THREADS_3G` min/max | `v8` |
| 46, 47 | chunk size 3G min/max | `v8` / `v6` |
| 152, 153 | `DOWN_LOADS_WF` min/max | `v7` |
| 169, 170 | `DOWN_THREADS_WF` min/max | `v8` |
| 184, 185 | chunk size WF min/max | `v8` / `v6` |
| 299, 300 | `DOWN_LOADS_3GWF` min/max | `v7` |
| 316, 317 | `DOWN_THREADS_3GWF` min/max | `v8` |
| 330, 331 | chunk size 3GWF min/max | `v8` / `v6` |

Every access is an `iput`; there are no `iget` reads of either field, and nothing else
touches them between a profile's `DOWN_LOADS_*` key and its `DOWN_THREADS_*` store. So
each profile is now matched by a fingerprint anchored on its own `DOWN_LOADS_*` key and
then walking the next `a`, the next `b`, and that profile's `DOWN_THREADS_*` key, which
resolves to `21/32/33/38`, `158/169/170/175` and `305/316/317/322`. `string()` compares
with `StringComparisonType.EQUALS`, so `DOWN_LOADS_3G` cannot match `DOWN_LOADS_3GWF`.

Because each edit removes one instruction and adds two, the three stores are resolved
before any mutation and then applied from the highest index down, so no edit invalidates
an index a later edit still needs. `v5` remains the scratch register: it is written at
indices 5, 106, 246 and 393 and read at none of them, and materialising the value
immediately before each store means the result does not depend on what any register held
on the way there. Simulating all three edits gives 434 to 437 instructions, keeps every
neighbouring instruction intact, and puts `const 64` in front of all three thread maxima
while the chunk-size minimum stays 16 and the chunk-size maximum stays 961.

### The shared download constant does reach all three profiles

An earlier draft of this note recorded an open question: the simultaneous-download
ceiling is raised by editing the single shared `const/4 v7, 5` at index 7, on the stated
grounds that it reaches all three `DOWN_LOADS_*` maxima, and a control-flow pass appeared
to contradict that. The contradiction was the analysis's fault, not the patch's. A
control-flow graph built for `Pref.U()` was giving `return-void` a fall-through edge, so
the finished 3G block looked like it flowed into the WiFi block, and `v7`'s write at
index 103 inside the 3G block looked like a second reaching definition at the WiFi store.
With terminators modelled, the answer is unambiguous:

| store | value register | every definition that can reach it |
| --- | --- | --- |
| 16 `DOWN_LOADS_3G` max | `v7` | `const/4 v7, 5` |
| 153 `DOWN_LOADS_WF` max | `v7` | `const/4 v7, 5` |
| 300 `DOWN_LOADS_3GWF` max | `v7` | `const/4 v7, 5` |
| 33 / 170 / 317 thread max | `v8` | `const/16 v8, 16` |
| 46 / 184 / 330 chunk min | `v8` | `const/16 v8, 16` |
| 47 / 185 / 331 chunk max | `v6` | `const/16 v6, 961` |

Each store is fed by exactly one definition, so raising `v7` to 32 does reach all three
profiles, and the download half of the patch needs no change. The same table is why the
thread half cannot work the same way: `v8` feeds the three `DOWN_THREADS_*` maxima *and*
the three chunk-size minima, so raising `v8` would silently raise the minimum chunk size
from 16 as well. Materialising the value at each store avoids that, which is what the
three per-store edits do.

`v5` was also confirmed to be a genuinely dead scratch register by liveness rather than
by reading the disassembly: it is written at indices 5, 106, 246 and 393 and read at
none of them, and it is not live at 33, 170 or 317. Note that `filled-new-array` names
its destination array as the first register, so counting that as a read makes `v5` look
live and would have wrongly rejected the edit.

### `replaceInstructions` audit

`replaceInstructions(index, smali)` removes as many instructions as the replacement list
is long and then inserts that list. It is only correct when the list is exactly as long as
the span meant to be erased, *and* the list is the same width as that span. Both conditions
have now been violated and caused a launch crash. Every call site, re-checked:

| call site | before | now |
| --- | --- | --- |
| `IncreaseConnectionLimitsPatch.kt` (threads) | 2-instruction list over a 1-instruction `iput`: deleted the `iget-object` that gave `v12` its reference type | `removeInstruction` + `addInstructions`, one instruction removed |
| `DisableRatingPromptsPatch.kt` | `"nop\nnop\nnop"` over one 3-unit `invoke-virtual`: deleted the case's `return-void` and the `iget-object` that wrote `v0` | `removeInstruction` + `addInstructions`, method size unchanged |
| `DisableAdsPatch.kt` (two sites) | same, plus the first site deleted the second invoke outright | indices read up front, applied highest first, size unchanged |

No `replaceInstructions` call remains in the repository. `DisableHomeScreenAdsPatch.kt`
(1DM) only ever used `addInstructions`, which removes nothing.

`replaceInstruction` (singular) is unaffected: it replaces exactly one instruction, and is
used correctly by the download-ceiling, torrent-default and Telegram-gate edits. The lesson
is that a single-instruction edit must be expressed as a single-instruction operation, not
as a width-matched block of `nop`s handed to a helper that deletes by list length.

- Verified on device: the `0.2.1-dev.2` bundle applies cleanly to 14.0.39 on Android 15 with all three patches enabled, so every fingerprint resolves and every generated smali instruction assembles.
- Still unverified on device: the runtime effect of each patch. Applying successfully proves the fingerprints and encodings, not that ads are gone, that the sliders show the new bounds, or that no layout gap is left where the AppBrain container used to sit. Those need a manual pass.

# 1DM 18.2 reference notes

## Source and target record

- Reference: `/storage/emulated/0/Download/idm.internet.download.manager_18.2-30249_4arch_7dpi_85518970fbabdebca09caf183d786bde_apkmirror.com.apkm`
- SHA-256 of the APKM: `09e36d9356c8013c1eab3f0132b869ff3919f6194d1807d4c71f6bba2a581c7d`
- Size: `82,244,030` bytes. Format: APKM bundle (universal, 4 architectures, 7 densities), 18 entries.
- Package: `idm.internet.download.manager`. Version name: `18.2`. Version code: `30249`.
- Minimum SDK: `24`. Target SDK: `34`.
- Launcher activity: `idm.internet.download.manager.MainActivity` (also `LEANBACK_LAUNCHER`).
- Application class: `acr.browser.lightning.app.BrowserApp`. 1DM is a fork of the Lightning browser, so the shared view layer lives under `Lacr/browser/lightning/`.
- The manifest declares 32 permissions, including `AD_ID`, `ACCESS_ADSERVICES_TOPICS`, `ACCESS_ADSERVICES_ATTRIBUTION`, `ACCESS_ADSERVICES_AD_ID`, `com.applovin.array.apphub.permission.BIND_APPHUB_SERVICE`, `com.android.vending.BILLING`, `SYSTEM_ALERT_WINDOW`, and `QUERY_ALL_PACKAGES`.
- Own services: `DownloadService`, `MediaScannerService`, `CheckAppVersion`, `IDMFirebaseMessagingService`, `TempFilesDeletionService`, `LogcatCaptureService`, and four quick-settings tile services.
- Bundled mediation stack: AdMob, AppLovin MAX, Unity Ads, IronSource, Chartboost, Vungle, Pangle, BidMachine, Moloco, MobileFuse, Smaato, InMobi, Bigo, MyTarget, PubMatic, Fyber, Verve, Mintegral, plus the Amazon APS banner (`com.amazon.device.ads`).
- The reference is user-supplied and has not been independently verified as the original publisher build.

## The reference file is damaged, and what that allowed

- The APKM is a corrupt download. `unzip` and `zipfile` both fail on the `base.apk` entry with `zlib.error: invalid distance code` after 68,812,800 of 90,777,380 bytes, and `split_config.armeabi_v7a.apk` fails with `invalid block type`. Every other entry inflates cleanly, so the container is intact and only two member streams are damaged.
- The `base.apk` deflate stream was decompressed manually up to the failure point (compressed offset 27,262,976 of 35,799,044), and the surviving prefix was walked entry by entry. Because deflate is a stream, everything decoded before the error is intact.
- Recovered from that prefix: `AndroidManifest.xml` (912,896 bytes, binary XML with an embedded resource table) and eight DEX files — `classes.dex`, `classes2.dex` through `classes7.dex`, and `classes10.dex`. Each recovered DEX matches the `file_size` in its own header and verifies against its embedded SHA-1 signature and Adler-32, so they are byte-exact copies, not approximations.
- Lost: `classes8.dex` (truncated at the damage point), `classes9.dex` (never reached), all `res/` layout and drawable XML, and every other entry stored after that offset in the ZIP.
- Consequence for this patch: **all** classes under `Lidm/internet/download/manager/` live in the two missing DEX files. The eight recovered DEX files contain 916 classes under `Lacr/browser/lightning/` and zero under `Lidm/`. `MainActivity`, the layout that hosts the banner, `Lidm/internet/download/manager/d` (the ad-configuration provider) and `Lidm/internet/download/manager/amazon/AmazonService` could not be read. Anything below that is inference, and is marked as such.

## DEX inventory (recovered only)

| DEX | bytes | classes | `Lacr/browser/lightning/` | `Li/*` |
| --- | --- | --- | --- | --- |
| `classes.dex` | 10,713,976 | 9,200 | 916 | 1,002 |
| `classes2.dex` | 182,952 | 137 | 0 | 0 |
| `classes3.dex` | 9,621,188 | 9,703 | 0 | 1,976 |
| `classes4.dex` | 8,227,912 | 7,609 | 0 | 631 |
| `classes5.dex` | 8,565,268 | 7,393 | 0 | 422 |
| `classes6.dex` | 8,499,332 | 10,434 | 0 | 929 |
| `classes7.dex` | 9,635,900 | 10,070 | 0 | 511 |
| `classes10.dex` | 7,434,716 | 8,555 | 0 | 1,625 |

- `Li/nu2;` (the settings/preferences class, 657 methods), `Li/ru;` (the banner model, 69 methods), `Li/x17;` (static helpers, 709 methods) and `Li/kk;` (the main-thread dispatcher) are in `classes4.dex`.
- `Lacr/browser/lightning/view/BannerManager;`, `Lacr/browser/lightning/view/BannerView;`, `Lacr/browser/lightning/view/BannerCallback;`, `Lacr/browser/lightning/view/DefaultBannerCallback;` and `Lacr/browser/lightning/view/BannerManager$1;` are in `classes.dex`. These names are unobfuscated, which is what makes them usable as fingerprint anchors.

## The home screen banner

- `Lacr/browser/lightning/view/BannerManager;` is a singleton (`INSTANCE`) with `mDisabled` and `mLoaded` (`AtomicBoolean`), `bannerInfoList` (`List`), `currentBannerInfo` (`Li/ru;`), `mTimer` (`Timer`) and `networkAdShowing` (`ConcurrentHashMap`). All field and method names in this class are unobfuscated.
- `BannerManager.load(Z)V` is `public synchronized`, 3 registers, 37 instructions, 2 try blocks. With its argument `true` it clears `mDisabled`, then fills `bannerInfoList` from `Lidm/internet.download/manager/d;->ۦۙۢ()Ljava/util/List;` and, when that list is empty, appends `Lidm/internet/download/manager/d;->ۦۜۡ()Li/ru;`, and finally sets `mLoaded` to `true`. It is the only writer of `bannerInfoList` other than `disable()`.
- `BannerManager.disable()V` is the app's own no-ads state: it sets `mDisabled` and `mLoaded` to `true`, clears `bannerInfoList`, nulls `currentBannerInfo`, and cancels `mTimer`.
- `BannerManager.resume()V` returns immediately when `mDisabled` is set, and also returns when `mLoaded` is false or `bannerInfoList` is empty. Otherwise it schedules `BannerManager$1` on a `Timer` with a 500 ms period. `MyAppCompatActivity.onResume()`/`onPause()` call `resume()`/`pause()`, so the timer restarts on every activity resume.
- `BrowserApp.lambda$initApp$2(Context)` is the only caller of `load()`: when `Li/x17;->ۦۤ۟(context)->Li/nu2;->ۦ۫ۗ()` is true it calls `disable()`, otherwise it calls `load(true)`. `BrowserApp.lambda$initApp$1()` calls `resume()`. A cross-DEX scan of all eight recovered files found no other caller of `load`, `disable`, `getCurrentAd` or `setAd`; the only other users of the class are `BannerView` itself, the `Li/bv;` click listener, and the two `Li/su;`/`Li/tu;` timer runnables.
- `BannerManager.postAd()` pushes the current ad to the main thread through `Li/tu;` → `BannerManager.ۦۖۨ` → `lambda$postAd$1`, which ends at `BannerView.onAdReceived(DefaultBannerCallback)` → `setAd`. `setNetworkAdShowingAndNotify(Activity, boolean)` publishes the same `DefaultBannerCallback` on the event bus, so a banner can also arrive from a caller in the missing DEX files.
- `BannerView` is a custom view (the app passes it as a `Landroid/view/View;` to its own `setVisibilityIfChanged`) that holds five children looked up by id: `icon` (`ImageView`, 2131362838), `title` (`TextView`, 2131364059), `action` (`Button`, 2131361850), `aps_banner` (`ViewGroup`, 2131362193) and `default_banner` (`View`, 2131362506). `onFinishInflate()` calls `setupAdView()`, which reads the current ad and calls `setAd(null, it)`.
- `BannerView.setAd(Ljava/lang/Integer;Li/ru;)V` is `private`, 8 registers (`this` in `v5`, the activity hash `Integer` in `v6`, the ad in `v7`), 210 instructions, 1 try block. Resolved control flow, with instruction indices:

| index | instruction | effect |
| --- | --- | --- |
| 0, 2, 4 | `iget-object` of `icon`, `title`, `action` | return if a child is missing |
| 10–13 | `Li/nu2;->ۥۡ()Z` | return immediately when the app's ads-disabled flag is set |
| 20, 23 | `BannerManager.isNetworkAdShowing(Activity)` | hide the banner when a network ad is on screen |
| 24–36 | activity hash comparison | hide unless this ad belongs to the current activity |
| 37 | `if-eqz v7` | return when there is no ad |
| 38–46 | `AmazonService.isInitialized()` and `getBannerBackfillAd("any")` | Amazon APS banner branch |
| 52–58 | `aps_banner` revealed, `default_banner` hidden | APS branch |
| 93–96 | `aps_banner` hidden, `default_banner` revealed | custom banner branch |
| 115, 124, 149, 199 | `setImageBitmap`, `title`, `action` populated from the ad | custom banner content |
| 202 | `View.setOnClickListener` | click target installed |
| 203 | `setVisibilityIfChanged(this, VISIBLE)` | the banner is revealed |
| 205 | `setVisibilityIfChanged(this, GONE)` | the app's own hide path |

- `GONE` is `8`, which `const/4` cannot encode, so the app itself loads it with `const/16 v2, 8` (index 22). A patch that writes the constant must use `const/16` too.

## Disable home screen ads (1DM 18.2)

- Compatibility: `idm.internet.download.manager`, version `18.2`, `ApkFileType.APKM` (non-required, so the plain APK is accepted too).
- `BannerManager.load(Z)V` is redirected to `BannerManager.disable()V`, which is the exact state 1DM enters when its ad configuration reports the banner as disabled. Consequences: `bannerInfoList` is never populated, `currentBannerInfo` stays null, and `resume()` returns at its `mDisabled` check, so the 500 ms rotation timer never starts and nothing is ever published to the banner view. Nothing else in the ad path is changed.
- The inserted call runs before the method's own `monitor-enter`, so `disable()` is not executed under the method's monitor. That is safe because after the patch every entry into the list and the current ad goes through `disable()`, and the two fields it writes with `AtomicBoolean.set` are the ones `resume()` reads. `disable()` has its own try/catch around the `Timer` access.
- `BannerView.setAd(Ljava/lang/Integer;Li/ru;)V` is replaced with `const/16 v0, 0x8`, `invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V`, `return-void`. This is the app's own hide path (the branch at index 205), applied unconditionally, so a banner that arrives from any other publisher of `DefaultBannerCallback` is also hidden. `v0` is a scratch local in this method and is only read after the early return, and `v5` is read from the original `iget-object` rather than hardcoded.
- Fingerprints, both resolved against the recovered `classes.dex` with a re-implementation of Morphe's matcher:
  - `BannerManagerLoadFingerprint` → `load(Z)V`, 37 instructions, `public synchronized`, filter indices `[0, 3, 4, 8, 10, 12, 14, 15, 16, 20, 29]`. The chain is `monitor-enter` (first instruction) → `mDisabled` read → `AtomicBoolean.set` → `mLoaded` read → `mTimer` read → `Timer.cancel` → `currentBannerInfo` write → `bannerInfoList` read → `List.clear` → `List.addAll` → `List.add`. The obfuscated `Li/ru;` type of `currentBannerInfo` is deliberately not declared, because it changes between releases.
  - `BannerViewSetAdFingerprint` → `setAd(Ljava/lang/Integer;Li/ru;)V`, 210 instructions, `private`, filter indices `[0, 2, 4, 6, 20, 45, 46, 52, 202]`. The chain is the three child-view reads → `View.getContext` → `BannerManager.isNetworkAdShowing` → the `any` slot string → `AmazonService.getBannerBackfillAd` → `aps_banner` read → `View.setOnClickListener`. `any` is the only `const-string` in the method, and both the string and the `AmazonService` call sit in the Amazon branch, which no other method in this class has.
  - Both fingerprints declare the defining class with a trailing `;`, which Morphe's type comparison resolves to an exact class match, so each is pinned to a single method by construction.
- The `Li/ru;` parameter in `setAd`'s signature and the `Lidm/internet/download/manager/amazon/AmazonService;` call are release-specific, as documented for every obfuscated name in this file. Both are acceptable only because the compatibility declaration is pinned to 18.2/30249.
- The patch does not touch `setNetworkAdShowingAndNotify`, `AmazonService`, the `Lidm/` ad configuration, billing, or the download service.
- The inserted smali was assembled against the same smali build Morphe uses, so both blocks are known to parse. See the pitfalls section below for the method and for the brace requirement that 0.3.0 violated.

## 1DM launch crash: `setAd` invoke arity (v0.3.4)

The 1DM build died inflating the home screen layout:

```
VerifyError: void acr.browser.lightning.view.BannerView.setAd(Integer, i.ru)
failed to verify: [0x2] Rejecting invocation, expected 1 argument registers,
method signature has 2 or more
    at android.view.LayoutInflater.rInflateChildren
    at idm.internet.download.manager.MainActivity.onCreate
```

The inserted call was

```
const/16 v0, 0x8
invoke-virtual {v5}, Landroid/view/View;->setVisibility(I)V
return-void
```

`setVisibility(I)V` declares one argument, so its 35c register list has to name the
receiver **and** the visibility int. Only the receiver was named, so the list had one
register where the signature demands two. This is an arity error, not a narrower
encoding of the same call, and the verifier rejects the whole class rather than the
instruction.

The two earlier 1DM fixes were about smali *syntax* -- the braces a 35c register list
requires, and the `v` prefix on interpolated register numbers. Both are satisfied by
`{v5}`, so the call assembled, the patch project compiled, and CI published a bundle.
Nothing in the build path checks arity, so this could only be caught on a device.

The call is now `{v5, v0}`. `BannerManager.load()`'s inserted `disable()V` takes no
arguments, so its single-register list is correct and is unchanged.

The general lesson, and the one worth keeping: smali validity and call validity are
different checks. Braces, prefixes and widths are all verified by assembling. The number
of registers in an invoke list is only verified by the verifier at class-load time, which
means an arity mistake ships as a green build and a launch crash. Any inserted invoke
should have its register count read off the target method's descriptor and asserted
before release.

## The "install 1DM+" strip is not an ad (18.2)

After the arity fix the patched build launched, but the home screen showed a tappable
"Install 1DM+ for an Ad free experience" prompt in exactly the strip where the banner
used to be. It survives the whole "Disable home screen ads" patch, and the reason is that
it is not an ad at all:

| | patched by this project | what was on screen |
| --- | --- | --- |
| class | `Lacr/browser/lightning/view/BannerView;` | `Lidm/internet/download/manager/BannerView;` |
| dex | `classes.dex` | `classes9.dex` |
| content | ad SDK mediation | literal `1DM+: Fastest download manager ($1.99)` and an `INSTALL` button |
| started by | `BannerManager.load()` / `setAd()` | `onFinishInflate()`, unconditionally |

The text and button are string literals in `res/layout/banner_view.xml`, inflated by the
app's own view. Nothing in that path reads the ad configuration, so redirecting `load()`
to `disable()` and hiding the container from `setAd()` both leave it untouched. The
click-through is a 250 ms `Timer` started by `ۦۖۤ()`, not the ad rotation timer.

`BannerViewUpsellFingerprint` now targets `Lidm/internet/download/manager/BannerView;->ۦۖۤ()V`
(59 instructions, `.registers 8`, `this` in `v7`) and prepends
`const/16 v0, 0x8` plus `invoke-virtual {v7, v0}, Landroid/view/View;->setVisibility(I)V`.
Its filter chain resolves at indices 0, 41, 43, 45 and 56: the `ۦۖۚ` guard read,
`Html.fromHtml`, `TextView.setText`, the `ۦۖۚ` write, and `Timer.schedule`. The chain
deliberately avoids the obfuscated members `ۦۖ۠`/`ۦۖۡ`/`ۦۖۦ`/`ۦۖۧ` and the view ids, all of
which are release-specific, and leans on the upsell copy and the timer instead.

GONE rather than an early return: `banner_view.xml` gives the view a fixed
`layout_height` of 55dp, so returning early would swap a populated strip for an empty
one. GONE is also what the view already treats as "stop" -- `BannerView$a.run()` reads
`getVisibility()` and calls `Timer.cancel()` when it equals 8 -- so hiding it also disarms
the click-through timer instead of leaving it running against a hidden view.

This is a deliberate departure from the ADM precedent, where the house "remove ads"
placeholder was intentionally left alone as "a house promo, not an ad SDK view". It is
recorded here as a scope decision, not an oversight.

## 1DM upsell fingerprint failed to match (v0.4.0)

v0.4.0 applied no patches at all, failing on
`BannerViewUpsellFingerprint` with "Failed to match the fingerprint". The target method
was correct -- the obfuscated name and field name were verified codepoint by codepoint
against the DEX, and the five filters did land on instructions 0, 41, 43, 45 and 56 --
but one filter declared the wrong signature:

```
actual:  Ljava/util/Timer;->schedule(Ljava/util/TimerTask; J J)V
filter:  returnType = "Ljava/util/Timer;"
```

`Timer.schedule` returns `void`, not the `Timer`. `MethodCallFilter` compares the
declared `returnType` against the reference's return descriptor, so that filter could
never match, the ordered chain never completed, and the whole fingerprint failed. This is
a plain transcription error: the return type belongs to the *called* method, and copying
the defining class into it is an easy slip.

Every other `methodCall` in the repository was re-checked against the DEX or against the
platform signature it targets, and the rest are correct. The two app-owned ones are
`Lacr/browser/lightning/view/BannerManager;->isNetworkAdShowing(Activity)Z` and
`Lidm/internet/download/manager/amazon/AmazonService;->getBannerBackfillAd(String)
DTBAdResponse;` -- note that the latter has a second `(String, Z)` overload in the same
class, so the filter's explicit single-parameter list is what selects the right one.
The rest are JDK or Android methods whose signatures are fixed by the platform.

## Static checks for the defects that only a device could catch

Five consecutive releases shipped a defect that compiling cannot catch, because each was
correct Kotlin producing wrong smali. `tools/checks/` now covers the two classes that are
mechanically checkable from the sources alone, and `tools/checks/README.md` records what
is still not covered.

- `check_invoke_arity` derives the required register count from the target method's own
  descriptor. It catches the v0.3.3/v0.3.4 `setVisibility` bug, where the inserted 35c
  invoke named only the receiver for a one-argument method.
- `check_replace_instructions` flags a `nop` block longer than the single invoke it is
  meant to erase, since the helper also removes what follows. It catches the
  `DisableAdsPatch` and `DisableRatingPromptsPatch` sites that shipped as v0.2.1 and
  v0.3.3.

`tools/checks/replay_history_check.py` replays released tags to show the checks fire on
the real defects and stay quiet on the fixes: v0.2.1 and v0.3.3 report 3 and 4 problems,
v0.3.4 reports 1, and v0.4.0 and v0.4.1 report 0.

`check_imports` was added after a `methodCall` import was removed on the assumption it had
become unused, which broke `:patches:compileKotlin` in CI. Counting occurrences over the
whole file is not sufficient -- the name also appears in the import line and in prose -- so
usage is measured against the body alone, over the Morphe API surface only, since Kotlin
stdlib members resolve without an import.

Two gaps remain, and both are stated in the checks' README rather than papered over.

- **Fingerprint resolution** needs the pinned APK, a user-supplied 80 MB file CI cannot
  fetch. v0.4.0 declared `returnType = "Ljava/util/Timer;"` for `Timer.schedule`, which
  returns void, and the fingerprint matched nothing. Only a reference DEX catches this.
- **Verifier-visible register typing.** A patch can have correct arity and still leave a
  register holding a reference where an integer is required, which is what the original
  three `VerifyError`s turned on. Only a real verifier catches it.

## The 1DM+ banner is an ad object, not a view (v0.4.0 – v0.4.1 were ineffective)

v0.4.0 and v0.4.1 did apply cleanly and the prompt still appeared. Both patched the
wrong thing, and the reason is that 1DM has **four** app-owned banner classes:

| class | dex | role |
| --- | --- | --- |
| `Lacr/browser/lightning/view/BannerView;` | `classes.dex` | ad SDK banner, hidden by `setAd` |
| `Lidm/internet/download/manager/BannerView;` | `classes9.dex` | a literal upsell strip in `banner_view.xml`, hidden by v0.4.0 |
| `Lidm/internet/download/manager/manager/NewBannerView;` | `classes9.dex` | **the class actually on the home screen** |
| `Lidm/internet/download/manager/AppodealBannerView;` | `classes9.dex` | Appodeal container |

v0.4.0 hid the second of those, which is a real view with real layout, but it is not the
one being drawn.

The prompt is a banner **ad**, built by a static factory:

```
Lidm/internet/download/manager/d;->ۦۜۡ()Li/ru;      // .registers 3, static, 35 instructions
```

It constructs the `Li/ru;` ad object from literals: a base64 PNG icon, the copy
`Install <b>1DM+</b> for an Ad free experience and support developement of the app`, the
label `Install`, the Play Store package `idm.internet.download.manager.plus`, a
`utm_source=1DM&utm_medium=App&utm_campaign=DefaultBanner` campaign tag, the accent
colour `#43A047`, and a `const/16 v1, 30000` 30-second click-through. That is why it is
tappable and opens the Play Store listing — those are the ad object's own fields.

`manager/NewBannerView.ۦۖۦ(Li/ru;)V` (122 instructions) is what paints it, reading the
same `Li/ru;` accessors (`ۦۖۥ` for the icon and sizes, `ۦۖۘ` for the text, `ۦۖۢ` for the
click url).

The factory has four callers, and redirecting `BannerManager.load()` to `disable()`
covers only one:

- `BannerManager.load(Z)V` and `BannerManager.getNewBannerInfo(AtomicBoolean)Li/ru;` —
  the ad rotation
- `Li/s82;->ۦۖۢ(MyAppCompatActivity, Li/m15;)V` and `Li/s82;->ۦۖۦ(MyAppCompatActivity;)Z`
  — reach `manager/NewBannerView` directly

All four null-check the result and skip the banner when it is null, so the fix is to make
the factory return null rather than to hide any view. `IdmPlusBannerFingerprint` prepends
`const/4 v0, 0` and `return-object v0`; `return-void` would be illegal on a
reference-returning method. The chain resolves at indices 0, 11, 14, 17, 20 and 23, and
its filters are the factory's own literals, none of the obfuscated member names.

Note the order matters: the `30000` click-through is written at index 17, *before* the
Play Store id at 20, and filters match in increasing instruction order, so listing the
literal last would leave it permanently unreachable. That was caught by replaying the
chain against the DEX rather than by reading it.

## Unverified risks for 1DM 18.2

- **Layout, 1DM.** Resolved once a sound copy of the APKM turned up: `res/layout/banner_view.xml` is readable, and `Lidm/internet/download/manager/BannerView` has a fixed `layout_height` of 55dp. That is why the upsell strip is hidden rather than merely emptied. `Lacr/browser/lightning/view/BannerView` is a different class in a different dex, and its own layout is `res/layout/banner_view.xml`'s sibling set (`default_banner.xml`, `default_banner_new.xml`).
- **Layout, ADM.** Still unconfirmed. The ADM reference DEX was read from a sound APKM, but its `res/` was never walked for the AppBrain container, so whether that strip leaves an empty gap behind is untested.
- **Other ad surfaces are out of scope and unexamined.** The interstitial, rewarded, and "network ad" show paths are driven from `Lidm/internet/download/manager/` classes that live in `classes8.dex`/`classes9.dex`, which were not recovered. `BannerManager.setNetworkAdShowingAndNotify(Activity, boolean)` is the visible trace of that path; callers of it could not be read. This patch claims the banner only.
- **No compile.** `app.morphe.patches` 1.3.4 cannot be resolved locally: `maven.pkg.github.com` returns `401` for the configured `gh` token, whose scopes are `gist`, `read:org`, `repo` and do not include `read:packages`. Compilation and bundle application are delegated to CI, as with the ADM patches.
- **No device test.** Nothing has been applied to 18.2. The fingerprints resolve and the inserted smali is width-correct and register-safe by inspection, but the runtime effect is unconfirmed.
- **A complete `base.apk` is needed** before adding any further 1DM patch that touches the app's own classes.

## Patcher pitfalls (1DM 18.2)

- **`addInstructions` smali must be parsed, and 35c invokes need braces.** `addInstructions` routes the string through `InlineSmaliCompiler`, which wraps it in a dummy `.method` built from the matched method's own parameters, register count, and static flag, and then parses it with smali's ANTLR grammar. The 0.3.0 bundle shipped `invoke-virtual v1, L...;->disable()V` and died on-device with `Encountered 2 parser syntax errors and 0 lexer syntax errors!`. The grammar rule is `instruction_format35c_method : INSTRUCTION_FORMAT35c_METHOD OPEN_BRACE register_list CLOSE_BRACE COMMA method_reference` (`smaliParser.g`, line 1088), so the register list is mandatory and must be braced: `invoke-virtual {v1}, ...`. Only 35c/3rc/45cc invoke forms take braces; 22c forms such as `iput v5, v0, L...;->a:I` take a bare register pair, which is why the ADM patches parse.
- **A register list holds register names, not numbers, and the `v` prefix does not come from the interpolation.** `getRegisterA()` and `getRegisterB()` return integers, so writing `invoke-virtual {$receiver}` renders `invoke-virtual {1}` and 0.3.1 died on-device with `Encountered 1 parser syntax errors` (`no viable alternative at input '1'`). The rendered text has to be `{v$receiver}`. The two failures are distinguishable by the reported count: two errors is a missing brace, one error is a bare number inside braces.
- **Verify the rendered string, not the literal.** Both of the failures above were missed by reading the source and by pasting a hand-written copy of the smali into a local test, because the defect only exists in what the string template produces. `.scratch/check_smali.py` closes that gap: it pulls each `addInstructions(...)` argument out of the patch source, applies the Kotlin templates the way the compiler would, and assembles the result through the same method template `InlineSmaliCompiler` uses. Run it after editing any smali string here; it is offline, takes a few seconds, and it is the only check in this repository that has not needed a release to catch a mistake.
- **The dummy method means the register numbers are the real ones.** Because the template uses the matched method's `.registers` and parameter list, `p0` resolves to the receiver: in `load(Z)V` (`.registers 3`, one declared parameter) `p0` and `v1` are the same register, and in `setAd` (`.registers 8`, two declared parameters) `p0` and `v5` are the same. Verified by assembling both forms, so the explicit `v`-register form used by the patch is equivalent and does not depend on the template's parameter list being passed correctly.
- **How to verify smali offline without the Morphe plugin.** The forks' smali is published on JitPack at `com.github.MorpheApp.smali:<module>/<commit>/<module>-<commit>.jar` (not the flat Maven path, which 404s), and Morphe tracks `com.github.MorpheApp.smali:smali` at commit `d856bad65f`. With `smali`, `smali-dexlib2`, `smali-util`, `antlr-runtime:3.5.2`, `stringtemplate:3.2.1`, `guava:31.1-android`, and `jsr305:1.3.9` on the classpath, a ~60-line Java program that copies `METHOD_TEMPLATE` from `InlineSmaliCompiler.kt` reproduces the exact parse, the exact error count, and the assembled instruction registers. That is how the brace fix was proven without a Gradle build, and it should be the first step for any new smali here. The same tool reproduces the numbers in the table above.




# Djezzy 3.0.9 reference notes

## Source and target record

- Reference: `~/storage/0/Documents/VInstall/Backups/com.djezzy.internet_3.0.9.apkv`
- The reference is a VInstall APKV container, not a plain APK. Its `manifest.json` reports
  `"format": "apkv"`, `"isSplit": true`, and lists six members.
- SHA-256 of the APKV as stored: not computed for the container; the members are recorded below.
- `base.apk` SHA-256: `f36dab7f20448f05287b5d480178a1a87f6b82a0dcef3557412470707e3ce9ee`, 12,500,283 bytes.
- `split_config.arm64_v8a.apk` SHA-256: `0e29e143baa7157831ec884b9d8d4f51aed249e599e23918fe1620a0556d4201`, 26,100,466 bytes.
- Package: `com.djezzy.internet`. Version name `3.0.9`. Version code `40076`.
- Minimum SDK `24`, target SDK `36`.
- Label "Djezzy". Declares `ACTIVITY_RECOGNITION` plus the camera, contacts, phone-state and
  biometric permissions, which is consistent with a loyalty feature that counts steps.
- The reference is user-supplied and has not been independently verified as the original
  publisher build.

## Where the app's own code lives

This is a Flutter application. The application logic is Dart, AOT-compiled into
`lib/arm64-v8a/libapp.so` (14,681,008 bytes) inside the `arm64_v8a` split; the
`assets/flutter_assets/` tree in `base.apk` holds only fonts, SVG/PNG art and a few
JSON blobs, no Dart source. Nothing in the Dart layer can be read as source text and
nothing in it is reachable by a Dalvik-level patch.

The step number is nonetheless produced by ordinary Java/Kotlin in `classes.dex`, because
Flutter's `pedometer` package is a platform plugin. That is what makes the feature
patchable at all, and it means the patch is architecture-independent: it edits
`base.apk`, which is shared by all four ABI splits, so no `libapp.so` work is needed
and one patch covers every ABI.

`classes.dex` holds 11,863 classes; `classes2.dex` and `classes3.dex` hold 134 and 217
and contain no app classes. Only one app class exists in the whole set:
`Lcom/djezzy/internet/MainActivity;`.

## Walk & Win: the step data flow

The feature is a loyalty "walk and win" campaign. Dart-side evidence, all read out of
`libapp.so` as canonical strings:

- `package:djezzy_app_implementation/features/walk_and_win/` holds the whole feature:
  `presentation/bloc/walk_and_win_bloc.dart` with `WalkAndWinBloc`, `WalkAndWinState`,
  `WalkAndWinLoaded`, `WalkAndWinError`; `data/services/pedometer_service.dart` with
  `PedometerService`; `data/datasources/walk_and_win_remote_datasource.dart`;
  `data/models/waw_campaign_model.dart` with `WawCampaignDataModel.fromJson` and
  `WawLevelModel.fromJson`; and the widgets `walk_step_counter_card.dart`,
  `walk_progress_bar.dart`, `walk_and_win_modal.dart`, `walk_dual_action_buttons.dart`.
- `package:pedometer/pedometer.dart` supplies `Pedometer.stepCountStream`. The sibling
  `stepDetectionStream` is **absent** from the binary, so only the count channel is consumed.
- Persisted keys, all `SharedPreferences` strings: `walk_and_win_current_steps`,
  `walk_and_win_last_pedometer_value`, `walk_and_win_is_walking`,
  `walk_and_win_accumulated_minutes`, `walk_and_win_session_start_time`.
- Network: `GET /services/walk/campaign/` loads the campaign, and
  `POST /services/walk/activate-reward/` claims the reward. User-visible strings include
  `Walk & Win`, `Start Walk`, `Steps`, `Insufficient Steps`,
  `You need more steps to convert to a reward.`, `Claiming reward...`,
  `Reward claimed successfully`, and `Steps taken: `.

The producer is the `pedometer` plugin, registered as
`com.example.pedometer.PedometerPlugin` and obfuscated to three classes. The registrant
string in `Lio/flutter/plugins/GeneratedPluginRegistrant;->registerWith` reads
`Error registering plugin pedometer, com.example.pedometer.PedometerPlugin`, and
`new-instance Li5/a;` is the class constructed beside it. That is a known pub package
whose published source matches the disassembly below instruction for instruction.

- `Li5/a;` is the `FlutterPlugin`. `onAttachedToEngine` builds two `EventChannel`s and
  names them in the DEX: `step_detection` and `step_count`. It constructs `Li5/c;` twice,
  with sensor type `18` and sensor type `19`.
- `Li5/c;` is the `EventChannel$StreamHandler`. Its constructor reads the sensor type and
  stores the name `"StepCount"` for 19 and `"StepDetection"` for 18 in field `l`, then
  calls `SensorManager.getDefaultSensor(type)` and keeps the result in field `k`. Its
  `onListen` registers the listener and returns; **it never pushes an initial value**.
- `Li5/b;` is the `SensorEventListener`, holding the sink in field `a`.
  `onSensorChanged` is the single point where a step number enters the app.

`Li5/b;->onSensorChanged(Landroid/hardware/SensorEvent;)V` disassembles to eleven
instructions with `.registers 3` and one declared parameter:

```smali
const-string          v0, "event"
invoke-static         {v2, v0}, Lkotlin/jvm/internal/i;->e(Ljava/lang/Object;Ljava/lang/String;)V
iget-object           v2, v2, Landroid/hardware/SensorEvent;->values:[F
const/4               v0, 0
aget                  v2, v2, v0
float-to-int          v2, v2
invoke-static         {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
move-result-object    v2
iget-object           v0, v1, Li5/b;->a:Lio/flutter/plugin/common/EventChannel$EventSink;
invoke-interface      {v0, v2}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V
return-void
```

Instruction `5` is the conversion that is replaced. The parameters occupy the highest
registers (`v1` is the event, `v0` is `this` after the frame is accounted for), which is
the standard Dalvik layout; `addInstructions` builds its dummy method from this method's
own register count, so the register numbers written in the patch are these numbers.

A second `SensorEventListener` exists and is **not** a valid match target: `Lf7/b;` is
`dev.fluttercommunity.plus.sensors.SensorsPlugin` (accelerometer, gyroscope,
magnetometer, barometer, user_accel). It copies the float values into a `double[]`,
appends a timestamp, and calls `success([D)` — it never calls `Integer.valueOf` and
never reads `SensorEvent.values` as the payload. The `methodCall` filter on
`Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;` therefore separates the two cleanly.

## Why two edits are required

Sensor type `19` is `Sensor.TYPE_STEP_COUNTER`. Two properties of that sensor drive the
design, and both are Android platform behaviour rather than anything read from the app:

1. **It is cumulative since boot, not per-step.** A single sample is "total steps since
   the device was last booted", which is why the Dart layer persists
   `walk_and_win_last_pedometer_value` and subtracts a baseline.
2. **It only fires when a step is actually detected.** Standing still produces no events
   at all.

Consequence 2 is the one that breaks the obvious patch. Overriding the value in
`onSensorChanged` alone would still emit nothing while the user is stationary, because
the method is never called. The patch therefore also pushes a value from
`Li5/c;->onListen`, immediately after the listener is registered, so the stream carries a
number as soon as Dart subscribes.

## Patch — Force Walk & Win steps to 10000

- `onSensorChanged`: instruction `5` (`float-to-int v2, v2`) is replaced with
  `const/16 v2, 0x2710`. `0x2710` is 10000 and fits a signed `const/16`. The
  `values[0]` read above it still executes and is discarded. The boxing and the
  `success` call below are untouched and already accept an int, so nothing downstream
  changes shape.
- `onListen`: twelve instructions are inserted at index 22, immediately after the store
  into the plugin's listener field, pushing the same constant through `Integer.valueOf`
  and `success` and logging what it pushed.

  **The insert index is the whole difficulty in this method, and the natural choice is
  wrong.** The `EventSink` arrives in parameter register `v4` (`.registers 5`, three
  declared parameters, so `v2` is `this`, `v3` the `Object` argument and `v4` the sink).
  Three instructions after the listener store, index 22, the method loads the
  `SensorManager` into `v4`, and from there on `v4` is a `SensorManager`. An insert placed
  at the tail — before the closing `return-void`, which is where a tail insert naturally
  goes and where this patch was first written — would therefore hand a `SensorManager` to
  `EventSink.success`, and the verifier would reject the class when the app loads. The
  store into the listener field is the last instruction before `v4` is reused, so
  `instructionMatches[0].index + 1` is the only index in this method where the sink is
  provably still live. `v0` and `v1` are the two locals; both are reloaded or reassigned by
  the instructions that follow, so nothing the insert writes is read back.

  This was caught by decoding the raw Dalvik and tracking the sink register, not by reading
  the patch. It is recorded here because the same trap will apply to any future patch that
  inserts into a Flutter plugin's `onListen`.
- Both sites additionally `Log.i` under the tag `djezzy-waw`, so a device run shows the
  raw sensor value, the value substituted, and the value pushed on subscribe. The tag is
  filtered out of release builds only if the user removes the patch; it is intentionally
  left in, because without it a device test cannot distinguish "patch applied and the
  Dart layer clamped the number" from "patch applied and the number is wrong".

## The v0.5.0 patch fires but the counter reads 0 (device evidence)

A device run with the v0.5.0 patch produced exactly one relevant line:

```
I flutter : GET https://apim.djezzy.dz/mobile-api/api/v1/services/walk/campaign/213772737646
I djezzy-waw: walk: pushing 10000
```

The tag proves the patch applied and the `onListen` insert executed, so the forced value
reached the Dart `EventSink`. The counter still read 0. **The displayed number is therefore
not the value this patch forces**, and overriding the pedometer stream was the wrong layer.

What the binary shows about where the number comes from instead:

- The screen is `WalkAndWinModal`, and it fetches `GET /services/walk/campaign/{msisdn}`
  on the same view. The log shows that request immediately before the push, so both run.
- The campaign entity exposes `maxSteps` and `isUnlimited`, and `isUnlimited` is reached as
  `dyn:get:isUnlimited` — a **dynamic**, JSON-decoded field, so the campaign is a map
  decoded straight from that response rather than a fixed local constant.
- There is no `currentSteps` field anywhere in the binary, so the current count is not
  read from the campaign response either. The strings that look like candidates are
  `walk_and_win_current_steps` and `walk_and_win_last_pedometer_value`, both
  `SharedPreferences` keys, so the count is local.
- Nothing else in `classes.dex` can produce a step number. The only hook in the whole DEX
  is the pedometer plugin: the single matching string is the registrant's
  `Error registering plugin pedometer, com.example.pedometer.PedometerPlugin`, and the
  only classes with `SensorEventListener` are `Li5/b;` (the plugin) and `Lf7/b;`
  (`sensors_plus`). So there is no second entry point to override.

The unresolved part is how the local accumulator is gated. `walk_and_win_is_walking` is
persisted and `_toggleWalking` / `_onWalkingChanged` / `startWalking` / `pauseWalking` all
exist, so the counter plausibly only accumulates while a walk session is active — which
would explain 0 at the moment of subscribe, before Start Walk is pressed. The Dart is AOT
and its strings are shuffled in the snapshot, so adjacency gives nothing; this has to come
from the campaign response and one session's logs.

## Campaign response captured: the server never sees a step count

Device logcat, same run as the failing counter:

```
I flutter : ╔╣ Response ║ GET ║ Status: 200 OK  ║ Time: 612 ms
I flutter : ║  https://apim.djezzy.dz/mobile-api/api/v1/services/walk/campaign/213772737646
I flutter : ║ Body
I flutter : ║    { "message": "Waw campaign", "status": 200,
I flutter : ║      "data": { "wawLevels": [
I flutter : ║          {steps: 5000, reward: GIFTWALKWIN1GO, donation: null},
I flutter : ║          {steps: 10000, reward: GIFTWALKWIN2GO, donation: null}]}}
```

This settles two questions:

1. The campaign carries **no step count at all**. Only thresholds and reward codes. So the
   displayed number is not server-driven, and the reward threshold is 10000 steps ->
   `GIFTWALKWIN2GO`.
2. `donation: null` and no per-user field means nothing in this response can override a
   local count. Confirmed there is no `currentSteps` string anywhere in `libapp.so`.

Ordering in the same log is the useful part:

```
...677.658  I djezzy-waw: walk: pushing 10000      <- our onListen insert
...677.692  flutter  GET .../walk/campaign/...    <- campaign starts after our push
...678.305  flutter  Response .../walk/campaign/
...680.001  I djezzy-waw: walk: pushing 10000      <- a second onListen
```

Two pushes means `onListen` runs twice: the pedometer plugin has two channels
(`step_detection`, `step_count`) that are both instances of `Li5/c;`, so our single
fingerprint matches both. `stepDetectionStream` is absent from `libapp.so`, so the
detection channel is only subscribed because both share the class.

The campaign response lands **after** the first push, so the campaign load rebuilds the
modal's state over whatever the pedometer had already delivered.

### Why the constant cannot work

`walk_and_win_last_pedometer_value` only makes sense if the app stores the previous raw
sensor value and accumulates the difference, i.e. roughly

```
current += raw - last_raw
last_raw = raw
```

A **constant** 10000 therefore yields `+10000` on the first event and `0` on every event
after that. Our second push cannot move the counter, and the campaign load in between
rebuilds the state. A constant is the wrong shape for a delta accumulator; that is the
bug, and it is a bug in the patch rather than in the fingerprint.

There is no stateless smali edit that makes a delta accumulator jump on demand, because
the first emitted value has to sit ~10000 above an unknown persisted baseline. Two ways
out, both viable:

- **Force the stored value instead of the event stream.** Make the persisted
  `walk_and_win_current_steps` read back as 10000. Pure smali, and independent of the delta
  model and of the `is_walking` gate.
- **Keep emitting increasing values.** Needs a stateful emitter, i.e. a Morphe extension
  (`BytecodePatchBuilder.extendWith`), which means a new Gradle module.

The first is chosen: it is narrower, it needs no new module, and it is the value the UI
actually renders. The pedometer constant is kept so the forced baseline and the emitted
baseline stay equal and the delta stays at 0, pinning the counter at 10000.

### Which SharedPreferences backend is live

`shared_preferences_android` is registered as
`io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin`, and that plugin ships two
independent backends. Which one Dart calls is not readable from the AOT snapshot, so both
are patched, each logging under a distinct tag:

- `Lio/flutter/plugins/sharedpreferences/SharedPreferencesPlugin;->getInt` — suspend fun
  returning a boxed `Long`. Its `invokeSuspend` reads the key out of the `$key` field and
  goes to DataStore (`getSharedPreferencesDataStore` -> `Lu0/h;->getData`), so this
  backend never touches `android.content.SharedPreferences.getInt` and needs its own hook.
- `Lio/flutter/plugins/sharedpreferences/LegacySharedPreferencesPlugin;->getAllPrefs` —
  has no per-key getter at all. It copies every entry into a `HashMap` and hands the whole
  map to Dart, which picks the key itself, so the legacy hook injects into that map before
  the `return-object`.

Either log line appearing on a device run proves which path the app uses, so a wrong guess
is visible instead of silent.

### Ground truth for both hooks (androguard, not the hand decoder)

The scratch decoder written earlier mis-renders some opcodes, so the two new hook sites
were re-read with androguard, which is authoritative.

`LegacySharedPreferencesPlugin.getAllPrefs(String, Set) : Map` — 30 instructions,
`.registers 8`, `.ins 3`, so `v5`-`v7` are `this`/`prefix`/`allowlist` and `v0`-`v4` are
locals:

```
  0 iget-object       v0, v5, L...LegacySharedPreferencesPlugin;->preferences Landroid/content/SharedPreferences;
  1 invoke-interface  v0, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;
  3 new-instance      v1, Ljava/util/HashMap;
 15 invoke-virtual    v3, v6, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
 25 invoke-direct     v5, v3, v4, L...LegacySharedPreferencesPlugin;->transformPref(...)Ljava/lang/Object;
 27 invoke-virtual    v1, v3, v4, Ljava/util/HashMap;->put(Ljava/lang/Object;, Ljava/lang/Object;)Ljava/lang/Object;
 29 return-object     v1
```

`v1` is the map, all three loop exit branches land on the `return-object` at 29, and
`v0`-`v4` are dead by then, so inserting at 29 is a tail insert and the exits run through
it. The six fingerprint filters resolve to indices `0, 1, 15, 25, 27, 29`, and 29 is the
only `return-object`, which is what `opcode(RETURN_OBJECT)` anchors on.

`SharedPreferencesPlugin.getInt(String, Options) : Long` — 13 instructions,
`.registers 5`, `.ins 3`, no branches at all:

```
  0 const-string      v0, "key"
  1 invoke-static     v3, v0, Lkotlin/jvm/internal/i;->e(Ljava/lang/Object; Ljava/lang/String;)V
  2 const-string      v0, "options"
  3 invoke-static     v4, v0, Lkotlin/jvm/internal/i;->e(...)V
  6 new-instance      v0, L...SharedPreferencesPlugin$getInt$1;
  8 invoke-direct     v0, v3, v2, v4, v1, L...$getInt$1;-><init>(Ljava/lang/String; L...Plugin; Lkotlin/coroutines/Continuation; I)V
 12 return-object     v3
```

The two null-check calls name their argument registers outright, which settles the
allocation: `v2` is `this`, `v3` is the key, `v4` is the options object, `v0`/`v1` are
locals. The two `const-string`s are unique in the method and `"options"` is unique to this
overload, which is what the `string(...)` filters pin.

Injected on the async side, at index 0, so it runs before the null checks and can return
without ever starting the coroutine:

```
const-string v0, "walk_and_win_current_steps"
invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
move-result v0
if-eqz v0, :djezzy_waw_prefs_passthrough
const-string v0, "djezzy-waw"
const-string v1, "walk: prefs async injected"
invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String; Ljava/lang/String;)I
const-wide/16 v0, 0x2710
invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
move-result-object v0
return-object v0
:djezzy_waw_prefs_passthrough
```

`equals` has the local constant as its receiver so a null key cannot throw before the
branch. Because the host method has no branches of its own, an insert at index 0 shifts
nothing that anything jumps to.

A note on the legacy key. The legacy Dart API persists under a `flutter.` prefix and strips
it again on the way back out, so the name Dart looks up is the unprefixed one either way —
which is why injecting `walk_and_win_current_steps` rather than
`flutter.walk_and_win_current_steps` is the correct literal on that path.

### Verified offline

- `tools/checks/patch_smali_checks.py`: 14 files, 0 problems.
- `tools/checks/test_invoke_arity.py`: 19/19, including the new `const-wide/16` pair.
- `.scratch/check_walk_smali.py` assembles every rendered string against smali: 8
  instructions for the legacy insert, 11 for the async one, both PASS at both plausible
  register counts.

Not verified: that either hook is the path this build's Dart actually takes. That is what
the two distinct log lines are for.

## v0.5.1 failed to apply: naming a class in a fingerprint removes the fallback

A device attempt with v0.5.1 aborted:

```
app.morphe.patcher.patch.PatchException: Failed to match the fingerprint:
app.djezzy.patches.walk.LegacyPreferenceMapFingerprint@ffcc140
	at ...ForceWalkStepsPatchKt.forceWalkStepsPatch$lambda$0$0(ForceWalkStepsPatch.kt:130)
```

Both new fingerprints were checked against the real DEX before shipping, filter by
filter, with a Java harness built on the same `smali-dexlib2` Morphe uses:

```
 0 preferences iget-object : [0]
 1 SharedPreferences.getAll : [1]
 2 String.startsWith       : [15]
 3 transformPref           : [25]
 4 HashMap.put             : [27]
 5 return-object           : [29]
```

Every filter matched, at strictly increasing indices, which is the condition
`Fingerprint.matchFilters` requires. The candidate pre-filter was ruled out as well by
reproducing `PatchClasses.findIndexValues` and `getClassesReferencingType` over all 11863
classes:

```
Lio/flutter/.../LegacySharedPreferencesPlugin; -> 2 classes, contains target: true
Landroid/content/SharedPreferences;            -> 32 classes, contains target: true
Ljava/lang/String;                             -> 1441 classes, contains target: true
Ljava/util/HashMap;                            -> 398 classes, contains target: true
```

The smallest candidate set contains the target, so the indexed search would have found it.

The real reason is in `Fingerprint.matchOrNull`, `morphe-patcher/src/main/kotlin/app/morphe/patcher/Fingerprint.kt:291`:

```kotlin
val definingClassLocal = definingClass
if (definingClassLocal != null) {
    val type = patchContext.classDefByOrNull(definingClassLocal)   // classMap[classType]
    if (type != null) { ... }
    if (definingClassComparisonLocal != StringComparisonType.EQUALS) { /* scan classMap */ }
    return null                                                    // <-- unconditional
}
```

A fingerprint that declares `definingClass` is reduced to **one** `classMap` lookup. If that
one lookup fails, or the match against that one class fails, matching returns null with no
fallback — the indexed candidate search and the scan-everything fallback below it are both
unreachable, because the `return null` is unconditional and sits before them. Declaring
`definingClass` therefore costs the fallback and buys nothing that `name`, `returnType`,
`parameters` and the filters do not already give.

So both preference fingerprints drop `definingClass` and matching goes through
`instructionFilterCandidates()`, which is index-driven and works. The `HashMap.put` filter
went with it: the concrete map type is the least stable part of that method and a newer
plugin build can swap it for `LinkedHashMap` without affecting anything this patch needs.
The remaining four filters resolve to `1, 15, 25, 29`, so `instructionMatches[3]` is the
`return-object`.

`StringFilter` is deliberately reduced to the single `options` literal: it is the one
string unique to the two-parameter overload, and every extra literal narrows the string
index for no gain.

### Optional hooks may not fail the patch

A fingerprint miss throws out of `execute`, so an unhandled optional hook takes the whole
patch down with it — which is exactly how v0.5.1 turned an optional refinement into a
patch that would not apply at all. Both preference hooks are now wrapped in `runCatching`
and report to the patcher log instead. The pedometer hooks stay mandatory, since without
them there is no patch at all.

What is still unexplained: the filters match on the DEX in the `.apkv` backup, yet did not
match on the APK the manager patched. The class is present in that DEX and the pedometer
fingerprints in the same patch matched, so it is not a wholesale build mismatch. Until that
is pinned down the honest position is that the relaxed fingerprints are *more* likely to
match, not verified to.

## The real cause of the stuck 0: one value cannot open a window and cross it

The two preference hooks never fired on device, and chasing them was a dead end. Dropping
the SharedPreferences idea entirely and re-reading the v0.5.0 log against both possible
accumulations identifies the actual defect, and it is in the pedometer patch itself.

Two models fit every observation:

```
delta:    current += raw - last_raw
baseline: current  = raw - sessionStartRaw
```

v0.5.0 pushed a **single** `10000` at subscribe. Under the baseline model that lone value
*becomes* the baseline, so the total is `10000 - 10000 = 0`, and every subsequent event
carries the same constant and so contributes a delta of zero. The number can never leave
zero. Under the delta model the same constant pays out once and then contributes nothing.
Same defect either way: **one value cannot both establish the origin and jump away from
it.** This explains the `0` exactly, with no need to assume anything about
`walk_and_win_is_walking` gating the accumulator.

The fix is a pair — `0` first, then `10000` — and it is stateless:

| model | first event `0` | second event `10000` | total |
| --- | --- | --- | --- |
| baseline | baseline := 0 | `10000 - 0` | **10000** |
| delta, fresh | no-op or `+0` | `+10000` | **10000** |
| delta, stale baseline 20000 | rewinds `last_raw` to 0 | `+10000` | **10000** |

If the app discards non-positive readings outright, the stored baseline on a fresh install
is already `0`, so the second event still lands on 10000.

Keeping the `onSensorChanged` constant at 10000 then *locks* the value rather than letting
it drift: a constant `raw` yields a delta of zero under the delta model and a fixed
difference under the baseline model, so the displayed number cannot fall away while the
user stands still.

No timer and no extension are needed for this, which matters because `extendWith` is more
costly than it looks:

```kotlin
inline fun extendWith(extension: String) = apply {
    classLoader.getResourceAsStream(extension) ?: throw PatchException(...)
}
```

The argument is a **resource path to a precompiled DEX**, not a class name, and
`BytecodePatchContext.mergeExtension` merges *every* class in that DEX into the app. So an
extension needs d8 and the Android build-tools, which CI does not have (the workflow sets
up only Java and Node), plus a committed binary artifact. The two-event push avoids all of
that.

### What was wrong with the SharedPreferences attempt, for the record

It was not wrong in principle — forcing the persisted total would have worked — but it was
unreachable in practice, and the diagnosis went wrong twice on the way:

1. `LegacyPreferenceMapFingerprint` failed on device. Re-verifying the DEX filter by filter
   with a harness on the same `smali-dexlib2` Morphe uses showed all six filters matching at
   `0, 1, 15, 25, 27, 29`, and reproducing `findIndexValues` over all 11863 classes showed
   the candidate pre-filter does contain the target. The filters were never the problem.
2. The explanation offered next — that declaring `definingClass` removes the fallback search
   at `Fingerprint.kt:291` — is a true reading of the matcher, but it was **not shown to be
   the cause here**. It was asserted, then shipped as a fix, then disproved by the hooks
   staying silent in v0.5.2.

Two files on the device turned out to settle the APK question and kill the "different build"
theory:

```
Djezzy-v3.0.7-patches-v1.44.0-dev.11.apk  classes.dex  f1c5109239f2cf911c4cb01055cd8e4b93e6c70ccb810adb2fcf32486a875db0
com.djezzy.internet_3.0.9.apkv/base.apk   classes.dex  f1c5109239f2cf911c4cb01055cd8e4b93e6c70ccb810adb2fcf32486a875db0
```

Byte-identical, so the manager patched exactly the DEX that was analysed. Local
verification and the manager still disagreed on the same bytes, which means the model of how
the patcher resolves a fingerprint is wrong somewhere — recorded as unresolved rather than
guessed at again.

## Unresolved risks for Djezzy 3.0.9

- **The Dart delta is not confirmed.** `walk_and_win_last_pedometer_value` and
  `walk_and_win_current_steps` being persisted implies the Dart layer computes
  `current += (newValue - lastStored)`. If a baseline above 10000 is already stored, the
  first delta is negative. This is inferred from the key names, not read from compiled
  Dart. The logcat output is what settles it: if the app shows a number below 10000 while
  the log reports a push of 10000, that is the cause. The fix is to also reset the stored
  pair on subscribe, which is a two-instruction addition to the `onListen` insert.
- **The reward is server-gated.** `/services/walk/activate-reward/` decides the payout and
  the campaign's target comes from `/services/walk/campaign/`. This patch changes what the
  client displays and sends. If the backend recomputes the step count itself, it will
  still refuse the claim, and no client-side patch can change that. The request body has
  not been captured.
- **Whether the displayed number is client-side or server-driven is unknown.** The widget
  set includes both a local counter card and a progress bar, and `WawCampaignDataModel`
  may carry a server-supplied step count. A screenshot of the screen is needed to tell
  them apart.
- **`Li5/a/b/c;` are R8-obfuscated and will churn on the next release.** This matches the
  ADM patches, which also key on obfuscated names, but it means the fingerprint is pinned
  to 3.0.9. The framework-level parts (`onSensorChanged`, the descriptor, the
  `EventSink.success` and `Integer.valueOf` calls) carry most of the matching weight.
- **No compile.** `app.morphe.patches` 1.3.4 cannot be resolved from this device:
  `maven.pkg.github.com` needs a token with `read:packages` and the local Gradle cache is
  empty. Compilation is delegated to CI, as with the ADM and 1DM patches. What was checked
  offline instead: brace and paren balance on all three new sources, and every Morphe and
  dexlib2 symbol against `morphe-patcher` v1.13.0 source and the real
  `smali-dexlib2.jar` (`Opcode.IGET_OBJECT`, `FLOAT_TO_INT` and `IPUT_OBJECT` all exist,
  and `fieldAccess` takes `type:` and not `returnType:`).
- **The smali is verified by assembly, and the verifier is known to be honest about it.**
  `.scratch/check_walk_smali.py` renders both smali strings the way the Kotlin template
  would and assembles them through a Java program that mirrors `InlineSmaliCompiler` v1.13.0
  exactly: the same `METHOD_TEMPLATE`, the same parser/lexer error thresholds, the same tree
  walk into a `DexBuilder`. The JitPack smali fork at commit `d856bad65f` and the Maven
  dependencies listed in the 1DM notes are enough to run it with no Morphe artifacts. The
  check is only meaningful because it was negative-controlled: the two defects this
  repository has already shipped were fed back in and reproduced with the same error counts
  reported at the time (a missing 35c brace gives 2 parser errors, a bare register number
  inside braces gives 1). Both new strings assemble, at `.registers 3` and `.registers 5`.
- **No device test.** Nothing has been applied to 3.0.9. The fingerprints were replayed
  against the real DEX and resolve to the expected indices, and the register allocation was
  read out of the raw bytecode, but the runtime effect is unconfirmed.

## CI failure and the two checker bugs behind it (Djezzy 3.0.9)

The first push of this patch failed `Check patch sources` in 15 seconds, on two lines:

```
FAIL ForceWalkStepsPatch.kt: `invoke-static {v1}, Ljava/lang/String;->valueOf(I)...`
      names 1 register(s) but ...->valueOf declares 1 argument(s) and needs 2 (receiver + arguments)
```

One of those two lines was a real defect and one was the checker being wrong. Both had to
be established before anything could be committed, because the obvious response — add a
register to satisfy the checker — would have broken the build for real.

**The real defect.** `Ljava/lang/String;->concat` and `Landroid/util/Log;->i` were written
as `invoke-static` when both are instance methods: `concat` on a `String` and `i` on
`Log`. Smali assembles either form, because the opcode is not checked against the
descriptor, so this passed every local check and would have failed at class-load time on
a device, exactly as the v0.3.3 release did. Fixed to `invoke-virtual`, which is what the
app's own bytecode uses for `String.concat` at `onListen[6]` and `[9]`.

**The checker bug.** `check_invoke_arity` computed `required = 1 + len(params)` for every
invoke kind, counting a receiver on `invoke-static`, which has none. The patch's two
`invoke-static` calls to `Integer.valueOf(I)` and `String.valueOf(I)` were correct and
were reported as errors. Confirmed against the 3.0.9 DEX, where the app itself writes
`invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;` with a single
register at `onSensorChanged[6]`. Adding a register to "fix" the patch would have put a
stray register in a static call and been rejected immediately. The check now special-cases
`invoke-static` as arguments-only.

**A second checker bug, found by the first.** Splitting the parameter list on whitespace
reported one argument for `Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I`,
which is a single unspaced token. The file already contained a correct descriptor parser,
`parse_descriptor`, which walks the grammar; the arity check now uses it.

**A third, pre-existing bug, found by accident.** The wide-register arithmetic was
backwards in both directions and had never been exercised, because no patch so far
inserts a call taking a `long` or a `double`. AOSP's verifier is the authority:
`MethodVerifierImpl::SetTypesFromSignature` seeds `expected_args` from the instruction's
`ins_size` with the comment *"long/double count as two"*, and
`VerifyInvocationArgsFromIterator` advances
`sig_registers += reg_type.IsLongOrDoubleTypes() ? 2 : 1` and then rejects any invoke
whose encoded register count differs. So a wide argument *adds* a register: `z(J)V` needs
two and `z(JI)V` needs three. The check had `len(params) - wide`, which is right for no
signature a patch is likely to contain — it is now `len(params) + wide`.

The check is now covered by thirteen cases, five of them defects it must catch and eight
that must stay quiet, and `replay_history_check.py v0.3.4 v0.4.1` still reports the
shipped v0.3.4 arity defect as failing and v0.4.1 as clean, so the original purpose of the
check is intact.

## Second CI failure: `$EventSink` read as a Kotlin template (Djezzy 3.0.9)

With the arity check fixed, CI got 88 seconds further and then failed
`:patches:compileKotlin`:

```
e: ForceWalkStepsPatch.kt:94:88 Unresolved reference 'EventSink'.
e: WalkStepsFingerprints.kt:49:69 Unresolved reference 'EventSink'.
e: WalkStepsFingerprints.kt:83:87 Unresolved reference 'EventSink'.
```

`Lio/flutter/plugin/common/EventChannel$EventSink;` is a nested type, so the `$` is
part of the descriptor and has to be written `\$` in a Kotlin string literal. Written
plain, Kotlin resolves `$EventSink` as a template expression over a name the file does
not declare, and the file does not compile. This is a compile error rather than a smali
defect, so nothing else in the pipeline can see it: `check_invoke_arity` reads text that
is never assembled, and the smali assembler is never reached. All three sites are fixed.

The patch is also the first in this repository to put a `$` in a patch string at all, which
is why no earlier check covered it. `check_dollar_in_strings` now reports a `$name` inside
a string literal when the file declares nothing by that name, and stays quiet for a
deliberate template, an escaped `\$`, and a bare `$` that is not followed by an
identifier. Its cases, and the six arity cases added earlier, live in
`tools/checks/test_invoke_arity.py` (nineteen in total) so that a check cannot be "fixed"
by loosening it.

Reading the compiler output rather than assuming the first failure was the only one is what
surfaced this. The arity fix had passed the local suite and still did not build.

## Patcher pitfalls (Djezzy 3.0.9)

- **`fingerprint.method.getInstructions().size - 1` is not a safe tail anchor.** The count
  is right but the reasoning is not: in a method whose parameters are reused as locals, the
  last index is past the point where a parameter still holds its incoming type. Anchoring
  on a *named instruction match* and using `index + 1` is what makes the insert position
  survive a rebuild, because it ties the anchor to the plugin's own structure rather than
  to a count.
- **Decoding the DEX is not optional when a patch touches register allocation.** Androguard
  is sufficient for reading a method, but it does not surface which register a parameter
  *still* holds at a given index. The raw Dalvik does, and it is the only way to catch the
  `v4` sink/SensorManager reuse described above. The decoder used is
  `.scratch/dexdump.py`, which is throwaway but is the thing that found the bug.
