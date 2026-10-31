# Maintaining the latest NuvioTV patches

The reviewed app contract lives in
[`contracts/nuvio/native.properties`](../contracts/nuvio/native.properties).
It supplies the package/version, original APK/hash, native class names, shared
field/method names, composed DEX references and exact body fingerprints.
There is one active contract, currently beta.9. This does not add historical
version adapters or automatically enable unverified app versions.

## What is generated

The `:nuvio-contracts:generateNativeContracts` task produces `NuvioNative.java`
inside that module's ignored build directory. A `class.PLAYER_STATE=ab.nm`
entry produces both `PLAYER_STATE_NAME` (`ab.nm`) and `PLAYER_STATE_TYPE`
(`Lab/nm;`). `${KEY}` references compose method/field descriptors from the same
entries. For example, changing the player-state class updates its descriptors,
reflection names and runtime bridge field references together.

Patches and runtime modules compile against the same generated constants.
The constants are inlined; the contract library is a compile-only dependency
and is not bundled into the APK. Builds reject duplicate keys, unknown template
keys, circular expansions and invalid constant names. Generated files should
never be edited or committed.

The shared settings extension contains one stable `NuvioAccess` API. Before
any feature executes, the settings patch validates all eight referenced public
instance fields and rewrites the accessor methods to null-checked direct DEX
casts/field reads. These cover current video/season/episode, next episode,
playback error, and profile/stream/tracking Hilt providers. Runtime consumers
use stable method names instead of reflecting on those obfuscated fields.
The Java implementations in the contract module are used by host fixtures;
packaged-bundle tests require the direct DEX implementations in the APK.

## Structural hooks

Current-stream labeling finds the native remembered-title cast and effective
session-flag branch, deriving both registers. Preferred-add-on selection finds
the native selector invocation, result branch and native manual/resolved-session
receivers. Its reuse hook finds the setting read followed by its boolean branch.
Constructor and selection parameter registers come from the actual method frame.
IntroDB/customization use the actual lambda parameter registers as well.

Those hooks no longer depend on instruction positions 142, 340 or 736, or on
copied local-register numbers. Missing or ambiguous anchors fail before mutation.
Exact signatures/body hashes and feature-specific register/availability guards
remain intentional safety checks. Update them only after reviewing real DEX;
an anchor match alone does not prove unchanged behavior.

## Inspecting the next original APK

Run from the repository root:

```powershell
.\build-local.ps1 :patches:reportNuvioUpdate '-PnuvioCandidateApk=E:/Morphe/OriginalApps/NuvioTV-next.apk'
```

The candidate path must point to an original APK. The report verifies the
reviewed baseline SHA-256 and examines every DEX in both APKs. It writes
`patches/build/reports/nuvio-update.md`, without editing any source or widening
compatibility. Omitting the property compares the reviewed original to itself.

The report provides normalized structural class matches, ranked candidates for
changed classes, ambiguous matches, and missing explicit method/field contracts.
It also suggests player-state fields using named `toString()` labels, and Hilt
provider fields using the native provider's returned casts. Suggestions require
unique class/semantic matches. On beta.8 itself, eight utility classes have
ambiguous normalized shapes; the report deliberately keeps them unresolved.

After confirming the new manifest/package/version and reviewing candidate DEX:

1. Update the active contract's original path/hash, version and proven symbols.
2. Review changed method bodies and actual native behavior. Refresh fingerprints
   and feature-specific guards where justified; adjust hooks for real UI or
   behavior changes. Update the latest independent runtime fixtures as needed.
3. Build and run the verification entry point:

   ```powershell
   .\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList :patches:verifyNuvioLatest
   ```

4. Rebuild the original with the Morphe CLI and verify the actual APK. The
   aggregate task applies six standalone selections and all thirteen behavior
   patches together; side-by-side manifest identity is checked on the full rebuild.
5. Test native playback, remote focus, settings/profile persistence and launcher
   publication on the device. Host and DEX verification cannot establish device UI behavior.

`verifyNuvioLatest` currently selects the dedicated beta.9 fixtures. When replacing the
reviewed target, point it to that target's fixtures; preserve historical fixtures
without extending them. Run Gradle invocations sequentially to avoid competing
resource builds on Windows. Do not manually bump the patch-bundle release version.

## Verification of this refactor

`verifyNuvioMaintenance` checks original provenance and all centralized full
references. It moves instructions and changes a title register in real DEX,
checks that anchors still resolve, and rejects missing/ambiguous anchors. It also
verifies atomic bridge validation, duplicate rejection, and DEX write/reload.
The packaged verifier checks every bridge body, resolves bridge calls, and
rejects accidental packaging of the compile-only constants class.

No app feature or default is changed by the refactor. Behavioral/UI changes in
future releases still need inspection; the new workflow reduces repeated symbol
edits and makes the remaining differences visible.

Validation completed against original beta.8 on 2026-10-22:

- `:patches:buildAndroid`, `:patches:generatePatchesList`, and
  `:patches:verifyNuvioLatest` passed. After deriving the IntroDB/customization
  parameter registers, the focused hook verifiers, maintenance verifier and
  packaged bundle verifier passed again.
- `:patches:reportNuvioUpdate` produced 115 unique class matches, eight ambiguous
  classes and zero missing explicit native references on the reviewed original.
  All five player-state field hints and three Hilt provider hints matched DEX.
- The Morphe CLI rebuilt all fourteen patches with zero failures.
  `:patches:verifyNuvioPlaybackApk` passed against that APK, including direct
  accessor bodies/calls, 17 playback hooks and unchanged cross-DEX findings
  (the original has 36 optional-library findings).
- Alignment, clone-owned authorities/permissions and all 108 original native
  library hashes passed. The APK remains unsigned; it was not installed or
  device-tested. The release version remains `0.12.0`.

Artifacts:

- `patches/build/libs/patches-0.12.0.mpp`.
- `../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-menu-fix-unsigned.apk`.
- `patches/build/reports/nuvio-update.md`.
- Local verification logs under `../.inspect-nuvio-beta8/refactor/`:
  `all-verification.log`, `final-bundle.log`, `apk-verification.log`,
  `rebuild.log` and `rebuild-result.json`.

## Menu regression follow-up

The device log revealed remaining hardcoded calls to the old Compose state
factory. All affected settings and badge state creators now use
`STATE_FACTORY_METHOD`. Latest-version host fixtures independently model
beta.8's `t(Object)` and the incompatible `s(long)` method, so the obsolete
call can no longer pass those fixtures. `buildAndroid`, `verifyNuvioLatest`
and final APK verification passed again after the fix. The CLI rebuilt all
fourteen patches without failures; alignment and all 108 native library
comparisons passed. Device confirmation of the corrected menu remains pending.

The final logs are `../.inspect-nuvio-beta8/menu-fix-latest.log`,
`menu-fix-apk-verification.log`, `menu-fix-rebuild.log` and `menu-fix-result.json`.

## Beta.9 migration

See [NuvioBeta9.md](NuvioBeta9.md). R8 split several utility classes: poster images and styling, tracking-source selection and its Compose wrapper, and rounded/inline icons need distinct owners. Review exact methods and semantic fields, rather than accepting the highest class similarity score. Navigation destinations, card captures and plugin requests also changed field names. Controls/pause-overlay timers must be traced through their jobs and callers; matching an existing method name or a similarly shaped timer is insufficient.
