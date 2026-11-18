# Unofficial app-local WireGuard patches for Morphe

**Independent, experimental build. Not affiliated with MorpheApp or Proton.**
The [v2.2.0 release](https://github.com/seo-rii/morphe-wireguard-patches/releases/tag/v2.2.0)
provides app-local WireGuard proxy patches for YouTube and YouTube Music,
updated to the official Morphe Patches v2.2.0 stable base and its other patches.

**Known v2.2.0 selection issue:** YouTube 21.30.216 and 21.45.82 fail full-default
Desktop validation in `Feed card layout` (`EngagementPanelControllerFingerprint`).
The exact official v2.2.0 bundle reproduces the same 21.30.216 failure with the
same verified input. WireGuard-focused patching passes. The release retains the
official patch/default metadata; this limitation is not hidden by removing a patch.
Explicitly deselect `Feed card layout` when patching these YouTube versions.
The tested selection details are recorded below.

## Add this source in Morphe

Open [Add this patch source](https://morphe.software/add-source?github=seo-rii/morphe-wireguard-patches)
on Android, or navigate to **Morphe → Sources → + → Remote** and enter:

`https://github.com/seo-rii/morphe-wireguard-patches`

This is a standard GitHub release; the WireGuard feature remains experimental.
**WireGuard proxy (experimental) is selected by default for both apps. Routing
itself defaults to off.** Import a supported `.conf`, explicitly enable it in
each patched app, and restart. Each app keeps its own encrypted profile.
The bundle includes the other patches from its upstream base, so choose **one
patch source per app** instead of combining it with official Morphe patches.
After updating this source, patch and install the app again to receive changes.

## Changes in v2.2.0

- Update the upstream base from Morphe Patches v2.1.0 to the official
  [v2.2.0 stable release](https://github.com/MorpheApp/morphe-patches/releases/tag/v2.2.0).
  This includes the new upstream YouTube player/playlist features, Music glass
  navigation option, fixes and refreshed app compatibility metadata.
- Retain the existing WireGuard transport, profile import diagnostics,
  encrypted profile format/key alias, app settings UI and internal settings
  localization fix from v2.1.5. The engine and its profile subset are unchanged.
- Keep all 60 WireGuard strings in Korean, Japanese, simplified/traditional
  Chinese, Spanish, French, German and Brazilian Portuguese, with English
  fallback. Both patches remain selected by default, with routing off until
  explicit user enablement.

This update uses the stable v2.2.0 tag, without later unreleased `dev` changes.
The translations remain custom-distribution additions requested by the
maintainer, not an official Crowdin export. The separate upstream contribution
and personal draft PR are unchanged by this release. Existing
[v2.1.3 maintenance fixes](docs/wireguard-maintenance-2.1.3.md),
[v2.1.4 translations](docs/wireguard-i18n-2.1.4.md) and the
[v2.1.5 internal localization fix](docs/wireguard-i18n-2.1.5.md) remain included.
Earlier releases and their verification reports are preserved.

## Verification status

- Source build and regression checks: **1,571 Java/Kotlin tests passed with 5 existing APK-dependent skips; Go race/vet, 80 host JNI checks, 41 Python tests and source-built bundle/DEX/native/resource checks passed**.
- APK patching and inspection: **8 custom APK patch/--validate/static inspections passed, including minimum/latest recommended and latest experimental targets; 4,320 compiled locale values matched. Full-default YouTube 21.30.216/21.45.82 failed at Feed card layout; the official bundle reproduces the same 21.30.216 failure, and an explicitly deselected-Feed-card 21.30.216 selection passed**.
- Runtime checks: **No new Android target-app or network execution; settings Activity/base hook and dependency locale lookup sources are unchanged from the historical API35/KVM 124-comparison UI cohort**.

See the [v2.2.0 base update report](docs/wireguard-upstream-2.2.0.md) for the
exact source, artifact identity, tested app versions and unverified scope.
Compatibility metadata does not establish that every declared version was
tested. Historical v2.1.5 standalone settings Activity checks used explicit
backend stubs; they are separate from running patched YouTube/Music apps and
are not new v2.2.0 acceptance results.

Actual target-app launch, text layout, language selection/restart, profile
import, AndroidKeyStore, remote handshake, playback, DNS/leak behavior, network
transitions and concurrent app/process use need recorded device acceptance.
The maintainer's successful v2.1.1 device use remains a separate historical
report.

## Supported scope and limitations

- The authenticated app-local HTTP proxy uses a userspace TCP/IP stack and
  WireGuard. It does not register `VpnService`, use root, require a separate
  WireGuard app, or occupy the system VPN slot.
- Only intercepted network paths are tunneled. Other app requests, WebView,
  Cast and separate processes are not guaranteed to be covered. This is **not
  a system-wide VPN or complete kill switch**.
- Supported APK ABIs: `arm64-v8a` and `x86_64`. APKs containing 32-bit ABIs and
  root-mount installation are unsupported.
- WireGuard requires YouTube 20.47.62 or newer among the declared targets.
  Compatibility metadata is separate from executed APK/device tests.
- Profiles require one interface/peer, UTF-8 text of at most 64 KiB, a numeric
  endpoint and numeric DNS covered by `AllowedIPs` and an interface address
  family. Hostname endpoints, DNS search domains, shell hooks and routing-table
  options remain unsupported.
- Intercepted requests have no direct fallback on tunnel failure. Local proxy
  readiness does not prove a remote handshake or Internet access.
- The previously reported profile-import and system WireGuard coexistence
  failures have not been reproduced on the reporting users' devices. This base
  update does not claim to resolve those reports or change system VPN routing.

## Source and release files

The [v2.2.0 release](https://github.com/seo-rii/morphe-wireguard-patches/releases/tag/v2.2.0)
contains:

- `morphe-wireguard-youtube-music-preview-2.2.0.mpp` — unsigned source-built
  bundle; SHA-256 `d10f3f8b2cc114a6d11e1e80d02b0fc435199839b7051b6a1768a481c3095bd3`.
- `morphe-wireguard-prototype-source.zip` — full corresponding modified source,
  pinned dependency source snapshots, build instructions and license notices.
- `RELEASE-SHA256SUMS.txt` — asset checksums.

The review patch is [wireguard-prototype.patch](wireguard-prototype.patch),
against Morphe v2.2.0. Full source commit: `d03b7439f517eeed13d12edc1f922ee0e640cd13` on
`feat/wireguard-i18n-custom`.
See [source build instructions](docs/wireguard-source-build.md), the source
ZIP's `README-WIREGUARD.md`, `docs/`, `build-support/` and `scripts/`, and the
[archive packaging helper](scripts/package-wireguard-source.py).
The historical v2.1.2 `repair` operation is not part of this source build.

## License and provenance

This is a modified, unofficial derivative of
[MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches)
at `44031c561ea048c8f196877f30a49c13bfd6afb6` (v2.2.0).
Original [GPL-3.0 LICENSE](LICENSE), [NOTICE](NOTICE), dependency licenses and
copyright notices are preserved. The app exposes bundled notices in WireGuard
settings. No proprietary target APKs, personal profiles, private keys, account
credentials or signing secrets are distributed. Dependency-owned AOSP framework
and test APK resources required by ARSCLib are retained with its source/license.
