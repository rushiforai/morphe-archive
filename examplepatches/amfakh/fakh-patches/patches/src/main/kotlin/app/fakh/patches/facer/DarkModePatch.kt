/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.facer

import app.fakh.patches.facer.shared.Constants.COMPATIBILITY_FACER_PHONE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.decode
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val DARK_EXT = "Lapp/fakh/extension/facer/FacerDarkMode;"

/** `LooksTabSection` uses `Modifier.background(Modifier, long, Shape)` and `Surface(...)`, letting us locate both. */
private val looksTabSectionFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf("Popular", "Following", "My Looks", "My Faces"),
)

/** `StorefrontLoadingComponents` holds the two static shimmer gradient colors (`a` = base, `b` = highlight). */
private val shimmerComponentsFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf("shimmerBrush"),
)

/** Compose `LinearGradient.createShader(Size)` builds an `android.graphics.LinearGradient` from an ARGB `int[]`. */
private val linearGradientShaderFingerprint = Fingerprint(
    returnType = "Landroid/graphics/Shader;",
    parameters = listOf("J"),
    strings = listOf(
        "colors must have length of at least 2 if colorStops is omitted.",
        "colors and colorStops arguments must have equal length.",
    ),
)

/** Resource overrides that give Facer's XML layouts and AppCompat theme a dark palette in night mode. */
private val darkModeResourcePatch = patch {
    execute {
        decode("res/layout*/*.xml")

        // Redirect hardcoded light backgrounds and dark text colors in layouts to night-aware color
        // resources so `@color/white` and `@color/pure_white` stay white when used as textColor.
        val layoutReplacements = listOf(
            """android:background="@color/pure_white"""" to """android:background="@color/bottom_navbar_background"""",
            """android:background="@color/white"""" to """android:background="@color/detail_view_bg"""",
            """app:cardBackgroundColor="@color/white"""" to """app:cardBackgroundColor="@color/bottom_navbar_background"""",
            """android:background="#ffe5e5e5"""" to """android:background="@color/detail_view_bg"""",
            """android:background="#e5e5e5"""" to """android:background="@color/detail_view_bg"""",
            """android:background="#eeeeee"""" to """android:background="@color/detail_view_bg"""",
            """android:background="#f4f4f4"""" to """android:background="@color/detail_view_bg"""",
            """android:background="#f5f5f5"""" to """android:background="@color/detail_view_bg"""",
            """android:background="#ffffff"""" to """android:background="@color/bottom_navbar_background"""",
            """android:background="#ffffffff"""" to """android:background="@color/bottom_navbar_background"""",
            """android:background="#fff"""" to """android:background="@color/bottom_navbar_background"""",
            """android:textColor="@color/pure_black"""" to """android:textColor="@color/text_black"""",
            """app:titleTextColor="@color/pure_black"""" to """app:titleTextColor="@color/text_black"""",
            """android:textColor="@android:color/black"""" to """android:textColor="@color/text_black"""",
            """android:textColor="#8a000000"""" to """android:textColor="@color/dark_gray"""",
            """android:textColor="#212121"""" to """android:textColor="@color/text_black"""",
            """android:textColor="#ff212121"""" to """android:textColor="@color/text_black"""",
            """android:textColor="#000000"""" to """android:textColor="@color/text_black"""",
            """android:textColor="#ff000000"""" to """android:textColor="@color/text_black"""",
            """android:textColor="#000"""" to """android:textColor="@color/text_black"""",
            """android:textColor="#333333"""" to """android:textColor="@color/text_black"""",
            """android:textColor="#333"""" to """android:textColor="@color/text_black"""",
            """android:textColor="@color/light_grey"""" to """android:textColor="@color/dark_gray"""",
            """android:tint="@color/light_grey"""" to """android:tint="@color/dark_gray"""",
        )
        var replacedLayouts = 0
        resourceFile("res").listFiles()
            ?.filter { it.isDirectory && it.name.startsWith("layout") }
            ?.forEach { dir ->
                dir.listFiles()?.filter { it.extension == "xml" }?.forEach { file ->
                    var text = file.readText()
                    var changed = false
                    layoutReplacements.forEach { (from, to) ->
                        if (text.contains(from)) {
                            text = text.replace(from, to)
                            changed = true
                        }
                    }
                    if (changed) {
                        file.writeText(text)
                        replacedLayouts++
                    }
                }
            }
        if (replacedLayouts == 0) throw PatchException("No layouts updated for dark mode")

        // Night styles: switch AppTheme.Base to dark AppCompat parent.
        document("res/values-night/styles.xml").use { doc ->
            val resources = doc.documentElement
            fun addStyle(name: String, parent: String, items: Map<String, String>) {
                val style = doc.createElement("style").apply {
                    setAttribute("name", name)
                    setAttribute("parent", parent)
                }
                items.forEach { (k, v) ->
                    style.appendChild(
                        doc.createElement("item").apply {
                            setAttribute("name", k)
                            textContent = v
                        },
                    )
                }
                resources.appendChild(style)
            }
            addStyle(
                "AppTheme.Base",
                "@style/Theme.AppCompat.NoActionBar",
                mapOf(
                    "android:windowBackground" to "@color/detail_view_bg",
                    "android:textColor" to "@color/text_black",
                    "android:windowTranslucentStatus" to "false",
                    "android:windowDrawsSystemBarBackgrounds" to "true",
                    "android:statusBarColor" to "@color/detail_view_bg",
                    "android:navigationBarColor" to "@color/bottom_navbar_background",
                    "android:windowLightStatusBar" to "false",
                    "autoCompleteTextViewStyle" to "@style/myAutoCompleteTextViewStyle",
                    "colorAccent" to "@color/standard_700",
                    "colorPrimary" to "@color/standard",
                    "colorPrimaryDark" to "@color/standard_700",
                    "searchViewStyle" to "@style/DefaultSearchView",
                    "textAppearanceSearchResultTitle" to "@style/mySearchResult",
                    "windowActionBar" to "false",
                    "windowActionBarOverlay" to "false",
                    "windowNoTitle" to "true",
                ),
            )
            addStyle(
                "AppTheme.Transparent",
                "@style/Theme.AppCompat",
                mapOf(
                    "colorAccent" to "@color/accent",
                    "colorPrimary" to "@android:color/transparent",
                    "colorPrimaryDark" to "@color/standard_700",
                    "windowActionBarOverlay" to "true",
                ),
            )
            addStyle(
                "WatchFace.Title",
                "@style/TextAppearance.AppCompat.Body2",
                mapOf(
                    "android:textColor" to "@color/text_black",
                    "android:ellipsize" to "marquee",
                    "android:layout_width" to "match_parent",
                    "android:layout_height" to "wrap_content",
                    "android:singleLine" to "false",
                ),
            )
            addStyle(
                "WatchFaceFeatureItem",
                "",
                mapOf(
                    "android:textSize" to "16.0sp",
                    "android:textColor" to "@color/text_black",
                    "android:gravity" to "center_vertical",
                    "android:layout_width" to "match_parent",
                    "android:layout_height" to "wrap_content",
                ),
            )
            addStyle(
                "SimpleToolBar",
                "@style/Widget.AppCompat.Toolbar",
                mapOf(
                    "android:textColorPrimary" to "@color/text_almost_black",
                    "android:gravity" to "center",
                    "android:background" to "@color/bottom_navbar_background",
                    "android:colorControlNormal" to "@color/text_almost_black",
                    "colorPrimary" to "@color/bottom_navbar_background",
                    "colorPrimaryDark" to "@color/detail_view_bg",
                ),
            )
            addStyle(
                "Theme.ActionBar.Simple",
                "@style/Theme.AppCompat",
                mapOf(
                    "android:windowBackground" to "@color/detail_view_bg",
                    "actionBarStyle" to "@style/SimpleToolBar",
                    "colorAccent" to "@color/facer_brand_1",
                    "colorPrimary" to "@color/bottom_navbar_background",
                    "colorPrimaryDark" to "@color/detail_view_bg",
                    "windowActionBar" to "false",
                    "windowActionBarOverlay" to "false",
                    "windowNoTitle" to "true",
                ),
            )
            addStyle(
                "Theme.NoWiredStrapInNavigationBar",
                "@style/Theme.Design.BottomSheetDialog",
                mapOf(
                    "android:colorBackground" to "@color/bottom_navbar_background",
                ),
            )
            addStyle(
                "myAutoCompleteTextViewStyle",
                "@style/Widget.AppCompat.AutoCompleteTextView",
                mapOf(
                    "android:popupBackground" to "@color/bottom_navbar_background",
                ),
            )
            addStyle(
                "SplashTheme",
                "@style/Theme.SplashScreen",
                mapOf(
                    "postSplashScreenTheme" to "@style/FacerTheme",
                    "windowSplashScreenAnimatedIcon" to "@drawable/splash_icon",
                    "windowSplashScreenBackground" to "@color/detail_view_bg",
                ),
            )
        }

        // Night colors: override existing color names only (ARSCLib rejects new names).
        // Keep `white`, `pure_white`, and `true_white` light: 60+ layouts use `white`/`pure_white`
        // for white text, and `CollectionViewHolder` uses `true_white` with `PorterDuff.Mode.MULTIPLY`
        // to reset bundle cover tints (darkening it turns every bundle banner nearly black).
        val nightColors = mapOf(
            // Canvas / page backgrounds (pitch black)
            "detail_view_bg" to "#ff000000",
            "navigation_view_background" to "#ff000000",
            "main_loading_background" to "#ff000000",
            "background_material_dark" to "#ff000000",
            "background_material_light" to "#ff000000",
            "background_floating_material_dark" to "#ff101012",
            "background_floating_material_light" to "#ff101012",
            "rating_background" to "#ff101012",
            "browser_actions_bg_grey" to "#ff101012",
            "collection_desc_background" to "#ff101012",
            // Cards / bars / bottom nav
            "bottom_navbar_background" to "#ff000000",
            "button_background_selected" to "#ff101012",
            "cardview_light_background" to "#ff101012",
            "cardview_dark_background" to "#ff101012",
            // Raised chips / unselected buttons
            "facer_dark_1" to "#ff1c1c1e",
            "facer_button_unselected" to "#ff1c1c1e",
            "follow_button_background" to "#ff1c1c1e",
            "storefront_unselected_background" to "#ff1c1c1e",
            "close_button_circle_gray" to "#ff242428",
            "layer_background" to "#ff1c1c1e",
            // Dividers & borders
            "light_gray" to "#ff000000",
            "light_grey" to "#ff242428",
            "card_divider_gray" to "#ff1c1c1e",
            "card_divider_stroke_gray" to "#ff242428",
            "facer_dark_2" to "#ff242428",
            "medium_light_gray" to "#ff28282c",
            "watchface_sync_sheet_border" to "#ff28282c",
            // Primary text (was dark, now light)
            "text_black" to "#ffeaeaea",
            "text_almost_black" to "#ffeaeaea",
            "text_dark_gray" to "#ffeaeaea",
            "text_medium_gray" to "#ffd8d8dc",
            "cancel_gray" to "#ffeaeaea",
            "browser_actions_text_color" to "#ffeaeaea",
            "facer_dark_9" to "#ffeaeaea",
            "facer_black" to "#ffeaeaea",
            "bottom_navbar_accentColor" to "#ffeaeaea",
            "indv_collection_text_color" to "#ffeaeaea",
            "dark_grey" to "#ffd8d8dc",
            // Secondary text
            "dark_gray" to "#ffa8a8b0",
            "browser_actions_title_color" to "#ffa8a8b0",
            "text_light_gray" to "#ffa8a8b0",
            "facer_dark_7" to "#ffa8a8b0",
            "facer_dark_8" to "#ffb8b8c0",
            "collection_desc_text" to "#ffa8a8b0",
            "shuffle_text_gray" to "#ffa8a8b0",
            "close_button_gray" to "#ffa8a8b0",
            "text_gray" to "#ff9e9ea6",
            "text_slightly_lighter_gray" to "#ff9e9ea6",
        )
        val nightColorsFile = resourceFile("res/values-night/colors.xml")
        nightColorsFile.parentFile?.mkdirs()
        nightColorsFile.writeText(
            buildString {
                appendLine("""<?xml version="1.0" encoding="utf-8"?>""")
                appendLine("<resources>")
                nightColors.forEach { (name, hex) ->
                    appendLine("""    <color name="$name">$hex</color>""")
                }
                appendLine("</resources>")
            },
        )
    }
}

@Suppress("unused")
val darkModePatch = patch(
    name = "Dark mode",
    description = "Follows the system dark theme across XML and Compose screens.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACER_PHONE)
    category("Theme")
    extendWith("extensions/extension.mpe")
    dependsOn(darkModeResourcePatch)

    execute {
        // 1. Find `Modifier.background(Modifier, long, Shape)` from LooksTabSection.
        val tabMethod = looksTabSectionFingerprint.method
        val bgRef = tabMethod.instructions
            .filter { it.opcode == Opcode.INVOKE_STATIC }
            .mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
            .firstOrNull { ref ->
                val params = ref.parameterTypes.map(CharSequence::toString)
                params.size == 3 && params[1] == "J" && ref.returnType == params[0]
            } ?: throw PatchException("Compose Modifier.background method not found")

        var bgHooked = 0
        classDefForEach { classDef ->
            if (classDef.type != bgRef.definingClass) return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter {
                    it.name == bgRef.name &&
                        it.parameterTypes.map(CharSequence::toString) == bgRef.parameterTypes.map(CharSequence::toString)
                }
                .forEach { m ->
                    // Static method: p0 = Modifier, p1/p2 = long color, p3 = Shape.
                    m.addInstructions(
                        0,
                        """
                            invoke-static/range { p1 .. p2 }, $DARK_EXT->surfaceColor(J)J
                            move-result-wide p1
                        """,
                    )
                    bgHooked++
                }
        }
        if (bgHooked != 1) throw PatchException("Expected 1 Modifier.background hook, found $bgHooked")

        // 2. Hook Compose `Surface(...)` (`(Modifier, Shape, long color, long contentColor, float, float, BorderStroke, Function2, Composer, int, int)V`).
        var surfaceHooked = 0
        classDefForEach { classDef ->
            val candidates = classDef.methods.filter { m ->
                val p = m.parameterTypes.map(CharSequence::toString)
                m.returnType == "V" &&
                    p.size == 11 &&
                    p[0] == bgRef.returnType &&
                    p[2] == "J" &&
                    p[3] == "J" &&
                    p[4] == "F" &&
                    p[5] == "F" &&
                    p[9] == "I" &&
                    p[10] == "I" &&
                    m.implementation != null
            }
            if (candidates.isEmpty()) return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { m -> candidates.any { it.name == m.name && it.parameterTypes == m.parameterTypes } }
                .forEach { m ->
                    // Static: p0 = Modifier, p1 = Shape, p2/p3 = long color, p4/p5 = long contentColor.
                    m.addInstructions(
                        0,
                        """
                            invoke-static/range { p2 .. p3 }, $DARK_EXT->surfaceColor(J)J
                            move-result-wide p2
                            invoke-static/range { p4 .. p5 }, $DARK_EXT->textColor(J)J
                            move-result-wide p4
                        """,
                    )
                    surfaceHooked++
                }
        }
        if (surfaceHooked == 0) throw PatchException("Compose Surface method not found")

        // 3. Hook Compose `Text(...)` overloads (19 params: `(String|AnnotatedString, Modifier, long color, long fontSize, ...)`).
        var textHooked = 0
        classDefForEach { classDef ->
            val candidates = classDef.methods.filter { m ->
                val p = m.parameterTypes.map(CharSequence::toString)
                m.returnType == "V" &&
                    p.size == 19 &&
                    p[1] == bgRef.returnType &&
                    p[2] == "J" &&
                    p[3] == "J" &&
                    p[16] == "I" &&
                    p[17] == "I" &&
                    p[18] == "I" &&
                    m.implementation != null
            }
            if (candidates.isEmpty()) return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { m -> candidates.any { it.name == m.name && it.parameterTypes == m.parameterTypes } }
                .forEach { m ->
                    // Static: p0 = text, p1 = Modifier, p2/p3 = long color.
                    // Note: p2/p3 may be >15 in a 19-param method, so use invoke-static/range!
                    m.addInstructions(
                        0,
                        """
                            invoke-static/range { p2 .. p3 }, $DARK_EXT->textColor(J)J
                            move-result-wide p2
                        """,
                    )
                    textHooked++
                }
        }
        if (textHooked == 0) throw PatchException("Compose Text methods not found")

        // 4. Darken loading skeleton shimmer colors in StorefrontLoadingComponents.<clinit>.
        val shimmerClass = mutableClassDefBy(shimmerComponentsFingerprint.classDef)
        val shimmerFields = shimmerClass.staticFields.filter { it.type == "J" }.toList()
        if (shimmerFields.size != 2) {
            throw PatchException("Expected 2 shimmer color fields in ${shimmerClass.type}, found ${shimmerFields.size}")
        }
        val shimmerClinit = shimmerClass.methods.singleOrNull { it.name == "<clinit>" }
            ?: throw PatchException("Shimmer <clinit> not found in ${shimmerClass.type}")
        val returnIdx = shimmerClinit.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        shimmerClinit.addInstructions(
            returnIdx,
            """
                invoke-static {}, $DARK_EXT->shimmerBase()J
                move-result-wide v0
                sput-wide v0, ${shimmerClass.type}->${shimmerFields[0].name}:J
                invoke-static {}, $DARK_EXT->shimmerHighlight()J
                move-result-wide v0
                sput-wide v0, ${shimmerClass.type}->${shimmerFields[1].name}:J
            """,
        )

        // 5. Remap white stops in Compose LinearGradient (e.g. header fade-to-white).
        val shaderMethod = linearGradientShaderFingerprint.method
        val lgIndex = shaderMethod.instructions.indexOfFirst { insn ->
            (insn.opcode == Opcode.INVOKE_DIRECT_RANGE || insn.opcode == Opcode.INVOKE_DIRECT) &&
                ((insn as ReferenceInstruction).reference as? MethodReference)?.let {
                    it.definingClass == "Landroid/graphics/LinearGradient;" &&
                        it.name == "<init>" &&
                        it.parameterTypes.map(CharSequence::toString) == listOf("F", "F", "F", "F", "[I", "[F", "Landroid/graphics/Shader\$TileMode;")
                } == true
        }
        if (lgIndex < 0) throw PatchException("LinearGradient.<init> call not found in Compose LinearGradient")
        val lgInsn = shaderMethod.instructions.elementAt(lgIndex) as RegisterRangeInstruction
        // invoke-direct/range { vStart .. vStart+7 }: +0=this, +1..+4=x0,y0,x1,y1, +5=colors int[].
        val colorsReg = lgInsn.startRegister + 5
        shaderMethod.addInstructions(
            lgIndex,
            """
                invoke-static/range { v$colorsReg .. v$colorsReg }, $DARK_EXT->remapGradientColors([I)V
            """,
        )

        // 6. Hook Compose `TopAppBarColors.<init>(JJJJJJ)V` so white LegacyToolbar / TopAppBar
        // turns dark and its back/title/action icons turn light.
        var topBarHooked = 0
        classDefForEach { classDef ->
            val target = classDef.methods.singleOrNull { m ->
                m.name == "<init>" &&
                    m.parameterTypes.map(CharSequence::toString) == listOf("J", "J", "J", "J", "J", "J") &&
                    m.implementation != null
            } ?: return@classDefForEach
            val mutable = mutableClassDefBy(classDef)
            val init = mutable.methods.single {
                it.name == "<init>" && it.parameterTypes == target.parameterTypes
            }
            // Instance <init>: p0=this, p1..p2=container, p3..p4=scrolledContainer,
            // p5..p6=navIcon, p7..p8=title, p9..p10=actionIcon, p11..p12=subtitle.
            init.addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p2 }, $DARK_EXT->surfaceColor(J)J
                    move-result-wide p1
                    invoke-static/range { p3 .. p4 }, $DARK_EXT->surfaceColor(J)J
                    move-result-wide p3
                    invoke-static/range { p5 .. p6 }, $DARK_EXT->textColor(J)J
                    move-result-wide p5
                    invoke-static/range { p7 .. p8 }, $DARK_EXT->textColor(J)J
                    move-result-wide p7
                    invoke-static/range { p9 .. p10 }, $DARK_EXT->textColor(J)J
                    move-result-wide p9
                    invoke-static/range { p11 .. p12 }, $DARK_EXT->textColor(J)J
                    move-result-wide p11
                """,
            )
            topBarHooked++
        }
        if (topBarHooked == 0) throw PatchException("Compose TopAppBarColors constructor not found")

        // 7. Hook CustomToolbarView.setStorefrontChromeColor(Integer) so non-Home tabs (Looks,
        // Explore, Top Charts, Watchbox) get a dark toolbar with white title and icons instead of
        // black text on dark or white background.
        var customToolbarHooked = 0
        classDefForEach { classDef ->
            if (classDef.type != "Lcom/jeremysteckling/facerrel/ui/views/CustomToolbarView;") return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { it.name == "setStorefrontChromeColor" && it.implementation != null }
                .forEach { m ->
                    m.addInstructions(
                        0,
                        """
                            invoke-static { p1 }, $DARK_EXT->toolbarChromeColor(Ljava/lang/Integer;)Ljava/lang/Integer;
                            move-result-object p1
                        """,
                    )
                    customToolbarHooked++
                }
        }
        if (customToolbarHooked != 1) throw PatchException("Expected 1 CustomToolbarView.setStorefrontChromeColor, found $customToolbarHooked")

        // 8. Hook Compose `LocalContentColor` default lambda (`ContentColor.kt`) so uncolored
        // `Text(...)` (e.g. onboarding titles/subtitles) defaults to light text in dark mode.
        var contentColorHooked = 0
        classDefForEach { classDef ->
            if (!classDef.interfaces.contains("Lkotlin/jvm/functions/Function0;")) return@classDefForEach
            val invoke = classDef.methods.singleOrNull { m ->
                m.name == "invoke" && m.parameters.isEmpty() && m.implementation != null
            } ?: return@classDefForEach
            val insns = invoke.implementation!!.instructions.toList()
            if (insns.size != 4) return@classDefForEach
            if (insns[0].opcode != Opcode.SGET_WIDE ||
                insns[1].opcode != Opcode.NEW_INSTANCE ||
                insns[2].opcode != Opcode.INVOKE_DIRECT ||
                insns[3].opcode != Opcode.RETURN_OBJECT
            ) {
                return@classDefForEach
            }
            val fieldRef = (insns[0] as ReferenceInstruction).reference as? FieldReference ?: return@classDefForEach
            val ctorRef = (insns[2] as ReferenceInstruction).reference as? MethodReference ?: return@classDefForEach
            if (fieldRef.definingClass != ctorRef.definingClass ||
                ctorRef.name != "<init>" ||
                ctorRef.parameterTypes.map(CharSequence::toString) != listOf("J")
            ) {
                return@classDefForEach
            }
            val mutable = mutableClassDefBy(classDef)
            val m = mutable.methods.single { it.name == "invoke" && it.parameters.isEmpty() }
            val reg = (insns[0] as OneRegisterInstruction).registerA
            m.replaceInstruction(0, "invoke-static {}, $DARK_EXT->defaultContentColor()J")
            m.addInstructions(1, "move-result-wide v$reg")
            contentColorHooked++
        }
        if (contentColorHooked != 1) throw PatchException("Expected 1 LocalContentColor default lambda, found $contentColorHooked")

        // 9. Hook WatchfaceViewFactory.<init>(Context, MenuType, int textColor) so grid/list
        // watchface titles in Explore/Top Charts/Watchbox don't get overwritten with Color.BLACK.
        var wfFactoryHooked = 0
        classDefForEach { classDef ->
            val init = classDef.methods.singleOrNull { m ->
                val p = m.parameterTypes.map(CharSequence::toString)
                m.name == "<init>" &&
                    p.size == 3 &&
                    p[0] == "Landroid/content/Context;" &&
                    p[1].startsWith(classDef.type.removeSuffix(";") + "$") &&
                    p[2] == "I" &&
                    m.implementation != null
            } ?: return@classDefForEach
            val hasSetTextColor = classDef.methods.any { m ->
                m.implementation?.instructions?.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroid/widget/TextView;" && it.name == "setTextColor"
                    } == true
                } == true
            }
            if (!hasSetTextColor) return@classDefForEach
            val mutable = mutableClassDefBy(classDef)
            val m = mutable.methods.single { it.name == "<init>" && it.parameterTypes == init.parameterTypes }
            m.addInstructions(
                0,
                """
                    invoke-static { p3 }, $DARK_EXT->argbTextColor(I)I
                    move-result p3
                """,
            )
            wfFactoryHooked++
        }
        if (wfFactoryHooked != 1) throw PatchException("Expected 1 WatchfaceViewFactory constructor, found $wfFactoryHooked")

        // 10. Hook SystemBarInsets status bar color helper (`(FragmentActivity, int)V`) so API 35+
        // painted status bar and legacy setStatusBarColor don't force white in dark mode.
        var statusBarHooked = 0
        classDefForEach { classDef ->
            val target = classDef.methods.singleOrNull { m ->
                m.returnType == "V" &&
                    m.parameterTypes.map(CharSequence::toString) == listOf("Landroidx/fragment/app/FragmentActivity;", "I") &&
                    m.implementation?.instructions?.any { insn ->
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.definingClass == "Landroid/view/Window;" && it.name == "setStatusBarColor"
                        } == true
                    } == true
            } ?: return@classDefForEach
            val m = mutableClassDefBy(classDef).methods.single {
                it.name == target.name && it.parameterTypes == target.parameterTypes
            }
            // Static: p0 = FragmentActivity, p1 = int color.
            m.addInstructions(
                0,
                """
                    invoke-static { p1 }, $DARK_EXT->statusBarColor(I)I
                    move-result p1
                """,
            )
            statusBarHooked++
        }
        if (statusBarHooked != 1) throw PatchException("Expected 1 SystemBarInsets statusBarColor method, found $statusBarHooked")

        // 11. Hook WindowInsetsControllerCompat.Impl30 light status/nav bar setters so system bar
        // icons stay white in dark mode.
        var insetsHooked = 0
        classDefForEach { classDef ->
            val hasControllerField = classDef.fields.any { it.type == "Landroid/view/WindowInsetsController;" }
            val hasWindowField = classDef.fields.any { it.type == "Landroid/view/Window;" }
            if (!hasControllerField || !hasWindowField) return@classDefForEach
            val targets = classDef.methods.filter { m ->
                m.returnType == "V" &&
                    m.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
                    m.implementation != null
            }
            if (targets.isEmpty()) return@classDefForEach
            val mutable = mutableClassDefBy(classDef)
            targets.forEach { t ->
                val m = mutable.methods.single { it.name == t.name && it.parameterTypes == t.parameterTypes }
                m.addInstructions(
                    0,
                    """
                        invoke-static { p1 }, $DARK_EXT->lightSystemBars(Z)Z
                        move-result p1
                    """,
                )
                insetsHooked++
            }
        }
        if (insetsHooked < 2) throw PatchException("Expected at least 2 WindowInsetsControllerCompat light bar setters, found $insetsHooked")

        // 12. Hook SearchToolbarComponent to tint the black search icon and SearchView text light
        // in dark mode.
        var searchMenuHooked = 0
        classDefForEach { classDef ->
            val isSearchComponent = classDef.methods.any { m ->
                m.name == "<clinit>" && m.implementation?.instructions?.any { insn ->
                    (insn as? ReferenceInstruction)?.reference?.toString()?.contains(".searchVisibilityChanged") == true
                } == true
            }
            if (!isSearchComponent) return@classDefForEach
            val mutable = mutableClassDefBy(classDef)
            mutable.methods
                .filter { it.returnType == "Landroid/view/MenuItem;" && it.implementation != null }
                .forEach { m ->
                    val returnIndices = m.instructions.withIndex()
                        .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                        .map { it.index }
                        .reversed()
                    returnIndices.forEach { idx ->
                        val reg = (m.instructions.elementAt(idx) as OneRegisterInstruction).registerA
                        m.addInstructions(
                            idx,
                            "invoke-static { v$reg }, $DARK_EXT->styleSearchMenuItem(Landroid/view/MenuItem;)V",
                        )
                    }
                    searchMenuHooked++
                }
        }
        if (searchMenuHooked != 1) throw PatchException("Expected 1 SearchToolbarComponent MenuItem method, found $searchMenuHooked")
    }
}
