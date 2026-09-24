# Jam patch boundary

`JamPatch.kt` wires dependencies, resources and preferences. `Fingerprints.kt`
contains semantic entry points: queue diagnostics, platform calls, and native
view resource names. `JamAbi.kt` and `JamUiAbi.kt` resolve native relationships
from those matches. They must fail on missing or ambiguous targets; do not add
obfuscated class/method names or select an arbitrary candidate to make a version
patch successfully.

The installers add casts, field accessors, native calls and interception points.
`JamBridge.kt` contains their shared method emitter. Use the project's
`BytecodeUtils` instruction matching and reverse-index helpers for insertion;
keep queue policy and UI behavior in `extensions/music/.../jam`.

In particular:

- Host playback uses `MediaController.TransportControls.skipToQueueItem` with
  the native persistent item ID. The queue mutation notifier is **not** a play
  operation. Never substitute an enqueue endpoint on playback failure.
- `JamClock.playHost` confirms the selected ID and playing state off the native
  queue executor. Paused selection is resumed only once the requested ID is active.
- Player metadata is handled by `JamMetadata`, which overrides the actual
  full-player and mini-player `setText` calls. The presenter is found through
  `player_page`, `mini_player_title` and `mini_player_subtitle` resources. All
  caching, text selection and restoration run in Java on the UI thread; no
  timer races or custom text-register dataflow analysis are needed.
- Queue lane selection, bounds checking and reorder predecessor calculation
  are extension interface defaults. Smali only exposes native primitives.

The native ABI resolver is still substantial because Jam mirrors YTM's native
observable queue, item models, gestures and player components. Removing literal
obfuscation names does not prove compatibility with uninspected versions. The
patch remains opt-in and limited to 9.15.51 until additional APKs and user testing
provide evidence for broader support.


## Compatibility and release gates

The supported target remains **YT Music 9.15.51 ARM64**. The supplied 9.34.52,
9.35.54 and 9.36.50 APKs are candidates, not supported targets. Their initial
full-patch attempts rejected an ambiguous native menu dispatcher field. This is
a compatibility failure, not permission to choose the first field.

Discovery follows `APK -> Fingerprint -> JamQueueAbi/JamUiAbi -> validation ->
installation`. Dynamic fingerprints may consume earlier resolved types. Android
calls, diagnostics, resources, `methodCall` and `fieldAccess` relationships take
precedence over implementation names. Clock model construction and inaccessible
native operations remain bridges; clock defaults, drag policy, metadata fallback
and queue decisions live in extension Java. No obfuscated version branches are
permitted. More than one valid semantic candidate must fail, including within an
alternative resolver; an unrelated candidate with no capability may be discarded.

`JamPatchRegressionTest` uses the real patch and supplied APK, including negative
fixtures with missing and duplicate required constructors. `validateJam` requires
an Android SDK and uses `SdkDexVerifier` before constructing the output APK.
A normal Gradle build alone is not release evidence. Run it with `-PjamApk` and
`-PjamOutput`; omitting the APK skips fixture tests and cannot satisfy release gates.

Every additional advertised version needs unique resolution, ABI validation,
full patch application, SDK bytecode verification, APK construction, installation
and the same two-device smoke matrix as the baseline. Keep `compatibleWith`
restricted until all these pass for that exact version.

The local Binder bridge advertises additive protocol version 1 and capabilities
`queue-revisions`, `stable-item-ids` and `stale-edit-rejection`. Missing envelopes
are treated as the original v1 bridge; malformed envelopes, unsupported required
versions and missing capabilities are rejected. Network framing is unchanged.
Pairing binds the selected package names to a locally generated capability token.
Companion forks may use their own signing keys without modifying the patch.

Publish only after baseline device results and exact Companion interoperability
pass. Then test the published prerelease through a clean Morphe Manager setup,
including source metadata, patch discovery, dependency resolution, APK building,
installation, two-device pairing and reconnect. Local artifacts do not satisfy
that consumer gate. Keep the upstream PR draft and its review threads unresolved
until the coordinated evidence supports the responses.

Device testing is performed manually by the user for this release. Never infer a
pass from installation or a build. Remote transport controls, bulk/playlist/offline
enqueue, exhaustive Doze/network stress, separate radio-loss failover and physical
camera validation remain documented limitations.
