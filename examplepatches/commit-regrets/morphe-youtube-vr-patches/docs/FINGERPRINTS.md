# Fingerprints: what survives a YouTube VR update

A fingerprint is how the patcher finds code in an app whose names R8 **reassigns on every
release**. It matches on structure instead of names: literals the method uses, its shape (opcodes,
callers, field accesses), framework references, access flags, parameter/return types.

So a fingerprint survives an update only if it anchors on something R8 cannot rename:

| stable anchor | why |
|---|---|
| **framework / library references** — `Landroid/widget/TextView;->setText`, cronet's `org/chromium/net/…` | outside the app, so R8 cannot rename them |
| **generated proto types** — `com.google.protos.…StreamingDataOuterClass$StreamingData` | protoc's names are not obfuscated |
| **protocol literals** — `"youtubei/v1"`, `"ump"` | server-side paths, not app names |
| **unobfuscated app classes** — the manifest `Application`, `…/media/player/exo2/platypus/…` | usually kept readable |
| **strings the app itself shows/logs** | rewritten only if the feature changes |

What does **not** survive: any `definingClass = "Loqx;"`, `parameters = listOf("Lonu;")` or
`returnType = "Lonm;"` — those are the *current* obfuscation map.

## A green run is NOT proof that the right method was patched

Measured, not theorised: dropping one constraint from the `oqb` predicate made it match the sibling
two-parameter constructor as well, and the patcher attached the injected hook to **that** one while
still reporting `Applied: Extension`, exit 0, and an empty `failedPatches`. Ambiguity is silent, and
it does not necessarily pick the method you meant.

So after any fingerprint change, verify *which* method was modified:

1. Apply the bundle with diagnostics on, so diagnostics-gated fingerprints (the innertube one) are
   exercised too:
   `java -jar morphe-desktop-all.jar patch --patches patches-<version>.mpp -OenableDiagnostics=true --enable Extension -o out.apk youtube-vr.apk`
2. Extract the last `classes*.dex` from `out.apk` and decompile it (jadx).
3. Confirm the injected calls are in the expected methods **and** that the set of patched classes is
   unchanged. At 1.88.10 that set is:

   ```
   agtm, axe, CronetUrlRequestContext, fna, gtu, mkz, muf, muk, ocn, oqb, oth,
   PlatypusEnablingManager, PlaybackAgnosticUserPreferences, pqy, sfp, tyj, YouTubeVrTikTokRoot_Application
   ```

   plus the extension's own classes. `oqb` is the case to watch: the hook must be at instruction 0
   of the **one-parameter** constructor, not the two-parameter sibling. For `pqy`, the patch's own
   edit must be visible as `this.c = false;` (the `instance-of` replaced by `const/4`).

   With **SponsorBlock** enabled (it is `default = true`, so default runs include it), the set
   gains exactly three classes, each explainable: `pwe` (the loadVideo/seek hooks + the three
   generated bridge methods), `pwd` (the onSeeked hook) and `ablw` (the seek-source enum: its clinit
   was matched to mine the constant, and the bridge references the field). The bridge bodies read
   `iget-object Lpwe;->a:Lqhg;` → `invoke-interface Lqhg;->e()J` / `->g()J` / `->F(J, Lablw;)V` with
   `sget-object Lablw;->a:Lablw;` — read them back with the `Inspect dump` harness before trusting a
   green run.

The patcher's other silent traps — `parameters` semantics, comparing opcodes by enum rather than by
the smali mnemonic, and the rest — are listed in [INTERNALS.md](INTERNALS.md).

## Conversion status (Extension patch)

| fingerprint | matches in 1.88.10 | anchor now | update-proof? |
|---|---|---|---|
| `applicationOnCreate` | `YouTubeVrTikTokRoot_Application.onCreate()` | manifest-declared class name | likely |
| `videoStreamingDataCtor` | `oqb.<init>(zjp)` | ✅ generated `StreamingDataOuterClass$StreamingData` proto + one-parameter field write — 1 match in 146,836 methods | **yes** |
| `platypusEnable` (×2) | `PlatypusEnablingManager.a/b` | readable library class; the method names and param types are not | partly |
| `dataSpecBuild` | `axe.a()` | ✅ no parameters + the class's `Uri`/`byte[]`/`int` fields read by the method itself + the eleven-argument DataSpec constructor (called as `invoke-direct/range`) — 1 match; the naive "no-arg reading a Uri, byte[] and int" anchor matches 5 methods in 3 classes | **yes** |
| `mediaDataSourceCtor` | `pqy.<init>(…)` | ✅ five parameters + the class's `"ump"` literal + `instance-of → final iput-boolean` — 1 match; the literal occurs in exactly one class | **yes** |
| `innertubeUriBuilder` | `oth.l()` | ✅ the `"youtubei/v1"` literal, unique to one class | **yes** |
| `cronetUrlRequestBuilder` | `CronetUrlRequestContext.newUrlRequestBuilder` | ✅ Chromium's own names | **yes** |
| `skipAdCountdown` (×2) | `gtu.b(int)`, `fna.b(int)` | ✅ `void(int)` writing through `TextView.setText` + `setContentDescription` (2 matches of 146,836), pinned per class by a framework call (`ViewPropertyAnimator.translationY` / `View.inflate`) | **yes** |
| SponsorBlock `loadVideo` | `pwe.j(pzj)` | ✅ the full `MedialibPlayer.loadVideo(cpn=%s …)` log literal, 1 match — **the whole string**: `holdsStringLiteral` compares exact equality, and a prefix matches nothing (the scratch harness's `contains` hides this; measured) | **yes** |
| SponsorBlock `seekTo` | `pwe.o(J, Lablw)` | ✅ the `MedialibPlayer.seekTo(positionMillis=%d)` literal (1) + `J` first parameter + the wrapper class literal | **yes** |
| SponsorBlock `onSeeked` | `pwd.u(J, Lablw)` | ✅ the `onSeeked(positionMillis=%d)` literal (1) + `J` first parameter | **yes** |
| SponsorBlock time-info snapshot | `pwe.A()` — **not hooked, mined** | ✅ wrapper class literal + a static call with the exact TimeInfo prototype `(J J J J I J J String) -> reference`: 2 matches app-wide (`pwe.A` and `qkl.<clinit>`), the class literal separates them | **yes** |
| SponsorBlock seek-source enum | `ablw.<clinit>` — **mined** | ✅ the `SEEK_SOURCE_UNKNOWN` const-string, 1 method app-wide; the field stored right after it is the constant the seek bridge loads | **yes** |
| SponsorBlock seek-bar binder | `gtw.<init>(View, …)` in 1.88.10 / `guo.<init>(View, …)` in 1.89.09 | ✅ **the five inlined `R.id.seekbar*` ints** (1.88.10: `0x7f0b0a23`/`a25`/`a26`/`a29`/`a2a`; 1.89.09: `0x7f0b0a39`/`a3b`/`a3c`/`a3f`/`a40`). Matched against supported version sets | **yes** (resource ids are inlined constants; R8 cannot rename them) |
| SponsorBlock seek-bar timeline | `gtw.e(J,J,J,J)V` | ✅ same class + the `(J J J J)V` shape + a `setLayoutParams` call. The class also has a synthetic `(J J J J)V` bridge (`k`) that only forwards to `Lrve;->e`, so the layout call is what separates them — verified in the built dex, where the bridge is untouched | **yes** |
| the seek-bar ids as anchors | — | four ids: 1 method each; `R.id.seekbar` alone: 2 (`gtw.<init>` and `SeekBarPreference.a`) — hence the row above | |
| "is the player-controls view alive during playback?" | — | **Yes, it is built at launch** — an earlier note here claimed otherwise, and that was a *symptom of our own bug*: the first marker build injected `invoke-static {v0, v2, v4, v6}` into `gtw.e(JJJJ)V`, ART rejected the class (`long or double parameter at index 0 is not a pair`), and the whole watch UI failed to build, so the hook never ran. Dex 35c lists *every* register, so four longs need eight entries (it holds five) — **wide arguments require `invoke-*-range`**. Moving them into locals instead is worse: it clobbers the method's own registers and trips the same verifier |
| SponsorBlock settings-panel entry | `fyi.ad(View, Bundle)` — the panel's view-created callback | ✅ the class is the one whose inflate call references the inlined `R.layout.accounts_and_settings_fragment` id (0x7f0e0028, measured: 1 method app-wide) plus the `(Landroid/view/View;Landroid/os/Bundle;)V` shape (1 method in that class) | **yes** |

The fingerprints that were still name-bound have since been re-anchored on structure; the last
section of this file records what each one became and what it measured. What is left name-shaped,
on purpose:

| still name-shaped | why that is fine |
|---|---|
| the two `platypusEnable` method names | the class (`PlatypusEnablingManager`) is a readable library class, and the two methods are pinned by `Z` + parameter count 2 / 3 |
| the DAI URI/break pair (in the removed `StitchedAdsPatch.kt`, see below) | no discriminating shape, and that patch was off by default, so a rename failed it loudly instead of hooking the wrong method (last section) |
| `PlaybackAgnosticUserPreferences`, cronet's `CronetUrlRequestContext`, the manifest `Application` | not obfuscated names at all: library/framework types that R8 keeps |
| `R.id.seekbar_bg` (`SponsorBlockPatch.kt`) | a hand-kept *resource id*, not a name: the line view is referenced by the layout, never by code, so no fingerprint can mine it. It sits beside the five mined ids with that comment, and the overlay falls back to the played bar's parent if it resolves to nothing — so a renumbering costs the exact inset match, never a wrong hook |

To list every matcher that mentions an app type after an update -- and then judge which of them are
obfuscated names rather than framework ones:

```bash
rg -n 'definingClass = "L|parameters = listOf\("L|returnType = "L' patches/src
```

## Variants measured as NOT unique (do not re-try them)

| candidate anchor | matches |
|---|---|
| `StreamingDataOuterClass$StreamingData.getDefaultInstance()` | 7 methods |
| the `instance-of → final iput-boolean` shape alone | 8 constructors |
| `"/videoplayback"` | 48 methods across ≥5 classes |
| `setContentDescription` alone / `setText(CharSequence)` alone | 3 / 4 methods |
| `accessFlags = PUBLIC\|FINAL` filters | useless: the near misses are PUBLIC\|FINAL too |
| `Z(Context)` + the automotive feature literal, without the class fact | 2 (`avv.Y`, `ocn.c`) |
| `"MedialibPlayer.loadVideo(cpn="` (a **prefix**) against `holdsStringLiteral` | 0 — exact equality; the scratch harness's `findstring` uses `contains` and will not warn you |
| a static call returning a reference with prototype `(J,J,J,J,I,J,J,String)` | 2 (`pwe.A`, `qkl.<clinit>`) — hence the class fact |
| `SEEK_SOURCE_UNKNOWN` | 1 class (`ablw.<clinit>`) — the enum field names themselves are obfuscated, only the constant *names* are dex strings |
| the automotive feature literal alone | 9 classes of the app and its bundled libraries |
| `enableQuic` + `enableHttp2` + `setLibraryLoader` in one method | 2 (`npg.a` and `pju.a`, the second engine builder -- see the last section) |
| `List` + `oqi.F()`, the ad-break renderer's old anchor | 3 (`mqx.r`, `muk.a`, `rge.N`) |
| `PriorityQueue(int, Comparator)` alone | 10 methods; exactly one of them returns `List` |
| `Z` + one reference parameter + `Optional.isPresent()` | 12 methods |
| the `ServerStitchedDaiInfo`-returning `(J)` signature alone | 3 (`pzl` interface, `pzk` no-op, `ryi`) |
| `Uri` + `(L,J,J)` / `Z(J)`, the DAI uri and break shapes | 3 / 134 methods |
| `Z`, no parameters, in the class holding the playability logger literal, with no "has a body" check | 2 (`sfp.k` and the abstract `sfp.l`) |

## Residual durability notes

- **`platypusEnable`** — keep the readable `PlatypusEnablingManager` class and match the two
  `Z`-returning methods by parameter *count* (2 and 3) rather than by obfuscated method names and
  parameter types.
- If a `pqy` style shape ever proves brittle, its documented weaker fallback
  (`<init>` + five parameters + the `"ump"` literal) also measures unique.
- **The extension side matters as much as the fingerprint.** A durable fingerprint is useless if the
  injected code then looks up state by obfuscated name: `PotUrls` used to read `"a"`/`"d"`/`"e"` off
  the builder, and `lookup()` returns null on a miss, so after an app update the patch would keep
  applying while `normalise()` silently did nothing. It now resolves those fields **by type**
  (`Uri`, `byte[]`, and the `int` declared immediately before the body field) and logs, rather than
  silently no-ops, when the shape changes. Check the same pattern in any new hook.
- **SponsorBlock pushes this one step further: the patch *generates* the bridge methods.** The
  extension needs to call `qhg.e()` (position), `qhg.g()` (duration) and `qhg.F(J, Lablw;)` (seek)
  at tick time — none of which can be named in a fingerprint *or* resolved reflectively by shape at
  runtime (four no-arg `long` accessors sit side by side on that interface). Instead the patch mines
  the references out of the app's own bytecode at patch time: the backend field and the accessor
  order come from the TimeInfo snapshot (`pwe.A`, whose argument order its `qkl.a` call fixes), the
  seek call from the `seekTo` log literal's method, and the enum constant from the
  `SEEK_SOURCE_UNKNOWN` clinit. Three methods with **our own names** (`YtvrSbGetPositionMs`,
  `YtvrSbGetDurationMs`, `YtvrSbSeekTo`) are added to the wrapper class with those mined references
  as their bodies; the extension reflects on the *names we chose*, which R8 never sees. A rename in
  the next release is absorbed automatically as long as the fingerprints still match; a shape change
  trips the patch's `check`s and fails loudly.
- **The injected code was the last place a name survived, and `Hide ads` no longer has one.**
  Returning the app's empty-list singleton used to mean emitting `sget-object v0, Lvrm;->a:Lvmo;`
  literally: the *fingerprint* was structural, so a rename would have kept the patch applying and
  thrown `NoSuchFieldError` on the device. The patch now reads that field reference out of the
  renderer method itself -- "the static field this method loads and immediately returns", measured
  as exactly one -- so the injected instruction is whatever the app returns for the same case.
  `Collections.emptyList()` is deliberately **not** used instead: the app's own list type is not
  `java.util.List` and a caller may cast the result, which would turn a rename into a
  `ClassCastException` rather than nothing at all.

## The rule that matters when a version is not listed

A patch whose app version is not in `Constants.kt`'s `AppTarget` is **skipped, not failed** — the
patcher prints a skip, exits 0, and the output is an app with none of the fixes. Always check that
the expected patches were *applied*: `scripts/patch-and-install.ps1` asserts this
(`-RequirePatches`, by default every patch that is on by default), and `--result-file` reports the
effective option values and the applied patch list. See [VERSIONING.md](VERSIONING.md).

The step-by-step re-derivation workflow for a new version is in
the per-mechanism anchors recorded while the patches
were written are in the patch sources and their commit history.

## The re-anchoring pass: what each name-bound matcher became

Measured **before** each fingerprint was changed, against the stock 1.88.10 APK's own bytecode (5
dex files, 27,722 classes and their methods) rather than against the decompiled sources (25,093
`.java` files — the two counts differ because the dex also carries the synthetic, anonymous and
desugared classes jadx folds away). The counts come from a small `smali-dexlib2` harness over every
method of every dex, because the anchors that matter are opcode-level conjunctions — a constant
immediately before a call — and the patcher's own matcher cannot report ambiguity at all. The
scratch harness lives in `apk/scratch/` (gitignored) and is ~200 lines over the dexlib2/guava jars
already in the Gradle cache; rebuild it if it is gone.

"Matches" is the count for the anchor that is now in the code. Every row was then checked in the
**patched** dex: the last `classesN.dex` was extracted and its patched-class set compared with the
baseline, and the hook's position inside the intended method read at opcode level (cross-read once
with jadx on that dex alone, which agreed):

| target | anchor now | matches | was (app name) |
|---|---|---|---|
| `platypusEnable` ×2 (done earlier) | readable library class + `Z` + parameter count 2 / 3 | 1 each | obfuscated method names |
| `SpoofOsName` automotive (**patch removed 2026-10-12**: measured to propagate but not to block ads, see its KDoc in git history) | `Z(Context)` + the class holds the version-name pref key + the body holds `android.hardware.type.automotive` | 1 | `Locn;` / `c` |
| `SpoofAppVersion` name | `String(Context)` holding the pref key literal | 1 | already durable |
| `SpoofAppVersion` code | `I(Context)` in the class holding that key | 1 | `Locn;` / `a` |
| `SpoofUserAgentPackage` | `String` return + `" (Linux; U; Android "` + the `getPackageName()` call it rewrites | 1 | `Lagtm;` / `a` + full prototype |
| `DisableQuic` | **unchanged**: `Object(Object,Object)` + `youtubei.googleapis.com` + `const 1` → `enableQuic` → `move-result-object` | 1 | already name-free; the proposed conjunction measures 2 and was rejected |
| `StitchedAds` info (**patch removed 2026-10-13**: the ad is stitched into the SABR stream by the server, so no client patch can remove it — the anchors stay here as the re-derivation recipe) | `(J)` returning the generated `ServerStitchedDaiInfo` + the class holds `daistate` + the body *uses* the proto type | 1 | `Lryi;` / `b` |
| `StitchedAds` uri / break (same removal) | **left name-based on purpose** | 3 / 134 without the class name | `Lryi;` / `a` and `c` |
| Hide ads renderer | returns `List` + constructs `java.util.PriorityQueue` | 1 (of 10 such constructor sites) | `List` + `oqi.F()` + a `new-instance` window |
| Hide ads request | the log template alone, plus a "returns a reference" guard for the injected `return-object` | 1 | `Lonm;` / 13 parameters / `tyj.s` |
| Hide ads slot | `Z` + one reference parameter + the class holds the CISA literal + the body calls `isPresent()` | 1 (shape alone: 12) | `Lmuf;` / `a` + the `mgn.g` lookup |
| Ad-slot accessors | **names**, deliberately: 1.88.10: `Lmgn;` `c(Lzjp;)` and `d(Lzjp;Ljava/util/List;)`; 1.89.09: `Lmht;` `k(Lzmj;)` and `l(Lzmj;Ljava/util/List;)`, both returning the slot list (`Lvmo;` in 1.88.10, `Lvpr;` in 1.89.09) | 2 | `Lmgn;` (1.88.10) / `Lmht;` (1.89.09) |
| Ad cue-point callback | the **unobfuscated** media-interfaces name `CuePointDataProviderWrapper$NativeCallback.onCuepointList([B)` -- the server's statement of where the ad breaks are | 1 | not obfuscated |
| Hide ads layout | unchanged (the `…PlayerAds count: ` string) | 1 | already durable |
| playability adult | boxed `Boolean`, no parameters, the class holds the `…playability/PlayabilityPolicy` logger literal | 1 | `Lsfp;` / `f` |
| playability controversial | `Z`, no parameters, same literal, **and the method has a body** | 1 (without the body check: 2) | `Lsfp;` / `k` |

Two things are deliberately *not* re-anchored:

- **`StitchedAds` uri/break** (its patch was removed 2026-10-13, see the row above). Their shapes do
  not discriminate (`Uri` + `(L,J,J)` matches 3 app-wide, `Z(J)` matches 134). The only facts that
  would pin them are the class's own `daistate`/`acpns` protocol literals — the same fact the info
  hook used — so anchoring all three on one literal would have bought resilience for a patch that was
  off by default, at the cost of hanging every hook off a single string. They were left name-based,
  which made a rename fail that patch loudly (unresolved fingerprint) rather than hook a wrong method
  silently. Kept here as the recipe if the probe is ever wanted again: `Uri+(L,J,J)+daistate` → 1,
  `Z(J)+class holds daistate` → 1.
- **`DisableQuic`'s anchor.** The anchor already in the code is name-free and measures 1; the
  conjunction proposed in the notes (`enableQuic` + `enableHttp2` + `setLibraryLoader` in one
  method) measures **2**, because `phn`'s second engine builder chains the same three calls and
  must *not* be patched. The proposal was therefore dropped, not implemented. `phn` also cannot be
  reached by accident from the shipped anchor: it calls `enableQuic(false)`, and the `literal(1)`
  filter requires the `const 1` that only the real engine passes.

Negative findings, so nobody retries them: `allowAdultContent` / `allowControversialContent` occur in
**2** classes (`sfp`, `ozz`), and `AdBreakRenderer path ad playerResponse cannot be deserialized.`
in **2** classes — neither can anchor alone. `isDone()` alone matches 131 methods. `"pcmp"` occurs in
2 files, so it cannot anchor `PlatypusEnablingManager` by itself. The class-level facts used above
are `pref_override_build_version_name` (1 class), `android.hardware.type.automotive` (9 classes, hence
always paired with the shape), ` (Linux; U; Android ` (1 method), `AdCpn is null or empty for CISA
scheduling` (1 class), `daistate` (1 class) and the `…playability/PlayabilityPolicy` logger (1 class).


## The SponsorBlock sub-screen anchors (Addendum 17)

The sub-screen edits are also name-free. Each was checked against the stock 1.88.10 dexes with the
same harness discipline; "matches" is what the anchor as written measures:

| target | anchor | matches |
|---|---|---|
| the settings click handler(s) | `(Preference)Z` method holding the literal `developer_settings`, enumerated via `getAllClassesWithString` (2 stacks: `fzb`, `fqa`) | 2, both intended |
| the fragment the branch opens | the `const-class` after that literal, validated by requiring its class to hold the `"Developer Settings"` title literal | 1 per stack (`fyp` / `fnj`) |
| the sub-screen's title site | the class's methods holding `"Developer Settings"` | 1 per class (`fyp.W`, `fnj.W`) |
| the sub-screen's wiring skip | the class's only `()V` method with exactly one `0x7f1800xx` literal (the `xml` id window), patched after the single-int call that follows it (`o(I)`) | 1 per class (`fyp.aD`, `fnj.aD`) |

The `0x7f1800xx` window is this build's `xml` resource-type block — if a future build reorders
resource types, the patch fails loudly at the uniqueness check instead of returning early from the
wrong method.

The `0x7f1800xx` window is this build's `xml` resource-type block — if a future build reorders
resource types, the patch fails loudly at the uniqueness check instead of returning early from the
wrong method.

## The Mod-settings hub anchors (Addendum 18)

Addendum 18 restructures the hub and mines five more pieces, all structural:

| target | anchor | matches |
|---|---|---|
| the live stack | of the two stacks' matching click handlers, the one whose route target's title method reads a **field of the holder's type** (the parallel stack's fragment reaches its holder through a peer lookup, with no such field) | 1 of 2 |
| the fragment-arguments field | the one `Bundle`-typed `iget-object` in the click handler's own class's `()V` setup (`Lav;->q`, R8-renamed — never hand-written) | 1 |
| the setup + title bodies | the `()V` method with exactly one `0x7f1800xx` literal, and the method holding the `"Developer Settings"` literal; both rewritten wholesale from their own mined pieces (manager field/call, single-int inflate, super call, holder field, set-title call, divider call) | 1 each |
| the dead framework XML | `android.preference.PreferenceFragment` subclasses invoking `addPreferencesFromResource`, excluding the languages one (it references the input-method backup type); its xml const is resolved to a file through `res/values/public.xml` | 1 of 2 |
| the same-class swap guard | the single `getClass()` call inside the holder's `(Class, Bundle)` swap, replaced with a generated static bridge that forces recreation only when the arguments carry `ytvr_screen=sb` | 1 |
| the hub entry handler | a `aC(Preference)` override **added** to the sub-screen fragment; its super fallback is rebased onto the ancestor that declares the handler (mined from the inflate reference's defining class) | added |

## The colour-legend anchor, and two paths that look right and are not (Addendum 19)

The category rows carry their seek-bar colour on their own title. The row binder is found by what it
**does**, never by a name, because R8 renames this class's members while its class name survives for
XML inflation:

| target | anchor | matches |
|---|---|---|
| `androidx.preference.Preference` | `getAllClassesWithString("Preference already has a SummaryProvider set.")` filtered by type, re-resolved via `mutableClassDefBy` (the literal is thrown by that class's own summary setter) | 1 |
| the row binder | its one-parameter `V` method whose body calls `Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V` (measured: `a(cgb)`, the method that reads the title field and calls `textView2.setText(charSequence)` on the view it found via `android.R.id.title`) | 1 |

Two anchors that were written, built, installed and measured as **firing for nothing** — recorded so
they are not tried again:

- **the `(CharSequence)V` setters.** They are `L` (title, writes field `q`) and `n` (summary, throws
  the SummaryProvider literal), and hooking both is correctly-shaped but dead: XML inflation never
  calls either. `Preference`'s constructor reads `android:title` straight out of the `TypedArray`
  and assigns the field (`this.q = uz.B(typedArrayObtainStyledAttributes, 34, 4)`). `setTitle` is
  only for programmatic changes.
- **`b(View)`.** It reads like the binder (`onBindView`) and is not: it is a shell whose whole body
  is `D()`, and `androidx.preference.SwitchPreference.b` overrides it as **`final`** without calling
  the base — so for the switch rows this patch actually creates, hooking either one paints nothing.
  The binder is `a(cgb)`, shared by every row type.

The extension side is equally name-free: it is handed the holder, finds the holder's `View` field
whose tree carries `android.R.id.title` (a platform id, and the very id the binder itself uses), and
paints that `TextView`. Verified on the device: the log names each row and its colour, and the
screenshot shows `Sponsor` green, `Unpaid / self-promotion` yellow, `Interaction reminder` purple.

The legend also found a real bug in the overlay's palette: `hook` had no case, so hook segments were
drawn in the fallback grey (`#ff808080` in the log). Upstream's `#395699` is now in the table, which
both the rows and the seek-bar markers share.

## The category rows are a picker, and what it had to work around (Addendum 20)

The rows carry a per-category behaviour picker. Five measured facts shaped it, all verified on the
device rather than assumed:

| fact | how it was measured | consequence |
|---|---|---|
| a `ListPreference` sharing the old switches' key **crashes the screen** | `ClassCastException: Boolean cannot be cast to String` at `ListPreference.h → Preference.t → SharedPreferencesImpl.getString` | the pickers use their own key prefix (`ytvr_mod_sb_behaviour_`), and the switch values are **migrated** into it at start-up -- reading them alone is not enough, because a `ListPreference` persists its own default on first bind and would overwrite the user's old choice |
| the app's own adapter **ignores a `ListPreference` row's tap** | the row renders (with its `%s` summary) and tapping does nothing | the picker must be attached to the row's own view, not left to the framework's `onPreferenceTreeClick` |
| a **dialog window is never composited** into the VR panel | `AlertDialog.Builder(context).show()` runs with no exception and nothing appears, while the row's own click does arrive (`behaviour picker: interaction ... now skip` in the log) | the panel is an Impress-rendered surface; the app's own "dialogs" are views *inside* it, so no picker UI may be a window |
| row taps **do** reach a listener set on the row's view | `row.setOnClickListener` fires on the device for these rows | the picker hooks there, and re-reads the row's title when clicked -- a recycled row would otherwise change the wrong category |
| the hook runs for **every row of every settings screen** | clearing the click listener on rows that were not ours removed the app's own handler, and the "Patch settings" row stopped opening | the hook returns immediately for any row it does not recognise, and only restores a colour it changed itself |
| **views added to the window's decor are not drawn either** | the list was built and attached with no exception (`behaviour list shown: selfpromo ... 4 option(s)`) and nothing appeared | not just dialogs: only the app's own content subtree is rendered, so the picker has to live *inside a row* |
| the row's text column is a **`RelativeLayout`**, not a `LinearLayout` | `preference.xml`: title, then summary with `layout_below="@android:id/title"`; a captured panel showed the list drawn *over* the summary -- "Skip automatically" printed twice, overlapping | the list is added with `RelativeLayout.LayoutParams` and `addRule(BELOW, summary ?: title)`; the summary is hidden while it is open so the current choice is not printed twice |

Two device limitations worth keeping: `adb shell input tap` at panel coordinates is ignored (the panel
is hit-tested in 3D, not at display coordinates), and key events reach the VR shell rather than the
app -- so interaction needs a person even though *capture* does not. To capture without wearing the
headset: `adb shell svc power stayon true`, then a `KEYCODE_WAKEUP`, then `screencap -p /sdcard/x.png`
and `adb pull` (writing on the device avoids any host-side binary mangling).
