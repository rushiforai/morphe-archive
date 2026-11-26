package app.sadmod.client.data.model

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.JsonElement

@Serializable
data class ServerTimeResponse(
    val status: Int = 0,
    val timestamp: Long = 0L
)

@Serializable
data class CategoryInfo(
    @SerialName("url_id") val urlId: String = "",
    val title: String = "",
    val icon: String = ""
)

@Serializable
data class AppSummary(
    val id: String = "",
    @SerialName("url_id") val urlId: String = "",
    val title: String = "",
    @SerialName("title_id") val titleId: String = "",
    val icon: String = "",
    val size: String = "",
    @SerialName("long_size_format") val longSizeFormat: String = "",
    val author: String = "",
    val rating: String = "",
    @SerialName("mod_info") val modInfo: String = "",
    @SerialName("is_ad") val isAd: Int = 0,
    val version: String = "",
    @SerialName("vote_count_100") val voteCount100: String = "",
    @SerialName("weekly_hits_format") val weeklyHitsFormat: String = ""
) {
    val displaySize: String
        get() = longSizeFormat.ifBlank { size }

    val cleanModSummary: String
        get() = modInfo
            .replace(Regex("<br\\s*/?>", RegexOption.IGNORE_CASE), " · ")
            .replace(Regex("<[^>]+>"), "")
            .trim()
}

@Serializable
data class IndexCategoryBlock(
    @SerialName("_list") val list: List<AppSummary> = emptyList(),
    @SerialName("cat_info") val catInfo: CategoryInfo? = null
)

@Serializable
data class IndexFeedResponse(
    val status: Int = 0,
    @SerialName("pdt_list") val pdtList: List<IndexCategoryBlock> = emptyList()
)

@Serializable
data class RecommendListResponse(
    val status: Int = 0,
    val list: List<AppSummary> = emptyList(),
    @SerialName("has_next_page") val hasNextPage: Int = 0
)

@Serializable
data class CategoryListResponse(
    val status: Int = 0,
    val list: List<CategoryInfo> = emptyList()
)

@Serializable
data class SearchResponse(
    val status: Int = 0,
    val list: List<AppSummary> = emptyList(),
    @SerialName("has_next_page") val hasNextPage: Int = 0,
    val keywords: String = ""
)

@Serializable
data class OfficialAppHeader(
    val id: String = "",
    @SerialName("url_id") val urlId: String = "",
    @SerialName("title_id") val titleId: String = "",
    val title: String = "",
    @SerialName("is_game") val isGame: String = "0",
    @SerialName("cat_id") val catId: String = "",
    @SerialName("subcat_id") val subcatId: String = "",
    val screenshots: String = "",
    val icon: String = "",
    val author: String = "",
    val rating: String = "",
    @SerialName("rating_count") val ratingCount: String = "",
    @SerialName("screenshots_list") val screenshotsList: List<String> = emptyList()
)

@Serializable
data class ModItem(
    val title: String = "",
    @SerialName("title_id") val titleId: String = "",
    @SerialName("url_id") val urlId: String = "",
    val icon: String = "",
    val size: String = "",
    val version: String = "",
    val rating: String = "",
    @SerialName("rating_count") val ratingCount: String = "",
    @SerialName("long_size") val longSize: Double = 0.0,
    @SerialName("long_size_format") val longSizeFormat: String = "",
    @SerialName("mod_info") val modInfo: String = "",
    @SerialName("weekly_hits_format") val weeklyHitsFormat: String = "",
    @SerialName("vote_count_100") val voteCount100: String = "",
    @SerialName("download_type") val downloadType: Int = 1,
    @SerialName("is_new_version") val isNewVersion: String = "0"
) {
    val displaySize: String
        get() = longSizeFormat.ifBlank { size }

    val workingPercent: Int?
        get() = voteCount100.replace("%", "").trim().toIntOrNull()
}

@Serializable
data class ModListResponse(
    val status: Int = 0,
    @SerialName("the_official_pdt") val theOfficialPdt: OfficialAppHeader? = null,
    val list: List<ModItem> = emptyList(),
    @SerialName("the_latest_tested") val theLatestTested: ModItem? = null,
    @SerialName("has_next_page") val hasNextPage: Int = 0
)

@Serializable
data class OfficialAppDetail(
    val id: String = "",
    @SerialName("url_id") val urlId: String = "",
    val title: String = "",
    val author: String = "",
    val rating: String = "",
    @SerialName("rating_count_format") val ratingCountFormat: String = "",
    @SerialName("weekly_hits_format") val weeklyHitsFormat: String = "",
    val version: String = "",
    val size: String = "",
    @SerialName("long_size_format") val longSizeFormat: String = "",
    @SerialName("short_desc") val shortDesc: String = "",
    val detail: String = "",
    val icon: String = "",
    @SerialName("screenshots_list") val screenshotsList: List<String> = emptyList(),
    @SerialName("has_original_apk") val hasOriginalApk: String = "0",
    @SerialName("is_boundle") val isBoundle: String = "0"
) {
    val displaySize: String
        get() = longSizeFormat.ifBlank { size }
}

@Serializable
data class OfficialInfoResponse(
    val status: Int = 0,
    @SerialName("the_pdt") val thePdt: OfficialAppDetail? = null
)

@Serializable
data class ApkDownloadResponse(
    val status: Int = 0,
    @SerialName("url_id") val urlId: String = "",
    @SerialName("apk_path") val apkPath: String = "",
    @SerialName("happy_path") val happyPath: String = "",
    @SerialName("static_path") val staticPath: String = "",
    val stamp: String = "",
    val path: String = "",
    @SerialName("full_size") val fullSize: String = "0",
    val verify: String = "",
    @SerialName("is_boundle") val isBoundle: Int = 0
)

@Serializable
data class SpeedListResponse(
    val status: Int = 0,
    val urls: Map<String, JsonElement> = emptyMap(),
    val content: String = ""
)

@Serializable
data class SpeedResolveResponse(
    val status: Int = 0,
    @SerialName("download_url") val downloadUrl: String = "",
    val url: String = "",
    @SerialName("static_path") val staticPath: String = "",
    val p: String = "",
    val s: String = "",
    val v: String = ""
)

data class AppDetailBundle(
    val urlId: String,
    val header: OfficialAppHeader,
    val officialDetail: OfficialAppDetail?,
    val mods: List<ModItem>,
    val latestTested: ModItem?
)

@Serializable
enum class SecurityRiskLevel {
    CLEAN,
    MEDIUM,
    HIGH
}

@Serializable
enum class FindingKind {
    PERMISSION,
    PACKER,
    TRACKER,
    HARDCODED_IP,
    ARCHIVE_ERROR
}

@Serializable
data class SecurityFinding(
    val kind: FindingKind,
    val identifier: String,
    val isHighRisk: Boolean
)

@Serializable
data class ApkSecurityReport(
    val riskLevel: SecurityRiskLevel,
    val findings: List<SecurityFinding> = emptyList(),
    val declaredPermissions: List<String> = emptyList(),
    val sha256: String = "",
    val isValidArchive: Boolean = true,
    val isSplitBundle: Boolean = false,
    val errorDetail: String = ""
)

@Serializable
enum class DownloadStatus {
    RESOLVING,
    DOWNLOADING,
    VERIFYING,
    PATCHING,
    COMPLETED,
    FAILED,
    CANCELLED
}

@Serializable
data class PersistedDownloadMeta(
    val id: String,
    val title: String,
    val urlId: String,
    val refer: String,
    val version: String,
    val iconUrl: String,
    val isMod: Boolean,
    val totalBytes: Long,
    val filePath: String,
    val backupPath: String? = null,
    val isBundle: Boolean = false,
    val isPatched: Boolean = false,
    val removedPermissions: List<String> = emptyList(),
    val securityReport: ApkSecurityReport? = null
)

data class DownloadTask(
    val id: String,
    val title: String,
    val urlId: String,
    val refer: String,
    val version: String,
    val iconUrl: String,
    val isMod: Boolean,
    val status: DownloadStatus = DownloadStatus.RESOLVING,
    val downloadedBytes: Long = 0L,
    val totalBytes: Long = 0L,
    val speedBytesPerSec: Long = 0L,
    val filePath: String? = null,
    val backupPath: String? = null,
    val isBundle: Boolean = false,
    val isPatched: Boolean = false,
    val removedPermissions: List<String> = emptyList(),
    val securityReport: ApkSecurityReport? = null,
    val errorMessage: String? = null
) {
    val progress: Float
        get() = if (totalBytes > 0L) (downloadedBytes.toFloat() / totalBytes.toFloat()).coerceIn(0f, 1f) else 0f
}
