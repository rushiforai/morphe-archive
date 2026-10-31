# NPO Start Android TV

**Supported app:** 1.48.2-2405 · **Build:** 245497937 · **Input:** APKS

`nl.uitzendinggemist`

[Download the original APKS](https://buzzheavier.com/1s5dezsqvxbq){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

Watching a programme can load preroll ads and send player, audience and diagnostic events to NPO and several other providers. The TV build is protected by PairIP, so the patches also restore parts of its startup and sign-in code. In Morphe Manager, refresh the patch source, choose NPO Start Android TV and select `npo-start-atv-android7.apks` as the original input. Match the build number as well as the version: a phone APK with the same version name is not this TV target.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Preroll and IMA ads | The player reads five optional preroll inputs and can load an optional IMA ad loader. | Hide ads leaves those inputs and the ad loader empty, so the player uses its existing content-only playback path. |
| NPO Tag, Topspin and DAM | App and player events go through NPO Tag/Topspin and the Govolte `mob-event` path. DAM and player-session inputs feed further measurement. The hostnames were not resolved. | Disable tracking stops the inspected producers. No separate progress or history upload was found outside this path. |
| STER targeting | The optional IMA configuration builds advertising targeting data for STER. | Disable tracking removes that configuration before the targeting data is built. Functional DASH and Widevine fields remain. |
| Sentry and [Bitmovin](../trackers/bitmovin.md) analytics | Diagnostic and player-measurement SDKs start with the app. Sentry also has a startup performance provider. | Disable tracking stops their initialization and removes the Sentry startup provider. |
| Google telemetry and Cast/ad diagnostics | Google DataTransport collects client metrics and uploads queued CCT batches. Cast, TV-ad and advertising-ID diagnostics have their own producers. | Disable tracking stops collection and the send method. Queued batches are discarded locally without an upload. The diagnostic producers stop, four advertising permissions are removed and functional Cast and media methods stay the same. |

## What remains and what is still unknown

Authentication, DRM and functional media services remain, and content and sign-in requests continue. Account, profile and follow functions, recommendations and history from the server keep working. NPO still checks whether your account is entitled to Plus content. The patches do not forge a token, subscription or DRM licence. The current evidence does not establish removal of broadcast ads, ads stitched into a stream or ads handled by a remote Cast receiver, and a complete traffic audit is still open.

Network changes, audio-route events, fresh sign-in and longer background and foreground use still need testing on a device. When reporting a problem, say whether it happens at startup, sign-in or playback, and include the programme or channel. A working Plus account does not establish that the free-account ad path works.

Updates between patched builds need the same signing key to keep app data. Follow the installation guide when replacing the publisher-signed app, and keep a working patched installer available when testing an update. Use the complete Android 7.0+ (API 24) TV APKS linked above. The earlier API 32 TV input remains supported. Match the publisher's minimum SDK as well as the build number; the patches accept only the inspected API 24 and API 32 variants.

## Available controls

Disable tracking, Fix PairIP startup, Hide ads.

All three are on by default, also in Simple mode. Hide ads and Disable tracking each include Fix PairIP startup. Fix PairIP startup restores the TV build's startup data, AppAuth discovery and token requests, and the functional network and audio callbacks.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 29 October 2026 against `2190e42`: [TV research and test evidence](https://github.com/johnneerdael/dutch-applications-patches/blob/2190e42b1877badaca7a8e1e520e83aa7e95d90a/docs/research/2026-10-29-atv.md), [collection paths and destination limits](https://github.com/johnneerdael/dutch-applications-patches/blob/e2c30be/docs/privacy/npo-start-android-tv/README.md), [PairIP handover](https://github.com/johnneerdael/dutch-applications-patches/blob/2190e42b1877badaca7a8e1e520e83aa7e95d90a/docs/NPO_START_TV_PAIRIP_HANDOVER.md) and [patch source](https://github.com/johnneerdael/dutch-applications-patches/tree/2190e42b1877badaca7a8e1e520e83aa7e95d90a/patches/src/main/kotlin/patches/npostarttv). Free-account playback with Hide ads and Disable tracking is confirmed on a 32-bit ARM Android 14 TV. After the token-request crash was fixed, the combined build passed three cold starts and playback advanced without an error. Bytecode, manifest and Android runtime tests also pass. These checks cover startup, playback entry and the patched methods, not complete network silence. [How to read the evidence](../reference/methodology.md).

The Android 7+ input was validated on 30 October 2026: [port and validation evidence](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-npo-tv-android7.md). Installation, startup and the emitted callbacks, token requests, ad gates and privacy gates pass on an API 24 ARM64 emulator. The same patched APK was installed on the user's ARMv7 Android 14 TV, where the user confirmed it works. Physical Android 7 TV behavior, long-duration playback and complete traffic silence remain unverified.
