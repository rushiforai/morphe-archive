# Internals map and patch cookbook

Everything here was derived from **YouTube VR 1.88.10** (newer targets in
[FINGERPRINTS.md](FINGERPRINTS.md) name their own anchors). The class
and member names come from decompiling that build, and they are *not* stable: R8 reassigns them on
every release. What survives is the **anchor** (a string, a framework reference, a structural
shape), which is why every row below names both, and why [FINGERPRINTS.md](FINGERPRINTS.md) is the
authority on what is safe to match.

Read this when you want to add a patch: find the mechanism you care about, take its anchor from the
table, and verify with the recipe in the "Verifying a change" section.

## Verified hook points

| mechanism | where at 1.88.10 | anchor that finds it | used by |
|---|---|---|---|
| app startup | `YouTubeVrTikTokRoot_Application.onCreate` | manifest-declared class (stable) | Extension (probe, task label) |
| PlayerResponse → streaming data | `oqb.<init>(zjp)` | constructor storing the generated `StreamingDataOuterClass$StreamingData` into its own field | Extension (injects the spoofed formats) |
| SABR / onesie player decision | `PlatypusEnablingManager.a`/`.b` | readable library class; the two `Z`-returning methods | Extension (returns false → legacy player) |
| DataSpec build (last mutable point) | `axe.a()` | no-arg method reading the class's `Uri`/`byte[]`/`int` fields and calling the 11-arg DataSpec constructor | Extension (normalises to GET, no body) |
| media data source + UMP rewrite flag | `pqy.<init>`, field `c` | 5 params + class holds the `"ump"` literal + `instance-of → final iput-boolean` | Extension (clears the UMP envelope rewrite) |
| innertube URL builder | `oth.l()` | the `"youtubei/v1"` literal (unique to that class) | Extension (route log; where upstream-style route blocking would go) |
| every HTTP request | `CronetUrlRequestContext.newUrlRequestBuilder` | Chromium's own names (stable) | Extension (ad-host filter, request log) |
| ad UI skip countdown | `gtu.b(int)` (VR), `fna.b(int)` (2D panel) | `void(int)` calling `TextView.setText` + `setContentDescription`, pinned per class by a framework call | Extension (the "an ad is on screen" oracle) |
| AbrState POST conversion | `axu.b(axf)` | built through `axe` (see above); this is what produced the HTTP 400 | Extension (defeated by the DataSpec normalisation) |
| immutable DataSpec | `axf` | 11-arg constructor, framework/primitive types only | — (read-only target) |
| the app's PlayerResponse proto | `zjp`: `h` streaming data, `g` video details (`g.c` = video id), `n` ad slots, `m` ad marker | proto field indices, not names | Extension (clears `n`, the client-side ad slots — the pre-roll fix) |
| ad-break renderer | `muk.a(List)` | returns `List` **and** constructs `java.util.PriorityQueue` (the `oqi.F()` name it used to read is gone) | Hide ads |
| ad-break fetch | `tyj.s(...)` | string anchor `Exception when trying to request AdBreakResponseModel: %s` | Hide ads |
| PlayerBytes slot detector | `muf.a(oqi)` | `Z` + one reference parameter + the class's `AdCpn is null or empty for CISA scheduling` literal + an `Optional.isPresent()` call in the body | Hide ads |
| PlayerBytes layout bootstrap | `mkz.a(Object)` | the `Bootstrapped layout construction resulted in non PlayerBytesLayout. PlayerAds count: ` string | Hide ads |
| ad tracking/ping loader | `rgx.g(List)` → `tyj.r(Uri)` | parses a URI and hands it to `tyj.r` | — (candidate, see below) |
| stream-stitched ads (SSAI) | `ryi` / cuepoints | the info hook: the generated `ServerStitchedDaiInfo` return type + the class's `daistate` literal + a body that uses the proto; the `Uri`/`Z(J)` hooks match by class name on purpose | — (patch **removed 2026-10-13**: the ad is stitched into the SABR stream by the server, so the client side plumbing was all that could be touched and removing it changed nothing observable; anchors kept in FINGERPRINTS.md) |
| age-restriction dialogs | `sfp.f()` (adult), `sfp.k()` (controversial, backed by `sfu.c`) | the policy's own PlayabilityPolicy logger literal + the no-arg boxed-`Boolean` / `Z` shape (and "has a body", or the abstract sibling matches too) | Remove viewer discretion dialog |
| DRC audio | `PlaybackAgnosticUserPreferences.getIsDrcEnabled` | unobfuscated name | — (patch **removed 2026-10-13**: the hook installed correctly, but nothing reads it. No Java caller anywhere in the dexes, the getter's name is in **none** of the app's 40 `.so` files, and it is never called during a live playback with the log gate open -- while the object itself does cross to C++ (`setPlaybackAgnosticUserPreferences` is in `libgoogle3.so`), which is why "the object reaches native" is not evidence that anything reads it) |
| version spoofing | `ocn.b(Context)` (name), `ocn.a(Context)` (code) | the `pref_override_build_version_name` literal: the class that holds it, its `String(Context)` and its `I(Context)` | Spoof app version |
| QUIC | cronet builder chain in `ltq` | `Object(Object,Object)` holding `youtubei.googleapis.com`, with `const 1` → `enableQuic` → `move-result-object` (1 match; `phn`'s second engine is excluded because it passes `false`) | Disable QUIC protocol |
| osName / device class | `ocn.c(Context)` | `Z(Context)` whose body holds `android.hardware.type.automotive`, in the class holding the version-name preference key (the literal alone occurs in 9 classes) | — (patch removed 2026-10-12: measured to propagate but not to block ads, see FINGERPRINTS.md) |
| package name in the Cronet User-Agent | `agtm.a(Context, agsc, String)` | `String` return + the `" (Linux; U; Android "` literal + the `getPackageName()` call the patch rewrites | Spoof package name in User-Agent |
| player wrapper seek | `pwe.o(J, ablw)` → backend `qhg.F(J, ablw)` | the `MedialibPlayer.seekTo(positionMillis=%d)` literal | SponsorBlock (mined for the seek `MethodReference`; returns void — skips confirm via `onSeeked`) |
| player wrapper loadVideo | `pwe.j(pzj)` | the full `MedialibPlayer.loadVideo(cpn=%s …)` literal (1 match; `holdsStringLiteral` is exact equality, so a prefix matches nothing) | SponsorBlock (captures the `pwe` instance, resets state, starts the fetch) |
| seek finished | `pwd.u(J, ablw)` (`onSeeked`) | the `onSeeked(positionMillis=%d)` literal | SponsorBlock (the async "the skip worked" signal) |
| ad UI countdown (2nd consumer) | `gtu.b(int)`, `fna.b(int)` | the same fingerprints as the Extension's oracle row above, second injection | SponsorBlock (its own ad gate — works even with the Extension's stream spoof off) |
| playback position / duration | `pwe.a` is the backend interface; `e()` = position ms, `g()` = duration ms. The mapping is proven by the `qkl.a(...)` argument order in the TimeInfo snapshot `pwe.A()` (`qkl`'s `toString` names the fields `currentPositionMillis`/`durationMillis`) | snapshot: wrapper literal + the exact `(J,J,J,J,I,J,J,String)→ref` static prototype (2 app-wide, class literal separates) | SponsorBlock (bridge generation — the app's own UI poller calls `pwe.A()` every 100 ms on the main thread, so tick-time access from the main looper is the app's own pattern) |
| seek-source enum | `ablw.<clinit>`; the constant's static field directly follows the `SEEK_SOURCE_UNKNOWN` const-string | the constant name (1 class app-wide; enum *field* names are obfuscated, only the constant names are dex strings) | SponsorBlock (the seek bridge loads it, so a programmatic skip carries an "unknown/no UI element" source) |
| which video is loading | `zjp.g` = video details, video id read reflectively by shape (the 11-char `[A-Za-z0-9_-]` String inside the details proto); ad responses excluded via the non-empty `zjp.m` list | the `oqb.<init>(zjp)` constructor the Extension already hooks | SponsorBlock (names the video to fetch segments for — no new class in the patched set) |
| seek-bar binder (VR player controls) | `gtw.<init>(View, …)`: binds `R.id.seekbar` (0x7f0b0a23), `seekbar_buffered` (a25), `seekbar_container` (a26), `seekbar_position` (a29), `seekbar_thumb` (a2a) | those five inlined ints, referenced together by no other method (`findint`; `R.id.seekbar` on its own also appears in `SeekBarPreference.a`) | SponsorBlock seek-bar markers (attaches the marker layer over the played bar; the two ids it needs are baked in at app start) |
| seek-bar timeline update | `gtw.e(J,J,J,J)V` = `(positionMs, windowStartMs, durationMs, bufferedMs)`; the body sets `seekbar_position.width = (position-windowStart)/(duration-windowStart) × (parentWidth − track margins)`, the buffered bar's width, and the two time labels | same class + the `(J J J J)V` shape + a `setLayoutParams` call (the class's synthetic `k(JJJJ)V` bridge only forwards and is deliberately not hooked) | SponsorBlock seek-bar markers (mirrors exactly that geometry to place the category bars) |
| the settings column | `R.id.settings_fragment_holder` (0x7f0b0a51) inside the settings card — the FrameLayout the app's settings content is added to; its siblings are `sign_in_fragment_holder` (0x7f0b0aa8) and `environment_settings_fragment_holder` (0x7f0b03af) | the ids' names (looked up in `R.java`); the layout references them, no code does | **no longer used**: the "Patch settings" rows are preferences in the app's own `res/xml/settings_prefs.xml` now (Addendum 14), and the holder was only ever a way to place a view over that list |
| where the settings rows come from | `res/xml/settings_prefs.xml` (immersive) / `panel2_settings_prefs.xml` (panel mode), inflated by the fragment `fzf` instantiates into `R.id.settings_fragment` (`fyr` for environments, `fzb` for the main screen) | the files themselves; androidx inflates them by element name | Patch settings: one "Patch settings" row is inserted at the top of those lists and opens the hub. The hub and the SponsorBlock screen replace the contents of two dead preference XMLs; the switches are not appended onto the main lists |
| the player-controls layout | `R.layout.watch_layer_panel`, inflated by the controls fragment (`ftp.fQ`) and hosted in `R.id.player_controls_holder`; the settings panel (`fyi`, entity `SETTINGS_PANEL`) inflates `R.layout.accounts_and_settings_fragment` instead. **The controls view is built at launch**; the earlier "built lazily" note was a symptom of our own bad injection (a wide-argument `invoke` without `/range` made ART reject `gtw`, so the watch UI never built) | layout ids / the inflate call | not hooked — the "Patch settings" screen turned out not to need it (Addendum 14) |
| client identity | VISIONOS 1.03 profile (`requireSABR=false`), upstream's `ANDROID_VR_SABR` (1.73.21 / Pico 4) for comparison | our own request construction | Extension (the streaming spoof) |

## Cookbook: where the next patches would go

Marked **verified** when we measured it, **hypothesis** when it is a lead from our notes rather than
something we tested.

- **Force the `/player` route** (upstream blocks `get_watch` and `initplayback` so nothing else can
  hand the app an un-spoofed response) — **verified location**: the route name is appended in the
  innertube URL builder (`oth.l()`, the `"youtubei/v1"` anchor). Not implemented here because the
  route log showed this app only uses `/player`.
- **Ad telemetry / QOE pings** — **hypothesis**. The content ping carries a client-built
  `adcontext` blob and the QOE ping builder reads `Build.*` directly; the ad tracking/ping loader
  (`rgx.g(List)` → `tyj.r(Uri)`, verified to be a ping path rather than playback) is the entry
  point to look at. Suppressing pings is telemetry hygiene, not ad removal — the pre-roll fix does
  not depend on it.
- **Client-side ad slots** — **verified 2026-10-13, and the first "done" was wrong**. The app's own
  response carries them in `zjp.n`, and *five* sites read that field: `mkz.a` (the layout bootstrap),
  `mqx.r` (the ad-break list builder), `oqm.K` (no callers — dead), and the two accessors `mgn.c` /
  `mgn.d` that every other reader asks. Clearing the field on the *spoofed* response is not enough on
  the fallback path, where the app plays its own response: the four consumer hooks answering "no ads"
  still left a pre-roll — measured with a doubleclick impression and a `pagead/adview` creative fetched
  while `adBreakRenderer` and `playerBytesLayout` both reported "none". The delivery point is the
  **accessors**, so `Hide ads` now answers *them* with the app's own empty-list singleton (read out of
  the renderer method, so it is the type the callers expect). That covers every reader above at once —
  `mqx.r` and `mgn.g` included — and, unlike blanking the response's field, mutates nothing the
  playback director holds (blanking it was measured to reset it: `bestVideoFormat=0`,
  `STOPPAGE_DIRECTOR_RESET_INTERNALLY`).
- **Any other ad slot type, the VR180/immersive one included** — **covered by the same fix, statically
  (not measured)**. Every slot type is carried in the single list `mgn.d` returns; the AdSlotRenderer
  `mqy.a(vmo, mwh)` walks that one list and dispatches per type by enum ordinal (the immersive branch,
  `SLOT_TYPE_BELOW_PLAYER_IMMERSIVE` = 9, is ordinal 17), so emptying the accessors empties all of them
  at once and no per-renderer hook is needed. What would *not* be covered is a slot obtained through a
  response field other than `zjp.n`.
- **Quality / resolution preferences, autoplay, background behaviour** — **hypothesis**. These live
  in the player response and the format-selection path; start from the `adaptiveFormats` the VISIONOS
  profile returns and follow what the legacy player selects.
- **VR-specific UI** — the 2D panel ad UI is `fna` and the VR one `gtu` (both verified via the
  countdown anchor); the panel/immersive split is a good discriminator when a hook fires twice.
- **Anything touching the request shape** — go through the DataSpec build (`axe.a()`) or cronet
  (`CronetUrlRequestContext.newUrlRequestBuilder`); between them they cover every request the app
  makes, and the extension already demonstrates both patterns (mutate the builder; rewrite the URL).

## Verifying a change

1. Build the bundle: `./gradlew buildAndroid` (needs `JAVA_HOME`; `GITHUB_ACTOR`/`GITHUB_TOKEN` are
   read from the environment by `settings.gradle.kts`).
2. Apply with diagnostics on, so diagnostics-gated hooks are exercised too:
   `java -jar morphe-desktop-all.jar patch --patches patches/build/libs/patches-<v>.mpp -OenableDiagnostics=true --result-file out.json -o out.apk <stock apk>`
   For a local build that only needs *this port's* log lines, `-OforceVerboseLogging=true` is the
   cheaper switch and the only one that wins over the "Verbose logging" row's stored value: no extra
   hooks, no probe fetch. Neither is on by default, and a no-option apply injects no logging enable at
   all (see [AGENTS.md](../AGENTS.md#logging)).
3. Trust `Applied:` only after checking *which* method changed — ambiguity is silent. Extract the
   last `classes*.dex` from `out.apk`, decompile it, and confirm the hook is in the intended method
   and that the patched-class set is unchanged ([FINGERPRINTS.md](FINGERPRINTS.md) has the list).
   Reading that dex with `smali-dexlib2` directly (every method of every dex, printing the opcode,
   registers, literal and reference of each instruction) is faster and stricter than jadx for this:
   jadx hides the `const/4` values and removes unreachable blocks, which is exactly what an injected
   early `return` creates. Keep jadx as the second opinion — one `--single-class <name>` run on the
   extracted dex, which also settles what the *enclosing* method is.
4. On the device: **only ever install a cloned build** — one with the *Clone app* patch applied. A
   verification APK that keeps the original package name must never be installed on a headset: it
   replaces the store's app identity, and Horizon OS answers with a "Restore app" prompt for YouTube
   (measured, by installing one by accident). Then play a video and look for
   `ad slots: cleared N entries`, zero `skip-ad countdown` lines and `onPlaying`; the headset has to
   be *worn* for playback to start.

   Confirmed once on 1.88.10 with the cloned build installed, and it is the shape to compare against:
   `DataSpec builder fields resolved by type on axe: url=a method=d body=e`, zero
   "could not resolve"/"NOT being normalised" lines, `ad slots: cleared 2 entries`, zero countdown
   ticks, zero HTTP 400s, and `onPlaying`.
5. Re-confirmed 2026-10-10 on the build from the re-anchoring pass (cloned to `app.morphe.android.youtube`,
   diagnostics on), from a real playback in the headset: `onPlaying()`, one
   `DataSpec builder fields resolved by type on axe: url=a method=d body=e`, **zero**
   "could not resolve"/"NOT being normalised" lines, 60 `media #n … googlevideo.com/videoplayback`
   requests with 15 `normalising to GET with no body` lines, zero `skip-ad countdown` ticks and zero
   `rc.400`/`staleconfig`. The ad-slot line came out as its other branch,
   `ad slots: the app's response carries none (size=0)`: that response had an empty slot list, so
   there was nothing to clear. Both branches are logged by the same `augmentPlayerResponse` call, so
   that line is itself proof the hook ran on the live player response -- `cleared N entries` needs a
   response that actually carries slots (a monetized video / a fresh session), not a different code
   path.
   A video can be opened from adb without touching the headset:
   `am start -n <clone>/com.google.android.apps.youtube.vr.activities.YouTubeVrActivity -a
   android.intent.action.VIEW -d "https://www.youtube.com/watch?v=<id>"` -- the data *and* the
   component together start playback. With the package alone (`-p <clone>`) or via `vnd.youtube:` it
   does not (the latter resolves to the phone app's `UrlActivity`), and link intents land on the home
   feed.

### Applying from the CLI: two traps

- **Every `-O` on a command line belongs to the first `--enable`.** A second patch's option is silently
  dropped — the patcher binds `-O` to whichever patch was enabled first — so pass options through a
  generated `--options-file` (which is what `scripts/patch-and-install.ps1` does). Desktop 2.x
  result files list applied patch names only, so a `--result-file` option readback is empty there.
  The install script checks the options file it wrote, and checks the clone package id and the app
  name in the patched APK (`AndroidManifest.xml`, `resources.arsc`).
- **The official *Clone app* has to be its own pass**, with `--exclusive --enable "Clone app"` and
  an options file that marks every other patch `enabled=false` (`-OnlyEnable`). `--exclusive` does
  not stop a patch the file marks enabled, and the official bundle has universal default-on patches
  (`Spoof signature` ran and then failed, because pass 2's input is already signed). Package
  filtering is not what keeps that pass to one patch. Never select both renamers in one run — both
  finalise, and the **official one wins**, because patches execute alphabetically while their
  finalize blocks run in reverse. `-OfficialClone` disables ours for that run so the script cannot
  walk into it.

## Traps that cost real time

- **androidx preference members are R8-renamed; the class names are not.** `androidx.preference.Preference`
  in this APK has `setTitle`/`setKey`/`setSummary`/`addPreference` renamed to `L(...)`, `X(...)`, and so
  on (dumped from the dex), while the class names survive because the app inflates preferences *by class
  name* from `res/xml/*_prefs.xml`. Consequence for patches: **add preferences through the XML**, never
  through reflection by name — and when a reflection call is unavoidable, resolve the member name by
  descriptor from the dex rather than assuming it.
- **The settings list is `res/xml/settings_prefs.xml`** (immersive) and `panel2_settings_prefs.xml`
  (panel mode), inflated by the fragment `fzf` instantiates into `R.id.settings_fragment`
  (`fyr` for environments, `fzb` for the main screen). Adding rows there is how a mod adds a setting.
- **Sub-screen navigation is key-based fragment swaps, not nested screens.** The click handler
  `fzb.aC(Preference)` compares the clicked key and calls `fzf.aH(fyp.class, null)`;
  `fzf.aH(Class, Bundle)` instantiates the class reflectively, passes the Bundle as fragment
  arguments, replaces `R.id.settings_fragment` and adds the transaction to the back stack. Nothing
  implements androidx's start-screen callback, so a nested `<PreferenceScreen>` is inert — and this
  androidx build's `cfq` drops the `ARG_PREFERENCE_ROOT` key it reads, so arguments alone can never
  display a nested screen. 1.88.10 has a **second, parallel settings stack** (`fqg`/`fqa`/`fnj`,
  sharing the same XMLs) — anything re-keying or relabelling the settings UIs must handle both
  stacks. Two more dead surfaces make a two-level hub possible without minting anything (the
  SponsorBlock patch's Mod-settings hub, SPONSORBLOCK-NOTES.md Addendum 18): the `developer_settings`
  screen (its row is removed by `fzb.aD` at startup) and the generic preferences XML of the app's
  unreferenced framework `PreferenceFragment` (its id maps back to a file via
  `res/values/public.xml`). `fzf.aH` skips a swap to the class already showing — a same-class
  re-open (hub -> feature screen) needs a guard override; see the patch's `YtvrSbScreenClass`
  bridge. Watch out: `PreferenceGroup.ab(null)` is **not** null-safe (`preference.A` is
  dereferenced before the guarded list remove). The generalizable recipe — discovery, edits,
  traps (register counts!), verification — lives in [MOD-SETTINGS-STRATEGY.md](MOD-SETTINGS-STRATEGY.md).
- **A view you add must live in a `VrCardView` to be drawn.** The VR app composites only its own
  `VrCardView`s (`framework/view/VrCardView`, `VrViewFacade`, `GlRender`); a view added to the
  window's `DecorView` is laid out and measured (a real 4128x2208) but never rendered into the
  headset. Input is the opposite: clicks reach any child of a card (measured: our injected row logs
  every tap). So "it is in the hierarchy and laid out" proves nothing about being visible — check the
  parent is a card.- **The dock's `App name unavailable` card cannot be fixed from the APK.** Horizon draws it from an
  app-manager/OCMS record keyed by package name, and every API that writes or is consulted for it is
  signature-guarded (`prot=signature|preinstalled|knownSigner`). Manifest metadata, labels, branding,
  task labels and `com.oculus.app_id` are all measured failures; the data path, the guards and the
  reproduction commands are in [APP-NAME-CARD.md](APP-NAME-CARD.md). The one thing that does get a
  name is the app's 2D **panel** entry, because panel apps are named from the APK label.
- **Patched classes move to the last dex** of the patched APK, so grepping the first dexes finds
  nothing. Grep the last one, or use `jadx --single-class`.
- **`defpackage` is a jadx artifact.** At runtime those classes are in the default package, so
  `Class.forName("defpackage.wxe")` throws. Reach them through an instance.
- **`-O` options must precede `--enable`**, and the CLI rejects `-O` without an `-e` in the same
  group. `--result-file` reports the *effective* values; check it.
- **Every `-O` on a command line belongs to the FIRST `--enable`; later patches get no options at
  all.** Measured: `-OenableDiagnostics=true -e Extension` sets *both*
  options (one patch does receive several), but
  `-OenableDiagnostics=true -e Extension -OenableNativeFormats=true -e "Native formats without SABR"` leaves
  `enableNativeFormats=false`, and so does putting both `-O`s before the first `-e`. The second patch's
  option is dropped, not rejected, so the patch reports `Applied:` and then does nothing when the
  option gates its `execute` (which `enableNativeFormats` does -- it is the call injection's gate).
  Note that this stopped being observable through QUIC's option when that patch became the
  in-headset switch: its option now only *seeds* the row, so a dropped `-O` there is invisible by
  design rather than silently wrong. This is not theoretical:
  `scripts/patch-and-install.ps1 -NoSpoof` also passes an app name, which was silently ignored until
  the script switched to an options file. Pass `--options-file` instead -- its root **must be a JSON
  array**, patches it does not mention keep their defaults (the CLI says which on stdout), and it can
  set any number of patches at once -- or patch that one patch in its own run
  (`--exclusive -Okey=value -e <patch>`). **Quote the `-O` argument**: an unquoted
  `-OpackageName=app.morphe.android.youtube` reaches the CLI as `-OpackageName=app` plus a positional
  `.ytvr.youtubevr` and fails with `APK file .ytvr.youtubevr does not exist` (the README's by-hand
  example quotes it, which is why it works there).
- **A fingerprint's `custom` predicate must not assume the method has a body** (or must check it).
  An abstract sibling with the same signature matches the shape, and `addInstructions` on it is not
  the method you meant: `sfp` declares both the concrete `Z k()` and the abstract `Z l()`.
- **References must be spelled with the owner the dex actually uses.** The chained cronet builder is
  typed `ExperimentalCronetEngine$Builder`, so `…ExperimentalCronetEngine$Builder;->setLibraryLoader(…)`
  matches while the "obvious" `CronetEngine$Builder;->setLibraryLoader(…)` matches **zero** methods —
  a silent false negative, which is why an anchor is measured rather than eyeballed.
- **An unlisted app version is skipped, not failed** — exit 0 and an app with none of the fixes.
- **Opcode comparisons must use the enum** (`Opcode.IPUT_OBJECT`), never `Opcode.name` (lowercase
  smali mnemonics).
- **Omitting `parameters` means "any parameter list"**; `parameters = emptyList()` means zero.
- **Inline smali register lists are 4-bit** (v0–v15): in a large method copy the receiver into `v0`
  first; in a small method `p0` *is* `v0`, so copying clobbers `this` (VerifyError).
- **`ad_playback` in the QOE ping is a late signal** and reads "no ad" in short sessions; the skip-ad
  countdown is the immediate one.

## The patcher 2.x alignment (2026-10-30)

The bundle compiles against `morphe-patcher = 2.0.0` — the version the official bundle builds
against, binary-compatible with both current hosts (Manager 2.2.0 runs patcher 2.0.1, Desktop 1.20
runs 2.1.0). The alignment is three changes and one measured discovery:

- **Option data (issue #45).** On patcher 2.x a `values` map is `{display name: stored value}` —
  both hosts render the keys and save the values, and the official bundle declares
  `"Pure black" to "@android:color/black"`. This bundle's 1.x-shaped maps made Manager 2.2.0 store
  the *label* (`Show on the seekbar only (never skips)`) when a category was changed, and the
  patch refused it. All three option maps are declared 2.x-style now, `storedChoice` still resolves
  the label a Manager has already persisted, and `PatchOptionValuesTest` pins them. The patcher's
  own kdoc ("Eligible option values mapped to a human-readable name") still documents the 1.x
  reading — trust the hosts and the official bundle, not the kdoc (see the AGENTS.md trap row).
- **Source API: one rename.** `BytecodePatchContext.getAllClassesWithString(literal)` still exists
  on 2.0/2.1 but is `@Deprecated(DeprecationLevel.HIDDEN)` — invisible to Kotlin source — and
  delegates to `classDefByStrings(literal)`, which is the same exact-literal lookup and exists with
  the same signature back to 2.0.0. (Do not confuse it with `getAllClassesWithStrings()` (plural),
  the fingerprint scanner's walk over *every* class holding any string.) Everything else survived:
  `Fingerprint` keeps its constructors, `strings`, and `val method`/`val classDef`;
  `mutableClassDefBy(...)` keeps its three overloads — the ~30 compile errors the first 2.1 build
  produced were entirely cascade from the one hidden method.
- **The settings screens moved into a resource patch.** Desktop 2.x decodes resources **on
  request** ("Decoding resources on request, N files can be decoded" — the
  `ON_REQUEST_RESOURCE_DECODING` behavior on top of FULL mode): nothing exists under the decode
  tree until a resource patch asks for it, so the old design — a bytecode patch walking the tree
  off `fileWorkspace` — found an empty directory there and threw on a real 1.88.10 run (measured
  2026-10-30). Manager 2.2.0 decodes everything up front ("Decoding all resources"), which is why
  it never saw this. The XML restructuring now lives in the **Patch settings** resource patch,
  whose `decode("**/res/xml/*", "**/res/values/*")` is the sanctioned trigger (a no-op on hosts
  that already decoded); `sponsorBlockPatch` mines what only bytecode can (the dead screen's xml
  resource id, the per-category behaviours from its options) and passes it through
  `PatchSettingsState`, ordered by `dependsOn`. The final FULL encode compiles the edited XML and
  the added `@array` resources on the on-request hosts too — verified on device: a Desktop-2.x
  patch with the issue-#45 label values applied all eleven patches, installed, played, and logged
  `effective: sponsor=seekbar-only` from the label it was fed.
- **The audit reads merged dexes.** 2.x hosts merge the extension dex into the app's own dexes
  instead of appending one — measured: injected call sites in `classes6.dex`, extension classes in
  `classes7.dex` — so `audit-patched-apk.ps1` asks `DexAudit extmembers` for every
  `Lapp/ytvr/extension/…` method and field across all dexes. A text scan of those dexes false-passed
  on names the app already contains (`log`, `init`); taking the first dex that mentions
  `CategoryRows` was the call-site dex and reported every source member missing.

Known 2.x items deliberately **not** adopted here (revisit when they pinch):

- The ExtensionPlugin half of the patches Gradle plugin: it applies **AGP** (compileSdk 36, a real
  Android SDK, R8 minify) to every `extensions/` subproject. Adopting that means replacing this
  repo's javac+d8 extension pipeline — its own decision; the settings plugin skips dirs without
  build files, so `extensions/src` stays plugin-dormant.

**Adopted on the same day (2026-10-30), completing the 2.x alignment:**

- **The Gradle plugin itself**: `app.morphe.patches` 1.3.4 → 2.1.0-dev.1 (the settings-plugin
  model; the stable v2.0.0 tag was never published to the registry — the official bundle rides
  this dev line). It brings the same `buildAndroid`/`.mpp`/`patches { about { … } }` surface the
  scripts and release flow already use, plus `Patcher-Version: 2.0.0` in the bundle manifest. The
  extension pipeline in `patches/build.gradle.kts` is untouched. Catalog needed the `smali`
  library alias the plugin reads. Resolving the plugin needs `read:packages` on the GitHub token
  (one `gh auth refresh -h github.com -s read:packages`; the mavenLocal publish fallback was
  tried and dropped — the plugin's Maven publications GPG-sign, which is a dev-machine setup the
  README assumes).
- **Bundle signing (`PatchBundleSignature`)**: `./gradlew :patches:generateSigningKey` wrote the
  Ed25519 pair — `morphe-signing.pub` is committed (the pinned-key half Desktop 1.20+ verifies),
  `morphe-signing.key` is gitignored (the official repo ignores exactly that name) and must reach
  `release.yml` as the `MORPHE_SIGNING_KEY` secret, the same way the official repo wires it.
  `buildAndroid` signs every bundle it assembles (verified: `MorpheSig1` zip comment with the
  public key + Ed25519 signature); a mismatched key against the committed `.pub` fails the build,
  and a key-less environment ships unsigned (hosts do not require a signature yet).
- **Release-notes preset**: `.releaserc` → `.releaserc.js` with the
  `.github/scripts/changelog-preset.mjs` wrapper (release-notes-generator `config` option). Two
  fixes for the generated notes, which are read in Morphe Desktop's "Patch notes" viewer, not
  only on GitHub: housekeeping types (`chore`/`docs`/`ci`/`test`/`refactor`/`style`/`build`) are
  `effect: 'hidden'` — the Dependabot-bullet dump that v1.25.0 shipped above its first heading is
  gone — and commit bodies render as an indented continuation under each entry (the
  conventionalcommits template has no body slot, so the wrapper appends the body into `subject`
  after the preset's own transform; the preset field is `effect`, **not** `hidden` — v10 renamed
  it, and a `hidden: true` key silently keeps the entry). Release triggering (commit-analyzer
  rules) is byte-equal to the old config. Dry test: `build/probe/changelog-drytest.mjs`.

Building against 2.0.0 needs either `read:packages` on the GitHub token
(`gh auth refresh -s read:packages`) or a `morphe-patcher` clone next to this repo whose
`gradle.properties` `version` equals the catalog pin. `settings.gradle.kts` substitutes that
sibling only then — a 2.1.0 checkout next to a 2.0.0 pin is left unused and resolved from the
registry, because the smali jar is paired with the pin. CI never sees the sibling. The
bundle now requires a 2.x host at run time: patcher 1.x runtimes have neither `classDefByStrings`
nor the resource APIs (`decode`/`get`/`dependsOn`), so Desktop 1.19-and-earlier cannot apply it.

## Where the raw material is

`apk/` is gitignored: the stock APK, the decompiled sources (`apk/jadx-out`), the decompiled
official bundles used as reference (`apk/mpp-*`), logs, and patched builds. It is all reproducible:
re-decompile with jadx, and re-derive anchors with the workflow in
.

Local scratch — candidate anchors, hypotheses, name dumps — goes in `docs/LOCAL-NOTES.md`, which is
gitignored on purpose.
