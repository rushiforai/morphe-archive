# Swift Backup metadata recovery checks

Run from the repository root with a JDK and Python 3:

```sh
# Compiles the actual extension and runs isolated file, restart, and HTTP fault scenarios.
python3 extensions/swiftbackup/tests/run.py
```

For offline runs, supply an existing `org.json` jar with `--json-jar /absolute/path/json.jar`.
Build outputs and test catalogs live in a temporary directory and are removed afterward.
The tests never connect to Android devices or Google Drive.

`morphe_local_db.state` is the authoritative local commit: catalog data, resolved pending path
replacements (including deletions), cloud revision, and external-recovery status are written atomically
together. `morphe_local_db.json` remains a raw tree snapshot. A missing or stale snapshot is repaired
from the journal. Old revision-only state files carry no bound catalog and are not trusted; existing
raw snapshots are reconciled before establishing the new journal.

Cloud metadata has exactly one shape: `{"rev": positiveInteger, "data": tree}`. Raw or malformed
cloud documents abort synchronization. A successful empty file lookup permits creation; a failed
lookup or an empty existing Drive file does not. Initial creation sends metadata and content in one
multipart request.

The fault scenarios cover delayed storage grants and remounts, process restarts, private-data loss,
corrupt candidates, pending clears and nested deletes, interrupted snapshot publication, failed
atomic commits, failed uploads, writes during upload, remote deletions, resolved increments, strict
cloud parsing, OAuth refresh, and malformed/ambiguous Drive lookups.

Settings backup tests also compile the real settings controller. Only Android UI and the app's
native Gson/model boundary are fixtures. They verify fresh-install opt-in behavior, capture of the
native payload, suppression of unchanged snapshots, preservation of the previous snapshot after an
invalid export, and rejection of invalid restore payloads before invoking the importer. Metadata tests
verify that settings snapshots survive restarts, upload, and retrieval after simulated reinstall.
