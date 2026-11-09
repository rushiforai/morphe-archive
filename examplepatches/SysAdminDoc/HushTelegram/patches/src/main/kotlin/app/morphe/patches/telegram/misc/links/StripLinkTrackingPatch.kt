/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.links

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel

@Suppress("unused")
val stripLinkTrackingPatch = bytecodePatch(
    name = "Strip link tracking",
    description = "Removes tracking tags like utm_source, gclid and fbclid from links you open or share. Links with any" +
        " other extra part stay unchanged. A second switch, Clean links when you copy or paste, does the same for a link " +
        "you copy or paste into the message box. A third, No automatic sign-in on Telegram's sites, opens links to " +
        "Telegram's own websites without the sign-in token Telegram adds for your account. All start off. Turn them " +
        "on in HushTelegram settings > More settings > Links.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    // The paste editors are also Use normal paste's, which runs later and refuses an editor that isn't
    // stock. Found while they still are, they get their watch once every patch has run.
    var pastes: CopyPasteSites? = null
    execute {
        pastes = null
        listOf("stripLinkTracking", "openedLinkTracking", "sharedLinkTracking", "skipAutologin").forEach { requireStatusMethod(it) }
        val plan = resolveLinkHooks()
        requireRuntime("cleanOpenedUri", listOf(URI, "Z", "[Z"), URI)
        requireRuntime("cleanShareIntent", listOf(INTENT), INTENT)
        requireRuntime("addAutologinToken", listOf("Z"), "Z")
        val autologin = resolveAutologinGate(plan)
        checkShape(plan.shares.isNotEmpty(), "no verified Share Link chooser")
        // Copying and pasting come second: a build without them keeps opened and shared links cleaned.
        listOf("copiedLinkTracking", "pastedLinkTracking").forEach { requireStatusMethod(it) }
        val copyPaste = try {
            resolveCopyPaste()
        } catch (unfit: PatchException) {
            patchLog.warning("Strip link tracking: ${unfit.message}. Links you copy and paste are left as they are.")
            null
        }
        writeProtection(plan)
        // The sign-in token check comes after the cleaner's site, so it goes in first and that index still holds.
        plan.browser.addInstructionsAtControlFlowLabel(autologin.index, autologin.code)
        plan.browser.addInstructionsAtControlFlowLabel(plan.cleanIndex, plan.cleanCode)
        plan.shares.groupBy { it.method }.forEach { (method, sites) ->
            sites.sortedByDescending { it.index }.forEach { site ->
                method.addInstructionsAtControlFlowLabel(site.index,
                    "invoke-static {v${site.register}}, $LINKS->cleanShareIntent($INTENT)$INTENT\nmove-result-object v${site.register}")
            }
        }
        copyPaste?.let { sites ->
            sites.insertCopy()
            enableCapability("copiedLinkTracking")
        }
        pastes = copyPaste?.takeIf { it.pastes.isNotEmpty() }
        enableCapability("openedLinkTracking")
        enableCapability("sharedLinkTracking")
        enableCapability("skipAutologin")
        enableStatus("stripLinkTracking")
    }
    finalize {
        pastes?.let { sites ->
            sites.insertPastes()
            enableCapability("pastedLinkTracking")
        }
        pastes = null
    }
}
