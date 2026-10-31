# Patch contributions

- This is an independent EB-branded native Morphe source, not an official Morphe release.
  Keep upstream attribution and distinguish modifications from upstream.
- Define ACall exports, compatibility, dependencies, defaults and options in
  `patches/src/main/kotlin/io/github/emotionbug/patches/adot/AdotPatches.kt`;
  keep category recipes in `patches/src/main/java/io/github/emotionbug/patches/adot/`.
  Generate `patches-list.json` from native declarations rather than maintaining a second manifest.
- Keep the nine ACall functions independently selectable where their dependencies permit.
  Do not add empty toggles or combine unrelated permission, recording and metadata changes.
- Validate package/version/code and exact original method/native structure, not a
  whole-APK hash allowlist. Preserve original DEX/native binding for the optional
  AppProtect `originalApk` local-file option, root APKM `base.apk` hashing and both ABIs.
  Never silently accept content URIs, rebuilt originals or missing native payloads.
- Preserve permissions, same-UID checks, original recording controls, call logic and
  recording-only failure callbacks. Do not add another approval screen or consent gate.
  Report failure reasons without opening activities or blocking calls. Keep recorder
  work out of the main process and preserve launcher instructions/catches. Do not turn
  isolation-helper results into a live-call guarantee.
- Preserve independent recording channels through AAC and transcription. Count PCM
  frames, not interleaved samples, for timestamps. Reject channel downgrades in
  opt-in stereo mode; never infer caller identity from channel numbers or treat
  synthetic codec tests as live UL/DL separation proof.
  Only the existing cloud-upload scope may use a temporary mono conversion. Preserve
  original file validation, per-item failures and actual payload metadata, including
  native metadata refresh on existing server-ID retries. Keep temporary leases
  through suspended coroutines; never replace the final recording/shared accessor.
- Music recipes and shared dependencies are editable under
  `patches/src/main/kotlin/app/morphe/patches/`; extension sources are under
  `extensions/{music,shared,shared-youtube}`. Update `upstream.lock.json` deliberately
  when changing the pinned stable v1.48.0 source, including commit, 49 exports and targets.
  Keep stable targets 9.20.53/9.15.51 distinct from experimental 9.42.52/9.41.52/9.40.51.
- Preserve GPLv3 `LICENSE`/`NOTICE`, original EB Apache-2.0 terms in `LICENSES`, and
  Shizuku MIT notices. EB branding does not grant Morphe trademark rights.
- Use Java 21 (required by LiteRT-LM SDK classes), the official Gradle 9.8.1 wrapper,
  SDK Platform 36/Build Tools 36.0.0, NDK 29.0.14206865, CMake 3.22.1, a host C/C++
  compiler, and published Morphe patcher/library/plugin 2.0.0. Vulkan headers are
  pinned/downloaded by Gradle; the NDK supplies glslc. GitHub Packages needs a
  `read:packages` token through private environment/user Gradle settings, never Git.
- Build in this order: `./gradlew --no-daemon :runtime:test :summary-engine:test :patches:build :patches:generatePatchesList :patches:buildAndroid`.
  Keep `buildAndroid` last so the `.mpp` retains both host and Android execution content.
  Private integration tests use `EBPATCHER_TEST_APK`; CI without that input cannot prove
  real APK integration. See [README](README.md) and [PATCH-SPEC](PATCH-SPEC.md) for evidence boundaries.
- Keep both model weights out of Git and the patch bundle. Pin URL, size, SHA-256
  and license independently in `summary-engine/{model,whisper-model}.json`.
  Verify before atomic promotion; a verified download waits cancellably for the
  inference lock. Preserve role/attempt-specific cancellation, deletion and readiness.
  Whisper performs ASR; release it before Gemma GPU/CPU text inference. Transcript-only
  refinement of timed documents must work without Whisper; legacy flat text needs
  new ASR. Pin and hash the stock native source archive and model configuration.
  LiteRT-LM stays in an isolated DEX/classloader, with R8 9.1.57 for Kotlin 2.4
  metadata. Do not merge its Kotlin dependencies into the original app.
- Summary hooks must preserve original recording/cloud outcomes. Match persisted
  recording/briefing identities, never phone numbers or approximate timestamps.
  Only the exact exhausted-ticket branches qualify for quota mode. Keep original
  summaries read-only; test late results, duplicate events and stale completions.
  Read STT independently of summary rows, preserve raw native identity/timing, and
  never invent DB IDs or speaker identity. Display adaptation must be reversible;
  local rows cannot reach native edit persistence. Sharing remains original-data
  sharing. Test uncertain comparisons, manual choice, five-terminal-history pruning
  and interrupted/dead-worker lease recovery against real SQLite.
- Run real public-audio inference and Android download/cancel/integrity checks for
  engine changes. Tests that only load classes or return fabricated text are not
  inference evidence. Keep live-call continuity and long-call thermal behavior
  explicitly separate from short isolated-helper observations.
- Ad suppression must retain unavailable callbacks and collapse only commercial ad hosts;
  never hide spam/safety notices by a generic banner-name match. Analytics suppression
  must not disable Messaging/auth/phone services or replace asynchronous tasks with no-ops.
  Model completion must reject measured budget exhaustion and missing counters; never
  infer completion from a model-generated sentinel. Keep diagnostics content-free.
- Never commit vendor APKs, decompiled vendor files, recordings, device dumps, evidence
  captures, private keys or credentials. Treat live call/audio and server summary testing
  as separate, explicitly consented work; no Music APK run is implied by a successful build.
- Current bundle source is v0.5.6 (`patches-0.5.6.mpp`) for ACall 14.4.0 (14409).
  Model files and interactive CPU/noninteractive GPU policy are unchanged.
  The original APK passed patch/rebuild and isolated bundle-consumer checks;
  264 regression tests passed without skips.
  Compute serialized DEX guards with the pinned Morphe smali fork from the build
  classpath, not upstream smali: equivalent instructions can serialize differently.
  Actual device UI, live calls and Android GPU performance remain separate boundaries.
  Do not present host speed or widget tests as vendor Compose/device verification.
  For changed release bytes, publish a new immutable tag/asset; never overwrite
  or reuse a released URL. Validate the downloaded public asset before updating main's
  `patches-bundle.json` (`version`, `download_url`, `created_at`, `description`) using
  `scripts/prepare_release.py`. Do not publish a local source candidate ahead of its asset.
