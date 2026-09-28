# Jam patch maintenance

JamPatch wires dependencies, resources and preferences. Fingerprints identify semantic
entry points through diagnostics, Android calls and native view resources. JamAbi
and JamUiAbi validate relationships and reject missing or ambiguous required targets.
Installers emit native access and interception bridges; queue policy, transport,
clock state and UI behavior belong in extension Java.

Host playback uses MediaController.TransportControls.skipToQueueItem with the native
persistent item ID, then confirms the selected ID and playing state. Queue mutation
notifications are not playback operations. Metadata and native palette restoration
run through the extension's UI-thread refresh paths.

Compatibility is restricted to the exact allowlist shared by the bytecode/resource
guards and patch metadata. Additional versions require unique fingerprint resolution,
ABI validation, patch application, SDK DEX verification, APK construction and device
acceptance before promotion from experimental support. See
[experimental versions](experimental-versions.md) for commands and evidence.

JamPatchRegressionTest exercises actual APK resolution, including missing and
ambiguous constructor fixtures and ambiguous dispatcher fields. The validateJam
harness applies the selected patches and verifies DEX before assembling an APK.
Pass -PjamApk and -PjamOutput; a build without a supplied APK skips the APK fixtures.
Build success does not establish device acceptance.

The Binder bridge advertises additive protocol version 1 and capabilities
queue-revisions, stable-item-ids and stale-edit-rejection. Missing envelopes retain
original v1 compatibility; malformed envelopes and unsupported requirements fail.
Pairing binds package names to a locally generated capability token; Companion forks
may use their own signing keys. Network framing is unchanged.
