package dev.utaa.linimal.patches.status

import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.rawResourcePatch
import dev.utaa.linimal.patches.shared.Constants

/**
 * 最終的な build-time status report を raw APK asset として書き込みます。raw-resource モードは意図的なものです。
 * このパッチは対象アプリのコンパイル済み Android resources を変更しません。
 */
val patchStatusResourcePatch = rawResourcePatch(
    name = "Linimal patch status",
    description = "各パッチの適用結果を APK 内の asset として書き出します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }

    execute {
        patchStatusCollector.reset()
        patchStatusCollector.record(
            patchId = PatchId.PATCH_STATUS_RESOURCE,
            expectedTargetCount = 0,
            actualTargetCount = 0,
            reason = "Status report resource prepared.",
        )
    }

    finalize {
        val destination = get(Constants.PATCH_STATUS_ASSET_PATH, copy = false)
        destination.parentFile?.mkdirs()
        destination.writeText(patchStatusCollector.toJson())
    }
}
