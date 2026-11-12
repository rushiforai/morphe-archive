package dev.utaa.linimal.patches.features.readwithoutreceipt

import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import dev.utaa.linimal.patches.features.home.homeFeedLoadingIndicatorPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.patchStatusCollector

/**
 * トーク一覧の長押しメニューに追加する「既読をつけずに読む」のラベル文字列。
 *
 * <p>[readWithoutReceiptComposeMenuPatch] が描く行のラベルです。resource ID は build 時に確定せず
 * smali の定数として埋め込めないため、ここでは `linimalSettingsResourcePatch` と同じ仕組み
 * （既存の値を書き換えず、名前つきの `&lt;string&gt;` を 1 件だけ追加）で resource を追加し、
 * 実行時に `Resources.getIdentifier` で解決します
 * （[dev.utaa.linimal.extension.features.readwithoutreceipt.ChatListMenuHooks.menuLabel]）。</p>
 */
internal object ReadWithoutReceiptMenuLabelResource {
    const val PATH = "res/values/strings.xml"
    const val NAME = "linimal_read_without_receipt_menu_label"
    const val VALUE = "既読をつけずに読む"
}

/** 設定項目が参照する文字列を、既存の値を書き換えずに 1 件だけ追加します。 */
val readWithoutReceiptMenuLabelResourcePatch = resourcePatch(
    name = "Read without receipt strings",
    description = "「既読をつけずに読む」のメニュー項目が参照する文字列 resource を追加します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    // 機能パッチは単一の直列チェーンを成し、この patch の後段に他の read-without-receipt patch が続きます。
    dependsOn(homeFeedLoadingIndicatorPatch)

    execute {
        try {
            document(ReadWithoutReceiptMenuLabelResource.PATH).use { document ->
                val resources = document.documentElement
                    ?: throw PatchException("ReadWithoutReceipt menu label string resource root is missing.")

                val existing = document.getElementsByTagName("string")
                for (index in 0 until existing.length) {
                    val element = existing.item(index) as? org.w3c.dom.Element ?: continue
                    if (element.getAttribute("name") == ReadWithoutReceiptMenuLabelResource.NAME) {
                        throw PatchException("ReadWithoutReceipt menu label string resource already exists.")
                    }
                }

                val string = document.createElement("string")
                string.setAttribute("name", ReadWithoutReceiptMenuLabelResource.NAME)
                string.textContent = ReadWithoutReceiptMenuLabelResource.VALUE
                resources.appendChild(string)
            }
        } catch (error: Exception) {
            patchStatusCollector.record(
                patchId = PatchId.READ_WITHOUT_RECEIPT_MENU_LABEL_RESOURCE,
                expectedTargetCount = 1,
                actualTargetCount = 0,
                reason = "ReadWithoutReceiptMenuLabelResourceWriteFailed",
            )
            throw PatchException("Cannot safely add the ReadWithoutReceipt menu label string resource.", error)
        }

        patchStatusCollector.record(
            patchId = PatchId.READ_WITHOUT_RECEIPT_MENU_LABEL_RESOURCE,
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "ReadWithoutReceiptMenuLabelResourceAdded",
        )
    }
}
