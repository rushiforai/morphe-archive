# SBS playback patch preparation

Status: experimental direct-VOD preference patch compiled successfully and
applied with Morphe Desktop 1.16.0 to the source APKM. The resulting APK was
rebuilt and its provider-selection bytecode re-read with apkanalyzer. The
VOD guard, URL check, fallback call and original-code fallthrough are present.
The maintainer subsequently reported successful operation on a phone. Device,
title and midroll coverage were not supplied, so broader ad removal remains
unconfirmed. The implementation remains explicitly experimental.

The distributable test bundle is `sbs-patches-1.0.0-experimental.mpp` in the
workspace output directory. SHA-256:
`ada06121dc56656f57fbbd418c2a6e1dac0a709df86e4b7a00141dc97ba8eaa4`.
The local test APK is unsigned and is not directly installable.
The desktop output failed a separate 16-KiB zipalign check. An additional
`sbs-direct-vod-aligned-unsigned.apk` was produced using Android SDK zipalign
and passed `zipalign -c -P 16 4`. This checks ZIP alignment, not native ELF
compatibility or Android runtime behavior. Source/copy APKM hashes still match.

Analyzed target: com.sbs.ondemand.android 6.3.0, versionCode 16435.
Source APKM SHA-256:
`d820923e30305a2a07f1e3a7e5c2a7d3c0b85ddc68d0ada36d0ea1f150aa006e`.
Version 6.3.0 is marked experimental, not claimed supported for all variants.

## Observed mechanism

PlaybackController.processStreamProvider prefers GoogleDAIProvider from the
server's streamProviders list. setupGoogleDaiProvider selects VOD or live
requests. VOD reaches AdsController.requestAdStream, which requests a Google
DAI stream and later feeds its URL to the same ExoPlayer instance.

The existing fallback searches the server response for AkamaiHLSProvider and
loads its URL. If no such provider exists it reports an error and stops playback.
There is no evidence yet that the fallback is available for every title, or
that its streams contain no advertising.

## Preparation implemented

Four fingerprints identify the VOD request, preroll detection, provider choice
and Akamai fallback. An opt-in compatibility probe resolves all four without
inserting bytecode. The behavioral patch depends on this probe.

`Prefer direct VOD stream (experimental)` prepends a guarded choice to
processStreamProvider. For streamType `vod`, it searches for the first
AkamaiHLSProvider. If its URL is non-empty, it calls the app's own fallback
with isFromError=false and returns. Otherwise it executes the original code.
Live content always executes the original code. The provider list, server
requests and AdsController are not modified. This does not guarantee the
alternative stream is ad-free or that playback works on a device.

The target method's eight-register layout was checked against apkanalyzer
disassembly. The patch uses only local v0-v2, preserves p0-p2, and refuses a
different register layout. Existing instructions and catch blocks are retained.

Do not implement an unconditional early return from requestAdStream: in the
DAI path that also prevents the content stream from being requested.
Changing isAdPlaying alone changes UI/state and does not remove media segments.

## Next checks before a behavioral patch

1. Build the bundle and run the explicit compatibility probe on a working copy.
2. Verify raw bytecode where JADX reports reconstruction errors.
3. Establish provider availability and stream behavior in an authorized test.
4. Validate the implemented VOD-only preference and original-path fallthrough;
   examine time mapping and resume behavior on a real device.
5. Test start, midstream breaks, resume, seeking and next episode on a device.

No location checks are inspected or changed. No APKs or decompiled app sources
are included in this repository.
