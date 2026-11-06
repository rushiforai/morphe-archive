package app.morphe.patches.colonyflow

import app.morphe.patches.colonyflow.Constants.COMPATIBILITY_COLONY_FLOW
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val PAIRIP_LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

internal object LicenseClientCheckLicenseFingerprint : Fingerprint(
    definingClass = PAIRIP_LICENSE_CLIENT,
    name = "checkLicense",
    parameters = listOf("Landroid/content/Context;"),
)

@Suppress("unused")
val licenseAndPrefsPatch =
    bytecodePatch(
        name = "Bypass License Check & Auto-Restore Save Data",
        description = "Bypasses pairip license check and automatically restores backup save data from external storage.",
    ) {
        compatibleWith(COMPATIBILITY_COLONY_FLOW)

        execute {
            LicenseClientCheckLicenseFingerprint.method.addInstructions(
                0,
                """
                :try_start_save_restore
                const/4 v0, 0x0
                invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;
                move-result-object v0
                if-eqz v0, :cond_save_end

                new-instance v1, Ljava/io/File;
                const-string p0, "backup_prefs.xml"
                invoke-direct {v1, v0, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

                invoke-virtual {v1}, Ljava/io/File;->exists()Z
                move-result p0
                if-eqz p0, :cond_save_end
                const-string p0, "/data/data/com.abi.colony.flow/shared_prefs/com.abi.colony.flow.v2.playerprefs.xml"
                new-instance v0, Ljava/io/File;
                invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

                invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;
                move-result-object p0
                if-eqz p0, :cond_dirs_ok
                invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

                :cond_dirs_ok
                new-instance p0, Ljava/io/FileInputStream;
                invoke-direct {p0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

                new-instance v1, Ljava/io/FileOutputStream;
                invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

                :goto_copy_loop
                invoke-virtual {p0}, Ljava/io/InputStream;->read()I
                move-result v0
                if-gez v0, :cond_write_byte
                goto :cond_copy_done

                :cond_write_byte
                invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write(I)V
                goto :goto_copy_loop

                :cond_copy_done
                invoke-virtual {p0}, Ljava/io/InputStream;->close()V
                invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

                const-string v0, "/sdcard/Android/data/com.abi.colony.flow/files/backup_prefs.xml"
                new-instance p0, Ljava/io/File;
                invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
                invoke-virtual {p0}, Ljava/io/File;->delete()Z

                :cond_save_end
                :try_end_save_restore
                .catchall {:try_start_save_restore .. :try_end_save_restore} :catch_save_restore

                :catch_save_restore
                return-void
                """.trimIndent(),
            )
        }
    }
