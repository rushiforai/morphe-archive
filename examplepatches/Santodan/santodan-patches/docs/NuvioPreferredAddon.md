# Preferred source add-on

Current target: **NuvioTV 1.1.0-beta.9 (1072)**. See [beta.9 contracts and verification](NuvioBeta9.md). Version-specific DEX notes, commands and artifacts for earlier versions below are historical; use the beta.9 contract and `verifyNuvioLatest` for the current release.


Select **NuvioTV - Preferred source add-on** for `com.nuvio.tv`
`1.1.0-beta.9` (version code `1072`). Configure it under **Settings > Layout >
Santodan-Patches > Streams**:

- **Preferred source add-on** defaults to **None**. Choose an enabled installed
  add-on that advertises a `stream` resource to schedule its request first in new
  or refreshed native searches and show its returned source group first.
  Other add-ons continue loading concurrently;
  launch priority cannot guarantee which network request finishes first.
- **Automatically play preferred add-on** defaults to off. When enabled with an
  add-on selected, the stream screen plays that add-on's first stream accepted by
  Nuvio's native playability predicate as soon as it is available. It takes
  precedence over ordinary first-stream and regex selection. Native reuse and
  active binge-group selection retain priority.
  If it returns no playable streams, the source picker remains available. Explicit
  manual source selection and searches already resolved by Nuvio do not auto-launch
  again. Next-episode calls respect **Prefer Binge Group (Next Episode)**;
  the source picker also respects **Reuse Binge Group**. Native matching, source
  filters, waiting/timeout and no-match fallback remain authoritative whenever a
  binge-group target is active, even if the preferred provider has already loaded.

Both settings persist separately for each native profile. Selecting **None**
restores native ordering and autoplay behavior. Disabling just autoplay keeps
the preferred request/result order and restores native autoplay rules. Changes
do not cancel or restart searches already in progress. The patch uses native
repositories and search caching; it adds no network client or background observer.

### Beta.8 binge-group correction (2026-10-23)

The previous preferred-autoplay hooks bypassed the native selector before it
could match the current binge group, replaced the source picker's persisted-group
choice, and suppressed native reuse. The beta.8 hooks now forward the selector's
last three arguments (`String, boolean, boolean`, registers 21–23) to a policy
guard. Active binge-group preference or binge-only selection runs the original
selector. The loader forwards its persisted-group argument (register 10) to
`choose`; both a native match and a null result are preserved with an active
group. The native reuse Boolean is preserved. Disabled native binge settings
still permit preferred autoplay. All providers continue their existing concurrent
search/preload behavior; this correction adds no wait or fetch mechanism.

Original evidence: `../OriginalApps/NuvioTV-1.1.0-beta8.apk`, manifest package
`com.nuvio.tv`, version `1.1.0-beta.8` / `1071`, SHA-256
`7aeae6f64e9128be2c7545c50061376839e20a88d47722ac220ba40be7c182f8`.
All original DEX files were inspected; the unique selector is `Ld9/v1;->e`
and the source loader is `Lgb/a1;->a`. Their existing exact fingerprints and
exception-layout checks remain required. Historical beta.7 hook notes below
describe the original implementation, before this correction.

Correction verification commands (via `build-local.ps1`, with `--offline`):

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:verifyNuvioPreferredAddon :patches:verifyNuvioPreferredAddonRuntime --offline
.\build-local.ps1 :patches:verifyNuvioBeta8Bundle --offline
.\build-local.ps1 :patches:verifyNuvioPreferredAddonApk --offline
.\build-local.ps1 :patches:verifyNuvioPlaybackApk -PnuvioPlaybackApk=../../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-binge-group-priority-signed.apk -PnuvioRequireStability=true --offline
```

The bundle is `patches/build/libs/patches-0.13.0.mpp`. The CLI rebuilt and signed
all sixteen public Nuvio patches into
`../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-binge-group-priority-signed.apk`.
Signature and alignment checks pass, and all 108 original native libraries are
byte-identical. Standalone/combined bundle and rebuilt APK checks find no new
cross-DEX hierarchy issues beyond the original 36 optional-library findings.
No installation or device testing was performed. Reproduce by manually changing
to a non-preferred stream with a binge group, continuing to the next episode with
native binge settings enabled, then checking disabled settings and missing-group
fallback separately. Loading is still subject to native timeout/cache readiness.

The preference identifies an installation by its native base URL. Native stream
groups expose only display names, so autoplay is declined when the selected add-on
is removed, disabled, or shares its display name with another enabled stream provider.
Request ordering still uses the exact installation URL. Rename colliding add-ons
to distinct display names before using preferred autoplay.

The picker excludes catalog/metadata-only add-ons, empty resource lists, and
disabled installations. Eligibility follows the native manifest capability
(`Addon.getResources()` / `AddonResource.getName()` equal to `stream`), rather
than results from a particular title's search. A saved selection that no longer
advertises streams is unavailable and is not prioritized. Catalog-only add-ons
with the same display name do not prevent selection of a real stream provider.
These public getter contracts are validated against the original beta.8 DEX.

The stream-provider filter passed `buildAndroid`, `verifyNuvioPreferredAddon`,
`verifyNuvioPreferredAddonRuntime`, and `verifyNuvioBeta8Bundle` with `--offline`.
The updated signed APK is
`../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-stream-providers-only-signed.apk`;
`verifyNuvioPreferredAddonApk` passed with `-PnuvioPreferredApk` pointing to it.
All 15 preferred-provider hooks resolve, with no new cross-DEX findings.
Signature/alignment checks pass and all 108 original native libraries are
unchanged. This build includes the binge-group fix; it has not been installed
or tested on a device.

## Logcat

Run before reproducing a problem and press Ctrl+C afterward:

```powershell
adb.exe logcat -b main -b system -b crash -v threadtime "ActivityTaskManager:I" "ActivityManager:I" "SantodanPreferred:V" "SantodanCurrentStream:V" "SantodanIntroDB:V" "SantodanMergedProgress:V" "SantodanRemaining:V" "SantodanAiring:V" "SantodanFinale:V" "SantodanSettings:V" "SantodanStreams:V" "SantodanThumbs:I" "ThumbDecode:D" "ThumbWorker:D" "AndroidRuntime:E" "DEBUG:E" "libc:F" "*:S" > logs_patch.log
```

`SantodanPreferred` records errors. Successful selections and autoplay do not
currently emit messages.

## Original input and native contracts

Original: `../OriginalApps/NuvioTV-1.1.0-beta7.apk`, SHA-256
`a35eb5033615018f50f5205dc51f52e526b3b606f7e563943201dfbd7366d1f2`.
The original manifest confirms package/version. All five original DEX files were
searched; inspection notes are under `../.inspect-nuvio-beta7/preferred-*.txt`.
Only beta.7 support is added.

- Instance `Lba/m4;-><init>(I,List,Z,List,Z,List,DebridSettings)V` owns the
  immutable search configuration. It has nine registers: profile `v2`, add-ons
  `v3`, receiver `v1`. A two-argument static callback followed by
  `move-result-object v3` stably reorders the list before it is stored. Original
  `Lba/d5;->g(ContinuationImpl)Object` validates the active profile before creating
  this snapshot; downstream native source jobs iterate its enabled add-ons.
- Static `Ld9/w1;->d(List,List,Set)List` orders result groups. Every object return
  is replaced with the ordering callback, its adjacent result move and the native
  return. Existing branches still target the callback, including empty-list paths.
- Static `Ld9/w1;->e(List,r7,String,s7,Set,Set,Set,String,Z,Z)Stream` has 24
  registers; its stream list is `v14`. An entry guard leaves native behavior intact
  while disabled, otherwise returns a preferred stream using native static
  `Ld9/w1;->b(Stream)Z`. This preserves native external-link/debrid/torrent/server
  playability decisions. No custom playback or stream URL handling is introduced.
- Static `Lbb/u1;->a(List,Set,Lbb/d2;,Ref.BooleanRef,String,String,String,x4,List,Z)V`
  has 50 registers. Original instruction 339 is the common selected-stream null
  branch: selected stream `v9`, flattened streams `v3`, screen `v1`, native resolved
  flag `v2`. Replacing that branch with `choose`, result/cast and the original
  branch lets the preferred source win over inline binge-group choices. The
  callback reads `Lbb/d2;->t:Z` and `Ref.BooleanRef.element:Z` to preserve manual
  and completed-session paths. It returns to the native selection/navigation code.
- Instance `Lbb/u1;->invokeSuspend(Object)Object` reads native last-link reuse
  `Lcom/nuvio/tv/data/local/x4;->d0:Z` into `v1` at original instruction 735.
  A Boolean wrapper suppresses only this shortcut when preferred autoplay is active.
  Static policy `Ld9/w1;->a(x4)Z` and regex-policy `c(String)Z` wrap Boolean returns
  to permit the new autoplay setting without requiring a native autoplay mode.
- Instance `Lq8/e;-><init>(Lm3/a;)V` registers the native singleton component once.
  Providers `B:Lvb/c;` and `Y2:Lvb/c;` expose the native profile manager and stream
  repository. Runtime reads profile `Lg9/e;->f:StateFlow` and installed add-ons
  through `Lba/d5;->c:Lfa/a;`, implemented by `Lba/p;->r:StateFlow`, then uses
  `AddonKt.enabledAddons(List)List`. It reads values without launching collectors.
- UI uses validated `Lab/uh;->a` (18 arguments), `m` (13 arguments) and `j`
  (11 arguments), native `Lab/fi;-><init>(Object,String,String,String,Lm3/n;,I)V`,
  and `Lh1/h;->s(Object)Lh1/t1;`. The native dialog receives explicit 420/320 dp.
  Per-profile Compose states update after settings callbacks; stale callbacks
  check the current profile before writing preferences.

All hook methods require exact descriptors, static/instance status, register and
instruction fingerprints, and original try/handler layouts. The native selector
has a catch-all at code units `358:13 -> 372`; regex policy has `31:13 -> 45`.
The other behavior hook methods have no try regions. Registers and parameter
counts are unchanged. Missing, ambiguous, changed and duplicate hooks fail.

## Verification

From the repository root, using Java 21 and Android SDK platform 36:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList
.\build-local.ps1 :patches:verifyNuvioPreferredAddon :patches:verifyNuvioPreferredAddonRuntime
.\build-local.ps1 :patches:verifyNuvioBeta7SettingsMenuRuntime :patches:verifyNuvioBeta7Bundle
# After rebuilding the standalone APK at the path below:
.\build-local.ps1 :patches:verifyNuvioPreferredAddonApk
```

The focused verifier applies hooks to the original DEX, tests rejection paths,
writes/reloads all changed classes and restores each behavior method to compare
its exact original instructions and exception regions. Runtime checks execute
the production settings callbacks, stable ordering, native playability delegation,
manual/resolved guards, disabled and unavailable add-ons, duplicate names, stale
profile callbacks, profile isolation and persistence. Shared-menu tests include
the preferred patch alone and in combinations. Bundle verification applies the
patch alone and all thirteen Nuvio behavior patches together, checks packaged
extension calls and compares cross-DEX findings with the original.

Device checks remain for Android TV focus and picker scrolling, profile switches,
real request scheduling, native stream startup, no-results fallback, manual
source changes, and interactions with cached/preloaded sessions and next episodes.
Host verification does not establish these device behaviors. Runtime errors use
log tag `SantodanPreferred`; no add-on URLs are logged by the extension.

Artifacts from 2026-10-21:

- Bundle: `patches/build/libs/patches-0.11.2.mpp`.
- Standalone unsigned verification APK:
  `../Apps/NuvioTV/NuvioTV-1.1.0-beta.7-preferred-addon-unsigned.apk`.

Build, metadata generation, original-DEX roundtrip/rejection checks, production
runtime tests and shared-menu combinations passed. Standalone and combined bundle
application passed with the original 36 optional-library hierarchy findings and
no new findings. The CLI rebuild applied the new patch successfully; the rebuilt
APK verifier finds all 15 native hook calls and resolves their extension signatures.
The original binary manifest and all 112 native libraries are byte-identical,
and APK alignment passes. Signature checking confirms the APK is unsigned.
It has not been installed or tested on a device.
