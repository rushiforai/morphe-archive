package app.sadmod.client.data.download

import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.content.pm.PackageInstaller
import android.net.Uri
import android.os.Build
import android.provider.Settings
import java.io.File
import java.io.FileInputStream
import java.util.zip.ZipInputStream

object ApkInstaller {

    fun canInstallPackages(context: Context): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            context.packageManager.canRequestPackageInstalls()
        } else {
            true
        }
    }

    fun openInstallPermissionSettings(context: Context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val intent = Intent(
                Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES,
                Uri.parse("package:${context.packageName}")
            ).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            context.startActivity(intent)
        }
    }

    fun installFile(context: Context, file: File): Result<Unit> = runCatching {
        if (!file.exists()) error("File not found.")
        if (!canInstallPackages(context)) {
            openInstallPermissionSettings(context)
            error("Please allow 'Install unknown apps' first.")
        }

        val isSplitBundle = isSplitApkArchive(file)
        if (!isSplitBundle) {
            val uri = SadModApkProvider.getUriForFile(context, file)
            val intent = Intent(Intent.ACTION_VIEW).apply {
                setDataAndType(uri, "application/vnd.android.package-archive")
                addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }
            context.startActivity(intent)
        } else {
            installSplitBundle(context, file)
        }
    }

    private fun isSplitApkArchive(file: File): Boolean {
        var hasRootManifest = false
        var apkEntryCount = 0
        ZipInputStream(FileInputStream(file)).use { zis ->
            while (true) {
                val entry = zis.nextEntry ?: break
                if (entry.name == "AndroidManifest.xml") hasRootManifest = true
                if (!entry.isDirectory && entry.name.endsWith(".apk", ignoreCase = true)) {
                    apkEntryCount++
                }
                zis.closeEntry()
            }
        }
        return !hasRootManifest && apkEntryCount > 0
    }

    private fun installSplitBundle(context: Context, archive: File) {
        val installer = context.packageManager.packageInstaller
        val params = PackageInstaller.SessionParams(
            PackageInstaller.SessionParams.MODE_FULL_INSTALL
        )
        val sessionId = installer.createSession(params)
        val session = installer.openSession(sessionId)
        try {
            var index = 0
            ZipInputStream(FileInputStream(archive)).use { zis ->
                val buffer = ByteArray(64 * 1024)
                while (true) {
                    val entry = zis.nextEntry ?: break
                    if (!entry.isDirectory && entry.name.endsWith(".apk", ignoreCase = true)) {
                        val splitName = "split_${index++}_${entry.name.substringAfterLast('/')}"
                        session.openWrite(splitName, 0, -1).use { out ->
                            while (true) {
                                val read = zis.read(buffer)
                                if (read <= 0) break
                                out.write(buffer, 0, read)
                            }
                            session.fsync(out)
                        }
                    }
                    zis.closeEntry()
                }
            }
            val callbackIntent = Intent(context, context.javaClass)
            val flags = PendingIntent.FLAG_UPDATE_CURRENT or
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) PendingIntent.FLAG_MUTABLE else 0
            val pendingIntent = PendingIntent.getActivity(context, sessionId, callbackIntent, flags)
            session.commit(pendingIntent.intentSender)
        } catch (t: Throwable) {
            session.abandon()
            throw t
        }
    }
}
