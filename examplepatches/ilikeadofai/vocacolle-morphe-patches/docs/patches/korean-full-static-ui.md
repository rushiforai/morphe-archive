# Korean full static UI pass

## Outcome

This pass translates every app-embedded, user-visible static UI resource identified in
VocaColle 7.40.0 (`jp.nicovideo.nicobox`, `versionCode 177`) while leaving server
content and non-UI protocol data unchanged.

The validated patch set contains:

- **1,607 string resources**;
  - 1,118 Japanese app UI strings;
  - 489 English app/library/SDK UI strings;
- **3 plural resources** with 6 quantity items;
- **1 string array** with 7 playback-speed items;
- **8 method-scoped DEX literal replacements**.

The catalog contains 1,620 rows because plural and array items are recorded
individually. The existing 68 user-approved translations are preserved as
`approved`; new entries are marked `machine_verified` after translation review and
structural validation.

## Scope

The resource overlay covers launcher metadata, navigation, Home, Search, Library,
rankings, playlists, player controls, cache/download flows, account/login, premium
membership, settings, notifications, errors, inquiry UI, accessibility labels,
Google/Material/Media3 UI, and bundled advertising UI resources.

The DEX patch translates eight literals that are not Android resources:

- three first-party Proseka screen strings;
- `다운로드` in two ByteDance landing activities;
- an external-link dialog title plus its confirm/cancel labels.

## Deliberate exclusions

The pass does **not** translate:

- server-delivered titles, descriptions, rankings, playlist names, tags, and errors;
- search query semantics such as `VOCALOID オリジナル`;
- server-label comparisons such as `厳選プレイリスト`;
- social hashtags and filenames whose exact spelling is functional data;
- Compose preview/mock fixture strings;
- URLs, API/OAuth keys, class names, product IDs, motion paths, and format-only units;
- `user_report_subject` and `user_report_inquiry_message`, which are support/report
  payload text rather than screen UI;
- other inquiry/support payload constants embedded directly in DEX.

The original default resource configuration remains intact as the fallback.

## Generation and review pipeline

[`translations/ui/ko.csv`](../../translations/ui/ko.csv) is the single reviewed
catalog. [`scripts/generate-korean-static-ui.py`](../../scripts/generate-korean-static-ui.py)
deterministically generates:

- `values-ko/strings.xml`;
- `values-ko/plurals.xml`;
- `values-ko/arrays.xml`.

The generator preserves Android format tokens, line breaks, XML escaping, and the six
original bold spans. Resource files are split by type because the ARSCLib resource
coder infers the resource type from the XML filename.

Machine translations were reviewed in a second GPT-5.5 pass. Exact duplicate source
strings were normalized to one Korean result. Deterministic checks reject missing or
reordered format tokens, newline changes, duplicate identities, empty targets, and
Japanese leakage.

## Automated validation

The following checks pass:

- `./gradlew :patches:test buildAndroid`;
- CSV identity and count checks for all 1,620 rows;
- CSV-to-generated-XML equality;
- exact format-token and newline preservation;
- six styled `<b>` spans;
- plural quantity and array ordering;
- exact compiled `ko` value equality for all 1,607 strings via `aapt2`;
- exact compiled equality for all three plurals and the playback-speed array;
- zero missing, unexpected, or mismatched Korean resources;
- preservation of all 9,372 original resource entries and IDs;
- ZIP integrity and alignment;
- APK Signature Scheme v2/v3 verification;
- package `jp.nicovideo.nicobox`, version `7.40.0 (177)`;
- `dexdump` success for all eight rebuilt DEX files;
- exact presence of all eight Korean DEX literals and absence of their Japanese
  originals in the patched target methods.

The SDK cross-reference verifier reports four missing Amazon PrivacyPass types already
referenced by the base APK and supplied outside the analyzed base/split classpath. The
`STRIP_SAFE` path in Morphe 1.6.1-dev.1 also throws a patcher-side
`ConcurrentModificationException`, so the accepted APK uses `FULL` bytecode rebuild
mode. DEX structure and the exact patched methods were verified independently.

## Artifact

Final run:

```text
artifacts/7.40.0/2026-07-23_012829-full-static-ko-final/
```

Input APK SHA-256:

```text
9228fd05e21a910821108d0ef050040b3ce2f30354170bc41db3b39d90121164
```

MPP SHA-256:

```text
22b7e0c10ac97afd8ed284e123e97060196cb17409fd13f969a8e979ab95ae8f
```

Patched APK SHA-256:

```text
18ac91606d8f4f1b091238915f544bcae1de7049918f3ac5b5552a54cdb046da
```

The signer certificate SHA-256 is
`05d2c582ff170341367dfa20a5744af45302133af7a680bcfc888a98a00699d4`,
matching the existing Waydroid development-signed installation.

Machine-readable verification files are stored beside the APK:

- `compiled-resource-verification.json`;
- `structured-resource-verification.json`;
- `apk-structural-verification.json`;
- `dex-literal-verification.json`;
- `waydroid-install-verification.json`.

## Waydroid verification

An initial base-only call through Waydroid's non-root IPlatform binder returned `0`,
but that value only confirmed that the binder request was accepted. It did not prove
that Android Package Manager had accepted the split-package update. Visual inspection
showed the previous 68-resource build was still installed.

The final APK was then installed atomically with the four existing development-signed
configuration splits:

```text
split_config.en.apk
split_config.ko.apk
split_config.tvdpi.apk
split_config.x86_64.apk
```

The root Waydroid package-manager command returned the explicit result `Success`.
After relaunch, `waydroid.active_apps` remained `jp.nicovideo.nicobox` for every
sample over five seconds. Manual inspection confirmed the ranking period resources
changed from `毎時 / 24時間 / 全期間` to `매시간 / 24시간 / 전체 기간`.

The ranking period dropdown is still positioned at the left edge of the portrait
compatibility viewport instead of below its right-aligned anchor. The manifest forces
`screenOrientation=portrait`, while Waydroid tiles the activity inside a 2542×1392
landscape window with side letterboxing. The popup remains inside the same Waydroid
surface, so this is recorded as a Waydroid/Android size-compat popup-coordinate issue,
not a translation or host-window placement regression.
