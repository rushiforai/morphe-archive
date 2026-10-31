# On-device call summary design

## Delivery boundary

Version 0.5.6 targets ACall 14.4.0 (14409), integrating recorder controls and the
optional `adot.summary.local-gemma` patch into its Compose settings screen. Model
weights are downloaded explicitly, never bundled. Inference stays in its own process.

Korean-fixed Whisper large-v3-turbo transcribes each channel; Gemma generates and
compares text summaries. Selected results update the original canonical
briefing tables, not a presentation adapter. API originals have an independent
recovery journal. The visible history keeps five newest-created finished jobs;
active work and not-yet-consumed native applications remain durable. Final
recordings preserve channels; only cloud upload receives a temporary mono input.

## Native integration contracts

The supported application is ACall 14.4.0 (14409). Original method fingerprints,
field types, constructors, enum comparisons and coroutine boundaries are guarded;
changed input is rejected rather than matched by similar names or guessed offsets.

Saved-recording observation uses `Ltx4;->c(Lkhk;Lh58;)Ljava/lang/Object;`.
Quota observation uses `Lui;->F(JLjmq;Ljw;Lh58;)Ljava/lang/Object;`, at the exact
`TICKET_ALL_USED` equality fallthroughs for `onq.l` and `vhc.p`.
API completion uses `Lyx9;->l(JLdm3;Lh58;)Ljava/lang/Object;`.
The `iw9` constructor captures the existing Room database. Queries use its
existing executor, not the recording callback thread.

The preferred recording descriptor is returned by `Lgoq;->a()Lpnq;`.
Its `pnq.a` recording ID, `pnq.c` content URI and `pnq.e` duration bind the job;
`jmq.d` is the native briefing ID. The extension preserves native descriptor
selection and does not guess a filesystem path or conflate local/server IDs.

Exact quota classification does not establish the account's remaining allowance,
reset schedule, billing units or every possible recording restriction. Missing
summaries, network exceptions, disabled automatic summaries, cached counts and
generic manual-upload/conversion states are not quota evidence. The hook observes
the specific enum comparison before its cause is lost in a shared failure state;
it does not treat every HTTP 412 as quota exhaustion.

## Implemented data flow

1. Preserve original recording, persistence, call matching and cloud summaries.
2. Observe saved recording IDs/URIs at `tx4.c` after persistence. Observe only the two exact `TICKET_ALL_USED` comparisons in `ui.F` for quota mode.
3. Observe original-summary/STT completion at the successful `yx9.l` transaction join, including returned title/server identity. Reconcile known jobs when the captured Room database becomes available. Work uses its existing query executor, never the call callback.
4. Associate the persisted `pnq.a` recording ID and `jmq.d` briefing-info ID. Read independent `briefing_converted_text` rows even without `briefing_summary`; match the exact recording–briefing relation and reject ambiguous/conflicting associations.
5. Persist an extension-owned job/revision. A later API transcript or summary triggers comparison using the retained timed local candidate; stale workers cannot publish a newer revision's selection. Manual choices survive refresh.
6. Schedule with Android JobScheduler battery/storage constraints and a fresh idle-phone check, without a device-idle constraint. At job start use CPU while PowerManager reports interactive (or is unavailable), otherwise prefer GPU. Decode finalized audio into aligned 30-second mono16kHz chunks per original channel, transcribe with Whisper, then generate a factual Korean title/summary with Gemma.
7. Keep original API evidence and local timed segments separately. Recommend only a supported improvement; conflicting facts, numbers or negation require abstention. API remains the automatic choice when usable and comparison is uncertain.
8. Apply the first usable result and later selected candidate to native briefing/title/summary/transcript rows inside the original Room transaction. Existing history/detail screens read their ordinary data. No source button, cloned render state or detail-screen hook is added.

Modes are **Off**, **Always**, and **When quota is exhausted**. Always does not disable the original cloud summary: the transcript is primary evidence and any original summary is secondary evidence. Quota mode requires the exact rejection for that recording, not a global guess about the account.

Durable states are `queued`, `running`, `waiting`, `ready`, `failed` and `cancelled`. Expected scheduler/call interruption is resumable; unexpected worker death becomes a visible failure requiring manual retry. Completed transcription chunks are checkpointed. Missing audio, model failure and revision conflicts never fabricate a successful result.

Inference runs in `:ebpatcher_summary`, separate from both the phone UI and `:ebpatcher_recorder`. The startup guard skips original telephony initialization in this owned child. Unknown/active phone state prevents work. A newly observed call stops only the exact owned summary process; no call-control API is exposed to the model. This design and isolated execution are not a live-call continuity guarantee.

### Canonical persistence

The exact `ly4` constructor binds recording-file and communication-log IDs. A
missing briefing is created only with this verified association, existing audio
identity and a live undeleted communication row. Conflicting/multiple mappings
are rejected. Native generated IDs, call time, recording source type and COMPLETE
state are used without creating server upload keys or changing dirty flags.

The extension database's recovery journal stores API backups, prepared/applied
snapshots and selection tokens independently of result-history retention.
Selection is read after acquiring the native write transaction; acknowledgement
rechecks the committed rows and token before claiming success. Own generated
rows are never imported as new API evidence. Late API inserts remove only exact
owned conflicting rows inside the API's transaction. Recovery distinguishes
rolled-back writes from already-committed API evidence and preserves the latter
before restoring or selecting anything. Retry candidates survive visible-history
pruning until native application has consumed them.

These are implementation contracts, not evidence of live server synchronization
or native phone-history rendering.

### Native speaker identities

Native self speech is determined by `talker_id == my_talk_id`, not by recording
channel number or a global zero/one-ID convention.

`AdotSpeakerMapping` derives identity from the exact original API journal,
not Gemma-generated IDs. Unique normalized text anchors require at least eight
letters/digits; valid intervals must overlap by at least half the shorter interval.
Ambiguous/repeated phrases, conflicting channel anchors and bounded-search
exhaustion stay unknown. Both stereo channels need consistent distinct native
speakers before a channel mapping propagates. Mono uses individual anchors only.
An explicit per-job self channel permits API-less separated recordings; it is not
software diarization of mixed audio. Unknown roles are reported and assigned
distinct non-self IDs rather than guessed caller identities.

Schema 5 retains per-job Auto / Channel 1 / Channel 2 choices and API journals.
Resolved speaker fields participate in native selection tokens. When selected
content is unchanged, only owned speaker fields are updated: existing row IDs, user text,
titles, summaries, deleted utterances and independently edited speaker IDs survive.
Already-pruned jobs are not reconstructed from history. Manual settings live only
in the existing extension results dialog; ACall's transcript UI is unchanged.
Local selection tokens keep a source-content hash separate from the resolved
speaker hash. Repeated channel corrections therefore remain metadata-only even
after the applied snapshot has incorporated user text edits or deleted rows.

### Speaker provenance and explicit API identity

The result dialog supports a per-job API self-ID override while API
comparison is still queued. It changes canonical `my_talk_id`, preserves transcript
rows/IDs/timestamps and user content, and also informs later local anchor mapping.
Original API evidence is retained independently. IDs must exist in the authenticated
native backup; stale IDs are reported instead of assigned to a different speaker.
Schema 5 migrates v1–v4 settings, histories and recovery journals, and keeps native
speaker-edit ownership separately from later observed/applied snapshots.

`AdotApiSnapshot` copies the exact API self/title/transcript generation before
enqueueing its callback. A later canonical snapshot must match that generation;
detached self metadata cannot overwrite a native edit or another transcript.
Native speaker-edit ownership survives subsequent snapshots and restarts.

### API publication boundary

Publication ownership begins in `yx9.r` state 0 before any parent write.
Local selection and recovery check that ownership only after acquiring the native
write transaction. An admitted earlier local transaction completes before the
native parent write; a later one defers until publication ends. Suspension retains
ownership; normal/exceptional completion releases it. A dedicated saved continuation
register protects exceptional resumptions where original v7 is a long's high word.
Concurrent responses cannot release one another's ownership.

For an exact existing native briefing, the pre-parent snapshot is journaled before
mutation, preserving native user edits for interruption recovery. Continued requests
resolve only a unique live `briefing_server_id`, never phone/time similarity.
The child cleanup still deletes only local-owned rows, not retained API rows.
If only the later child hook can bind a local journal, rollback uses its last local
presentation identity rather than combining API parent metadata with local rows.
An authenticated matching API callback can also update genuine parent-only metadata
on existing API rows; a bare observation of our own override cannot.

Existing corrupted backups are not repaired by guessing a global speaker ID;
fresh original API evidence or an explicit per-call correction is required.

## Channel-preserving recording and firmware boundary

The optional **Keep call channels separate** setting requests one stereo
`VOICE_CALL` AudioRecord, not simultaneous `VOICE_UPLINK` and `VOICE_DOWNLINK`
records. The latter's concurrent unsilenced operation is not established and
would require additional clock alignment. Default mono recording is retained.
The requested two-channel client/device configuration and encoded format must
remain two-channel; failures use the existing recording-only error path.
No microphone fallback, software source separation or invented speaker identity
is introduced.

Requested channel count does not establish DSP separation, channel order,
two-party audibility or behavior across firmware. OEM audio processing can affect
channel contents even when a stereo configuration is accepted. Channel labels
therefore remain neutral. Existing mono recordings cannot be retroactively separated.
Both channels share the capture clock and are retained in one AAC track; local
transcription creates an independent bounded WAV for each channel, retains time
and channel labels in the transcript and supplies that labeled text to reduction.
Channel-specific checkpoint keys bind decoder and PCM identity, preventing reuse
of downmixed transcription. Silent channels are retained, not omitted or fabricated.
Actual two-party capture and device-specific separation remain unverified.

## Cloud-only mono input

The embedded recorder keeps the finalized original recording, its database
descriptor and the shared `goq.a()` preference unchanged. Scoped hooks in `gnq.b`,
`zoq.b`, `zoq.f`, `gu3.L` and `knq.a` bind only the existing cloud-upload operation.
Original missing/unreadable-file validation runs before conversion; conversion
failure joins the native per-item failed-file path without starving later items.

Already-mono audio passes through. A mono companion is reused only when recording
identity, filename, actual AAC channel count/sample rate/duration and length match.
Otherwise stereo PCM16 is averaged into a bounded temporary mono AAC-LC/MP4 at
the original sample rate (8–48 kHz), with truthful MONO and actual-byte metadata.
Only the cloud payload changes; no second capture or final-file replacement occurs.

For a pre-existing server briefing ID, changed audio forces the native metadata
update (`zoq.f → pmq.b → aq3.k → hai`, PATCH `/briefing/v4`) before transfer, using
the original request ID and persistence path. An ambiguous duplicate-ID response
cannot prove a metadata refresh and uses the existing retry-failure branch, not
stale success. Account/quota checks, request identity and HTTP implementation remain
native. These are static implementation facts, not a live server acceptance result.

Private temporary audio has a sidecar lock held for the full suspended coroutine
lifetime, independent of codec/stream closure. Completion, failure and cancellation
release it; later operations reclaim only matching unlocked owned files. Active
same-process leases and originals are preserved. No generic cache sweep is used.

## Selected model and execution

Whisper handles speech recognition; Gemma handles Korean text summarization only.
Each input channel has independent, time-aligned chunks of at most 30 seconds.
Whisper's native context is freed before initializing Gemma. Retained timed local
documents can be refined with Gemma alone; legacy text-only results need fresh ASR.
Fully checkpointed ASR does not load Whisper JNI/model or allocate its PCM buffer.

- Text runtime: `com.google.ai.edge.litertlm:litertlm-android:0.18.1`, CPU4 when interactive/unknown; GPU-preferred otherwise with initialization-only CPU4 fallback; `audioBackend=null`, `visionBackend=null`.
- Model: `litert-community/gemma-4-E4B-it-litert-lm`, revision `e6a3892a8c22cf87ff99583996149cf3cb32452b`.
- File: `gemma-4-E4B-it.litertlm`, **3,659,530,240 bytes**, Apache-2.0, public/ungated.
- SHA-256: `0b2a8980ce155fd97673d8e820b4d29d9c7d99b8fa6806f425d969b145bd52e0`.
- Manifest: `summary-engine/model.json`; model weights are excluded from Git and release bundles.
- ASR runtime: stock whisper.cpp v1.9.5, commit `d1be6fde11ac6e0407606b4e42fe72d34add8037`, built for arm64-v8a/x86_64.
- ASR model: large-v3-turbo Q5_0, `ggerganov/whisper.cpp` revision `5359861c739e955e79d9a303bcbc70fb988958b1`, `ggml-large-v3-turbo-q5_0.bin`, **574,041,195 bytes**, MIT.
- ASR SHA-256: `394221709cd5ad1f40c46e6031ca61bce88931e6e088c188294c6d5a55ffa7e2`; independent manifest `summary-engine/whisper-model.json`.

### GPU execution

Whisper uses Korean beam5 decoding. No NPU backend or converted model is introduced.
Whisper has separately loadable CPU/Vulkan JNI libraries with private static ggml
state. Missing optional Vulkan symbols, no suitable GPU or explicit unsuccessful
initialization allow one CPU attempt after release. Escaped native initialization
exceptions fail without retry because upstream state construction is not exception-safe.
Gemma runs its entire native lifecycle on one owning thread, prefers GPU when permitted, and
permits one CPU initialization only for classified LiteRT engine-creation failures.
The SDK's opaque INTERNAL status cannot identify every underlying driver/model cause.
Inference failures, exhausted budgets, cancellation and incomplete output never
trigger CPU replay. Actual selected backend and fixed fallback reason codes are
logged without transcript text. Optional `libOpenCL.so`/`libvndksupport.so` manifest
entries preserve installation on devices without those vendor libraries.
Backend selection does not initiate downloads or change the pinned model identity.

Successful Android GPU inference, CPU/GPU output equivalence and speedup remain
unverified. Driver failures during inference fail the job rather than trigger
CPU replay or accept partial output.

### Interactive CPU routing

Severe device lag has been reported; its CPU/GPU/driver attribution is unmeasured.
New API evidence can require later text refinement without repeating completed ASR.
Publication-entry journal work remains synchronous to preserve pre-parent-write
ordering; its caller-thread timing remains a device validation gap.

The coordinator and both native inference owner threads set Android
`THREAD_PRIORITY_BACKGROUND` before work. This is **not** a GPU queue-priority
control. The pinned LiteRT-LM
[Kotlin GPU backend](https://github.com/google-ai-edge/LiteRT-LM/blob/v0.18.1/kotlin/java/com/google/ai/edge/litertlm/Config.kt#L149)
does not expose native `gpu_context_low_priority`; upstream
[issue 3992](https://github.com/google-ai-edge/LiteRT-LM/issues/3992) reports Android
Gemma rendering stalls and custom-native-library experiments, not proof for this phone.

The one-second minimum scheduling latency and battery/storage constraints remain,
with no inactivity constraint or override deadline. Each facade receives
an immutable `useGpu` argument: interactive/unknown state selects CPU directly for
both Whisper and Gemma, without trying Vulkan/GPU first; noninteractive state retains
the classified initialization-only GPU-to-CPU fallback. CPU4, model files, ASR
decoding and token budgets are unchanged. CPU work continues if the screen turns off;
the next job can select GPU. There is no frame-by-frame backend switching.

A screen-on receiver checks current interactive state before interrupting a GPU-
permitted job. GPU intent is published before initialization and followed by a second
power-state read, closing the wake-before-publication window. The shared lifecycle
lock serializes claiming a DB row and acknowledging a work token against durable
pause, so no new running row escapes the pause and the unfinished token is retained.
Completion ownership is matched to exact JobParameters: stale finalizers/stops cannot
consume another execution, and onStopJob does not explicitly call jobFinished.
The screen handoff requests rescheduling, marks running rows waiting without changing
revision, then posts owned-process termination on the main looper after the framework's
asynchronous completion acknowledgement. Terminal service/notification owners cannot
be reused. The next scheduled process selects CPU if still interactive and recovers
leases/checkpoints; scheduler backoff means restart is not promised to be immediate.
An unfinished ASR chunk or Gemma generation may be recomputed. Completed ASR chunks
retain the same identity across GPU/CPU selection.

Actual device rendering, thermal behavior, scheduler timing, GPU execution and
live-call continuity remain unverified. Background thread priority and screen-state
routing do not guarantee responsive UI or rapid native cancellation. If native work
does not promptly cancel, isolation relies on terminating only the owned summary
process; incomplete results cannot be published.

### Model quality and resource limits

E4B's multilingual capacity carries substantial memory and latency costs. The
[official model card](https://huggingface.co/litert-community/gemma-4-E4B-it-litert-lm)
reports 3,283 MB CPU warm-cache RSS and 17.7 tokens/s on S26 Ultra under its stated
2,048-context benchmark, not this extension's 8,192-token context or this user's
phone. Web/GPU/NPU model files are not interchangeable CPU replacements.

The [Whisper turbo card](https://huggingface.co/openai/whisper-large-v3-turbo)
describes a four-layer decoder distilled from large-v3.
[Whisper limitations](https://github.com/openai/whisper/blob/main/model-card.md)
include hallucinations and uneven language accuracy, not reliable speaker identity.
Recognition mistakes can propagate into summaries. Public benchmarks and small
controlled samples do not establish accuracy on a particular call, complete word
alignment, Android latency or long-call quality.

Comparison inputs name API/local summaries and transcripts separately. Exact
source quotations, meaningful-string validation, numeric-support checks and
negation-conflict abstention constrain automatic replacement. Uncertain comparison
retains a usable API candidate. Comparison reasons are labeled AI-generated and
can still misdescribe candidates; they are not verified facts. Generated notes
and prose are not guaranteed to preserve source labels or complete provenance.

### Runtime isolation and model downloads

The SDK's Kotlin dependencies stay in an isolated DEX/classloader with a cached loader and matching 64-bit native libraries. Engine entries are individually verified before extraction; executable/model files become read-only before use. R8 9.1.57 handles the SDK's Kotlin 2.4 metadata. Initialization and inference never run on the UI thread.

The downloader uses HTTPS without credentials/cookies, bounded redirects, streamed
SHA-256, exact size, free-space checks and atomic promotion. Gemma and Whisper have
separate paths, readiness markers, progress and deletion. One transfer is admitted
at a time; cancellation matches both role and attempt token. A verified download
waits cancellably for the inference/install lock instead of being discarded while
Gemma-only refinement is running. No automatic download restart is added.

New ASR requires both models; transcript-only queued refinement remains runnable
with Gemma alone, without being blocked by an earlier ASR job awaiting Whisper.
The local AI pipeline does not upload audio, transcripts or summaries. Original
ACall cloud-summary eligibility remains native, with the scoped mono adapter above.

### Measured completion and diagnostics

The context budget is 8192 tokens and output budget is 2048 tokens. LiteRT-LM
0.18.1 delivers `onDone` at normal completion **and** output/context limits.
The engine enables benchmark counters before constructing the SDK engine and
reads prefill/decode and KV counts after the terminal callback, before closing
the conversation. It accepts only nonempty, error-free, tool-free, uncancelled
output with available positive counters and decode/KV counts strictly below
their limits. Equality is rejected even if an actual EOS coincides with a limit.
Missing counters and budget exhaustion are explicit failures, not partial success.
Model-generated completion sentinels are not used as evidence of completion.

Stock Whisper native inference handles each chunk; explicit native errors and
cancellation fail, empty chunks remain empty, and an all-empty transcript fails
rather than inventing speech. There is no custom low-confidence decoder rejection.
Checkpoint identity includes the model, native decoder/configuration and PCM
identity. Audio-FD lifetime, retained originals and transcript-only refinement
remain independent of native model ownership.

`EBPatcherSummary` application logs contain stage/chunk or note/reduction index,
prefill/decode/KV counts, buffered output character count, elapsed time and fixed
termination labels (`-1` means a missing measurement). Job logs add only the local
job ID/revision, run-versus-refine and start/finish classification. They contain
no audio paths, transcript/summary text, phone numbers, account/API values or
upstream exception messages/stack traces. Native callback errors use a fixed,
informative UI message; other existing local UI error explanations are preserved.
SDK-internal log behavior is not covered by those application log statements.
Job completion logs do not override the store's existing stale-revision checks.

The SDK exposes no finish reason, so below-limit completion cannot guarantee
semantic completeness or accuracy. Remaining caps fail without retry or budget
increase.


## Storage, privacy and result quality

- Use the app-owned finalized `content://media/...` recording, not a broad scan of call files. Verify availability again when the job runs; deletion or revoked access is an error, not a reason to fabricate a transcript.
- Audio decoding is streamed and chunk timestamps are retained in the transcript. Generated prose is not guaranteed to provide accurate per-claim evidence spans.
- Keep candidate jobs and API recovery backups separate from selected canonical briefing rows. Applying a choice writes ordinary native IDs and tables through Room, without a presentation adapter. Existing detail/edit/share readers see their normal database records. The model cannot trigger upload or arbitrary database operations.
- Store only necessary recording identifiers; do not duplicate contact numbers in diagnostic logs. Exclude transcripts, credentials and generated summaries from unintended backup/export paths.
- Treat speech and transcripts as untrusted input, not instructions to the application. The model has no tools, networking or ability to change settings. Render plain text, not executable HTML.
- Prompts request concise Korean summaries, decisions, follow-up and uncertainty, without invented speakers/dates. Model instructions do not guarantee factual accuracy or prevent speech-recognition errors.
- Deleting local summary data requires Off and excludes original recordings/history, applied canonical results and their API recovery backups. Model deletion stops local processing and uses cross-process locks; insufficient storage is an explicit download failure.
- Expose only five newest-created terminal histories plus active work. Hidden pending native applications are durable until consumed, then retired payloads/checkpoints are removed under leases. Small hashed retirement identities prevent stale callbacks from recreating pruned history. Recover dead leases only after acquiring the process lock.

## Settings integration

Entry: **ACall's main settings tab -> bottom of list -> EBPatcher settings**.
The settings tab uses Compose. The guarded `bmo.invoke` insertion is
inside the scrolling Column, after native rows and before its bottom spacing.
It calls the guarded `pu6.b` AndroidView bridge with the original composer's classloader.
There is no footer/adapter hook, overlay or reparenting.
The factory inflates `settings_common_normal_row`, retaining its typography,
divider, chevron and native N badge. The badge tracks pinned model digests and is
acknowledged when current metadata is displayed, not on launch. Host widgets and
actual APK resource contracts were tested; vendor Compose rendering is unobserved.

Implemented English controls:

- **Show recording failure messages**: changes Toast visibility immediately, including an already-running recorder child; original error callbacks and results remain intact.
- **Ask for Shizuku on app launch**: controls the optional startup prompt; normal recording controls and genuine Shizuku authorization remain authoritative.
- **Authorize Shizuku / Refresh status**: explicit authorization only with a fresh idle-phone observation, plus read-only status. Status is not a claim that audio capture works.
- **Open recording settings / Open notification settings**: navigation to the existing settings, without granting permissions automatically.

The settings provider is private to the application UID. It serves preferences
and main-process commands for native application and notification ownership.
There is no launcher, overlay, extra consent gate or external settings intent
filter. Recorder preferences avoid unsupported cross-process SharedPreferences.

With the summary patch selected, **On-device summaries** provides modes, separate
Whisper/Gemma Download/Update/Cancel/Delete controls, five visible terminal
histories, candidate inspection and Recommended/API/Local selection, manual retry
and Off-only history deletion. Selection updates canonical call history; no
recording/detail-screen control is injected. Settings/results do not add screenshot
restrictions. Model Update verifies and atomically publishes new bytes before
removing obsolete weights; progress belongs to the exact model and transfer token.

Optional silent notifications follow actual Whisper/Gemma stages. A main-process
owner serializes native publisher, worker heartbeats/completion and committed DB
refreshes. It replaces only a same-call summary notice and otherwise uses a
job-specific key; unrelated calls and foreground recording notices are untouched.
Only the worker renews the ongoing lease. Completion reads the latest committed
native outcome, and notification denial never gates inference.
Without the optional patch, engine assets and four summary components are omitted.

## Validation boundary

The current 14.4.0 implementation passed 264 tests (runtime 128, engine 36,
patches 100), without failures or skips. An independent Morphe 2.0.0 consumer
loaded 58 exports, applied all nine ACall patches and rebuilt a 204,095,510-byte
APK. Host patch execution, persistence regressions and original-code guards do
not establish live native UI rendering, real call association or server acceptance.

The re-signed target app has not been installed or launched during these checks.
Live calls, two-party capture, native transcript rendering, vendor Compose
interaction, server/quota delivery, Android GPU output and sustained thermal/memory
behavior remain unverified. Application contracts and model safeguards are not an
accuracy, performance or uninterrupted-call guarantee.

Public speech fixture attribution: [Google FLEURS](https://huggingface.co/datasets/google/fleurs),
`ko_kr/test` row 0, CC-BY-4.0. No fixture/audio, private recording, transcript,
account response or proprietary APK is bundled in the patch.

## Primary model references

- [Gemma E4B model and license](https://huggingface.co/litert-community/gemma-4-E4B-it-litert-lm)
- [LiteRT-LM Android integration](https://developers.google.com/edge/litert-lm/android)
- [Whisper models, languages and benchmark caveats](https://github.com/openai/whisper)

Gemma E4B model weights retain Apache-2.0 attribution; Whisper model/runtime
retain MIT licensing. The combined distribution retains GPLv3 and NOTICE terms,
original EB code retains Apache-2.0, and Shizuku retains MIT. See repository
licenses and bundled third-party notices; no Morphe trademark permission is implied.
