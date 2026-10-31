# Reviewed player menu — 2026-10-30

The existing optional **Keep player output controls accessible** patch now
backports final upstream PR #1836, commit
`0092a0593a9d69dfc461834d0e4e6c580d112379`, to the pinned original Finamp1.0.1
universal APK. Native feature source: `8b4adc590944ddd177d3fdc42bf47518b3eb0c9d`.

## Raw installed-APK comparison

| Original native code | Manager Player-only export |
| :---: | :---: |
| <img src="player-before.png" width="300" alt="Original player menu without hidden action routes"> | <img src="player-after.png" width="300" alt="Output, Queue and Lyrics at the menu bottom"> |

Both raw, unedited ADB PNGs use the same synthetic track paused at00:17, Dark
theme, hidden bottom actions, disabled gestures, profile0, 1080×1920/density320
and demo clock09:41. XML and individual PNG hashes accompany both images. The
original-code baseline keeps every retained official APK entry and uses the same
disposable signer for update testing. The after APK was patched, exported,
installed through Manager Install → Android PackageInstaller and opened through
Manager. Android completed this later owner update silently; a fresh successful
session and the installed APK hash confirm it.
Its installed APK hash matches the export. No app data was cleared.

The original APK is SHA256
`0fc61e5cb80d37b10a735851c2217cbc855b3f1a04bde577187658531ffef581`.
The pre-publication integrated local candidate is SHA256
`72921cf82a2a0787e5597721fa9e9291751e3f316e85614047593142df3eda12`.
It retains the current dev Mihon/Komikku additions and all seven prior MPEs.
The primary after captures now use the actual released1.6.1 Manager export,
SHA256 `c60e6f8787aa32704ce482c6593a77a4a5581900b0f895aaa54899cfa947b08b`.

## Verified scope

- All64 affected native compositions rebuilt after their full source tests:
  4,096 overlapping executions, 101 tests in mask127. The same27 focused
  regressions yield5 pass/22 fail before and27 pass after. The other63 nonempty
  payloads remain byte-identical. Both published source diffs recreate the exact
  source tree; all128 public source refs match the matrix.
- All127 native replays and all127 real Morphe Desktop1.19.1/Patcher2.0.1
  applications pass; only ARM64 libapp.so changes in retained APK contents.
  Four unsupported-input cases fail through a selected patch without an output.
- Manager2.2.0/Patcher2.0.1 Player-only JVM export has the expected native hash,
  verified fixture signer, uncompressed native entries and16KiB alignment.
- Actual Output, Queue and Lyrics routes open and return. The Lyrics menu has
  Output and Queue, with no recursive Lyrics route. Five actual disabled-gesture
  swipes retain route and track. Player artwork secondary mouse input opens the
  same three-action menu; its coordinates come from fresh accessibility bounds.

## Complete local Manager and retention acceptance

[The independent six-case verifier](manager-verification.json) passes JVM masks
32,64,96,127,31 and ART127 against candidate72921cf8… . Each actual UI selection,
apply and Save has a fresh runtime log, native output hash, original-APK cache
check, verified fixture signer, uncompressed libraries and16KiB alignment.
Unrelated universal patches remain0/5. The selected Player32 ART engine fault
offers no Save/Install and identifies the selected patch; the finally-restored
original cache permits a fresh, fully verified ART32 recovery.

[Compact acceptance](visibility-results.json) passes with the hide preference
false and the bottom row automatically hidden at1100×680. Each of Output, Queue
and Lyrics is scrolled into a reachable area, opened and dismissed. Display and
prior preference are restored. The existing pinned header and navigation bar
mean the actions need not all fit at once. The visible-row portrait comparison
uses the same native639130f6… code and has no menu duplicates.

[The same-key chain](update-removal-reapply.json) passes127→31→original0→127.
Manager performs the patched updates; original0 is the explicitly labelled
re-signed original-code adb install-r fixture. The final reapply uses a fresh
Manager export, actual Android UPDATE confirmation and Manager Open. Every stage
retains login, Dark theme, hidden actions, disabled gestures,22 completed
downloads (8 tracks/14 images,0 failed), their exact hashes and the23-byte artist
preference box. Metadata order is visible whenever bit2 is present and returns
after original0. No data clear, uninstall or database edit occurs.

The full127 update also completed through Android's normal silent owner-update
path; its fresh successful session and installed/export hash are recorded.
The separate final reapply includes the explicit UPDATE dialog.

## Released remote-source acceptance

[Published v1.6.1 acceptance](released-1.6.1/README.md) passes the normal source
download/hash, Player32 JVM and full127 ART apply/export/Install/Open, all127
actual Desktop selections and all four guards. The final cold start preserves
login, preferences,22 exact download files and the artist preference box.
Released raw after screenshots now back the primary README comparison.

MPP SHA256: `dc0b8fbc780befbbc6c25d5a448b6f21b4b285fe6dfea47529d87a5d4a0cc81b`.
This evidence covers a synthetic Android15/API35 ARM64 emulator; physical
phones, OEM behavior, other versions, real libraries and timing/RAM claims are
outside this record. No patched APK, signing key or private app-data archive is
committed here.

## Same-size ART output regression

Morphe2.0.1 eager raw-resource decoding compares file metadata. All current
original/patched libapp.so files have the same22283144-byte length. The supplied
Android filesystem-only probe on the separate isolated Artist API35 AVD5586
demonstrates10/10 same-tick NIO file times; java.io.File milliseconds can already
differ. This probe changes no app state. Player UI evidence uses AVD5580.

The output marker uses NIO before and after writing, sets a distinct FileTime
without sleeping, and fails the selected patch if the change is undetectable.
VerifyNativeOutput.java exercises the real Patcher snapshot/detection methods:
[marker omitted](output-tracking-before.txt) fails;
[marker enabled](output-tracking-after.txt) passes3/3 with exact bytes preserved.
The Release workflow runs this regression before publishing. All seven prior
MPEs and all127 native payloads remain unchanged by this packaging correction.
