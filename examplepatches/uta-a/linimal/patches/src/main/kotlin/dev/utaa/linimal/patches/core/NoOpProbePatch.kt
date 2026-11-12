package dev.utaa.linimal.patches.core

import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import dev.utaa.linimal.patches.features.readers.readReceiptReadersPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.patchStatusCollector

/**
 * bytecode patch pipeline が、対象コードを選択・変更せずに実行されたことを確認します。
 * fingerprint は意図的に宣言せず、命令も出力しません。
 */
val noOpProbePatch = bytecodePatch(
    name = "Linimal patch probe",
    description = "bytecode パッチの処理が対象を変更せずに最後まで実行されたことを確認します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    // この依存関係により、Set の反復順にかかわらず全ての機能パッチより後に probe が実行されます。
    // 機能パッチは bootstrap、extension 統合、component 登録、status reset の順に依存します。
    dependsOn(readReceiptReadersPatch)

    execute {
        patchStatusCollector.record(
            patchId = PatchId.NO_OP_PROBE,
            expectedTargetCount = 0,
            actualTargetCount = 0,
            reason = "No bytecode targets intentionally selected.",
        )
    }
}
