package app.morphe.extension.chmate

import android.content.Context
import android.os.Build
import dev.carlsen.mega.Mega
import dev.carlsen.mega.MegaLogLevel
import dev.carlsen.mega.MegaLogListener
import dev.carlsen.mega.MegaLogger
import dev.carlsen.mega.model.Node
import dev.carlsen.mega.util.CancellationToken
import io.ktor.client.HttpClient
import io.ktor.client.engine.okhttp.OkHttp
import io.ktor.client.plugins.HttpTimeout
import io.ktor.client.plugins.UserAgent
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.serialization.kotlinx.json.json
import kotlinx.coroutines.runBlocking
import kotlinx.io.Buffer
import kotlinx.io.readByteArray
import kotlinx.serialization.json.Json
import java.io.IOException
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.TimeZone
import java.util.UUID

/** A small MEGA transport around bounded, versioned Haiagaru snapshots. */
internal object HaiagaruMegaClient {
    private const val FOLDER = "Haiagaru"
    private const val PREFIX = "Haiagaru-sync-"
    private const val SUFFIX = ".json"
    private const val MAX_SNAPSHOT_BYTES = 32 * 1024 * 1024L

    class MegaFile(
        @JvmField val hash: String,
        @JvmField val name: String,
        @JvmField val createdTime: String,
    )

    @JvmStatic
    fun login(context: Context, email: String, password: String, mfa: String) = runBlocking {
        requireSupportedAndroid()
        val mega = createQuietClient()
        try {
            mega.login(email, password, mfa.ifEmpty { null })
            val session = mega.dumpSession() ?: throw IOException("MEGAセッションを取得できませんでした")
            HaiagaruMegaSession.saveSession(context, session)
        } finally {
            closeClient(mega)
        }
    }

    @JvmStatic
    fun upload(context: Context, snapshot: ByteArray): String = runBlocking {
        requireSupportedAndroid()
        if (snapshot.isEmpty() || snapshot.size > MAX_SNAPSHOT_BYTES) {
            throw IOException("バックアップのサイズが不正です")
        }
        withSession(context) { mega ->
            val folder = folder(mega, create = true)
                ?: throw IOException("MEGAのバックアップフォルダを作成できません")
            val timestamp = SimpleDateFormat("yyyyMMdd-HHmmss-SSS", Locale.ROOT).apply {
                timeZone = TimeZone.getTimeZone("UTC")
            }.format(Date())
            val name = "$PREFIX$timestamp-${UUID.randomUUID().toString().take(8)}$SUFFIX"
            val source = Buffer().apply { write(snapshot) }
            CancellationToken().use { token ->
                mega.uploadFile(folder, name, snapshot.size.toLong(), source, token)
            }
            name
        }
    }

    @JvmStatic
    fun latest(context: Context): MegaFile = runBlocking {
        requireSupportedAndroid()
        withSession(context) { mega ->
            val folder = folder(mega, create = false)
                ?: throw IOException("MEGAにバックアップがありません")
            val node = mega.getChildren(folder)
                .asSequence()
                .filter { it.isFile && it.name.startsWith(PREFIX) && it.name.endsWith(SUFFIX) }
                .filter { it.size in 1..MAX_SNAPSHOT_BYTES }
                .maxByOrNull { it.name }
                ?: throw IOException("MEGAにバックアップがありません")
            MegaFile(node.hash, node.name, node.name.removePrefix(PREFIX).removeSuffix(SUFFIX))
        }
    }

    @JvmStatic
    fun download(context: Context, file: MegaFile): ByteArray = runBlocking {
        requireSupportedAndroid()
        withSession(context) { mega ->
            val node = mega.getNodeByHash(file.hash)
                ?: throw IOException("MEGA上のバックアップが見つかりません")
            if (!node.isFile || node.name != file.name || node.size !in 1..MAX_SNAPSHOT_BYTES) {
                throw IOException("MEGA上のバックアップが変更されました")
            }
            val output = Buffer()
            CancellationToken().use { token -> mega.downloadFile(node, output, token) }
            output.readByteArray().also {
                if (it.isEmpty() || it.size > MAX_SNAPSHOT_BYTES) {
                    throw IOException("取得したバックアップのサイズが不正です")
                }
            }
        }
    }

    private suspend fun folder(mega: Mega, create: Boolean): Node? {
        val root = mega.getFileSystem().root ?: throw IOException("MEGAのファイル一覧を取得できません")
        return mega.getChildren(root).firstOrNull { it.isFolder && it.name == FOLDER }
            ?: if (create) mega.createDir(FOLDER, root) else null
    }

    private suspend fun <T> withSession(context: Context, action: suspend (Mega) -> T): T {
        val mega = createQuietClient()
        try {
            mega.fastLogin(HaiagaruMegaSession.readSession(context))
            return action(mega)
        } finally {
            closeClient(mega)
        }
    }

    private fun requireSupportedAndroid() {
        if (Build.VERSION.SDK_INT < 24) throw IOException("MEGA同期にはAndroid 7以降が必要です")
    }

    /** The upstream beta client prints request URLs (including session IDs). Replace its HTTP client before any call. */
    private fun createQuietClient(): Mega {
        val logger = MegaLogger().apply {
            minLogLevel = MegaLogLevel.ERROR
            addListener(object : MegaLogListener {
                override fun onLogMessage(level: MegaLogLevel, message: String, throwable: Throwable?) {}
            })
        }
        val mega = Mega(megaLogger = logger, userAgent = "Haiagaru-Morphe", maxConcurrentChunks = 2)
        val field = Mega::class.java.getDeclaredField("httpClient").apply { isAccessible = true }
        val previous = field.get(mega) as HttpClient
        val quiet = HttpClient(OkHttp) {
            expectSuccess = false
            install(UserAgent) { agent = "Haiagaru-Morphe" }
            install(HttpTimeout) {
                requestTimeoutMillis = 30_000
                connectTimeoutMillis = 30_000
                socketTimeoutMillis = 30_000
            }
            install(ContentNegotiation) {
                json(Json { prettyPrint = true; isLenient = true; ignoreUnknownKeys = true })
            }
        }
        field.set(mega, quiet)
        previous.close()
        return mega
    }

    private suspend fun closeClient(mega: Mega) {
        try {
            mega.logout()
        } finally {
            val field = Mega::class.java.getDeclaredField("httpClient").apply { isAccessible = true }
            (field.get(mega) as? HttpClient)?.close()
        }
    }
}
