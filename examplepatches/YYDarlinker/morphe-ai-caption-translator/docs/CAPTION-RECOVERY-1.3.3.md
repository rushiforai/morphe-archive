# Caption recovery, seek demand and startup — 1.3.3

## Baseline and evidence

Based on public v1.3.2 (`5092bec7fd2536fdfc69f2f44210f9cd92f96637`) plus the
locally retained scheme-B commit `f7dc22327bfc819a5e6e3bef59db35b0defe4354`.
The rolled-back later-version artifacts elsewhere in the workspace are not this build.

The user's screenshot shows `CronetUrlRequest: ERR_CONNECTION_CLOSED` with a retryable
flag. The supplied diagnostic does **not** contain that failure event; it shows a different
successful playback interval with 13 successful audited API attempts. Do not infer a model
outage from those records. Its `FIRST_AI_READY` reports 10,068 ms total startup and 2,272 ms
for the successful first batch: roughly 7,796 ms was spent before that batch. The overwritten
startup stages prevent attributing all of that delay to any one network call.

Concrete reproduced problems in the baseline:

1. Any source-loader exception called `failSession`, setting the session's terminal flag.
   A retryable source connection drop could never self-recover. Header-stage failures also
   escaped the original connection cleanup block.
2. A 2,900 ms seek threshold plus monotonic presentation could ignore a short rewind and
   leave the scheduler at the later position. Same-millisecond callbacks also discarded
   backward-seek detection. The initial two reproductions failed before the fix.
3. The source loader synchronously bootstrapped anonymous cookies via `sw.js` before the
   actual caption request. This additional connection had 6 s connect/read timeouts, ran
   outside the source/reference budget, and failed lookups had no negative throttle.
4. Source parsing, reference atomization and alignment were repeated. Model-name protection
   built up to six joined strings for every ordinary word. Disk-cache restoration could
   race the live scheduler because timeline readiness was published too early.

## Changes

### Source recovery is separate from paid translation retries

- Transient source GET failures (connection errors, timeout, empty responses, 408/425/429/5xx)
  retain the session and retry at 0.75, 2, 5, 15 and then 30-second intervals. Retry-After seconds
  are honored up to 120 s. The long-outage rate is at most two loader attempts/minute (format/auth fallback can add bounded GETs), and no translation
  POST occurs until a usable source exists.
- One source task per session. Failed invisible prewarm does not retry until requested visibly.
  Switching videos or turning the engine off cancels the task and disconnects its active socket.
  Real configuration/certificate errors do not retry indefinitely. A newly signed same-track
  descriptor can unblock source access, including one arriving during a failed old attempt.
- Concise, localized recovery status replaces the raw networking exception on screen. Safe
  categories, attempt counts and delays are retained independently of noisy display diagnostics.
- Source bytes must parse and contain cues before being cached. Corrupt old cached tracks are
  discarded and fetched again; signed URLs, cookies and keys are not added to diagnostics.

### Lower startup overhead without changing translation/sentence rules

- Try the native signed source URL immediately, with any fresh in-memory cookies. Only an actual
  401/403 triggers one bounded anonymous-cookie refresh and source retry; do not retry 429 that way.
  Cookie refresh is capped at 3 s and shares the primary attempt budget. Concurrent/failed refresh
  is throttled for 30 s.
- Primary source I/O has a 12 s total attempt deadline. Optional timing reference still has the
  existing 2 s budget. Cancellation reaches source, reference and cookie I/O. A deadline watchdog
  also prevents slow-drip bodies from keeping an API/source connection alive indefinitely.
- Reuse parsed source documents and reference atoms/comparisons. A cached reference retains only
  reusable reference information; derived alignment is re-evaluated for the selected source.
- Skip exhaustive name scanning only when the anchored brand predicate cannot match. Differential
  tests compare the new and original algorithms over a 4,000-atom multilingual/name fixture,
  including whitespace. Token-weight regex is compiled once. Text, times and precision are equal.
- Restore the translation disk cache before exposing the timeline to the scheduler, avoiding
  cache-hit races that could create unnecessary paid requests.

### Rewind and in-flight work

- Backward motion has a separate 250 ms jitter tolerance; forward-jump/rate-transition policy is
  unchanged. A genuine rewind resets presentation and prioritizes its demanded window.
- Previously skipped opening windows remain pending and can be translated on demand, even when
  rewound while paused. READY translations are reused, never retransmitted just for replay.
- A covering current request and already-sent background request survive a seek. Unsuitable
  current work can be cancelled so the requested location is not blocked. No speculative duplicate
  rescue POST is introduced. The seek only reopens the demanded failed window, not eight future
  windows' retry budgets.
- A content-filtered batch does not poison the entire session; later independent windows continue.
  A stale cancelled request's fatal error cannot terminate the replacement demand.
- API total budgets remain 10 s current / 16 s background; output budget, prompt, source phrase
  validation, transport window/normal batch/context sizes, automatic three-failure window cap,
  30 s prefetch horizon and disk plan format are unchanged. An explicit seek may reopen only its
  demanded window. The source GET recovery is not an extra paid retry allowance.

## Scheme B included

This release also publishes the previously local inline API profile-management UI. See
[interaction specification](PROFILE-INLINE-LOCAL.md). The work was preserved, not replaced:
row-end More, same-list rename/deletion confirmation, one expanded row, guarded drafts,
scoped key deletion, one-profile minimum, RTL and narrow-width behavior remain.

## Verification and boundaries

Automated coverage includes real controller lifecycle and parser/scheduler paths with in-memory
Cronet-shaped transport and a controlled model adapter; it does not use a real provider key.
Tests cover timer-driven recovery without a toggle, retry throttles, scoped network cleanup,
new signatures, poisoned cache, skipped intro translation, cache-free replay, retained covering
requests, filtered-batch recovery, same-timestamp rewind, cancellation and total I/O deadlines.

The build/release verification record supplies the final test count and bundle hashes. Build the
Android MPP, fully compose official Morphe 1.43.0 compatible defaults plus all three addon roots
on original YouTube 21.07.247, then audit DEX and generated settings before pushing. Publication
uses the existing conventional-commit → GitHub Actions → semantic-release flow, not manual assets.

No real-phone playback/IME/visual acceptance, paid-provider latency comparison or live YouTube
network benchmark was performed. First-caption p50/p95 and real token/minute savings are **not**
measured. The removed work and call-count bounds are established; universal instant captions,
uninterrupted service during an outage and identical real-model semantic output are not promised.
Native word alignment and existing cue-estimated timing remain distinct. Existing long cached
segments may still trigger readability warnings; this release does not hide them or resegment
translated text by character length.
