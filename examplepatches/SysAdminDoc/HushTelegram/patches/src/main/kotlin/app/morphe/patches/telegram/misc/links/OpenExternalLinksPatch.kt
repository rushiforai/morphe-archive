/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.links

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel

@Suppress("unused")
val openExternalLinksPatch = bytecodePatch(
    name = "Open links externally",
    description = "Opens ordinary web links in your browser instead of inside Telegram. Telegram links, sign-in and " +
        "payment pages work as before. On by default. Turn it off in HushTelegram settings > More settings > " +
        "Links.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch, browserVisibilityPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        listOf("openExternalLinks", "externalBrowserRouting").forEach { requireStatusMethod(it) }
        val plan = resolveLinkHooks()
        requireRuntime("tryOpenExternal", listOf(CONTEXT, URI, "Z", "[Z", "Ljava/lang/String;"), "Z")
        writeProtection(plan)
        plan.browser.addInstructionsAtControlFlowLabel(plan.routingIndex, plan.routingCode)
        enableCapability("externalBrowserRouting")
        enableStatus("openExternalLinks")
    }
}
