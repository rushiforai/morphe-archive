# TaobaoLingo

[Morphe](https://github.com/MorpheApp/morphe-patcher) patch for Taobao's existing **English** Android string resources. Developed against **com.taobao.taobao 10.66.30** (ARM64). Independent of Taobao and Morphe.

> **Unverified and broken on device.** The user confirms **no UI English localization has been demonstrated**. English error/recovery pages and the Terms `Agree` button were already in English before patching. Earlier descriptions of English navigation or errors as proof of localization were incorrect. On-device tests also encountered black home content, broken Account navigation, and login problems. That broken patch and the international-edition flag overrides have been **removed from the published patch source**. Their code remains in Git history only.

## Patch in this repository

**TaobaoLingo: English resource strings** (disabled by default; independent of the Japan selector experiments).

The APK contains two string-localization entrypoints:
- `Localization.q(int)` — referenced by **909** invoke instructions in the original APK.
- `Localization.r(String)` — referenced by **7** invoke instructions.

Both are patched to read Android's bundled English resources from a **separate configuration context**. The patch does not change Taobao's global `Localization.h()` language value, `LocalizationManager.d()` locale getter, international-edition checks, user account settings or shopping-region preferences. No language is sent to an external translation service.

**Scope:** native resources with an available English translation. Dynamic pages, server-rendered text, WebViews, product names, product images, and strings not included in the English resource table are **not** translated. Japanese UI is **not yet implemented**.

## Experimental native DinamicX English labels — new development

The old `Localization.q/r` patch did not establish that any actual Taobao screen text became English. A new **opt-in** patch, `TaobaoLingo: Native DinamicX English labels (experimental)`, instead targets Taobao's **native DinamicX text components**, used with dynamically delivered screen content.

This new implementation has **108 exact-match Chinese→English interface labels**, including `我的淘宝`→`My Taobao`, `我的订单`→`My Orders`, and `搜索`→`Search`. The translation changes what native UI widgets display; **there is no OCR, overlay or remote translation service**.

Static inspection of the original Taobao 10.66.30 APK identified two DinamicX widget classes, each of which has a direct `setText(CharSequence)` path **and a separate template attribute path that writes directly to its `text` field**. The patch updates all **four** methods, guarding the template attributes by the precise `TEXT` property hash `38178040921`, so font and other attributes are not intentionally translated.

**Offline validation:** A signed 108-label Desktop CLI proof APK was created from the original Taobao APK using equivalent four-method injection instructions. Independent dexlib2 comparison found exactly **four changed methods among 595,518**, intact original instruction bodies, identical unrelated app resources, and valid APK v2/v3 signatures. The Morphe 2.0 `.mpp` also builds in CI. See [analysis and test evidence](analysis/native_dinamicx_text_binding.md) and [independent verifier](tests/VerifyDinamicXNativeLabels.java).

**This does not establish runtime success.** The screen must be compared against the *original* Chinese UI before any translation is claimed. The unresolved Account/login failure and the re-signing question still apply. Product descriptions and unknown UI labels remain Chinese. Keep the patch disabled unless deliberately testing.

## Experimental native Japan + English locale selector

Taobao's bundled onboarding dataset defines 23 regions; **JP offers Chinese only** while SG has English. The patch set also now contains two **disabled-by-default** experiments:

1. `TaobaoLingo: Show English in Japan locale picker (fallback)` — adds non-default English only to JP in `assets/boarding/data.json`.
2. `TaobaoLingo: Enable English for Japan picker (experimental)` — adds English to JP in the **server-provided `countryInfo` list**, and to `currentCountryInfo` if currently JP. This patch declares a dependency on (1), but with Morphe CLI `--exclusive` **both names must be explicitly enabled**.

Unlike the failed global locale patch, neither experiment changes protocol-facing `Localization.h()`. The server may still reject Japan + English, and the re-signed APK may still have login problems. **The experiments are not confirmed to work on a physical phone.**

An actual Taobao 10.66.30 APK was rebuilt with both enabled: all 595,518 DEX methods were independently compared and **only the intended callback changed**. Only the JP onboarding JSON changed among non-DEX resources; the generated APK passes signature verification. See the [offline validation report](analysis/japan_server_list_validation.md) and `scripts/verify_japan_picker.py`.

## How to build

The primary Gradle build produces a Morphe Patcher **2.0** `.mpp`.

```sh
# JDK 21, Gradle 9.8.1, and GitHub Packages read authentication
export GITHUB_ACTOR=your-user
export GITHUB_TOKEN=your-GitHub-token-with-read-packages
gradle buildAndroid
```

Download the latest `.mpp` from [GitHub Actions](../../actions/workflows/build.yml). In a Morphe Manager compatible with Patcher 2.0, import the patch source and enable **only** `TaobaoLingo: English resource strings` for Taobao **10.66.30**.

Morphe Desktop **1.18.1** bundles an older Patcher (1.15.1), which cannot directly load the main Morphe 2.0 `.mpp`. For independent offline verification, build the version-adapted CLI bundle with `scripts/build_legacy_cli.py`. This old Desktop bundle is **not** suitable for import in Morphe Manager.

## Offline verification (10.66.30)

**Independent binary checks completed on the original 77,255,755-byte APK.**

- Original source SHA-256: `3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd`.
- Morphe CLI with `STRIP_SAFE`: patch application, APK reconstruction and signing successful, **0 failed patches**.
- Compared **595,518** implemented methods: **exactly 2** have altered instructions (`Localization.q` and `Localization.r`).
- The original instruction sequences are preserved after the inserted prefixes, along with the original method register counts and exception-handler counts.
- Original networking, account/edition language getters and all non-DEX, non-signature APK contents are unchanged.
- APK ZIP integrity and Android v2/v3 signatures verified. **The signing certificate is different from Taobao's original.**

Details: [latest binary verification](analysis/two_string_resource_validation.md), [runtime regression tracking](../../issues/1), and independent offline verifier `tests/VerifyLocalizedResources.java`.

**Important limitation:** No English localization has yet been demonstrated by the user on a physical phone. English error/recovery screens and Terms Agree buttons were already English. APK signature validity proves only the repackaged file is structurally sound. It does not prove that Taobao will accept a different signing certificate, log in, communicate with its servers, or render usable pages. **The login failure is not resolved yet.**

Morphe's official [Root mount](https://github.com/MorpheApp/morphe-manager/blob/main/docs/installers.md) avoids installing a re-signed APK, keeping the original app installed under its original package identity, but requires a rooted phone; ordinary installation does not have this property. No assumption is made that your phone is rooted.

## Executed Android native text fixture (not Taobao)

The real Morphe Patcher 2.0 DinamicX patch has now been **applied to a
synthetic Android 15 test APK and executed successfully**, rather than
only inspected as DEX. The [passing emulator CI run](https://github.com/GoodLight999/TaobaoLingo/actions/runs/39945857529)
confirms English output through both `setText` and the DinamicX TEXT-attribute
methods, including `SpannableString` inputs. It also checks negative controls
to avoid translation of non-text properties or unmatched labels. Full results
and evidence are in [the native runtime verification report](analysis/native_fixture_runtime_verified.md).

**This is a controlled fixture, not Taobao itself.** Real Taobao UI English
localization, Account navigation, login and anti-tamper compatibility
remain unresolved and are not implied by this result. Use Morphe Desktop
**1.19.0 stable** for the Patcher 2.0 desktop fixture test; dev.4 exhibited
a constructor ABI mismatch.

## Morphe registered URL and releases

**Stable registered source/feed URL:**
`https://raw.githubusercontent.com/GoodLight999/TaobaoLingo/main/patches-bundle.json`

The feed contains a `download_url` pointing at the **latest published**
`TaobaoLingo.mpp` release asset. Do **not** register a commit-specific
GitHub Actions artifact URL as a permanent update source. The
`.github/workflows/publish.yml` workflow publishes the release on changes
to production `patches/**` merged into `main`, then updates this same feed
URL. This is the normal publishing path; diagnostic reports alone need not
generate new source releases. If the manager caches the feed, refresh its
patch source/check for updates.

**Safety boundary:** Published bundles include the experimental DinamicX
labels patch **disabled by default**. Its only verified real-Taobao result is
an APK with four expected bytecode method changes and valid signatures.
Taobao on-device English UI, Account navigation and login have **not**
been shown to work. Publishing a patch source is not a runtime fix.

## Optional DinamicX subclass text hooks (2026-10-24)

Original-APK bytecode analysis found **24** `DXButterTextWidgetNode`
subclasses that store raw TEXT attributes in independent String/CharSequence
fields. The conservative four-hook patch modifies only the parent widget's
parameters, **not** these subclass-owned fields.

A **separate, disabled-by-default** patch,
`TaobaoLingo: Extended DinamicX subclass English labels (experimental)`,
translates the input TEXT attribute (hash 38178040921) **before** the 24
subclass field writes. It is meant to be enabled together with the original
DinamicX English label patch for a **28-method** experimental build.

The [full real APK verification](analysis/real_apk_24_subclass_extension_20261024.md)
confirmed Morphe successful patching, Android v1/v2/v3 signing, and exactly
**28 expected method changes among 595,518**, without altering unrelated
application bytecode, libraries or resources.

**Neither the 24 extended methods nor real Taobao's visible UI have been
runtime-validated on ARM64.** This extension does not claim to fix Account,
login, network restrictions or server-side dynamic template selection.
Keep it disabled unless deliberately comparing experimental variants.

## Real Taobao APK: verified patch/control builds (2026-10-23)

The exact user-supplied Taobao 10.66.30 ARM64 APK was **successfully rebuilt**
with the actual production Morphe 2.0 DinamicX patch in `STRIP_SAFE` mode.
A separate Morphe **zero-patch control** was also rebuilt from the same
original, then both APKs were signed with the **same** diagnostic identity.

Android SDK `apksigner` verified each APK (v1/v2/v3). Independent method
comparison over all **595,518 implemented methods** found **exactly four**
modified methods for the DinamicX native-label patch. The zero-patch
control retains all original app code/resources unchanged. See the
[completed real-APK forensic matrix](analysis/real_apk_patch_matrix_verified_20261023.md)
and [one-command offline reproduction script](scripts/reproduce_real_apk_safe.sh).

`FULL` rebuilding was also tested but failed the four-method-only invariant:
**1,183 method representations differed**, so `STRIP_SAFE` remains the
recommended experimental format.

**No actual Taobao user-visible English localization, working Account tab
or login has yet been demonstrated.** Binary correctness alone cannot
establish runtime behavior or server acceptance of a different signer.
Real Taobao APKs and diagnostic signing keys are never published here.

## Binary-difference diagnostics (native app only)

The reproducible [APK triage protocol](analysis/apk_triage_protocol.md) separates the
original Taobao APK, a **re-signed-only/no-patch control**, and a DinamicX-patched
APK under both `STRIP_SAFE` and `FULL` rebuild modes. It also inventories
native ELF/JNI symbols and statically follows DinamicX text-writer call sites.
The matrix requires the exact original APK (SHA-256 pinned in the protocol);
this repository contains **no proprietary Taobao binaries**.

The diagnostic scripts and synthetic fixtures run in CI, but those tests
**do not establish** real Taobao login, working Account navigation or any
visible English localization. All remain unverified.

## Offline reproduction

```sh
python3 scripts/verify_apk.py original-Taobao-10.66.30.apk --strict-hash
python3 scripts/build_legacy_cli.py \
  --desktop-jar morphe-desktop-1.18.1-all.jar \
  --out /tmp/taobaolingo-legacy.mpp

java -jar morphe-desktop-1.18.1-all.jar patch original-Taobao-10.66.30.apk \
  --bytecode-mode=STRIP_SAFE --exclusive \
  -p=/tmp/taobaolingo-legacy.mpp \
  '-e=TaobaoLingo: English resource strings' \
  -o=/tmp/taobaolingo.apk

javac -cp morphe-desktop-1.18.1-all.jar tests/VerifyLocalizedResources.java
java -cp tests:morphe-desktop-1.18.1-all.jar \
  VerifyLocalizedResources original-Taobao-10.66.30.apk /tmp/taobaolingo.apk
```

The proprietary Taobao APK is **never checked into this GitHub repository**. The `overlay/` work from earlier experiments is not part of the Morphe patch or its development plan.

## License

GPL-3.0-only for TaobaoLingo's original patch code. Unaffiliated with Alibaba, Taobao, and Morphe.
