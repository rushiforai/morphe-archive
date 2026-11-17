// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.misc.backup

import app.morphe.patcher.patch.bytecodePatch
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.baconreader.misc.settings.markPatchIncluded
import io.github.joancomasfdz.patches.baconreader.misc.settings.settingsPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

// BaconReader keeps its settings only on the device: a new phone or a reinstall starts from the defaults, and each
// setting has to be found and set again, the patches' too. The rows are on the patches' settings screen, which runs
// the extension's export and import.
@Suppress("unused")
val exportAndImportSettingsPatch = bytecodePatch(
    name = "Export and import settings",
    description = "Adds Export settings and Import settings to the patches' settings, which save BaconReader's " +
        "settings, the patches' settings and the accounts' colors to a YAML file, and restore them from it.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch, settingsPatch)

    execute {
        markPatchIncluded("exportAndImportSettings")
    }
}
