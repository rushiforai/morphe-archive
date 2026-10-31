# Videoland mobile consent and notification startup

Target the original phone/tablet 1.116.4/1627 split package documented in
`2026-10-30-videoland-mobile.md`. Add the normal default-on **Skip consent
screens** control, depending on **Disable tracking** and the original-input
guard. Keep **Hide ads** independently selectable. All three selected controls
retain the previous 35 ad/tracking boundaries and add seven owned method edits.

## Real OneTrust rejection and readiness

`OneTrustMobileSdk` constructs the real `OTPublishersHeadlessSDK`, calls
`startSDK`, then receives `B2.c.onSuccess(OTResponse)`. The original callback
publishes that exact SDK through its deferred `V(Object)` and calls `c0()`.
Insert the policy before the original SDK publication; retain the entire
completion tail and the original failure callback.

After real SDK readiness, call the SDK's actual
`saveConsent("Banner - Reject All")`. This is the same call used by the original
banner Reject All button in `UI.fragment.q`; it is not a fabricated accepted
state or a constant replacement for `shouldShowBanner()`.

Apply the choice on the first patched initialization, including an existing
accepted install, or when the genuine SDK reports `shouldShowBanner()`. Persist
the owned `patches.videoland.onboarding` preference
`necessary_consent_policy_v1` only after the SDK save returns. Subsequent manual
privacy choices remain saved when the SDK does not require reconsent. Manual
OneTrust presentation and all consent-category readers remain original.

Evidence: `ev_951ed5748a66b8e2d6adfc8174da70f0f722231ad684dc907a0ed5429523695c`,
`ev_408a88239a18f34c9cde026db630205f970a3c9645c7b3e64232a25456d0f89d`,
`ev_3d0bab9805e3ea12b18b9ea8132feed46c9b60838a185dee809ee21267427e45`,
`ev_d8ceac4434fa37bb6d6dea2fc4491c1aa2ab9ad50503eced732820bceafc2b84`,
`ev_e8fc25de95a5bea51685dfe4a191591d1319d8263ca34874161052a7054bbb5d`.

## Notification denial and manual opt-in

`PushNotificationPermissionFlowImpl.a(boolean)` carries
`EXTRA_IS_FROM_SETTINGS` to its Activity. Keep that entire Activity and its
permission/result callbacks original. Complete only the initial automatic
`NotificationPermissionTask.e.invokeSuspend` path after its real Result check
with the existing `ri.o(true, true, null)` no-UI value. `ri.o.toString()` identifies
these fields as `SplashTaskResult(succeeded, canExecuteChildrenTasks, payload)`;
they are task completion flags, not OS permission values. No automatic Activity
launch effect is emitted, while manual settings retain their original route.

Both state managers initially inferred `SUBSCRIBED` from OS permission, which
also enables notifications by default on API24-32. Initialize their observable
state as `UNSUBSCRIBED`, then normalize implicit `SUBSCRIBED` using the original
asynchronous preference-write and state-update continuations. Keep genuine
`OPT_IN`. Missing/invalid stored values originally read as `SUBSCRIBED`, so the
normalizer writes a real `UNSUBSCRIBED` preference instead of only returning a
temporary false value. The legacy manual toggle's true branch in `H9.b.call`
now records `OPT_IN`, preserving that explicit choice on later initialization.
Keep OS permission checks, manual settings, account, push SDK initialization,
DRM and playback methods intact.

Evidence: `ev_adbb4a7f3acf551a6555caa6ef0cf5da824f7988982a40e2479671610edcb844`,
`ev_40a01bb3e35ab61e2276e621167b1f019d7c6fc53bbfbc215da2db7e2fe38ac0`,
`ev_a2827c5c1e9d7dbc4fcb29aa013763e6bb696b8fb7f72a4953446908e1dd11c9`,
`ev_34235f09ebd2fc7bb9c10562b0405515bee31735e9f1641b8067d401266043c6`,
`ev_88dc6d845aade47572635787684868924c81c41015c0d231f38dd34a7f6b56d0`,
`ev_b14b6539f0552271c5df8cc727febf7bf040f11f23a23bd95f4a68683478cb89`,
`ev_d07272befe71d4e4c436bc57c9f11733cfc1b55a8634199adfedbc019b91a60d`,
`ev_c69fd67a0b5b13112a7e7a65c97a6cfa5683a9df7dc2d751791434e90a2cd75b`.

## Independent emitted verification

Pin original graphs and exact insertion/replacement effects separately in
`tests/videoland_mobile_consent_contracts.json`. The initial stock check fails
because genuine SDK-ready rejection is absent. Verify first migration,
reconsent and later manual-choice branches, automatic denied/manual notification
branches, original callbacks and every emitted branch destination.

Bind inserted branches with explicit builder labels after insertion. The
independent destination checks rejected a prototype whose assembler-local
labels were incorrectly relocated at nonzero offsets; that prototype was not
installed. Seven targeted emitted tests pass for the fixed candidate, including
adversarial branch corruption and removal of each owned effect.

Fixed all-controls APK SHA256:
`4712ef966ce222e1ac04a25963dc66d5055b687b9ea4bef8a75f8b96234496ad`.
Both use FULL bytecode mode and pass SDK signature verification and all 2,230
original resource/asset/native payload checks. The complete decoded verifier
checks all 161,557 original methods, 37,941 classes, the merge/privacy manifest
and only the selected effects. Use `--consent` for the standalone control and
`--ads --tracking --consent` for all controls.

Phone validation is owned by the user and integration task. Host preservation
checks do not establish real OneTrust purpose/legitimate-interest persistence,
manual notification UI success or legacy-device runtime behavior. No further
emulator/ART checks were performed after the user's request to stop them.


## Phone-reported rapid Activity relaunch correction

The phone reported system process kills with `rapidActivityLaunch`, rather than
an AndroidRuntime exception, after the first onboarding implementation. That
implementation finished automatic notification entry through `q(FALSE)` before
original `A()`/`B()` ran. Their `ki.i`/`ki.j` coroutines persist the last request
timestamp, which the startup task uses to decide whether to emit its notification
launch payload. Finishing early skipped that bookkeeping while retaining an
eligible UNSUBSCRIBED state, exposing a repeated-launch path.

Restore `PushNotificationPermissionActivity.onCreate` completely and prevent the
startup launch effect at its producer using the native no-UI task result above.
Keep real preference normalization and manual OPT_IN unchanged. The c26 candidate
fails the new native-ready regression; the v3 candidate passes all seven targeted
emitted tests, including original Activity `onCreate/A/B/q` and timestamp-coroutine
construction, all prior 35 controls and exact branch destinations. The integration
owner owns the direct phone retest; no emulator checks were performed.

Evidence: `ev_d2a866f227328dc7bfb1b1f5a418c2234195bb484d27d59bda032f6d4476dc76`,
`ev_a6d2ecc013aa21fc83e0362ebad366c72bb9b2b5d6dadfb8d3fd94e37172eee6`,
`ev_83dfd4123ee057ddd59a06ba2ef70533ff0ada8eab3f630198962830bb77cdf0`,
`ev_fbfa9b7c28d2161690bc4d2a4a5d5d20cd5502660d5ec7930d2a29f3d1705447`.
