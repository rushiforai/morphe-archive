# Published v1.6.1 remote-source acceptance

[Release v1.6.1](https://github.com/pengusto/penguin-patches/releases/tag/v1.6.1)
was published by [successful workflow 41066785073](https://github.com/pengusto/penguin-patches/actions/runs/41066785073).
MPP SHA256: `dc0b8fbc780befbbc6c25d5a448b6f21b4b285fe6dfea47529d87a5d4a0cc81b` (385063515 bytes), independently matching the GitHub asset digest.

## Actual Manager source and exports

Manager2.2.0 downloads the source through its normal Sources → Update action.
[Its remote cache](remote-source.json) has exactly the released MPP hash; the
original1.0.1 APK cache remains pinned. The original local1.5 source is disabled
during these tests. No source file, Manager database or HTTP cache is injected
or cleared. A previously saved7/7 selection is explicitly reset using Disable
all → Enable recommended patches: [recommended selection is0/7](recommended-selection.json),
with unrelated universal patches0/5.

Both actual UI apply/export/Install/Open cases have fresh runtime logs and
[verified retained entries, fixture signer, uncompressed native libraries and16KiB alignment](verified-manager-suite.json).
Each installed APK matches its export and has a fresh successful Android
PackageInstaller session. Android uses its normal silent owner-update path;
the earlier same-key reapply separately records an explicit UPDATE dialog.

| Actual UI case | Exported and installed APK SHA256 | Native SHA256 |
| --- | --- | --- |
| [Player only / JVM](case-32-jvm.json) | `c60e6f8787aa32704ce482c6593a77a4a5581900b0f895aaa54899cfa947b08b` | `639130f60e15ca29cbb452f1daafd84456a634d6743aa61b5c6ba277999722a2` |
| [All seven / ART](case-127-art.json) | `16c67b6439578bc219ab349dc8d48618fa5ba10678d6d3f398f822f2b70dca47` | `9521f73e4a9281b90d42033f675138bddb3afd9387e1e5ce6331070f0df2dfd3` |

These are two released-source Manager cases. The separate complete six-case
local suite remains bound to candidate72921cf8… in the [parent evidence](../README.md).
Fresh released Player-only raw screenshots replace the direct README after
preview, with all Output/Queue/Lyrics and Lyrics-menu routes exercised again.

## Published artifact verification

All127 actual Desktop1.19.1/Patcher2.0.1 applications pass again against this
published MPP ([full results](desktop-matrix.json)); all four altered inputs
fail through a selected patch without an output ([guards](rejections.json)).
The official release workflow also reconstructs all127 native payloads before
and after its build; [the extracted successful log lines](release-native-checks.txt)
record both full passes.

[Exact ZIP-entry identity](asset-identity.json) proves every one of the127 PFDs,
the native manifest, all seven previous MPEs and all five Finamp JVM classes
match the fully tested72921cf8… candidate. The official build also changes
12 other app PatchKt classes and `classes.dex`, as well as the manifest. Whole
MPP identity is not claimed. The final Desktop and Manager checks above use
the published artifact. [Native output hashes](native-verification.json) are
explicitly bound by byte-identical resources to the earlier complete local
replay; that binding is not described as a new local replay.

## Retained fixture and cleanup

The final cold-started full127 ART installation retains login, Dark theme,
Metadata order, hidden bottom actions, disabled gestures and22 complete downloads
(8 tracks/14 images,0 failed). [Every downloaded file and the23-byte artist
preference box remain byte-identical](retained-files.json); [actual UI state](retained-settings.json)
is captured separately. No data clear, uninstall or app database edit occurs.

[Cleanup](cleanup.json) restores the original local source and name, the original
ART setting, demo state and display configuration, removes only owned temporary
device files, and stops only the fixture and emulator started by this task.
The existing signing key and other AVDs are preserved.

Scope: synthetic Android15/API35 ARM64 emulator. Physical phones, OEM behavior,
other versions, real-library performance and signing-certificate migration are
outside this record. No APK, MPP, signing key or private app-data archive is committed.
