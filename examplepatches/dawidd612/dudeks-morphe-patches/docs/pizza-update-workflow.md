# Good Pizza, Great Pizza update workflow

Keep compatibility changes small, but only publish a target after its initialization resources and runtime behavior are verified. Adding a version number does not port the existing native bootstrap.

## Automatic intake and unprotected inputs (2026-10-29)

Use [the APKMirror download procedure](apkmirror-download.md) and
`scripts/apkmirror_download.py` before asking for a manual download. Its HTTP
fallback means the agent must complete the normal browser flow and verify the
actual file; it is not a request for the user to download it. The procedure was
verified on the complete standalone 5.59.2 (2337) APK, including the intercepted
Google vignette and a successful download event.

The inspector and preservation audit accept full standalone APKs as well as
APKM/XAPK. In an explicitly unprotected profile such as 5.59.2, retain the
original SDK/native startup. Zero protected callers/string holders and absent
PairIP classes must be established from the actual input; do not attempt an
unnecessary capture or supply another version's bootstrap. Old protected
profiles still require their matching recovered initialization. The optional
short-notice patch adds one focused forced-update check to the normal smoke;
it does not revive the historical full runtime matrix.

## Shared profiles (5.57.3 and 5.58.0)

All three Pizza patches obtain their Morphe targets and bootstrap selection from
`patches/src/main/resources/pizzabusiness/profiles.txt` and each directory's
`profile.properties`. The package's manifest version and code select one profile
for bytecode, native initialization and MicroG resources. No global current-version
state is shared across patching sessions.

Each directory owns `strings.tsv.gz`, `sdk-receivers.dex`, `arm64-init.delta.gz`
and `funds-store.delta.gz`. Both native deltas carry their exact input/output
hashes. Store offsets and hashes no longer need duplicate Kotlin changes.
The first delta reconstructs initialization; the second contains only reviewed
store visibility edits. Unknown native binaries are not patched with another
version's reconstruction.

Games transport clients are found by service action and inherited contracts;
reward request/readiness Runnables are found through their gateway/callbacks;
the Tapjoy connection worker is found by receiver behavior. The Context assignment
supports both a real Context field and R8's Object field preceded by a Context
cast. The previously verified 5.57.3 executable/asset output remains byte-identical.

Generate a read-only comparison before porting a new archive (APKM or XAPK):

```text
python scripts/inspect_pizza_update.py NEW_INPUT --previous OLD_INPUT --morphe-cli tools/morphe-desktop-1.17.0-all.jar --output artifacts/pizza-update/report.json
```

The report audits every archive entry and split, records manifest identity,
native hashes, SDK versions, initialization counts and discovered roles, and
compares them with the bundle's profiles. A matching profile still requires DEX,
asset and runtime verification. A new native hash requires a new initialization
capture even if Java gateway discovery succeeds. Structural matching does not
recover new PairIP state by itself.

Compare protected method signatures, not just their count. In 5.58.0 a Tapjoy
14.6.0 connectivity receiver became protected while another receiver stopped being
protected: both builds still had 20 VM callers. The original four-body recovery
crashed during offline Activity recreation; adding the exact Tapjoy receiver
removed that reproduced failure. Never replace a receiver with an empty body.

The next reproduced failure was the protected Google ProviderInstaller async
task used by Chartboost. The exact Google play-services-basement 18.10.0 task is
restored too: it still invokes the real provider installer and reports its actual
success/repairable/unavailable outcomes. R8 bindings are recorded in
`docs/pizza-5580-provider-remap.properties`; the inlined exception getter reads
the same error-code field. No authentication result or license response is made up.

After compiling the verification tools and converting the matching Google AAR
with D8, generate that method alongside the receiver bodies:

```text
javac -cp "tools/morphe-desktop-1.17.0-all.jar;artifacts/pizza-update/tools" -d artifacts/pizza-update/tools scripts/RecoverPizzaProviderSdk.java
java -cp "tools/morphe-desktop-1.17.0-all.jar;artifacts/pizza-update/tools" RecoverPizzaProviderSdk OFFICIAL_GOOGLE.dex BASE.apk RECEIVERS.dex PROFILE/sdk-receivers.dex docs/pizza-5580-provider-remap.properties
```

Review the bindings against the new input; do not reuse another R8 layout blindly.
The legacy filename `sdk-receivers.dex` now contains minimal recovered SDK methods,
including this task. The original post-execute listener callbacks stay untouched.
For 5.58.0, a real provider installation returns 0 and injected SDK failures
return their original codes 17 and 2. These checks do not replace full plain
startup/reboot tests or account authorization.

After converting the matching official SDK AAR `classes.jar` with D8, generate
the minimal receiver resource and validate its referenced methods/fields:

```text
javac -cp tools/morphe-desktop-1.17.0-all.jar -d artifacts/pizza-update/tools scripts/ExtractPizzaSdkReceivers.java
java -cp "tools/morphe-desktop-1.17.0-all.jar;artifacts/pizza-update/tools" ExtractPizzaSdkReceivers BASE.apk PROFILE/sdk-receivers.dex SDK1.dex SDK2.dex
```

Use the platform classpath separator (`:` on Linux). Existing reviewed receiver
DEX may be included as an input when its exact SDK version remains unchanged.
Inspect protected methods without a matching SDK separately. The extractor does
not grant rewards, replace authentication, or recover a native bootstrap.

For a local build, use `:patches:buildAndroid :patches:generatePatchesList`.
Gradle passes the current bundle path explicitly to the metadata generator;
older MPP files in the build directory cannot select an older patch list.
Verify generated version, all three Pizza patches, targets and ABI declarations
against the built candidate.

For new native captures, use the ELF-driven reconstruction tool:

```text
python scripts/reconstruct_pizza_capture.py EVIDENCE --first-run FIRST --second-run SECOND --output artifacts/pizza-update/reconstructed --ifuncs REVIEWED_IFUNCS.json
```

Its help describes the capture filenames. It derives PT_LOAD layout and DT_INIT
from the original ELF, checks the full lengths and independent ASLR observations,
and validates external imports against both runs' module mappings. System libraries
must be the exact copies from the capture device. Unresolved IFUNC targets require
an explicitly reviewed module hash, target offset and symbol; no process address
or guessed fallback is written. 5.58.0 reproduction is byte-identical to the
reviewed reconstruction. The older `reconstruct_pizza_native.py` remains only for
reproducing the differently named historical 5.57.3 capture, not porting new builds.

## Intake

1. Obtain the clean, publisher-signed APK/APKM/XAPK. Keep APKs, logs, account data and signing keys out of Git.
2. Record the archive SHA-256, package name, manifest versionName/versionCode and all split names. Validate every ZIP entry and retain the asset, ARM64 and density splits.
3. Record the SHA-256 of ARM64 libcocos2dcpp.so. Compare it with the input hash in the matching PZB2 native delta, not merely the previous archive hash.

## Minimal update decision

- If the native input hash and every bytecode/bootstrap guard still match, reuse those proven resources, add the explicit target and run the existing verifiers.
- If the native hash differs, retain the old target and guards. Capture initialization from two independent runs of the new original signed build on a disposable ARM64-capable test device/emulator. Reconstruct the new library with scripts/reconstruct_pizza_capture.py and generate its delta with scripts/build_pizza_native_delta.py.
- Capture and compare the new build's static string initialization. Recover SDK receiver bodies only from the exact matching official SDK artifacts.
- Store new initialization resources in a version-specific directory; select them by an explicit target mapping. Update only changed fingerprints and layouts. Never apply the old delta to a different library or substitute the entire old game library.
- Inspect HidePaidOffersPatch.kt separately: its native hash/layout checks also require validation against the newly reconstructed library.
- Encode the reviewed visibility-only result with `build_pizza_native_delta.py RESTORED_LIBRARY HIDDEN_LIBRARY PROFILE/funds-store.delta.gz`; use the same exact-hash reconstruction format. Add the profile directory to `profiles.txt` only with its manifest version/code, startup program and matching SDK resources. Keep the new target experimental until its runtime matrix passes.

## Verification and publication

1. Build the source bundle and patch the complete clean input.
2. Run the bootstrap, reward DEX, integration DEX and all-split asset/library verifiers. Review only the intended native changes.
3. Install with the existing test key without clearing user data. Use a disposable environment for clean-install testing.
4. Verify repeated launch, force-stop, reboot, background/resume, offline/recovery, gameplay, rewards, genuine Google Play Games/TapBlaze authorization and saved-progress persistence.
5. Record evidence and exact remaining blockers in docs/pizza-project-context.md. Commit and publish the release only after the new target passes; static checks alone do not establish runtime success.

