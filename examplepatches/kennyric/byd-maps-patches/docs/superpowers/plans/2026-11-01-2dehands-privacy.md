# 2dehands privacy implementation plan

> **For agentic workers:** Use superpowers:executing-plans in this session. Steps use checkbox syntax for tracking.

**Goal:** Port the Horizon controls to the supplied Belgian 16.19.0 XAPK and verify removal of advertising, optional tracking, profiling and consent UI.

**Architecture:** Dedicated Belgian compatibility and entry points select separately audited bindings. Reuse Horizon patch operations only where the original instruction semantics match; add Belgian Gemius, consent and advertising policy controls explicitly.

**Tech Stack:** Kotlin/Morphe 2.0.1, dexlib2, Apktool, Python original/rebuilt contracts and bounded DEX execution, Android CLI/ADB for runtime acceptance.

**Spec:** `docs/research/2dehands-16.19.0/README.md`, approved in the thread on 2026-11-01.

## Global constraints

- Pin `be.tweedehands.m`, version `16.19.0`, code `633464`, min SDK `32`, target SDK `37`, certificate SHA-256 `7c2c46aca6a23f0523b69cac1a21f03078be6fd41b3811874c4be1344c23ba47`.
- Preserve the supplied Notifications feature and applicable native/density splits.
- Default advertising, tracking, Gemius, ThreatMetrix and consent UI controls on.
- Preserve genuine rejection/error/transaction outcomes and ordinary marketplace services.
- Never claim complete privacy from static tests alone; runtime acceptance remains required.
- Leave release versions/generated catalogue files to semantic-release; no promotion to main without confirmation.
- All Git author/committer metadata must be the required johninnl identity; verify before any commit/push.

## Review focus

- Repeated/manual consent and missing SDK must never reopen consent UI or grant consent.
- Old grants/queued measurement must not reactivate optional collectors.
- Coroutine cancellation/resumption must finish ad UI without hanging jobs.
- Paid placements must disappear without deleting ordinary classifieds or breaking pagination.
- Shared-code changes must preserve original Dutch instruction contracts and input rejection.

### Task 1: Belgian original bindings and complete input admission

**Files:** `patches/src/main/kotlin/patches/tweedehands/Compatibility.kt`, `Bindings1619.kt`, `tests/tweedehands_1619_contracts.json`, `tests/verify_tweedehands.py`, `tests/test_tweedehands.py`.

**Interfaces:** Produce exact Belgian method/type/field bindings and a verifier accepting `(decoded root, selected patch names, APK)`; consume original base and feature declarations.

- [ ] Pin genuine original method bodies, metadata, feature declarations and libraries; reject bytecode/manifest mutations and wrong identity.
- [ ] Write/run failing production-input regression for Belgian original, Dutch input, wrong version and incomplete feature.
- [ ] Add dedicated compatibility guard and audited selector; rerun original and input checks.

### Task 2: Port established Horizon advertising and tracking operations

**Files:** `patches/src/main/kotlin/patches/marktplaats/Bindings1619.kt`, `Compatibility.kt`, `patches/src/main/kotlin/patches/tweedehands/Patches.kt`, Belgian verifier and contracts.

**Interfaces:** Consume Task 1 bindings; produce separately selectable `Hide ads`, `Disable tracking`, `Disable ThreatMetrix` entry points and bound shared operation calls.

- [ ] Verify original Belgian fixture fails selected-output checks before patch implementation.
- [ ] Audit and port the Dutch edits, with Belgian-specific instruction locations and descriptor translation; fail closed on changed instructions.
- [ ] Verify each rebuilt selection, restore edited methods to pinned originals and check helper/call/field ABI.
- [ ] Verify no-content, cancel/resume, queue filtering and retained functional routing using genuine emitted instructions.
- [ ] Run original/rebuilt Dutch regression after shared-operation changes.

### Task 3: Close Belgian policy gaps

**Files:** `patches/src/main/kotlin/patches/tweedehands/Gemius.kt`, `Consent.kt`, `Advertising.kt`, Belgian verifier/effect tests.

**Interfaces:** Extend Task 2 default controls; consume exact original Gemius/consent/advertising methods from Task 1 contracts.

- [ ] Add failing effect checks for Gemius initialization/pageview/buffer admissions and for all consent UI routes.
- [ ] Block Gemius feature activation, init, send and buffered replay; retain native deny-state cleanup.
- [ ] Hide startup/manual Sourcepoint forms with real rejection and completion/error handling, including repeats and old grants.
- [ ] Audit paid placements and home/VIP promotional surfaces; remove identified advertising without treating all classified-listing `Ad` objects as advertising.
- [ ] Verify emitted instructions and mutation rejection; audit remaining optional Adyen setup telemetry.

### Task 4: Integration and runtime acceptance

**Files:** `scripts/validate_targets.py`, `tests/test_validate_targets.py`, `docs/privacy/2dehands/README.md`, bilingual app pages and source catalogue mapping where appropriate.

**Interfaces:** Register Belgian verifier and app patch dependency closures; expose verified selection matrix and delivered artifact paths.

- [ ] Add failing selector/verifier-routing tests; implement Belgian registration and rerun.
- [ ] Run `python3 -m unittest discover -s tests` and release Gradle Android checks with `ANDROID_HOME` set.
- [ ] Build/sign/verify complete APK, inspect feature/native inventory and test install/launch on available device or compatible emulator.
- [ ] Verify startup/home/search/listing/chat/Notifications/manual privacy routes and collect network evidence for optional collectors across foreground/background and stored state.
- [ ] Review the whole branch, correct supported findings, document precise acceptance boundaries; commit under verified identity when code and required checks are ready. Do not publish/promote without the required confirmation.

## Execution ledger

- Research complete; design approved. Native execution selected under session autonomy; no repeated design approval requested.
- Isolated worktree: `.tools/worktrees/2dehands-privacy`, branch `codex/2dehands-privacy`.
- Baseline: `524b70f92af925dace92e5369033c02072a9c154`.

### Progress 2026-11-01

- Original input guard and four default-enabled controls pass the genuine SDK input regression, including wrong certificate/package/version/SDK and missing Notifications metadata.
- Baseline and current Python suite: 388 tests pass (39 fixture skips). Android bundle builds with Android SDK and authenticated GitHub dependency access; no release or push.
- Belgian binding table contains 111 pinned method declarations (99 inherited operations plus Belgian policies). Four Google-auth-specific bindings are deliberately excluded because this design does not add microG routing.
- Retained-graph verifier pins 1,420 original graphs, five helpers, native libraries and Notifications ABI; all 96 inherited edited-method graphs restore exactly. Strict helpers have independently constructed new expectations for paid placement removal.
- First onUIReady insertion failed Android verification despite structural patch checks. Replaced plain addInstructions with addInstructionsWithLabels; emitted-instruction fixtures now cover missing library, manual/startup flags, repeats and null input. The fixed APK launches.
- Live Sourcepoint observations exposed optional pv-data and hidden WebView/font loads. Added pvData admission suppression and rejection before message rendering. Latest observed build sends genuine reject-all and GDPR choice requests (HTTP 200), returns 0 granted vendors out of 167, and emits no observed pv-data/index.html/font request.
- Live search succeeds and exposed Topadvertentie/Topzoekertje inventory retained by the Dutch policy. Strict Belgian helper filters ICAS and ranked placements plus shipping/GenAI promotional cards; bounded null/unknown/ordinary/paid behavior checks pass.
- Remaining work: rebuild latest publisher view/call tracking additions; full selection matrix and mutations; home-feed error diagnosis; paid-placement runtime check; sourcepoint error/stored-grant/background evidence; default input contract check; Dutch rebuilt regression; docs/integration and final review.
- Runtime limitation observed: original Firebase API key rejects re-signed Firebase Installation registration with API_KEY_ANDROID_APP_BLOCKED; no functional push or account/checkout success is claimed. Ordinary search succeeds. No account action/transaction has occurred.
- Emulator: private read-only bright_consent_api36 instance on emulator-5660, created for this task. Original device/worktree states are untouched. Evidence is under $TMPDIR/re/2dehands-16.19.0. Current instrumented sourcepoint.apk predates strict paid-item and publisher view controls.
- Live observation process uses observe.js and runtime-sourcepoint.log; tcpdump writes /data/local/tmp/2dehands-runtime.pcap on the task emulator. Frida server is /data/local/tmp/2dehands-frida-server. All are task-owned; collect/stop them at finish.

### Delivery checkpoint

- Final original/four-single/all profile matrix passed after the review fixes. Production guard regression rejects missing ARM64, ARMv7, HDPI, changed native bytes and missing Notifications activity; complete genuine input passes.
- Fresh review confirmed both error callbacks reset rejection guards after native null validation and every mutator depends on complete resource/feature admission. Failure-to-retry emitted sequence now passes.
- Current source uses 14 native SHA-256 pins, 231 resource-presence entries and 113 class / 404 method feature declarations. XML resources use presence checks because the SDK decodes binary XML.
- Python: 396 tests, 39 skips, genuine Belgian fixture tests enabled. Node release/identity regressions: 35 pass. Android build and extension unit tasks pass.
- Firebase installation registration returned genuine HTTP 200 with original publisher SHA1 and no heartbeat header. Search runtime samples retain normal m-prefixed classifieds and remove the Admarkt a-prefixed DEFAULT_LISTING case. No transaction or credentials used.
- Local APK and MPP delivered under Downloads/2dehands-privacy-16.19.0-20261101-164055 with SHA256SUMS. Original XAPK hash is unchanged. Nothing published or promoted.
- Still pending: signed-in account/incoming push/payment acceptance by the user; final background/stored-grant and broader runtime acceptance must not be inferred from anonymous tests. Async user choice asks phone versus isolated emulator.
- Public docs match metadata generated from the actual bundle in isolated metadata-preview. The checked-in released catalogue remains unchanged; generic docs check against that old released catalogue reports the future 2dehands page as extra. Do not present this branch as publication/merge CI acceptance until that release integration is resolved.

### Main publication sequencing

- User explicitly clarified that signed-in/account, incoming-push and payment acceptance happens after publication on main. Do not gate stable publication on those checks or perform additional emulator acceptance before release.
- Selectively cherry-picked only the 2dehands commit onto current origin/main in release/2dehands-approved; unrelated dev changes are excluded.
- Current main already generates candidate metadata in its Documentation workflow, resolving the earlier stale-catalogue PR concern without modifying generated release files.
