# Random Episode test plan

Current port results: [0.9.0-beta validation](VALIDATION_0.9.0-beta.md). The historical results below retain their original version scope.

## Native Upcoming target after random is disabled — 2026-09-01

- [x] Regression coverage reproduces a retained Home card that was randomized while enabled, records Nuvio's native future `NextToWatch`, rejects a later patch-generated `Play Sx Ey` recomposition as native state, and rebuilds the exact future Upcoming item when random is disabled.
- [x] The final extension suite completed 283 tests with zero failures, errors or skips. The patch module completed seven tests with zero failures, errors or skips, release lint passed, and the Android patch bundle contains a non-empty 281,684-byte `classes.dex`.
- [x] The final seven-patch x86_64 build applied Allow Importing Subs from Local Storage, Local Downloads, Local Media, Mark SDH Subtitles, Random Episode, Remove SDH Annotations and Side-by-side installation with zero failed patches. Its installed APK was byte-for-byte identical to the host artifact.
- [x] ADB-only signed-in validation reproduced Silo's exact transition: native Upcoming `S3 E10`, `Airs in 3 Days`; random enabled, aired random Silo card in Continue Watching with the circular shuffle badge and no Upcoming row; random disabled, Detail `Next S3 E10`; Home Upcoming `S3 E10`, `Airs in 3 Days`. The random and restored states were visually inspected at 3840 x 2160.
- [x] A force-stop and cold profile launch retained the restored native `S3 E10` Upcoming card. The final run recorded no package fatal exception, ANR, verifier error or linkage error.
- [x] The final ARM32 all-patches APK applies exactly seven patches, uses package `com.nuvio.morphe` and label `Nuvio Morphe`, contains only `armeabi-v7a` plus five non-empty `classes*.dex` entries, omits `REQUEST_INSTALL_PACKAGES`, disables updater execution and About-page update controls, is zip-aligned, and is v2/v3 signed. The source and overwritten `G:\My Drive\NuvioTV-0.8.11-beta-Morphe-All-Patches-ARM32.apk` are byte-for-byte identical with SHA-256 `4BD0A7FE00200AA9C51B259CDB673B9639B5B3E8BDF5A19DC65FC3995E7FC8C3`.

## Upcoming classification and retained Home restoration — 2026-08-31

- [x] The final extension suite completed 281 tests with zero failures, errors or skips, including a cold-process regression that starts with random enabled, recomposes from the already-randomized retained Home lists, disables the show from Detail and restores the original unaired Next Up item. The patch module completed four tests with zero failures, errors or skips, and debug lint completed with zero issues.
- [x] Random Episode reapplied alone to the official universal 0.8.11-beta asset after the final retained-source correction with all manifest, DEX and exact Smali inspections passing. The rebuilt seven-patch x86_64 compatibility APK applied all seven patches with zero failed patches. The delivery APK applied exactly Random Episode and Side-by-side installation with zero failed patches.
- [x] ADB-only signed-in validation used Silo's real `S3 E10`, `Airs in 4 Days` state. With random disabled it remained the sole native Upcoming card. Enabling random removed the Upcoming row and produced an aired random Silo card in Continue Watching. That state survived a force-stop and cold Home reconstruction. Disabling from Detail then restored the original `S3 E10`, `Airs in 4 Days` Upcoming card rather than moving the displayed random episode into Upcoming; Silo was re-enabled for delivery.
- [x] Home and Detail were visually inspected at 3840 × 2160 on both the seven-patch compatibility build and exact final APK. The random Silo card uses the 20 dp white circular badge with dark Material shuffle icon at the native 8 dp top-left inset, the false Upcoming section is absent while enabled, the native Upcoming card is correct while disabled, and Detail renders the selected shuffle action with a stable random `Play Sx Ey` label.
- [x] The delivery APK is package `com.nuvio.morphe`, label `Nuvio Morphe`, contains arm64-v8a, armeabi-v7a, x86 and x86_64 plus five non-empty `classes*.dex` entries, is zip-aligned and v2/v3 signed. The host artifact, installed base APK and overwritten `G:\My Drive\NuvioTV-0.8.11-beta-Random-Episode-Test-universal.apk` are byte-for-byte identical with SHA-256 `104E970FDB054147FEB19A9C3D311E94677AFAAF39B46FB428352C401455C248`; the final run recorded no app fatal, ANR, verifier or linkage error.
- [x] Emulator media staging was fully reversed after testing: Silo is 126 files / 285,997,393 bytes, Fist of the North Star is 23 files / 147,640,190 bytes, and Bluey Season 1 is 9 files / 686,757,177 bytes, with no staging directory left behind.

## Per-Home-visit random Next Up cards — 2026-08-31

- [x] The full extension suite completed 275 tests with zero failures, errors or skips. Focused coverage verifies one stable selection per Home visit, a different draw on re-entry when alternatives exist, Resume exclusion, All and Unwatched-only filtering, exhausted-pool removal, special/future/unavailable filtering, per-show independence, cold Home-catalogue capture and exact displayed-card/playback route identity.
- [x] The patch module completed four tests with zero failures, errors or skips, debug lint completed with zero issues, and the Android patch bundle retained a non-empty DEX payload.
- [x] Random Episode applied alone to the official x86_64, arm64-v8a, armeabi-v7a and universal 0.8.11-beta assets. Exact manifest, DEX and Smali inspections include the structural Home catalogue capture and the atomic Continue Watching item/action rewrite.
- [x] The seven-patch x86_64 combination applied Side-by-side installation, Local Downloads, Local Media, local subtitle importing, Remove SDH, Mark SDH and Random Episode with seven successful and zero failed patches. An ADB-only cold-process launch rendered Seinfeld as random `S3 E10` and recorded no package fatal, verifier, missing-class or missing-method error.
- [x] On the exact two-patch universal delivery build, Seinfeld's native `S7 E9` Next Up card became random `S2 E2`; twenty focus changes retained `S2 E2`, and activating the card requested exactly Seinfeld S2E2. Detail-to-Home re-entry then produced `S6 E14` and `S9 E18`. Complete process restarts produced `S7 E2` and, after the final reinstall, `S5 E2`, confirming that Nuvio's existing Home catalogue repopulates the patch without an additional metadata request.
- [x] Silo's incomplete Continue Watching state remained `S3 E9`, `Farewell`, `57m left`; its Home card and player identity both remained S3E9 while random mode was enabled. The remote playback link expired outside the patch and did not replace the Resume card or create a package fatal.
- [x] The delivery APK applies exactly Random Episode and Side-by-side installation, uses package `com.nuvio.morphe` and label `Nuvio Morphe`, contains arm64-v8a, armeabi-v7a, x86 and x86_64, has five non-empty `classes*.dex` entries, is zip-aligned, and is v2/v3 signed. The host artifact, installed base APK and overwritten Drive file are byte-for-byte identical with SHA-256 `F0D14DB83E96C78DA908F867DB023DA0BF22B9F0B73D02A47C29F4FC6A8289F0`.
- [x] The existing Drive object was overwritten at `G:\My Drive\NuvioTV-0.8.11-beta-Random-Episode-Test-universal.apk`. Emulator storage staging was fully reversed: Silo is 126 files / 285,997,393 bytes, Fist of the North Star is 23 files / 147,640,190 bytes, and Bluey Season 1 is 9 files / 686,757,177 bytes, with no staging directory left behind.
- [ ] Exhausting a live account's full Unwatched-only pool was not forced because that would require mutating the user's watched state. Empty-pool card omission and watched filtering are covered deterministically by the focused runtime tests.

## Removed Continue Watching session cannot be resurrected — 2026-08-31

- [x] The full extension suite completed 268 tests with zero failures, errors or skips. The new regression reproduces the exact sequence: cached incomplete progress, random off, native Resume, user-driven transition to Play Next, then random on. The result has `isResume=false`, no progress payload and a patch-owned random `Play Sx Ey` value.
- [x] Existing coverage still verifies that an initially non-Resume or mismatched native value does not discard an extant Continue Watching card, so the card remains authoritative during ordinary stale/loading states.
- [x] The patch module completed four tests with zero failures, errors or skips. Debug lint completed with zero errors.
- [x] Random Episode applied alone to the official x86_64, arm64-v8a, armeabi-v7a and universal 0.8.11-beta assets with exact manifest, DEX and Smali inspections. The seven-patch x86_64 combination applied all seven patches with zero failed patches.
- [x] The exact two-patch universal output applies Random Episode and Side-by-side installation, uses package `com.nuvio.morphe` and label `Nuvio Morphe`, contains arm64-v8a, armeabi-v7a, x86 and x86_64, has five non-empty `classes*.dex` entries, is zip-aligned, and is v2/v3 signed. The host artifact, installed APK and overwritten Drive file are byte-for-byte identical with SHA-256 `7C74E54F5798BB7D2F02E8FD9F9D95DE632927D625FB859D0206C63BDF95A322`.
- [x] ADB-only validation retained the signed-in Giorgio profile, rendered Silo as `Resume S3 E9` with the Random playback action present, and recorded zero package fatal exceptions, ANRs, verifier errors or linkage errors.
- [x] Emulator media staging was fully reversed after installation: Silo is 126 files / 285,997,393 bytes, Fist of the North Star is 23 files / 147,640,190 bytes, and Bluey Season 1 is 9 files / 686,757,177 bytes.
- [ ] A real Continue Watching record was not deleted during automated validation because that would mutate the user's account-backed watch state. The exact removal transition is covered deterministically by the regression test; final TV acceptance remains available for manual confirmation.

## Stable detail-visit selection and circular marker — 2026-08-31

- [x] The full extension suite completed 267 tests with zero failures, errors or skips. The patch module completed four tests with zero failures, errors or skips, and debug lint completed with zero errors. Focused coverage verifies that Play-callback recreation and episode-list expansion preserve the current visit's selection, while entering Home ends the visit and forces a different draw when alternatives exist.
- [x] Random Episode applied alone to the official x86_64, universal, arm64-v8a and armeabi-v7a 0.8.11-beta assets. Every fingerprint matched exactly once, including the native Home content boundary, and every manifest, DEX and exact Smali inspection passed.
- [x] The seven-patch x86_64 combination applied Side-by-side installation, Local Downloads, Local Media, local subtitle importing, Remove SDH, Mark SDH and Random Episode with seven successful and zero failed patches.
- [x] On that combined build, Reacher remained `Play S2 E3` after trailer playback and after opening the S2E3 source picker and pressing Back. Returning Home and re-entering selected `Play S3 E3`; automatic trailer playback on that new visit still returned to S3E3.
- [x] The exact two-patch universal delivery APK independently remained `Play S4 E4` through automatic trailer playback and an S4E4 source-picker Back, then changed to `Play S1 E8` only after Home and detail re-entry. No package fatal exception, ANR, `VerifyError` or badge-rendering error was recorded.
- [x] Live 4K geometry confirms the Continue Watching marker is a 20 dp white circle with the dark Material shuffle icon, native-style shadow and an 8 dp true top-left inset: its semantic bounds were 80 × 80 px at `[1341,1202]` inside Silo's card beginning at `[1309,1170]`.
- [x] The delivery APK applies exactly Random Episode and Side-by-side installation, uses package `com.nuvio.morphe` and label `Nuvio Morphe`, contains arm64-v8a, armeabi-v7a, x86 and x86_64, has non-empty `classes*.dex`, is zip-aligned, and is v2/v3 signed. The installed APK, host artifact and Drive copy are byte-for-byte identical with SHA-256 `56057701DDF124123DDBBED0D3BC943810A335B34CEF7EECEF0E15E654081A9B`.
- [x] The temporary emulator storage staging was fully reversed after installation: Silo was restored with 126 files / 285,997,393 bytes and Fist of the North Star with 23 files / 147,640,190 bytes.

## Continue Watching authority and Material shuffle evidence — 2026-08-31

- [x] The extension suite completed 266 tests with zero failures, errors or skips. New coverage verifies Continue Watching as the Resume source of truth, exact label and route agreement, random continuation after Resume, stale/completed progress rejection, remote percentage-only progress, transactional long-press choices, Back cancellation and the packaged Material shuffle-on drawable ID.
- [x] Debug lint completed with zero errors, and the patch module completed four tests with zero failures, errors or skips.
- [x] The Android patch bundle contains a non-empty 265,524-byte `classes.dex`; exact fingerprints and post-patch manifest, DEX and Smali inspections passed on the official x86_64 0.8.11-beta asset after the final badge correction.
- [x] Random Episode applied alone with zero failed patches. It also applied in the seven-patch combination with Side-by-side installation, Local Downloads, Local Media, local subtitle importing, Remove SDH and Mark SDH with zero failed patches.
- [x] The final universal side-by-side output applies only Random Episode and Side-by-side installation, uses package `com.nuvio.morphe` and label `Nuvio Morphe`, contains arm64-v8a, armeabi-v7a, x86 and x86_64, is zip-aligned, and is v2/v3 signed. It was installed byte-for-byte on the AVD and copied byte-for-byte to `G:\My Drive\NuvioTV-0.8.11-beta-Random-Episode-Test-universal.apk`; all three SHA-256 values are `8C7C43857F6FF70331F411FCFEACE7F5ED6D2D1BD074CDD8F7685737B7F649E8`.
- [x] A source-level vector audit confirms that the Continue Watching badge's 960-unit viewport and every move/line/close command are identical to Nuvio's packaged `media3_icon_shuffle_on` path. The detail toggle loads that packaged drawable directly. Live rendering confirms a pure-white glyph with no circle or shadow at Nuvio's native 20 dp watched-glyph size, 8 dp from the true top-left corner.
- [x] Account-backed checks on both the seven-patch x86_64 combination and the exact isolated universal delivery APK confirm Silo's Continue Watching card, hero label, normal Play and Play long-press remain on `Resume S3 E9`; the corrected badge renders; Back cancels the pool dialog without enabling random; selecting the current option while disabled enables it; `Unwatched only` survives force-stop; Reacher changes random episode on detail re-entry, returns to `Play S1 E1` when disabled, and does not change Silo's independent state.
- [ ] Natural completion could not be exercised against the live Silo source because AIOStreams/ElfHosted repeatedly reset the HTTP connection before playback began. The exact `S3 E9` player identity reached Nuvio's player without a patch crash; 90%-threshold watched marking, resume authority removal and random-next continuation remain covered by focused tests and bytecode inspection.

## Persistent per-show playback evidence — 2026-08-30

- [x] The final extension suite completed 259 tests with zero failures, errors or skips, including persistent per-show settings, native Resume priority, displayed random Play state, late episode-list expansion, manual source selection, native progress/watched behavior, random continuation and Continue Watching integration.
- [x] The final Random Episode bundle applied alone to the official universal, x86_64, arm64-v8a and armeabi-v7a 0.8.11-beta APKs. Every declared fingerprint matched once and every manifest, DEX and exact Smali inspection passed, including the injected native `NextToWatch` rewrite.
- [x] All four isolated outputs are zip-aligned and v2/v3 signed. The universal output contains arm64-v8a, armeabi-v7a, x86 and x86_64.
- [x] On the API 36 `Television_4K` AVD, no-progress Reacher changed immediately from native `Play S1 E1` to a displayed random episode when enabled and immediately returned to `Play S1 E1` when disabled.
- [x] A displayed `Play S1 E8` opened the S1E8 source list. Returning to the detail page selected another episode, and the selection remained stable for ordinary recompositions during that visit.
- [x] Silo retained native `Resume S3 E9` with random mode enabled, and both Continue Watching and the player route retained S3E9 rather than replacing the in-progress episode.
- [x] Long press opened `Episodes included`; Reacher's `Unwatched only` choice and its independent random toggle survived force-stop and a complete emulator reboot. Silo's independent enabled state also survived and retained its Continue Watching shuffle badge.
- [x] The final seven-patch x86_64 and universal combinations applied Side-by-side installation, Local Downloads, Local Media, local subtitle importing, Remove SDH, Mark SDH and Random Episode with zero failed patches. Both are aligned and v2/v3 signed; the x86_64 build installed, launched and rendered the Detail Page setting without a fatal or verifier error.
- [x] The exact final isolated x86_64 APK installed over the logged-in test app and launched after reboot without a package fatal, ANR, `VerifyError`, missing class or missing method.
- [x] The delivered universal APK enables only Random Episode and Side-by-side installation. It uses package `com.nuvio.morphe`, label `Nuvio Morphe`, contains all four native ABIs, is zip-aligned and v2/v3 signed, and installed beside the logged-in `com.nuvio.tv` app without changing its profiles. The final corrected artifact at `G:\My Drive\NuvioTV-0.8.11-beta-Random-Episode-Test-universal.apk` has SHA-256 `8C7C43857F6FF70331F411FCFEACE7F5ED6D2D1BD074CDD8F7685737B7F649E8`.
- [ ] Natural end-of-episode continuation was not completed against a live remote stream: multiple AIOStreams/ElfHosted sources and a smaller PenguPlay/PixelDrain 1080p source failed outside the patch with HTTP connection resets or remained loading. Route identity, 90%-completion watched marking, no-repeat selection and continuous random-next behavior remain covered by focused tests and exact bytecode inspection.

## NuvioTV 0.8.11-beta port evidence — 2026-08-29

- [x] The clean rerun completed 239 extension tests and 543 passing patcher tests out of 544, with zero failures or errors and one intentional patcher skip; debug lint completed with zero errors.
- [x] Random Episode applied alone to all four official ABI assets with exact fingerprints and passed in each final seven-patch build.
- [x] The exact final x86_64 APK rendered the Detail Page category and `Show Random Episode Button` switch on the API 36 `Television_4K` AVD without a fatal exception.
- [ ] Live-catalog selection, playback, history/scrobble isolation, persistence, and real Android TV acceptance remain manual release gates.

- [x] Unit tests cover fresh-default On, stored Off persistence, eligible filtering, future and malformed dates, current-episode exclusion, route immutability and random-session clearing.
- [x] Every fingerprint matches exactly once on universal, x86_64, arm64-v8a and armeabi-v7a 0.8.4 APKs.
- [x] Exclusive patch application and manifest/DEX inspection pass on all declared assets.
- [x] Combined application passes with Remove SDH Annotations and Mark SDH Subtitles.
- [ ] TV AVD verifies the Detail Page and Subtitles categories in all collapsed/expanded combinations.
- [ ] TV AVD verifies OFF/ON series appearance, D-pad order, click, long press, source selection, H.264/AVC playback, seeking and error return; unit tests verify movie, special and future-episode exclusion.
- [ ] TV AVD verifies random Next Episode does not repeat the current episode when alternatives exist.
- [ ] TV AVD verifies no local progress write, remote progress mutation, tracking scrobble or resume seek during random playback.
- [ ] TV AVD verifies normal playback immediately before and after random playback remains unchanged.
- [ ] Toggle persistence passes after force-stop and reboot.
- [ ] Real Android TV acceptance evidence is recorded before stable release.

## 2026-08-07 AVD evidence

- Final combined x86_64 build includes Random Episode, Remove SDH Annotations and Mark SDH Subtitles.
- Twenty consecutive `Friends` selections produced twenty distinct episodes across seasons 2, 3, 4, 6, 7, 8, 9 and 10, with no season-zero selection.
- The long-press dialog displayed `S3 E6`; source requests used `tt0108778:3:6`.
- `Friends` `S3 E6` played and sought successfully with an AVC source. Simkl diagnostics retained `media=none` and skipped start/pause scrobbles.
- Natural completion proposed random `S7 E24` instead of sequential `S3 E7`; confirmation requested `tt0108778:7:24`.
- Returning home did not add `Friends` to Continue Watching and preserved the existing Cape Fear entry at `55m Left`.
- Recomposition stress covered 50 horizontal focus changes, eight long-press open/dismiss cycles and repeated vertical detail-page focus changes without a crash.
- Full emulator reboot preserved the enabled setting and the series shuffle action.

## NuvioTV 0.8.5-beta automated port evidence

- [x] The 198-test extension suite passed with zero failures, errors, or skips.
- [x] This patch applied alone with an exact single match on x86_64, arm64-v8a, armeabi-v7a, and universal official APKs.
- [x] Each isolated output passed SHA-256 input verification plus post-patch manifest, injected-class, and forbidden-type inspection.
- [x] The combined ten-patch x86_64 and universal builds applied without a failed patch and passed APK signature and alignment verification.
- [x] The combined x86_64 side-by-side build installed and launched on `Television_4K`; its process remained alive with no startup `FATAL EXCEPTION`, `VerifyError`, or package ANR.
- [ ] Patch-specific D-pad, persistence, navigation, playback, and media behavior remains manual and is not marked passed by this automated port.
- [ ] Real Android TV acceptance remains pending.

## 2026-08-19 NuvioTV 0.8.6-beta port evidence

- [x] The final 198-test extension suite and three patcher manifest tests passed with zero failures, errors, or skips.
- [x] This patch applied alone on the official x86_64, arm64-v8a, armeabi-v7a, and universal APKs with no fingerprint, rebuild, signing, manifest, injected-class, or forbidden-type inspection failure.
- [x] The final combined x86_64 and universal builds applied all ten patches with zero failures and passed APK alignment plus v2/v3 signature verification.
- [x] The final x86_64 side-by-side build installed on `Television_4K`; Morphe settings, Library Saved/Cloud/Storage, H.264 Media3 playback, and end-of-file return to Storage completed without an app fatal, `VerifyError`, or package ANR.
- [ ] Patch-specific external-service, removable-storage, network, source-selection, subtitle-content, and real-TV behavior remains manual unless separately recorded above.

## 2026-08-22 NuvioTV 0.8.7-beta port evidence

- [x] The final 195-test extension suite and three patcher manifest tests passed with zero failures, errors, or skips.
- [x] This patch applied alone on the official x86_64, arm64-v8a, armeabi-v7a, and universal APKs with no fingerprint, rebuild, signing, manifest, injected-class, or forbidden-type inspection failure.
- [x] The final combined x86_64 build applied all nine retained patches with zero failures and passed APK alignment plus signature verification.
- [x] The final x86_64 side-by-side build installed on `Television_4K`; Morphe Settings opened, native category and switch rows rendered, and the Local Downloads slider rendered with no app fatal, `VerifyError`, or reflection failure.
- [ ] Patch-specific playback, network, storage, subtitle-content, source-selection, D-pad, and real-TV behavior remains manual unless separately recorded above.

## 2026-08-23 0.8.7 runtime evidence

- A 0.8.7 series detail page rendered the injected `Play random episode` action alongside Nuvio's native actions. Activating the focused action entered the native playback route and produced no fatal, verifier, missing-method, or missing-class error.
- Deterministic season/episode candidate selection remains covered by focused unit tests; addon-backed stream resolution was not available in the guest emulator profile.
