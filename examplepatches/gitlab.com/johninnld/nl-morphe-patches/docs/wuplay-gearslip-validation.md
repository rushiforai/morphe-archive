# WuPlay Mobile Gearslip validation

Implementation target: `app.wuplay.android` **0.1.9-alpha**, version code **9**, minSdk 24, targetSdk 36. This is separate from the existing Android TV catalog-publisher target.

## Inputs and implementation

The publisher-signed input APK has SHA-256 `12cb50e1b53762c0e77d832f42b4ca14faf4ad97a2bfa61e3f6d22c3e6e43642` and certificate SHA-256 `ae406f7d398ae1ae418238f83d07554e6aa6cf5855b66edb9c4c85995d435e7f`. It contains one base APK, two DEX037 files, and six native-library entries.

The patch injects a Gearslip Car App protocol service, native repository/player adapters and a video/caption renderer. The service admits Gearslip by package name resolved from the actual Binder caller UID, including Morphe-re-signed hosts, and publishes shared SDK Binder types. The handshake package must still belong to the caller UID. Video uses an app-owned display/SurfaceView on the host-lent Surface, with no phone mirroring or MediaProjection token. The normal app foreground permissions and a playback wake lock are used; root and Shizuku are not required.

Native profiles, catalog filters, metadata, add-on manifest gates, stream headers, decode filtering, Media3 factory/controllers, audio tracks and subtitle selection are reused. The car session owns its player, requests, PIN unlock and borrowed-surface lifecycle. A retained native snapshot notification pulse drives snapshotFlow controllers when the phone's Compose UI has not initialized its global snapshot dispatcher.

Registration initially returned HTTP 403 after re-signing. The patch preserves the verified input certificate only in the native BuildIdentity registration-metadata constructor; PackageManager signature results and normal authentication remain unchanged. The resulting build registered and created the dedicated emulator validation profile through the native UI.

AndroidX Car 1.8.0-rc01 is packaged with only the missing upstream Core 1.15.0 Person subset, not a replacement Compose/Kotlin/Media3 runtime. Apache 2 notices are included in the bundle and patched APK assets.

## Environment and evidence boundaries

Testing uses an owned Android 16 Google APIs arm64 emulator, app UID 10213, plus the official signed **Gearslip 0.3.31-alpha** car preview. The USB phone was unavailable and the user requested emulator validation instead. No physical head-unit or Bluetooth-audio session is claimed.

A fresh `CarValidation` profile and controlled Stremio add-on are used. Its manifest was fetched by the native repository, then installed through the native authenticated profile-update and sync path. Test media is authored locally: 150 seconds, H.264 video approximately 1.2 Mbps, AAC audio. The media route requires a custom request header; the add-on also provides authored English captions. The local server supports HTTP byte ranges.

The original 60-second fixture triggered WuPlay's unchanged valid-title placeholder-video rejection. Tests were corrected to meet the native duration/bitrate thresholds; that check was not disabled. Gearslip also intentionally consumes the first tap to wake faded playback controls, so UI tests use a second tap while awake.

## Verification

- Gradle patch/extension build and patch unit tests pass. The full Python suite ran 420 tests successfully, with 45 skipped.
- Helper regressions cover stale selections, surface replacement, seek bounds, profile/key/PIN-state transitions, MetaResponse unwrapping, native-batch versus car-page cursors, safe root-preserving stream navigation and host-visible video/caption layout.
- The independent decoded-APK audit preserves all 7,696 original classes and 37,508 original methods except one checked metadata constant insertion. Added classes are restricted to the owned extension, Car SDK and selected Person classes. Original native libraries and DEX037 are retained; license assets are present.
- The exact STRIP_FAST delivery APK passed the normal-UID 10213 instrumentation probe: 141 distinct video frames, 155 decoded audio buffers and 75 frames with the screen noninteractive. Its clock advanced 9,851→12,939→15,958 ms across surface replacement/backgrounding and screen-off stages. Seek moved 15,962→13,962 ms, the paused clock remained stable, and resume advanced to 15,115 ms. Protocol, lifecycle and explicit seek/resume assertions all passed (instrumentation result −1).
- The actual Gearslip UI navigated native catalog→movie details→controlled add-on stream and played moving video. Correlated clocks advanced 14.681→27.815 seconds with native trackedState 3, duration 150 seconds and one player construction. Pause/resume, audio selection and subtitle selection were exercised.
- The exact delivery APK also passed native Trending→Dead-End Job→Episodes→S1 E1→configured stream→video in official Gearslip Preview. The native player reached 15,742 ms with trackedState 3, duration 150,000 ms, one player construction and a bound 800×480 surface; the visible authored timecode was 16.083 seconds.
- Captions are fully readable above the host navbar after applying its visible-area callback. A native 90.019→30.019-second seek completed with trackedState 3, paused, and the visible frame at 30.042 seconds.
- A PIN set through the ordinary native phone UI was enforced in Gearslip: a wrong PIN was rejected, the correct PIN unlocked the native catalog, and exiting/reopening Car Preview required unlocking again. Launcher app switching that retains the same car session was distinguished from a real reconnect.
- All 47 release-integration tests and the 15 Medium regressions pass; bundle collision/ABI checks also pass.
- Documentation checks cover both language guides, exact original-input metadata, catalogue generation, local links, strict MkDocs rendering and matched language/canonical pages.

Detailed local evidence is retained under the worktree's ignored `.analysis/` directory, including input inventory, candidate hashes, patch results, decoded-APK comparisons, instrumentation output, safe service dumps and screenshots. No profile keys, PIN credentials, device tokens or copyrighted app binaries belong in this source repository.

## Reproduction

Build the bundle with the repository's normal authenticated Gradle setup and select **Add Gearslip car interface** for the exact original APK in Morphe. Keep the original profile recovery key before changing APK signing/installations.

`scripts/wuplay-car/build_probe.py` builds the instrumentation harness. `scripts/wuplay-car/serve_fixture.py` serves authored media/add-on responses on loopback. The probe's mutation mode is restricted to the owned emulator test profile. `tests/verify_wuplay_car.py` independently compares decoded original/patched APKs and checks binary/library/license invariants.

The implementation plan is in `docs/superpowers/plans/2026-11-02-wuplay-gearslip.md`. This document records emulator evidence, not universal ROM, protected-video, physical transport or acoustic-audio acceptance.

## Delivered artifact identity

The local Morphe bundle SHA-256 is `5ed73bc1dd42507afbdf9b3776a4a960b7afe4ace79c805ac37a922b83b3ef23`. The signed STRIP_FAST APK SHA-256 is `89cf5bb27657aad7fce819bea60df405155490ec0a814e74f9fe05004d2cef01`; it verifies with APK Signature Schemes v2/v3 and the local Android debug signer `fb872b7bb00c34c5e89d42ab44c824980c0d8110e7cf26bd07da78036479c936`. The APK is a local test delivery, separate from the publisher certificate.


## Home poster shelves, season browsing and capped autoplay

Implementation branch: `feat/wuplay-car-home-ready`, prepared on main `f9479e1` after development and runtime validation from baseline `48b8908`. This update extends the existing Mobile patch; the Android TV publisher and Gearslip source are unchanged.

- Home uses the selected profile's Home-enabled catalogs, ordered by the native definitions, with four horizontal catalog shelves per group and twelve preview titles per shelf. More catalogs/titles remain reachable. A series opens episode-thumbnail carousels grouped by season, including Specials and unknown-season handling.
- Title/episode pages expose **Play · ≤10 Mbps** and secondary eligible sources. Automatic selection honors the preferred add-on among eligible direct streams; unknown and over-limit rates are excluded. Retries use at most three eligible candidates and stop with the owning player page/session.
- Episode runtime is retained separately from parent-series metadata. File-size/runtime rates are average estimates, not a hard network traffic shaper. The native adaptive selector is configured for 9 Mbps video plus 1 Mbps audio, with both constraint-exceeding fallback flags disabled. This establishes configured limits; it does not establish behavior for every possible adaptive manifest.
- Artwork travels through a private, read-only URI-grant provider, with a two-download limit, bounded input/decode/disk size and a total fetch deadline. Failed/busy reads return artwork placeholders. Refresh creates fresh artwork URIs as well as fresh shelf identities to avoid Gearslip's process-wide caches retaining stale content.
- The exact input strips the standard IconCompat wire methods and reverses the retained Kotlin null-parameter helper's argument order. The patch adds four IconCompat bridges and one checked Kotlin overload forwarding to the original implementation. It does not package another Kotlin or AndroidX Core runtime.

Validation uses the dedicated persisted `wuplay-gearslip-test` Android 16 arm64 emulator (`emulator-5680`) and official Gearslip 0.3.31-alpha Preview at 800×480. Only its owned CarValidation profile/add-ons were used. The user's CPH2747 app was pulled read-only for inspection and was not replaced.

- All 423 Python regressions pass (45 skips), including independent JVM assertions for the exact bitrate boundary, invalid/unknown rates, runtime units, header-authenticated size probes, HTTP range totals, HLS metadata, preferred-addon ordering, season ordering/pagination, cache identities, three-candidate retry limits and synchronous preparation failure during retry.
- Release-workflow Gradle compilation and unit-test tasks pass. Strict patching/rebuilding passes against the exact original Mobile APK.
- Android instrumentation result −1 verifies a populated GridSection serialization roundtrip, lazy item retrieval across Binder, actual content-URI thumbnail decoding and episode-runtime isolation. This expanded check first reproduced the missing Kotlin overload before its repair; a loading-only template check was insufficient.
- Android instrumentation result −1 verifies sixteen concurrent slow artwork requests all decode artwork/placeholders and a refresh changes their URI. The regression first reproduced blank tiles and the absent refresh revision.
- The actual production Play page, using the native enabled-add-on repository, automatically chose an authored 1,335,171-bps source while skipping an over-limit candidate. A second controlled response containing only over-limit sources produced the expected 10 Mbps error and no selected player.
- Native playback with the selector cap active decoded 158 distinct video frames and 192 audio buffers. The clock advanced 26,625→29,709→32,720 ms across surface replacement/background/screen-off checks; 78 frames rendered with the screen noninteractive. Seek, pause and resume assertions passed.
- Actual Gearslip UI navigation passed Home posters → Dead-End Job → Season 1 episode thumbnails → episode overview/Play → automatically selected authored video. Safe native diagnostics showed `PlayerPage`, `trackedState=3`, an 800×480 bound surface and active playback; the visible authored video clock read 38.417 seconds. No unexplained stream-list selection was required.

Local evidence is retained in the worktree `.analysis/` directory, including `home-posters.png`, `series-seasons.png`, `episode-detail.png`, `episode-autoplay.png`, probe results, strict patch output and test logs. The authored fixture validates the interface and control flow; no copyrighted episode was played. Physical head-unit transport/acoustic audio and every adaptive format remain outside this emulator evidence.
