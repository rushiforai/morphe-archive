package app.morphe.patches.telegraph

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object TelegraphCompatibility {
    val TELEGRAPH = Compatibility(
        name = "Telegraph (Graph Messenger)",
        packageName = "ir.ilmili.telegraph",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0088CC,
        // SHA-256 do certificado original, usado pelo SpoofSignaturePatch para confirmar
        // que o APK de entrada ainda não foi reassinado antes de aplicar o patch.
        signatures = setOf("e7d5ad736aeecd2fe237679e4deaf2a40bb32fc07837fe48778a5b41c0418862"),
        targets = listOf(
            AppTarget(version = "13.0.2.0")
        )
    )
}
