package app.d0nj.patches.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import java.io.File

private val bundledResourceLoader: ClassLoader = object : Any() {}.javaClass.classLoader

internal fun ResourcePatchContext.copyBundledResources(
    sourceDirectory: String,
    relativePaths: List<String>,
) {
    val resourceDirectory = get("res")

    relativePaths.forEach { relativePath ->
        val stream = bundledResourceLoader.getResourceAsStream("$sourceDirectory/$relativePath")
            ?: throw PatchException("Missing bundled resource: $sourceDirectory/$relativePath")

        val target = resourceDirectory.resolve(File(relativePath).path)
        target.parentFile.mkdirs()
        stream.use { input -> target.outputStream().use(input::copyTo) }
    }
}
