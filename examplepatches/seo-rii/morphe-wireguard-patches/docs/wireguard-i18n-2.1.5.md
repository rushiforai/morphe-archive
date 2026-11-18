# WireGuard v2.1.5 internal settings localization fix

This custom distribution retains Morphe Patches v2.1.0 at
`8fa2c7a1a832498de8f179748998a3ca87e198eb`. The separate contribution branch
uses an upstream `dev` base; its test counts are not custom-release test cases.

## Reported regression and fix

The v2.1.4 entry menu used Android XML string references, inflated in the Morphe
settings Activity's localized context. Internal WireGuard titles, preference
rows, status text, dialogs and toasts instead used `StringRef.str()`. That API
resolves through a global Activity/application context and retains resolved
values in a process-wide cache. A localized settings Activity could therefore
display internal strings from another context or an earlier English lookup.

The fix resolves internal strings with the WireGuard settings Activity's own
resources. Its fragment uses the same owning Activity for lookup. The existing
`BaseActivityHook.getAttachBaseContext` policy is retained: the default follows
the supplied Android context, and an explicit Morphe language uses Morphe's
localized context. Global `StringRef`, `ResourceUtils` and other settings pages
are not changed. No new locale selector, runtime translation service or
translation network request is added.

The eight custom locale variants remain Korean, Japanese, simplified Chinese,
traditional Chinese, Spanish, French, German and Brazilian Portuguese, with all
60 WireGuard strings in each variant and English fallback. The 19 recognized
native diagnostic codes still map to fixed resource keys; unknown or malformed
payloads use the generic localized failure. Raw backend text, document URIs and
profile values are not displayed. License and copyright notices stay verbatim.

These translations were requested for the custom distribution. The official
contribution retains English-source/Crowdin-managed translations and does not
include the manual locale edits.

## What the previous checks established

The [v2.1.4 report](wireguard-i18n-2.1.4.md) records four patched APK cases and
2,160 compiled resource value comparisons. Those results establish that the
translations were included with the expected values. They did not exercise
which context the internal Activity used to resolve displayed strings.
Resource inclusion is distinct from runtime locale correctness. The historical
report and v2.1.4 release assets remain unchanged.

## Final artifact identity

| Item | Value |
| --- | --- |
| Bundle | `morphe-wireguard-youtube-music-preview-2.1.5.mpp` |
| Bundle SHA-256 | `ec0dc5bce25f795fbcae9c4abfd9a8dc2798e800355f88eb04f308f986998627` |
| Release code commit | `8bd76d32607d2f9afbc212b5781585730ed1111f` |
| Original source base | `8fa2c7a1a832498de8f179748998a3ca87e198eb` |
| Native ABIs | `arm64-v8a`, `x86_64` |
| Native minimum Android API | 26 |
| Tools | Wrapper Gradle 9.8.2, JDK 21, SDK/Build-Tools 36, Go 1.26.10, NDK 28.2.13676358 |

The source ZIP's `SOURCE-PROVENANCE.json` records its final frozen source
commit. The bundle is built from source; no compiled default-selection flags
are rewritten. Native sources, dependency pins, supported profile subset,
transport and encrypted profile format/key alias are retained. Both patches
remain default-selected; the actual connection default remains off, and import
alone does not enable it.

## Source and host regression checks

The affected shared YouTube/Music Java module passed **64 tests**, with no
failures, errors or skips, in each source tree. The complete source-built
Android bundle and real Morphe loader passed: 202 patches for the custom base,
203 for the dev-based contribution, and both default-selected WireGuard patches
with app-specific dependencies. DEX/JNI/resources/notices/native inspections
passed for both bundles.

Actual bundled DEX was compared with v2.1.4: the settings Activity and nested
classes had 24 global `StringRef.str` call sites before this fix and zero after
it, with the context-explicit resource lookup present in both fixed bundles.
This guards against accidentally testing changed source but packaging stale DEX.

Both packaged native payloads are byte-identical to v2.1.4. Native sources, JNI
signatures and dependency pins did not change, so the earlier native race/vet
and JNI cohorts remain historical evidence rather than newly executed tests.

| Native ABI | SHA-256 |
| --- | --- |
| arm64-v8a | `7d9d7056db514834f64db3fd054eb7b2afefe2b8ef62a4292140fe2d24ecdf48` |
| x86_64 | `949f1d596c0363228c5338b82b5282cdecf00e8a18e61a0492f5639fdba67383` |

## Final APK checks

| App / version | Selection | Desktop `--validate` / inspection | Patched unsigned APK SHA-256 |
| --- | --- | --- | --- |
| YouTube 21.30.216 | focused | Passed | `cd7c4da3bf845aa8b4a18336fc58130c401f0cc2a9dd7a9a700c7e54d54be6f7` |
| YouTube 21.30.216 | defaults | Passed | `5b3061a1c415ddfa3bd5f7f930cad9adf7b5d988f046baf83f6214240118aaaf` |
| Music 9.30.53 | focused | Passed | `1475931db9ffa4aa4ae4b80e16e370c4ac54e7e5a3b255d206dc98d6c4cc1c7f` |
| Music 9.30.53 | defaults | Passed | `8bbea484318dd070bd7f05489ac183197b4a77414d899832f298c0754427c954` |

All four outputs matched all 60 English values and 60 values in each of the
eight custom locale configurations: **2,160 compiled value comparisons passed**.
These checks preserve the translations; runtime lookup is tested separately.
The Google-signed originals passed signer allowlists and ZIP CRC. Universal
YouTube used an explicitly derived unsigned arm64-only fixture with retained
entry contents and package/version identity checked; Music used its original
arm64 APK. No compatibility force flag was used. Desktop version was 2.1.1.
Target APK execution on x86_64 was not tested; the x86_64 native payload passed
static inspection only.

APK patching, Desktop `--validate` and static resource/native inspections are
host checks. Record the exact tested bundle and target versions, verified
original signatures, any explicitly derived ABI-only fixture, and resulting
APKs. A successful APK check does not establish target-app launch or runtime
language behavior. No proprietary target APK is distributed.

## Standalone Android Activity runtime checks

The final [API 35/x86_64 accelerated CI run](https://github.com/seo-rii/morphe-patches/actions/runs/42613499701)
passed. It used a fresh normal-storage Android 15 image, KVM CPU acceleration,
two vCPUs and 2 GiB guest RAM. No SDK, system image or guest network policy was
patched in this successful run. Only the disposable runner user received KVM
device access; required emulator host libraries were installed normally.

| Scenario | Pre-fix Activity | Fixed Activity |
| --- | --- | --- |
| Korean Activity, English host, primed English cache | Expected failure, 31 comparisons executed | 31 passed |
| Korean Activity, English host, unprimed cache | Expected failure, 31 comparisons executed | 31 passed |
| Explicit Morphe Korean, primed English cache | Expected failure, 31 comparisons executed | 31 passed |
| Unsupported locale with English fallback, primed Korean cache | Expected failure, 31 comparisons executed | 31 passed |

All **124 fixed-Activity comparisons passed**. The XML entry, Activity/toolbar,
six rows, profile/saved/status summaries, navigation description, validation
details and enable/disable/removal dialogs were checked. Structure-based waits
separate dialog appearance/dismissal from language assertions; Material button
capitalization is accepted only for the affected button label. Backend behavior
is represented by explicit inert collaborators, not by provider connections.

The actual Activity source hashes were:

- Pre-fix: `6c13315531b185bb10898f917117bc8d34511580c702e1424b8b0e17629d9089`.
- Fixed: `294df29ded72dc07979cb890c5926d8f6cb971b4abc53f69cb91159221e8518f`.

The fixed source matches both contribution and custom-distribution source.
BaseActivityHook and the public string/resource classes, collaborators and
resource XML were byte-identical between baseline and fixed builds; the
production Activity was their only differing Java input. Disposable package IDs
and ephemeral test signing keys distinguish the standalone APKs.

Earlier local API 30 attempts failed in platform setup before executing any UI
case (NetworkStack/SystemServer and incomplete storage-service initialization).
Their disposable-guest diagnostic settings were discarded with the owned VM;
original AVDs, SDK and user data were preserved. Earlier hosted setup and
accessibility-synchronization failures are separate attempts, not successful
locale cases. The final successful cohort above supersedes those fixture runs.

Reproduce with [the standalone harness](https://github.com/seo-rii/morphe-patches/blob/feat/wireguard-i18n-custom/tests/wireguard-settings-locale/README.md).
Target-app steps below remain expected results, not completed acceptance tests.

The standalone Android harness exercises production
`WireGuardSettingsActivity` and `BaseActivityHook` code with backend
collaborators stubbed. This isolates the Activity's locale/resource behavior
from provider profiles, AndroidKeyStore and network transport. It is separate
evidence from running the actual patched YouTube/Music applications. Any
language scenario absent from the recorded runtime results remains unrun.

## Not executed

- Full target-app settings rendering, text wrapping/font layout, language
  selection/restart and error display in the patched YouTube/Music apps.
- Document-picker URI grants, live profile import and real-device
  AndroidKeyStore/encryption behavior.
- Real server handshake, video/music playback, DNS/traffic leak measurements,
  failed-server recovery, Wi-Fi/mobile handoff and concurrent app/process use.
- Reproduction of the reported system WireGuard coexistence failure on the
  reporting user's device; this locale fix does not change network routing.
- Reproduction of the previously reported import failure on that user's device.
- A new full minimum/latest-experimental app-version/device matrix.

The maintainer's successful v2.1.1 physical-device use remains a historical
report. The [device acceptance checklist](wireguard-device-acceptance.md)
contains expected results for unrun items, not verification results.

## Target-app locale procedure (expected results; not run here)

1. Refresh the custom source and patch/install each target app with the new
   bundle. Keep target-app checks separate from the standalone harness.
2. Select Korean in Morphe settings and perform the requested full app restart.
   Open the WireGuard entry. Expected: its title, six rows, saved/profile/status
   summaries and information dialog all use Korean.
3. Switch Morphe to English and restart. Expected: the same UI uses English,
   without retaining previously resolved Korean values.
4. With Morphe language set to Default, repeat using a supported Android app or
   system locale. Expected: the WireGuard screen follows the supplied settings
   Activity locale. Record which selector and app were used.
5. If checking validation text, use a public invalid document with no personal
   keys, for example only `[Interface]`. Expected: a localized validation dialog
   with fixed explanations; import alone does not enable routing or overwrite a
   previously valid profile after failed validation. No live server is needed
   for this text check.

These are expected results and remain target-app acceptance work until recorded
on the actual patched applications. Font/layout and provider/network checks are
separate.

## Security and distribution boundaries

Only requests intercepted by the authenticated app-local HTTP proxy are
tunneled through the userspace WireGuard stack. Intercepted requests have no
direct fallback on failure. Local proxy readiness is not a remote handshake or
Internet-access check. The patch does not register Android `VpnService`, use
root, occupy the system VPN slot or provide a complete system kill switch.
Unhooked requests and other processes remain outside the coverage claim.

Supported profiles still require one peer, a numeric endpoint, explicit numeric
DNS covered by `AllowedIPs` and an interface address family, and a supported
64-bit APK. Root mounting, 32-bit ABIs, hostname endpoints, shell hooks and DNS
search domains remain unsupported. Localization checks do not use or publish
personal profiles, private keys or signing credentials.

Original GPL-3.0/NOTICE terms, corresponding dependency sources, licenses and
notices are retained. See [source build instructions](wireguard-source-build.md).
