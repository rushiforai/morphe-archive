# Compatibility and evidence

Checked 2026-10-26 (Asia/Shanghai). Public release remains **1.5.7 / release-1.5.7**. The accepted local product is **1.5.8 / local-1.5.8-m7b / candidate-02**, following [M7b review](maintenance/reviews/M7b-REVIEW.md). Local code, source qualification and the two finite compositions are accepted. On 2026-10-26 user-reported manual device acceptance plus a matching m7b runtime export completed the [first engineering maturity round](maintenance/reviews/M7-FINAL-ACCEPTANCE.md) within its stated limits. Previous m6a and candidate-01 deliveries remain historical. See [M7b result](maintenance/results/M7b-RESULT.md), [device handoff](maintenance/M7b-DEVICE-ACCEPTANCE.md) and [current state](PROJECT-STATE.md).

## Declarations and their sources

The current addon root uses `Constants.YOUTUBE` in `patches/src/main/kotlin/app/yydarlinker/patches/shared/Constants.kt`. Public 1.5.7 `patches-list.json` has the same six targets. The existing official MPP manifest identifies **Morphe Patches 1.48.0 / Patcher 2.0.0**; M7b loaded its actual default-root compatibility metadata and checked the corresponding rows below. Official declarations describe that bundle; they do not certify this addon's device behavior. No dependency or target declaration changed.

| Exact YouTube target | Addon/public 1.5.7 declaration | Matching official 1.48.0 declaration | Minimum Android | M7b evidence |
| --- | --- | --- | --- | --- |
| 21.42.241 | experimental | experimental | 10 / API 29 | no original APK present; no current composition/device evidence |
| 21.41.525 | experimental | experimental | 10 / API 29 | exact SECONDARY variant, primary composition; device pending |
| 21.28.208 | experimental | experimental | 10 / API 29 | one supplementary composition; device pending |
| 21.23.492 | experimental | experimental | 9 / API 28 | existing input not selected in M7b; historical structural evidence only |
| 21.20.405 | stable target declaration | stable target declaration | 9 / API 28 | user reports current phone version; manual checklist reported issue-free, m7b export received; no desktop composition receipt or independent host-version readback |
| 21.16.256 | stable target declaration | stable target declaration | 9 / API 28 | original APK absent; no current candidate composition/device evidence |

This is a discrete list, not a continuous 21.x range. The official bundle also contains 20.x metadata; this addon does **not** declare 20.x. “Stable” and the old recommendation of 21.20.405 come from target metadata, not current candidate device certification. The local manifest and loaded-target dump, public metadata copies, source declarations, signer checks and hashes are preserved in `validation/runs/20261025-M7b-01/inputs.json`, `official-local-metadata.json` and `official-loaded-targets.log`. Original download provenance and the Maven publication commit remain unverified; no proprietary APK was downloaded for M7b.

## Current evidence layers

| Layer | Exact scope | Meaning and limitation |
| --- | --- | --- |
| Candidate identity | addon 1.5.8 / local-1.5.8-m7b / candidate-02; public remains 1.5.7 | diagnostics source metadata changed; accepted m6a and historical packages retained; local delivery and bounded user device observation accepted; no independent installed-APK hash attestation |
| Primary actual composition | YouTube **21.41.525-SECONDARY**, versionCode **1561303419**, official **1.48.0**, Patcher **2.0.0**, **104 compatible official default roots + AI caption translator** | real patching, resources recompiled, serialized DEX audited; unsigned output; no device claim |
| Supplementary actual composition | YouTube **21.28.208**, versionCode **1561185128**, same official/Patcher, compatible default roots + AI | one representative older player callback layout; separate input/output/selection/receipt and resource/DEX evidence; no matrix claim |
| APK input identity | both `com.google.android.youtube`, minSdk **29**, native ABIs **arm64-v8a, armeabi-v7a, x86, x86_64** | apksigner verifies the existing signed inputs, including SDK-specific signer rotation; certificate SHA-256 matches both existing Constants signatures; actual defined DEX classes contain no addon/official-extension namespace. A filename is not this proof |
| Fixtures / JVM | core and extension suites, real diagnostic writer/archive/report/export and existing native CC/language/session/cache/configuration protections | controlled Android layouts, provider fixtures and JVM mechanisms do not certify a physical player, OEM, paid model or hardware latency |
| Device observation | user reports manual checklist issue-free on Manager 2.2.0 / YouTube 21.20.405 / official 1.48.0; supplied export manifest and first draw hook both identify local-1.5.8-m7b | host/official versions are user-reported; model/Android/ABI/package versionCode/signature/installed APK SHA and full root selection were not independently read; no third desktop composition claimed |
| User real-provider sample | supplied export records 13 HTTP attempts and 13 status-200 responses, 0 header failures; source_passthrough sessions 1 and 15 have no recorded model HTTP begin | user-initiated sample only; quality advisories remain; no provider-account, billing or complete semantic-quality certification, and no permission for future agent calls |

Exact SHA-256, per-combination selection, output APK, class audit and package delta appear in [M7b result](maintenance/results/M7b-RESULT.md) and its evidence files. These local APKs are unsigned preparation artifacts, not public release assets. Other official-root selections, providers, OEMs and languages are outside this finite composition scope. Do not combine another addon with the same runtime namespace or overlapping caption behavior.

## Diagnostic provenance

The export retains the legacy `official` field but now uses `official=unknown; official_source=runtime_unverified`. `patcher=unknown` has the same runtime qualification. `build_expected_official=1.48.0` and `build_expected_patcher=2.0.0` are build expectations only; `composition=unverified` means the running addon cannot verify the offline composition receipt. Even a locally verified APK reports these runtime unknowns. `ui/engine/build` identify the addon; `core` plus pinned `core_source`, `core_adaptation=local` and `core_provenance` identify the upstream core and local adaptation record. None identifies the host YouTube version.

Old exports with unqualified `official=1.45.0` used a static historical marker, not measured runtime provenance. Old logs and accounting are retained literally. Parsers must accept `unknown` and missing new fields; missing data from older logs is unverified. Presentation revision fields describe internal presentation code, not a package/compatibility certificate. The [diagnostic contract](architecture/DIAGNOSTICS-PERFORMANCE-CONTRACT.md) records the old→new mapping and actual red/green evidence. No new UI strings/switches or runtime/network version probes were added.

## Historical evidence and retained limits

N37R2 / 1.4.x used official 1.45.0 with YouTube 21.16.256. Release 1.5.0 composed official 1.47.0 with 21.20.405. Release 1.5.3 used **1.48.0-dev.6** on six older APKs; those development-bundle combinations remain historical. Release 1.5.6 composed stable 1.48.0 with 21.41.525 and had structural checks on 21.28.208/21.23.492. Accepted M6a composed 21.41.525-SECONDARY; M7a referenced that run only after proving identical production entries. These records do not substitute for M7b composition or device observations.

The quick-toggle register change addresses the inspected flyout register hazard; the current user report provides a finite successful 21.20.405 observation, not an instrumented reproduction of the old VerifyError or proof for every toggle sequence. Missing/ambiguous bindings stop patching. N37R2's controlled centering error (up to 0.5 px) is a fixture result, not an OEM measurement. Native CC/language ownership remains with YouTube and the official Captions patch. Startup main-thread configuration reads, hardware Keystore/IO tails, frame time/memory/power, arbitrary thread interleavings, fourteen-language native fluency, remote CI, cold provisioning/online registry authentication and real provider billing remain unverified. See the current contracts for the retained cache/configuration limits.
