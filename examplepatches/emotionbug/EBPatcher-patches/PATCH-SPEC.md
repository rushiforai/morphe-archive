# Native Morphe patch specification

Bundle: **0.5.6**, Morphe Manager **2.1.0+**, published Morphe patcher/library/plugin
**2.0.0**. Nine ACall exports and 49 editable YouTube Music exports share the native
`.mpp` bundle. Source installation and build instructions are in [README](README.md).

ACall package: `com.skt.prod.dialer`; versionName: `14.4.0`; versionCode: `14409`.
Native declarations target package + version + code, not a whole-APK hash allowlist.
Recipes reject unexpected original method/native-library structure or reapplication.
Native options require both arm64-v8a and armeabi-v7a libraries in the base; a
split-native layout or ABI-stripped input is rejected rather than silently skipped.
Morphe owns input preparation, signing and installation. Compatibility declarations
cannot override its download resolver or force APKMirror navigation.

No target APK is distributed. Guards validate the supported input's structure;
they are not a whole-APK fixture hash allowlist.

## Compatibility

`adot.compatibility.manufacturer`, in `classes3.dex`:

- `Lhya;->a()Z`: remove manufacturer checks, retain the install-kind `Lo1i;->b()Z`
  check and its initialization touch.
- `Lhya;-><clinit>()V`: retain singleton initialization and original `Lumc;->c(I)B`
  eligibility encoding. Eligible enum 2 maps to byte 7, not literal 2.
- `Lhya;->f()[Lzci;`: remove the pinned manufacturer branch; preserve the original
  permission arrays, SDK/media branches and fallback when this patch is used alone.

The manufacturer-only recipe changes no Manifest entries and adds no recorder.
Morphe may reserialize DEX; byte-for-byte output preservation is not the native contract.

## Commercial banner suppression

`adot.ads.remove-banners` is optional and independent of recording/summary patches.
It guards five original `classes3.dex` methods in `Lkrr;`, the app-owned Google
and Kakao AdFit waterfall banner manager. The placement enum includes
`CALL_LOG` (recent history), keypad, settings, search and other commercial hosts.

- Retain constructor/provider initialization, then collapse the outer and inner hosts.
- Replace `a(jmd)` request dispatch with existing cleanup and exactly one native
  unavailable callback (`x92.e(bf,ze)`); collapse both hosts again after the callback.
- `c()` retains `o()` cleanup but cannot restore a visible fallback.
- `f(mrr)` does not create the commercial default placeholder.
- `l(ConstraintLayout)` retains child reparenting while keeping the new host collapsed.
- No generic banner resource deletion, SDK async no-op, or global network block.
  Caller information, spam warnings and noncommercial notices remain outside scope.

Full instruction fingerprints reject drift/reapplication. Constructor branches and
the receiver register before its original clobber are covered. Bounded DEX execution
checks unavailable completion, fallback visibility and reparenting. Actual original
APK integration and the binary-only Morphe consumer passed on 14.4.0.
Actual native banner execution and visual correctness remain unverified.

## Nonessential analytics suppression

`adot.privacy.suppress-analytics` is optional and independent of recording.
It sets application metadata `firebase_analytics_collection_deactivated=true`.
The packaged Firebase `tts.u1()` reads this key; `x5w.c()` checks it before persisted
or application-requested collection-enabled state, so enabling APIs cannot override it.

In `classes.dex`, the guarded `AFf1fSDK.AFLogger()Z` getter replaces its sole
`IGET_BOOLEAN w:Z` with same-width `CONST_16 1`. Every other instruction, branch,
exception path and SDK control-counter update remains. This getter is the only
direct reader of `w:Z`; startup or `stop(false)` cannot restore stop-aware tracking.
The SDK's existing stopped paths, including error completion code 11, remain intact.

This is not a zero-telemetry guarantee: SDK initialization, local identifier gathering
and diagnostic paths are not globally removed. Attribution-dependent promotion and
deferred deep links may change. Firebase Messaging, Crashlytics, auth/account/cloud,
phone and server-summary code are unchanged. Tests cover all 128 control-counter
states and both stored flags, native error paths, drift and standalone APK isolation.
See [Firebase collection configuration](https://firebase.google.com/docs/analytics/configure-data-collection?platform=android).

## Embedded recording and native integration

`adot.recording.embedded-shizuku` depends on the compatibility patch. Recording
uses the embedded runtime; there is no companion-package option or separate
no-op summary toggle.

- `Lkho;-><clinit>()V` in `classes2.dex` targets the app's own package, actual local signing
  certificate fingerprint and `.action.CONNECT` service action.
- Embedded mode removes obsolete external-companion microphone/storage checks
  from `hya.f`, retaining the original app-media and installation fallback.
  Shell privileges are checked separately; permission success is never fabricated.
- Morphe merges the independently implemented runtime and official MIT-licensed
  Shizuku 13.1.5 API/provider classes; no fixed output DEX number is promised.
- Manifest additions declare the Shizuku provider, non-exported recorder service in
  `:ebpatcher_recorder`, permissions and foreground-service subtype. No setup activity,
  extra launcher or consent provider is added. Provider initialization enables binder
  forwarding before publication. Original components and resource IDs remain; launcher
  startup hooks retain original instructions and catches.
- `assets/ebpatcher/THIRD-PARTY-NOTICES.txt` accompanies the embedded runtime.

### Recording controls, capture and storage

The original dialer's recording settings and recording button control requests.
There is no extra approval screen, consent preference or manual preflight endpoint.
Old additional-consent values are ignored. Shizuku must run as shell UID 2000, not root.
Start still checks Binder availability, API version, authorization and notification
permission; shell attribution and encoder preflight remain part of each connection.

Only the main launcher requests startup Shizuku authorization, once the binder is
ready, READ_PHONE_STATE is granted, and a fresh call-state read is idle. Missing
binder, unknown state or an active call defer the prompt; denial does not loop.
The recorder child skips original phone initialization. Main-process onCreate
instructions and catch regions remain; Morphe normalizes debug line coordinates.

Recording I/O runs on a worker in the recorder child. Every reported recording failure
queues a main-looper `Recording failed: <reason>` Toast before delivering the original
recording-only `wz0 → gya → me1.A` error callback. Toast failure cannot escape into
the call lifecycle; Android visibility/notification policy may suppress its display.
No error opens an activity, requests authorization or deliberately aborts ordinary calls.
The recording notification opens the original recording settings and retains cancellation.
This isolation is not an unconditional claim that untested live calls cannot fail.

The shell UserService checks its app owner UID on every request. It creates an
independent `com.android.shell` context, rather than inheriting the client's
operation package. API 31+ passes this context to AudioRecord.Builder; API 29–30
initializes the dedicated shell process's application attribution. Failure is
reported, not replaced with microphone capture.

Actual recording uses only VOICE_CALL, 16 kHz PCM16, AAC-LC and an MPEG-4
container. Mono remains the default. The in-app **Keep call channels separate**
setting requests stereo for the next recording; no microphone fallback or
concurrent directional AudioRecords are introduced. Stereo capture requires
both client and device configurations to report two channels and the source
to remain VOICE_CALL. Missing verification, a channel downgrade or an encoder
format change fails the recording rather than claiming separation.
Duration and AAC timestamps use PCM frames, not the interleaved sample count.
Silence, insufficient duration,
client silencing, missing frames and codec timeouts reject completion. The app
owns a pending MediaStore row under `Music/Adot`, supported from Android 10.
Publication and readability checks precede the successful native callback.
Visible foreground notification cancellation, client/shell Binder death,
generation fencing and pending-file cleanup terminate failed sessions.
Stop-request state is independent of diagnostic status text.

### Settings eligibility

Embedded mode also delegates five duplicated manufacturer/model decisions to `hya.a()`:

- `tj3.f(rj3)`: call-summary settings warning.
- `CallRecordSettingActivity.onCreate(Bundle)`: unavailable text and initial warning.
- `CallRecordSettingActivity.y0(boolean)`: automatic-recording toggle.
- `lx0.x(Object,Object,Object)`: AI security recording-related toggle.

Each exact DEX window validates operands and destinations, rejects incoming branches
or handlers entering its interior, and keeps the original code-unit footprint.
Original outer gates, permission requests, recorder availability, settings transitions
and failure destinations remain. Shared support false still takes the unavailable path;
there is no unconditional success or global manufacturer spoof.


### Native callback and summary ownership

Recorder Binder token: `com.skt.prod.tphonerecorder.ITPhoneRecorder`.

- Transaction 1: start, filename String + callback Binder.
- Transaction 2: stop, filename String + callback Binder.
- Transaction 3: recording state.
- Callback token: `com.skt.prod.tphonerecorder.IRecordCallback`.
- Callback 1: original filename.
- Callback 2: original filename, readable MediaStore URI, actual duration in ms.
- Callback 3: original filename and error Bundle with start/stop job type.

The original `nma → pma → uu4` path handles call matching; its existing
`CommSyncController → CreateBriefInfoUseCase` path owns server-upload eligibility.
The optional local-summary patch can create a missing canonical briefing only
from the exact native recording/communication-log association, with generated
native IDs and no upload key or additional upload trigger. Account, default-dialer,
network/settings and server checks remain authoritative. A finalized recording
is not a promise of an automatic server summary.

Cloud-only hooks at `gnq.b`, `zoq.b`, `zoq.f`, `gu3.L` and `knq.a`
provide a temporary mono upload without modifying the final
recording or shared descriptor accessor. Original file validation precedes
conversion; failures follow the existing per-item failed-file path. Mono inputs
pass through; matching companions are verified, otherwise stereo is mixed into
temporary AAC with actual length and MONO metadata. Existing server-ID retries
use the native metadata update before uploading changed audio; ambiguous duplicate
responses use native retry failure. Coroutine-scoped file leases survive codec/
stream close and clean up on completion/failure/cancellation. No new upload trigger,
request ID, account/quota bypass or fallback to a mismatched payload is introduced.
See SUMMARY-DESIGN for the upload contract and unverified server boundary.

## Integrated settings and local Gemma summaries

The embedded-recorder patch adds a row inside the main settings tab's Compose
scrolling Column. `bmo.invoke` receives an insertion at code-unit `0x1e7`, after
native row iteration and before bottom spacing/Column closure. Mutable DEX labels
preserve loop and branch destinations. The renderer and the reflected
`pu6.b(Function1,vpg,Function1,byb,int,int)` AndroidView bridge have exact guards.
The bridge uses the composer's classloader; AndroidView owns factory/view reuse.
There is no overlay, reparenting, ListView footer or obsolete adapter hook.
The factory inflates original `settings_common_normal_row` (`0x7f0d01ca`) and
uses the native N drawable (`0x7f08050a`). The model badge is acknowledged only
after current metadata is shown. Actual vendor Compose rendering/recomposition
remains unverified.
Private English settings control failure Toasts and optional startup authorization,
with navigation to original recording/notification settings and fresh idle-state checks.

`adot.summary.local-gemma` is default-off and depends on embedded recording. Its
engine assets and four summary components are installed only when selected.
Modes are Off, Always and When quota is exhausted. Original cloud behavior remains.
Always processes saved recordings independently of API timing and availability.
The first usable result fills canonical native history; Gemma compares later API
and local candidates and updates the same call. API originals are retained outside
those selected rows. Quota mode observes only exact `TICKET_ALL_USED` comparisons in
`ui.F`, not a generic HTTP status, missing summary or manual-upload state.

Saved recording hooks at `tx4.c` and original-summary completion at `yx9.l` feed
durable extension jobs. Persisted recording/briefing IDs bind events; original DB
queries run on its existing query executor and reject ambiguous associations.
Duplicate events, late original results and worker revisions cannot overwrite a
newer result or attach it to another recording.

The settings screen downloads Whisper and Gemma independently; no weights ship in
`.mpp`. Whisper large-v3-turbo Q5_0 is 574,041,195 bytes, MIT, pinned in
`summary-engine/whisper-model.json`. Gemma 4 E4B is 3,659,530,240 bytes, Apache-2.0,
pinned in `summary-engine/model.json`. **Update** downloads the newly pinned model
while retaining the old installed file, verifies HTTPS/size/SHA-256, publishes
atomically, then removes obsolete model weights. Failed/cancelled updates preserve
the old file. Progress is bound to role, model digest and transfer token so stale
byte counts cannot describe a different model. A verified transfer waits
cancellably for installation ownership. Only one download runs at a time.

The isolated loader includes LiteRT-LM 0.18.1, its Kotlin dependencies and pinned
stock whisper.cpp v1.9.5 JNI for both 64-bit ABIs. Audio becomes bounded, time-aligned
30-second mono WAVs per input channel for Korean-fixed, beam5 Whisper, without downmixing.
Whisper is released before Gemma text inference. Interactive or unknown power state
selects CPU; noninteractive state prefers GPU. Gemma audio/vision backends are not
initialized. Whisper uses an optional, statically isolated Vulkan JNI payload and
an independently loadable CPU payload. GPU initialization-only fallback is bounded;
inference failures, cancellation and incomplete output are not replayed on CPU.
Gemma native operations share one owning thread. Optional OpenCL/vendor support
library declarations do not make GPU support an installation requirement.
New ASR requires both models; saved-transcript refinement requires only Gemma for
the new timed-document format; legacy flat transcripts require fresh ASR.
Transcripts retain model-estimated millisecond segments and neutral Channel 1/2
labels, never verified caller/recipient identities. Short text goes directly to
schema-constrained title/summary generation; long text uses bounded reduction.
Per-channel checkpoints bind segment schema, model, decoder/configuration and PCM
identity; incompatible checkpoints cannot be reused.
Up to eight decoded channels are retained; midstream rate/layout changes fail
rather than lose channel identity. More channels require more transcription work.

Native 14.4.0 integration captures `iw9.<init>`'s existing Room database and the
exact `ly4` recording/communication-log association. It writes `briefing_info`,
`briefing_converted_text`, `briefing_summary_title` and `briefing_summary` inside
the original Room transaction and invalidation boundaries. Real generated row IDs,
the original call time, recording source type and COMPLETE conversion state are
used; server upload keys and dirty flags are not created or changed.
`hh2.invoke` cleans only extension-owned conflicting rows inside the original API
DAO transaction; `yx9.l` copies the matching API self/title/transcript generation
before queueing its success callback. A later snapshot must match that generation;
detached self metadata is never overlaid onto another snapshot or native user edit.
API backups and prepared/applied intents survive visible-history pruning and
support interrupted-write recovery.
`yx9.r` publication ownership starts before its parent metadata transaction and
survives coroutine suspension until true completion or failure. Local selection
and recovery check ownership inside their native write transaction, preventing
interleaving between API parent metadata and API child persistence. A stable extra
register retains the coroutine identity across original wide-register reuse; all
original argument values, branches, suspension returns and exceptions are preserved.
When the exact existing briefing is available, its pre-parent presentation is
journaled for restart recovery, including native edits. Continued requests use only
unique live server-ID bindings. API-owned rows are never deleted by local cleanup.
A matching API callback may refresh genuine parent-only changes on existing API
rows; unauthenticated observations of an extension override remain excluded.
Existing history/detail readers consume canonical rows without presentation
adapters or source-selection overlays.

Recommended/API/Local choice and reason remain in extension settings, but choosing
one requests a canonical DB update, not a display substitution. Numeric-support
checks, exact source quotations and model uncertainty prevent unsupported automatic
replacement; they are not an accuracy proof. Late API revisions invalidate stale
recommendations without erasing manual choice. The visible history contains five
newest-created terminal jobs plus active work. Pending native applications remain
durable even after leaving that visible history; consumed older payloads are
removed under leases. Original recordings, native history and recovery backups are
not history-pruning targets.

Summary notifications show real Whisper/Gemma stages silently, without transcript
or caller content. The main-process owner serializes worker status, committed DB
refreshes and the native summary publisher. It reuses only a same-call native
tag/ID, otherwise allocates a job-specific key. Worker heartbeats renew the ongoing
lease; worker death does not leave a permanent progress notification. Terminal
messages report committed local/API/pending state and whether an existing notice
was updated. Notification permission is optional and does not gate inference.

The separate summary process checks fresh idle state and stops only itself on a
new call. JobScheduler applies storage/battery constraints. Unknown phone state,
missing models and interrupted work do not alter phone or recording outcomes.
Manual retry, model deletion, and Off-only local-data deletion are provided.
Original recordings/summaries are retained. See [SUMMARY-DESIGN](SUMMARY-DESIGN.md)
for exact boundaries, model provenance and observed accuracy limitations.

Local transcript selection resolves native `talker_id` against `my_talk_id` before
writing canonical rows. Only the exact recording/audio/briefing API recovery
snapshot supplies automatic identity evidence. Unique normalized long text and
compatible valid times establish anchors; consistent distinct speakers on both
stereo channels permit propagation. Mixed mono stays per-utterance. Repeated,
conflicting or unsupported evidence does not silently become self speech.
Schema 5 stores per-job Auto / Channel 1 / Channel 2 choices, an optional explicit
API self-talker ID, and durable per-row speaker-edit ownership. API self selection
requires an ID present in the exact original native journal. It applies to queued
API results and local anchor mapping without changing the retained original.
API IDs are not recording channel numbers. Stale IDs fall back to original
identity and are reported; no global self-ID assumption is made.
Mapping-only updates preserve native row IDs, text edits, timing and summary edits.
Missing/independently edited native speaker rows remain protected across repeated
corrections and restarts. Own API metadata corrections and mixed local/native rows
are not captured as independent server responses. No native screen adapter is installed.



## Original AppProtect hashes

`adot.security.original-appprotect-hash` is optional, default off, with no other selectable patch required.
It preserves two different inputs to the existing verifier:

Enabling this optional patch requires the `originalApk` option: an exact signed
original APK or APKM at a local filesystem path. A `content://` URI is explicitly
rejected; a rebuilt APK is not a substitute. The original signature and target
version are checked (without pinning a vendor certificate), and original DEX and
native content are bound to the actual patch input before rewriting. APKM extraction
uses root `base.apk`, never the container hash. Both native ABIs must be present.

1. `classes2.dex`:
   `Lnet/nshc/ap/AppProtect;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;`
   returns MD5/SHA-256 captured from the selected unmodified base APK. Unsupported
   algorithm names throw `NoSuchAlgorithmException`; the original file-hash call
   must exist before rewriting. No vendor fixture hash is substituted globally.
2. Both `libap1.11.12.so` variants: the native APK-directory helper returns a fresh,
   caller-owned lowercase hex digest captured before patching. It hashes each raw
   central header, filename, extra and comment, excluding case-sensitive C-string
   substring `META-INF/`. This is not the whole-file hash.

| ABI | Helper file offset | Modified range, exclusive end | Existing allocator PLT |
|---|---|---|---|
| arm64-v8a | `0x2be0` | `[0x2be0, 0x2cc2)` | `0x1a40` |
| armeabi-v7a / Thumb | `0x28cc` | `[0x28cc, 0x2976)` | ARM `0x1b70`, BLX |

Native algorithm `0x2c` allocates 33 bytes for MD5; `0x26` allocates 65 for SHA-256.
Both include the NUL terminator. Unsupported types/allocation failure return `-1`
without changing the output pointer. Source assembly is retained under
`patches/src/main/native`; generated instruction bytes use relative calls to the
existing allocator. Library digests and original replacement ranges are guarded;
file sizes, ELF layout and other functions remain unchanged.

AppProtect initialization, `CreateVerifyData`/`FromJar`, HMAC, key generation,
encryption, root/configuration evaluation, requests, responses and real tokens
are not skipped or replaced with a synthetic success result. The application
uses MD5 in its current caller; both supported algorithms are implemented.
APKM container hashes are never used in place of base-APK hashes.
Server acceptance remains unverified.

## Debugger and analysis-tool detection

`adot.security.disable-debugger-detection` is optional, default off.

- AhnLab `DebuggerManager.getDebuggerResult` and its Java leaf return zero/false.
  `MemoryCheckManager.checkMemory` returns zero. Existing `checkDebugger(String)`
  still preserves unrelated root findings; `requestIntegrityCheck` still performs
  its separate AhnLab certificate checks.
- `Lyw6;->O()I` preserves emulator/root bits `1`/`2`, removes attached/waiting
  debugger reads and bit `4`.
- AppsFlyer no-argument `AFf1iSDK.AFKeystoreWrapper` returns its normal `";"`
  no-hook marker, disabling Xposed stack and Frida maps collection. Its debug flag
  becomes false without dropping sibling metadata.
- Only debug-flag reads change in MS `Telemetry$Builder.withContext`, Crashlytics
  `u98.j` and `v98.run`. Google signature verification and Compose preview guards
  are not reclassified as analysis-tool detectors.

Nine methods in `classes.dex`/`classes2.dex` use canonical guards over declarations,
executable code and catch coverage. Debug line coordinates are excluded because
Morphe normalizes them when another patch makes the same class mutable. Changes to
instructions, registers, access flags or catches still fail closed. This is
applicability checking, not an APK hash allowlist.

Both `libauthmanager.so` variants additionally disable the shared TracerPid scanner,
the Frida maps scanner, and self-ptrace attachment, including their JNI aliases:

| ABI | TracerPid | Frida maps | Self-attach | Entry replacement |
|---|---|---|---|---|
| arm64-v8a | `0x5c18` | `0x6280` | `0x6134` | `mov w0, #0; ret` |
| armeabi-v7a / Thumb | `0x4684` | `0x4bbc` | `0x4ac0` | `movs r0, #0; bx lr` |

Exact original library SHA-256, ELF ABI and original bytes are required. Every
other byte is preserved. No helper process is forked by the replaced attach entry.
Authentication keys, antivirus and separate signature checks are not bypassed.

14.4.0 packages 52 shared libraries. AppProtect's server-supplied
`SP/PK/F/D/MW/FS` rules and its `AD002` abstract-socket heuristic remain:
their complete tool/root classification
was not established. This patch does not claim that every possible dynamic,
reflective, native or server-side check has been eliminated.

## USB debugging detection

`adot.security.disable-usb-debugging-detection` is optional, default off:

- `Utils.isDebugEnable`, Kakao `rdZSDnsJ.gDzHvoVp` and `ADBCheckObserver.execShell`
  return false. The last helper's `adbd` versus shell/logcat parent-PID probes
  are also removed; the unrelated string decoder `ADBCheckObserver.d` is retained.
- `Lsrl;->l(Context)V` sees zero only for its developer-options setting result.
  Other instructions, setting reads and physical USB-connected telemetry remain.
- No Android setting is written. ADB/Shizuku availability is not turned off.

## Galaxy request-metadata profile

`adot.device.galaxy-profile` is optional, default off. In 20 exact methods across
`classes.dex`, `classes2.dex` and `classes3.dex`, selected `Build.MODEL`,
`MANUFACTURER` and `BRAND` reads become `SM-S911N`, `samsung` and `samsung`.
Exact original read positions, registers, field types and source sequences are
validated; mutable DEX labels relocate after jumbo string replacements.

Covered sources include account login (`sy1.a`) and refresh (`gz1.invokeSuspend`),
account User-Agent (`e60.invoke`), API/creative headers (`goo.d`, `vq.d`, `lzr.z`),
Berry/settings analytics, DataTransport, Crashlytics settings and Java/native
session metadata, five AppsFlyer collectors, and OCB `window.__APP_INFO`.
The account model/manufacturer fields feed `/oauth/token`; API headers and
analytics have static HTTP-client paths. OCB page exposure alone is not proof
of transmission. No authenticated request or telemetry upload was performed.

This is a **partial metadata profile**, not captured stock Galaxy firmware or
anonymization. OS versions, unique/advertising IDs, account keys/tokens, fingerprint,
hardware/device/product/build values and unselected collectors remain original.
Global framework `Build` values and `j8j` capability/recorder classification do not
change. Composite User-Agent/model strings use the replaced sources, but other
paired metadata can still identify the original device.

## Verification boundary

The current 14.4.0 implementation passed 264 tests (runtime 128, engine 36,
patches 100), without failures or skips. An independent Morphe 2.0.0 consumer
loaded 58 exports, applied all nine ACall patches and rebuilt a 204,095,510-byte
APK. This covers host patch execution and original-code preservation, not
device calls, server acceptance or actual vendor Compose rendering.

The re-signed target app has not been installed or launched during these checks.
Shizuku authorization inside that app, consented two-party audio, live call-history
association, ordinary-call continuity under failure, native banner visuals and
server summaries remain unverified. Host tests do not establish Android GPU
performance, thermal safety, long-call quality or AppProtect server acceptance.
Model output remains fallible and must be checked against the recording.

## Editable YouTube Music source boundary

The 49 exported Music patches originate from official Morphe stable **v1.48.0**,
commit `f3acc10e2691ffc4db29c6a6a651ee61fb54c047`, recorded in `upstream.lock.json`.
Editable recipes are in `patches/src/main/kotlin/app/morphe/patches/music/`, with
shared/all/util dependencies and resources alongside them; imported runtime sources
are in `extensions/music`, `extensions/shared` and `extensions/shared-youtube`.

The lock targets `com.google.android.apps.youtube.music`, APK input, minimum API 26.
**9.20.53 / 9.15.51** are non-experimental; **9.42.52 / 9.41.52 / 9.40.51** remain
experimental even though the upstream source release is stable. No real Music APK
patch/run is claimed by the build or ACall test evidence.

EB branding marks an independent derivative, not an official Morphe release.
The combined distribution is GPLv3 with preserved NOTICE terms; original EB code
retains Apache-2.0 and Shizuku retains MIT. No Morphe trademark permission is implied.
