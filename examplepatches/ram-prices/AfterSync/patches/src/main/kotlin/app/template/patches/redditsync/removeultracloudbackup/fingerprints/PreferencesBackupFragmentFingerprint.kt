package app.template.patches.redditsync.removeultracloudbackup.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lpa/q;->C3(Landroid/os/Bundle;Ljava/lang/String;)V ("PreferencesBackupFragment"
 * per its source-file annotation, v23.06.30-13:39) — the fragment behind the "Backup"
 * settings screen (res/xml/cat_backup.xml), handling both the free-tier local backup
 * (backup_dir/backup_all/backup_restore) and the Ultra cloud backup
 * (ultra_backup_all/ultra_backup_restore/ultra_backup_delete) rows.
 *
 * Confirmed by hand via apktool: the Ultra cloud backup setup code is the LAST thing
 * this method does — it runs straight through to the method's final return-void, with
 * nothing after it. That makes it safe to remove via the same "anchor + remove to end,
 * keep return-void" technique already used successfully elsewhere in this project.
 */
val preferencesBackupFragmentFingerprint = fingerprint {
    returns("V")
    parameters("Landroid/os/Bundle;", "Ljava/lang/String;")
    custom { method, classDef -> classDef.type == "Lpa/q;" && method.name == "C3" }
}
