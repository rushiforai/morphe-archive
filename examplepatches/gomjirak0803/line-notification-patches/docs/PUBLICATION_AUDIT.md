# Pre-Publication Audit — 2026-11-17

Post-publication note: `v0.1.8-dev` through `v0.1.11-dev` have since been published on [gomjirak0803/line-notification-patches](https://github.com/gomjirak0803/line-notification-patches/releases) via GitHub Actions with verified remote downloads, 6-patch loading, and Morphe Manager `2.6.0` remote updates. The "Remaining items before publication" table below reflects the pre-publication audit snapshot on 2026-11-17; for current release status and verification scope, see [PUBLICATION_STATUS.md](PUBLICATION_STATUS.md) and [DEVICE_TESTS.md](DEVICE_TESTS.md).

Subsequent releases (`0.1.8-dev`–`0.1.11-dev`) added timestamp-ordered SQL selection, a trailing 400ms active-notification refresh on a background worker, chat-list long-press quiet-mode support, Android 15/16 edge-to-edge settings insets, preview exception isolation, and local-cache-only (`onlyRetrieveFromCache(true)`) sender avatars without introducing new external servers, database writes, permissions, or third-party implementations. The PC test sender (`scripts/line_test_sender.py`) is a standalone developer tool excluded from `.mpp`.

This audit reviewed the device-tested `0.1.7-dev` patch bundle and repository sources. Within the inspected scope, **no unattributed third-party code redistribution was found.** Public GPL-3.0 code is reused and modified with explicit attribution; this project must not be described as written entirely from scratch. GPL compliance and LINE's Terms of Service / copyright are separate matters. This audit is not a global plagiarism search, legal certification, or account-safety guarantee.

## Provenance review

| Component | Verified provenance & assessment |
| --- | --- |
| Project scaffold & release tooling | Official Morphe patches template (`1c818c1cc78bacf57051cdad487d32d6d464dfeb`). GPL-3.0 `LICENSE` and `NOTICE` retained; original copyright header in `util/PatchListGenerator.kt` preserved. |
| Settings row injection, fingerprints, push repair | Compared directly against Andrew Liang's `55d6a600f33b286a403b077daaf570c87da56dc7`. Confirmed adapted reuse; attribution headers retained in all four Kotlin files. |
| Shared extension helper & click binding | Adapted from Andrew Liang's `LineSettings.kt` and `LineSettingsClick.java`; root provenance notice in `THIRD_PARTY_NOTICES.md` expanded accordingly rather than treating renamed packages as original code. |
| Notification settings state & UI | Separate implementation using notification-only state and LINE's native UI views, with Andrew Liang's settings integration cited as reference. |
| Notification metadata & local DB schema | Researched using Knot (`d28174ea1414762c14df170c49138fa10d4b498b`). No normalized 8-line matching code block was found between current Java/Kotlin sources and Knot; GPL reference attribution retained. |
| Android `MessagingStyle` behavior | Local inspection of KakaoTalk `26.9.2` API behavior only. Uses public Android `Notification.MessagingStyle`; zero KakaoTalk classes, images, or resources are included. |
| LINE UI & native read/avatar bindings | References LINE class/method/resource identifiers dynamically against the user's own app at patch/runtime. The gear vector path is read from the user's APK at patch time rather than shipped as an asset. |

All 13 relevant files plus `LICENSE`/`NOTICE` from Andrew Liang's pinned commit were compared directly. No copyright notices or additional terms were stripped. Detailed notices live in [THIRD_PARTY_NOTICES.md](../THIRD_PARTY_NOTICES.md).

Under GPL-3.0, distributing the `.mpp` requires retaining `LICENSE`, `NOTICE`, attribution/modification notices, and providing the matching modified source code and build instructions. References to "Morphe" are used descriptively for compatibility only, never implying official Morphe authorship. See [GPL FAQ](https://www.gnu.org/licenses/gpl-faq.en.html#DistributeExtendedBinary) and [template NOTICE](https://github.com/MorpheApp/morphe-patches-template/blob/1c818c1cc78bacf57051cdad487d32d6d464dfeb/NOTICE).

## Bundle & behavior checks

Audited `0.1.7-dev` `.mpp` SHA-256: `05c554e947578065fe365f0f6e82e37d025303f5920603a79a841df83e2c5b3d`.

* **Classes & assets**: All defined classes in the patch and extension DEX files reside under `app.linenotifications`. Contains `LICENSE`, `NOTICE`, and `THIRD_PARTY_NOTICES.md`. Contains no APKs/APKMs, photos, native `.so` libraries, or LINE/KakaoTalk/Knot/Xposed implementation classes.
* **Secret scan**: Scanned repository candidates for private keys, GitHub/OpenAI/AWS tokens, LINE account/chat IDs, and local signing passwords — zero matches found (pattern scan, not a formal proof of absence).
* **Exclusions**: `/apk/`, `/.tools/`, `/artifacts/`, `**/build/`, `/HANDOFF.md`, and key files are gitignored. `prepare_release.py` builds the source ZIP with strict path, extension, and secret-pattern guards.
* **Manifest & network**: Extension manifest is `<manifest/>` (no new permissions or components). Uses LINE's existing non-exported (`exported=false`) notification service and room/account-scoped `FLAG_IMMUTABLE` `PendingIntent`s. No external collection server, upload, or dynamic code loading exists.
* **Database & native calls**: SQLite queries use `OPEN_READONLY` and Glide avatar lookups use `onlyRetrieveFromCache(true)`. Explicit user actions (Mark as read, room notification toggles) invoke LINE's native objects, which perform LINE's normal network sync—this must not be described as strictly offline.
* **Build dependencies**: `scripts/bootstrap.py` pins exact versions and SHA-256 digests for all 4 public tool downloads. Template CI actions and npm lockfiles were not independently supply-chain certified.

## Remaining items before publication (historical 2026-11-17 snapshot)

| Item | Snapshot status (resolved in subsequent releases unless noted) |
| --- | --- |
| Public repository | Resolved: published at `gomjirak0803/line-notification-patches`. |
| Remote bundle metadata | Resolved: `patches-bundle.json` and `patches-list.json` generated and verified on Morphe Manager `2.6.0`. |
| Release automation | Resolved: `.github/workflows/release.yml` builds and publishes via standalone Python pipeline. |
| Author & contact metadata | Resolved: `patches/build.gradle.kts` points to `gomjirak0803/line-notification-patches`. |
| Publisher `.mpp` signature | Still unconfigured (`signature_download_url: ""`); SHA-256 provides integrity comparison only. |
| Target verification | Entry check pins `jp.naver.line.android` / `26.16.0` / `261600106` plus structural bytecode/resource contracts. |
| Cross-device testing | Expanded on 2026-11-20 with Android 16 emulator + Galaxy S22 Ultra (One UI 8.0) diagnostic verification; real-account testing remains on Galaxy S10e (Android 12). |
| Trademarks & app binaries | Official LINE/KakaoTalk/Morphe endorsement disclaimed; only patches and source are distributed. |

## Terms of Service & account risk

GPL permission for open-source patch code is distinct from LY Corporation's Terms of Service, which restrict unauthorized modification/reverse engineering and permit service or account restrictions. Technical testing cannot establish legal permissibility or guarantee immunity from enforcement. See [LINE Terms of Use](https://terms.line.me/line_terms?lang=en).

In particular, **Restore push registration** replaces the `X-Android-Cert` header sent to Firebase Installations with LINE's original certificate SHA-1. While it does not forge APK signatures or bundle private keys, it alters an identifier reported to Google's servers and must be disclosed separately from local UI/notification changes. It remains optional and disabled by default, with no guarantee of account safety.

Combining GPL-licensed extension code with a proprietary app may also raise licensing questions; this audit does not certify the legality of that combination. Distribute only the patch bundle and its matching source code, never original or patched LINE APKs.
