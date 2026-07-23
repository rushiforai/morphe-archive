# Korean static UI — first pass

## Scope

The `Korean static UI` resource patch adds a Korean locale overlay for 18
reviewed VocaColle 7.40.0 strings. It covers:

- launcher app name;
- five bottom-navigation labels;
- home, library, ranking, and search screen labels;
- four home recommendation headings;
- four search entry labels/messages.

The approved source/target inventory is tracked in
[`translations/ui/ko.csv`](../../translations/ui/ko.csv).

## Safety properties

- The original Japanese `default` resources are not modified.
- The patch adds only `res/values-ko/strings.xml`.
- Missing Korean resources continue to fall back to Japanese.
- The patch has no bytecode fingerprint, extension, network code, or app-data
  migration.
- At the time of this pass the patch was opt-in; current bundles select it by
  default. The target remains restricted to `jp.nicovideo.nicobox` 7.40.0.

## Automated verification

The patch was developed test-first. The test verifies:

- patch name, then-current opt-in default, package, file type, and app version;
- the exact set of 18 Korean resource keys and values;
- absence of Japanese characters in the approved Korean catalog.

Build command:

```shell
./gradlew --no-daemon :patches:test buildAndroid
```

Verified MPP SHA-256:

```text
59b1e2b1e437f404166c0ce79eab6546c92a8fdbac8e48aaa7bc4f42a6b028d0
```

## Patched APK verification

Artifact run:

```text
artifacts/7.40.0/2026-07-22_233112-static-ko/
```

Patched base APK SHA-256:

```text
57a69a443e57f8fa2281502c0d63b2255f9e1d8dbf1128e7affb29146308a41a
```

Checks passed:

- package `jp.nicovideo.nicobox`;
- version name `7.40.0` and version code `177`;
- Korean string configuration is present;
- all 18 Korean values are readable from the compiled resource table;
- default `bottom_navigation_home` remains `ホーム`;
- all five DEX files are byte-for-byte identical to the original APK;
- ZIP integrity and APK alignment;
- APK Signature Scheme v2 and v3;
- signer certificate matches the stable local development key;
- Morphe `PATCHING`, `REBUILDING`, and `SIGNING` stages all succeeded.

## Waydroid verification

The patched base and the existing four development-signed splits were updated
atomically with Android Package Manager `pm install -r`. The installed package
retained:

```text
versionName=7.40.0
versionCode=177
primaryCpuAbi=x86_64
```

Manual verification on 2026-07-22 confirmed:

- the Korean strings are displayed;
- the application starts normally;
- normal application operation is preserved.

## Result

The first static Korean UI slice is accepted. Additional strings should be
added in small screen-oriented batches, preserving format tokens, markup,
newlines, and Japanese fallback for unapproved rows.
