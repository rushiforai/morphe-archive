# Reolink doorbell calls through Telecom

Goal: an actual Reolink doorbell ring appears on Android Auto's call surface; Answer, Reject, Hang up and mute control the native doorbell audio session, without opening a video activity.

The owner approved the Telecom/service approach and asked to follow the Waze and Flitsmeister pattern for adding complete components through an extension and manifest patch. Reuse their private foreground-service ownership and cleanup conventions, not their location permissions or engine lease protocol.

One connected implementation batch:

- Add an opt-in patch guarded against the exact original Reolink input and native ABI. Hook the already accepted FCM doorbell path before foreground/background presentation. Ordinary camera alerts retain native handling.
- Add a private phone-call foreground service and AndroidX Core-Telecom integration. Incoming calls are audio calls with explicit answer/reject/disconnect callbacks. No replacement dialer, external companion app, autoanswer or invented phone number.
- Resolve the native device/channel using the push identity. Reuse native login, talk-open, talk-send, talk-close and receive-audio callbacks. Capture begins only after Answer. Native failure never becomes a fictitious connected call.
- Use communication audio attributes, the native recording format/AEC, and Telecom-owned endpoint selection. Do not compete with Telecom using speakerphone/SCO overrides. Mixed-talk devices use their dedicated audio callback; a legacy preview transport, if required for receive audio, never receives a rendering surface and its video frames are discarded.
- Preserve account/duplicate policy and notification fallback if Telecom cannot accept the call. Teardown removes only owned observers, streams and audio resources. Do not stop an independently opened native stream or global camera session.
- Add original-APK DEX/ABI regression tests and focused lifecycle/audio policy tests using existing test tooling. No validation-framework or fixture expansion.

Grouped checkpoint: canonical complete verification; apply to the supplied complete APKS; inspect extension dependency references and final DEX/manifest. Reuse the passing Firebase registration evidence because the notification registration patch is unchanged.

After a successful batch build, reserve one bounded owned emulator/DHU acceptance session with read-only Frida coverage established before stimuli. Record the deadline and stop all owned runtimes after collection. Any artificial input proves only the controlled path. A real ring plus bidirectional audio through a real car remains a separate physical acceptance gate requiring explicit device authorization.

Do not publish this new app behavior until owner acceptance. The prior Reolink release authorization concerned the already-published push-registration fix.

Owner release decision, 2026-11-16: the owner accepted the current implementation as sufficient and explicitly requested commit/push/release on main. Publish the new call patch as experimental and off by default. The first real-device attempt produced only a phone notification; background Firebase routing, typed visitor handling and notification delegation were corrected afterwards. Do not claim that Android Auto call controls or bidirectional car audio have been confirmed.
