package com.anderson.applemusic.core.update

import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.content.pm.PackageInstaller
import android.content.pm.PackageManager
import android.os.Build
import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ensureActive
import kotlinx.coroutines.withContext
import org.json.JSONObject
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.net.HttpURLConnection
import java.net.URL
import java.security.MessageDigest
import kotlin.coroutines.coroutineContext

/**
 * Reads the update metadata published with each `apps-<version>` release and installs
 * the APKs through [android.content.pm.PackageInstaller].
 *
 * The release workflow attaches `updates.json` (version, releasedAt and, per artifact,
 * name/sha256/size/versionCode). The primary fetch is the stable
 * `releases/latest/download/updates.json` URL, which needs no token and no API quota;
 * the GitHub API is only a fallback when that redirect fails.
 *
 * No HTTP library: [HttpURLConnection] is enough for a couple of GETs and a streaming
 * download.
 */
class UpdateChecker(context: Context) {

    private val context = context.applicationContext

    companion object {
        private const val TAG = "UpdateChecker"

        const val REPO = "andersonlucasg3/apple-music-android-freedom"
        const val ENGINE_PACKAGE = "com.apple.android.music"

        /** TV and car build flavors published by the workflow. */
        const val ARTIFACT_TV = "tv"
        const val ARTIFACT_CAR = "car"

        private const val PREFS = "applemusic-updates"
        private const val KEY_LAST_CHECK = "last_check"
        private const val THROTTLE_MS = 24L * 60L * 60L * 1000L

        private const val USER_AGENT = "AppleMusic-DiLink-updater"
        private const val LATEST_JSON_URL =
            "https://github.com/$REPO/releases/latest/download/updates.json"
        private const val API_LATEST_URL = "https://api.github.com/repos/$REPO/releases/latest"

        /** `1.6.1` -> `10601`, the same scheme the workflow passes as `appVersionCode`. */
        fun versionCodeOf(version: String): Long {
            val match = Regex("^(\\d+)\\.(\\d+)(?:\\.(\\d+))?").find(version) ?: return 0L
            val major = match.groupValues[1].toLongOrNull() ?: return 0L
            val minor = match.groupValues[2].toLongOrNull() ?: 0L
            val patch = match.groupValues.getOrNull(3)?.toLongOrNull() ?: 0L
            return major * 10_000 + minor * 100 + patch
        }
    }

    /** True when the last check is older than 24 h (or there was none). */
    fun shouldCheckNow(): Boolean {
        val last = prefs().getLong(KEY_LAST_CHECK, 0L)
        return System.currentTimeMillis() - last >= THROTTLE_MS
    }

    fun markChecked() {
        prefs().edit().putLong(KEY_LAST_CHECK, System.currentTimeMillis()).apply()
    }

    /** `engine-arm64` on 64-bit devices, `engine-arm32` elsewhere (the TV box is 32-bit). */
    fun engineArtifact(): String =
        if (Build.SUPPORTED_64_BIT_ABIS.any { it == "arm64-v8a" }) "engine-arm64" else "engine-arm32"

    fun installedEngineVersionCode(): Long = try {
        context.packageManager.getPackageInfo(ENGINE_PACKAGE, 0).longVersionCode
    } catch (_: PackageManager.NameNotFoundException) {
        0L
    }

    /**
     * The engine update is only offered when the installed engine and this app are signed
     * with the same certificate: the companion shares a UID with Apple Music, so a foreign
     * engine would make the install (and the MediaBrowser connection) fail.
     */
    fun engineSignedByUs(): Boolean {
        val pm = context.packageManager
        val engine = try {
            pm.getPackageInfo(ENGINE_PACKAGE, PackageManager.GET_SIGNING_CERTIFICATES)
        } catch (_: PackageManager.NameNotFoundException) {
            return false
        }
        val own = try {
            pm.getPackageInfo(context.packageName, PackageManager.GET_SIGNING_CERTIFICATES)
        } catch (_: PackageManager.NameNotFoundException) {
            return false
        }
        val engineCerts = engine.signingInfo?.apkContentsSigners?.map { sha256(it.toByteArray()) }
            ?.toSet().orEmpty()
        val ownCerts = own.signingInfo?.apkContentsSigners?.map { sha256(it.toByteArray()) }
            ?.toSet().orEmpty()
        return engineCerts.isNotEmpty() && engineCerts == ownCerts
    }

    /**
     * Fetches the latest release metadata and returns the install plan, or `null` when
     * nothing is newer than [currentVersionCode].
     */
    suspend fun check(currentVersionCode: Long, companionArtifact: String): UpdatePlan? {
        val info = fetchLatest() ?: return null
        val steps = mutableListOf<UpdateStep>()

        val engineAsset = info.assets[engineArtifact()]
        if (engineAsset != null && engineSignedByUs()) {
            val installed = installedEngineVersionCode()
            val target = engineAsset.versionCode
            if (target != null && installed < target) {
                Log.i(TAG, "engine instalado $installed < release $target")
                steps += UpdateStep(true, "Apple Music (engine)", engineAsset)
            } else {
                Log.i(TAG, "engine atualizado (instalado=$installed, release=$target)")
            }
        }

        val companionAsset = info.assets[companionArtifact]
        if (companionAsset != null && currentVersionCode < info.versionCode) {
            val label = if (companionArtifact == ARTIFACT_TV) "Apple Music TV" else "Apple Music carro"
            steps += UpdateStep(false, label, companionAsset)
        }

        return if (steps.isEmpty()) null else UpdatePlan(info, steps)
    }

    suspend fun fetchLatest(): UpdateInfo? = withContext(Dispatchers.IO) {
        // 1. Stable "latest" download URL: GitHub redirects it to the newest release asset.
        fetchText(LATEST_JSON_URL)?.let { body ->
            parse(body) { name -> "https://github.com/$REPO/releases/latest/download/$name" }
                ?.let { return@withContext it }
        }

        // 2. Fallback: ask the API for the release and read its updates.json asset.
        val api = fetchText(
            API_LATEST_URL,
            mapOf(
                "Accept" to "application/vnd.github+json",
                "X-GitHub-Api-Version" to "2022-11-28",
            ),
        ) ?: return@withContext null
        val urls = mutableMapOf<String, String>()
        var updatesUrl: String? = null
        try {
            val assets = JSONObject(api).optJSONArray("assets") ?: return@withContext null
            for (index in 0 until assets.length()) {
                val asset = assets.optJSONObject(index) ?: continue
                val name = asset.optString("name")
                val url = asset.optString("browser_download_url")
                if (name.isEmpty() || url.isEmpty()) continue
                urls[name] = url
                if (name == "updates.json") updatesUrl = url
            }
        } catch (e: Exception) {
            Log.w(TAG, "resposta da API inválida: ${e.message}")
            return@withContext null
        }
        val json = updatesUrl?.let { fetchText(it) } ?: return@withContext null
        parse(json) { urls[it] }
    }

    /** Destination directory for the downloaded APKs. */
    fun downloadDir(): File = File(context.filesDir, "updates").apply { mkdirs() }

    /**
     * Streams [asset] to [dest], reporting 0..100 (or -1 when the size is unknown) and
     * verifying SHA-256 before returning. Cancellation deletes the partial file.
     */
    suspend fun downloadApk(
        asset: UpdateAsset,
        dest: File,
        onProgress: (Int) -> Unit,
    ): File = withContext(Dispatchers.IO) {
        dest.parentFile?.mkdirs()
        val part = File(dest.parentFile, "${dest.name}.part")
        part.delete()
        var connection: HttpURLConnection? = null
        try {
            connection = (URL(asset.url).openConnection() as HttpURLConnection).apply {
                connectTimeout = 15_000
                readTimeout = 30_000
                instanceFollowRedirects = true
                setRequestProperty("User-Agent", USER_AGENT)
            }
            val code = connection.responseCode
            if (code !in 200..299) throw IOException("HTTP $code ao baixar ${asset.name}")
            val total = if (asset.size > 0) asset.size else connection.contentLengthLong
            val digest = MessageDigest.getInstance("SHA-256")
            var received = 0L
            connection.inputStream.use { input ->
                FileOutputStream(part).use { output ->
                    val buffer = ByteArray(64 * 1024)
                    while (true) {
                        coroutineContext.ensureActive()
                        val read = input.read(buffer)
                        if (read < 0) break
                        output.write(buffer, 0, read)
                        digest.update(buffer, 0, read)
                        received += read
                        onProgress(
                            if (total > 0) ((received * 100) / total).toInt().coerceIn(0, 100) else -1,
                        )
                    }
                }
            }
            val sha = digest.digest().joinToString("") { "%02x".format(it) }
            if (asset.sha256.isNotEmpty() && !sha.equals(asset.sha256, ignoreCase = true)) {
                throw IOException("SHA-256 não confere (esperado ${asset.sha256}, obtido $sha)")
            }
            if (asset.size > 0 && received != asset.size) {
                throw IOException("Tamanho não confere (esperado ${asset.size}, obtido $received)")
            }
            if (!part.renameTo(dest)) {
                part.copyTo(dest, overwrite = true)
                part.delete()
            }
            Log.i(TAG, "${asset.name}: $sha ($received bytes) verificado")
            dest
        } finally {
            connection?.disconnect()
            if (part.exists()) part.delete()
        }
    }

    /**
     * Opens a [android.content.pm.PackageInstaller] session and commits it; the system
     * shows its own confirmation dialog and reports the result to [InstallResultReceiver].
     */
    fun installApk(file: File) {
        val installer = context.packageManager.packageInstaller
        val params = PackageInstaller.SessionParams(
            PackageInstaller.SessionParams.MODE_FULL_INSTALL,
        ).apply { setSize(file.length()) }
        val sessionId = installer.createSession(params)
        installer.openSession(sessionId).use { session ->
            file.inputStream().use { input ->
                session.openWrite("base.apk", 0, file.length()).use { output ->
                    input.copyTo(output, 64 * 1024)
                    session.fsync(output)
                }
            }
            val flags = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_MUTABLE
            } else {
                PendingIntent.FLAG_UPDATE_CURRENT
            }
            val callback = PendingIntent.getBroadcast(
                context,
                sessionId,
                Intent(context, InstallResultReceiver::class.java)
                    .setAction(InstallResultReceiver.ACTION_INSTALL_COMMIT),
                flags,
            )
            session.commit(callback.intentSender)
            Log.i(TAG, "sessão $sessionId commitada para ${file.name}")
        }
    }

    private fun prefs() = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)

    private fun fetchText(url: String, headers: Map<String, String> = emptyMap()): String? {
        var connection: HttpURLConnection? = null
        return try {
            connection = (URL(url).openConnection() as HttpURLConnection).apply {
                connectTimeout = 15_000
                readTimeout = 20_000
                instanceFollowRedirects = true
                requestMethod = "GET"
                setRequestProperty("User-Agent", USER_AGENT)
                setRequestProperty("Accept", "application/json")
                headers.forEach { (key, value) -> setRequestProperty(key, value) }
            }
            val code = connection.responseCode
            if (code !in 200..299) {
                Log.w(TAG, "HTTP $code em $url")
                null
            } else {
                connection.inputStream.bufferedReader().use { it.readText() }
            }
        } catch (e: Exception) {
            Log.w(TAG, "falha ao buscar $url: ${e.message}")
            null
        } finally {
            connection?.disconnect()
        }
    }

    private fun parse(json: String, urlFor: (String) -> String?): UpdateInfo? {
        val root = try {
            JSONObject(json)
        } catch (e: Exception) {
            Log.w(TAG, "updates.json inválido: ${e.message}")
            return null
        }
        val version = root.optString("version").trim()
        if (version.isEmpty()) {
            Log.w(TAG, "updates.json sem version")
            return null
        }
        val versionCode = root.optLong("versionCode", 0L).takeIf { it > 0 }
            ?: versionCodeOf(version)
        if (versionCode <= 0) {
            Log.w(TAG, "versão sem versionCode: $version")
            return null
        }
        val assets = root.optJSONObject("assets") ?: return null
        val parsed = linkedMapOf<String, UpdateAsset>()
        for (key in assets.keys()) {
            val asset = assets.optJSONObject(key) ?: continue
            val name = asset.optString("name").trim()
            val sha256 = asset.optString("sha256").trim().lowercase()
            if (name.isEmpty() || sha256.length != 64) {
                Log.w(TAG, "asset $key incompleto (name/sha256)")
                continue
            }
            var url = asset.optString("url").trim()
            if (url.isEmpty()) url = urlFor(name).orEmpty()
            if (url.isEmpty()) {
                Log.w(TAG, "asset $key sem URL")
                continue
            }
            parsed[key] = UpdateAsset(
                name = name,
                url = url,
                sha256 = sha256,
                size = asset.optLong("size", 0L),
                versionCode = asset.optLong("versionCode", 0L).takeIf { it > 0 },
            )
        }
        if (parsed.isEmpty()) {
            Log.w(TAG, "updates.json sem assets")
            return null
        }
        return UpdateInfo(
            version = version,
            versionCode = versionCode,
            releasedAt = root.optString("releasedAt").takeIf { it.isNotBlank() },
            assets = parsed,
        )
    }

    private fun sha256(bytes: ByteArray): String =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }
}
