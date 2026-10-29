# Read You #1143 — actual APK comparison

Unedited Android device PNGs. The same synthetic three-feed [OPML fixture](nested.opml)
is imported into the same outer group. The original imports one feed; the actual
Morphe Manager export imports all three. Nested group hierarchy remains flat.

| Original payload | Actual Manager export |
| :---: | :---: |
| <img src="before.png" width="300" alt="Before: only Reader releases was imported"> | <img src="after.png" width="300" alt="After: Reader releases, Studio journal and Chapter notes were imported"> |

[Provenance and hashes](provenance.json) identify exact source/APKs, device,
settings and input. XML companions are fresh device accessibility hierarchies.
The before APK is the official payload resigned with the disposable test key;
its non-signature entries are unchanged. No screenshots were edited or generated.

The source fix passes all 13 app unit tests; the original fails two nested-import
regressions. Manager selection/application/export, common-key installation and
retained app data were verified. All 16,342 class digests match Desktop output
despite different DEX partitioning; existing six runtime modules are unchanged.
The fixture group's removal between the two imports uses the app's normal UI;
the unrelated release subscription, account and settings stay intact.

The initial app setup also exposed a separate pre-existing startup race; its
stacktrace is retained privately and is outside this import patch. Physical
devices and remote subscription-service accounts are outside this acceptance.

[Actual Manager JVM/ART acceptance](manager-acceptance.json) includes exported
APK hashes and new runtime logs. Same-key original-code removal and patch
reapplication both preserve all three imported subscriptions and DataStore bytes.
