/*
 * Copyright 2025 Morphe.
 * https://github.com/MorpheApp
 */

package util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import java.io.File
import java.net.URLClassLoader
import java.util.jar.Manifest

fun main() {
    // build/libs には過去のバージョンの .mpp が残るため、列挙順の先頭を選ぶと古い
    // バンドルからバージョンとパッチ一覧を生成してしまいます。更新時刻が最も新しい
    // ものを選び、いま build したバンドルを必ず対象にします。
    val candidates = File("build/libs/").listFiles { file ->
        val fileName = file.name
        !fileName.contains("javadoc") &&
                !fileName.contains("sources") &&
                fileName.endsWith(".mpp")
    }.orEmpty()
    check(candidates.isNotEmpty()) { "build/libs に .mpp がありません。先に build を実行してください。" }

    val patchFiles = setOf(candidates.maxBy { it.lastModified() })
    val loadedPatches = loadPatchesFromJar(patchFiles)
    val patchClassLoader = URLClassLoader(patchFiles.map { it.toURI().toURL() }.toTypedArray())
    val manifest = patchClassLoader.getResources("META-INF/MANIFEST.MF")

    while (manifest.hasMoreElements()) {
        Manifest(manifest.nextElement().openStream())
            .mainAttributes
            .getValue("Version")
            ?.let {
                generatePatchList(it, loadedPatches)
            }
    }
}

@Suppress("DEPRECATION")
private fun generatePatchList(version: String, patches: Set<Patch<*>>) {
    val listJson = File("../patches-list.json")

    val patchesMap = patches.sortedBy { it.name }.map { patch ->
        JsonPatch(
            name = patch.name!!,
            description = patch.description,
            default = patch.default,
            dependencies = patch.dependencies.map { it.javaClass.simpleName },
            // 各 Compatibility を完全なメタデータを含む JsonCompatibility オブジェクトにマッピングします。
            // compatiblePackages が null のパッチは universal（任意のアプリに適用）です。
            compatiblePackages = patch.compatibility?.map { compat ->
                JsonCompatibility(
                    packageName = compat.packageName!!,
                    name = compat.name,
                    description = compat.description,
                    apkFileType = compat.apkFileType?.name,
                    // 可読性のため #RRGGBB 形式の文字列にします。未設定の場合は null です。
                    appIconColor = compat.appIconColor?.let { "#%06X".format(it) },
                    signatures = compat.signatures,
                    targets = compat.targets.map { target ->
                        JsonCompatibility.Target(
                            version = target.version,
                            versionCodes = target.versionCodes?.mapKeys { it.key.name },
                            isExperimental = target.isExperimental,
                            minSdk = target.minSdk,
                            description = target.description,
                        )
                    },
                )
            },
            options = patch.options.values.map { option ->
                JsonPatch.Option(
                    key = option.key,
                    title = option.title,
                    description = option.description,
                    required = option.required,
                    type = option.type.toString(),
                    default = option.default,
                    values = option.values,
                )
            }
        )
    }

    val gson = GsonBuilder()
        .serializeNulls()
        .disableHtmlEscaping()
        .setPrettyPrinting()
        .create()

    val jsonObject = JsonObject()
    jsonObject.addProperty(
        "NOTE",
        "Do NOT manually edit this file. This file is automatically updated when " +
                "semantic release (release.yml) runs. Manually editing this file can break " +
                "your releases and break third party tools that use this file."
    )
    jsonObject.addProperty("version", version)
    jsonObject.add("patches", gson.toJsonTree(patchesMap))

    listJson.writeText(gson.toJson(jsonObject))
}

/** patches-list.json のパッチエントリを表す JSON。 */
@Suppress("unused")
private class JsonPatch(
    val name: String? = null,
    val description: String? = null,
    val default: Boolean = true,
    val dependencies: List<String>,
    /** null はパッチが universal で、任意のアプリに適用されることを示します。 */
    val compatiblePackages: List<JsonCompatibility>? = null,
    val options: List<Option>,
) {
    class Option(
        val key: String,
        val title: String?,
        val description: String?,
        val required: Boolean,
        val type: String,
        val default: Any?,
        val values: Map<String, Any?>?,
    )
}

/** 名前とバージョンごとのメタデータを含む、互換アプリのエントリを表す JSON。 */
@Suppress("unused")
private class JsonCompatibility(
    /** Android の package 名（例: com.google.android.youtube）。 */
    val packageName: String,
    /** Compatibility で宣言された、人が読めるアプリ名（例: "YouTube"）。 */
    val name: String?,
    /** アプリに対するユーザー向けの説明。 */
    val description: String?,
    /** パッチ未適用アプリの対象ファイル種別（例: APK、APKM）。未指定の場合は null。 */
    val apkFileType: String?,
    /** #RRGGBB 形式のアプリアイコン背景色。未設定の場合は null。 */
    val appIconColor: String?,
    /** アプリの有効な SHA-256 署名。 */
    val signatures: Set<String>?,
    val targets: List<Target>,
) {
    class Target(
        val version: String?,
        val versionCodes: Map<String, Int>?,
        val isExperimental: Boolean,
        /** デバイスの最小 SDK バージョン。null は任意の SDK バージョンを示します。 */
        val minSdk: Int?,
        /** この特定のバージョンに対する任意のユーザー向け注記。 */
        val description: String?,
    )
}
