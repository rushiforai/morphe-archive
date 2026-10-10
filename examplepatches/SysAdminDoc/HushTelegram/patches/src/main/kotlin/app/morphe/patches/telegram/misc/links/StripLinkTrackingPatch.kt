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
val stripLinkTrackingPatch = bytecodePatch(
    name = "Strip link tracking",
    description = "Removes tracking tags like utm_source, gclid and fbclid from links you open or share. Links with any" +
        " other extra part stay unchanged. Starts off. Turn it on in HushTelegram settings > More settings > " +
        "Links.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        listOf("stripLinkTracking", "openedLinkTracking", "sharedLinkTracking").forEach { requireStatusMethod(it) }
        val plan = resolveLinkHooks()
        requireRuntime("cleanOpenedUri", listOf(URI, "Z", "[Z"), URI)
        requireRuntime("cleanShareIntent", listOf(INTENT), INTENT)
        checkShape(plan.shares.isNotEmpty(), "no verified Share Link chooser")
        writeProtection(plan)
        plan.browser.addInstructionsAtControlFlowLabel(plan.cleanIndex, plan.cleanCode)
        plan.shares.groupBy { it.method }.forEach { (method, sites) ->
            sites.sortedByDescending { it.index }.forEach { site ->
                method.addInstructionsAtControlFlowLabel(site.index,
                    "invoke-static {v${site.register}}, $LINKS->cleanShareIntent($INTENT)$INTENT\nmove-result-object v${site.register}")
            }
        }
        enableCapability("openedLinkTracking")
        enableCapability("sharedLinkTracking")
        enableStatus("stripLinkTracking")
    }
}
