package app.morphe.patches.util

import app.morphe.patcher.patch.ResourcePatchContext

/**
 * Checks that a drawable is one a row can actually be given.
 *
 * <p>Most of the icons named in the app's resources are not there any more. R8's resource
 * shrinker leaves the name and the id behind and replaces the drawing with `<x/>`, a stub whose
 * element names a class that was shrunk away too, so asking for one throws
 * `InflateException: Class not found x` the moment the screen holding it is drawn. Only the
 * drawables the app still uses itself survived as `<vector>`.
 *
 * <p>Nothing says which is which from the name, so the check is done here rather than on a
 * device. An icon is a decoration, though: where there is no real drawing to point at, the row
 * goes without one instead of the patch failing and taking the rest of the screen with it. The
 * Pro and Dev packages are offered here and have never been read, so what they kept cannot be
 * assumed from what the free one kept.
 *
 * @return What to set `android:icon` to, or null where there is nothing worth pointing at.
 */
internal fun ResourcePatchContext.drawableNamed(name: String): String? {
    val root = try {
        document("res/drawable/$name.xml").use { it.documentElement.tagName }
    } catch (ex: Exception) {
        return null
    }

    return if (root == "vector") "@drawable/$name" else null
}
