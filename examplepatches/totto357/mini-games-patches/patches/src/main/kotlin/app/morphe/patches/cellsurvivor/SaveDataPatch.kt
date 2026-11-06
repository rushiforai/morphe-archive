package app.morphe.patches.cellsurvivor

import app.morphe.patches.cellsurvivor.Constants.COMPATIBILITY_CELL_SURVIVOR
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val GAME_ACT_HELPER = "Lcom/common/game/GameActHelper;"
private const val GAME_ACT_HELPER_PULL_CALLBACK = "Lcom/common/game/GameActHelper$67;"

internal object PullCloudArchiveBatchFingerprint : Fingerprint(
    definingClass = GAME_ACT_HELPER,
    name = "pullCloudArchiveBatch",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object UploadCloudArchiveBatchFingerprint : Fingerprint(
    definingClass = GAME_ACT_HELPER,
    name = "uploadCloudArchiveBatch",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object PullCloudArchiveBatchCallbackFingerprint : Fingerprint(
    definingClass = GAME_ACT_HELPER_PULL_CALLBACK,
    name = "onResult",
    parameters = listOf("I", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
)

@Suppress("unused")
val saveDataPatch =
    bytecodePatch(
        name = "Save Data Backup & Restore",
        description = "Automatically backs up and restores save data from Android/media directory across installs.",
    ) {
        compatibleWith(COMPATIBILITY_CELL_SURVIVOR)

        execute {
            // 1. Hook pullCloudArchiveBatch: Completely replace with synchronous local restore
            PullCloudArchiveBatchFingerprint.method.apply {
                val count = implementation?.instructions?.size ?: 0
                if (count > 0) {
                    removeInstructions(0, count)
                }
                ensureLocals(5)
                addInstructions(
                    0,
                    """
                    :try_start_pull
                    new-instance v0, Ljava/io/File;
                    const-string v1, "/sdcard/Android/media/defense.roguelike.cell.shoot.survivor/save_backup.json"
                    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V
                    invoke-virtual {v0}, Ljava/io/File;->exists()Z
                    move-result v1
                    if-eqz v1, :cond_empty_pull

                    invoke-virtual {v0}, Ljava/io/File;->length()J
                    move-result-wide v1
                    const-wide/16 v3, 0x2
                    cmp-long v3, v1, v3
                    if-lez v3, :cond_empty_pull

                    long-to-int v1, v1
                    new-array v1, v1, [B

                    new-instance v2, Ljava/io/FileInputStream;
                    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
                    invoke-virtual {v2, v1}, Ljava/io/FileInputStream;->read([B)I
                    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

                    new-instance v2, Ljava/lang/String;
                    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([B)V

                    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z
                    move-result v0
                    if-nez v0, :cond_empty_pull
                    const-string v0, "{}"
                    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-nez v0, :cond_empty_pull
                    goto :cond_deliver

                    :cond_empty_pull
                    const-string v2, "{}"

                    :cond_deliver
                    const/4 v0, 0x1
                    const-string v1, "get cloud archive success"
                    invoke-static {v0, v1, p1, v2, p0}, Lcom/common/game/UserGameHelper;->pullCloudArchiveBatchCallback(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
                    return-void

                    :try_end_pull
                    .catchall {:try_start_pull .. :try_end_pull} :catch_pull
                    :catch_pull
                    const/4 v0, 0x1
                    const-string v1, "get cloud archive success"
                    const-string v2, "{}"
                    invoke-static {v0, v1, p1, v2, p0}, Lcom/common/game/UserGameHelper;->pullCloudArchiveBatchCallback(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
                    return-void
                    """.trimIndent(),
                )
            }

            // 2. Hook uploadCloudArchiveBatch: Completely replace with safe JSON merge into local backup
            UploadCloudArchiveBatchFingerprint.method.apply {
                val count = implementation?.instructions?.size ?: 0
                if (count > 0) {
                    removeInstructions(0, count)
                }
                ensureLocals(8)
                addInstructions(
                    0,
                    """
                    :try_start_save
                    if-eqz p1, :cond_save_callback
                    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z
                    move-result v0
                    if-nez v0, :cond_save_callback

                    new-instance v0, Ljava/io/File;
                    const-string v1, "/sdcard/Android/media/defense.roguelike.cell.shoot.survivor"
                    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V
                    invoke-virtual {v0}, Ljava/io/File;->exists()Z
                    move-result v1
                    if-nez v1, :cond_dir_ok
                    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z
                    :cond_dir_ok

                    new-instance v1, Ljava/io/File;
                    const-string v2, "save_backup.json"
                    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

                    invoke-virtual {v1}, Ljava/io/File;->exists()Z
                    move-result v2
                    if-eqz v2, :cond_new_merged
                    invoke-virtual {v1}, Ljava/io/File;->length()J
                    move-result-wide v2
                    const-wide/16 v4, 0x2
                    cmp-long v4, v2, v4
                    if-lez v4, :cond_new_merged

                    long-to-int v2, v2
                    new-array v2, v2, [B
                    new-instance v3, Ljava/io/FileInputStream;
                    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
                    invoke-virtual {v3, v2}, Ljava/io/FileInputStream;->read([B)I
                    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

                    new-instance v3, Ljava/lang/String;
                    invoke-direct {v3, v2}, Ljava/lang/String;-><init>([B)V
                    new-instance v2, Lorg/json/JSONObject;
                    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
                    goto :cond_merge_incoming

                    :cond_new_merged
                    new-instance v2, Lorg/json/JSONObject;
                    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

                    :cond_merge_incoming
                    new-instance v3, Lorg/json/JSONObject;
                    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
                    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;
                    move-result-object v4

                    :loop_keys
                    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z
                    move-result v5
                    if-eqz v5, :cond_write_file

                    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                    move-result-object v5
                    check-cast v5, Ljava/lang/String;
                    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;
                    move-result-object v6
                    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                    goto :loop_keys

                    :cond_write_file
                    new-instance v3, Ljava/io/File;
                    const-string v4, "save_backup.json.tmp"
                    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

                    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
                    move-result-object v0
                    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B
                    move-result-object v0

                    new-instance v2, Ljava/io/FileOutputStream;
                    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
                    invoke-virtual {v2, v0}, Ljava/io/FileOutputStream;->write([B)V
                    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

                    invoke-virtual {v3}, Ljava/io/File;->exists()Z
                    move-result v0
                    if-eqz v0, :cond_save_callback
                    invoke-virtual {v3}, Ljava/io/File;->length()J
                    move-result-wide v4
                    const-wide/16 v6, 0x0
                    cmp-long v0, v4, v6
                    if-lez v0, :cond_save_callback

                    invoke-virtual {v1}, Ljava/io/File;->exists()Z
                    move-result v0
                    if-eqz v0, :cond_rename_file
                    invoke-virtual {v1}, Ljava/io/File;->delete()Z

                    :cond_rename_file
                    invoke-virtual {v3, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

                    :try_end_save
                    .catchall {:try_start_save .. :try_end_save} :catch_save
                    :catch_save

                    :cond_save_callback
                    const/4 v0, 0x1
                    const-string v1, "save cloud archive success"
                    invoke-static {v0, v1, p1, p0}, Lcom/common/game/UserGameHelper;->uploadCloudArchiveBatchCallback(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
                    return-void
                    """.trimIndent(),
                )
            }

            // 3. Fallback callback hook on GameActHelper$67
            PullCloudArchiveBatchCallbackFingerprint.method.apply {
                val count = implementation?.instructions?.size ?: 0
                if (count > 0) {
                    removeInstructions(0, count)
                }
                ensureLocals(3)
                addInstructions(
                    0,
                    """
                    :try_start_load
                    if-eqz p4, :cond_do_load
                    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z
                    move-result v0
                    if-nez v0, :cond_do_load
                    const-string v0, "{}"
                    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-nez v0, :cond_do_load
                    goto :cond_call_callback

                    :cond_do_load
                    new-instance v0, Ljava/io/File;
                    const-string v1, "/sdcard/Android/media/defense.roguelike.cell.shoot.survivor/save_backup.json"
                    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V
                    invoke-virtual {v0}, Ljava/io/File;->exists()Z
                    move-result v1
                    if-eqz v1, :cond_empty_data

                    invoke-virtual {v0}, Ljava/io/File;->length()J
                    move-result-wide v1
                    long-to-int v1, v1
                    new-array v1, v1, [B

                    new-instance v2, Ljava/io/FileInputStream;
                    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
                    invoke-virtual {v2, v1}, Ljava/io/FileInputStream;->read([B)I
                    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

                    new-instance p4, Ljava/lang/String;
                    invoke-direct {p4, v1}, Ljava/lang/String;-><init>([B)V
                    const/4 p1, 0x1
                    const-string p2, "get cloud archive success"
                    goto :cond_call_callback

                    :cond_empty_data
                    const-string p4, "{}"
                    :try_end_load
                    .catchall {:try_start_load .. :try_end_load} :catch_load

                    :catch_load
                    :cond_call_callback
                    iget-object v0, p0, Lcom/common/game/GameActHelper${'$'}67;->val${'$'}mark:Ljava/lang/String;
                    invoke-static {p1, p2, p3, p4, v0}, Lcom/common/game/UserGameHelper;->pullCloudArchiveBatchCallback(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
                    return-void
                    """.trimIndent(),
                )
            }
        }
    }

