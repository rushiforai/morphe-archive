# Fossify Messages: dismiss read conversation notifications

Patch: **Dismiss notifications when marking conversations read**.
Target: official Fossify Messages 1.10.1, `org.fossify.messages`, `messages-25-foss-release.apk`.
Original SHA-256: `af81e85e0e5442cf22d9669f43ecc42e39737389cff8fe91fd0ef58dab59703d`.
Original release: https://github.com/FossifyOrg/Messages/releases/tag/1.10.1
Issue: https://github.com/FossifyOrg/Messages/issues/929

## Behavior

The conversation-list **Mark as Read** operation already updates the SMS/MMS provider and the app database. After that operation returns successfully for a selected unread conversation, cancel only the notification whose ID is the Java hash of that thread's long ID, matching Fossify's existing notification identity. Unrelated notifications and the mark-as-unread branch are unchanged. No message bodies, recipients, delivery or database schemas are modified.

The official optimized APK merges the read/unread adapter lambdas into `Lv90;->a()Object`. The patch requires one exact `Lqp3;->k0(Context,long)void` read call and injects the helper immediately after it. It does not hook every use of the global read helper. Unknown signatures fail patch application.

This intentionally addresses #929 only. The visible-thread/background races in #927/#928, global stale-notification sweeps, launcher-specific badge behavior and bubbles are separate work.

## Evidence and attribution

The issue's analysis and the author’s personal-fork fix informed this patch: https://github.com/fatehiman/peppa-ai-messages/commit/44d2d3876088522785bb2f5d43b54226a6dce555 . That implementation includes a broader provider-driven sweep and lifecycle changes. This patch independently uses the narrow selected-thread cancellation pattern already present in Fossify's archive/delete actions; it does not copy the fork's sweep or bundled features.

On isolated Android 15 ARM64, original APK: receive synthetic SMS, select conversation, Mark as Read; unread badge disappears but the conversation notification remains. Patched APK: the same UI operation removes the selected conversation's notification. A separate unread conversation/notification was observed to remain during the initial integration run. Later screenshot run marks both synthetic threads read, leaving no Messages notification. No force-stop or notification clear occurs between the selected-thread action and its final after screenshot.

Six native instrumentation assertions pass against the installed patched APK: fixture posting, selected cancellation, unrelated-thread retention, wide-ID retention, idempotence and Java Long.hashCode identity. Actual UI integration confirms the bytecode hook and provider-backed read state. Original-to-patched same-test-key update retains existing synthetic conversation content. Fresh final test crash log is empty.

Screenshots: native 1080 × 1920, identical emulator/viewport, original release APK before and patched release APK after, synthetic content only. See the release evidence assets.

## Installation and limits

Input must be the original official 1.10.1 APK. The patched package remains `org.fossify.messages`. A different certificate cannot update official Fossify in place. Export/verify message backups and signing-key recovery before any migration; never recommend uninstalling an existing real installation without a verified backup. Existing Morphe-patched installations using the same signing key can update in place. Users may need to select the patched app as default SMS app again.

Not independently tested: physical Samsung/One UI launcher badges, mobile Morphe Manager execution, carrier delivery, actual MMS reception or Android versions other than the isolated Android 15 environment. The original read path handles both SMS and MMS; this does not establish real-network MMS acceptance.

## Before and after

| Before | After |
| --- | --- |
| <img src="https://github.com/pengusto/penguin-patches/blob/pr-assets/messages/before.png?raw=true" width="320" alt="Original app before patch" /> | <img src="https://github.com/pengusto/penguin-patches/blob/pr-assets/messages/after.png?raw=true" width="320" alt="Patched app after the same operation" /> |

[Native screenshots and test results](https://github.com/pengusto/penguin-patches/tree/pr-assets).

## Optional lifecycle fixes: #927 and #928

Two independent patches target the same official 1.10.1 input:

- **Keep background conversations unread** (#927): gate only the original per-message read branch in ThreadActivity's message-list construction by that exact Activity's visibility. A synchronized weak Activity-to-thread registry is populated after onResume's super call and cleared at onPause entry/onDestroy. The message's original already-read condition remains intact. Original onResume read behavior is retained.
- **Avoid notifications for visible conversations** (#928): check the registry inside the original main-thread notification Handler Runnable. Suppress only notifications for a currently visible positive thread ID. An ordered background worker marks only the exact incoming provider message ID/thread pair read/seen, then uses the original refresh events to reconcile app/UI caches. Messages arriving after pause or for another thread retain the original notification path. A failed provider write replays the original Runnable on main exactly once with a reentry guard.

Shared visibility hooks run once when both patches are selected. Both also compose with #929; they can be selected separately. Unsupported official bytecode layouts fail application. No sender, recipient, body, outgoing-message or schema change is made. Lifecycle scope is Android resumed visibility (pausing, including a covering system surface, permits notifications).

### Current verification

Original official APK in isolated Android 15 ARM64: a stopped ThreadActivity marked an emulated incoming SMS read while Home was foreground (#927); a visible thread marked an SMS read but left its notification after Back (#928). Native before screenshots and provider dumps retained. In the combined patched APK, the same background fixture stayed read=0 with a visible unread count in MainActivity; the visible fixture became read=1 without a residual notification after Back. Same-certificate original-to-patched test update retained synthetic messages.

18 native instrumentation assertions cover fresh/visible/paused Activity states, already-read logic, thread and multi-instance ownership, thread replacement, invalid ID, execution-time check, background-caller fail-open behavior, exact provider-message read while another message in the same thread remains unread, failed-write fallback, nonrecursive exactly-once original replay and post-pause notification allowance. The original #929 assertions are run separately. Single-patch applications are checked independently of the combined default selection.

The issue diagnosis/fork by fatehiman (commit 44d2d3876088522785bb2f5d43b54226a6dce555) informed the work and is credited; these patches use per-Activity state and a provider-scoped deferred read bridge instead of copying the broader fork sweep. Physical Samsung/One UI, real carrier MMS, multiwindow OEM behavior and on-device Morphe remain unverified.
