package app.amazonamoled.patches.amazon.amoled

import app.amazonamoled.patches.shared.Constants.AMAZON_BUSINESS_COMPATIBILITY
import app.amazonamoled.patches.shared.Constants.AMAZON_INDIA_COMPATIBILITY
import app.amazonamoled.patches.shared.Constants.AMAZON_SHOPPING_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.returnEarly
import java.util.logging.Logger

internal const val EXTENSION_CLASS = "Lapp/amazonamoled/extension/AmoledTheme;"
internal const val WEB_VIEW = "Landroid/webkit/WebView;"
internal const val WEB_VIEW_CLIENT = "Landroid/webkit/WebViewClient;"
internal const val APPLICATION = "Landroid/app/Application;"

internal val log: Logger = Logger.getLogger("AmazonAmoled")

/** A WebViewClient callback whose first argument (p1) is the WebView. */
private class PageCallback(val name: String, val parameters: List<String>, val hook: String)

private val pageCallbacks = listOf(
    PageCallback(
        "onPageStarted",
        listOf(WEB_VIEW, "Ljava/lang/String;", "Landroid/graphics/Bitmap;"),
        "onPageStarted",
    ),
    PageCallback("onPageCommitVisible", listOf(WEB_VIEW, "Ljava/lang/String;"), "onPageCommitVisible"),
    PageCallback("onPageFinished", listOf(WEB_VIEW, "Ljava/lang/String;"), "onPageFinished"),
)

@Suppress("unused")
val amoledThemePatch = patch(
    name = "AMOLED dark theme",
    description = "Pure black dark theme for the whole app: web pages (products, search, cart...) " +
        "and native screens. Product photos and the buy buttons keep their real colors. " +
        "Do not combine with another \"Dark mode\" patch.",
    default = true,
) {
    compatibleWith(
        AMAZON_SHOPPING_COMPATIBILITY,
        AMAZON_INDIA_COMPATIBILITY,
        AMAZON_BUSINESS_COMPATIBILITY,
    )

    extendWith("extensions/extension.mpe")

    val mode by stringOption(
        key = "mode",
        default = "on",
        values = mapOf(
            "Always on" to "on",
            "Follow the system theme" to "follow_system",
        ),
        title = "When to use the dark theme",
        description = "\"Always on\" makes the app dark even when the phone is in light mode.",
        required = true,
    )

    val photoBrightness by intOption(
        key = "photoBrightness",
        default = 85,
        values = mapOf(
            "100% (unchanged)" to 100,
            "85%" to 85,
            "70%" to 70,
            "55%" to 55,
        ),
        title = "Brightness of product photos",
        description = "Product photos have white backgrounds. Dimming them is easier on the eyes " +
            "at night. Allowed values: 30 to 100.",
        validator = { it == null || it in 30..100 },
    )

    val webRendering by stringOption(
        key = "webRendering",
        default = "precise",
        values = mapOf(
            "Accurate colors (recommended)" to "precise",
            "Fast (for old or slow phones)" to "fast",
        ),
        title = "Web page rendering",
        description = "\"Accurate colors\" keeps product photos and buttons exactly as they are. " +
            "\"Fast\" uses a cheaper filter that slightly fades saturated colors. Pick it only if " +
            "scrolling stutters.",
        required = true,
    )

    val nativeScreens by booleanOption(
        key = "nativeScreens",
        default = true,
        title = "Black native screens",
        description = "Also repaint the screens that are not web pages (menus, top bar, " +
            "bottom bar, settings) in pure black.",
    )

    execute {
        // region Options, written into the extension.

        val extension = mutableClassDefBy(EXTENSION_CLASS)
        fun extensionMethod(name: String) = extension.methods.firstOrNull { it.name == name }
            ?: throw PatchException("Extension method $name not found")

        extensionMethod("configuredMode").returnEarly(if (mode == "follow_system") "follow_system" else "on")
        extensionMethod("configuredPhotoBrightness").returnEarly((photoBrightness ?: 85).coerceIn(30, 100))
        extensionMethod("configuredPreciseWebColors").returnEarly(webRendering != "fast")
        extensionMethod("configuredNativeScreens").returnEarly(nativeScreens != false)

        // endregion

        // region Let Android darken the light theme (android:forceDarkAllowed).

        if (nativeScreens != false) enableForceDark()

        // endregion

        // region Class hierarchy.

        val superclassOf = HashMap<String, String?>(1 shl 17)
        classDefForEach { classDef -> superclassOf[classDef.type] = classDef.superclass }

        fun inherits(type: String, root: String): Boolean {
            var current = superclassOf[type]
            var depth = 0
            while (current != null && depth++ < 64) {
                if (current == root) return true
                current = superclassOf[current]
            }
            return false
        }

        val clientTypes = superclassOf.keys.filter { inherits(it, WEB_VIEW_CLIENT) }
        val webViewTypes = superclassOf.keys.filter { inherits(it, WEB_VIEW) }

        // endregion

        // region WebViewClient callbacks: apply the stylesheet on every page load.

        var hookedCallbacks = 0
        for (type in clientTypes) {
            val clientClass = mutableClassDefBy(type)
            val isRoot = superclassOf[type] == WEB_VIEW_CLIENT
            for (callback in pageCallbacks) {
                val existing = clientClass.findMethod(callback.name, callback.parameters)
                if (existing != null) {
                    if (existing.implementation == null || existing.isStatic) continue
                    existing.addInstructions(
                        0,
                        "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->${callback.hook}($WEB_VIEW)V",
                    )
                    hookedCallbacks++
                } else if (isRoot) {
                    // Direct subclasses that do not override the callback get an override, so
                    // every chain of WebViewClient classes has at least one hook.
                    val superArgs = (0..callback.parameters.size).joinToString(", ") { "p$it" }
                    clientClass.addVoidMethod(
                        callback.name,
                        callback.parameters,
                        """
                            invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->${callback.hook}($WEB_VIEW)V
                            invoke-super { $superArgs }, ${clientClass.superclass}->${callback.name}(${callback.parameters.joinToString("")})V
                            return-void
                        """,
                    )
                    hookedCallbacks++
                }
            }
        }
        if (hookedCallbacks == 0) {
            throw PatchException("No WebViewClient found in this app: is this Amazon Shopping?")
        }

        // endregion

        // region WebView subclasses: black background and document-start script before the first frame.

        var hookedWebViews = 0
        for (type in webViewTypes) {
            val webViewClass = mutableClassDefBy(type)
            val existing = webViewClass.findMethod("onAttachedToWindow", emptyList())
            if (existing != null) {
                if (existing.implementation == null || existing.isStatic) continue
                existing.addInstructions(
                    0,
                    "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onWebViewAttached($WEB_VIEW)V",
                )
                hookedWebViews++
            } else if (superclassOf[type] == WEB_VIEW) {
                webViewClass.addVoidMethod(
                    "onAttachedToWindow",
                    emptyList(),
                    """
                        invoke-super { p0 }, ${webViewClass.superclass}->onAttachedToWindow()V
                        invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onWebViewAttached($WEB_VIEW)V
                        return-void
                    """,
                    isProtected = true,
                )
                hookedWebViews++
            }
        }

        // endregion

        // region Application.onCreate(): app night mode and native screens.

        val applicationType = readApplicationClassType()
        val applicationClass = applicationType
            ?.takeIf { it == APPLICATION || inherits(it, APPLICATION) }
            ?.let { mutableClassDefByOrNull(it) }
        if (applicationClass == null) {
            log.warning(
                "Application class ($applicationType) not found: web pages will be dark, " +
                    "native screens will only follow the system theme.",
            )
        } else {
            val onCreate = applicationClass.findMethod("onCreate", emptyList())
            if (onCreate != null && onCreate.implementation != null && !onCreate.isStatic) {
                onCreate.addInstructions(
                    0,
                    "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onApplicationCreate($APPLICATION)V",
                )
            } else {
                applicationClass.addVoidMethod(
                    "onCreate",
                    emptyList(),
                    """
                        invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onApplicationCreate($APPLICATION)V
                        invoke-super { p0 }, ${applicationClass.superclass}->onCreate()V
                        return-void
                    """,
                )
            }
        }

        // endregion

        log.info(
            "AMOLED dark theme: $hookedCallbacks WebViewClient callback(s) in ${clientTypes.size} " +
                "class(es), $hookedWebViews WebView class(es), application class ${applicationClass?.type}.",
        )
    }
}
