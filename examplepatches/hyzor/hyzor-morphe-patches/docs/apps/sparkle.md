# Sparkle TV

Package `se.hedekonsult.sparkle`, supported target `2.4.0` (versionCode `204004`, universal APK,
TV only — the manifest requires `android.software.leanback`).
Source: [`patches/src/main/kotlin/dev/hyzor/patches/sparkle/`](../../patches/src/main/kotlin/dev/hyzor/patches/sparkle/).

| Patch | Default | What it does |
|---|---|---|
| Enable Plus | on | Unlocks the Plus features: DVR, timeshift, multiview, VOD, multi-source setup and channel/category editing. Client side only. |

## How the app decides you have Plus

The licence lives in `se.hedekonsult.utils.LibUtils`, a thin wrapper around the native library
`liblibutilsJNI.so` (shipped for all four ABIs). The model is a bitmask:

```text
LibUtils.h(context, purchases)      native: which Plus flags the Play purchases cover -> int
        │
        ▼
lh/f (billing manager)              stores the mask, then calls back into the UI
        │
        ▼
MainActivity.K(int)                 puts it in the intent extra "sync_internal",
        │                           in every fragment bundle, and in the TaskReceiver broadcast
        ▼
SetupActivity$*.g1(Bundle)          fragments read it back and keep it in their own int field
```

Every gate then calls the central helper

```text
static boolean x.e(Context, int mask, int required, String prompt)
    if ((mask & required) == required) return true
    ... else pick the purchase-prompt string for `required` ...
```

There are 49 call sites in 37 classes, so the gatekeeper is the single place that decides every
Plus surface. `MainActivity.onStart` also calls `x.H(Context)`, which returns false and opens
`IncompatibleDeviceActivity` when the device is not a TV (or `allow_incompatible` is unset).

`LibUtils`'s single-letter getters are **not** the user's state — they return the feature's own
bit, and the gatekeeper compares `required` against them to choose a prompt. 2.4.0's prompt switch
pins the getter-to-feature mapping; the numeric bits are the constants the upstream patch
documents and this patch pins:

| Getter | Bit | Resource |
|---|---|---|
| `f()` | `0x1` | multi-source (setup) |
| `e()` | `0x2` | EPG / channel-art cache |
| `c()` | `0x4` | live TV preview |
| `u()` | `0x8` | `notification_purchase_timeshift` |
| `a()` | `0x10` | `notification_purchase_recordings` |
| `v()` | `0x20` | `notification_purchase_vod` |
| `g()` | `0x40` | `notification_purchase_multiview` |
| `b()` | `0x80` | category / channel editing |

### Anti-tamper

The native library stamps a `startup_time` preference and the Java side treats
`value % 10 != 0` as tampering: `TaskReceiver`, `SetupActivity$j$g` and `i0` each schedule a
`Handler`-deferred wipe in that case. Nothing in the DEX writes the key, so the patch seeds
`startup_time = 1000` at the top of `MainActivity.onCreate` (after checking the frame has room
for the injected `v0`–`v3`). `LibUtils.w()` (debugger check) and `LibUtils.y(...)`
(purchase signature verification) are the other native checks; both are neutralised.

## What the patch hooks

| Hook | Why |
|---|---|
| `kh.x.e(Context, int, int, String)Z` | the gatekeeper; forced to `true` (found by signature — the class name is obfuscated and moved from `ph.b0` to `kh.x`) |
| `kh.x.H(Context)Z` | device check, optional (degrades to stock behaviour if it moves) |
| `MainActivity.K(int)` | forced mask `0xFF`; found by the single `sync_internal` literal (2.3.1 called it `H(int)`) |
| `MainActivity.onCreate(Bundle)` | seeds `startup_time = 1000` |
| `LibUtils.x(MainActivity)` | skips the native `xpoe32871a` handshake |
| `LibUtils.h(Context, ArrayList)` | billing mask → `0xFF` |
| `LibUtils.w()` | debugger check → `false` |
| `LibUtils.y(Context, String, String)` | purchase signature verification → `true` |
| `LibUtils.f/e/c/u/a/v/g/b()` | feature bits, pinned to the constants above |
| `LibUtils.i..t()` | plan / SKU names, so the UI reads "Plus" |
| `LibUtils.p/q(Context)` | native prompt strings, blanked |
| `SetupActivity$j.g1` | seeds the setup wizard's root mask field before the billing helper is created |
| `SetupActivity$j.e2` | re-asserts the root mask to `0xFF` whenever the overview renders (the billing callbacks also write it; the failure one stores `0`) |
| `SetupActivity$a/$c/$e/$g/$i/$l.g1` | clamps each setup fragment's cached `sync_internal` to `0xFF` |
| `res/values/dimens.xml` | caps `movie/series_image_background_*` at 960 x 540dp (see below) |

`LibUtils` method names are pinned by the native library and were identical in 2.3.1 and 2.4.0;
the patch looks them up by name + exact signature and fails with the signature it wanted rather
than hooking the wrong overload.

The setup wizard needed its own fix, which the first cut of this port missed. Its fragments
(`SetupActivity$a` … `$l`) read `sync_internal` from their arguments in `g1(Bundle)` and keep it
in an `int` field, but the arguments are built from the parent fragment's copy, and the root
(`SetupActivity$j`) gets its copy from the **Play Billing callback**. On a device where Play is
absent, that callback never runs, the tree stays at 0, and the setup screens stay locked even
though the gatekeeper returns true — observed on the TV emulator as a greyed-out *"Add XMLTV epg
(Purchase Sparkle TV Plus)"* while the overview's *Add new source* still worked (it is shown when
no sources exist).

The callback is not the only writer, though: `SetupActivity$j$c.z0(I)`, its billing-failure
callback, stores `0` into the field and then calls the root's `e2` updater. A seed alone would
therefore not survive a Play install that reports an error. The patch does three things:

1. seeds the field in `SetupActivity$j.g1`, before the billing helper is created;
2. re-asserts `0xFF` at the top of `SetupActivity$j.e2`, which renders the setup rows and is what
   every billing callback calls next;
3. clamps the store in each of the six fragments that caches the extra
   (`$a`/`$c`/`$e`/`$g`/`$i`/`$l`).

`$b`, `$d`, `$h` and `$k` read the extra and discard it, so they are left alone — the scan tells
them apart by the type of the first field store after the read (object vs `int`), which is also
why upstream's "first int field" heuristic would have failed on `SetupActivity$d` (no `int` field
in 2.4.0).

### VOD artwork on 4K screens

The VOD screens (`MoviesActivity`, `SeriesActivity`, the details and the player) draw a
full-screen background loaded through Glide, with `movie_image_background_*` and
`series_image_background_*` as the requested size. The stock values are `2000dp` square, so on a
4K TV at 640 dpi (density 4) Glide decodes an 8000 x 8000 ARGB bitmap — 256 MB. Android refuses
to draw it (`Canvas: trying to draw too large(256000000bytes) bitmap`) and force-finishes the
activity, which looks like Movies/Series bouncing straight back to the previous page.

The patch caps those four `dimen` values at `960dp` x `540dp` in an internal resource patch.
That is still 3840 x 2160 at density 4, so a 4K screen loses nothing, while the bitmap drops to
32 MB. It was reproduced on the 3840 x 2160 / 640 dpi emulator (crash before the cap, both list
screens render after it).

## Verification

Static:

- `tools/verify_fingerprints.py` resolves every Sparkle anchor on the 2.4.0 APK (25 checks).
- The bundle was applied with `--validate` (10 classes mutated: `kh/x`, `MainActivity`,
  `LibUtils`, `SetupActivity$j` and the six setup fragments `$a`/`$c`/`$e`/`$g`/`$i`/`$l`), and
  the new DEX was read back with `apktool`/`dexdump` to confirm each injection (`const/16 v0, 0x1;
  return v0` in the gatekeeper, `const/16 p1, 0xff` in `MainActivity.K`, `startup_time = 1000` +
  `apply()` in `onCreate`, the `z0 = 0xff` writes in `SetupActivity$j.g1` and `.e2`, the
  `const/16 .. 255` before each setup fragment's mask store, the `LibUtils` constants, …).
- The four VOD background dimens read back as `960dp` x `540dp` from the patched APK
  (`aapt2 dump resources`).

Device (Android TV emulator, `sdk_google_atv64_x86_64`, API 36, x86_64, real Stalker + m3u
source, no Play Store and no purchases; the physical-device pass is still pending):

- Cold start reaches the setup flow (`SetupActivity`) with no crash, no
  `IncompatibleDeviceActivity` and no unknown-signature warning.
- `Setup input sources` → `Add new source` opens the source-type list (Playlist m3u, Xtream
  Codes, HDHomeRun, Stalker, Plex, Tvheadend, …) with no purchase prompt.
- `liblibutilsJNI.so` loads from the patched APK.
- **Live TV plays**, and **multiple XMLTV EPG sources** can be attached to one input source.
  This needed the setup-fragment mask fix described above; before it, the second guide row was
  greyed out as *"Add XMLTV epg (Purchase Sparkle TV Plus)"*.
- **Timeshift works** during playback (pause/seek into the buffer). This is worth calling out:
  timeshift has been reported broken in other patched Sparkle builds. This port only satisfies
  the licence decision (`kh.x.e`, the `0xFF` mask and `LibUtils.u()` returning its `0x8` flag);
  it never touches the timeshift session/buffer classes (`th.*`), so that path stays stock.
- `logcat` shows no `FATAL`/`AndroidRuntime` errors and no timeshift failures during the above.
- **Movies and Series open and render** on the 4K (3840 x 2160, 640 dpi) emulator. Before the
  artwork cap both were force-finished immediately with `Canvas: trying to draw
  too large(256000000bytes) bitmap`; after it the list screens show their category rails and
  posters. (The *Response code: 401* on the live channel in that run is the test source, not the
  patch.)

The billing-failure path (`SetupActivity$j$c.z0(I)`) is **not** exercised on this emulator because
Play is absent. The patch re-asserts the root mask in `e2` so that path cannot re-lock the setup
wizard, but the claim needs a physical device with Play installed; a physical-device pass is
pending.

Not yet exercised: VOD playback (the Movies/Series list screens now open, but titles were not
played), DVR/recordings (scheduling and playback), multiview, and category/EPG editing — also left
for the physical-device pass.

## Port notes

Ported from the `slight-patches` upstream patch, which targets 2.3.1 only. The 2.4.0 drift was
mechanical (obfuscated names) plus one architecture change (the mask distribution moved from
`MainActivity.H(int)` into the billing path around `MainActivity.K(int)` and the fragment
callbacks). Anchors here are structural — gatekeeper by signature, `MainActivity.K` by its
`sync_internal` literal, `LibUtils` by `libutilsJNI` — so the next update should need fewer
re-derivations than the upstream file did.
