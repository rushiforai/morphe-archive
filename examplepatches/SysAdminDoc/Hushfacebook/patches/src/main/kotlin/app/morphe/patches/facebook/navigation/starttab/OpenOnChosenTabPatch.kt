/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.starttab

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.settings.MAIN_TAB_ACTIVITY
import app.morphe.patches.facebook.misc.settings.declaredInHierarchy
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/**
 * Opens Facebook on the tab chosen in Hushfacebook's settings when it's started from its launcher
 * icon. See StartTabAnchors.kt for how Facebook picks its start tab, and the extension's
 * StartTabRoute for what the hook leaves alone.
 *
 * The hook goes first in the onCreate of the main screen's class hierarchy, the method the settings
 * entry already starts in, where the screen's intent is known and nothing of Facebook's has read it
 * yet. It takes the parameters as they come, so it borrows no register.
 *
 * Off in the default selection: it changes where Facebook opens, which is a choice to make. Picked,
 * its switch starts on and the tab starts as Marketplace.
 */
@Suppress("unused")
val openOnChosenTabPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Open on a chosen tab",
    description = "Opens Facebook on the tab you pick in Hushfacebook's settings when you start it from its icon. " +
        "It's Marketplace unless you change it. Notifications and links still open where they lead.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        // The route the extension asks by has to be there to be taken. A build whose start tab
        // picker no longer reads the extra would apply this patch and never open the chosen tab.
        val pickers = classDefByStrings(TARGET_TAB_ID, StringComparisonType.EQUALS)
            .flatMap { owner -> owner.methods.filter(::picksStartTab) }
        if (pickers.size != 1) {
            throw PatchException(
                "$PATCH: expected one method that answers Facebook's start tab from an intent's " +
                    "\"$TARGET_TAB_ID\", found ${pickers.size}. Facebook no longer opens a tab the way this patch asks for one.",
            )
        }
        declaredInHierarchy(MAIN_TAB_ACTIVITY, "onCreate", "Landroid/os/Bundle;")
            .addInstruction(0, "invoke-static/range { p0 .. p1 }, $ROUTE")
        enableStatus("startTab")
    }
}
