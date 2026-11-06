# Settings export and import

Swift Backup 5.1.0 includes native settings export/import but exposes both preferences only for
anonymous users. Signed-in users also encounter four anonymous checks inside the file-picker click
handler. This patch makes the two controls visible and opens the existing JSON pickers regardless
of account type. It preserves account state, the original serialization format, and unrelated
settings visibility.

## Automatic cloud backup

**Swift Backup Cloud Settings Backup** adds **Cloud settings backup** alongside Export/Import under
**Settings → Advanced tools**. Its dialog has an opt-in **Automatically back up settings** checkbox,
**Back up now**, and **Restore from cloud**. It depends on Settings Export and Import and Local Cloud
Metadata; use Blacklist Limit too when retaining more than 100 blacklist entries.

Automatic capture runs on the existing cloud executor approximately every 20 seconds while the app
process is running. Only a changed native settings export queues a new snapshot. Network failures
retain the committed snapshot for later upload. The backup is stored inside `morphe_local_db.json`
under `data.morphe_settings_backup`, using the connected provider's existing cloud transport.

After reinstall, reconnect the same provider/folder and choose **Restore from cloud**. A fresh cloud
download is required; cached data alone is not reported as a successful remote restore. The dialog
shows the saved time and requests confirmation before calling the native importer, which restarts
Swift Backup. Automatic backup defaults to off and stays off during restore, preventing a fresh
installation from automatically replacing the saved copy. Enabling it starts replacing the saved
copy with the current settings; restore first when moving to another installation.

Previewing a restore only pauses capture temporarily. Cancelling, dismissing, or failing to fetch
the preview preserves the existing automatic-backup option. Only confirming restore disables that
option persistently. Settings tasks initialize their executor and static cloud bridge independently
of Firebase Repo, so using this control does not require visiting the Cloud sync tab first.

This is a settings snapshot, not a copy of app-data archives or cloud login credentials. It uses the
same fields and restore semantics as the app's Export settings/Import settings feature.

The main Settings page contains the controls; scroll to find **Export settings** and **Import settings**.
Export includes app settings, favorites, and blacklist data. Import uses the app's native restore flow
and can replace existing settings; this patch does not automatically import anything or add cloud sync.
When importing more than 100 blacklist entries, also apply **Swift Backup Blacklist Limit** beforehand.

Verification: compile the patch and apply it to the stock 5.1.0 APK with `--validate`, together with
the other Swift Backup patches. On a signed-in session verify that both rows appear and open the
system create/open-document pickers. Cancel the pickers when checking without modifying user data.
