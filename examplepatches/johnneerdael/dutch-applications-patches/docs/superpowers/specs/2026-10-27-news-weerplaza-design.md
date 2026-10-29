# Volkskrant, NU.nl and Weerplaza patch design

Status: implementation design; fresh builder review found no important open
questions. Investigation and implementation verification remain open.

User update, 2026-10-27: remove the test emulator for storage reasons and use
the USB-connected physical phone for further device verification. The created
AVD, OS image and virtual disks have been removed. Do not recreate an emulator.

The user also requested Buienalarm's community Maps-key compatibility for
Weerplaza after confirming its initial patched phone build appeared to work.
Replace Weerplaza's Maps manifest credential with that authorized generated
community key, preserve its Firebase credential, include the fix automatically
with the other Weerplaza controls, and update the already patched phone copy
without clearing its data.

The tested local build initially reused a stale generated key. The working
Buienalarm phone key matches the current Actions release, and rebuilding with
that verified input fixed Weerplaza radar according to the user. Local builds
and independent verifiers must use explicit environment or ignored-file input;
generated build output is not an authoritative source of the intended key.

## Intent

Extend the existing Morphe bundle in `buienalarm-patches` to remove ads,
tracking and premium promotions from the three phone-installed applications.
For Volkskrant, also remove the restriction that prevents reading full
articles. The original goal is satisfied only when full article content is
verified, not merely when a paywall view disappears.

The user selected Morphe patches and this repository. The existing Kotlin
patch structure, Gradle build and Desktop validation toolchain are the proposed
implementation choices. Preserve the existing Buienalarm, Buienradar and
Weeronline patches, including the pre-existing uncommitted Weeronline changes.

## Verified inputs

Use the complete base/ARM64/English/xxxhdpi APK sets under `../phone-apks/`.
`../phone-apks/manifest.json` records input hashes. These are device-specific
Play Store variants; their actual minimum SDK must not be inferred from older
standalone releases.

| Application | Package | Version | Version code | Input minimum SDK |
| --- | --- | --- | --- | --- |
| Volkskrant | `be.persgroep.android.news.mobilevk` | 7.53.1 | 23136515 | 32 |
| NU.nl | `nl.sanomamedia.android.nu` | 26.9.0 | 210156 | 32 |
| Weerplaza | `nl.weerplaza.app` | 3.13.1 | 734 | 26 |

APK signatures verified with Android SDK `apksigner`. Volkskrant and NU.nl
include rotated signing certificates; compatibility must accept the verified
signing lineage rather than mistaking Google's source-stamp certificate for
the application signer. All inputs declare required ABI and density splits.

## Approaches

The proposed approach is version-restricted Kotlin bytecode and resource
patches in the current bundle. This fits the requested Morphe integration
and allows independent selection and validation of each behavior.

A network blocklist alone cannot remove local reserved space, marketing
prompts or article presentation gates. It also cannot distinguish every
collector from required services that share a host. Replacing whole app
repositories or forcing subscription state globally would touch content,
account and purchase behavior beyond the relevant presentation gates. Those
approaches do not fit the requested result as well as targeted patch points.

## Patch organization

Add package-specific compatibility declarations and patches under
`patches/src/main/kotlin/patches/{volkskrant,nunl,weerplaza}/`.

Each application has separately selectable `Hide ads`, `Disable tracking`,
and `Hide Premium banner` patches. Add `Skip consent screens` where needed to
remove automatic advertising/paid-choice barriers without recording an
acceptance. It depends on the relevant ad and tracking controls; manual
privacy settings remain accessible. `Disable tracking` includes ad suppression
where ad SDK initialization or requests are themselves a tracking path.

Volkskrant additionally has a separately selectable `Read full articles`
patch. Patch its article rendering decision rather than fabricating purchases
or globally changing account entitlement state. Any additional behavior needed
to obtain the complete body must be investigated and verified as part of that
same requirement.

Use stable class/method references, source strings and instruction structure.
Restrict support to the verified versions and signers. Required matches must
fail when absent or ambiguous. Derive registers and callback types from the
actual input; do not assume parameter or coroutine layouts from another app.

## Behavior and evidence

### Ads and premium prompts

Cover startup, feed and detail banners, reserved space, sticky and interstitial
ads, video advertising, sponsored content, and startup/settings/menu premium
promotions. Disable both loading and rendering. Existing ad-free branches are
preferable where they preserve cleanup and content rendering. Async patch
points must complete required callbacks rather than strand loading states.

Initial evidence includes Weerplaza's shared Infoplaza ad-enabled gate and
bottom-navigation loader; NU.nl's nullable DPG banner view and actual IMA
configuration factories; and Volkskrant's native article and marketing-template
pipeline. NU.nl's `VideoData.isAdsDisabled` is not consumed by its observed
player factories, so changing that getter alone would not prove video ad
suppression.

### Tracking

NU.nl's BFF event transport also carries required onboarding acknowledgements.
Preserve only the evidenced `wncCardShownEvent` payloads for `breakingNews`,
`promoteLogin` and `followTopics`; these record completion on the server.
Blocking them causes repeated onboarding. The exact acknowledgements work
without the persistent UDS identifier, so its removal remains in scope.

Create an app-specific collector inventory covering manifest startup,
application initialization, event and identifier dispatch, queued uploads,
video/web content and bundled configuration or executable assets. Disable
actual collector sinks as well as collection flags, including re-enablement
from previously saved consent.

Seen families include DPG/Snowplow, Comscore, Firebase analytics/crash/session/
performance/marketing components, advertising IDs and ad measurement, Heap,
ContentSquare, Piano/Cxense, Gemius and Infoplaza cross-app PPID. Final coverage
must follow each APK's inventory, not this preliminary list.

Preserve required content, weather, account and notification functionality.
For example, NU.nl's tracking engine also processes local UI variables, BFF
cookies and read state; no-oping the whole engine would break behavior.
Disable its external collector sinks instead. Keep Firebase Messaging and
installation services where required for push. Do not weaken TLS or treat all
network traffic as tracking.

### Volkskrant full articles

Static evidence shows `GET /article/v1/{shortId}` mapped through `ArticleDto`
and `ArticleDtoMapper` before `ArticleViewModel` resolves a marketing template.
A blocking template produces `BlockedContent`; the alternative branch renders
the already fetched article. This supports a candidate client-side patch.

Live anonymous API responses for premium short IDs `424b597` and `98f3dc53`
contained 14 and 9 editorial paragraphs respectively, including final
substantive paragraphs matching the publisher's public pages. Requests used
the shipped app's fallback configuration without private phone/account data.
Raw responses and evidence hashes remain only in temporary analysis storage.
The inline-template mapper can also replace the article body, so bypassing
only the blocking-template boolean would be insufficient. Use the normal
successful empty marketing-result path for both presentation restrictions.
Verify actual text and final paragraphs in the patched application.
If a server withholds content, record that as an unmet requirement and continue
investigation; do not label a hidden overlay as successful full access.

## Verification

1. Record exact signatures and expected original behavior from independently
   decoded APKs. Make effect assertions fail against unpatched inputs before
   implementing changes.
2. Build the real `.mpp` using the existing Gradle toolchain and private build
   configuration without exposing credentials or keys.
3. Apply each named patch separately with its dependencies and all patches
   together to complete split APK inputs. Use Desktop `--validate` and
   `--bytecode-mode FULL`; inspect every patch report and verify output signing.
4. Independently decode outputs with apktool. Check changed instructions,
   resources, manifest components, removed collector assets and unaffected
   functional paths. Include input-version and fingerprint failure checks.
5. Compare original and patched runtime behavior for startup, feeds, content,
   navigation, weather, video, notifications and consent/account flows as
   applicable. Check for crashes and stuck states, and inspect network activity
   for the inventoried collectors. Separate static proof from runtime evidence.
6. For Volkskrant, compare the full body of representative restricted articles,
   including content after the former blocking point and final paragraphs.
7. Rebuild/check existing app patches after shared tooling changes. Document
   supported inputs, patch dependencies, collector coverage, outputs and every
   remaining verification gap. Generate metadata with the existing generator;
   do not manually edit generated patch lists or releases.

Use the USB-connected physical phone for device checks. No original app may be
uninstalled or its private data cleared without confirmation. Prepare the
reviewable patched APK before requesting any replacement that Android's
different-signing-key rule requires. Preserve existing installations while
finishing local patch work and read-only checks.

## Completion criteria

All three apps have working, selectable Morphe controls that cover the actual
ad, tracking and premium-prompt surfaces found in their APKs. Volkskrant reads
complete previously restricted articles. The bundle builds and all patch
selections apply and verify on the declared inputs. Runtime and collector
checks support the behavioral claims. Missing content or incomplete runtime
evidence leaves the overall goal active.
