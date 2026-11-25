# Native warning implementation review

The branch was reviewed against GitLab main `84f4ac82ccac6a3c3727472dff9f2d108d906866`, the [reviewed requirements](../superpowers/specs/2026-11-02-flitsmeister-native-warnings-design.md) and the [acceptance report](2026-11-03-native-warning-acceptance.md). This is a review checkpoint, not a claim that the remaining acceptance gates are complete.

Three read-only agents performed thirteen separate review passes: correctness, testing, maintainability, project standards, agent parity, institutional learnings, security, API contracts, reliability, performance, adversarial timing, CLI readiness and Python correctness. The installed adversarial persona file was absent, so that pass used the stated timing/state-transition focus and findings schema. No `docs/solutions/` learnings existed. Review concentrated on production paths and their test/evidence joins; it did not exhaustively inspect every large research fixture or perform device actions.

## Confirmed findings and fixes

| Finding | Change | Verification |
| --- | --- | --- |
| Maps discarded a language preparation request made during active speech. The scheduler would not request it again, so the next language could remain unavailable until expiry. | Apply the latest deferred language only after positive quiescence, before the terminal listener advances queued work. Do not reconfigure during uncertain output or shutdown. | Completion and positive-stop regressions both failed before the fix and pass afterward. |
| FM report snapshots retained native text but replaced its unknown language with the app locale. | Retain language and associated text provenance with the retained message, including instruction/template fields. New text still follows native resolution. | The free-text `und` → snapshot regression failed before the fix and passes afterward. |
| Vela treated unavailable active-route geometry as no active route, allowing a wrong straight-heading rejection around a bend. | Distinguish inactive navigation from unknown session state. Active or unreadable route state without usable geometry leaves passage unknown. | Four actual-policy regressions failed before the fix; all five tests pass, including the no-active-route heading control. |
| Moving/delayed auditors accepted a changed speaker language. | Compare language and the immutable semantic fields of native authority and actual speaker payload. | Four exact accepted real-run baselines are retained in a compressed fixture. All pass; changing their speaker languages now fails both auditors. |
| Integrated Maps/Vela retries could overwrite prior evidence in a reused output directory. | Reject nonempty output before ADB access or helper copying. | Both CLI cases fail early against a fake ADB sentinel and preserve existing evidence. |
| A Vela cleanup command failure skipped other restores and the structured run result. | Attempt independent cleanup steps and retain original failure plus individual cleanup errors in the final report. | Injected location-restore and permission-revoke failures both retain the report and attempt remaining restores. |
| Optimized Python removed assertion-based device admission and evidence acceptance checks. | Refuse `-O`/`PYTHONOPTIMIZE` before validation or device access in all five affected tools. | Host-only CLI regressions verify immediate refusal for each tool. |

Focused read-only re-review accepted the fixes. No additional confirmed security, contract, reliability, maintainability, performance or agent-parity defect was reported. A host projection benchmark did not substantiate the suspected bounded passage-check cost; it does not replace Android profiling.

## Checks and limits

- Maps: 81 component tests; FM: 169; Vela: 90. No failures, errors or skipped tests in these component results.
- Pinned-original patch tests and Android bundle build passed with all three original artifact paths supplied. Raw output: `.analysis/native-warning-bindings/review-production-fixes-green.log`.
- Python: 491 tests, 45 skipped. Raw output: `.analysis/native-warning-bindings/review-python-regressions-green.log`.
- Strict bilingual site build passed. Rendered-site checks verified 95 translated page pairs, 191 HTML files, local links/anchors and language/canonical metadata; app-page checks verified 110 concise pages.
- Red logs remain under `.analysis/native-warning-bindings/review-*-red.log`. A partial cleanup-test stub initially lacked a host PID; it was corrected before the final full coordinator fault checks. No failed evidence was rewritten as passing.

Earlier emulator acceptance remains bound to the APK hashes in each fixture. These product fixes require rebuilt intended combinations and current-candidate runtime checks; a previous APK's runtime record is not proof for new bytes. Route-bend/parallel runtime cases, additional lifecycle/mode/compatibility and actual car output, final CI/delivery and separately authorized stable promotion remain open. The branch is **not ready to merge** while those required gates remain unresolved.
