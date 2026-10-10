# Import weight history into Pillo

Supported app: **Pillo 0.6.20** (`xyz.rtrvr.pillo`).

1. Import the locally built `patches/build/libs/patches-0.9.0.mpp` bundle into Morphe.
2. Patch the original Pillo 0.6.20 app with **Pillo - Import weight history from JSON**.
   You can also select **Pillo - Hybrid Lock-Screen Notifications** and
   **Pillo - Local backup and restore**.
3. Install the patched app using your usual Morphe signing key.
4. Copy the SWT backup JSON to the phone.
5. In Pillo, open **Weight > Add record** and select the destination profile.
6. Tap the blue **+ Import weights JSON** button above **Skip** in the weight-entry
   step (complete the height step first if shown), leave **Kilograms (kg)** selected for this backup,
   and choose the JSON file.
7. Review the entry count and date range, then tap **Import**.

The importer sorts entries by date and uses Pillo's native weight-record storage.
Kilograms are converted to
Pillo's internal pounds; Pillo displays them in its configured unit. Epoch
milliseconds become epoch seconds, preserving the original instant. Pillo displays
dates in the phone's timezone.

Existing records stay unchanged. Reimporting skips matching timestamp/weight pairs
in the selected profile. Different weights at the same timestamp are retained.
Imported records have no scheduled alarm and can be edited or deleted using
Pillo's normal record controls. The file is read locally and is not embedded in
the patch or uploaded by the importer.

Each extra weight is saved through Pillo's native single-record insert method and
its returned ID is checked. Pillo's batch insert skips records without reminder
IDs, so it is unsuitable for historical weights. If saving stops partway through,
the importer reports progress; selecting the same file again skips saved records
and continues with the remaining entries.

The importer rejects an invalid entry before saving any records. Files are limited
to 2 MB and 10,000 entries; dates must be numeric epoch milliseconds between 2000
and 2100, and weights must be positive finite numbers. Unrelated backup settings
are ignored.

Example format:

```json
{"weights":[{"date":1751583600000,"weight":75.5}]}
```

Validation completed: actual backup parsing and import simulation; unit conversion;
profile isolation; duplicate skipping; coroutine and storage error handling; real
Pillo DEX contracts and write/reload; and application of both packaged Pillo patches
to the original APK with the importer classes merged into the resulting DEX.
Device testing confirmed importing the SWT backup and the final capsule button
above Skip. Rotation, chart display, and editing/deleting imported records remain
separate device checks.
