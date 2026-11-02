# RainViewer integrity compatibility investigation

Goal: trace certificate/installer/attestation acquisition, local decisions, serialized requests and publisher acceptance; implement the demonstrated app-side compatibility fix and verify actual data access on the supplied rooted emulator.

- [x] Read the supplied tracing notes and inspect current original/installed artifact identity.
- [x] Identify app-owned Standard Play Integrity Raindrop flow and separate Firebase certificate metadata.
- [x] Locate code81 -> ez5 -> blocked state -> App Blocked UI.
- [x] Capture exact failing endpoint, SDK token outcome and certificate headers without recording credentials/tokens.
- [x] Add a constrained original-certificate metadata patch with an emitted-DEX behavioral verifier.
- [x] Compare baseline, re-signed control and fixed builds on emulator-5554, preserving app data and recording data responses.
- [x] Trace remaining rejections; retain actual server response enforcement and distinguish successful paths from failed ones.
- [x] Add opt-in local Pro while preserving Free request models; verify actual unpaid purchase response and rendered radar products.
- [x] Test AI endpoint on Free: code210, no summary. Hide AI UI/dispatch as requested.
- [x] Inspect map-warning error/code81; add separately selectable control/fetch suppression, retaining forecast warnings.
- [x] Remove unavailable Settings Manage/subscription-details action while preserving local plan badge.
- [x] Build, validate all selected combinations, review and save the signed development bundle plus detailed findings in Downloads.
- [x] Promoted through PR #9 to main after user approval. Stable v1.24.0 published; release workflow, signed artifact and Morphe discovery verified. English/Dutch guides include the supplied download link.

Known boundaries: original RainViewer 8.4.1/44084 signer SHA256 is pinned. Current emulator APK is signed by the local Android debug key. Firebase rejects it with API_KEY_ANDROID_APP_BLOCKED. The app uses Standard Play Integrity, not identified local SafetyNet basicIntegrity/ctsProfileMatch booleans. A forged local flag is not a genuine Google token.
