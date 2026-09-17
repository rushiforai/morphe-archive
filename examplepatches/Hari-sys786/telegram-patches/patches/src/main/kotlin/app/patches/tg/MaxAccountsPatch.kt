package app.patches.tg

import app.morphe.patcher.patch.bytecodePatch
import app.patches.tg.TgSupport.replaceMethodBody

/**
 * Patch 21 — Raise the client-side account limit to 999.
 *
 * ENABLED BY DEFAULT: makes UserConfig.getMaxAccountCount() return 999 instead of the stock
 * 3 (or 5 when hasPremiumOnAccounts() is true).
 */
@Suppress("unused")
val raiseMaxAccountCountPatch = bytecodePatch(
    name = "Raise max account count (999)",
    description = "Makes UserConfig.getMaxAccountCount() return 999 instead of 3/5, removing the " +
        "stock limit on the number of accounts that can be added.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        replaceMethodBody(
            classType = TgSupport.desc("org/telegram/messenger/UserConfig"),
            name = "getMaxAccountCount",
            locals = 1,
            body = """
                const/16 v0, 0x3e7
                return v0
            """.trimIndent(),
        )
    }
}
