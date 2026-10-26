# CamScanner lottery video skipping

## Selection and compatibility

`CamScanner disable ads` exposes exactly two `rewardedVideos` values:

- `block` (default): block videos without a reward flow.
- `skip-lottery`: explicit online 7.27.0.2609220000 / 72701-only experiment.

The temporary `inspect-lottery` value is retired and fails option validation.
Desktop CLI may warn and continue with default `block`; this does not activate
diagnostics or skipping, and is not a whole-command rejection. There is no
observation overlay, native wrapper or additional quota query. Do not combine
lottery skipping with offline mode or automatically port it to another input.

## Original request and server flow

Two original UI-thread dispatch paths in `WatchAdControl` are guarded by exact
class pins, method shape and register layout. Only a matching lottery action,
left reward-video manager, nonempty request ID and live activity/fragment may
construct the original callback. Preload (`prestrain=1`), canceled, malformed and
empty data use the pinned original parser and do not signal reward completion.
Unrelated actions/managers keep the original dispatch path.

The active request remains bound to its original activity, fragment, manager and
request data. One completion and close use the original callback/task-code/API
flow. No endpoint, grant response, quota, backend code or UI counter is fabricated.
Server denials remain real denials. This is not a general rewarded-ad bypass for
other placements or a promise of server credits.

## Dispatch-label regression

MAIN inserts at instruction 21 / code-unit offset 38; POSTED inserts at zero.
Plain `addInstructions` kept local labels zero-based at the nonzero insertion,
redirecting cancellation into `move-result` at 81 and fallback into the middle of
the prefix at 82. That violates DEX control flow and was consistent with the
native `VerifyError` captured at the original app-dispatch call site. Reflection
metadata resolution had not excluded a body-verification failure.

`installRewardSkip` uses the official `addInstructionsWithLabels`. The unchanged
prefix branches only to its own cancellation return or original-fallback NOP
(119/120 in pristine MAIN replay). Both paths retain original bodies, parameters,
registers and handlers. Their semantic tests use their real insertion offsets.
A retained counterexample explicitly detects the old illegal branch. Actual APK
inspection must check all 13 guard destinations per dispatch; merely preserving
original instructions or checking `MethodAnalyzer.analysisException` is not enough.

## Silent initialization protection

The original page-finished method is independently pinned. Its prefix only submits
the accepted silent script on the two qualified HTTPS hosts. The script acts only
on the lottery route and already-loaded exact public configuration module. It
requires exact original page/preload function sources and bridge readiness.

Qualified synchronous initialization failures cannot prevent the page's original
quota reads. Active claims and unrelated page events/routes preserve their
original return/errors. Owned wrappers restore after the original preload or a
bounded deadline, preserve later SDK owners and deactivate if frozen. No native
method is replaced, no DOM is changed, and no query/draw/claim is initiated by the
protection itself. The accepted script remains byte-identical during cleanup.

## Acceptance and limitations

On-device evidence accepted the corrected original preload entry/return without
reproducing the prior verification exception on that path. Subsequent normal-mode
feedback included an OCR prize-issued dialog and a claimed-cloud-reward aggregate
increase matching a 50 MB prize. This supports the observed phone claim flow, not
universal grants, independently usable OCR quota, total account storage capacity,
a previous failed-prize recovery or a chance refund. No further consuming test
is needed solely to repeat that acceptance.
