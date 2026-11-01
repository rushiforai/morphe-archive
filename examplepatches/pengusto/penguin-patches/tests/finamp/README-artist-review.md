# Artist-page review backport

The **Load artist pages faster** selection (bit 4) follows
[Finamp PR #1832](https://github.com/finamp-app/finamp/pull/1832), including the
`AsyncValue` review revision `e53f3cebb07d81b124289c4d5a404f979fe10b8e`. It targets the original official
Finamp 1.0.1 universal APK and pinned engine described in
[FINAMP_NATIVE.md](../../docs/FINAMP_NATIVE.md). Outputs are ARM64 only.
The [source diff](../../docs/patches/finamp-1.0.1-artist-asyncvalue.patch)
adapts the revision to the earlier 1.0.1 Artist source, including a localized
error-state test. The documented loading and error behavior is unchanged.

The count uses one bounded `ArtistIds` union query, including album-artist and
track-artist credits without adding overlapping totals. The header retains its
music row while loading or after an error. Download status counts direct album
and track links; the large-download warning uses the actual union track count,
including guest-only artists. Complete enumeration remains an on-demand playback
or download operation. Count errors do not silently start a download.

## Exact source and native composition

[native-sources.json](native-sources.json) records 128 complete source trees.
Update all 64 masks containing bit 4 and retain the published Player release's
other 63 nonempty payloads byte for byte. Every affected source includes the
already tested Player feature when bit 32 is selected. The checked-in
[review diff](../../docs/patches/finamp-1.0.1-artist-review.patch) applies to the
previous Artist trees. Masks containing both bits 4 and 8 also apply the small
[generated hash correction](../../docs/patches/finamp-1.0.1-artist-offline-codegen.patch).
The latter repairs a pre-existing offline-provider debug hash and does not add
an optional feature or change release behavior. Replay both diffs to the exact
tree hashes before publishing.

Use the pinned Flutter 3.47.2 / Dart 3.13.2 SDK. Regenerate localizations before
source tests. The source tests resolve localized labels rather than assuming
the spelling from current redesign. Run targeted tests for masks 4, 12 and 36,
the complete 127 tree, analysis and code generation. Keep their counts as
overlapping runs, rather than summing them as unique tests.

Run `validate_bundle.py` over all 127 shipped deltas, `patch_matrix.py` over all
127 real Desktop selections, and `reject_inputs.py` over all four altered inputs.
Keep source/output hashes and retained-entry receipts. Every retained original
APK entry except ARM64 `libapp.so` must remain identical; other ABIs are removed.

## Installed APK probes

Use a separately owned disposable AVD and fixture port when another acceptance
task owns the historical `penguin` emulator. `isolated_android.py` validates the
target descriptor and retains the emulator, package, viewport and output guards.
Only one UI controller may use a target at a time; the wrapper enforces this with
an exclusive target lock, including while a yielded host command is still running.

After a real Manager export and same-key Android update:

```sh
python3 -B tests/finamp/isolated_android.py --target "$TARGET" \
  artist_review_acceptance --adb "$ADB" --out "$FRESH_OUT" \
  --native-report "$NATIVE_REPORT" --mask 4
```

This independently hashes the installed native snapshot and engine, requires
the preserved synthetic login, holds/rejects only the count request, verifies
Loading/Error without a false zero, stable album-row bounds and no unbounded
fallback, then checks the downloaded media hashes. The compiled English APK says
`Loading...`. The release API isolate serializes requests: a held count can delay
the second preview request. Provider/widget independence does not establish
simultaneous preview visibility in that installed runtime.

Use `--probe performance` with another fresh output directory for the matched
original/patched comparison while unbounded artist requests are held. The
patched page must show eight tracks and Top Tracks with no held request; the
original must issue a held full-track request. Preserve raw PNG/XML and HTTP
receipts at identical 1080×1920, density 320, English, Dark theme, library, sort,
download state and demo clock 09:41. These are query-behavior checks, not a live
Jellyfin timing or RAM benchmark.

Set the download warning threshold to four through the UI before the baseline.
For synthetic **B Guest**, verify six tracks and zero album-artist albums, then
open Download: the patched dialog must warn about six tracks. Cancel it so the
existing download baseline remains unchanged. `--probe guest-warning` automates
this observed header/dialog path and records the absence of full-track queries.

## Actual Manager and persistence matrix

Use official Manager 2.2.0 / Patcher 2.0.1, normal source import/refresh, original
APK selection and the disposable update key. Verify the cached MPP bytes, all
seven catalogue defaults off and unrelated universal selections 0/5. Use the
[Manager controls](README-manager.md) to run JVM masks **4,12,36,127,123** and ART
masks **4,127**. Record a fresh runtime log and independent export for each.
Set `JAVA_HOME` to the installed Java 21 runtime before calling `manager_case.py`;
its signer preflight now rejects a missing host Java runtime before patching.
The helper also verifies the actual Android Save breadcrumb before writing;
the source-search location does not establish the later export destination.
Run `verify_manager_outputs.py --suite artist-review` to require all seven
cases; an explicit `--expect` subset remains marked incomplete. Verify
native/output hashes, retained entries, certificate, uncompressed native
libraries and 16 KiB ZIP alignment. With ART, fault the guarded original cache
and require a visible failure through the selected Artist patch, restore the
exact input and run a fresh successful recovery.
The independent verifier accepts `--expect 4-art-recovery` for that separate
export; a recovery case alone does not satisfy the full seven-case profile.

Install through Manager and confirm Android UPDATE when it is shown; an existing
installer owner can complete later updates directly. Record the observed path
and verify installed bytes against each export. If Android shows Morphe's
**Allow from this source** page, use the guarded Manager UI command
`--package com.android.settings ensure-install-source`: it reads the checked
state before changing it and verifies the actual install permission. An already
active control must remain on; Android can return to the installer immediately
after enabling it.
Test original → Artist → all → all except Artist → original → all with
the same key. Require existing login, Dark theme, warning threshold and all
eight downloaded WAVs plus their downloaded images. Set Metadata order in the
all-feature build, then verify its auxiliary primitive Hive preference survives
removal and reapplication. Do not repair a lost preference during inspection.
Use `artist_persistence.py` through the same isolated wrapper after each update,
with `--baseline-downloads` pointing at the original 22-file hash inventory.
Only the initial all-feature stage uses `--seed-metadata`; subsequent enabled
stages use `--expect-metadata`, and `--aux-baseline` checks the saved auxiliary
box across feature removal and reapplication without editing it.

After release, refresh the public remote source, verify its exact published MPP
hash and repeat a real apply/export/install. Record this separately from local
candidate acceptance. Emulator coverage does not establish physical/OEM-device,
other Android versions or compatibility with any other Finamp APK.
