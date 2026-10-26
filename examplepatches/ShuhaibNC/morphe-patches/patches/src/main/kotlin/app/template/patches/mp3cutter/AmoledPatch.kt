package app.template.patches.mp3cutter

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MP3CUTTER_COMPATIBILITY

private val bundleClassLoader: ClassLoader = object {}.javaClass.classLoader

@Suppress("unused")
val amoledPatch = resourcePatch(
    name = "Amoled Theme",
    description = "Replaces the app background graphics.",
    default = true
) {
    compatibleWith(MP3CUTTER_COMPATIBILITY)

    execute {
        mapOf(
            "bluebg.png" to "res/drawable-hdpi/bluebg.png",
            "fbtopgrad.png" to "res/drawable/fbtopgrad.png",
        ).forEach { (resourceName, targetPath) ->
            val resource = bundleClassLoader.getResourceAsStream(resourceName)
                ?: throw PatchException(
                    "Resource '$resourceName' not found in patch resources. " +
                        "Ensure it is placed in 'patches/src/main/resources/'."
                )

            resource.use { input ->
                get(targetPath).outputStream().use { output ->
                    input.copyTo(output)
                }
            }
        }
    }
}