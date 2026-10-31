# EBPatcher-patches

**v0.5.6 supports ACall 14.4.0 (14409).** This independent EB derivative distribution works with **Morphe Manager 2.1.0 or later**; it is not an official Morphe release and requires no separate EBPatcher manager. `patches-0.5.6.mpp` contains **nine ACall patches and 49 editable YouTube Music patches** imported from Morphe stable sources.

The ACall patches integrate with the original recording controls, call-history database, server upload and summary paths, notifications, and settings. Optional patches provide on-device summaries and scoped advertising, analytics, device-profile, and detection changes. Refreshing the patch source does not change an installed app: patch, sign, and install a new APK to apply changes.

> Real two-way calls, recording audibility and call-history linkage, server summaries, AppProtect server acceptance, and the original Compose settings UI on a device remain unverified. Actual YouTube Music APK patching and execution also remain unverified. Original or patched target APKs, call material, and private keys are not distributed.

## Add the source to Morphe

1. Install Morphe Manager 2.1.0 or later.
2. Add the source URL or GitHub repository:
   - Source: <https://raw.githubusercontent.com/emotionbug/EBPatcher-patches/main/patches-bundle.json>
   - Repository: <https://github.com/emotionbug/EBPatcher-patches>
   - [Open the Morphe add-source link](https://morphe.software/add-source?github=emotionbug/EBPatcher-patches)
3. Refresh the source, select the target app and patches from the EB source, choose a supported original input file, review options, and use Morphe to patch, sign, and install.
4. For ACall recording, start Shizuku as shell UID 2000, authorize ACall's Shizuku access, and allow notifications. Use ACall's existing recording settings and recording button; no separate approval app or additional consent checkbox is required.

`patches-bundle.json` contains `version`, `download_url`, `created_at`, and `description`, pointing to a fixed versioned release asset. `patches-list.json` is generated from native patch declarations. A differently signed APK cannot replace the original installation directly; consider data-loss risks before uninstalling or replacing it.

## Source layout and YouTube Music

| Path | Purpose |
|---|---|
| `upstream.lock.json` | Upstream versions, commit, Music export list and targets |
| `patches/src/main/kotlin/io/github/emotionbug/patches/adot/AdotPatches.kt` | ACall declarations, options, dependencies, and defaults |
| `patches/src/main/java/io/github/emotionbug/patches/adot/` | ACall DEX and native modification recipes |
| `patches/src/main/native/` | ARM64/Thumb original-hash replacement assembly |
| `runtime/` | Shizuku runtime integrated with existing recording controls |
| `summary-engine/` | Isolated LiteRT-LM engine and model download specifications |
| `patches/src/main/kotlin/app/morphe/patches/music/` | Editable Music patches |
| `patches/src/main/kotlin/app/morphe/patches/{shared,all,util}/` | Imported shared patches and utilities |
| `patches/src/main/resources/` | Patch resources and EB branding |
| `extensions/{music,shared,shared-youtube}/` | Editable Music extensions |
| `scripts/prepare_release.py` | Release bundle validation and source JSON candidate generation |

Music sources are pinned to **Morphe patches stable v1.48.0**, commit `f3acc10e2691ffc4db29c6a6a651ee61fb54c047`. Kotlin, Java, and resources are editable, rather than merely redistributed binaries. `upstream.lock.json` records the exact 49 public patch names and compatibility.

Music targets `com.google.android.apps.youtube.music`, requires Android 8.0/API 26 or later, and takes APK input. Stable app targets are **9.20.53 / 9.15.51**; **9.42.52 / 9.41.52 / 9.40.51** are explicitly **experimental**. Inclusion in an upstream stable patch release does not make experimental app targets stable. EB branding distinguishes this derivative from official Morphe distributions.

## ACall patches

| Patch | Recipe ID | Default | Behavior |
|---|---|---|---|
| Manufacturer compatibility | `adot.compatibility.manufacturer` | On | Removes the manufacturer restriction while preserving capability, account, and permission checks |
| Embedded Shizuku recording | `adot.recording.embedded-shizuku` | On | Connects authorized Shizuku recording to original recording, history, and summary paths |
| Original AppProtect hashes | `adot.security.original-appprotect-hash` | Off | Supplies original whole-APK and native ZIP central-directory hashes; requires `originalApk` |
| Disable debugger detection | `adot.security.disable-debugger-detection` | Off | Disables guarded Java/native debugger, TracerPid, Frida, and Xposed detectors |
| Disable USB debugging detection | `adot.security.disable-usb-debugging-detection` | Off | Disables guarded ADB/developer-option detection without changing device settings |
| Galaxy device profile | `adot.device.galaxy-profile` | Off | Replaces model/manufacturer/brand metadata at selected request and telemetry construction points |
| Local Gemma summaries | `adot.summary.local-gemma` | Off | Uses explicitly downloaded Whisper and Gemma models for local transcription, summaries, and comparison |
| Remove banner ads | `adot.ads.remove-banners` | Off | Removes shared commercial banner requests, fallback banners, and reserved space |
| Suppress nonessential analytics | `adot.privacy.suppress-analytics` | Off | Deactivates Firebase Analytics and forces existing AppsFlyer stopped-tracking paths |

Embedded recording depends on manufacturer compatibility. Local summaries depend on embedded recording. All entries validate the original input; optional entries must be explicitly selected. Without the local-summary patch, its engine, screens, and services are not installed. The original server-summary path remains available.

### Scope of security and privacy changes

AppProtect initialization, HMAC, encryption, server requests, actual responses, and token handling are retained. These patches do not universally bypass root, antivirus, signature, or dynamic server rules.

The Galaxy profile uses `SM-S911N` / `samsung` only at guarded construction points. It does not change the OS, device/advertising IDs, account keys, tokens, fingerprint, hardware, device, product, system `Build` values, or recording manufacturer branches. It is not complete identity spoofing or anonymization.

Banner removal targets the shared commercial banner manager, including recent history, not caller information or spam/safety notices. It does not block all network traffic. Analytics suppression preserves Firebase Messaging, Crashlytics, authentication, calling, and server summaries. It does not remove every AppsFlyer initialization, local collection, or SDK diagnostic path; attribution-dependent promotions and deferred deep links may behave differently.

## ACall input and the original APK option

The exact target is **`com.skt.prod.dialer` / 14.4.0 / 14409**. Compatibility checks use the version and guarded method/native structures rather than a whole-APK SHA-256 allowlist. Already-patched or structurally different inputs are rejected. Compatibility declarations do not override Morphe's download resolver or guarantee a particular download page.

When selecting the AppProtect hash patch, set **`originalApk`** to the **local filesystem path of the exact untouched, signed original APK or APKM**. Rebuilt APKs and `content://` URIs are not accepted. The patch verifies the original signature and version and binds its original DEX and native contents to the actual patch input; this is not certificate pinning to the original publisher.

For APKM input, the root `base.apk` is extracted and hashed, not the APKM container. Independently of Morphe's input preparation and split handling, native patches require **both `arm64-v8a` and `armeabi-v7a` in the base APK**. Inputs with stripped ABIs or native libraries available only in splits are unsupported.

## Recording setup and limitations

At main-launcher startup, the runtime requests Shizuku authorization once only when its binder is ready, `READ_PHONE_STATE` is granted, and a fresh call-state query reports idle. It defers when the binder is absent, call state is unknown, or a call is active, and does not repeatedly prompt after denial. Recording-time permission, attribution, and AAC encoder checks still apply. There is no separate launcher icon or additional consent store.

Recording I/O runs on a worker in the `:ebpatcher_recorder` child process. The child skips original phone initialization while preserving the main process's `onCreate` instructions and exception handling. Recording/Shizuku failures reach the existing recording-only failure callback and a **`Recording failed: ...` Toast**, without opening a separate screen or intentionally ending a call. Toast visibility is subject to Android notification/background policies. This isolation is not proof of uninterrupted real calls.

Recording-related manufacturer checks in summary, recording, and AI security settings use the common recording-support decision. Existing installation-type, permission, and recorder-state checks remain; success is not forced.

Capture uses **VOICE_CALL only**: no microphone fallback, fake success, or permission bypass. The implementation passes the actual file URI and sample-based duration to the original history handler and saves recordings under MediaStore `Music/Adot`. Account, default-dialer, network, and server-summary eligibility rules remain unchanged.

### Separate call channels

Enable **Settings → EBPatcher settings → Keep call channels separate** to request two channels from one VOICE_CALL input for subsequent recordings and preserve them in AAC. The default is mono. Client, device, and encoder channel counts are checked. If the two-channel request becomes mono or cannot be verified, the existing recording error path reports failure; there is no silent microphone or mono fallback. Support depends on firmware. Actual incoming/outgoing channel order and audibility require real-call verification.

Local transcription processes each channel separately in chunks of at most 30 seconds. Timestamps and `Channel 1 / Channel 2` labels are stored and passed to the summary model, but do not establish caller identities; generated summaries may omit channel labels. Completed chunks are reused per channel. Existing mono recordings cannot be split retroactively, and additional channels increase processing time and battery use.

Stored and played recordings preserve their channels. Only the original ACall server-summary upload uses a matching reusable mono copy or a temporary mono AAC conversion. Upload channel metadata and byte counts match that file; temporary files are cleaned on success, failure, or cancellation. Retries with an existing server ID retain the original metadata-update path. Original recordings, history linkage, accounts, and summary quotas remain unchanged. Conversion failures are not hidden as success or stereo uploads.

## EBPatcher settings

Open **ACall's main Settings screen → bottom of the list → EBPatcher settings**, not Android system settings or a nested call-settings page. The entry is inserted into the ACall 14.4.0 Compose scrolling column while retaining existing entries and click handlers. It uses original settings-row resources, including the font, divider, arrow, and red **N** badge. Changed pinned model metadata displays the badge until the model settings are actually viewed. Device rendering and Compose recomposition remain unverified.

Controls include recording-failure Toasts, the startup Shizuku request, separate call channels, and links to existing recording/notification settings. **On-device summaries** is available when its patch is selected.

### Summary modes and result selection

- **Off:** stops on-device summary processing.
- **Always:** transcribes saved recordings and creates local summaries independently of API startup, completion, or quota. The first available result is applied to normal call history; Gemma compares results when both are ready.
- **When quota is exhausted:** processes only when that recording's original upload path returns exactly `TICKET_ALL_USED`. Network errors or a missing summary do not count as quota exhaustion.

The original call-summary view in recent history reads the selected result; no replacement recording screen or selector is overlaid. Existing `briefing_info`, transcript, and summary tables are updated through original Room transactions. API originals are preserved in a separate recovery journal. An available API result is retained when comparison is uncertain because of conflicting numbers, dates, negation, or insufficient evidence. With no API result, the local result is applied. Late API results are distinguished from locally generated rows, preserved as originals, and compared using the saved transcript. Local application waits while API persistence is in progress to avoid mixing API text with local speaker metadata.

Processing history offers **Recommended / API / Local** selection. This requests a database update for the same call, not merely a display preference. Model comparison is not a ground-truth judgment, and timestamps or channel labels do not prove speaker identity.

### Speaker controls

Automatic channel mapping compares unique long phrases and valid time overlap against the same recording's original API transcript. It extends mapping to short utterances only when evidence for both channels is consistent. It never assumes which channel is yours from its number; ambiguous or conflicting utterances remain `Unknown` or `Partial`.

If the API is unavailable or mapping is insufficient, open **On-device summaries → Local results → select a job → Channel 1/2 is my speech**. This applies only to that call and cannot separate speakers already mixed into mono audio. For retained local results with unchanged content, speaker-only corrections preserve row IDs, playback positions, and user edits. Jobs already removed from processing history are not automatically reprocessed.

Even with the API result selected, **API speaker N is my speech** sets your speaker for that call. `API speaker 1` is not Whisper's `Channel 1`. This updates the existing database's self-speaker ID, including while comparison is pending, without rerunning models or replacing transcripts/summaries. A control restores the original API speaker. IDs are not fixed globally across calls. Late API callbacks check transcript generation, and repeated corrections preserve user-edited individual speaker IDs.

### History and notifications

The visible completed history retains the **five newest jobs by creation order**. Older completed transcripts, summaries, and checkpoints are cleaned up, while active jobs and completed candidates not yet applied to the original database are protected. Pending candidates and API recovery journals are separate from visible history. Original recordings and ACall call history are not deleted by this cleanup.

Optional **silent processing notifications** show Whisper chunks, Gemma initialization, summarization, and comparison. Only the same call's existing summary notification is updated; other call and recording notifications are left alone. After database application, status distinguishes `Local applied`, `API retained`, and `Comparison pending`, and whether an existing notification was updated or a new one created. Denied notification permission does not prevent inference.

Settings distinguish original API copies, AI summaries, and transcripts, and allow manual retry of failed jobs. Local-result deletion is allowed only in **Off** mode and does not delete original recordings or ACall history. Already-applied results and API recovery journals remain after processing-history deletion.

## Models, downloads, and execution policy

Models are not included in the patch bundle. Download each explicitly in settings:

| Model | Download size | Purpose and license |
|---|---|---|
| Whisper large-v3-turbo Q5_0 | 574,041,195 bytes | Per-channel 16 kHz transcription, fixed Korean language and beam size 5; MIT |
| Gemma 4 E4B | 3,659,530,240 bytes (3.41 GiB) | Text-only summarization and comparison; Apache-2.0 |

Gemma's audio/video backends are not initialized. Incompatible model files and checkpoints cannot substitute for the pinned models. Use **Update model** to install the current model; downloads never begin automatically. Larger models require substantial memory and processing time.

Downloads require no account or token and verify pinned size and SHA-256. **Update** retains the installed model while downloading and validating its replacement, installs it atomically, and then removes the previous file. Progress belongs to the model hash and transfer session so old byte counts cannot leak into a new download. Only one download runs at a time, with no automatic start or retry. If inference owns the engine, a verified download waits for installation ownership. New transcription requires both models; resummarizing or comparing a saved transcript needs only Gemma. Whisper is released before Gemma initialization.

Processing runs in a separate process after a fresh check that no call is active. Active or unknown call state defers work. Detecting a new call stops only the summary process; completed audio chunks can be reused. Native cancellation is not guaranteed to be immediate. Battery and storage constraints still apply.

- When `PowerManager.isInteractive()` is **true**, new Whisper and Gemma work uses **CPU**. An unreadable interactive state also selects CPU.
- When it is **false**, work prefers **Whisper Vulkan and Gemma LiteRT GPU**. Only failures classified as initialization unavailability fall back to CPU. Inference errors, incomplete results, and cancellation are not hidden by CPU retries.
- If the screen becomes interactive during GPU work, completed transcript chunks and the job revision are preserved, the dedicated process exits, and Android schedules CPU resumption. Switching is not guaranteed to be immediate; the current chunk or Gemma text work may repeat.
- CPU work continues on CPU if the screen turns off; it is not restarted just to select GPU. Coordination, Whisper, and Gemma threads run at background priority. CPU processing still consumes power and memory.

The selected backend and fallback reason are available in `EBPatcherSummary` logs. There is no NPU backend or model conversion. Device speed, temperature, battery use, and long-call performance are not established by host tests.

### Privacy and accuracy

The local AI path does not upload recordings, transcripts, or summaries. The separate original ACall server-summary path still uses its temporary mono input and original account, network, and quota rules. Optional analytics suppression is not a guarantee of zero tracking traffic.

AI output can be incorrect, omit information, or misclassify silence as unintelligible speech. Token limits use actual output/KV counts; truncated responses are not saved as successful results. Comparison reasons are also AI-generated. Logs contain stages, chunks, token counts, durations, failure categories, and job IDs/revisions, but not call content, phone numbers, paths, or upstream exception messages. Settings and result dialogs do not impose an additional screenshot restriction. See [summary design and limitations](SUMMARY-DESIGN.md) and [patch scope](PATCH-SPEC.md).

## Build and validation scope

Requirements:

- **Java 21** and the official **Gradle 9.8.1 wrapper**. LiteRT-LM 0.18.1 includes Java 21 class files; JDK 17 cannot compile it.
- **Android SDK Platform 36 / Build Tools 36.0.0**, **NDK 29.0.14206865**, **CMake 3.22.1**, a host C/C++ compiler, and Python 3.
- Official **Morphe patcher/library/plugin 2.0.0** from GitHub Packages. Configure a token with `read:packages` through local `GITHUB_TOKEN` and `GITHUB_ACTOR`, or user Gradle properties `gpr.key` / `gpr.user`. Never put tokens in the repository, command examples, or logs. CI uses workflow `packages:read` permission.

Whisper JNI builds for arm64-v8a/x86_64 from hash-pinned whisper.cpp v1.9.5 sources. Gradle verifies and prepares Vulkan headers and uses `glslc` from the pinned NDK; a separate Vulkan SDK is unnecessary.

```sh
export ANDROID_HOME=/path/to/Android/Sdk
./gradlew --no-daemon :runtime:test :summary-engine:test :patches:build :patches:generatePatchesList :patches:buildAndroid
```

Run `buildAndroid` last. The output is `patches/build/libs/patches-0.5.6.mpp`, containing host and Android execution content. Supply a private integration fixture through `EBPATCHER_TEST_APK`; do not commit it. The list generator isolates the current-version archive so stale build files cannot mix an old version with current metadata.

Current source validation recorded **264 passing tests** (runtime 128, engine 36, patches 100), with no failures or skips. Coverage includes private ACall 14.4.0 APK patching/rebuilding, original-code preservation, recording/summary database/upload boundaries, and settings resources. A separate Morphe 2.0.0 consumer loaded all **58 exports**, applied all **nine ACall patches**, and rebuilt an APK. These checks do not establish device installation, real calls, server acceptance, original Compose rendering/recomposition, Music APK behavior, or device model performance. Release-asset integrity and publication status must be checked against the actual release, not inferred from source tests.

## Release workflow

The v0.5.6 asset is **`patches-0.5.6.mpp`**. For a new release:

1. Update the source version and build and validate the bundle and generated patch list.
2. Publish the asset and checksums at the new tag's fixed release URL.
3. Download the public asset again and compare it with the build output.
4. Use `scripts/prepare_release.py` to validate the bundle and generate candidate source JSON, then update `main/patches-bundle.json` only after public asset validation.
5. Users refresh the source in Morphe, then patch and install to apply changes.

Do not publish source JSON before its binary is available, or overwrite/reuse published release tags, URLs, or assets. The actual release publication result determines whether assets are available. No bundle size or checksum in this README substitutes for the release's current checksums.

## Licensing, attribution, and trust

The combined distribution follows [GPLv3](LICENSE) and the preserved [NOTICE](NOTICE). Original EB code is [Apache-2.0](LICENSES/Apache-2.0.txt); the Shizuku API/provider is MIT, with notices retained in `runtime/THIRD-PARTY-NOTICES.txt`. Preserve upstream attribution, notices, and licenses, including those for imported Morphe patches, extensions, and runtime/model components.

No rights to Morphe trademarks are granted. EB is an independent derivative distribution, not an official Morphe release. Hashes verify integrity, not independent publisher authenticity. Patch bundles are executable code: use a source you trust.
