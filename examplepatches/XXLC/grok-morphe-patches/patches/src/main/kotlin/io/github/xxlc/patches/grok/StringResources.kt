package io.github.xxlc.patches.grok

internal data class XxlcString(val name: String, val en: String, val vi: String)

internal const val DOWNLOAD_ALL_STRING = "grok_imagine_post_download_all"

// Keep the older strings first so the ID assignment order for Download all is unchanged.
internal val xxlcStrings = listOf(
    XxlcString(DOWNLOAD_ALL_STRING, "Download all", "Tải tất cả"),
    XxlcString("grok_xxlc_copy_prompt", "Copy prompt", "Sao chép prompt"),
    XxlcString("grok_xxlc_copy_seed", "Copy seed", "Sao chép seed"),
    XxlcString("grok_xxlc_select_all", "Select all", "Chọn tất cả"),
    XxlcString(
        "grok_xxlc_download_queued",
        "Queued %1\$d files for download",
        "Đã đưa %1\$d tệp vào hàng đợi tải",
    ),
    XxlcString("grok_xxlc_copied", "Copied", "Đã sao chép"),
)

internal val downloadAllStringId: Int
    get() = stringId(DOWNLOAD_ALL_STRING)
