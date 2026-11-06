package app.navhi.patches.greatday.location

import app.navhi.patches.greatday.shared.Constants.COMPATIBILITY_GREATDAY
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private const val FAKELOC_JS = "assets/www/fakeloc.js"
private const val INDEX_HTML = "assets/www/index.html"
private const val MAIN_JS = "assets/www/build/main.js"

private const val CORDOVA_JS_TAG = """<script src="cordova.js"></script>"""

/** Same anchor the hand-patched build used, kept intact as dead code. */
private const val TRACKER_STUB =
    "reStartTracker=function(){return Promise.resolve()};reStartTracker.__x=function(){"

/*
 * Install the web-layer override and disarm the background tracker.
 *
 * Both are asset edits, so they must land before the bytecode patches that call
 * into the extension.
 */
internal val manualLocationAssetsPatch = resourcePatch(
    name = "Use your own location",
    description = "Makes the app read your saved point for every location request and turns the background tracker off.",
) {
    compatibleWith(COMPATIBILITY_GREATDAY)

    execute {
        val script = object {}.javaClass.getResourceAsStream("/greatday/fakeloc.js")!!
            .bufferedReader()
            .readText()
        get(FAKELOC_JS, false).writeText(script)

        val index = get(INDEX_HTML, true)
        val html = index.readText()
        if (!html.contains("fakeloc.js")) {
            index.writeText(html.replace(CORDOVA_JS_TAG, "$CORDOVA_JS_TAG\n  <script src=\"fakeloc.js\"></script>"))
        }

        val main = get(MAIN_JS, true)
        val js = main.readText()
        if (!js.contains("reStartTracker.__x")) {
            main.writeText(js.replace("reStartTracker=function(){", TRACKER_STUB))
        }
    }
}
