package app.morphe.patches.applemusic.dilink

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.applemusic.shared.Constants.APPLE_MUSIC_DILINK
import org.w3c.dom.Element

private const val ENGINE_MANIFEST = "AndroidManifest.xml"
private const val ENGINE_MAIN_ACTIVITY = "com.apple.android.music.common.MainActivity"
private const val MAIN_ACTION = "android.intent.action.MAIN"
private const val LAUNCHER_CATEGORY = "android.intent.category.LAUNCHER"

/**
 * The engine is a backend: the only entry point is the companion (`com.anderson.applemusic.car`
 * / `com.anderson.applemusic.tv`), which starts the engine with an explicit intent
 * ("Entrar na conta"). So MainActivity must not show up in the launcher.
 *
 * Only the LAUNCHER category is removed; the MAIN action stays, so the explicit intent and
 * `am start -n com.apple.android.music/.common.MainActivity` keep resolving.
 */
@Suppress("unused")
internal val engineLauncherPatch = resourcePatch(
    name = "DiLink: hide engine launcher",
    description = "Removes MainActivity's launcher category so only the companion shows up in " +
        "the launcher; the engine stays reachable by explicit intent.",
    default = false,
) {
    compatibleWith(APPLE_MUSIC_DILINK)
    dependsOn(dilinkManifestPatch)

    finalize {
        document(ENGINE_MANIFEST).use { manifest ->
            val activities = manifest.getElementsByTagName("activity")
            val mainActivity = (0 until activities.length)
                .map { index -> activities.item(index) as Element }
                .firstOrNull { activity -> activity.getAttribute("android:name") == ENGINE_MAIN_ACTIVITY }
                ?: error("$ENGINE_MAIN_ACTIVITY not found in $ENGINE_MANIFEST")

            var removed = 0
            val filters = mainActivity.childNodes
            for (index in 0 until filters.length) {
                val filter = filters.item(index) as? Element ?: continue
                if (filter.tagName != "intent-filter") continue

                val children = filter.childNodes
                val hasMainAction = (0 until children.length)
                    .map { childIndex -> children.item(childIndex) }
                    .filterIsInstance<Element>()
                    .any { child ->
                        child.tagName == "action" && child.getAttribute("android:name") == MAIN_ACTION
                    }
                if (!hasMainAction) continue

                for (childIndex in children.length - 1 downTo 0) {
                    val child = children.item(childIndex) as? Element ?: continue
                    if (child.tagName == "category" &&
                        child.getAttribute("android:name") == LAUNCHER_CATEGORY
                    ) {
                        filter.removeChild(child)
                        removed++
                    }
                }
            }
            check(removed == 1) {
                "Expected 1 $LAUNCHER_CATEGORY on $ENGINE_MAIN_ACTIVITY, removed $removed"
            }
        }
    }
}
