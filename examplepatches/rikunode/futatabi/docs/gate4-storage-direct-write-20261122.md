# Gate 4 — Flutter board-list storage and direct-write proof (2026-11-22 JST)

**Verdict: direct board registration / catalog HTTP fetch / persistence PASS; catalog rendering FAIL; thread rendering NOT TESTED.** This is a research-only experiment on a rooted Android emulator. It does not authorize Bridge or adapter implementation.

## Setup and baseline

- Device: existing `MTManager_Debug_API36` emulator, Android API 36, `emulator-5554`, rooted via `adb root`.
- App: unpatched futatter **3.1.1**, `com.Nanasaki.ftutter`, versionCode 65, installed from the previously hash-verified 3.1.1 XAPK/split APKs.
- On the stock board-add screen, `https://may.2chan.net/b/` was entered and **successfully registered**, independently checked by matching its URL in the UI hierarchy: [may registered](gate-evidence/storage-may-registered.xml).
- Fixture on Windows at `127.0.0.1:18766`, with `adb reverse tcp:18766 tcp:18766` confirmed. This experiment did **not** touch production port 18765.

## Storage location and record format (observed)

`/data/data/com.Nanasaki.ftutter/shared_prefs/FlutterSharedPreferences.xml`

A normal Android XML SharedPreferences `<map>` with `<string name="flutter.itaList">` containing:

1. Constant literal prefix `VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu!`;
2. A **JSON array of JSON-encoded strings**, where each string encodes one object (rather than a JSON array of objects).
3. The XML serialization escapes the double quotes in attribute/text as needed.

A sample registered may-board item (original values observed) decoded from the string:
```json
{"name":"二次元裏（may）","url":"https://may.2chan.net/b/","favorite":false,"kakikomiData":null,"suretateCount":0,"sureOpenCount":0,"resuCount":0,"soudaneCount":0}
```

The old list contained 2 boards (the default cat board and the newly added may board). The local write produced 3.

## Direct-write procedure (verified, not implemented as a Morphe patch)

1. `adb -s emulator-5554 shell am force-stop com.Nanasaki.ftutter`.
2. Pull a **private test-device copy** of the existing `FlutterSharedPreferences.xml` into ignored `apk-inspection/storage/FlutterSharedPreferences.before-direct.xml` to allow recovery if the experiment fails. This raw XML is **not** committed or distributed.
3. Use Python `xml.etree.ElementTree` to find the `flutter.itaList` node, verify the exact prefix, parse the JSON array and its nested JSON strings, **clone the may entry**, set `name="AIMOGE LOCAL TEST"`, `url="http://127.0.0.1:18766/aimoge/"`, keep the other schema fields unchanged, and serialize with JSON strings and the same prefix. Reparse the generated XML and compare the final object before applying.
4. `adb push` the generated XML to `/data/local/tmp/futatabi-direct.xml`; as root, copy it into the original SharedPreferences location, restore its original `u0_a218:u0_a218` ownership, and chmod `660` while the app is stopped.
5. Start the app; inspect its UI hierarchy and fixture HTTP log; force-stop and start the app again to verify persistence.

No production data or user's real phone data were modified.

## Results

| Criterion | Result | Independent evidence |
| --- | --- | --- |
| a. Directly written board appears in board list | **PASS** | [board-list XML](gate-evidence/storage-direct-board-list.xml) shows clickable `AIMOGE LOCAL TEST&#10;http://127.0.0.1:18766/aimoge/`, bounds `[0,726][1080,946]`. |
| b. Opening board triggers a fixture catalog GET | **PASS** | [Ftutter-only access log](gate-evidence/storage-direct-ftutter-requests.log) has `GET /aimoge/futaba.php?mode=cat` with `Ftutter/3.1.1 (Android 16; sdk_gphone64_x86_64; emu64xa; x86_64)`. It fired twice during the two catalog attempts. HTTP fixture handler served this route as 200. |
| c. Existing catalog UI displays thread cells/image/title/reply count | **FAIL** | The app navigated to its native catalog screen, but displayed an **empty catalog**. Initially the fixture lacked `#cattable` ([first screenshot](gate-evidence/storage-direct-catalog-original.png)); after the fixture was changed to contain `<table id='cattable'><tbody><tr><td>...` with `res/1001.htm` link, thumbnail, `<small>` title and `<font size='2'>` count, the app still displayed no cell and showed `Null check operator used on a null value` in [UI hierarchy](gate-evidence/storage-direct-catalog-table.xml) and [screenshot](gate-evidence/storage-direct-catalog-table.png). No fixture thumbnail GET came from Ftutter, only the catalog GET. **The exact missing parsed field is unknown.** |
| c. Existing thread UI displays body/response numbers/images | **NOT TESTED** | No catalog cell was rendered to tap; no Ftutter thread GET observed. Do not infer that thread parsing fails independently. |
| d. Board persists after app restart | **PASS** | After force-stop + explicit activity launch, [post-restart UI hierarchy](gate-evidence/storage-direct-after-restart.xml) still contains the exact local board item and URL. File content also retained the item. |

## Boundaries and decision inputs

**Positive result:** the ordinary UI-registration validation can be bypassed *without touching application code* at the storage level, and the pre-existing catalog request path accepts the resulting local URL and routes it over `adb reverse`. This makes direct board registration a viable direction for the patch design in a **test environment**.

**Remaining barrier:** a correctly shaped HTTP 200 response with a `#cattable` table is still not enough for native catalog rendering: the Flutter app throws a null-check error. This identifies a later **response parsing / field expectation** issue (not definitively the precise missing element). Fixing this would require a separate, authorized parser/fixture study before the 5-point UI gate can pass.

The test fixture itself was minimally updated to use a table/cell structure, and its existing offline smoke test remained 1/1 PASS. No production Bridge, Aimoge/Animanch/Mebuki adapter, Morphe patch, or GitHub Release was created or modified.

**Next owner/MUSE decision:** whether to adapt the fixture/adapter response to the actual native catalog parser, or inject a different interface. This experiment stops at evidence and recommendation.
