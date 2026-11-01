# GVA and ED sibling patch comparison

## Inspected publisher inputs

| App | Package | Version / build | minSdk | Base APK SHA-256 |
| --- | --- | --- | --- | --- |
| GVA | `be.concentra.gva.MediaApp` | 22.0.0 / 2012316104 | 32 | `25ebec0cd26fc16375907b5d78e9607fd9faac03a1492d1e0e9ed067d1b136d4` |
| ED | `com.mecom.ed.nl` | 9.22.0 / 9220000 | 32 | `060e288e99631e4ed36608b8f5304515fc0a96c6729a641ad3fac5c6a965cb78` |

The complete installed split sets were copied over USB and every local APK was checked against its device SHA-256. Publisher signing identities were read with `apksigner verify --print-certs`, excluding the Google source stamp. Inputs and full REA evidence remain in ignored local storage; no publisher binaries, credentials or article text are committed.

GVA publisher certificate: `97b1b643443572a7830acef8649525aee79fa9a5d882b97fc516f01f7067b749`.
ED publisher certificate: `80d91716e88298892a4d34076ae3562ac9e2212e08048d09dbfeca2c26a6ed92`.

## Sibling selection

GVA uses the Mediahuis One/Kaching family shared by HBVL, Nieuwsblad and DS Nieuws. All 1,181 pinned original method bodies, three independent switch maps and the complete Twipe JavaScript asset match the existing Mediahuis baseline. The GVA module ports HBVL's four controls with GVA's own package, certificate and shipped `interactief.gva.be` Shop host. The article-request control from the unrelated Kubus family is not part of the Mediahuis sibling implementation.

ED uses the Kubus family shared by AD and Tubantia. AD has the same 9.22.0 version/build, but ED has distinct obfuscated types and merged utility methods. Types and method boundaries were mapped individually; matching version numbers do not establish matching bytecode. ED uses its own frozen baseline of 1,437 original methods across 152 classes and 82 exact allowed-edit specifications. The notification preference provider is `Ljld` branch 4, confirmed by its original caller and encrypted store, rather than AD's constructor branch 29. The AD copy installed on the phone is already Morphe-signed and was used only for structural comparison, never as an accepted publisher input.

| Control | GVA | ED |
| --- | --- | --- |
| Hide ads | Kaching disabled-result paths, sponsored groups, publisher/Shop/NYT promotions | Kubus commercial-content filters, advertising feature flags, video and game ad paths |
| Disable tracking | Native collectors, advertising identifiers, reader telemetry, manifest flags/permissions | Native collectors, queued uploads, re-enable paths, identifiers, FIAM |
| Skip consent screens | Persist normal onboarding completion; skip automatic consent and PayOrOk prompts | Skip automatic privacy/login/notification onboarding; preserve manual entry points |
| Hide Premium banner | Hide subscription cards/buttons, preserve genuine account state | Hide automatic marketing and Premium markers; preserve editorial/LIVE content |
| Read full articles | No matching sibling patch | Set the shipped article API's reduced-content request false and return supported empty marketing results |

## REA observations

- GVA package/manifest: `ev_5e748bc3ecc69ba4cf022542c0a2eabd463ea3986c558b94ad99b17f81e05fb1`.
- GVA Kaching parsed class: `ev_d5ec7a205ac2c736a82eddac0d4ca0fdaa33c2f9b81a52f7643a59e75556497d`.
- GVA `requestAd`: `ev_f8dc9ee058d205dfdfb651791c2f05d9ebc47e3564a70eb4c12762277f1076f2`. The original implementation already returns `KachingResult.AdsAndTrackingDisabled` when disabled; the patch uses this real typed result.
- ED package/manifest: `ev_202d1b8ec4f970512f1d670dcad8d6461c4bb3248fa15ef98a3edad25f11d7cb`.
- ED `SectionResponse` parsed class: `ev_20b7ee240f621efe6b86f042b56b44f1f8c0cf229ff452722d601b837a5e0333`.
- ED article Retrofit interface `jt0`: `ev_b76f82b462f28594616325f04fff4e4d85ca9dc286e52040df6596ba9c7c8066`; its `reducedContent` parameter maps to query `reduced` on the existing article endpoint.
- ED article repository `lt0.a`: `ev_957f77800ffd2b0fad900822434f5bbf98c077cef837a5bc59dddc6e20a9c217`. The original forwards that boolean while retaining component conversion, metadata, presentation and coroutine/error behavior.

REA parsed class inventory search rejected GVA because the provider reported duplicate class identities. Direct class/method inspection and independent APKTool method/switch checks supplied the evidence used here; the failed inventory is not a completeness result.

## Validation boundary

The validation harness checks pristine originals, each public control alone and all controls together. It checks patch reports, emitted behavior, retained publisher code and output APK signatures. Separate production guard tests exercise accepted publisher metadata and rejected package/version/build/SDK/signer combinations. These are local static and controlled emitted-code checks. They do not establish live server article availability, complete network silence or on-device runtime behavior. The installed phone apps and their data are preserved.

## Reproducing the local checks

Build with JDK 21, the Android SDK and the existing ignored build credentials:

```sh
python3 scripts/build.py :patches:buildAndroid :patches:generatePatchesList --no-daemon
python3 scripts/validate_targets.py gva ORIGINAL_GVA_SPLIT_DIRECTORY --compact
python3 scripts/validate_targets.py ed ORIGINAL_ED_SPLIT_DIRECTORY --compact
python3 -m unittest discover -s tests
node --test tests/test_release_branding.cjs tests/test_preview_release.cjs tests/test_identity.cjs
python3 scripts/generate_docs_catalog.py --check
python3 scripts/check_docs_app_pages.py
python3 scripts/check_markdown_links.py
python3 -m mkdocs build --strict
python3 scripts/check_docs_site.py
```

Local retained reports use `build/validation/gva-matrix`, `build/validation/ed-matrix` and `build/validation/ed-smoke`; original split sets remain untouched. GVA's four individual selections and combined selection pass all checks. ED's five individual selections and combined selection also pass all checks, including 1,437 original/retained method contracts and 82 allowed-edit specifications. The production original-input harness passes 91 acceptance/rejection and dependency-ordering assertions across both apps. It checks the actual validator and resource preflight, including missing/duplicate/nonnumeric SDK declarations and preservation of rejected manifest bytes.

No release was selected manually. The normal Gradle metadata generator adds exactly nine compatibility records, leaves existing records and the project version unchanged, and feeds the existing catalogue and README generators.

Final regression results: 331 Python tests passed (34 skipped), 29 release/identity Node tests passed, 80 app guides match metadata, and the strict site build and rendered-link checker pass for 78 bilingual page pairs. Independent review found no actionable source, compatibility, verifier or documentation issue. All 13 pulled publisher APKs still match the device checksums recorded before the investigation.

## ED follow-up from phone testing

The user accepted GVA and reported three remaining ED annoyances in the first dev build: a personalisation-consent placeholder, a large Nationale Vacaturebank widget in Eindhoven, and an unsolicited full-screen login offer.

Seen in the publisher APK: the personalisation notice uses string IDs `0x7f1400ed` and `0x7f1400ec` through `Lcw7;->c(IIILyg3;Lv07;)V`. The new guard returns only for that text ID; the original social-content consent notice and manual privacy/login routes remain intact. It neither grants nor fabricates consent.

Seen in a live ED WebView during inspection: an iframe titled `Nationale Vacaturebank` uses `https://mobileapi.ed.nl/static/widgets/nationalevacaturebank-blue.html`. The native feed renderer selects `HtmlEmbedDataTeaser.d/e` as light/dark HTML. Hide ads now drops that commercial teaser before its WebView is created; unknown/editorial embeds, links, commented-out markup, other widget paths and deceptive host suffixes are retained.

Seen in the publisher APK: the home, region and football-center section coroutines call `MainActivity.E(ContentType, String, Llmg)` to resolve automatic marketing. The legacy path in `nja.y` creates Temptation HTML flows separately from the two resolvers suppressed by the initial port. The follow-up stops this optional automatic entry point for Skip consent screens, Hide Premium banner and Read full articles. All three original caller bodies and manual authentication paths remain pinned. Attribution of the user's full-screen HTML login offer to this automatic path is an inference pending the next phone test; no timer or precise user trigger was established.

The inspection briefly opened ED and selected Eindhoven. The user's phone was then left alone, and the temporary WebView forwarding socket was removed. No app data was cleared and no consent/account state was changed.


## ED empty listening carousel follow-up (2026-10-31)

The user reproduced a blank, horizontally scrollable row between the featured
podcast and My favourites. Its cards were clickable but opened the generic
retry screen. Native Frida proof inside ED confirmed UID 10840, and the
focused capture observed `ao.a` and `kz.c` requesting the literal
`detailepisode_1`, followed by Amalia HTTP errors with `{"message":"Not found"}`.

This row is a loading fixture, not advertising. The publisher's `c6d.a`
creates `detailepisode_` sample IDs; `ibd.h` contains eight copies of the
fixture card. The Continue Listening mapper (`nw.invokeSuspend`, branch 1)
returns null for an empty history list. `n88` interprets that null as
`ibd.h` plus loading=true, conflating empty content with pending content.

The independent **Hide empty listening carousel** control guards only the
loading parameter of `s99.g(Lix;IZLxe7;ZLyg3;I)V`. It returns before opening
any Compose group for loading=true; loading=false branches to the original
first instruction through an explicit ExternalLabel. The full original
renderer remains intact, including real history, callbacks and playback.
The other podcast carousels are not changed. The ED preservation baseline
now includes all 58 original methods of this shared utility class, bringing
the total to 1,499 original methods and 85 allowed-edit specifications.

The equivalent live guard removed the blank row on the connected phone,
and the user confirmed the visible fix. The user then played a real podcast episode, returned to Luister, and
confirmed that a real resume card appears and works. The same in-UID capture
observed loading=false entering the retained renderer and requests for the
real episode ID `38440282`. Both empty-history and populated-history behavior
are therefore confirmed on the connected phone. Instrumentation is private diagnostic tooling and is not
included in the released patch bundle.
