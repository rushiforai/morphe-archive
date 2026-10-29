package app.pielm.patches.twitter.gif

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Fingerprints targeting Piko's Twitter extension classes (when patched alongside Piko).
 */
internal object PikoExtMediaGetVideosFingerprint : Fingerprint(
    definingClass = "Lapp/morphe/extension/twitter/entity/ExtMediaEntities;",
    name = "getVideos",
    returnType = "Ljava/util/ArrayList;",
)

internal object PikoBuildDownloadItemsFingerprint : Fingerprint(
    definingClass = "Lapp/morphe/extension/twitter/patches/nativeFeatures/downloader/NativeDownloader;",
    name = "buildDownloadItems",
    returnType = "Ljava/util/ArrayList;",
)

internal object PikoUtilsDownloadFileFingerprint : Fingerprint(
    definingClass = "Lapp/morphe/extension/twitter/Utils;",
    name = "downloadFile",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
)

internal object PikoDownloadVideoMediaFingerprint : Fingerprint(
    definingClass = "Lapp/morphe/extension/twitter/patches/DownloadPatch;",
    name = "downloadVideoMedia",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
    ),
)

/**
 * Fingerprints targeting X/Twitter's native media downloader and media options sheet (Case C & standalone fallback).
 */
internal object TwitterDownloadCallFingerprint : Fingerprint(
    definingClass = "Lcom/twitter/downloader/",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    strings = listOf(
        "getString(...)",
        "isUseSnackbar",
    ),
)

internal object TwitterMediaOptionSheetFingerprint : Fingerprint(
    strings = listOf(
        "mediaEntity",
        "media_options_sheet",
    ),
)

internal object TwitterMediaOptionSheetDownloaderFingerprint : Fingerprint(
    definingClass = "Lcom/twitter/tweetview/core/ui/mediaoptionssheet/",
    returnType = "Z",
    strings = listOf("url", "video_download"),
)

internal object TwitterJsonMediaEntityFingerprint : Fingerprint(
    definingClass = "Lcom/twitter/model/json/core/JsonMediaEntity;",
    filters = OpcodesFilter.opcodesToFilters(Opcode.IGET_BOOLEAN),
)
