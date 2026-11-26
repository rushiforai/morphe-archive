package app.rimixyz.patches.notisave

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NOTISAVE

@Suppress("unused")
val translatePortugueseInNotisavePatch = patch(
    name = "Translate to Brazilian Portuguese",
    description = "Adds Brazilian Portuguese translations for Notisave when the device language is Portuguese (Brazil).",
    default = false,
) {
    compatibleWith(COMPATIBILITY_NOTISAVE)

    execute {
        verifyNotisaveTarget()

        for (fileName in listOf("strings.xml", "plurals.xml")) {
            val resourcePath = "res/values-pt-rBR/$fileName"
            val translations = checkNotNull(
                object {}.javaClass.getResourceAsStream("/app/rimixyz/patches/notisave/$resourcePath"),
            ) { "Notisave: missing Brazilian Portuguese resource $fileName" }
            translations.use { input ->
                val destination = resourceFile(resourcePath, copy = false)
                destination.parentFile.mkdirs()
                destination.outputStream().use { output -> input.copyTo(output) }
            }
        }
    }
}
