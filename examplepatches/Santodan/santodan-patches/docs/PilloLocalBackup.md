# Local backup and restore for Pillo

Supported app: **Pillo 0.6.20** (`xyz.rtrvr.pillo`). Patch name:
**Pillo - Local backup and restore**. It is independent of the weight JSON import
and hybrid notification patches; you can select any combination of these patches.

Import `patches/build/libs/patches-0.9.0.mpp` into Morphe and apply the local backup
patch to the original Pillo app. Use your usual signing key when installing.

In Pillo, open **Settings > Backup and restore > Local file**. The local option
appears before Google's sign-in prompt and does not require a Google account.
The existing Google backup flow remains available through **Google backup**.
There is also a **Local backup** button on the native Backup and restore screen.
On a fresh installation, open the existing restore/import menu during onboarding
and choose **Import local backup**. Medisafe import and Pillo account restore are
also available in that chooser. Local restore does not require completing setup
or signing in to Google first.

- **Export all data to local file**: Choose a destination in Android's file picker.
  The resulting `.pillo-backup.zip` contains Pillo's native database snapshot,
  shared preferences, internal files, no-backup files, and primary app-managed
  external files. This includes the database's profiles, medicines, supplements,
  reminders, tracker records, histories, diaries, and other stored tables.
- **Import local backup**: Choose a file created by this patch, review the replacement
  prompt, and select **Restore and restart**. This replaces the current Pillo data;
  it does not merge two backups. Pillo restarts with the restored stores and runs
  its native alarm consistency scheduler.
- **Export pre-restore backup**: After a restore, save the automatic copy of the
  previous state to a local file. Import that file to return to the previous state.
  This recovery copy is replaced when another restore is prepared.

The archive is unencrypted and contains private app data. Keep it in a location
you trust. Choosing a folder exposed by a cloud document provider is still possible
in Android's picker; choose device storage if you want the file to remain local.

Temporary caches, installed APKs/code, previous native database-backup directories,
Android permissions, and device-bound Android Keystore keys are not exported.
Files owned by other apps or only available through an external content URI or in
the cloud are represented by Pillo's stored references; their contents are not
included. Such files may need to be reselected or downloaded on another device.
Account sessions and device-bound credentials may require signing in again.
No Google/Firebase backup or restore API is called by the local transport.

The database uses Pillo's native snapshot. Other files are captured one at a time;
their sizes and checksums are calculated from the bytes written to the archive,
so background updates between export steps do not invalidate the backup index.
The finished archive is independently verified. These files and preferences do
not form a single transaction with the database; avoid editing data during export.

Only this patch's format and Pillo 0.6.20 database schema are accepted. The SWT JSON
file from the weight-import patch is a different format. Archives are limited to
2 GB of extracted data and 50,000 files. Import checks package/version, indexed
paths, sizes, SHA-256 checksums, SQLite integrity, and Room schema identity before
preparing a restore. Unsafe paths, duplicates, incomplete files, and incompatible
schemas are rejected without replacing live data.

Restore first writes an automatic recovery archive and prepares replacement files
on a background worker. At the next launch, a hook before locale/preference reads
and content-provider initialization commits the replacements using a persistent
journal. Interrupted preparation or commit rolls back to the previous stores.
Large file copying runs before the restart; committed old-file cleanup runs after
application initialization on a worker.

Automated verification covers archive round-trips, concurrent source updates,
Android colon filenames, corruption and traversal rejection,
restore interruption/rollback, the original app's native backup and lifecycle
contracts, and applying the packaged patch alone and with both other Pillo patches
to the original APK. Phone testing remains necessary for document providers,
Google/local transport selection, real settings/photos, cross-device credentials,
restart behavior, and reminder scheduling after restore.
