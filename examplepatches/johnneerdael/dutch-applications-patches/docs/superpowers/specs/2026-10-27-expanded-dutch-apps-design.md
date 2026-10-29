# Expanded Dutch application patches

Current user-authorized scope: FTM, AD, Trouw, NRC and Flitsmeister, added to `johnneerdael/dutch-applications-patches` (local repository directory remains `buienalarm-patches`). The original baseline was stable v1.3.0, commit997326c.

**Scope change, 2026-10-28:** The user removed FD and De Telegraaf from all planned research, implementation and acceptance work. Earlier findings are historical records; their unresolved delivery questions are not outstanding requirements and must not restart work unless the user requests it.

**Phone acceptance, 2026-10-28:** After testing v1.6.0-dev.3, the user reported AD and NRC work and approved stable publication. Promote only these two additional apps; Flitsmeister remains on dev with its startup blocker. Trouw and FTM were approved earlier.

## Intent

Apply the same version-restricted Morphe patch quality as the existing six apps. Each news app needs ads, tracking, automatic advertising consent and premium/paywall restrictions removed, with complete received article bodies rendered. Flitsmeister additionally needs Pro promotions removed and all Pro feature access investigated and enabled, including Android Auto.

The user explicitly requested autonomous off-device progress and permits frequent development prereleases. **Do not perform device validation or modify any connected device until the user returns.** No emulator may be created. New work may publish to `dev`; stable promotion of remaining development apps still requires device validation and user approval.

## Verified inputs

All originals are under `../phone-apks/`. Analysis uses APFS clones under `$TMPDIR/re/expanded-APP/input`. Inventory hashes, publisher signing lineages, splits and architecture signals are recorded in the ignored task inventory, not inferred from app names. Source-stamp certificates are excluded from publisher identity.

| App | Package | Version / code | minSDK | Input |
| --- | --- | --- | --- | --- |
| trouw | `be.persgroep.android.news.mobiletr` | 7.53.1 / 23136515 | 32 | APKS |
| ad | `be.persgroep.android.news.mobilead` | 9.22.0 / 9220000 | 32 | APKS |
| nrc | `com.twipemobile.nrc` | 5.12.24 / 626 | 23 | APK |
| ftm | `nl.ftm.ftmpulse` | 2.6.8 / 58 | 32 | APKS |
| flitsmeister | `nl.flitsmeister` | 14.17 / 1287 | 32 | APKS |

Trouw matches Volkskrant's version/code but none of its8 DEX entries are byte-identical, so reuse requires method/resource evidence. AD has a different version/framework and cannot be treated as a Trouw clone. Remaining apps are inventoried as DEX/native Android; narrower architecture details must come from their artifacts.

## Approach

The user already chose Morphe patches in this repository. Continue the Kotlin bytecode/resource model and the established app-specific verifier interfaces. Reuse proven DPG patch logic only where actual signatures, instructions, resource and callback contracts match; do not refactor the released Volkskrant implementation solely to share code. Keep unrelated publishers and Flitsmeister separate.

A network-only blocklist cannot remove local ad space, paywall rendering or Pro gates. Broad SDK/package stubbing risks functional state and asynchronous completion. Those approaches do not meet the requested quality. Use targeted app-owned boundaries and inventoried collector sinks instead.

Controller choices, not extra user requirements: start with Trouw as the likely shortest path to an early reviewed prerelease; investigate the other independent families concurrently; serialize memory-heavy JVM/decode/build work with a1GiB heap cap. Do not run whole-app JADX on large packages when smali or the shipped JS is sufficient.

## Patch interfaces and integration

News app packages live under `patches/src/main/kotlin/patches/{trouw,ad,nrc,ftm}/`. Expose `Hide ads`, `Disable tracking`, `Skip consent screens`, `Hide Premium banner` and `Read full articles` when their complete behavior is implemented and proven. A missing backend body is an open requirement, not a successful paywall fix. Per-app discovery must establish exact method descriptors and safe coroutine/callback values before implementation plans are finalized.

Flitsmeister lives under `patches/flitsmeister/` with ads, tracking, consent, Pro-promotion and Pro-feature controls. Trace Pro/ProPlus gates and Android Auto service/feature paths. Keep functional GPS, warnings, routing, map data and legitimate host validation. Preserve genuine account, transaction and billing state; client feature access must not fabricate a purchase, trial, receipt, paid discount or server credential. If a server/host prerequisite cannot be met locally, record it and keep that part open rather than claiming success.

Each app consumes its observed Compatibility target and the existing `patches.shared.originalInput` preflight. Every named and anonymous mutating dependency must directly depend on that preflight. Missing/ambiguous singleton fingerprints reject through explicit cardinality. Preserve any evidenced multi-match operations with an exact expected count.

Create `tests/verify_APP.py` with `verify(root: Path, selected: set[str]) -> None` and CLI `(decoded_root, repeated -e PATCH)`. Extend `scripts/validate_targets.py` profiles centrally only after names/dependencies are fixed. Existing six app behavior and input guards remain intact.

## Required evidence

- Ads: actual native/feed/detail/video/web loading and reserved-space paths, including explicit commercial content markers; preserve editorial/syndicated content and functioning media.
- Tracking: startup, app/SDK events, IDs, pending queues, re-enable/consent paths, web instrumentation and media telemetry. Trace response/state consumers; a discarded network response does not establish a telemetry-only request. Preserve needed first-party session/cookie/onboarding/auth and notification flows.
- Optional SDK removal: inventory every app-owned consumer and complete required startup/listener objects; do not leave a null SDK dereference such as the prior FIAM defect.
- Asynchronous contracts: use the actual successful/empty/disabled value and complete the existing callback/coroutine. Match actual class/interface/static call kinds, register layouts and generic return values against emitted code.
- Paywalls: trace received body mapping and every blocking/inline replacement. Demonstrate a genuinely premium publication contains the full body and final substantive paragraphs; hiding an overlay or filling missing text is insufficient. Keep raw article payloads, auth values and decompiled code outside Git.
- Web: preserve navigation, login/privacy bridges, asset interceptors, loading/error callbacks, resizing and editorial embeds while filtering evidenced ads/collectors. Prevent a remote code-update path from silently replacing any patched embedded JS if that path exists.
- Flitsmeister: verify actual access gates for all discovered Pro settings, average/current speed, auto start, map/overlay/traffic bar and Android Auto. Remove automatic upsells and Pro badges without deleting the underlying settings. Identify Android Auto host/manifest/service lifecycle prerequisites separately from local tier flags.
- Credentials: use explicit `SHARED_MAPS_API_KEY` or ignored input if a genuine Maps compatibility change is needed. Never validate generated output against itself or print keys. Preserve distinct Firebase and unrelated credentials.

## Publication and acceptance

Use TDD against original/failed emitted artifacts before each production change; build and apply each named control and all controls with actual Desktop FULL validation, signatures and independent decoded checks. Extend actual-SDK preflight regression coverage for each new target. A reviewer checks each independently useful app before a development push. Commit and push completed increments to `dev` frequently; publish only patch bundles, never publisher APKs or private data.

README/app audits must distinguish static prerelease checks from device verification. Device and Android Auto validation remain deferred until the user explicitly returns. Implementation and acceptance status is recorded in the app audits and README. Complete-goal acceptance applies to the current five-app scope; excluded historical investigations do not block it. Intermediate prereleases remain progress until the required behavior and acceptance are verified.
