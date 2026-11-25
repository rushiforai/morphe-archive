# Personal libraries in Gearslip

Investigation date: 2026-11-02. Status: both Morphe patches implemented and prepared for development release. Automated and accountless Android checks pass. The user will perform signed-in device acceptance after the dev release; account-bearing phone installations were preserved.

## Findings

| App | Supplied input | Installed on CPH2747 | Observed Gearslip result |
| --- | --- | --- | --- |
| Myspoti | stable 2.3.0 APK | 2.2.0, code 1116 | `root=empty` |
| YT Music Morphe | 9.30.53, code 93053240 | Exact same APK bytes | `root=app.seb3thehacker.gearslip`; screenshot shows empty top level |
| Gearslip | Source checkout | 0.3.31-alpha, code 13 | Successfully binds to both music services |

Evidence is saved under `.analysis/gearslip-personal-library/`. `artifacts.json` records input hashes and signer certificate hashes; `gearslip-logs/` contains the pulled existing phone logs. The two supplied screenshots show the UI symptom. Reading the phone logs did not require replacing any app or signing out.

### Myspoti

The sibling Myspoti checkout's `base/host-android/src/main/kotlin/app/myspoti/host/android/PlaybackService.kt` implements `MediaBrowserServiceCompat`.

- `onGetRoot` verifies that the claimed client package belongs to the supplied UID, then calls `mayBrowse`.
- `mayBrowse` permits the app itself, `ALLOWED_BROWSERS`, and system apps. Gearslip is absent from `ALLOWED_BROWSERS`.
- An unlisted client receives `BrowserRoot("empty", null)`. `onLoadChildren` and `onSearch` also enforce caller permission, so changing only the returned root is insufficient.
- `AutoBrowser.kt` already implements Home, Library, Downloads, liked songs, playlists, albums, artists, search, and playback in context using the app's account session.
- The supplied 2.3.0 APK contains the same permission structure in `PlaybackService.c(int,String)`, `k(String)` and the children callback. Several JADX methods emit errors; use source and DEX together rather than treating failed decompilations as source code.

The phone's saved log `gearslip-20261102-043357.log` records Myspoti `root=empty` at 05:41:32.568, 05:48:46.451, 05:50:56.646, 05:51:34.425 and 05:52:04.846. This corroborates the caller restriction on the installed 2.2.0 app. It does not establish that an allowlist change alone passes account-content and playback tests.

### YouTube Music

The installed APK and supplied desktop APK both hash to `0080f770cf53c3f0af5c30137348afff43801f173e723b66530042eecf539855`.

The actual emitted-DEX inspector passes for both inputs:

```sh
python3 scripts/ytmusic/verify_gearslip_dex.py INPUT.apk --dexlib-classpath .tools/morphe-desktop-1.19.1-all.jar
```

The APK already contains `patches.ytmusic.GearslipSupport`, configured for `app.seb3thehacker.gearslip`, and wrappers around `kyh.g` (UID ownership) and `kyh.i` (browser eligibility). `kyh.h` uses that eligibility result. The phone log records a successful nonempty root ID for Gearslip repeatedly, including 05:40:17.975 and 05:42:10.313. Reapplying this host-access patch alone is not a demonstrated solution.

Trace in this exact APK:

```text
Gearslip CarMedia.connect
  -> MusicBrowserService.a(package, UID, hints)
  -> kyh.g caller policy / kyh.h browsability
  -> root named app.seb3thehacker.gearslip
  -> Gearslip MediaBrowser.subscribe(root)
  -> MusicBrowserService.c -> llc request
  -> kzu.c account / browsability / consent checks
  -> ldp.d content supplier
  -> existing AndroidAutoPatch.handleBrowseRequest
  -> lgs / lip content fetching
  -> llc.c -> AndroidAutoPatch.handleBrowseResult
  -> browser result callback
```

Two additional compatibility gaps are statically visible:

1. `awir.a` creates the generic `awis` client for Gearslip. `awjm` has explicit predefined-client capability predicates and request-type mapping; arbitrary names retain the default request type and miss the predefined capability branches.
2. This APK already includes Morphe personal-library enhancements in `app.morphe.extension.music.patches.AndroidAutoPatch`. They use the phone session and `FEmusic_library_landing`, but root-tab initialization matches only `com.google.android.projection.gearhead`. Gearslip's returned root has a different ID. Existing Home and Library IDs are initialized only after a two-item result under that Android Auto root.

The second gap prevents these enhancements from initializing for the observed Gearslip root. Neither gap is yet proven to be the sole cause of the original empty result. Network responses, the exact root-result list and signed-in playback were not instrumented in this run. Preserve that distinction when implementing the fix.

Gearslip's UI sets `unavailable = path.isEmpty() && children.isEmpty()` and displays “keeps its library to itself.” For YT Music this wording is stronger than the evidence: an empty root result alone does not prove deliberate access denial.

## Proposed implementation for review

Use per-app Morphe patches and reuse each app's existing account session. Keep Gearslip's authenticated Android package/UID identity throughout the service boundary.

- **Myspoti:** add the configured Gearslip package to the shared browse predicate used by root, children and search. Retain UID/package ownership checks and all unrelated-client behavior. Add manifest package visibility where needed. Locate the predicate structurally from the browse callbacks and rejection diagnostic, with a clear failure for an unrecognized APK layout.
- **YT Music:** extend the current patch with a Gearslip content adapter. First capture root and children results. Reuse the existing phone-session library machinery when its contracts are recognized, initialize Gearslip's Home/Library root, and preserve playback commands and pagination. Treat capability mapping as a separate content concern from caller authentication. Do not merely return an invented folder list that cannot load or play its children. Support the supplied 9.30.53 input first; broaden compatibility only after equivalent evidence.
- **Manager:** expose clear app-specific patch selection and trusted-host options. Do not promise a universal one-switch browser unlock. Preserve existing release automation and leave stable promotion for separate user confirmation.

An upstream Myspoti allowlist addition would also fix its source build, but a Morphe patch meets the requested Manager workflow. A separate account client in Gearslip would duplicate login, library and playback logic and is unnecessary for these apps' existing browse implementations.

### Acceptance checks

1. Patch the exact supplied APKs successfully; inspect emitted DEX and verify unrelated-client rejection and spoofed-UID rejection.
2. Confirm Manager can load/select the generated patches and produce signed installable APKs.
3. Use a matching signer for an in-place phone update, or a separate test installation with its own login. Do not uninstall the existing account-bearing apps to obtain a test result.
4. In Gearslip, open the signed-in user's library, a real personal playlist, and liked/saved items; verify titles and contents against the phone app.
5. Select an item from Gearslip and verify playback, pause/resume, next, and queue/context where supported. Check search and returning to the library, including cold reconnect.
6. Record APK identities, actual caller/root, content results and device evidence. A policy fixture or green build alone does not complete these checks.

Signer verification in this run: Myspoti 2.2.0 and supplied 2.3.0 share publisher signer `2b8f54daf60ce32cee1ab9206553c7e5741e96f2f32efdf2545758bf210a2c41`. Installed Gearslip and YT Music share signer `8a47c1bacd4161681c22797ce63c240ae706a5e69778bebde95c7c5fe8b0c4e5`. This comparison does not prove possession of either signing private key.

## Verification completed in this investigation

- Fingerprinted both supplied APKs as native Android; JADX 1.5.6 and Java 21 available.
- Pulled the three installed APKs and existing Gearslip logs without changing installations.
- Compared SHA-256 and verified APK signer certificates.
- Passed emitted-DEX verification for supplied and installed YT Music.
- Passed `python3 -m unittest tests/test_gearslip_ytm_policy.py` (one runner test containing the Java policy assertions). These checks cover caller policy, not personal-library delivery.
- Read Myspoti source and targeted APK classes; traced YT Music caller admission through content/result handling.

## Implemented patches and development validation

- **Myspoti — Gearslip personal library:** wrap the shared browse permission predicate while preserving its original implementation and both original UID ownership checks. Discovery also follows the search callback when R8 inlines it into the compat dispatcher. The patch declares 2.2.0 / 1116 and 2.3.0 / 1121; strict patching/rebuild passed against both actual inputs.
- **YT Music — Gearslip personal library:** add Home and Library roots for the configured captured browser. Read the request's actual `RemoteUserInfo` package, retaining the original service authentication. Delegate Home to the existing `HomeLoad` and expose the existing native library folder IDs, preserving their personal-content loaders, playlist pagination and encoded playback commands. Support is restricted to the supplied, already patched 9.30.53 / 93053240 APK with the required Morphe adapter. The prior admission patch remains unchanged.
- The two patches share a public name but have different app compatibility metadata. Metadata generation confirms each app's selection and trusted-host option.
- Select only **Gearslip personal library** when repatching the supplied YT Music APK. Its default-on **Gearslip music browser support** patch is already applied and must be deselected.
- `:patches:test` passes 27 tests. `:patches:buildAndroid` and `:patches:generatePatchesList` pass. The Python suite passes 415 tests, with 45 skips. The production library router has 12 JVM assertions in addition to the existing 15 caller-policy assertions.
- Accountless API 36 Android fixtures retain each emitted DEX and input resources byte-for-byte, with a minimal manifest and no account providers, exported browser or Internet permission. Both Myspoti 2.2.0 and 2.3.0 pass 6 checks each, including unchanged unrelated-client decisions and forged-package rejection. YT Music passes 26 checks, including actual two-tab construction, seven native library categories, unrelated-client fallback, the captured caller accessor and native Home loader start/completion without an account. Runtime evidence is in `runtime-hook-checks.json` under the local analysis directory.
- Independent read-only review found no code blocker. Its patch-selection documentation finding was addressed in both languages.

The user explicitly requested publication to `dev` and will test device behavior afterward. Manager installation/signing, signed-in playlist contents, actual playback, queue behavior, search and cold reconnect remain acceptance checks; the automated results above do not establish them. Stable promotion is not authorized by this instruction.

## Verified development publication

Published [v1.27.0-dev.2](https://codeberg.org/JohninNL/nl-morphe-patches/releases/tag/v1.27.0-dev.2) from feature commit `5b333f79e55763aac4ad2d3c9d4feae68550ef70` and generated release commit `a80b44c0107a6e9d7de909282a90206788e20ae9`. The [Release workflow](https://codeberg.org/JohninNL/nl-morphe-patches/actions/runs/41394444912) and [Release safety](https://codeberg.org/JohninNL/nl-morphe-patches/actions/runs/41394444977) both passed. Both commits and the GitHub release use the required johninnl identity.

The dev branch manifest advertises 1.27.0-dev.2 and its uploaded `.mpp` asset with the unchanged source public key. The downloaded bundle SHA-256 is `69a463def03c7711ce1463d4a6a3dc22c1dda838af34e628c90b56b0ff9a6aa0`, matching GitHub's asset digest. All nine new patch-class/extension payload entries are byte-identical to the locally tested build. Strict patching and rebuilding with the downloaded published bundle passed again against the supplied Myspoti 2.3.0 and already-patched YT Music 9.30.53 APKs.

The development release is ready for the user's signed-in device test. No account-bearing phone app was replaced by this work.
