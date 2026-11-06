package app.swiftbackup.patches.cloud

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.swiftbackup.patches.shared.Constants.COMPATIBILITY_SWIFTBACKUP

/**
 * Swift Backup stores WiFi backup metadata under Firebase Realtime Database
 * path users/<uid>/cloud_v1/<cloudDir>/wifi (containing driveId and fileSize).
 * If that metadata is absent or lost (e.g. offline backup or restored storage),
 * the app skips cloud discovery and reports "No backup in cloud" in WifiActivity,
 * ignoring existing wifi_networks.wfi files in Google Drive, WebDAV, SMB, etc.
 *
 * This patch hooks us8.c() to fall back to direct cloud storage discovery
 * via qb1.c().l() whenever Firebase metadata lacks a valid driveId. When a cloud
 * backup file is found, it synthesizes WifiCloudDetails, caches it into the
 * local database (LocalDb) via cf3.c, and returns it so WifiActivity displays
 * all cloud WiFi backups immediately.
 */
@Suppress("unused")
val swiftBackupCloudWifiPatch = bytecodePatch(
    name = "Swift Backup Cloud WiFi Backups",
    description = "Detects and restores existing WiFi backups from cloud storage when metadata is missing from the local database.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SWIFTBACKUP)

    execute {
        val method = WifiCloudDetailsLookupFingerprint.method

        // Intent: Intercept method entry to query cloud storage if Firebase metadata lacks driveId.
        // Uses the existing 4-register frame (v0..v3) for scratch objects and the 64-bit size pair.
        method.addInstructionsWithLabels(0, """
            # Intent: First attempt reading cached metadata from Firebase / LocalDb at users/<uid>/cloud_v1/<cloud_dir>/wifi.
            invoke-static {}, Lre3;->g()Lzc2;
            move-result-object v0
            const-string v1, "wifi"
            invoke-virtual {v0, v1}, Lzc2;->d(Ljava/lang/String;)Lzc2;
            move-result-object v0
            const/4 v1, 0x1
            invoke-static {v0, v1}, Lcf3;->a(Lzc2;Z)Ll73;
            move-result-object v0
            instance-of v1, v0, Lxe3;
            if-eqz v1, :do_cloud_discovery

            check-cast v0, Lxe3;
            iget-object v0, v0, Lxe3;->n:Leb2;
            const-class v1, Lorg/swiftapps/swiftbackup/model/firebase/WifiCloudDetails;
            invoke-virtual {v0, v1}, Leb2;->c(Ljava/lang/Class;)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Lorg/swiftapps/swiftbackup/model/firebase/WifiCloudDetails;
            if-eqz v0, :do_cloud_discovery

            invoke-virtual {v0}, Lorg/swiftapps/swiftbackup/model/firebase/WifiCloudDetails;->getDriveId()Ljava/lang/String;
            move-result-object v1
            if-eqz v1, :do_cloud_discovery
            invoke-virtual {v1}, Ljava/lang/String;->length()I
            move-result v1
            if-gtz v1, :return_result

            :do_cloud_discovery
            # Intent: If Firebase metadata is absent or missing a driveId, query the cloud client directly
            # for existing .wfi backup files (e.g. wifi_networks.wfi) across Google Drive, WebDAV, SMB, etc.
            :try_start_discovery
            invoke-static {}, Lqb1;->m()Z
            move-result v0
            if-eqz v0, :return_null

            invoke-static {}, Lqb1;->c()Ltb1;
            move-result-object v0
            if-eqz v0, :return_null

            invoke-virtual {v0}, Ltb1;->l()Lui1;
            move-result-object v0
            if-eqz v0, :return_null

            iget-object v0, v0, Lui1;->a:Ljava/util/List;
            if-eqz v0, :return_null

            invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
            move-result v1
            if-nez v1, :return_null

            const/4 v1, 0x0
            invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Lpg1;
            if-eqz v0, :return_null

            iget-object v1, v0, Lpg1;->b:Ljava/lang/String;
            if-eqz v1, :return_null
            invoke-virtual {v1}, Ljava/lang/String;->length()I
            move-result v2
            if-lez v2, :return_null

            iget-wide v2, v0, Lpg1;->c:J
            invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
            move-result-object v2
            const/4 v3, 0x0
            new-instance v0, Lorg/swiftapps/swiftbackup/model/firebase/WifiCloudDetails;
            invoke-direct {v0, v1, v2, v3}, Lorg/swiftapps/swiftbackup/model/firebase/WifiCloudDetails;-><init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Integer;)V

            # Intent: Cache synthesized details into LocalDb / Firebase so subsequent lookups are instant
            invoke-static {}, Lre3;->g()Lzc2;
            move-result-object v1
            const-string v2, "wifi"
            invoke-virtual {v1, v2}, Lzc2;->d(Ljava/lang/String;)Lzc2;
            move-result-object v1
            invoke-static {v1, v0}, Lcf3;->c(Lzc2;Ljava/lang/Object;)Laf3;
            :try_end_discovery
            .catch Ljava/lang/Throwable; {:try_start_discovery .. :try_end_discovery} :catch_discovery

            :return_result
            return-object v0

            :catch_discovery
            # Intent: Cloud discovery failure gracefully returns null instead of throwing
            :return_null
            const/4 v0, 0x0
            return-object v0
        """.trimIndent())

        println("SwiftBackup: Cloud WiFi metadata fallback hooked (existing .wfi discovered from cloud storage)")
    }
}
