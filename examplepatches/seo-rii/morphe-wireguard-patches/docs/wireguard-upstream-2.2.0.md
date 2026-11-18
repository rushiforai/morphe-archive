# WireGuard v2.2.0 stable upstream base update

The custom distribution now uses the official Morphe Patches v2.2.0 stable tag
at `44031c561ea048c8f196877f30a49c13bfd6afb6`, released on November 10, 2026.
The previous custom v2.1.5 used Morphe v2.1.0 at
`8fa2c7a1a832498de8f179748998a3ca87e198eb`. The official
[release notes](https://github.com/MorpheApp/morphe-patches/releases/tag/v2.2.0)
and [base comparison](https://github.com/MorpheApp/morphe-patches/compare/v2.1.0...v2.2.0)
describe the upstream changes. Later unreleased `dev` work is not included.

The separate official-contribution source branch and personal draft PR are
unchanged by this custom release. Historical release files and test reports
remain available; their results are not relabeled as new v2.2.0 tests.

## Merge scope and preservation

The update merges the stable upstream tag into the existing custom source,
preserving the working WireGuard implementation. Upstream changes include
YouTube player/playlist improvements, Music's glass navigation option, fixes,
settings updates and new compatibility metadata.

Official v2.1.0-to-v2.2.0 changes do not alter the existing Network proxy,
Cronet transport/hooks or `BaseActivityHook` used by WireGuard. The custom
WireGuard engine, JNI bridge, shared runtime, settings Activity, proxy failure
policy and per-app patch declarations retain their v2.1.5 source behavior.
No replacement VPN implementation or Android `VpnService` is introduced.

The Music `RomanizationDict` import conflict is resolved by retaining both
upstream's current download/cleanup code and the existing
`Requester.openConnection` routing. The current Music connection sites use
`Requester`/`LyricsRequests`; no new direct URL connection path is introduced
by this merge. This source inspection does not establish coverage of every
app-internal request or future code path.

Preserved invariants:

- Both WireGuard patches have `default = true`; the separate runtime setting
  `morphe_wireguard_enabled` still defaults to `false`. Import alone does not
  enable routing. Disabled routing starts no WireGuard engine.
- Both apps retain their independent encrypted profile storage:
  `morphe-wireguard-v1.bin` in `noBackupFilesDir`, AndroidKeyStore alias
  `morphe.wireguard.profile.v1`, AES-GCM and the existing versioned format.
- The app-local proxy remains authenticated. Intercepted requests have no
  direct fallback on tunnel failure, and WireGuard routing disables QUIC for
  its TCP proxy boundary.
- The settings page retains its v2.1.5 Activity-local resource lookup. All 60
  WireGuard strings are preserved in English and eight locale variants:
  Korean, Japanese, simplified/traditional Chinese, Spanish, French, German
  and Brazilian Portuguese. The 19 fixed native diagnostic codes still map to
  localized resource keys; raw profile/backend text is not displayed.
- Native support remains `arm64-v8a` and `x86_64`, Android API 26 or newer.
  The supported profile subset and root-mount/32-bit restrictions remain.

The custom translations remain maintainer-requested additions, not an official
Crowdin export. The official contribution's English-source/Crowdin policy is
separate from this distribution.

## Build and source provenance

| Item | Value |
| --- | --- |
| Bundle | `morphe-wireguard-youtube-music-preview-2.2.0.mpp` |
| Bundle SHA-256 | `d10f3f8b2cc114a6d11e1e80d02b0fc435199839b7051b6a1768a481c3095bd3` |
| Release code commit | `5f82429e47a7d0a29f7f3f61caab53b73fd49307` |
| Source branch | `feat/wireguard-i18n-custom` |
| Official stable base | `44031c561ea048c8f196877f30a49c13bfd6afb6` |
| Morphe Gradle plugin | 2.1.0, unchanged |
| Morphe Patcher | 2.3.0, unchanged |
| Morphe patches/extensions library | 2.2.0-dev.3, as required by the stable upstream tag |
| Native ABIs / minimum API | `arm64-v8a`, `x86_64` / 26 |
| Tools | Wrapper Gradle 9.8.2, JDK 21, SDK/Build-Tools 36, Go 1.26.10, NDK 28.2.13676358 |

The library's development-suffixed dependency version is part of the official
stable v2.2.0 source. It does not mean this distribution follows a later
Morphe Patches `dev` commit. The corresponding source archive contains exact
public dependency snapshots and `SOURCE-PROVENANCE.json`; the pinned public
source preparation helper matches those inputs. No compiled patch selection
flags are rewritten, and no unrelated upstream patch is modified for the build.

The final source ZIP provenance records the documentation/catalogue commit.
The release code was tested at `5f82429e47a7d0a29f7f3f61caab53b73fd49307`;
only documentation and the source-generated catalogue were finalized afterward.
Application source, resources, build/dependency inputs and tested bundle bytes
remain unchanged. The first full test attempt detected a stale expected Music
experimental version (9.42.52); both metadata regression checks were updated to
the official target 9.45.51, then the complete validation passed.

The generated catalogue has 204 patches. All 202 official v2.2.0 entries match
the official catalogue exactly; the two additional entries are the app-specific,
default-selected WireGuard patches. No official patch metadata is removed or
rewritten by this distribution.

## Declared app targets

This table records upstream compatibility metadata, not test execution.
Recommended and experimental versions must be distinguished from the actual
APK cases recorded below.

| App | Recommended targets | Experimental targets |
| --- | --- | --- |
| YouTube | 21.30.216, 21.28.208, 21.23.492, 20.51.39, 20.26.46 | 21.45.82, 21.44.528, 21.43.523 |
| YouTube Music | 9.30.53, 9.20.53, 9.15.51 | 9.45.51, 9.44.52, 9.43.51 |

WireGuard's YouTube gate still requires 20.47.62 or newer. Of the declared
recommended YouTube targets, 20.51.39 is therefore the oldest eligible one;
20.26.46 intentionally skips the WireGuard patch with a warning. The general
bundle's compatibility list must not be read as WireGuard support on that
older target. Music's oldest declared target is 9.15.51. Minimum/maximum
eligible recommended targets and latest experimental targets remain separate
verification cases.

## Executed verification

Source build and regression results: **1,571 Java/Kotlin tests passed with 5 existing APK-dependent skips; Go race/vet, 80 host JNI checks, 41 Python tests and source-built bundle/DEX/native/resource checks passed**.

APK patching, Desktop `--validate` and static inspection results:
The following checks used the exact final source-built bundle. A focused
selection means WireGuard and its declared dependencies; it does not imply
full-default patching of unrelated features.

| App/version | Selection | Desktop `--validate` / final APK inspection |
| --- | --- | --- |
| YouTube 20.51.39 | WireGuard-focused, minimum eligible declared target | Passed |
| YouTube 21.30.216 | WireGuard-focused, latest recommended | Passed |
| YouTube 21.30.216 | Full defaults | Failed: `Feed card layout`; official baseline reproduces this |
| YouTube 21.30.216 | Defaults with only `Feed card layout` explicitly deselected | Passed |
| YouTube 21.45.82 | WireGuard-focused, latest experimental | Passed |
| YouTube 21.45.82 | Full defaults | Failed: same `Feed card layout` fingerprint |
| Music 9.15.51 | WireGuard-focused, minimum declared target | Passed |
| Music 9.30.53 | WireGuard-focused, latest recommended | Passed |
| Music 9.30.53 | Full defaults | Passed |
| Music 9.45.51 | WireGuard-focused, latest experimental | Passed |

This is **8 successful custom APK outputs and 2 failed full-default YouTube
runs**, plus the controlled official-bundle failure reproduction. The failed
cases are not counted as passes. Each successful APK passed compiled native,
manifest, resource, DEX/JNI and notice inspection. All 60 English values and
60 values in each of eight locale configurations matched across the eight
successful APKs: **4,320 comparisons passed**.

Original Google signatures and ZIP CRC were verified. Universal YouTube inputs
were explicitly derived to unsigned arm64-only fixtures; retained contents and
package/version identity were verified. Music used original arm64 inputs. No
compatibility force or continue-on-error flag was used. Final output APKs are
unsigned host-validation artifacts, not release assets. x86_64 native payloads
were inspected, but x86_64 target APK execution was not performed.

Runtime results: **No new Android target-app or network execution; settings Activity/base hook and dependency locale lookup sources are unchanged from the historical API35/KVM 124-comparison UI cohort**.

Record the exact source/bundle identity and target versions when reporting
results. Resource/DEX/JNI/native inspections and successful Desktop validation
are host evidence. They do not establish Android target-app launch, profile
import, a remote handshake, playback or network leak behavior.

Historical v2.1.5 verification included four focused/default APK cases on
YouTube 21.30.216 and Music 9.30.53 and 2,160 compiled resource comparisons.
Its standalone API 35/x86_64 settings Activity harness passed 124 comparisons
with explicit backend stubs. Those results remain in the
[v2.1.5 report](wireguard-i18n-2.1.5.md); they are not newly executed v2.2.0
target-app tests.


Successful unsigned test APK SHA-256 values:

| App/version | Selection | SHA-256 |
| --- | --- | --- |
| 21.30.216 | focused | `991a5d0f1ae9a9489282621506b5673edb10964832f3378d11dd0be33146dded` |
| 9.30.53 | focused | `ac95f9410aaa13122aa64b7b4cba3e3b3d0fb4dec779fcca6dc7e81e215dac91` |
| 9.30.53 | defaults | `5543da602b29901899eb730c1a9dd1e73fb5475ce1c6c04d762b04b0da4ed5b6` |
| 20.51.39 | focused | `4ff558f1eb36fc8e3cac5fd36a766ead78e402729acbd811105c4bda5f7ca327` |
| 9.15.51 | focused | `6fd2b251e07ba68e9be9c2ef2e318eea979492cb367c922012c87343060cb010` |
| 21.45.82 | focused | `2f6f5cb46954eae022c02ba85ee622b2130b530233dfaf85b810e89a8696cd73` |
| 9.45.51 | focused | `39e827f60dcf78012c3e8dce3baa217177ce59b5faf5234bb603fc1bee20ece9` |
| YouTube 21.30.216 | Defaults minus Feed card layout | `6fb8232fd1f814d68d4760f3055be73b9271b47321d688bb81253de9082039ce` |

## Reproduced official selection failure

Full-default YouTube patching failed at `Feed card layout`, specifically
`app.morphe.patches.youtube.shared.EngagementPanelControllerFingerprint` at
`FeedCardLayoutPatch.kt:197`. This happened for custom 21.30.216 and 21.45.82.
A controlled 21.30.216 baseline used the exact official v2.2.0 bundle, SHA-256
`6ca368de24d475404257611cf03c2a82062a00ab9d60ddd220badaa332a68f2e`, with the
same derived ABI-only input, Desktop 2.1.1 (the latest stable Desktop at test
time), JDK 21 and no compatibility-force/continue-on-error flags. It failed at
the same patch and fingerprint. Failure detail matched after normalizing only
Java object identity suffixes. Input and bundle hashes stayed unchanged.

This is an observed failure shared with the official bundle in this host
validation cohort. It is not evidence that every Manager/device execution fails.
WireGuard sources do not modify the affected upstream files. The custom release
keeps all official patches and defaults; `Feed card layout` is not silently
removed, disabled in metadata or rewritten. A separate, explicitly labeled
selection test deselects that patch. Full-default YouTube runs remain recorded
as failed, irrespective of the alternate selection result.

## Unverified behavior and expected device procedure

Unrun app versions, ABI/runtime cases and checks must stay marked unverified.
In particular, a compatibility declaration does not establish that a new
experimental APK was available for validation. The maintainer's successful
v2.1.1 physical-device use is separate historical evidence.

The following device procedure records expected results until performed on
the actual patched YouTube and Music apps:

1. Refresh the custom source and patch/install each app using the new bundle.
   Expected: settings opens with the WireGuard entry, while a clean install
   has routing disabled and starts no WireGuard network work.
2. Upgrade an existing installation without clearing its data. Expected: its
   saved profile and explicit enablement state remain accessible through the
   unchanged encrypted format/key alias. Do not publish profile contents.
3. Import a supported test profile and explicitly enable/restart. Expected:
   intercepted traffic reaches the WireGuard server; independently observe a
   server handshake, DNS path and media playback.
4. Make the endpoint unreachable. Expected: intercepted requests fail without
   direct fallback. Check actual traffic; requests outside the hooks are not
   covered by this expected result.
5. Change Wi-Fi/mobile networks, restart each app, run both concurrently and
   check the reported system WireGuard coexistence scenario. Record actual
   results instead of assuming success from static inspection.
6. Repeat supported Morphe/Android locales. Expected: entry and internal
   titles, rows, status, dialogs and toasts follow the settings Activity's
   locale after the documented restart.

Target-app text layout, document-picker grants, AndroidKeyStore integration,
live handshake, playback, DNS/leak measurements, reconnection, resource usage
and concurrent app/process behavior still require device evidence. The full
[device acceptance checklist](wireguard-device-acceptance.md) remains useful.

## Security and licensing boundaries

This feature tunnels only requests intercepted by the authenticated app-local
HTTP proxy through a userspace WireGuard stack. It does not register Android
`VpnService`, use root, occupy the system VPN slot, or provide a system-wide
VPN/complete kill switch. Local proxy readiness does not establish a remote
handshake or Internet access. Unhooked paths and other processes are outside
the coverage claim.

Profiles still require one interface/peer, UTF-8 text of at most 64 KiB, a
numeric endpoint and numeric DNS covered by `AllowedIPs` and an interface
address family. Hostname endpoints, DNS search domains, shell hooks and
routing-table options remain unsupported. The previously reported import and
system WireGuard coexistence failures have not been reproduced on those
users' devices; this base update does not claim they are fixed.

Original GPL-3.0/NOTICE terms, external dependency sources, licenses and
copyright notices remain preserved and accessible in the app. The release
contains no proprietary target APKs, personal profiles, private keys, account
credentials or signing secrets. ARSCLib's dependency-owned AOSP framework and
test APK resources remain with its corresponding source/license. The bundle
is unsigned. See [source build instructions](wireguard-source-build.md).
