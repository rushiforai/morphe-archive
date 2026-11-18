# WireGuard v2.1.4 localization and validation

This custom distribution retains Morphe Patches v2.1.0 at
`8fa2c7a1a832498de8f179748998a3ca87e198eb`. The upstream contribution uses a
separate base and is validated separately. Its results are not additional
custom-distribution test cases.

## Localization change

The shared settings use the same Android XML resource group, `StringRef` and
Morphe language context as other patches. The Go parser supplies 19 fixed
machine codes through the existing JNI exception. Java maps only recognized
codes to resource keys. Unknown, null, legacy-English or malformed payloads use
the generic localized validation failure; arbitrary backend messages, provider
URIs and profile values are not displayed.

No separate language selector, runtime translation service or translation
network request is introduced. The existing restart semantics apply because
Morphe caches resolved strings. English remains the default resource fallback.

All 60 WireGuard UI strings are translated in these custom resource variants:

| Language | Source folder suffix | APK resource configuration |
| --- | --- | --- |
| Korean | `ko-rKR` | `ko` |
| Japanese | `ja-rJP` | `ja` |
| Chinese, simplified | `zh-rCN` | `zh-rCN` |
| Chinese, traditional | `zh-rTW` | `zh-rTW` |
| Spanish | `es-rES` | `es` |
| French | `fr-rFR` | `fr` |
| German | `de-rDE` | `de` |
| Portuguese, Brazil | `pt-rBR` | `pt-rBR` |

The maintainer explicitly requested these additions for the custom distribution.
They are not an official Crowdin export. The official contribution continues
with English-source changes and Crowdin-managed translations; no translated
upstream locale files are changed by this work. Existing non-WireGuard
translations are retained. Protocol field identifiers and numeric limits remain
unchanged in the localized explanations. License/copyright notices stay verbatim.

The transport and supported configuration subset are retained. Routing still
defaults to off and profile import alone does not enable it. The encrypted
profile format/key alias and both patches' default selection policy are retained.

## Final artifact identity

| Item | Value |
| --- | --- |
| Bundle | `morphe-wireguard-youtube-music-preview-2.1.4.mpp` |
| Bundle SHA-256 | `8010b938869104ab8a80f1ca381f624d43d9bee64e434c84287b4648b52816ae` |
| Release code commit | `5621188ad422f6f6bacf2387aa5b924704926c7f` |
| Original source base | `8fa2c7a1a832498de8f179748998a3ca87e198eb` |
| Native ABIs | `arm64-v8a`, `x86_64` |
| Native minimum Android API | 26 |
| Tools | Wrapper Gradle 9.8.2, JDK 21, SDK/Build-Tools 36, Go 1.26.10, NDK 28.2.13676358 |

## Preparation checks already executed

The following checks cover the stable-code/resource integration **before the
final eight-language translated release build**. They are retained as a separate
cohort and must not be presented as final v2.1.4 artifact evidence.

| Check | Custom preparation result |
| --- | --- |
| Full Java/Kotlin source graph | 614 cases: 609 passed, 5 existing APK-dependent cases skipped, no failures/errors |
| Import workflow/privacy suite | 30 passed, included in the JUnit total |
| Host JNI | 80 checks passed, including all 19 native diagnostic codes |
| Native Go race/vet | Passed; 27 top-level tests |
| Python verification tools | 37 passed, including native/Java/XML/Crowdin contract checks |
| Focused Desktop `--validate` and APK inspection | YouTube 21.30.216 and Music 9.30.53 passed |
| Isolated synthetic Korean fixture | Korean marker inclusion and English fallback passed; fixture was not a real translation or released asset |

The counterpart contribution preparation had 1,487 cases: 1,482 passed and 5
existing APK-dependent skips. Its native/JNI/workflow checks and separate APK
fixtures also passed. These do not replace the custom build's checks.

## Final v2.1.4 release checks

| Check | Final result |
| --- | --- |
| Full Java/Kotlin source graph | 614 cases: 609 passed, 5 existing APK-dependent cases skipped, no failures/errors |
| Import workflow/privacy | 30 passed, included in JUnit total |
| Host JNI | 80 checks passed; existing signatures and constructor retained |
| Python verification tools | 41 passed, including 4 compiled-locale verifier regressions |
| String resources | Gradle `checkStringResources` passed |
| Android source bundle / real Morphe loader | Passed; 202 patches, two default-selected WireGuard patches, app-specific dependencies |
| DEX/JNI/resources/native inspection | Passed; both app classes, extension DEX and three JNI signatures |
| Go race/vet | 27 top-level tests passed in the preparation cohort; executable native sources are unchanged |

The final build used release code commit `5621188ad422f6f6bacf2387aa5b924704926c7f`.
Only Markdown documentation was finalized afterward; executable source, resource,
version, dependency and build inputs remain byte-identical to the tested state.
The source ZIP's `SOURCE-PROVENANCE.json` records the final documentation commit.
No compiled defaults were patched. The first result-collection attempt also
matched an older development bundle; selecting the exact version fixed collection
without changing inputs or rerunning the successful build steps.

| Packaged native ABI | SHA-256 | Bytes |
| --- | --- | --- |
| arm64-v8a | `7d9d7056db514834f64db3fd054eb7b2afefe2b8ef62a4292140fe2d24ecdf48` | 10,093,736 |
| x86_64 | `949f1d596c0363228c5338b82b5282cdecf00e8a18e61a0492f5639fdba67383` | 10,805,288 |

| App / version | Selection | Desktop `--validate` / static inspection | Patched unsigned APK SHA-256 |
| --- | --- | --- | --- |
| YouTube 21.30.216 | focused | Passed | `7f991a08bf2ca72abb5dbde6a1d8d52b298b819c25e05a06ccd4f514921566ec` |
| YouTube 21.30.216 | defaults | Passed | `e21a1bfd405d3cb42c429722ef7f188c5ccc70f46d06fd76cac9f704baaed9aa` |
| Music 9.30.53 | focused | Passed | `3b6220e88683c0b40fca3d32c3c8aea842e3baa86fd6903c27e67975cf26cb16` |
| Music 9.30.53 | defaults | Passed | `b37039d29f4d57f089e9676323c8024bcc4e072abc866700eee32584139b0125` |

Morphe Desktop 2.1.1 performed the four host patch/validation cases without a
compatibility force flag. Each final APK passed DEX, resource, native payload,
ELF alignment, manifest and notice inspection. The compiled-locale checker
matched **all 60 English values and all 60 values in each of the eight real
locale configurations for every APK: 2,160 value comparisons, all passed**.
No synthetic marker translation is present in the release.

The signed Google originals passed signature allowlists and ZIP CRC checks.
YouTube's universal input was explicitly derived into an unsigned arm64-only
fixture; retained entry contents and package/version identity were checked.
Music used the original arm64 input. These derived/patched APKs are private test
artifacts, not release assets. Only arm64 target APKs were exercised in this
release matrix; x86_64 native payload inspection is not x86_64 app execution.

- Original YouTube SHA-256: `3775a15129dcc4e5b80fc17b7e0841b7fdd1ca89a6e72baa798806f666c74d02`.
- Original Music SHA-256: `1fe8d535ae445265c7250ed76a24c340e1dc89f2ab5d265f755800fe23ad334e`.


The final artifact checks below use the production locale files and compiled APK
values. The earlier synthetic fixture remains separate evidence and is not
included in the release. Unavailable device checks remain marked as unrun.

All APK patching/inspection results are host checks. Original APK signatures
must be verified and derived ABI-only fixtures explicitly identified; no
proprietary target APK is distributed with this release. Source builds do not
repair an older bundle's compiled bytecode.

## Not executed

- Actual Android target-app settings rendering, text wrapping, font/glyph layout,
  language selection/restart and translated error-dialog display.
- Document-picker URI grants, profile import, AndroidKeyStore availability and
  encryption behavior on a real target device.
- Real server handshake, video/music playback, DNS/traffic leak measurements,
  failed-server recovery, Wi-Fi/mobile handoff and concurrent app/process use.
- Reproduction of the previously reported import failure on that user's device.
- A fresh full minimum/latest-experimental app-version/device matrix.

The maintainer's successful physical-device use of v2.1.1 is historical and
separate from this release. The existing
[device acceptance checklist](wireguard-device-acceptance.md) contains expected
results for unrun checks; those expectations are not verification results.

## Security and distribution boundaries

Only intercepted requests use the authenticated app-local HTTP proxy and
userspace WireGuard stack. Intercepted requests have no direct fallback on
failure. Local listener readiness is not a remote handshake or Internet-access
check. The patch does not register Android `VpnService`, use root or provide a
complete system kill switch. Unhooked traffic and other processes remain outside
the coverage claim.

Supported profiles still require one peer, a numeric endpoint, explicit numeric
DNS covered by `AllowedIPs` and an interface address family, and a supported
64-bit APK. Root mounting, 32-bit ABIs, hostname endpoints, shell hooks and DNS
search domains remain unsupported. No live provider profile, private key or
signing credential was used for localization testing or included in assets.

Original GPL-3.0/NOTICE terms, dependency sources/licenses and legal notices are
retained. See [source build instructions](wireguard-source-build.md) and the
historical [v2.1.3 maintenance report](wireguard-maintenance-2.1.3.md).
