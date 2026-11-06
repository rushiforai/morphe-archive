// Adapted from archivesteak/Quest Pinterest patches (GPL-3.0).
package app.template.patches.pinterest.video

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

internal const val IS_VIDEO_LABEL = ", isVideo="

/** `GridActionsViewParams.toString()`, the options the Pin overflow menu is built from. */
internal object GridActionsViewParamsToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(
        string("GridActionsViewParams(reason="),
        string(IS_VIDEO_LABEL),
    )
)

internal const val IS_STATIC_IMAGE_IDEA_PIN_LABEL = ", isStaticImageIdeaPin="

/** `OverflowMenuCreationConfig.toString()`, more options the Pin overflow menu is built from. */
internal object OverflowMenuCreationConfigToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(
        string("OverflowMenuCreationConfig(isPinCloseup="),
        string(IS_STATIC_IMAGE_IDEA_PIN_LABEL),
    )
)

/** Static initializer of the Pin overflow menu item enum (`COPY_LINK`, `DOWNLOAD`, ...). */
internal object OverflowMenuItemEnumFingerprint : Fingerprint(
    name = "<clinit>",
    filters = listOf(
        string("COPY_LINK"),
        string("SET_AS_INSPIRATION"),
        string("DOWNLOAD"),
    )
)

/**
 * Click handlers of the overflow menu's "Download image" row. They hand the Pin's
 * id to the image downloader, whose entry point takes these four parameters.
 */
internal object DownloadImageClickFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "L"),
    filters = listOf(
        methodCall(
            parameters = listOf(
                "Landroid/content/Context;",
                "Landroid/app/Activity;",
                "Lkotlin/jvm/functions/Function1;",
                "Lkotlin/jvm/functions/Function0;",
            ),
            returnType = "V",
        ),
        string("pinUid"),
    )
)
