package app.crimera.patches.newx.misc.customsharingdomain

import app.crimera.patches.newx.settings.Categories
import app.crimera.patches.newx.settings.newXToggle
import app.crimera.patches.newx.utils.Constants.COMPATIBILITY_NEW_X
import app.crimera.patches.newx.utils.unsupportedOnMount
import app.crimera.patches.settings.settingStrings
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val newXRemoveShareTrackingQueryPatch =
    bytecodePatch(
        name = "NewX: Remove share tracking parameters",
        description = "共有するXのURLから帰属パラメータ（a= と s=）を取り除く、リンクの設定を追加します。",
    ) {
        unsupportedOnMount()
        compatibleWith(COMPATIBILITY_NEW_X)

        newXToggle(
            id = "newx.links.remove_share_tracking_query",
            category = Categories.LINKS,
            strings = settingStrings("piko_newx_remove_share_tracking_query"),
            order = 520,
            defaultValue = true,
        )

        dependsOn(newXSharedUrlRewritePatch)
    }
