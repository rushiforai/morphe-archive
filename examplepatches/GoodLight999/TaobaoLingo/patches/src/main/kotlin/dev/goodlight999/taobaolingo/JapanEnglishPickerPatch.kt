/*
 * TaobaoLingo — Japanese region English selector experiment.
 * SPDX-License-Identifier: GPL-3.0-only
 */
package dev.goodlight999.taobaolingo

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.nio.charset.StandardCharsets
import java.nio.file.Files

private val boardingCompatibility = Compatibility(
    name = "Taobao",
    packageName = "com.taobao.taobao",
    apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(version = "10.66.30", isExperimental = true))
)

/**
 * Only changes the OFFLINE fallback selection list for JP in the bundled
 * onboarding metadata. Does not mutate protocol/edition settings and does not
 * make English the default. The live server-provided LocaleModel.reqData may
 * supersede this bundled list — the patch is explicitly experimental.
 */
@Suppress("unused")
val japanEnglishPickerPatch = rawResourcePatch(
    name = "TaobaoLingo: Show English in Japan locale picker (fallback)",
    description = "Offer English alongside Chinese in Japan's bundled onboarding locale choices; server data may override it.",
    default = false
) {
    compatibleWith(boardingCompatibility)
    execute {
        val path = get("assets/boarding/data.json").toPath()
        val original = Files.readString(path, StandardCharsets.UTF_8)
        val before = "\"langs\":[{\"defaultLang\":\"true\",\"lang\":\"zh_CN\",\"langName\":\"中文\"}],\"site\":\"JP\""
        val after = "\"langs\":[{\"defaultLang\":\"true\",\"lang\":\"zh_CN\",\"langName\":\"中文\"},{\"defaultLang\":\"false\",\"lang\":\"en_US\",\"langName\":\"English\"}],\"site\":\"JP\""
        if (original.contains(after)) return@execute
        if (original.indexOf(before) < 0 || original.indexOf(before) != original.lastIndexOf(before)) {
            throw PatchException("Expected exactly one supported JP locale entry in assets/boarding/data.json")
        }
        Files.writeString(path, original.replace(before, after), StandardCharsets.UTF_8)
    }
}
