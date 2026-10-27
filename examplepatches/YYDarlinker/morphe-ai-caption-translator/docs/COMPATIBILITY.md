# Compatibility and evidence

Checked 2026-10-26 (Asia/Shanghai). Public release **1.5.8 / release-1.5.8**, tag`83a8b72a795285234f6c164991f65007750e6272`, asset SHA-256`5c9dfb19a3b0b88f55516bfca38bf47ee18ed3f282511b6b6401c37e8c5db686`. The [release record](maintenance/results/RELEASE-1.5.8-RESULT.md) binds actual 876-test CI, published bytes and fresh finite compositions. The earlier [M7b review](maintenance/reviews/M7b-REVIEW.md) and user observations retain their original scope; no full device matrix or new runtime provenance probe is claimed.

## Declarations and their sources

The current addon root uses `Constants.YOUTUBE` in `patches/src/main/kotlin/app/yydarlinker/patches/shared/Constants.kt`. Public 1.5.7 `patches-list.json` has the same six targets. The existing official MPP manifest identifies **Morphe Patches 1.48.0 / Patcher 2.0.0**; M7b loaded its actual default-root compatibility metadata and checked the corresponding rows below. Official declarations describe that bundle; they do not certify this addon's device behavior. No dependency or target declaration changed.

| Exact YouTube target | Addon/public 1.5.7 declaration | Matching official 1.48.0 declaration | Minimum Android | M7b evidence |
| --- | --- | --- | --- | --- |
| 21.42.241 | experimental | experimental | 10 / API 29 | no original APK present; no current composition/device evidence |
| 21.41.525 | experimental | experimental |10 / API29| exact SECONDARY variant; fresh published 1.5.8 composition/resource/DEX audit,64581 classes; no device claim for this variant |
| 21.28.208 | experimental | experimental |10 / API29| fresh published 1.5.8 supplementary composition/resource/DEX audit,62253 classes; no device claim for this variant |
| 21.23.492 | experimental | experimental | 9 / API 28 | existing input not selected in M7b; historical structural evidence only |
| 21.20.405 | stable target declaration | stable target declaration | 9 / API 28 | user reports current phone version; manual checklist reported issue-free, m7b export received; no desktop composition receipt or independent host-version readback |
| 21.16.256 | stable target declaration | stable target declaration | 9 / API 28 | original APK absent; no current candidate composition/device evidence |

This is a discrete list, not a continuous 21.x range. The official bundle also contains 20.x metadata; this addon does **not** declare 20.x. “Stable” and the old recommendation of 21.20.405 come from target metadata, not current candidate device certification. The local manifest and loaded-target dump, public metadata copies, source declarations, signer checks and hashes are preserved in `validation/runs/20261025-M7b-01/inputs.json`, `official-local-metadata.json` and `official-loaded-targets.log`. Original download provenance and the Maven publication commit remain unverified; no proprietary APK was downloaded for M7b.

## Current evidence layers

| Layer | Exact scope | Meaning and limitation |
| --- | --- | --- |
| Released identity |1.5.8 / release-1.5.8, tag v1.5.8;600263 B; SHA-256`5c9dfb19a3b0b88f55516bfca38bf47ee18ed3f282511b6b6401c37e8c5db686`| strict remote release prepare, final asset and anonymous main/dev chain verified; accepted local/historical deliveries retained |
| Primary actual composition | YouTube21.41.525-SECONDARY/code1561303419, official 1.48.0/Patcher 2.0.0/104 compatible default roots+AI, addon from the published download | resources recompiled, DEX audited,64581 unique classes; unsigned output not distributed or device-installed |
| Supplementary actual composition | YouTube21.28.208/code1561185128, same official/Patcher and published addon | separate fresh resource/DEX proof,62253 unique classes; unsigned, not a matrix claim |
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

## Release-era CI scope

The1.5.8 publisher completed a real Linux dry run, strict prepare and876 application tests, then verified anonymous source retrieval and build provenance. The later workflow-only Java Action 6.1.0 update also passed 876 tests and the main no-publication path. These are now covered; the older M7a cached-Windows rehearsal remains historical and does not become universal fresh-machine/empty-SDK certification. Published 1.5.8 was not newly signed/installed on the user's phone; the retained m7b user sample and identical production inputs are stated separately.
