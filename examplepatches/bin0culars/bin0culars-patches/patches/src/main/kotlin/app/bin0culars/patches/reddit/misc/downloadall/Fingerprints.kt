package app.bin0culars.patches.reddit.misc.downloadall

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

internal const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/DownloadAllPatch;"

object ShareSheetLinkLoadedFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/reddit/domain/model/Link;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/reddit/domain/model/Link;",
            name = "getCrossPostParentList",
        ),
        string(" · shared from "),
        methodCall(
            definingClass = "Lcom/reddit/sharing/SharePreview;",
            name = "<init>",
        ),
    ),
)

object LaunchDownloadActionFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lkotlin/jvm/functions/Function1;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/reddit/sharing/actions/handler/ActionsScreenShareActionHandler\$launchDownloadAction\$1;",
            name = "<init>",
        ),
    ),
)

object LaunchOriginalDownloadFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "launchOriginalDownload",
)
