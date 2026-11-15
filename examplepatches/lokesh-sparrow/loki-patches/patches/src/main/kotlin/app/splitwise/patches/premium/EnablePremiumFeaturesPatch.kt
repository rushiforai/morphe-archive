/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.splitwise.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.loki.patches.universal.addMenuFlag
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.loki.patches.universal.menuPatch
import app.splitwise.patches.shared.Constants.COMPATIBILITY_SPLITWISE
import app.splitwise.patches.shared.overrideFeatures

/**
 * Person.isPro(): the cached "this account is Pro" flag (setPro writes it to a database column from the server
 * payload). It gates group reminders, default splits, imported transaction sources, the 1536 px receipt image
 * (ImageUtils) and the Pro labels.
 */
private val isPro = Fingerprint(
    definingClass = "Lcom/Splitwise/SplitwiseMobile/data/Person;",
    name = "isPro",
    returnType = "Z",
    parameters = listOf(),
)

/**
 * ReceiptScanningFeatureStatus.getScanFabVisible(): the scan button on the dashboard. Separate from the
 * receipt_scanning switch: the server can leave the feature on and the button off for free accounts.
 */
private val scanFabVisible = Fingerprint(
    definingClass = "Lcom/Splitwise/SplitwiseMobile/data/ReceiptScanningFeatureStatus;",
    name = "getScanFabVisible",
    returnType = "Z",
    parameters = listOf(),
)

/** Tells the Loki Patches screen this patch was applied. */
private val premiumFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.premium") }
    }
}

@Suppress("unused")
val enablePremiumFeaturesPatch = bytecodePatch(
    name = "Enable premium features (Splitwise)",
    description = "Treats the account as Pro and switches on the paid features: unlimited expense entries, " +
        "search, charts, spreadsheet export, currency conversion, group totals history and stats, default " +
        "splits, reminders, balance alerts, trip dates, larger receipt images and itemization.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPLITWISE)
    dependsOn(menuPatch, premiumFlag)
    extendWith("extensions/extension.mpe")

    execute {
        // 1. The account flag. Only the getter is touched; the stored value stays as the server sent it.
        isPro.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // 2. The scan button on the dashboard.
        scanFabVisible.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // 3. The per-feature switches: visible + enabled means "open the feature" instead of "show Get Pro".
        overrideFeatures(exit = "exitPremium")
    }
}
