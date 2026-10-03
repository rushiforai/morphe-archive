# Twitch Android 31.3.1 Reverse-Engineering Reference

## Target
- Package: tv.twitch.android.app
- Target version: 31.3.1
- Test device: Samsung SM-G990B2
- Android: 16 / API 36
- Morphe Manager: 1.33.0
- Morphe Patcher: 1.15.0

## Current blocker: EmoteUrlUtil
Target class: tv.twitch.android.util.EmoteUrlUtil

Do not assume donor signatures from another Twitch version, PurpleTV, BTTV, or an older patch apply to this target. Actual 31.3.1 bytecode is authoritative.

Findings:
- Donor assumed generateEmoteUrl(String,float) -> String.
- v1.2.4 failed: expected one public static EmoteUrlUtil.generateEmoteUrl(String,float) method.
- v1.2.5 used a broader String-input/output matcher and failed because generateEmoteUrl(String,...) was ambiguous.

Conclusion: extract the exact 31.3.1 method list/signatures before another URL-hook release.

## Relevant release history
### v1.2.0
Commit 7c9804970adbb0893e079b72a1591826157159be
Animated picker emotes use GIF assets. Device result: native Twitch animated picker emotes appeared; third-party animated picker emotes did not.

### v1.2.1
Commit 748389c1f190684bd7d9fcc657a01a0a2c558d74
External URL resolver attempt. Device result: entire emote menu became blank.

### v1.2.2
Commit 2508b2a6fefb098c9705ce4b71eec3add73da31c
Restored working native picker model types.

### v1.2.3
Commits cdd76c1ed683fcbf960478cab5581961a4ae1532 and a9ca8c26268c04f8fc8bba0a9d22a6170d85d37a.
Attempted animated picker URL hooks. Failure: tv/twitch/android/shared/emotes/utils/AnimatedEmotesUrlUtil was not found. This class must not be used for Twitch 31.3.1.

### v1.2.4
Commit f936fe7c997a6c36ff2244ac659e0105a1ad453b.
Switched to tv/twitch/android/util/EmoteUrlUtil, but assumed the wrong exact method signature. Build/release succeeded; Morphe application failed.

### v1.2.5
Commit 82ef09b6b01891d30264f2f085187b512010f0e6.
Loosened method matching; Morphe application failed because the matcher was ambiguous.
Release v1.2.5; Actions run 296; run ID 37004257357; asset patches-1.2.5.mpp.

## Picker architecture
Relevant files:
- patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/emotes/EmotePickerPatch.kt
- patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/emotes/EmotePickerUrlPatch.kt
- patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/emotes/EmotePickerFingerprints.kt
- patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/emotes/ThirdPartyEmotesPatch.kt
- extensions/extension/src/main/java/app/morphe/extension/twitch/emotes/EmotePickerBridge.java

Current fingerprints:
- Presenter class: Loqf;
- State builder return: Lmtf;
- Emote set: Lesf;
- Picker section: Lqqf;
- Tuid: Ltv/twitch/android/models/Tuid;

Known presenter methods:
- G2(EmoteSet, Integer, EmotePickerSection) -> EmoteUiSet
- H2(Tuid, EmotePickerSection) -> void

Current hook calls EmotePickerBridge.onPickerOpened(...) and merges at the state builder return via EmotePickerBridge.mergeGlobal(...), casting back to Lmtf;.

## Bridge/reference behavior
- Third-party emotes are represented as Twitch picker models.
- Animated/static asset type follows the emote.
- Animated 7TV picker URLs may convert .webp to .gif.
- Global merge augments the existing picker list.
- Only the ALL section is augmented.

The twitch-build/ donor is reference material, not authoritative for exact Twitch 31.3.1 signatures.

## Donor projects
PurpleTV and BTTV Android were used as implementation/reference material. They must not be treated as proof of Twitch 31.3.1 bytecode signatures. BTTV has an older AnimatedEmotesUrlUtil approach, but that class is absent from the target.

## LOCKED: animated chat emotes
WORKING AND LOCKED. Do not modify the established animated chat rendering path while fixing the native picker. Do not casually change EmoteImageLoader, CenteredImageSpan, the working animated WebP drawable path, or related chat rendering.

## Required artifact
When available, add the decompiled/smali representation of tv.twitch.android.util.EmoteUrlUtil from the exact Twitch 31.3.1 APK/APKM.
Minimum: all generateEmoteUrl methods, access flags, exact parameter descriptors, exact return descriptor, and preferably smali/bytecode.
Preferred files: classes/EmoteUrlUtil.java, smali/EmoteUrlUtil.smali, signatures.md, hashes.txt.

## Verification rule
Build/release success is not runtime proof. A picker URL fix is working only after Morphe applies successfully to Twitch 31.3.1, native picker displays, third-party static emotes display, third-party animated emotes animate, and the locked chat animation remains unchanged.
