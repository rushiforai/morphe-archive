package app.sadmod.client.data.download

import android.content.Context
import app.sadmod.client.data.model.DownloadStatus
import app.sadmod.client.data.model.DownloadTask
import app.sadmod.client.data.model.PersistedDownloadMeta
import app.sadmod.client.data.patcher.ApkPermissionPatcher
import app.sadmod.client.data.remote.HappyModApi
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import okhttp3.Request
import java.io.File
import java.io.FileOutputStream
import java.io.IOException

class DownloadManager(
    private val context: Context,
    private val api: HappyModApi
) {
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val activeJobs = mutableMapOf<String, Job>()
    private val json = Json { ignoreUnknownKeys = true }

    private val _tasks = MutableStateFlow<List<DownloadTask>>(emptyList())
    val tasks: StateFlow<List<DownloadTask>> = _tasks.asStateFlow()

    private val downloadsDir: File
        get() = File(context.filesDir, "downloads").apply { mkdirs() }

    init {
        restorePersistedDownloads()
    }

    private fun restorePersistedDownloads() {
        val dir = downloadsDir
        val metas = dir.listFiles { f -> f.name.endsWith(".sadmeta.json") }
            ?.sortedByDescending { it.lastModified() }
            ?: return

        val restored = metas.mapNotNull { metaFile ->
            runCatching {
                val meta = json.decodeFromString<PersistedDownloadMeta>(metaFile.readText())
                val apkFile = File(meta.filePath)
                if (!apkFile.exists()) {
                    metaFile.delete()
                    return@mapNotNull null
                }
                DownloadTask(
                    id = meta.id,
                    title = meta.title,
                    urlId = meta.urlId,
                    refer = meta.refer,
                    version = meta.version,
                    iconUrl = meta.iconUrl,
                    isMod = meta.isMod,
                    status = DownloadStatus.COMPLETED,
                    downloadedBytes = apkFile.length(),
                    totalBytes = apkFile.length(),
                    filePath = apkFile.absolutePath,
                    backupPath = meta.backupPath?.takeIf { File(it).exists() },
                    isBundle = meta.isBundle,
                    isPatched = meta.isPatched,
                    removedPermissions = meta.removedPermissions,
                    securityReport = meta.securityReport
                )
            }.getOrNull()
        }
        if (restored.isNotEmpty()) {
            _tasks.value = restored
        }
    }

    fun enqueueDownload(
        urlId: String,
        title: String,
        refer: String,
        version: String,
        iconUrl: String,
        isMod: Boolean
    ): String {
        val existing = _tasks.value.firstOrNull {
            it.urlId == urlId && (
                it.status == DownloadStatus.RESOLVING ||
                    it.status == DownloadStatus.DOWNLOADING ||
                    it.status == DownloadStatus.PATCHING
                )
        }
        if (existing != null) return existing.id

        val taskId = "${urlId}_${System.currentTimeMillis()}"
        val initial = DownloadTask(
            id = taskId,
            title = title,
            urlId = urlId,
            refer = refer,
            version = version,
            iconUrl = iconUrl,
            isMod = isMod
        )
        _tasks.update { listOf(initial) + it }

        val job = scope.launch {
            runDownload(initial)
        }
        activeJobs[taskId] = job
        return taskId
    }

    fun cancelDownload(taskId: String) {
        activeJobs.remove(taskId)?.cancel()
        updateTask(taskId) {
            it.copy(status = DownloadStatus.CANCELLED, speedBytesPerSec = 0L)
        }
    }

    fun removeTask(taskId: String) {
        activeJobs.remove(taskId)?.cancel()
        val target = _tasks.value.firstOrNull { it.id == taskId }
        target?.filePath?.let { path ->
            runCatching { File(path).delete() }
            runCatching { metaFileFor(File(path)).delete() }
        }
        target?.backupPath?.let { runCatching { File(it).delete() } }
        _tasks.update { list -> list.filterNot { it.id == taskId } }
    }

    fun retryDownload(taskId: String) {
        val old = _tasks.value.firstOrNull { it.id == taskId } ?: return
        removeTask(taskId)
        enqueueDownload(
            urlId = old.urlId,
            title = old.title,
            refer = old.refer,
            version = old.version,
            iconUrl = old.iconUrl,
            isMod = old.isMod
        )
    }

    suspend fun patchTaskPermissions(taskId: String, permissionsToRemove: Set<String>): Result<Int> =
        withContext(Dispatchers.IO) {
            runCatching {
                val task = _tasks.value.firstOrNull { it.id == taskId }
                    ?: error("Download not found")
                val activePath = task.filePath ?: error("Missing APK path")
                val activeFile = File(activePath)
                if (!activeFile.exists()) error("APK missing")
                if (task.isBundle) error("Split bundles cannot be permission-patched yet.")

                updateTask(taskId) { it.copy(status = DownloadStatus.PATCHING) }

                val backupFile = task.backupPath?.let(::File)?.takeIf { it.exists() }
                    ?: File(downloadsDir, "${activeFile.nameWithoutExtension}.orig.apk").also { bak ->
                        activeFile.copyTo(bak, overwrite = true)
                    }

                val patchedOut = File(downloadsDir, "${activeFile.name}.patched.tmp")
                ApkPermissionPatcher.patchApkWithEmbeddedKey(
                    context = context,
                    inputApk = backupFile,
                    permissionsToRemove = permissionsToRemove,
                    outputApk = patchedOut
                )

                if (activeFile.exists()) activeFile.delete()
                if (!patchedOut.renameTo(activeFile)) {
                    patchedOut.copyTo(activeFile, overwrite = true)
                    patchedOut.delete()
                }

                val newReport = ApkSecurityScanner.scan(activeFile)
                val finalTask = task.copy(
                    status = DownloadStatus.COMPLETED,
                    downloadedBytes = activeFile.length(),
                    totalBytes = activeFile.length(),
                    filePath = activeFile.absolutePath,
                    backupPath = backupFile.absolutePath,
                    isPatched = permissionsToRemove.isNotEmpty(),
                    removedPermissions = permissionsToRemove.toList().sorted(),
                    securityReport = newReport
                )
                updateTask(taskId) { finalTask }
                persistMeta(finalTask)
                permissionsToRemove.size
            }.onFailure { err ->
                updateTask(taskId) {
                    it.copy(
                        status = DownloadStatus.COMPLETED,
                        errorMessage = err.message
                    )
                }
            }
        }

    suspend fun restoreOriginalApk(taskId: String): Result<Unit> = withContext(Dispatchers.IO) {
        runCatching {
            val task = _tasks.value.firstOrNull { it.id == taskId } ?: error("Not found")
            val activeFile = File(task.filePath ?: error("Missing path"))
            val backupFile = File(task.backupPath ?: error("No backup available"))
            if (!backupFile.exists()) error("Original backup missing")

            backupFile.copyTo(activeFile, overwrite = true)
            backupFile.delete()
            val report = ApkSecurityScanner.scan(activeFile)
            val restored = task.copy(
                status = DownloadStatus.COMPLETED,
                downloadedBytes = activeFile.length(),
                totalBytes = activeFile.length(),
                backupPath = null,
                isPatched = false,
                removedPermissions = emptyList(),
                securityReport = report
            )
            updateTask(taskId) { restored }
            persistMeta(restored)
        }
    }

    fun getStorageStats(): Pair<Int, Long> {
        val files = downloadsDir.listFiles { f ->
            f.isFile && !f.name.endsWith(".sadmeta.json")
        }.orEmpty()
        return files.size to files.sumOf { it.length() }
    }

    fun clearAllDownloads(): Int {
        activeJobs.values.forEach { it.cancel() }
        activeJobs.clear()
        val files = downloadsDir.listFiles().orEmpty()
        var count = 0
        files.forEach { f ->
            if (f.delete() && (f.name.endsWith(".apk") || f.name.endsWith(".xapk"))) {
                count++
            }
        }
        _tasks.value = emptyList()
        return count
    }

    private suspend fun runDownload(initial: DownloadTask) {
        try {
            val resolved = api.resolveApkDownload(initial.urlId, initial.refer)
            val expectedTotal = resolved.fullSize.toLongOrNull() ?: 0L
            val safeName = initial.urlId.replace(Regex("[^A-Za-z0-9._-]"), "_")
            val ext = if (resolved.isBoundle == 1) "xapk" else "apk"
            val targetFile = File(downloadsDir, "${safeName}_${initial.version.replace(" ", "_")}.$ext")
            val partFile = File(downloadsDir, "${targetFile.name}.part")

            updateTask(initial.id) {
                it.copy(
                    status = DownloadStatus.DOWNLOADING,
                    totalBytes = expectedTotal,
                    isBundle = resolved.isBoundle == 1
                )
            }

            val candidates = mutableListOf<Triple<String, Map<String, String>, Boolean>>()
            val baseHeaders = mapOf(
                "p" to resolved.path,
                "s" to resolved.stamp,
                "v" to resolved.verify
            )
            if (resolved.staticPath.isNotBlank()) candidates.add(Triple(resolved.staticPath, baseHeaders, false))
            if (resolved.apkPath.isNotBlank()) candidates.add(Triple(resolved.apkPath, baseHeaders, false))

            var lastError: Throwable? = null
            var downloaded = false
            for ((url, hdrs, _) in candidates) {
                try {
                    streamToFile(initial.id, url, hdrs, partFile, expectedTotal)
                    downloaded = true
                    break
                } catch (e: CancellationException) {
                    throw e
                } catch (t: Throwable) {
                    lastError = t
                }
            }

            if (!downloaded) {
                val mirror = api.resolveFallbackMirror(initial.urlId, resolved)
                val mirrorUrl = mirror?.downloadUrl?.ifBlank { mirror.url.ifBlank { mirror.staticPath } }
                if (!mirrorUrl.isNullOrBlank()) {
                    try {
                        val hdrs = mapOf(
                            "p" to mirror.p.ifBlank { resolved.path },
                            "s" to mirror.s.ifBlank { resolved.stamp },
                            "v" to mirror.v.ifBlank { resolved.verify }
                        )
                        streamToFile(initial.id, mirrorUrl, hdrs, partFile, expectedTotal)
                        downloaded = true
                    } catch (e: CancellationException) {
                        throw e
                    } catch (t: Throwable) {
                        lastError = t
                    }
                }
            }

            if (!downloaded) {
                throw (lastError ?: IOException("All download mirrors unreachable."))
            }

            updateTask(initial.id) { it.copy(status = DownloadStatus.VERIFYING, speedBytesPerSec = 0L) }

            if (expectedTotal > 0L && partFile.length() != expectedTotal) {
                partFile.delete()
                throw IOException("Incomplete download (${partFile.length()} / $expectedTotal bytes).")
            }

            val securityReport = ApkSecurityScanner.scan(partFile)
            if (!securityReport.isValidArchive) {
                partFile.delete()
                throw IOException(securityReport.errorDetail.ifBlank { "Invalid APK/ZIP archive." })
            }

            if (targetFile.exists()) targetFile.delete()
            if (!partFile.renameTo(targetFile)) {
                partFile.copyTo(targetFile, overwrite = true)
                partFile.delete()
            }

            val completedTask = initial.copy(
                status = DownloadStatus.COMPLETED,
                downloadedBytes = targetFile.length(),
                totalBytes = targetFile.length(),
                speedBytesPerSec = 0L,
                filePath = targetFile.absolutePath,
                isBundle = securityReport.isSplitBundle || resolved.isBoundle == 1,
                securityReport = securityReport
            )
            updateTask(initial.id) { completedTask }
            persistMeta(completedTask)
        } catch (_: CancellationException) {
            // handled in cancelDownload
        } catch (t: Throwable) {
            updateTask(initial.id) {
                it.copy(
                    status = DownloadStatus.FAILED,
                    speedBytesPerSec = 0L,
                    errorMessage = t.message ?: "Download failed"
                )
            }
        } finally {
            activeJobs.remove(initial.id)
        }
    }

    private fun persistMeta(task: DownloadTask) {
        val path = task.filePath ?: return
        val file = File(path)
        val meta = PersistedDownloadMeta(
            id = task.id,
            title = task.title,
            urlId = task.urlId,
            refer = task.refer,
            version = task.version,
            iconUrl = task.iconUrl,
            isMod = task.isMod,
            totalBytes = task.totalBytes,
            filePath = path,
            backupPath = task.backupPath,
            isBundle = task.isBundle,
            isPatched = task.isPatched,
            removedPermissions = task.removedPermissions,
            securityReport = task.securityReport
        )
        runCatching {
            metaFileFor(file).writeText(json.encodeToString(meta))
        }
    }

    private fun metaFileFor(apkFile: File): File =
        File(apkFile.parentFile, "${apkFile.name}.sadmeta.json")

    private fun streamToFile(
        taskId: String,
        url: String,
        headers: Map<String, String>,
        partFile: File,
        expectedTotal: Long
    ) {
        val reqBuilder = Request.Builder()
            .url(url)
            .header("User-Agent", HappyModApi.USER_AGENT)
        headers.forEach { (k, v) ->
            if (v.isNotBlank()) reqBuilder.header(k, v)
        }

        api.currentHttpClient().newCall(reqBuilder.build()).execute().use { resp ->
            if (!resp.isSuccessful) throw IOException("CDN HTTP ${resp.code}")
            val body = resp.body ?: throw IOException("Empty download stream")
            val contentLength = body.contentLength().takeIf { it > 0 } ?: expectedTotal

            body.byteStream().use { input ->
                FileOutputStream(partFile).use { output ->
                    val buffer = ByteArray(64 * 1024)
                    var totalRead = 0L
                    var lastTickMs = System.currentTimeMillis()
                    var lastTickBytes = 0L

                    while (true) {
                        val read = input.read(buffer)
                        if (read == -1) break
                        output.write(buffer, 0, read)
                        totalRead += read

                        val now = System.currentTimeMillis()
                        val deltaMs = now - lastTickMs
                        if (deltaMs >= 200L) {
                            val speed = ((totalRead - lastTickBytes) * 1000L) / deltaMs
                            lastTickMs = now
                            lastTickBytes = totalRead
                            updateTask(taskId) {
                                it.copy(
                                    downloadedBytes = totalRead,
                                    totalBytes = contentLength,
                                    speedBytesPerSec = speed
                                )
                            }
                        }
                    }
                }
            }
        }
    }

    private fun updateTask(taskId: String, transform: (DownloadTask) -> DownloadTask) {
        _tasks.update { list ->
            list.map { if (it.id == taskId) transform(it) else it }
        }
    }
}
