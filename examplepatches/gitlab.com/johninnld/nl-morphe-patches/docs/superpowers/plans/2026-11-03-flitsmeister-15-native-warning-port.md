# Flitsmeister 15.0 native warnings and background startup

The released v1.36.0 patches already support FM 15.0. The unfinished native-warning integration was explicitly limited to 14.17. Port that integration to 15.0/1289 while preserving the existing FM controls, the Maps/Vela behavior and separately guarded 14.17 support. Diagnose the reported background-start failure when selecting FM in Maps or Vela; phone reboot is outside this report.

Maps and Vela retain trip routing and turn-by-turn guidance. FM supplies native alerts and navigation-related data. Existing-route checks concern delayed point-alert relevance and guidance regression only; FM's average-speed-zone `gpsPath` describes the camera segment, not a trip route or destination.

## Authoritative inputs

| Input | Base APK SHA-256 |
| --- | --- |
| Supplied 1-architecture APKM, minSdk 29 | `09d01a21ae058c9c9a75dcd0714f39ddbd37b63b68259692675f19b1a39a66ea` |
| Supplied 4-architecture APKM, minSdk 32 | `7668b9d93a309520184a01194aa47dde40a05b0e74e96a2237c428ed7a613bf0` |
| Actual installed patched phone APK, copied read-only | `65596fecc77ce74a6e8841f7d3fc089d8541eb2aabfd01713331f63dd9ec4b68` |

All seven original DEX members match between the APKM variants. Their manifests and resource tables differ. Reuse matching original-DEX analysis; validate both input variants through the real patch path. Do not modify the user's downloaded inputs or phone application state.

## Work and acceptance

1. Freeze FM15 native callback, model and enum contracts against the originals. Preserve native eligibility, duplicate suppression, text/language, state updates and removals. The five audited enum families retain all 159 members, but matching names alone do not prove producer coverage.
2. Add a separate guarded FM15 warning-hook profile. Test original DEX transformation and assembly, native-reference preservation, exact existing Unlock Pro compatibility, changed-root refusal before any mutation and second-application refusal. Retain the FM14 regressions.
3. Port the model/capture/runtime probes using artifact-backed FM15 bindings. Exercise actual native model/resource paths in English and Dutch, then all native capture families. Enable the complete event capability only with the corresponding FM15 coverage proof; never substitute an FM14 success record or a test coverage override.
4. Reproduce cold Maps/Vela selection through the actual STARTUP_V1 API, provider-owned PendingIntent and native background service. Test the actual installed release APK in the emulator before changing startup code. Preserve failures and fix only a demonstrated cause.
5. Rebuild the intended FM15 patch combinations through FULL validation. Test the resulting FM15 producer with the current Maps and Vela receivers, including warning payloads, ownership, native speech coordination, state/replay/passage and lifecycle acceptance required by the design. Older moving/receiver records remain tied to their previous FM14 candidates.
6. Complete review, documentation and requested delivery. Native app changes remain separate from local CI automation and require the existing stable-promotion approval. The user closed draft MR !1; preserve its branch without reopening it automatically.

Use only the owned `native_warnings_ui_api34` emulator on 5590 for the coordinated runtime work. Shared 5580/5584 and physical-phone mutation are excluded. Copying the installed APK was read-only. Serialize device work between workers.

Every terminal build or runtime job must archive compact evidence and clean its owned temporary files, helpers, processes and workspace outputs, including failures. Restore exact test-owned preferences, permissions and window/network settings. Preserve current input artifacts and evidence needed by this active port; never clean the primary checkout or another active task.

## Initial checkpoint

- Original artifact identities, all seven identical DEX members and all five unchanged enum inventories verified.
- FM15 callback mapping and whole-method fingerprints recorded privately under `.analysis/native-warning-bindings/fm15-port/`.
- Static examination of the actual installed APK found the expected startup/control/engine hooks; a runtime failure has not yet been reproduced.
- FM15 hook implementation, runtime producer proof, background-start acceptance and final integrated acceptance remain open.
