package io.github.ilikeadofai.vocacolle.patches

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import io.github.ilikeadofai.vocacolle.patches.shared.Constants.VOCACOLLE

private val KOREAN_RESOURCE_FILES = listOf("strings.xml", "plurals.xml", "arrays.xml")

@Suppress("unused")
val vocacolleStaticKoreanUiPatch = resourcePatch(
    name = null,
    description = "Adds reviewed Korean resources for all app and library static UI strings, plurals, and arrays.",
    default = true
) {
    compatibleWith(VOCACOLLE)

    execute {
        val classLoader = object {}.javaClass.classLoader
        KOREAN_RESOURCE_FILES.forEach { fileName ->
            val resourcePath = "vocacolle/values-ko/$fileName"
            val targetPath = "res/values-ko/$fileName"
            val input = classLoader.getResourceAsStream(resourcePath)
                ?: throw PatchException("Missing patch resource: $resourcePath")
            val output = this[targetPath, false]

            output.parentFile.mkdirs()
            input.use { source ->
                output.outputStream().use { destination ->
                    source.copyTo(destination)
                }
            }
        }
    }
}