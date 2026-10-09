/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.samsung.dailyboard.misc.phonesupport

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.samsung.dailyboard.shared.Constants.COMPATIBILITY_DAILY_BOARD
import app.morphe.util.returnEarly
import org.w3c.dom.Element


private val chargingLabelsPatch = resourcePatch {
    execute {
        fun replacePogoLabels(path: String, title: String, condition: String, description: String) {
            val replacements = mapOf(
                "auto_start_with_pogo" to title,
                "when_auto_start_with_pogo" to condition,
                "auto_start_description" to description,
            )
            val missing = replacements.keys.toMutableSet()
            document(path).use { document ->
                val strings = document.getElementsByTagName("string")
                for (index in 0 until strings.length) {
                    val entry = strings.item(index) as? Element ?: continue
                    val name = entry.getAttribute("name")
                    val replacement = replacements[name] ?: continue
                    entry.textContent = replacement
                    missing.remove(name)
                }
            }
            if (missing.isNotEmpty()) {
                throw PatchException("Daily Board POGO strings were not found in $path: $missing")
            }
        }
        replacePogoLabels(
            "res/values/strings.xml",
            "Wireless or landscape USB charging",
            "With wireless or landscape USB charging",
            "Daily Board starts during wireless charging or wired charging in landscape.",
        )
        replacePogoLabels(
            "res/values-it/strings.xml",
            "Wireless o USB in landscape",
            "Con ricarica wireless o USB in landscape",
            "Bacheca giornaliera si avvia con la ricarica wireless o USB in landscape.",
        )
    }
}

@Suppress("unused")
val dailyBoardChargingDockPatch = bytecodePatch(
    name = "Use phone charging as dock",
    description = "Treats wireless charging or charging in landscape as a dock and updates the charging labels. Includes Enable phone support.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DAILY_BOARD)
    dependsOn(enableDailyBoardOnPhonesPatch, chargingLabelsPatch)

    execute {
        PogoFeatureFingerprint.method.returnEarly(true)
        DockingFingerprint.method.addInstructionsWithLabels(
            0,
            """
                new-instance v0, Landroid/content/IntentFilter;
                const-string v1, "android.intent.action.BATTERY_CHANGED"
                invoke-direct { v0, v1 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
                const/4 v1, 0x0
                const/4 v2, 0x2
                invoke-virtual { p0, v1, v0, v2 }, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;
                move-result-object v0
                if-eqz v0, :check_landscape
                const-string v1, "plugged"
                const/4 v2, -0x1
                invoke-virtual { v0, v1, v2 }, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
                move-result v0
                const/4 v1, 0x4
                if-eq v0, v1, :phone_docked

                :check_landscape
                invoke-static { p0 }, Lcom/samsung/android/homemode/infra/utils/e;->a(Landroid/content/Context;)Z
                move-result v0
                if-eqz v0, :original_dock_check
                invoke-virtual { p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v0
                invoke-virtual { v0 }, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
                move-result-object v0
                iget v0, v0, Landroid/content/res/Configuration;->orientation:I
                const/4 v1, 0x2
                if-ne v0, v1, :original_dock_check

                :phone_docked
                const/4 v0, 0x1
                return v0

                :original_dock_check
                nop
            """
        )
    }
}
