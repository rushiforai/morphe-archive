# Library class verifier correction — 0.8.0-beta.2

## Defect and scope

A supplied phone crash identifies patches 0.8.0-beta.1 on original Music 9.43.51/94351240 arm64: Android rejects LibraryBrowseFragment's injected `bd_downloadContent()Landroid/view/ViewGroup;`. The instruction at its shared return is typed `android.view.View` on the absent-root path. ART verifies the class before normal runtime error handling can run, so a surrounding Java RuntimeException catch cannot recover. This can break Library navigation even without initiating a download.

The same released bridge was generated for 9.42.52/94252240. Existing SDK DEX serialization, reference/access and receiver-alias audits passed beta.1 but did not validate reference return assignability at control-flow joins. Those earlier passes do not establish ART verification, and did not catch this release defect.

## Correction

DownloadsHostPatch now returns a ViewGroup only after checking and casting the actual content view. An absent root, missing content or non-container content returns an explicit null on its own return path. The Java host already treats null as unavailable and releases owned content, retaining normal native handling. No native view hierarchy, navigation/account policy, downloader selection, catalogue schema, credentials, lyrics, media files or folder grants are changed.

The patch version, diagnostics context and bundled notice advance to 0.8.0-beta.2. All remaining production bytes are checked against the beta.1 source freeze. The separate-player removal and native Downloads content integration from beta.1 remain.

## Regression coverage

`AuditReferenceReturns45` uses the pinned dexlib MethodAnalyzer to derive register types over reachable control flow, then checks object-return assignability through the Android SDK36 and actual APK class hierarchy. It checks all `bd_` methods with bodies, plus selected rewritten owned native adapters (`createRequest`, `decode`, `decodePlayer`, `fileUri`). It is a scoped desktop verifier, not the Android ART verifier and not a full whole-program proof.

The audit reproduces beta.1's failure on both exact targets. Each released APK contains 41 examined bridge methods and 41 object returns; the only reported failure is the View-to-ViewGroup return in `bd_downloadContent` (`gpl` on 9.42.52, `gmh` on 9.43.51).

Final-output analysis must pass with the corrected bridge. An instruction-level fixture executes the actual corrected DEX bridge for four host cases: no root, no matching content, matching ID holding a plain View, and matching ID holding a ViewGroup. The first three return null without an invalid cast; the last returns the original container.

Fresh patch application covers both originals with Full defaults, Shaders plus Download playlist, Theme omitted, and personal Lyrics omitted, as well as the existing missing-Downloads rejection. Existing compiled feature/reference/access, Lyrics, media, settings, target/context and receiver audits run on the new outputs. Build/JVM/lint and the normal logger fixtures are rerun. Unchanged source fixtures are inherited only after exact named source hashes match.

## Delivery and limits

Compatibility remains experimental original arm64-v8a Music 9.42.52/94252240 and 9.43.51/94351240, minSDK26. Full Collection only. Shaders and Download playlist remain separately selectable; Jam remains 9.42.52-only. The playlist header's existing download action uses the configured mode; enabling Download playlist refers to patch selection, not an additional menu step at every click.

Exact final hashes and results are recorded in distribution `verification.json` and `Verification/revision45`. Beta.1 remains immutable historical evidence and is superseded by beta.2 once published. Repatch a supported original with the new patch bundle; refreshing the feed alone does not change an installed app.

The known invalid reference return is corrected and covered by compiled regression tests. Reopening Library on the actual Samsung phone is still required to confirm the reported crash is resolved there. Broader native playback, decoding, queue, Audio/Video switching, offline actions, visual parity, Samsung navigation, Shaders and recording-free lyric smoothness remain phone acceptance checks. No MuMu/device, signing/install/uninstall, actual media download or cleanup operations are performed.
