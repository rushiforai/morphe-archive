# Maps Android Auto Exit and FM entry speech — attribution and fixes

**Engineering record — 8 November 2026**

This document records the first implementation pass against
[`Navigation-AA-Fix-LLD-2026-11-08.md`](../../../Downloads/Navigation-AA-Fix-LLD-2026-11-08.md).
It is deliberately separate from the hand-over document: the hand-over keeps the
original reproduction recipes, this record keeps what was actually observed,
changed and verified.

## 1. Source and inputs

| Item | Value |
|---|---|
| Branch | `fix/navigation-aa-exit-speech` |
| Worktree | `.tools/worktrees/navigation-aa-fix` |
| Start point | `aceb8e8f825bc4fc25e71aa299f38ddffa56819b` (hand-over head) |
| Synced main | `494da708` (v1.55.0, includes the hand-over merge) |
| Maps APK | `org.ungoogled.android.apps.maps-c1a8a90eee91.apk` |
| Maps SHA256 | `007364c6507de4015eb97c14cb94d03d3dbd112b566fc7d93e5b3c3948b8fe6b` |
| AA | original Android Auto `versionCode=179664044` |
| FM | `nl.flitsmeister` 15.0 |
| AVD | `nl_morphe_navigation_api34`, `emulator-5590` |

Companion manifest: all 45 files verified against their recorded SHA256 before
the runtime work. The navigation source is unchanged between the hand-over head
and `494da708`.

## 2. Issue A — Exit navigation

### 2.1 What was run

Two bounded attribution runs on the unchanged failure APK, with the existing
unchanged base observer plus the hand-over `End-chain.bundle.js` probe
(`a22edbfd…`):

1. **Fresh route**: AA launcher → Ungoogled Maps → Search → recent Amsterdam →
   preview → Start, then visible top-right X.
2. **Reboot-restored route**: the same route was started, the emulator was
   rebooted while navigating, AA reconnected, and the restored guidance screen
   was exercised with the same X.

Both runs used a stationary A4 fix and recorded hook readiness before stimuli.

### 2.2 Observed chain

Both runs produced the same complete chain:

```text
rvp.d
  bmxc.j
    rni.sB          (stop branch, not the rni.g confirmation branch)
      ryt.n
        ryt.k
          blyw.f / blyy.f   (FREE_NAV request future returned normally)
```

and the native guidance mode moved out of guidance within the same frame:

- fresh route: `GUIDING → OFF` after 134 ms, then `CRUISING`;
- restored route: `GUIDING → OFF` after 131 ms, then `CRUISING`.

`NativeCarService.navigation` was entered with `guiding=false` while
`session.navigating` was still `true`, which is exactly the path that sends
`INavigationHost` code 3, clears the trip and invalidates the template. The DHU
frame after the bounded observation window showed free drive with no guidance
cards.

### 2.3 Conclusion

**The 213 failure was not reproduced.** On this APK, both a newly started route
and a reboot-restored route execute the intended native stop branch and notify
the host. The hand-over's own rule applies: a click that reaches the correct
branch and stops navigation does not justify rewriting input targets, cards or
the native chain.

Evidence in
`.analysis/navigation-aa-fix-20261108-170805/`:
`End-chain.log`, `End-result.png`, `End-after10s.png`,
`End-chain-boot2.log`, `restored-End-result.png`,
`restored-End-after10s.png`, and `receipt.json`.

A probe client lifetime expired during the fresh run. The resulting process
death is a Frida-agent SIGSEGV (`libart JavaVMExt::DeleteGlobalRef` under
`frida-agent`), retained as `tombstone_07.txt`. It is a validation artefact, not
a product defect; the Exit result above was collected before that expiry.

### 2.4 Product change

Because the listener is normally responsible for reporting native cessation, a
missed or stale emission would leave the host in guidance even though the engine
had stopped. `NativeGuidance` now exposes `refresh()`, which re-reads the
authoritative cached native source and reports **only** cessation (it can never
announce a navigation start or fabricate a snapshot).

`NativeCarService` calls that refresh after a visible content action and again
after 120 ms, 400 ms and 1000 ms, bounded and main-thread only. The click
callback is never blocked, and duplicate `navigation(false)` handling is already
idempotent: the host stop is sent once, stop callbacks complete once, and later
refreshes see a non-navigating session.

Regression:
`NativeGuidanceTest.refreshReportsAuthoritativeCessationEvenIfTheListenerWasMissed`.

## 3. Issue B — FM entry speech

### 3.1 What was run

Genuine FM 15 source, `VOICE`, all categories (`47`), Maps guidance unmuted, AA
route from the same A4 start, then the first **70** GPS points of the retained
A4 trace at 1 Hz. The hand-over `End-focus-probe.bundle.js` (`66756c87…`) was
attached to the actual Maps PID after UI setup and before movement, with base
observers on Maps, FM, TTS, `:car` and `:projection`.

### 3.2 Observed focus requests

| Requirement | Observation |
|---|---|
| Native guidance request | Three requests before the warning, all through `bmyh.g → MapsGuidanceCoordinator.requestNativeFocus`, `holding=false`, granted |
| Warning's own request | `gain=2`, `usage=12`, from `MapsWarningSpeaker.begin`, `holding=true`, granted |
| Warning terminal | TTS `speak` 43 chars, `onStart`, `finish(COMPLETED, quiescent=true)` after 3.3 s; no `onStop` |
| Coordinator identity | No idle replacement observed; `current.holding=true` throughout the warning |
| Native focus after warning | Next native request occurred after the warning had already released |

So this run produced a **COMPLETED** entry warning, not the 210 interruption.
The guarded call site is confirmed to be the one the hand-over pins. The run did
not produce a competing native request *inside* the warning window, so it
cannot decide between a legitimate preemption and a hold-ownership gap.

Evidence: `focus-b.log`, `maps-b.log`, `fm-b.log`, `tts-b.log`,
`b-guidance.png`.

### 3.3 Product change

Source review found a concrete ownership weakness independent of the exact 210
timing: every `MapsGuidanceCoordinator` constructor overwrites the static
`current`, but the native focus, final dispatch and prepared-callback fences
consulted only `current.holding`. A newly constructed idle coordinator (another
receiver/speaker instance) therefore erased the active hold and allowed native
focus to be granted.

The coordinator now tracks the **live hold owner** separately from `current`.
The owner is recorded when a hold is actually taken (P0 immediately, ordinary
priorities when the native gap is reserved), cleared on release/abandon/close,
and used by `requestNativeFocus`, `dispatch` and `cancelPreparedCallback`.
`current` remains for diagnostics and for the existing direct-call tests.

This preserves legitimate preemption: focus loss on the warning attempt still
cancels through `MapsWarningSpeaker`'s listener, native unheld calls keep their
original result/exception, and no mute/volume/readiness policy is changed.

Regressions:
`MapsGuidanceCoordinatorNativeTest.newlyConstructedIdleCoordinatorCannotEraseTheOwnedHold`,
`MapsGuidanceCoordinatorNativeTest.releasingTheHoldClearsTheOwnerEvenAfterReplacement`.

## 4. Verification

| Check | Result |
|---|---|
| Targeted extension tests | 15 passed, 0 failed |
| Targeted maps-gearslip guidance tests | 6 passed, 0 failed |
| Canonical Android gate | `BUILD SUCCESSFUL` |
| JUnit totals | 1052 tests, 0 failures, 0 errors |
| Skipped | 51, all unrelated original-APK/medium fixtures for apps whose inputs are not installed in this worktree; all Maps tests ran |
| Full `scripts/local-release/verify.cjs` | passed: identity, node policy tests, Python, Android, Medium bundle/tests, docs catalogue/pages/build/site |

The Maps original-APK variables pointed at the retained
`merged-original.apk` (SHA256 `3ec1854b…`) so the Maps native tests did not
silently skip.

## 5. Review build and hardening release

Commit `990579861fc0` (the hardening commit; a later docs-only commit may be
newer) produced the review artifacts below. The canonical patch release is
built from the promoted `main` head by the normal release flow, not from this
review bundle.

| Artifact | Value |
|---|---|
| Review MPP | `~/Downloads/nl-morphe-navigation-<sha>.mpp` (`26.44` package version unaffected) |
| Review version | `1.55.0+review.<sha>` |
| Canonical release | `perf(navigation)` commit, patch release through the normal flow |
| Signature | verified against `morphe-signing.pub`, same existing identity |
| Original APK patch | `success=true`, 28 applied, 0 failed, default Maps28 set kept |
| Icons | 19 packaged; 18 match the 256 px pack, emergency matches the mockup repair |
| Signed APK | Android Debug certificate, matches the retained input signer |
| Device install | `adb install -r` succeeded; installed `base.apk` SHA256 equals the signed APK |

Focused fixed-build acceptance (original AA 17 + DHU 1280×480):

- a fresh route reached guidance and the visible Exit produced free drive;
- a new Search/recent/Start route worked after End without reconnecting AA;
- the genuine FM entry warning started and reached `COMPLETED/quiescent`,
  with the guarded native focus path and the warning's own hold intact.

## 6. Remaining limitations

- The 213 Exit failure was not reproduced. No native/footer code was changed;
  the bounded authoritative refresh is a listener-loss safety net, not a
  rewrite of the native stop path.
- The 210 entry interruption was not reproduced in the first 70-point attempt.
  The hold-owner fix is source-provable and covered by unit regressions, but the
  actual 210 requester/change code still needs a run where the native request
  lands inside the warning window.
- A third attempt (higher GPS speed to move the native instruction into the
  warning window) was aborted before any stimulus: the AA `:car` observer failed
  with a `frida-java-bridge` access violation and DHU then lost its transport.
  It is retained as an incomplete coverage run, not as evidence.
- The fixed-build acceptance is a regression pass, not evidence that the two
  original failures are closed: both original failure states must be recreated
  first.

## 7. Owner disposition (8 November 2026)

The owner directed that both issues be **closed for now** because neither
failure can currently be reproduced, and reopened only when a real user
witnesses the symptom. The disposition is:

- Exit navigation and the FM entry interruption are not labelled "fixed" on
  the strength of this pass; they are closed as **not reproduced / awaiting
  user witness**.
- The hold-owner fence and the bounded authoritative refresh remain in the
  build. They are defensive hardening with passing regressions; they do not
  replace a witnessed failing trace.
- If a user reports either symptom again, the first action is to capture the
  same bounded trace against the then-installed build. For Exit, use the
  `End-chain` probe; for speech, use the `End-focus` probe or a run where the
  native request lands inside the warning window.
- No further reproduction attempts are planned in this pass.


