package dev.utaa.linimal.patches.settings

import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import dev.utaa.linimal.patches.core.linimalBootstrapPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.patchStatusCollector

internal object LinimalSettingsResource {
    const val PATH = "res/values/strings.xml"
    const val TITLE_NAME = "linimal_settings_title"
    const val TITLE_VALUE = "Linimal"
}

/** 設定項目が参照する文字列を、既存の値を書き換えずに 1 件だけ追加します。 */
val linimalSettingsResourcePatch = resourcePatch(
    name = "Linimal settings strings",
    description = "Linimal の設定項目が参照する文字列 resource を追加します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(linimalBootstrapPatch)

    execute {
        try {
            document(LinimalSettingsResource.PATH).use { document ->
                val resources = document.documentElement
                    ?: throw PatchException("Linimal Settings string resource root is missing.")

                val existing = document.getElementsByTagName("string")
                for (index in 0 until existing.length) {
                    val element = existing.item(index) as? org.w3c.dom.Element ?: continue
                    if (element.getAttribute("name") == LinimalSettingsResource.TITLE_NAME) {
                        throw PatchException("Linimal Settings string resource already exists.")
                    }
                }

                val string = document.createElement("string")
                string.setAttribute("name", LinimalSettingsResource.TITLE_NAME)
                string.textContent = LinimalSettingsResource.TITLE_VALUE
                resources.appendChild(string)
            }
        } catch (error: Exception) {
            patchStatusCollector.record(
                patchId = PatchId.SETTINGS_RESOURCE,
                expectedTargetCount = 1,
                actualTargetCount = 0,
                reason = "SettingsResourceWriteFailed",
            )
            throw PatchException("Cannot safely add the Linimal Settings string resource.", error)
        }

        patchStatusCollector.record(
            patchId = PatchId.SETTINGS_RESOURCE,
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "SettingsResourceAdded",
        )
    }
}
