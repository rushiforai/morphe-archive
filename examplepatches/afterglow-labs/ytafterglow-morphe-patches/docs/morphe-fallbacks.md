# Temporary upstream adapters

The broader [Morphe catalog integration](morphe-catalog.md) supersedes this
build110-only fallback policy. Existing Morphe features can ship with their
original controls and behavior; exact iOS parity is not required. The remaining
key inventory below describes unfinished custom Afterglow behavior, not a reason
to withhold Morphe downloads, text copying or other working upstream features.

Afterglow includes selected source adaptations of existing Morphe implementations
while the full port is completed. Each adapter uses an existing Afterglow setting,
default, installed-tweak owner and translation. This inventory describes source
coverage; it does not claim APK or runtime validation.

## Source and packaging

- Pinned official bundle inspected: `patches-2.0.0.mpp`, SHA-256
  `f0f5cfd857950ed61a26a7b2eeeecf37d4d66bece2e8f94802280e189b69ed00`.
  Its manifest declares version `2.0.0` and patcher `2.0.0`. It contains both
  `OpenSystemShareSheetPatchKt` and `BypassImageRegionRestrictionsPatchKt`.
- Source reference: [Morphe patches](https://github.com/MorpheApp/morphe-patches),
  local v2.2.0 checkout at `44031c561ea048c8f196877f30a49c13bfd6afb6`.
  Relevant files are `youtube/layout/sharesheet/{OpenSystemShareSheetPatch,Fingerprints}.kt`,
  `youtube/layout/thumbnails/BypassImageRegionRestrictionsPatch.kt`,
  `youtube/misc/imageurlhook/{Fingerprints,CronetImageURLHook}.kt` and their
  `extensions/youtube/.../patches/` runtime classes. That checkout uses newer
  patcher APIs, so these adapters use this project's patcher 2.1.0 APIs and
  independently checked YouTube 21.43.523 methods.
- The bundle is not merged. No upstream settings, resources, complete extension,
  ProtoNode/protobuf dependency, thumbnail callbacks, link-shortener policy or
  unrelated patches are imported. The normal build already discovers these Java
  and Kotlin sources. There are no new build dependencies or resource inputs.
- Adapted files retain attribution and identify modifications. GPLv3 and the
  repository's [NOTICE](../NOTICE) continue to apply. Afterglow is the product
  name; upstream names describe provenance and compatibility only.

## Implemented mappings

| Afterglow key | Installed owner / default | Upstream implementation | Selected behavior |
| --- | --- | --- | --- |
| `nativeShare` | `native-share` / OFF | Open system share sheet | Intercept two verified native share commands, reconstruct supported iOS entity links, open Android's chooser, dismiss the command's placeholder after launch. Unknown data and failed launches retain native sharing. |
| `fixAlbums` | `fix-albums` / OFF | Bypass image region restrictions + image URL constructor hook | Change `yt3.ggpht.com` to `yt4.ggpht.com` and `yt3.googleusercontent.com` to `yt4.googleusercontent.com` before image URL storage and cache-key generation. |

Both choices are read live through `InstalledTweaks` and `LiteMode.effectiveBool`.
Neither setting is forced by Lite Mode. Unselected tweaks, OFF/default/reset and
unavailable preferences preserve native behavior. Existing settings and
translations need no replacement.

Integration entry points in `app.afterglow.patches.tweaks.navigation`:

- `morpheFallbackNativeShareHookPatch`, assigned only to `native-share`.
- `morpheFallbackAlbumCoversHookPatch`, assigned only to `fix-albums`.

Each depends only on `afterglowExtensionPatch`. There is no shared native method
with the Mini player, playlist minibar or long-press adaptations. The existing
link-tracking patch can remain selected: these share URLs have no tracking
parameters. Do not also select the official versions of these two patches when
testing or shipping the adapters, since they would duplicate these boundaries.

### Native share evidence and limits

The iOS contract is `YTNativeShare.x`: video field 1, playlist field 2, channel
field 3, post field 6 and nested clip field 8/1. Clip, post, channel, playlist and
video precedence and `https://youtube.com` URL forms match that implementation.
Non-PL/FL playlists retain its `&playnext=1` suffix. Known Shorts metadata fields
10, 12 and 20 do not change the URL. An endpoint's entity is protobuf field 1.

Verified stock methods:

| Native method | Guard and insertion |
| --- | --- |
| `Lavps;->d(Lbmbw;Ljava/util/Map;)V` | Private final share-entity command, marker `Command not in share entity endpoint proto.`, `Lbmbw.g:Lbdso` dispatch through `Laksq.c`. Intercept the existing first parameter at entry. |
| `Lavqe;->b(Lbdso;Ljava/util/Map;)V` | Public final share command, `Lbobw.b:Lbbju` extension, cast to `Lbobw`, fullscreen-spinner marker and the ResolveInfo/activity/application/package chain. Intercept immediately after the verified endpoint cast. |
| `Latqz;->j(Lbrbd;Lwug;)V` | Action-sheet command marker `ShowActionSheetCommand needs to provided.` Captures the native controller through an added interface. |
| `Latqz;->f(Lj$/util/Optional;)V` | Public final native dismiss method, Optional check, `Latte.dismiss`, and native sheet-field clear. A generated interface method invokes it with Optional.empty. |

Both endpoint classes implement native MessageLite serialization. The original
method runs unless an enabled, selected adapter successfully starts the chooser.
OFF branches skip serialization. A bounded, read-only parser accepts Base64 and
URL-safe Base64, percent escapes and native whitespace; invalid/oversized data,
duplicate fields, unknown entities, comments and timestamps fall through.

The chooser uses the current activity and `FLAG_ACTIVITY_NO_USER_ACTION`; a missing,
finishing or destroyed activity uses application context with NEW_TASK. Failed
launches return false. Successful launches post placeholder dismissal after the
current native call. Each native show gets a new token, captured before chooser
launch; a later show invalidates the queued dismissal even when it reuses the same
controller. Cleanup affects the native placeholder only; the Android chooser stays
open until its normal completion/cancellation.

This is deliberately conservative source coverage. Unknown extra fields, clip
payloads beyond the verified nested ID shape and unsupported entity types continue
to use YouTube's share UI. Do not claim these as completed parity. Community-post
commands without their own serialized entity can resolve their child command
normally and then reach the second hook.

### Album cover evidence and limits

The iOS image-selection contract is `YTAfterglow.x`'s `newCoverURL`, applied to
selected and updated image URLs. Its two exact host mappings determine scope.
The separate image-download helper also contains a `yt3` rewrite; download
coverage remains part of the unfinished download implementation.

The stock image request is `Lgus;-><init>(Ljava/lang/String;Lgut;)V`. The patch
checks `Lgus.c()`'s distinctive URI-encoding marker, `Uri.encode`, the constructor
signature, `Lcci.aa(String)` validation, the immediately following `Lgus.e:String`
store, and the exact input/receiver registers. Injection changes the argument
before storage, so native URL and digest/cache-key generation see the same value.

Path, port, raw query, fragment and encoded bytes are preserved. Other image hosts,
including upstream's broader `lh3` through `lh6` and `play-lh` options, are left
alone. Malformed URLs, user-info URLs and nonmatching authorities are unchanged.
The native `java.net.URL` constructor path is not hooked; neither is any downloader.
Network/cache behavior for real album art remains runtime QA.

## Remaining-key inventory

Inventory is based on `tools/tweaks.json`, `tools/parity.json`, the iOS specification
and the selected upstream sources. Existing Afterglow implementations remain the
owners of partially completed behavior. A similarly named upstream setting is not
enough evidence to replace one.

| Remaining keys | Fallback decision |
| --- | --- |
| `hideShortsSubscriptions` | Pending. iOS hides `YTReelPausedStateCarouselView`. Morphe's `morphe_hide_shorts_subscriptions` removes Shorts from the Subscriptions feed, which is a different behavior. Broader paused-state filters overlap the completed Lens option and are not imported. |
| `startupAnimation` | Candidate only. Upstream startup/splash controls exist, but the exact iOS animation policy and current native boundary have not been verified for this batch. |
| `oldYTUI`, `disableRTL` | Pending. Individual legacy-layout options do not reproduce the full iOS old-UI contract, and no matching verified RTL fallback was established. |
| `twoRowTabBar`, `centeredAnchorTabBar`, `anchorLeftTab`, `anchorRightTab` | Pending custom tab layout; no matching adapter established. |
| `theme_fontMode`, `theme_fontSizeMode`, `theme_fontWeightMode`, `theme_fontStyleMode`, `theme_tabLabelSizeMode` | Existing Afterglow typography work; no upstream override added. |
| `seekBarScrubberSize`, `redProgressBar`, `seekBarGradient`, `seekBarAnimated` | Existing Afterglow seek-bar work; upstream progress-bar color alone does not reproduce these full contracts. |
| `theme_glowEnabled`, `theme_glowStrength`, `theme_glowStrengthMode`, `theme_glowStrengthCustom`, `theme_glowOpacity`, `theme_glowRadius`, `theme_glowLayers`, `theme_glowPivot`, `theme_glowOverlay`, `theme_glowScrubber`, `theme_glowSeekBar`, `destination.glowLab` | Existing Afterglow glow work; no verified matching upstream implementation. |
| `destination.themeStudio` | Existing Afterglow editor/library/import/export work; no replacement added. |
| `miniplayer`, `playlistOldMinibar` | Dedicated current-port hooks, documented separately; no duplicate upstream miniplayer styling imported. |
| `downloadButton`, `controlsSheetButton`, `action.resetOverlayMode` | Existing Afterglow overlay owner; remaining destination/reset behavior is not equivalent to an upstream external-download button. |
| `downloadRefreshMetadata`, `downloadPreferStableAudio`, `downloadIncludeAutoCaptions`, `downloadOfferTranslatedCaptions`, `nativeDownloadRouting`, `downloadPostActionMode`, `downloadAudioTrackMode`, `downloadAudioQualityMode`, `downloadPickerFontScaleMode`, `downloadPickerFontFaceMode`, `destination.vault` | Pending download/Vault architecture. Upstream external-downloader routing does not implement these settings. |
| `commentsHeaderMode` | Existing Afterglow comments-header owner; no upstream replacement added. |
| `copyVideoInfo`, `saveProfilePhoto`, `postManager`, `commentManager`, `copyWithTimestamp` | Dedicated long-press port in progress. Upstream overlay copy buttons are not equivalent to these entry points. |
| `destination.aiHome`, `destination.experimentLab`, `destination.controlCenter` | Afterglow-specific destinations; no verified matching fallback. |
| `liteModeEnabled`, `debugLogFirehose`, `debugLogDownloads`, `debugLogPlayerUI`, `debugLogPremiumControls`, `debugLogPiP`, `debugLogProbes` | Existing Afterglow base policies/diagnostics; no upstream bundle-wide overrides added. |

## Validation and integration QA

`python3 -B -I tools/check_morphe_fallbacks.py` passes 104 JVM checks using the real
preference registry, installed-tweak gate and Lite Mode policy. Android window,
Intent dispatch and application startup/logging are test doubles. The checks cover
defaults, live/reset behavior, both album hosts, unchanged unrelated hosts, encoded
URL preservation, all five entity types, malformed/truncated data, unknown-entity
fallback, chooser dispatch failure, context selection, same-show delayed dismissal
and invalidation by a newer native sheet on either the same or another controller.
All current Kotlin sources also compile against Desktop 1.20.0's patcher 2.1.0.

The integration owner still needs strict patch application and emulator checks:

1. Select each named tweak independently and together. Both settings start OFF,
   appear only for their selected owner and retain existing translations. Verify
   live ON/OFF and reset through Afterglow settings.
2. With Native share OFF, verify the existing YouTube panel. With it ON, share a
   watch video, Shorts video, playlist, mix, channel, post and clip. Check the link
   and single chooser, dismissal/return to playback, absence of stale placeholders
   and unwanted picture-in-picture. Test unknown/comment/timestamp entities using
   the native flow, and check repeated taps and navigation between controllers.
3. With Fix album covers OFF/ON/OFF, load uncached artwork using both matching
   hosts. Verify the rewritten request and unchanged path/query, visible artwork,
   cache consistency and unrelated video thumbnails. Existing cached images may
   hide a network change; do not infer success from a screenshot alone.
4. Repeat with the normal GmsCore/streaming compatibility selection. These hooks
   need no official share-sheet or image-restriction patches selected beside them.

No physical-device, region-specific network or full iOS parity claim is made by
these source/policy checks. The repository parity ledger remains the integration
owner's authority for delivered status.

## Emulator checkpoint: build109, retained in build110

Native share passes OFF→ON→OFF: YouTube's panel, one Android chooser with the
correct watch URL, then the native panel again. Dismissing and reopening the
chooser remains usable. Fix album covers ON retains visible channel/profile art
and recommendation thumbnails; a region-blocked network/cache fixture is not
proven. Build110 retains both hooks unchanged and passes strict full35 and
independent6 assembly. Non-video share entities retain policy/source proof only.
See `release-build110.md` for final artifact and runtime scope.
