# Flitsmeister 15.0 port validation

This source change supports 15.0/1289 alongside 14.17/1287. Both inspected 15
publisher split archives are accepted: min-SDK29 ARM64 and min-SDK32 four-ABI.
The native restoration profile is ARM64. The main release remains unpublished
until the required publisher identity and release gates succeed.

## Inputs and native provenance

- SDK32 APKM SHA256: `407507012a279bd96fb250f89809fc1db0e7996a2fec9a9301ce2c3234ca34c7`.
- SDK29 APKM SHA256: `c44572f8a575449e53512226d5866813c85ec254679c5a07110cf941e2ba3498`.
- Publisher certificate SHA256: `ba4fdde5ed7d1082f6ba1af87df2ca39c81b094af20d36ff55b583aa3e3353e6`.
- Protected ARM64 MapLibre SHA256: `a16f4ce832821685d0e68196e7981f513659885b173ccfe8bcb4c895725f64f3`.
- Exact upstream 13.6.1 stock SHA256: `1e154a4640e4078f4fde31649771d93d4e5fee6f731f608d565d3b3f755ca8f9`.
- Source AAR: [MapLibre Android13.6.1](https://repo.maven.apache.org/maven2/org/maplibre/gl/android-sdk/13.6.1/android-sdk-13.6.1.aar), SHA256 `3863ef506991b590270e1418129a44b98d73da31251c011dc440ea6121fb01aa`.

The upstream library has the same GNU build ID and all 9,751 exported native
definitions match name, address and size. Original read-only, exception/unwind,
PLT, GOT and initialization-array data match. Protected import initialization was
the source of the re-signed build's map-loader native fault.

## Functional and presentation scope

All 20 functional wrappers using literal PairIP programs have genuine restored
bodies. The two other incoming calls are protector dispatchers. The profile
retains 32 captured string holders with 1,421 exact values, exception tables,
monitor cleanup, switch payloads, typed service results and genuine account
and billing boundaries. The Crashlytics String identifier Runnable is retained
when tracking is permitted and bypassed only by Disable tracking.

The original eight controls are retained, along with latest-main Support
Gearslip and DriveDeck and managed navigation startup/audio. User-requested15
presentation changes hide unowned paid soundpack offers and show the native
PRO artwork on the local menu avatar. Sound selection, genuine ownership,
downloads, billing and remote account tier remain intact.

## Evidence and regression coverage

- Physical Android16 ARM64 phone: map opens; HUD opens/closes; changing app icon
  and reopening works; user confirmed PRO menu badge and removed paid offers.
- The icon regression was an incorrect same-typed preference binding at the
  launcher Long reader. Exact stored keys/default types are now checked for
  six launcher and five main-screen preference sites.
- Main Integer layout height and Boolean ETA-error flows are checked against
  their actual constructor seeds/aliases and producer/consumer behavior.
- Complete source/native callbacks are independently checked against publisher
  synthetic delegates, native member records and provider factories.
- Final emitted combined nine-control candidate passes all 20 complete callback
  bodies, 1,421 holder values, native identities, seven leaf cohorts, 18 managed
  audio bodies, host admission/fallback, full manifest and startup security.
- The audio-focus oracle caught an unmuted self-loop introduced by later
  prepending. Both versions now branch to a method-owned continuation. Two
  production-builder regressions execute both mute states and a further prepend.
- SDK hierarchy comparison retains the same 69 diagnostics as the unmodified
  publisher: no added or removed issues. This is baseline equivalence, not a
  claim that the SDK verifier reports a clean pass.

All three package matrices passed: nine individual selections and one combined
selection for15 SDK29,15 SDK32 and14.17, plus each unmodified baseline. Each
matrix verified patch reports, signing and decoded effects and exited with0.
Logs and immutable candidate hashes are retained locally under the ignored
analysis directory. Publication status must be read
from the actual release/CI state; local build and phone acceptance alone do not
establish a published bundle or a physical Android Auto host result.

## Runtime boundaries

The phone tests used the plain debug-signed app. A temporary Frida Gadget build
attached inside the app UID, but Java instrumentation on that phone produced
native GC faults and was removed; it is not in the release bundle. Background
navigation IPC, physical head-unit host admission and backend-dependent services
must be reported separately from the bounded static and phone checks above.
