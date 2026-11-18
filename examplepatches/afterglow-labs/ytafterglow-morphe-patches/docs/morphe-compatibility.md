# Temporary GmsCore and stream compatibility

This document records the narrow build110 adaptation. The broader integration
now delegates GmsCore and stream support to the original vendored Morphe graph,
together with the imported feature catalog. The old compatibility helpers remain
in source for reference but are not dependencies of the current named wrappers.
See [the catalog and integration policy](morphe-catalog.md). Its original settings
resources and extension loader are the sole active Morphe resource/runtime owner.

Afterglow includes source adaptations of Morphe **2.0.0** for Android YouTube
**21.43.523**, compiled against patcher **2.1.0**. The two named selections are
**GmsCore support** and **Spoof video streams**. Both default ON. GmsCore support
includes stream spoofing and retains the installed package
`app.morphe.android.youtube`, so existing verified installations can upgrade.
The package name is an installation identifier; the displayed product is Afterglow.

The entry points are unnamed `gmsCoreSupportHookPatch` and
`spoofVideoStreamsHookPatch` in `app.afterglow.patches.compat.morphe`.
`TweakPatches.kt` owns their named wrappers and inventory registration. Helpers
have no patch names and cannot appear as additional selectable upstream patches.
Do not also select the official bundle's versions of these patches.

## Exact inputs and build

- Patch source: [Morphe v2.0.0, commit 6cb8e6b6ee425eda8a854e026507286359f38a32](https://github.com/MorpheApp/morphe-patches/tree/6cb8e6b6ee425eda8a854e026507286359f38a32).
  [Complete source archive](https://codeload.github.com/MorpheApp/morphe-patches/tar.gz/6cb8e6b6ee425eda8a854e026507286359f38a32).
- Patch-library source: [2.1.0-dev.2, commit 42edb9710c2b63416e8eddd8096bb6a0adff75dd](https://github.com/MorpheApp/morphe-patches-library/tree/42edb9710c2b63416e8eddd8096bb6a0adff75dd).
  [Complete source archive](https://codeload.github.com/MorpheApp/morphe-patches-library/tar.gz/42edb9710c2b63416e8eddd8096bb6a0adff75dd).
- Compiled runtime input: official `patches-2.0.0.mpp`, SHA-256
  `f0f5cfd857950ed61a26a7b2eeeecf37d4d66bece2e8f94802280e189b69ed00`.
  Its host patch classes are **not** bundled. Only the exact three extension DEX
  assets are retained; all enabled patch logic is built from the adapted source.
- `tools/morphe-compatibility.lock.json` records source archive hashes, original
  source-file hashes, extension merge order, and every runtime asset hash.
  `python3 -B -I tools/check_morphe_compatibility.py` checks these local inputs.
  Building needs no network or external official patch bundle.

The existing builder compiles the compatibility Kotlin alongside Afterglow and
copies its resources. Extension merging must remain **shared.mpe → youtube.mpe →
shared-youtube.mpe**, matching the actual upstream 2.0.0 loader output. These
extensions deliberately share descriptors; patcher merges their classes. Never
concatenate their DEX files or put them into the host patch DEX. No Afterglow
runtime descriptors collide with these extensions.

Patcher 2.1 derives a values resource's type from its filename through
`XmlEncodeUtil.getTypeFromValuesXml`, then obtains that type's ID table in
`IncrementalResourceEncoder`. The adaptation therefore decodes the stock
`res/values/strings.xml` and `res/values/arrays.xml` documents and merges its 1,737
strings and four arrays there. `string-array`, `integer-array`, and `array` share
the same Android array namespace. Existing entries remain intact; identical
entries are reused, and conflicting names stop patching. Deep DOM imports retain
attributes, styled string content, and typed array items. A custom mixed values
filename is incompatible with this encoder.

The supplied runtime code retains its upstream `app.morphe.extension` namespace.
That is a private implementation detail, not another settings entry or a claim
that all Morphe features are enabled. Preserved GPL notices and the astring MIT,
Meriyah ISC and yt-dlp-ejs Unlicense texts are included in the bundle and copied
to APK `assets/afterglow-compatibility/`. Original source notices are retained.
No upstream branding images are used.

## Preserved behavior and deliberate scope

The GmsCore adaptation retains Google-service string/authority retargeting,
manifest package and permission changes, signature/package spoof metadata,
package-visibility queries, Play Services checks, the Prime method, GNP's original
package name, device-compliance handling, account-credentials error messages,
MicroG installation/battery/update/conflict handling and mandatory Cast hiding.
Only the Cast portion of the upstream overlay patch is applied.

The stream adaptation retains the pinned 21.43 branches: startup client selection,
user-agent correction, protobuf merge repair, request-header capture, initplayback
and get_watch fallback, replacement streaming/player configuration, timeline
length correction, native media-request and Cronet/Onesie repairs, media-session
and reel flags, response parsing, and stats-for-nerds reporting. Its six raw
JS/HTML engine assets are preserved byte-for-byte. The exact upstream helpers
used for matching and control-flow insertion are included with attribution.

Upstream extension initialization remains at both application initialization and
MainActivity startup, inserted during finalize so context precedes other hooks.
The native selected-theme observer and dialog color resources are retained.
The pinned observer's complete method body is copied to
`Utils.afterglow_updateLightDarkModeStatus(Enum)`, with only its cached-ordinal
field relocated and initialized to -1. This preserves theme selection, change
detection, and last-theme persistence without initializing the unused settings
Activity. Its original `BaseActivityHook` superclass eagerly requires the
settings screen's two IDs and toolbar layout; none belongs to the Gms dialogs.
The adaptation includes all English shared/YouTube runtime strings and stream
option arrays, with displayed product references changed to Afterglow. It does
not install upstream's native settings row or replace GoogleApiActivity.
The copied string table also retains dormant upstream option data. Its branding
option names use Afterglow; no branding-options screen is registered by this
adaptation.

The original 38-object GmsCore closure also brought in its entire settings screen,
Clone-app options, non-Cast overlay customization, incidental accessibility,
playback-speed, preference-icon, like-button, content-provider, PiP-chat and
padding fixes, the upstream crash logger, experimental-version notice and a
first-run restart prompt. Those independent features are not part of this narrow
adaptation. Android link auto-verification is disabled for the renamed app;
no upstream link-handling tutorial row is installed. Source inclusion of dormant
runtime helpers does not apply their unrelated host hooks or feature defaults.

## Preferences

The retained engine reads `morphe_prefs`, preserving compatible saved values and
upstream migrations. A clean install uses these upstream defaults:

| Key | Type/default |
| --- | --- |
| `morphe_spoof_video_streams` | Boolean, true |
| `morphe_spoof_video_streams_client_type` | Enum string, `TV_SIMPLY` |
| `morphe_spoof_video_streams_av1` | Boolean, false |
| `morphe_spoof_video_streams_player_js_variant` | Enum string, `HOUSE_BRAND` |
| `morphe_spoof_video_streams_stats_for_nerds` | Boolean, true |
| `morphe_gms_core_battery_optimization_dialog` | Boolean, true |

The preferred client falls back to Android Creator according to the pinned
upstream engine. The engine master switch and client decisions require a process
restart when changed. The source adaptation itself does not add a preference UI;
Afterglow owns any integration of these controls. Do not silently write these
settings from unrelated Afterglow feature toggles.

## Verification and runtime handoff

Source compilation and Desktop loader checks passed against patcher2.1. The loader
exports 35 named Afterglow patches, with 16 objects in the GmsCore wrapper closure
and 11 in Spoof (including Afterglow's own extension/settings dependencies).
These checks establish packaging and dependency behavior, not successful playback.
`python3 -B -I tools/check_compatibility_resources.py` also passes 30 checks using
the real patcher `Document` and native filename/type resolver. It exercises
canonical routing, mixed array tags, conflict rejection, preservation of existing
values, repeated imports, and the complete pinned runtime resource table. The
build 107 strict runs applied every selected patch but failed during resource
encoding of the former custom values filename; the canonical merge addresses
that verified boundary. Build 108 then passed both strict selections, but cold
startup exposed the settings Activity initializer described above. The dedicated
observer addresses that separate runtime boundary.

`python3 -B -I tools/check_compatibility_theme.py` compares the relocated observer
with the pinned DEX instruction by instruction, verifies its initial ordinal and
references, and writes/reads a DEX to check that serialization preserves them.
The startup dependency audit also found no additional eager resource lookup in
`Utils`, `BaseSettings`, `SharedYouTubeSettings`, or the selected Gms/stream paths.
All 25 Gms, OAuth, stream-failure and client-reminder strings, client arrays, and
six raw engine files are present. These checks still require cold-launch,
selected-theme and dialog validation in the next APK.

Before publication, root must perform strict patching and inspect the resulting
APK using **one Afterglow bundle only**, both for the normal full selection and
for the selected standalone modes. Compare the compatibility native hooks with
the pinned separate-bundle baseline; verify the three extension hashes and all
raw/resources survive packaging and confirm no upstream native settings row.

Runtime QA must cover a cold launch with existing and clean preferences, GmsCore
presence/login, ordinary watch and Shorts requests, seeking/quality/speed,
background/resume, playlist navigation, full-screen changes, selected-theme
composition, absence of duplicate requests/settings, and no verifier/linkage or
missing-resource failures. Exercise the new app source in Manager as well as
Desktop; rebuilding host patch DEX is required for Manager. Preserve existing
installed package/signing identity during upgrade checks. Playback/network and
physical-device observations remain separate from source/strict validation.
