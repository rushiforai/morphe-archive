/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.github.shared.Constants.DOWNLOAD_COUNT
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch

private const val COUNT = "Lapp/fakh/extension/github/DownloadCount;"

/** The start of the file list in the query of a release, up to where the new fields go. */
private const val ASSETS = "releaseAssets(first: \$number, after: \$after) { pageInfo { hasNextPage endCursor } nodes { "

@Suppress("unused")
val releaseDownloadCountPatch = patch(
    name = "Release download count",
    description = "Shows how many times each file of a release was downloaded, next to its size.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(DOWNLOAD_COUNT)
        val names = setOf("id", "name", "size", "url", "contentType", "__typename")
        var model: String? = null
        val queries = mutableListOf<Pair<String, String>>()
        val parsers = mutableListOf<String>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val read = method.instructions.mapNotNull { it.string }
                if (read.any { ASSETS in it }) queries += classDef.type to method.name
                if (method.name == "toString" && "ReleaseAsset(id=" in read) model = classDef.type
                // The file's parser lists exactly these field names.
                if (method.name == "<clinit>" && read.toSet() == names &&
                    classDef.methods.any { other -> other.instructions.any { it.selectsName } }
                ) {
                    parsers += classDef.type
                }
            }
        }
        val asset = model ?: throw PatchException("Release file model not found")
        if (queries.isEmpty() || queries.size != parsers.size) {
            throw PatchException("Release queries and parsers do not match: $queries, $parsers")
        }

        // The model takes the id, name, size, address and type of a file as text; the count joins the size.
        val constructor = mutableClassDefBy(asset).methods.singleOrNull { method ->
            method.name == "<init>" && method.types == List(5) { "Ljava/lang/String;" }
        } ?: throw PatchException("Release file constructor not found in $asset")
        constructor.addInstructions(
            0,
            """
                invoke-static { p1, p3 }, $COUNT->label(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object p3
            """,
        )
        queries.forEach { (type, name) ->
            mutableClassDefBy(type).methods.filter { it.name == name }.forEach {
                it.addToQuery(ASSETS, "fakhKey: id downloadCount")
            }
        }
        parsers.forEach { readAddedFields(it, COUNT, "id", "count") }
    }
}
