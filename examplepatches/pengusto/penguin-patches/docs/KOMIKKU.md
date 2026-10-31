# Komikku local exclusion search

Choose **Keep local manga in exclusion searches** for the official GitHub
**Komikku 1.14.1 ARM64** APK (`app.komikku`, version code 81). The patch is
optional and off by default.

Searching the library for `-meteor` should retain a local manga named **Orion**
and exclude a local manga named **Meteor**. The released app instead drops
both local entries. Its negative-text predicate requires a non-null numeric
source ID, while Local Source deliberately has no searchable numeric ID.

The patch lets that missing ID continue through the remaining exclusion
checks. Matching titles and tags are still excluded, remote numeric source
matching remains intact, and `src:local` still works. It replaces one DEX
branch in place and adds no runtime extension, preference, database migration
or new app setting.

[Before / after](PATCH_EXAMPLES.md#keep-local-manga-in-exclusion-searches) ·
[Acceptance and raw captures](../tests/komikku/evidence/2026-10-30/README.md)

## Original input

[Official release asset](https://github.com/komikku-app/komikku/releases/download/v1.14.1/Komikku-arm64-v8a-v1.14.1.apk)
from [v1.14.1](https://github.com/komikku-app/komikku/releases/tag/v1.14.1).

- File: `Komikku-arm64-v8a-v1.14.1.apk`, 40,915,941 bytes.
- SHA-256: `5dec6178557c89944bf2ef0b5059a5c36a5ab8ebf74dab92fa9281997879d2e2`.
- Original signing certificate SHA-256: `cbec121aa82ebb02aaa73806992e0368a97d47b5451ed6524816d03084c45905`.
- Source release: `e30ff83265d7affcc14e172ea9eadf469db1f4aa`.

Use the original APK as the Manager input. An exact library-class digest rejects
changed or already-patched code. Other APK versions and variants have not been
accepted for this patch.

For an existing official installation, follow the [signing and backup guide](SETUP.md)
before installing a differently signed APK. Acceptance uses disposable data and
a shared test signing key so original, patched and restored-original payloads
can update each other without uninstalling.

## Upstream

[Focused upstream PR #1949](https://github.com/komikku-app/komikku/pull/1949)
contains the source correction and eight regression tests
([tested commit](https://github.com/pengusto/komikku/commit/86c0acaee96b4f76bcdb3965727dcbd2169ee514)).
The current contribution branch and the maintained stable release retain the
faulty null guard. The adjacent [PR #1128](https://github.com/komikku-app/komikku/pull/1128)
changes source-name/language matching and retains it too. Applying that PR's
source-name replacements to current master still fails the two local-ID cases.
The focused source change passes all eight cases and all 77 release unit tests.

The [dated audit](../tests/komikku/evidence/2026-10-30/upstream-audit.json)
records exact refs, the six overlapping open PRs and the behavior-check method.
In issue #1106, the maintainer first reported working source-name search and
[then confirmed the failure](https://github.com/komikku-app/komikku/issues/1106#issuecomment-3200705440).
His human comment on #1128 requests a Gemini review; the parsing advice there
comes from the bot. Source-language parsing is outside this correction.

## Verification scope

Source: `spotlessApply`, `spotlessCheck`, `assembleDebug` and the complete
`testReleaseUnitTest` task. A structural APK regression checks all 377 predicate
instructions, including the three incoming branches, and allows only the intended
null-edge change. It rejects the earlier insert/delete prototype that crashed.

The evidence report identifies the actual Manager runtime, original-cache hash,
export signature, installed APK hash, search results and persistent-state checks.
Only synthetic offline data is used; no online extension or account behavior is
claimed.
