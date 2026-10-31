package app.yydarlinker.patches.deepseekcaptions

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

/**
 * What the selected patches ask of the native caption flow. The public root installs the hooks in
 * `finalize`, when every selected patch has executed.
 */
internal object CaptionFeatures {
    var translation = false
}

/** The icon of the add-on's row in the player's menu, for the regular player and for Shorts. */
private const val MENU_ICON = """<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
    <path android:fillColor="?android:attr/textColorPrimary"
        android:pathData="M3,5L17,5L17,17L8,17L4,21L4,17L3,17ZM5,7L5,15L15,15L15,7ZM6,9L14,9L14,10.5L6,10.5ZM6,12L12,12L12,13.5L6,13.5ZM20,1L21,4L24,5L21,6L20,9L19,6L16,5L19,4Z" />
</vector>
"""

/** Adds the icon and the strings of the add-on, in every language that it was translated to, to the app's resources. */
private val captionResourcesPatch = resourcePatch {
    execute {
        get("res/drawable").mkdirs()
        get("res/drawable/deepseek_caption_settings.xml").writeText(MENU_ICON)

        val loader = CaptionFeatures.javaClass.classLoader
        fun read(path: String) = loader.getResourceAsStream("captionlocales/$path")?.bufferedReader()?.use { it.readText() }
            ?: error("Caption locale resource missing: $path")

        for (folder in read("index.txt").lineSequence().filter { it.isNotBlank() }) {
            val destination = get("res/$folder/strings.xml")
            destination.parentFile.mkdirs()
            if (!destination.exists()) destination.writeText("<resources/>")
            document("res/$folder/strings.xml").use { target ->
                document(read("$folder/caption_addon_strings.xml").byteInputStream()).use { source ->
                    val strings = source.getElementsByTagName("string")
                    for (index in 0 until strings.length) {
                        target.documentElement.appendChild(target.importNode(strings.item(index), true))
                    }
                }
            }
        }
    }
}

/**
 * The part that every caption patch of the add-on needs: the extension itself, and the call that hands YouTube's main
 * activity to it. The public AI root finalizes the native caption hooks after all patches execute.
 */
internal val captionSupportPatch = bytecodePatch {
    dependsOn(captionResourcesPatch)
    extendWith("extensions/extension.mpe")

    execute {
        CaptionFeatures.translation = false
        YouTubeActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, ${EXTENSION}CaptionAddonSupport;->initialize(Landroid/app/Activity;)V",
        )
    }
}
