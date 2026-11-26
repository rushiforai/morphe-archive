package app.sadmod.client.data.remote

import app.sadmod.client.data.bridge.SadModBridge
import app.sadmod.client.data.crypto.HappyModCrypto
import app.sadmod.client.data.model.ApkDownloadResponse
import app.sadmod.client.data.model.AppDetailBundle
import app.sadmod.client.data.model.AppSummary
import app.sadmod.client.data.model.CategoryInfo
import app.sadmod.client.data.model.CategoryListResponse
import app.sadmod.client.data.model.IndexCategoryBlock
import app.sadmod.client.data.model.IndexFeedResponse
import app.sadmod.client.data.model.ModListResponse
import app.sadmod.client.data.model.OfficialAppHeader
import app.sadmod.client.data.model.OfficialInfoResponse
import app.sadmod.client.data.model.RecommendListResponse
import app.sadmod.client.data.model.SearchResponse
import app.sadmod.client.data.model.ServerTimeResponse
import app.sadmod.client.data.model.SpeedListResponse
import app.sadmod.client.data.model.SpeedResolveResponse
import app.sadmod.client.data.prefs.AppPreferences
import app.sadmod.client.data.prefs.ProxyMode
import app.sadmod.client.data.prefs.UserSettings
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.withContext
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.jsonObject
import kotlinx.serialization.json.jsonPrimitive
import okhttp3.Dns
import okhttp3.FormBody
import okhttp3.HttpUrl.Companion.toHttpUrl
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.dnsoverhttps.DnsOverHttps
import java.io.IOException
import java.net.InetAddress
import java.net.InetSocketAddress
import java.net.Proxy
import java.util.Locale
import java.util.concurrent.TimeUnit

class HappyModApi(
    private val preferences: AppPreferences
) {
    private val json = Json {
        ignoreUnknownKeys = true
        isLenient = true
        coerceInputValues = true
    }

    private val bootstrapClient = OkHttpClient.Builder()
        .connectTimeout(12, TimeUnit.SECONDS)
        .readTimeout(20, TimeUnit.SECONDS)
        .build()

    private val quad9Dns: Dns by lazy {
        val doh = DnsOverHttps.Builder()
            .client(bootstrapClient)
            .url("https://dns.quad9.net/dns-query".toHttpUrl())
            .bootstrapDnsHosts(
                InetAddress.getByName("9.9.9.9"),
                InetAddress.getByName("149.112.112.112")
            )
            .build()
        object : Dns {
            override fun lookup(hostname: String): List<InetAddress> {
                return try {
                    doh.lookup(hostname)
                } catch (_: Throwable) {
                    Dns.SYSTEM.lookup(hostname)
                }
            }
        }
    }

    @Volatile
    private var cachedNetworkKey: Triple<Boolean, ProxyMode, Pair<String, Int>>? = null

    @Volatile
    private var cachedClient: OkHttpClient = bootstrapClient

    private var serverTimeOffsetSec: Long? = null

    fun currentHttpClient(): OkHttpClient {
        val s: UserSettings = preferences.settings.value
        val key = Triple(s.dohEnabled, s.proxyMode, s.proxyHost to s.proxyPort)
        if (cachedNetworkKey == key) return cachedClient

        val builder = OkHttpClient.Builder()
            .connectTimeout(15, TimeUnit.SECONDS)
            .readTimeout(25, TimeUnit.SECONDS)
            .writeTimeout(15, TimeUnit.SECONDS)
            .followRedirects(true)

        when (s.proxyMode) {
            ProxyMode.NONE -> {
                if (s.dohEnabled) {
                    builder.dns(quad9Dns)
                }
            }
            ProxyMode.TOR_ORBOT -> {
                builder.proxy(Proxy(Proxy.Type.SOCKS, InetSocketAddress("127.0.0.1", 9050)))
            }
            ProxyMode.CUSTOM_SOCKS5 -> {
                builder.proxy(Proxy(Proxy.Type.SOCKS, InetSocketAddress(s.proxyHost, s.proxyPort)))
            }
            ProxyMode.CUSTOM_HTTP -> {
                builder.proxy(Proxy(Proxy.Type.HTTP, InetSocketAddress(s.proxyHost, s.proxyPort)))
            }
        }

        val built = builder.build()
        cachedNetworkKey = key
        cachedClient = built
        return built
    }

    private val uid: String
        get() = preferences.settings.value.sessionUid

    private val lang: String
        get() = preferences.settings.value.language.apiLangCode()

    private val country: String
        get() = Locale.getDefault().country.takeIf { it.length == 2 } ?: "US"

    private val apiBase: String
        get() = preferences.settings.value.customApiBase.ifBlank {
            SadModBridge.current.apiBase.ifBlank {
                throw IOException("Bridge configuration missing: apply patch to target APK or set custom endpoint.")
            }
        }

    private val clistBase: String
        get() = "$apiBase/clist"

    private val downloadBase: String
        get() = SadModBridge.current.downloadBase.ifBlank {
            throw IOException("Bridge download configuration missing.")
        }

    suspend fun testConnection(): Result<Long> = runCatching {
        val start = System.currentTimeMillis()
        val res = postDecoded<ServerTimeResponse>(
            url = "$apiBase/202010/api/server_time.php",
            params = mapOf(
                "version" to HappyModCrypto.appVersion,
                "uid" to uid,
                "country" to country
            )
        )
        if (res.status != 1) throw IOException("Server status=${res.status}")
        serverTimeOffsetSec = (System.currentTimeMillis() / 1000L) - res.timestamp
        (System.currentTimeMillis() - start).coerceAtLeast(1L)
    }

    private suspend fun getServerTimestampSec(): Long {
        val cachedOffset = serverTimeOffsetSec
        if (cachedOffset != null) {
            return (System.currentTimeMillis() / 1000L) - cachedOffset
        }
        return try {
            val res = postDecoded<ServerTimeResponse>(
                url = "$apiBase/202010/api/server_time.php",
                params = mapOf(
                    "version" to HappyModCrypto.appVersion,
                    "uid" to uid,
                    "country" to country
                )
            )
            if (res.status == 1 && res.timestamp > 0L) {
                val nowSec = System.currentTimeMillis() / 1000L
                serverTimeOffsetSec = nowSec - res.timestamp
                res.timestamp
            } else {
                System.currentTimeMillis() / 1000L
            }
        } catch (_: Exception) {
            System.currentTimeMillis() / 1000L
        }
    }

    private suspend fun makeStamp(): String {
        val ts = getServerTimestampSec()
        return HappyModCrypto.makeStamp(uid, ts)
    }

    suspend fun fetchAppFeed(page: Int = 1): List<IndexCategoryBlock> {
        val path = "${HappyModCrypto.appVersion},$lang,$country,$page,index_v3_app_list.html"
        val res = getDecoded<IndexFeedResponse>("$clistBase/$path")
        return sanitizeBlocks(res.pdtList)
    }

    suspend fun fetchGameFeed(page: Int = 1): List<IndexCategoryBlock> {
        val path = "${HappyModCrypto.appVersion},$lang,$country,$page,index_v3_game_list.html"
        val res = getDecoded<IndexFeedResponse>("$clistBase/$path")
        return sanitizeBlocks(res.pdtList)
    }

    suspend fun fetchFeaturedApps(page: Int = 1): List<AppSummary> {
        val path = "${HappyModCrypto.appVersion},$lang,$country,$page,index_v3_app_recommend.html"
        val res = getDecoded<RecommendListResponse>("$clistBase/$path")
        return res.list.filter { it.isAd == 0 && it.urlId.isNotBlank() }
    }

    suspend fun fetchFeaturedGames(page: Int = 1): List<AppSummary> {
        val path = "${HappyModCrypto.appVersion},$lang,$country,$page,index_v3_game_recommend.html"
        val res = getDecoded<RecommendListResponse>("$clistBase/$path")
        return res.list.filter { it.isAd == 0 && it.urlId.isNotBlank() }
    }

    suspend fun fetchCategories(): List<CategoryInfo> {
        val path = "${HappyModCrypto.appVersion},$lang,$country,cat_list.html"
        return getDecoded<CategoryListResponse>("$clistBase/$path").list
    }

    suspend fun searchApps(keywords: String, page: Int = 1): SearchResponse {
        val trimmed = keywords.trim()
        val stamp = makeStamp()
        val raw = postDecoded<SearchResponse>(
            url = "$apiBase/202010/api/search_list.php",
            params = mapOf(
                "version" to HappyModCrypto.appVersion,
                "uid" to uid,
                "stamp" to stamp,
                "page" to page.toString(),
                "keywords" to trimmed,
                "lang" to lang,
                "is_new_user" to "1",
                "is_input" to "2",
                "input_word" to trimmed.take(3)
            )
        )
        return raw.copy(list = raw.list.filter { it.isAd == 0 && it.urlId.isNotBlank() })
    }

    suspend fun fetchAppDetail(urlId: String): AppDetailBundle = coroutineScope {
        val modsDeferred = async {
            val path = "${HappyModCrypto.appVersion},$lang,$country,1,$urlId,rating,1,pdt_mod_list_v3.html"
            runCatching { getDecoded<ModListResponse>("$clistBase/$path") }.getOrNull()
        }
        val officialDeferred = async {
            val path = "${HappyModCrypto.appVersion},$lang,$country,$urlId,pdt_official_info_v3.html"
            runCatching { getDecoded<OfficialInfoResponse>("$clistBase/$path") }.getOrNull()
        }

        val modRes = modsDeferred.await()
        val officialRes = officialDeferred.await()

        val official = officialRes?.thePdt
        val header = modRes?.theOfficialPdt ?: OfficialAppHeader(
            id = official?.id.orEmpty(),
            urlId = urlId,
            title = official?.title ?: urlId,
            icon = official?.icon.orEmpty(),
            author = official?.author.orEmpty(),
            rating = official?.rating.orEmpty(),
            screenshotsList = official?.screenshotsList.orEmpty()
        )
        if (header.title.isBlank() && modRes == null && official == null) {
            throw IOException("App details could not be loaded.")
        }

        AppDetailBundle(
            urlId = urlId,
            header = header,
            officialDetail = official,
            mods = modRes?.list.orEmpty().filter { it.urlId.isNotBlank() },
            latestTested = modRes?.theLatestTested
        )
    }

    suspend fun resolveApkDownload(urlId: String, refer: String): ApkDownloadResponse {
        val stamp = makeStamp()
        val hash = HappyModCrypto.generateDownloadHash(urlId)
        val res = postDecoded<ApkDownloadResponse>(
            url = "$downloadBase/202101/api/get_apk_download_v2.php",
            params = mapOf(
                "version" to HappyModCrypto.appVersion,
                "uid" to uid,
                "stamp" to stamp,
                "country" to country,
                "lang" to lang,
                "hash" to hash,
                "url_id" to urlId,
                "refer" to refer,
                "aid" to HappyModCrypto.aid,
                "get_hpt" to "0",
                "channel" to "happymod",
                "username" to ""
            )
        )
        if (res.status != 1 || (res.staticPath.isBlank() && res.apkPath.isBlank())) {
            throw IOException("Download source unavailable (status=${res.status}).")
        }
        return res
    }

    /**
     * Resolves an alternative mirror via speed-list endpoints without reporting to tracking/log servers.
     */
    suspend fun resolveFallbackMirror(urlId: String, initial: ApkDownloadResponse): SpeedResolveResponse? {
        return runCatching {
            val speedList = postDecoded<SpeedListResponse>(
                url = "$downloadBase/202101/api/get_apk_speed_list.php",
                params = mapOf(
                    "version" to HappyModCrypto.appVersion,
                    "uid" to uid,
                    "stamp" to makeStamp(),
                    "url" to initial.staticPath,
                    "url_id" to urlId,
                    "country" to country,
                    "network_type" to "WIFI"
                )
            )
            val normalServers = speedList.urls["normal_apk_server_list"]?.jsonObject
            val firstServerId = normalServers?.keys?.firstOrNull()
            val contentJson = if (firstServerId != null) """{"$firstServerId":1000000}""" else speedList.content
            postDecoded<SpeedResolveResponse>(
                url = "$downloadBase/202101/api/get_apk_download_speed_list.php",
                params = mapOf(
                    "version" to HappyModCrypto.appVersion,
                    "uid" to uid,
                    "stamp" to makeStamp(),
                    "url" to initial.staticPath,
                    "url_id" to urlId,
                    "origin_url" to initial.apkPath,
                    "country" to country,
                    "network_type" to "WIFI",
                    "content" to contentJson
                )
            )
        }.getOrNull()
    }

    private fun sanitizeBlocks(blocks: List<IndexCategoryBlock>): List<IndexCategoryBlock> {
        return blocks.mapNotNull { block ->
            val clean = block.list.filter { it.isAd == 0 && it.urlId.isNotBlank() }
            if (clean.isEmpty()) null else block.copy(list = clean)
        }
    }

    private suspend inline fun <reified T> getDecoded(url: String): T = withContext(Dispatchers.IO) {
        val req = Request.Builder()
            .url(url)
            .header("User-Agent", USER_AGENT)
            .get()
            .build()
        currentHttpClient().newCall(req).execute().use { resp ->
            if (!resp.isSuccessful) throw IOException("HTTP ${resp.code}")
            val body = resp.body?.string().orEmpty()
            val decoded = HappyModCrypto.decodeResponse(body)
            json.decodeFromString<T>(decoded)
        }
    }

    private suspend inline fun <reified T> postDecoded(
        url: String,
        params: Map<String, String>
    ): T = withContext(Dispatchers.IO) {
        val form = FormBody.Builder().apply {
            params.forEach { (k, v) -> add(k, v) }
        }.build()
        val req = Request.Builder()
            .url(url)
            .header("User-Agent", USER_AGENT)
            .post(form)
            .build()
        currentHttpClient().newCall(req).execute().use { resp ->
            if (!resp.isSuccessful) throw IOException("HTTP ${resp.code}")
            val body = resp.body?.string().orEmpty()
            val decoded = HappyModCrypto.decodeResponse(body)
            json.decodeFromString<T>(decoded)
        }
    }

    companion object {
        const val USER_AGENT = "okhttp/4.9.3"
    }
}
