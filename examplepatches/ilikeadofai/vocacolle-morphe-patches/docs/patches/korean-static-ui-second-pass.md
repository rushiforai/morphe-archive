# Korean static UI — second pass

## Scope

The second static Korean UI batch adds 50 reviewed strings to the existing 18,
for a cumulative total of 68 Korean resources. The new batch covers:

- VocaColle event and playlist headings on Home;
- Home ranking, social, birthday, and introductory labels;
- search settings, genre filtering, and apply/cancel actions;
- all simple search sort labels;
- keyword/tag search labels and result coaching text.

The cumulative source/target inventory is tracked in
[`translations/ui/ko.csv`](../../translations/ui/ko.csv). Rows from this batch
are marked `UI batch 2 verified in Waydroid`.

## Excluded risky resources

The batch deliberately excludes resources that require additional handling:

- `%s` or `%d` format arguments;
- resource references such as `@ref/0x...`;
- suffix fragments whose Korean grammar depends on surrounding text;
- JASRAC and NexTone permission identifiers;
- unchanged English labels such as `PICK UP`.

These resources must not be translated until their call sites, argument order,
and composition rules are verified.

## Safety properties

- The original Japanese `default` resources remain unchanged.
- Only `res/values-ko/strings.xml` is added.
- Untranslated strings continue to fall back to Japanese.
- The APK's five DEX files remain byte-for-byte identical to the original.
- No network, authentication, playback, database, or app-data code is changed.
- At the time of this pass the patch remained opt-in; current bundles select it
  by default. The target remains restricted to `jp.nicovideo.nicobox` 7.40.0.

## Automated verification

The catalog test was expanded before the resource file, producing an expected
RED failure because the XML still contained only 18 entries. After the 50 new
resources were added, the same test passed with the exact 68-entry catalog.

The following checks passed:

- complete Gradle patch test suite;
- exact Kotlin test catalog to XML equality;
- absence of Japanese characters in Korean values;
- exact XML to compiled APK `ko` resource equality for all 68 entries;
- Japanese default fallback (`search_config=検索設定`);
- package, version name, and version code;
- ZIP integrity and alignment;
- APK Signature Scheme v2 and v3;
- stable development signer certificate;
- byte identity of all five original DEX files;
- Morphe `PATCHING`, `REBUILDING`, and `SIGNING` stages.

## Artifacts

Patch run:

```text
artifacts/7.40.0/2026-07-22_234646-static-ko-ui2/
```

MPP SHA-256 used for the run:

```text
10c49f77e7b49004dc7d78e55a84cc07469deab492ac9dc0fd1efa93f05d388b
```

Patched base APK SHA-256:

```text
47bd8f4e22e4728ecb2840b32012b03b69f836360648c47031b31ff43817aaf8
```

## Waydroid verification

The new base APK and the four existing development-signed split APKs were
updated atomically with `pm install -r`. The installed package retained:

```text
versionName=7.40.0
versionCode=177
primaryCpuAbi=x86_64
```

Manual verification on 2026-07-22 confirmed:

- second-pass Home strings are displayed in Korean;
- search settings, filters, sorting labels, and actions are displayed in Korean;
- search still executes normally;
- the application starts and operates normally.

## Result

The Home and Search second-pass batch is accepted. The next static resource
batch should move to Library, Ranking, player controls, or common dialogs while
continuing to exclude formatted and context-composed resources until their call
sites are audited.
