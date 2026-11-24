/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.webetu.misc.pairip

import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patches.shared.removeElements
import app.morphe.patches.shared.returnEarlyVoidAll
import app.morphe.patches.webetu.shared.WebetuConstants

private const val PAIRIP_APPLICATION = "Lcom/pairip/application/Application;"
private val PAIRIP_TAGS = listOf("activity", "activity-alias", "service", "receiver", "provider", "meta-data")

@Suppress("unused")
val removePairIpProtectionPatch = patch(
    name = "Remove PairIP protection",
    description = "Removes Google Play's PairIP anti-tamper wrapper, restores the original Application " +
            "class, strips com.pairip.* components and CHECK_LICENSE, and neuters the license client.",
    default = true,
) {
    category("Security")
    compatibleWith(WebetuConstants.COMPATIBILITY_WEBETU)
    availability { installer, _ ->
        if (installer == InstallerType.MOUNT) PatchAvailability.DISABLED else PatchAvailability.REQUIRED
    }

    execute {
        val pairipApp = mutableClassDefBy(PAIRIP_APPLICATION)
        val originalApp = requireNotNull(pairipApp.superclass) {
            "Could not determine original Application superclass in PairIP wrapper"
        }.removePrefix("L").removeSuffix(";").replace('/', '.')

        pairipApp.returnEarlyVoidAll { it.name == "attachBaseContext" }

        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.elements("application").firstOrNull()?.setAttribute("android:name", originalApp)
            manifest.removeElements(PAIRIP_TAGS) {
                it.attribute("android:name")?.startsWith("com.pairip.") == true
            }
            manifest.removeElements(listOf("uses-permission")) {
                it.attribute("android:name") == "com.android.vending.CHECK_LICENSE"
            }
        }
    }
}
