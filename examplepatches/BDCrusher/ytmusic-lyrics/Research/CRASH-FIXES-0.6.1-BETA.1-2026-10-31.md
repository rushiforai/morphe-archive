# Library/Search and teardown crashes - 0.6.1-beta.1

The user supplied nine crash reports and then explicitly requested fixes. All show original-target Music9.43.51/94351240, patched package app.morphe.android.apps.youtube.music on Samsung SM-S948U, Android17/API37. Seven are0.6.0-beta.1 native row VerifyError crashes; two are0.5.0-beta.1 activity-destroy/null-child crashes. Private originals and SHA256 receipts remain in Inputs/crashes-2026-10-31 and Verification/revision39/crash-inputs.json. Raw logs, install paths, listening data and vendor APKs are not distributed.

## Library and Search

PlaylistPatch generated native row-owner adapters inside both scoped native presenters. The row binding methods are private final (access flags0x12). The adapters used invoke-virtual/range, making ART reject the entire presenter class when list rendering loads it. That explains Library/Search failure even when the user is not using playlist downloads. It was a personal patch defect, not evidence of a provider failure or heap exhaustion.

On exact9.43 native classes jcq/jcr, the original private methods are p(adln,anyv,int) and q(adln,anyv,int). These obfuscated names are diagnostic evidence only; production matching remains scoped by the native schema/signatures. The patch now selects invoke-direct/range for private targets and preserves invoke-virtual/range for non-private targets. The view-getter bridge follows the same rule. Native access flags are preserved; no broad visibility widening or exception suppression is used.

The new AuditInvokeAccess checks owned methods AND injected bd-prefixed native bridge hosts, resolves application method declarations, and validates private/constructor/static/instance invocation rules. The old audit checked reference presence and bridge existence but omitted this access rule. A regression runs against the unchanged old compiled APK and must reject BOTH bad presenters. Both corrected exact targets must pass, followed by the full compiled feature/reference audit. This is a structural invocation audit, not a full ART type/dataflow verifier.

Primary reference: [Android bytecode invocation rules](https://source.android.com/docs/core/runtime/dalvik-bytecode).

## Activity teardown

The older crashes show a null child inside ViewGroup.dispatchDetachedFromWindow while destroying MusicActivity. ShaderRuntime closed a binding synchronously inside an anchor detach callback, removing the effect sibling from its parent. The framework traversal keeps a child count/array while dispatching detach; removing a later sibling can shift entries and leave a null slot for the pending iteration. The exact0.5 and0.6 source snapshots reproduce this failure in the same deterministic Android-style cached-array traversal fixture. The corrected actual ShaderRuntime.Binding passes that fixture.

A common ViewDisposal now hides a retired view immediately, then removes/releases it using an independent main-thread Handler after the current traversal. It has weak, terminal, idempotent ownership. It does not use View.post on a detached view or a component handler whose callbacks get canceled on detach. Shader bindings unregister callbacks immediately; animated media releases immediately; shader/browser child removal and WebView destruction occur after traversal. Lyrics detach/render-process cleanup and source-verification WebView disposal use the same helper. Native host hierarchy changes outside detach continue through their existing posted tasks.

Tests cover both background and animated-cover binding removal, native sibling order, exactly-once detach, duplicate closure, browser detach-before-destroy, nested ancestor traversal and rapid replacement. A queued old cleanup cannot remove a newly created replacement surface. Media, WebView and Android framework boundaries are simulated. Compiled audits additionally require deferred-disposal calls and forbid synchronous removeView/destroy in the selected cleanup methods.

The modeled traversal is based on [AOSP ViewGroup](https://android.googlesource.com/platform/frameworks/base/+/a175a5b/core/java/android/view/ViewGroup.java); the supplied Samsung stack and exact previous patch-source tests supply the task-specific evidence. This reference is not claimed to be the exact Samsung17 framework build. Recording-free real-phone teardown acceptance remains required.

## Delivery and unchanged behavior

Version0.6.1-beta.1 uses the existing Full Collection and optional Shaders/Download playlist patches. Exact original arm64 targets9.42.52/94252240 and9.43.51/94351240 remain; Jam stays9.42-only. Preferences, source credentials, selected external folder, permanent lyrics and playlist indexes remain unchanged. Offline playback still uses the separate offline service; native-main-player/Lyrics integration remains unestablished. No new playback, source, shader effect or downloader behavior is advertised by this crash correction.

The existing Enable debug logging/Export debug logs workflow remains. There is no timed capture or separate logger. Web renderer/parser/highlight/scroll sources are unchanged, so earlier browser evidence is inherited only after their hashes match. The same applies to retained source/transport/library tests. Fresh tests target disposal and access legality. Exact counts, old-failure rejections, source hashes, compiled APK combinations and checksums are in dist/0.6.1-beta.1/verification.json after staging.

All writes, scratch and evidence remain inside YT-Music; shared Toolkit tools run in place. No emulator/MuMu/device, signing, installation/uninstallation or real playlist download operations. Do not equate compiled/simulated checks with phone acceptance or universal zero stutter. The older release artifacts, failed evidence and public history are retained unchanged. Publication is complete only when the new Toolkit publication receipt exists.
