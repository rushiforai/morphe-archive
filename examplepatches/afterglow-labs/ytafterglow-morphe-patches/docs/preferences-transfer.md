# Preferences transfer

About exports `YTAfterglow-preferences.ytagprefs` through Android's document
picker. Import asks for confirmation, then replaces only Afterglow's preference
domain. Cancel leaves the current setup intact. The file uses the iOS
`YTAfterglowPreferences` version-1 envelope; a plain preferences dictionary is
also accepted, matching `YTAGUserDefaults.importPreferencesData:`.

The codec reads XML and binary property lists. It checks lengths, offsets,
references, dictionary keys and nesting before committing a replacement. Files
are bounded to eight MiB and expanded structures are bounded as well. Invalid,
truncated, cyclic or oversized files leave the current preferences unchanged.
External DTD processing is disabled. No classes named by an archive are loaded.

Archived UIColor data is decoded through the same `UIRed`/`UIGreen`/`UIBlue` or
`UIWhite` channels and alpha used by the iOS theme decoder. Android stores the
result as ARGB. New Android colors export as UIKit keyed-archive data. Saved
themes and the semantic theme record convert between plist arrays/dictionaries
and Android's JSON storage. Active tabs keep their order and follow the existing
canonicalization, deduplication and minimum-count rules. Scrubber PNGs use the
existing bounded image normalizer.

The importer retains original data, dates, nested values and precise numbers in
a private preference record. An export reuses an original only if its converted
Android value still matches the recorded fingerprint. Edited or removed native
values take precedence. Values without a current Android runtime representation
remain available for later export; importing them does not implement an unported
feature. The private record never appears in an export, and full reset clears it.

Strings ending in a newline use private marked encoding inside SharedPreferences.
Android's indented XML serializer otherwise adds four spaces when reloading such a
value. Native reads and snapshots decode it; ordinary text and literal Base64 stay
unchanged. Markers are never exported or accepted from imported files, and edits,
removal and reset clean them up atomically with their values.

`python3 -B -I tools/check_preferences_transfer.py` runs 103 checks using the real
code, KXML and in-memory Android storage. Python's independent `plistlib` verifies
XML/binary round trips and edited exports. The checks include nested saved themes,
binary and XML color archives, exact opaque data, precise numbers, Unicode,
malformed/cyclic input, size limits, atomic rejection and reset. KXML is a test
dependency already supplied by the local Gradle cache, or selected by `KXML_JAR`.
The installed Android SDK's `FastXmlSerializer.java` (or `ANDROID_SERIALIZER`)
reproduces the final-newline persistence defect and verifies the corrected reads.

Build95 passes strict selections 28/29/30/1/3, all 253 production input hashes,
ZIP integrity, 103 transfer checks, 427 settings checks and 438 theme checks.
15 full and 9 independent observations are visually reviewed: native picker
confirmation/cancellation, binary import/export, exact cold persistence, corrected
tabs, restored saved themes and full reset with no retained records in exports.
Development93 also verifies XML, native saved-theme rename and malformed import
atomicity. Development94's failed cold export and both source regression failures
are retained; final95 contains their corrections. Original interrupted patch
wrappers and successful fresh retries remain recorded. Final logs are clean; the
exact full APK is restored and stopped.

Evidence is recorded by execution-95.json and preferences-audit-95.json under
port-completion-20261113; delivery-95.json records the committed bundle. Physical
Android and iOS device interoperability have not been tested.
