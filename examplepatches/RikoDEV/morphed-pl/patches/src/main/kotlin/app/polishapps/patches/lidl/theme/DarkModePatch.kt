package app.polishapps.patches.lidl.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.cloneMutable
import app.morphe.patcher.patch.resourcePatch
import app.polishapps.patches.inpost.shared.createsInstanceOf
import app.polishapps.patches.inpost.shared.findClasses
import app.polishapps.patches.inpost.shared.findMethods
import app.polishapps.patches.inpost.shared.mutableMethod
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.inpost.shared.singleMethod
import app.polishapps.patches.lidl.shared.LIDL_EXTENSION
import app.polishapps.patches.shared.Constants.COMPATIBILITY_LIDL_PLUS
import app.polishapps.patches.shared.replaceBody
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val FORCE_DARK_ATTRIBUTE = "android:forceDarkAllowed"

/** The window theme the app uses for everything that is not listed in [LIGHT_ACTIVITIES]. */
private const val APP_THEME = "AppTheme.NoActionBar"
private const val LIGHT_THEME = "PolishappsLightWindow"

private const val SPLASH_THEME = "AppTheme.SplashScreen"
private const val SPLASH_BACKGROUND_ITEM = "windowSplashScreenBackground"
private const val SPLASH_COLOR = "polishapps_splash_background"

/**
 * Activities that show a scannable code. Force Dark would invert the code to light modules on a dark
 * background, which many till scanners do not read, so these windows stay light.
 */
private val LIGHT_ACTIVITIES = setOf(
    "es.lidlplus.features.customercard.ui.CustomerCardActivity",
    "es.lidlplus.features.coupons.presentation.detail.productcodes.ProductCodesActivity",
    "es.lidlplus.features.productcodes.ProductCodesActivity",
    "eu.scrm.schwarz.payments.presentation.sca.qr.ScaQrChallengeActivity",
)

private fun Document.elements(tag: String): List<Element> =
    getElementsByTagName(tag).let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }

private fun Document.appendTo(parent: Element, tag: String, configure: Element.() -> Unit): Element =
    createElement(tag).apply(configure).also { parent.appendChild(it) }

private fun ResourcePatchContext.enableForceDark() {
    var flipped = 0
    document("res/values-v29/styles.xml").use { styles ->
        styles.elements("item")
            .filter { it.getAttribute("name") == FORCE_DARK_ATTRIBUTE }
            .forEach {
                it.textContent = "true"
                flipped++
            }

        // The window theme for code screens: the app theme with Force Dark switched back off.
        val root = styles.documentElement
        styles.appendTo(root, "style") { setAttribute("name", LIGHT_THEME); setAttribute("parent", "@style/$APP_THEME") }
            .also { style -> styles.appendTo(style, "item") { setAttribute("name", FORCE_DARK_ATTRIBUTE); textContent = "false" } }
    }
    if (flipped == 0) {
        throw PatchException("No $FORCE_DARK_ATTRIBUTE setting found in values-v29/styles.xml, the app theme changed")
    }

    // Older devices have no Force Dark, but the style must exist for every configuration the manifest names.
    document("res/values/styles.xml").use { styles ->
        styles.appendTo(styles.documentElement, "style") {
            setAttribute("name", LIGHT_THEME)
            setAttribute("parent", "@style/$APP_THEME")
        }
    }
}

private fun ResourcePatchContext.keepCodeScreensLight() {
    document("AndroidManifest.xml").use { manifest ->
        val activities = manifest.elements("activity").associateBy { it.getAttribute("android:name") }
        LIGHT_ACTIVITIES.forEach { name ->
            val activity = activities[name] ?: throw PatchException("Activity $name not found in AndroidManifest.xml")
            activity.setAttribute("android:theme", "@style/$LIGHT_THEME")
        }
    }
}

/** The system splash screen is a hard coded white. Give it a dark counterpart for night mode. */
private fun ResourcePatchContext.darkSplashBackground() {
    document("res/values/colors.xml").use { colors ->
        colors.appendTo(colors.documentElement, "color") {
            setAttribute("name", SPLASH_COLOR)
            textContent = "#ffffffff"
        }
    }
    document("res/values-night/colors.xml").use { colors ->
        colors.appendTo(colors.documentElement, "color") {
            setAttribute("name", SPLASH_COLOR)
            textContent = "#ff121212"
        }
    }
    document("res/values/styles.xml").use { styles ->
        val splash = styles.elements("style").singleOrNull { it.getAttribute("name") == SPLASH_THEME }
            ?: throw PatchException("Style $SPLASH_THEME not found")
        val background = splash.getElementsByTagName("item").let { items ->
            (0 until items.length).map { items.item(it) as Element }
        }.singleOrNull { it.getAttribute("name") == SPLASH_BACKGROUND_ITEM }
            ?: throw PatchException("$SPLASH_THEME has no $SPLASH_BACKGROUND_ITEM item")
        background.textContent = "@color/$SPLASH_COLOR"
    }
}

private const val DARK_MODE = "Lapp/polishapps/extension/lidl/DarkMode;"

private fun Method.invokes(definingClass: String, name: String) =
    implementation?.instructions?.any { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
            it.definingClass == definingClass && it.name == name
        } == true
    } == true

private val darkModeResources = resourcePatch(
    description = "Opts the app themes into Force Dark, keeps code screens light and darkens the splash screen.",
) {
    compatibleWith(COMPATIBILITY_LIDL_PLUS)

    execute {
        enableForceDark()
        keepCodeScreensLight()
        darkSplashBackground()
    }
}

@Suppress("unused")
val darkModePatch = bytecodePatch(
    name = "Dark mode",
    description = "Makes Lidl Plus follow the system dark theme. Android's Force Dark darkens the window, native " +
        "and React Native screens, and the Compose screens are recoloured through their paints. The loyalty card " +
        "and code screens stay light so their QR codes keep scanning, and the launch screen turns dark.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LIDL_PLUS)

    dependsOn(darkModeResources)

    extendWith(LIDL_EXTENSION)

    execute {
        // The helper that opts every Compose root view out of Force Dark is also the one place that sees each
        // Compose root. Android views hosted inside it (HTML, markdown, TextViews) get their dark text lightened.
        // It is the only caller of View.setForceDarkAllowed in the whole app.
        singleMethod("Compose root view hook") { _, method ->
            method.returnType == "V" && method.invokes("Landroid/view/View;", "setForceDarkAllowed")
        }.addInstructions(0, "invoke-static {p1}, $DARK_MODE->watch(Landroid/view/View;)V")

        // Compose opts all of its views out of Force Dark and that is kept on purpose: Force Dark only lightens
        // dark foreground colours, so it would turn the recoloured dark cards below back into light ones.
        // Compose is themed through its paints instead.
        // Shapes Compose draws itself (cards, bars, dividers, vector icons) are recoloured where Compose's paint
        // receives the colour.
        singleMethod("Compose paint colour setter") { classDef, method ->
            classDef.superclass != "Landroid/text/TextPaint;" &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "V" &&
                method.parameterTypeNames() == listOf("J") &&
                method.invokes("Landroid/graphics/Paint;", "setColor")
        }.addInstructions(
            0,
            """
                invoke-static {p1, p2}, $DARK_MODE->shapeColor(J)J
                move-result-wide p1
            """,
        )

        // Text is drawn with a separate paint class that extends TextPaint.
        val textPaintSetter = singleMethod("Compose text paint colour setter") { classDef, method ->
            classDef.superclass == "Landroid/text/TextPaint;" &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "V" &&
                method.parameterTypeNames() == listOf("J") &&
                method.invokes("Landroid/graphics/Paint;", "setColor")
        }
        textPaintSetter.addInstructions(
            0,
            """
                invoke-static {p1, p2}, $DARK_MODE->textColor(J)J
                move-result-wide p1
            """,
        )

        // Colours also reach that paint through spans and direct setColor(int) calls, which skip the setter
        // above. Overriding setColor(int) on the paint class catches every route, including Layout drawing
        // a ForegroundColorSpan onto it.
        val textPaint = mutableClassDefBy(textPaintSetter.definingClass)
        val template = textPaint.methods.firstOrNull { method ->
            method.name != "setColor" &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "V" &&
                method.parameterTypeNames() == listOf("I") &&
                method.implementation != null
        } ?: throw PatchException("${textPaint.type}: no (I)V method to clone as setColor")
        textPaint.methods.add(
            template.cloneMutable(name = "setColor", accessFlags = AccessFlags.PUBLIC.value).also { override ->
                override.replaceBody(
                    """
                        invoke-static {p1}, $DARK_MODE->textColorArgb(I)I
                        move-result p1
                        invoke-super {p0, p1}, Landroid/graphics/Paint;->setColor(I)V
                        return-void
                    """,
                )
            },
        )

        // Body text (descriptions, conditions) is a plain TextView created inside Compose and styled with
        // P_body, whose colour is the dark brand black #222222. It is the only factory that creates a TextView
        // with a text appearance and a link movement method.
        val textViewFactories = findMethods { _, method ->
            method.createsInstanceOf("Landroid/widget/TextView;") &&
                method.invokes("Landroid/widget/TextView;", "setTextAppearance") &&
                method.invokes("Landroid/widget/TextView;", "setMovementMethod")
        }
        val textViewFactory = textViewFactories.singleOrNull()
            ?: throw PatchException("Expected one Compose TextView factory, found ${textViewFactories.size}")
        mutableMethod(textViewFactory.first, textViewFactory.second).let { method ->
            val instructions = method.instructions
            val index = instructions.indexOfFirst { instruction ->
                instruction is BuilderInstruction35c &&
                    (instruction.reference as? MethodReference)?.let {
                        it.definingClass == "Landroid/widget/TextView;" && it.name == "setMovementMethod"
                    } == true
            }
            if (index < 0) throw PatchException("TextView.setMovementMethod call not found")
            val view = (instructions[index] as BuilderInstruction35c).registerC
            method.addInstructions(
                index + 1,
                "invoke-static {v$view}, $DARK_MODE->styleTextView(Landroid/widget/TextView;)V",
            )
        }

        // The same component fills its TextView from HTML in an update step. The parser turns inline colours
        // into ForegroundColorSpans that override the view's colour, so the text is prepared just before it is set.
        val htmlTextUpdaters = findMethods { _, method ->
            method.invokes("Landroid/text/Html;", "fromHtml") &&
                method.invokes("Landroid/text/util/Linkify;", "addLinks") &&
                method.invokes("Landroid/widget/TextView;", "setText")
        }
        val htmlTextUpdater = htmlTextUpdaters.singleOrNull()
            ?: throw PatchException("Expected one HTML TextView updater, found ${htmlTextUpdaters.size}")
        mutableMethod(htmlTextUpdater.first, htmlTextUpdater.second).let { method ->
            val setTexts = method.instructions.withIndex().filter { (_, instruction) ->
                instruction is BuilderInstruction35c &&
                    (instruction.reference as? MethodReference)?.let {
                        it.definingClass == "Landroid/widget/TextView;" && it.name == "setText" &&
                            it.parameterTypes.map { type -> type.toString() } == listOf("Ljava/lang/CharSequence;")
                    } == true
            }
            if (setTexts.isEmpty()) throw PatchException("TextView.setText(CharSequence) not found in the HTML updater")
            // Backwards, so the indices of the calls still to be patched do not move.
            setTexts.reversed().forEach { (index, instruction) ->
                val call = instruction as BuilderInstruction35c
                method.addInstructions(
                    index,
                    "invoke-static {v${call.registerC}, v${call.registerD}}, " +
                        "$DARK_MODE->prepareHtmlText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V",
                )
            }
        }

        // Rich text (annotated strings, converted HTML) takes the colour of each styled run from a
        // ForegroundColorSpan instead of the text paint, so it needs the same remapping.
        singleMethod("Compose span colour setter") { _, method ->
            AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "V" &&
                method.parameterTypeNames() == listOf("Landroid/text/Spannable;", "J", "I", "I") &&
                method.createsInstanceOf("Landroid/text/style/ForegroundColorSpan;")
        }.addInstructions(
            0,
            """
                invoke-static {p1, p2}, $DARK_MODE->textColor(J)J
                move-result-wide p1
            """,
        )

        // Gradient brushes (text that fades out, fades into a surface, banners) build an Android shader from a
        // colour array instead of going through the paint colour. On Android 10 and up that array is a LongArray
        // in the same packing as Compose colours.
        singleMethod("Compose linear gradient shader") { _, method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "Landroid/graphics/LinearGradient;" &&
                method.parameterTypeNames() == listOf("J", "J", "[J", "[F", "I")
        }.addInstructions(
            0,
            """
                invoke-static {p5}, $DARK_MODE->gradientColors([J)[J
                move-result-object p5
            """,
        )

        // Descriptions and conditions are HTML in a WebView inside Compose. Its background is transparent and
        // Force Dark never reaches it, so the page keeps black text. Only the transparent, script free
        // WebViews are touched: the others load full web pages that bring their own white background.
        val htmlViews = findMethods { _, method ->
            method.invokes("Landroid/webkit/WebView;", "loadDataWithBaseURL") &&
                method.invokes("Landroid/webkit/WebView;", "setBackgroundColor") &&
                !method.invokes("Landroid/webkit/WebSettings;", "setJavaScriptEnabled")
        }
        val htmlView = htmlViews.singleOrNull()
            ?: throw PatchException("Expected one transparent HTML WebView, found ${htmlViews.size}")
        mutableMethod(htmlView.first, htmlView.second).let { method ->
            val instructions = method.instructions
            val index = instructions.indexOfFirst { instruction ->
                instruction is BuilderInstruction3rc &&
                    (instruction.reference as? MethodReference)?.let {
                        it.definingClass == "Landroid/webkit/WebView;" && it.name == "loadDataWithBaseURL"
                    } == true
            }
            if (index < 0) throw PatchException("loadDataWithBaseURL range call not found")
            // loadDataWithBaseURL(webView, baseUrl, data, mimeType, encoding, history): data and mime are consecutive.
            val data = (instructions[index] as BuilderInstruction3rc).startRegister + 2
            method.addInstructions(
                index,
                """
                    invoke-static/range {v$data .. v${data + 1}}, $DARK_MODE->html(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$data
                """,
            )
        }

        // Tinted icons take their colour from a colour filter instead of the paint colour.
        singleMethod("Compose tint colour filter") { _, method ->
            method.name == "<init>" &&
                method.parameterTypeNames() == listOf("J", "I") &&
                method.createsInstanceOf("Landroid/graphics/PorterDuffColorFilter;")
        }.addInstructions(
            0,
            """
                invoke-static {p1, p2}, $DARK_MODE->tintColor(J)J
                move-result-wide p1
            """,
        )

        // The app asks for dark status and navigation bar icons, which vanish on a dark screen.
        // Only the insets controller classes: the ones holding a WindowInsetsController and their subclasses.
        // Screens that set the same flags themselves keep their own meaning for the parameter.
        val controllers = findClasses { classDef ->
            classDef.fields.any { it.type == "Landroid/view/WindowInsetsController;" }
        }.map { it.type }.toSet()
        val barSetters = findMethods { classDef, method ->
            (classDef.type in controllers || classDef.superclass in controllers) &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "V" &&
                method.parameterTypeNames() == listOf("Z") &&
                (method.invokes("Landroid/view/WindowInsetsController;", "setSystemBarsAppearance") ||
                    method.invokes("Landroid/view/View;", "setSystemUiVisibility"))
        }
        if (barSetters.size != 4) {
            throw PatchException(
                "Expected 4 system bar appearance setters, found ${barSetters.size}: " +
                    barSetters.map { (c, m) -> "${c.type}->${m.name}" },
            )
        }
        barSetters.forEach { (classDef, method) ->
            mutableMethod(classDef, method).addInstructions(
                0,
                """
                    invoke-static {p0, p1}, $DARK_MODE->lightIcons(Ljava/lang/Object;Z)Z
                    move-result p1
                """,
            )
        }
    }
}
