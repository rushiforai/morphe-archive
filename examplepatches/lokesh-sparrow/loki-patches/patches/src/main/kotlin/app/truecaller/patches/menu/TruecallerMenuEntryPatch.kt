/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.truecaller.patches.menu

import app.loki.patches.universal.menuPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

/** Material's outlined puzzle piece ("extension"), the Loki Patches mark, on Truecaller's 24x24 icon grid. */
private const val PUZZLE_OUTLINE =
    "M10.5,4.5c0.28,0 0.5,0.22 0.5,0.5v2h6v6h2c0.28,0 0.5,0.22 0.5,0.5s-0.22,0.5 -0.5,0.5h-2v6h-2.12" +
        "c-0.68,-1.75 -2.39,-3 -4.38,-3s-3.7,1.25 -4.38,3H4v-2.12c1.75,-0.68 3,-2.39 3,-4.38 0,-1.99 -1.24,-3.7 " +
        "-2.99,-4.38L4,7h6V5c0,-0.28 0.22,-0.5 0.5,-0.5m0,-2C9.12,2.5 8,3.62 8,5H4c-1.1,0 -1.99,0.9 -1.99,2v3.8" +
        "h0.29c1.49,0 2.7,1.21 2.7,2.7s-1.21,2.7 -2.7,2.7H2V20c0,1.1 0.9,2 2,2h3.8v-0.3c0,-1.49 1.21,-2.7 2.7,-2.7" +
        "s2.7,1.21 2.7,2.7v0.3H17c1.1,0 2,-0.9 2,-2v-4c1.38,0 2.5,-1.12 2.5,-2.5S20.38,11 19,11V7c0,-1.1 -0.9,-2 " +
        "-2,-2h-4c0,-1.38 -1.12,-2.5 -2.5,-2.5z"

/**
 * Truecaller's "Android watch" entries name a companion app most people never install: the profile menu item
 * (MenuItem.ANDROID_WATCH, string usershome_menu_item_android_watch) and the "Truecaller for Wear OS" row in
 * Settings (settings_watch). Both become "Loki Patches" with the puzzle icon, in every language the app ships.
 */
private val watchEntryResources = resourcePatch {
    execute {
        val names = setOf("usershome_menu_item_android_watch", "settings_watch")
        val valueDirectories = get("res").listFiles { file -> file.isDirectory && file.name.startsWith("values") }
            ?: emptyArray()
        for (directory in valueDirectories) {
            if (!directory.resolve("strings.xml").exists()) continue
            document("res/${directory.name}/strings.xml").use { document ->
                val strings = document.getElementsByTagName("string")
                for (index in 0 until strings.length) {
                    val string = strings.item(index) as? Element ?: continue
                    if (string.getAttribute("name") in names) string.textContent = "Loki Patches"
                }
            }
        }

        if (get("res/drawable/ic_outline_watch_24dp.xml").exists()) {
            document("res/drawable/ic_outline_watch_24dp.xml").use { document ->
                val paths = document.getElementsByTagName("path")
                for (index in 0 until paths.length) {
                    (paths.item(index) as? Element)?.setAttribute("android:pathData", PUZZLE_OUTLINE)
                }
            }
        }
    }
}

/**
 * Every watch entry starts WatchSettingsActivity (it has its own activity, so the profile menu, the Settings row
 * and deep links all arrive here). Right after Hilt's onCreate has run, the screen hands over to the Loki
 * Patches menu and closes; the watch screen itself is never drawn.
 */
private val watchSettingsOnCreate = Fingerprint(
    definingClass = "Lcom/truecaller/settings/impl/ui/watch/WatchSettingsActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * The real watch page: WatchSettingsFragment inside Truecaller's own Settings activity. Both the profile menu
 * item and the Settings row navigate to it (the separate WatchSettingsActivity is only a legacy/deep-link host),
 * so the hand-over has to happen here, when the fragment's view is created.
 */
private val watchFragmentViewCreated = Fingerprint(
    definingClass = "Lcom/truecaller/settings/impl/ui/watch/WatchSettingsFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

/**
 * The Loki Patches entry inside Truecaller. Branding, so it is internal: it applies with every Truecaller patch
 * and never shows as a checkbox in Manager, and no launcher icon is added.
 */
internal val truecallerMenuEntry = bytecodePatch {
    dependsOn(menuPatch, watchEntryResources)

    execute {
        // p1 is the page's view: read at the first instruction, before the method reuses the register.
        watchFragmentViewCreated.method.addInstructions(
            0,
            "invoke-static { p1 }, Lapp/loki/extension/MenuActivity;->replacePage(Landroid/view/View;)V",
        )
        val method = watchSettingsOnCreate.method
        // super.onCreate must have run, or Android throws SuperNotCalledException when the activity finishes.
        val superCall = method.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_SUPER &&
                (instruction as ReferenceInstruction).reference.toString().endsWith("->onCreate(Landroid/os/Bundle;)V")
        }
        if (superCall < 0) throw PatchException("WatchSettingsActivity.onCreate has no super.onCreate call")

        method.addInstructions(
            superCall + 1,
            """
                invoke-static { p0 }, Lapp/loki/extension/MenuActivity;->replace(Landroid/app/Activity;)V
                return-void
            """,
        )
    }
}
