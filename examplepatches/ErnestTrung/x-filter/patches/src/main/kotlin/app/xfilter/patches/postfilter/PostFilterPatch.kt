package app.xfilter.patches.postfilter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.xfilter.patches.shared.Constants.COMPATIBILITY_X

private const val EXTENSION_PACKAGE = "app.xfilter.extension"
private const val POST_FILTER = "Lapp/xfilter/extension/PostFilter;"

/**
 * Jackson's JsonFactory.createParser(InputStream), obfuscated to
 * com.fasterxml.jackson.core.e.e(InputStream) in 12.19.1. Every API response
 * (LoganSquare and X's API readers) is parsed through it.
 */
internal object JsonParserFromStreamFingerprint : Fingerprint(
    definingClass = "Lcom/fasterxml/jackson/core/",
    returnType = "Lcom/fasterxml/jackson/core/",
    parameters = listOf("Ljava/io/InputStream;"),
)

@Suppress("unused")
val postFilterPatch = patch(
    name = "Post filters",
    description = "Filters timeline posts by type, author, media and text. Settings are under a separate \"X Filters\" launcher icon.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_X)

    extendWith("extensions/extension.mpe")

    execute {
        JsonParserFromStreamFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p1 }, $POST_FILTER->filter(Ljava/io/InputStream;)Ljava/io/InputStream;
                move-result-object p1
            """,
        )

        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.elements("application").single().appendChild("activity") {
                setAttribute("android:name", "$EXTENSION_PACKAGE.FilterSettingsActivity")
                setAttribute("android:label", "X Filters")
                setAttribute("android:exported", "true")
                // Own task, so the launcher icon doesn't just bring X's task to the front.
                setAttribute("android:taskAffinity", "app.xfilter")
                appendChild("intent-filter") {
                    appendChild("action") { setAttribute("android:name", "android.intent.action.MAIN") }
                    appendChild("category") { setAttribute("android:name", "android.intent.category.LAUNCHER") }
                }
            }
        }
    }
}
