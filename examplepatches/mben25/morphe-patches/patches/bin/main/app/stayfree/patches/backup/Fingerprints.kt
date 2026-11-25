package app.stayfree.patches.backup

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.AccessFlags

private const val R_STRING = "Lcom/burockgames/R\$string;"

/**
 * Settings > Storage "Usage Data Backup" row composable (`Lay1;->a(Object, Object, Object)` in
 * 20.16.1, one case of a merged Compose lambda class). It loads the `usage_data_backup` title,
 * picks one of the `usage_data_backup_summary_*` subtitles, builds the click lambda
 * (`new Lgh;-><init>(Lsj4;Lns0;Lr97;Lr97;Lr97;)V`, case 0xc) and draws the row with
 * `Lwt9;->b(Lp27;Ljy7;Lbe3;Ljava/lang/String;…Ljava/lang/String;…Lcj4;…)V`.
 */
object UsageDataBackupRowFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        fieldAccess(definingClass = R_STRING, name = "usage_data_backup"),
        fieldAccess(definingClass = R_STRING, name = "usage_data_backup_summary_inactive"),
    ),
)
