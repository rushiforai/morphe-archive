// SPDX-License-Identifier: GPL-3.0-or-later
package app.morphe.patches.todoist

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.filePathOption
import app.morphe.patches.shared.fonts.readTrueType
import org.w3c.dom.Element
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private val todoist = Compatibility(name = "Todoist", packageName = "com.todoist",
    targets = listOf(AppTarget(version = "v12314")))

private data class Palette(val base: String, val mantle: String, val surface: String,
    val border: String, val text: String, val secondary: String, val muted: String,
    val mauve: String, val red: String, val peach: String, val yellow: String,
    val green: String, val teal: String, val blue: String, val pink: String,
    val sky: String, val lavender: String, val onAccent: String)
private val latte = Palette("eff1f5", "e6e9ef", "ccd0da", "9ca0b0", "4c4f69", "5c5f77", "7c7f93",
    "8839ef", "d20f39", "fe640b", "df8e1d", "40a02b", "179299", "1e66f5", "ea76cb", "04a5e5", "7287fd", "eff1f5")
private val macchiato = Palette("24273a", "1e2030", "363a4f", "5b6078", "cad3f5", "b8c0e0", "8087a2",
    "c6a0f6", "ed8796", "f5a97f", "eed49f", "a6da95", "8bd5ca", "8aadf4", "f5bde6", "91d7e3", "b7bdf8", "24273a")

// Todoist's own semantic tokens are shared by native and Compose screens.
// Preserve priority/date meanings instead of replacing every saturated color with mauve.
private fun tokenColor(token: String, p: Palette): String {
    if (token == "background_overlay") return "#66000000"
    val accent = when {
        "destructive" in token || "attention" in token || "overdue" in token || "p1_" in token -> p.red
        "warning" in token || "tomorrow" in token || "p2_" in token || "promote" in token -> p.peach
        "positive" in token || "today" in token -> p.green
        "p3_" in token || "postpone" in token || "weekend" in token -> p.blue
        "p4_" in token || "no_date" in token -> p.muted
        "neutral_primary" in token -> p.blue
        "meta_" in token -> when {
            "red" in token || "salmon" in token -> p.red
            "orange" in token || "taupe" in token -> p.peach
            "yellow" in token -> p.yellow
            "green" in token -> p.green
            "teal" in token || "mint" in token -> p.teal
            "sky" in token -> p.sky
            "blue" in token -> p.blue
            "pink" in token || "magenta" in token || "berry" in token -> p.pink
            "lavender" in token -> p.lavender
            "charcoal" in token || "grey" in token -> p.muted
            else -> p.mauve
        }
        else -> p.mauve
    }
    val color = when {
        token.startsWith("background_") -> when {
            "grouped_tertiary" in token -> p.base
            "raised" in token -> p.surface
            "secondary" in token || "tertiary" in token -> p.mantle
            else -> p.base
        }
        "divider" in token || token.startsWith("border_") -> p.border
        token == "selectable_primary_unselected_tint" -> p.secondary
        token == "selectable_primary_unselected_fill" -> p.muted
        token == "selectable_secondary_selected_fill" -> p.surface
        token == "selectable_secondary_on_selected_tint" || token == "selectable_secondary_on_selected_fill" -> p.mauve
        "disabled" in token -> if (token.endsWith("fill")) p.surface else p.muted
        "on_selected_" in token && "selectable_secondary" !in token -> p.onAccent
        ("on_idle_" in token || "on_hover_" in token || "on_dark_on_" in token) &&
            ("primary" in token || "destructive" in token || "selectable_primary" in token) -> p.onAccent
        token.startsWith("display_primary") -> p.text
        token.startsWith("display_secondary") -> p.secondary
        token.startsWith("display_tertiary") || token.startsWith("display_quaternary") -> p.muted
        "actionable_quaternary" in token -> if (token.endsWith("fill")) p.surface else p.secondary
        "actionable_secondary" in token -> if (token.endsWith("fill")) p.surface else p.text
        "selectable_tertiary" in token -> if (token.endsWith("fill")) p.surface else p.secondary
        "selectable_secondary" in token -> if (token.endsWith("fill")) p.surface else p.mauve
        "secondary" in token && token.endsWith("fill") -> p.surface
        "on_" in token && token.endsWith("tint") && !token.contains("on_dark") -> p.text
        "focus_fill" in token || token == "selectable_background" -> p.surface
        else -> accent
    }
    return "#$color"
}

@Suppress("unused")
private val todoistResources = resourcePatch {
    compatibleWith(todoist)
    execute {
        document("res/values/colors.xml").use { xml ->
            val colors = xml.getElementsByTagName("color")
            val originals = (0 until colors.length).map { colors.item(it) as Element }
            var added = 0
            for (element in originals) {
                val name = element.getAttribute("name")
                val palette = when {
                    name.startsWith("todoist_") -> latte
                    name.startsWith("dark_") -> macchiato
                    else -> continue
                }
                val token = name.substringAfter('_')
                val prefix = if (name.startsWith("todoist_")) "catppuccin_latte_" else "catppuccin_macchiato_"
                xml.documentElement.appendChild(xml.createElement("color").apply {
                    setAttribute("name", prefix + token); textContent = tokenColor(token, palette)
                })
                added++
            }
            require(added >= 800) { "Todoist semantic palette changed" }
        }
        document("res/values/strings.xml").use { xml ->
            for ((name, title) in mapOf("catppuccin_latte_title" to "Catppuccin Latte", "catppuccin_macchiato_title" to "Catppuccin Macchiato"))
                xml.documentElement.appendChild(xml.createElement("string").apply { setAttribute("name", name); textContent = title })
        }
        document("res/values/styles.xml").use { xml ->
            val nodes = xml.getElementsByTagName("style")
            val originals = (0 until nodes.length).map { nodes.item(it) as Element }.associateBy { it.getAttribute("name") }
            fun items(name: String): Map<String,String> {
                val style = originals[name] ?: return emptyMap()
                val values = items(style.getAttribute("parent").removePrefix("@style/")).toMutableMap()
                val children = style.getElementsByTagName("item")
                for (i in 0 until children.length) {
                    val item = children.item(i) as Element
                    values[item.getAttribute("name")] = item.textContent
                }
                return values
            }
            fun style(name: String, parent: String, values: Map<String,String>) {
                xml.documentElement.appendChild(xml.createElement("style").apply {
                    setAttribute("name", name); setAttribute("parent", parent)
                    for ((key, value) in values) appendChild(xml.createElement("item").apply { setAttribute("name", key); textContent = value })
                })
            }
            for ((variant, source) in mapOf("Latte" to "ThemeOverlay.Light.Todoist.Default", "Macchiato" to "ThemeOverlay.Dark.Todoist.Dark")) {
                val prefix = if (variant == "Latte") "catppuccin_latte_" else "catppuccin_macchiato_"
                val values = items(source).mapValues { (_, value) ->
                    value.replace("@color/todoist_", "@color/$prefix").replace("@color/dark_", "@color/$prefix")
                }.toMutableMap()
                // Pull-to-refresh alternates colorAccent with the semantic accent.
                // The stock accent is a literal red, so color-token remapping alone
                // leaves half of the spinner animation unthemed.
                values["colorAccent"] = "@color/${prefix}actionable_primary_idle_fill"
                values["android:colorAccent"] = "@color/${prefix}actionable_primary_idle_fill"
                values["snackbarStyle"] = "@style/Widget.Catppuccin.Snackbar"
                values["snackbarTextViewStyle"] = "@style/Widget.Catppuccin.Snackbar.TextView"
                values["snackbarButtonStyle"] = "@style/Widget.Catppuccin.Snackbar.Button"
                style("ThemeOverlay.Catppuccin.$variant", "@style/$source", values)
            }
            style("Widget.Catppuccin.Snackbar", "@style/Widget.Material3.Snackbar", mapOf("backgroundTint" to "?attr/backgroundRaisedPrimary"))
            style("Widget.Catppuccin.Snackbar.TextView", "@style/Widget.Material3.Snackbar.TextView", mapOf("android:textColor" to "?android:attr/textColorPrimary"))
            style("Widget.Catppuccin.Snackbar.Button", "@style/Widget.Material3.Button.TextButton.Snackbar", mapOf("android:textColor" to "?attr/colorPrimary"))
        }
    }
}

@Suppress("unused")
val catppuccinTodoistPatch = bytecodePatch(
    name = "Todoist Catppuccin theme",
    description = "Adds separate Catppuccin Latte and Macchiato choices to Todoist's theme picker. Original themes remain available. Catppuccin choices are saved locally.",
    default = false,
) {
    compatibleWith(todoist)
    dependsOn(todoistResources)
    extendWith("catppuccin/todoist.dex")
    execute {
        val ext = "Lapp/morphe/extension/todoist/TodoistTheme;"
        val identities = "Lapp/morphe/extension/todoist/TodoistIdentities;"
        require(classDefBy("Ld77;").fields.count() == 10) { "Todoist color model changed" }
        mutableClassDefBy("Lcom/todoist/App;").methods.single { it.name == "onCreate" }
            .addInstructions(0, "invoke-static/range {p0 .. p0}, $ext->install(Landroid/app/Application;)V")
        // Unknown identities never reach Todoist's exhaustive stock-theme branches.
        for ((owner, name, descriptor, helper, result) in listOf(
            listOf("Le77;", "a", "Ld77;", "$ext->customPalette", "Ljava/lang/Object;"),
            listOf("Lsfl;", "b", "Lwdl;", "$identities->fromPreference", "Ljava/lang/Object;"),
            listOf("Lfel;", "a", "I", "$ext->nativeStyle", "I"),
            listOf("Lfel;", "b", "I", "$ext->previewStyle", "I"))) {
            val method = mutableClassDefBy(owner).methods.single { it.name == name && it.returnType == descriptor }
            require(method.implementation!!.registerCount - method.parameterTypes.size >= 1) { "Todoist resolver scratch register changed" }
            val label = ":catppuccin_stock_${name}"
            val finish = if (result == "I") "move-result v0\nif-eqz v0, $label\nreturn v0" else "move-result-object v0\nif-eqz v0, $label\ncheck-cast v0, $descriptor\nreturn-object v0"
            method.addInstructions(0, "invoke-static/range {p0 .. p0}, $helper(Ljava/lang/Object;)$result\n$finish\n$label\nnop")
        }
        val themeConstructor = mutableClassDefBy("Lwdl;").methods.single { it.name == "<init>" }
        require(themeConstructor.implementation!!.registerCount - 5 >= 1) { "Todoist theme constructor changed" }
        themeConstructor.addInstructions(0, "invoke-static/range {p1 .. p1}, $identities->id(Ljava/lang/Object;)I\nmove-result v0\nif-eqz v0, :stock_appearance\ninvoke-interface/range {p1 .. p1}, Lgel;->b()Z\nmove-result p3\ninvoke-static/range {p1 .. p1}, $identities->appearance(Ljava/lang/Object;)Ljava/lang/Object;\nmove-result-object p2\ncheck-cast p2, Lydl;\n:stock_appearance\nnop")
        val catalog = mutableClassDefBy("Lhel;").methods.single { it.name == "<clinit>" }
        val assignments = catalog.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            if (instruction.opcode == com.android.tools.smali.dexlib2.Opcode.SPUT_OBJECT && ref?.definingClass == "Lhel;" && ref.name in listOf("a", "b"))
                Triple(index, (instruction as OneRegisterInstruction).registerA, ref.type) else null
        }
        require(assignments.size == 2) { "Todoist theme catalog changed" }
        assignments.reversed().forEach { (index, register, type) ->
            catalog.addInstructions(index, "invoke-static/range {v$register .. v$register}, $identities->append(Ljava/util/List;)Ljava/util/List;\nmove-result-object v$register\ncheck-cast v$register, $type")
        }
        val current = mutableClassDefBy("Lffl;").methods.single { it.name == "c" && it.returnType == "Lwdl;" }
        val returns = current.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT) index to (instruction as OneRegisterInstruction).registerA else null
        }
        returns.reversed().forEach { (index, register) -> current.addInstructions(index, "invoke-static/range {v$register .. v$register}, $ext->selectedTheme(Ljava/lang/Object;)V") }
        val monthView = "Lcom/todoist/widget/MonthView;"
        val drawMonth = mutableClassDefBy(monthView).methods.single {
            it.name == "onDraw" && it.parameterTypes == listOf("Landroid/graphics/Canvas;")
        }
        val dayTextColor = drawMonth.implementation!!.instructions.withIndex().single { (_, instruction) ->
            val call = instruction as? FiveRegisterInstruction
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroid/graphics/Paint;" && ref.name == "setColor" &&
                call?.registerC == 6 && call.registerD == 4
        }.index
        // v8 is the day cell, H is the selection, I is today, and v23 is the selection fill.
        // v2 is overwritten by the following native instruction, so it is safe scratch space.
        drawMonth.replaceInstruction(dayTextColor, "iget v2, v0, $monthView->I:I")
        drawMonth.addInstructionsWithLabels(dayTextColor + 1, """
            if-ne v8, v2, :day_text_color
            iget v2, v0, $monthView->H:I
            if-eq v8, v2, :day_text_color
            move/from16 v2, v23
            invoke-static {v4, v2}, $ext->todayNumberColor(II)I
            move-result v4
            :day_text_color
            invoke-virtual {v6, v4}, Landroid/graphics/Paint;->setColor(I)V
        """.trimIndent())
        val icons = setOf("ic_views_fill_tiles", "ic_inbox_fill_production", "ic_notifications_fill_default", "ic_calendar_plain_fill", "ic_calendar_month_fill", "ic_workspace_fill", "ic_filter_fill", "ic_label_fill")
        val navigation = mutableClassDefBy("Lk62;").methods.single { it.name == "b" }
        val selectedIcons = navigation.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            if (ref?.definingClass == "Ljsg;" && ref.name in icons && instruction.opcode == com.android.tools.smali.dexlib2.Opcode.SGET)
                index to (instruction as OneRegisterInstruction).registerA else null
        }
        require(selectedIcons.size >= 6) { "Todoist navigation icons changed" }
        selectedIcons.reversed().forEach { (index, register) -> navigation.addInstructions(index + 1,
            "invoke-static/range {v$register .. v$register}, $ext->navigationIcon(I)I\nmove-result v$register") }
        println("Todoist: added two theme identities, isolated palettes and conditional navigation styling")
    }
}

@Suppress("unused")
val customFontTodoistPatch = bytecodePatch(
    name = "Todoist custom font",
    description = "Embeds your TTF as Todoist's interface font. Repatch to change or remove it. No extra in-app selector.",
    default = false,
) {
    compatibleWith(todoist)
    val fontFile = filePathOption(key = "font-file", default = null, title = "Custom TTF font",
        description = "Choose the TTF to use throughout Todoist.", required = true,
        allowedExtensions = listOf("ttf"))
    extendWith("catppuccin/todoist.dex")
    dependsOn(resourcePatch { execute {
        val bytes = readTrueType(requireNotNull(fontFile.value) { "Choose a TTF font file." })
        get("assets/catppuccin/todoist-custom.ttf").apply { parentFile.mkdirs(); writeBytes(bytes) }
        get("res/font/catppuccin_todoist_custom.ttf").apply { parentFile.mkdirs(); writeBytes(bytes) }
        for (directory in get("res").listFiles().orEmpty()) {
            if (!directory.isDirectory || !directory.name.startsWith("values")) continue
            val styles = java.io.File(directory, "styles.xml")
            if (!styles.isFile) continue
            document("res/${directory.name}/styles.xml").use { xml ->
                val all = xml.getElementsByTagName("style")
                for (i in 0 until all.length) {
                    val style = all.item(i) as Element
                    val isTodoist = style.getAttribute("name").contains("Todoist")
                    for (attr in listOf("android:fontFamily", "fontFamily")) {
                        val nodes = style.getElementsByTagName("item")
                        val item = (0 until nodes.length).map { nodes.item(it) as Element }
                            .firstOrNull { it.getAttribute("name") == attr }
                        if (item == null && !isTodoist) continue
                        val chosen = item ?: xml.createElement("item").also {
                            it.setAttribute("name", attr); style.appendChild(it)
                        }
                        chosen.textContent = "@font/catppuccin_todoist_custom"
                    }
                }
            }
        }
        for (directory in get("res").listFiles().orEmpty()) {
            if (!directory.isDirectory || !directory.name.startsWith("layout")) continue
            for (file in directory.listFiles().orEmpty()) {
                if (file.extension != "xml" || !file.readText().contains("fontFamily")) continue
                document("res/${directory.name}/${file.name}").use { xml ->
                    val elements = xml.getElementsByTagName("*")
                    for (i in 0 until elements.length) {
                        val element = elements.item(i) as Element
                        for (attribute in listOf("android:fontFamily", "app:fontFamily")) {
                            if (element.hasAttribute(attribute)) element.setAttribute(attribute, "@font/catppuccin_todoist_custom")
                        }
                    }
                }
            }
        }
    } })
    execute {
        val ext = "Lapp/morphe/extension/todoist/TodoistFont;"
        mutableClassDefBy("Lcom/todoist/App;").methods.single { it.name == "onCreate" }
            .addInstructions(0, "invoke-static/range {p0 .. p0}, $ext->install(Landroid/app/Application;)V")
        val classes = mutableListOf<ClassDef>()
        classDefForEach { if (!it.type.startsWith("Lapp/morphe/extension/")) classes.add(it) }
        var calls = 0
        for (klass in classes) for (method in klass.methods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            val changes = instructions.mapIndexedNotNull { index, instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapIndexedNotNull null
                if (ref.definingClass != "Landroid/graphics/Typeface;" || ref.name != "create" || ref.parameterTypes !in listOf(
                    listOf("Ljava/lang/String;", "I"), listOf("Landroid/graphics/Typeface;", "I"),
                    listOf("Landroid/graphics/Typeface;", "I", "Z"))) return@mapIndexedNotNull null
                val invoke = when (instruction) {
                    is RegisterRangeInstruction -> "invoke-static/range {v${instruction.startRegister} .. v${instruction.startRegister + instruction.registerCount - 1}}"
                    is FiveRegisterInstruction -> "invoke-static {" + listOf(instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount).joinToString(", ") { "v$it" } + "}"
                    else -> error("Unexpected font invocation")
                }
                index to "$invoke, $ext->create(${ref.parameterTypes.joinToString("")})Landroid/graphics/Typeface;"
            }
            val defaults = instructions.mapIndexedNotNull { index, instruction ->
                val name = when ((instruction as? ReferenceInstruction)?.reference?.toString()) {
                    "Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;" -> "defaultFont"
                    "Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;" -> "defaultBoldFont"
                    else -> return@mapIndexedNotNull null
                }
                Triple(index, (instruction as OneRegisterInstruction).registerA, name)
            }
            if (changes.isEmpty() && defaults.isEmpty()) continue
            val target = mutableClassDefBy(klass).methods.single { it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType }
            changes.forEach { (index, code) -> target.replaceInstruction(index, code) }
            defaults.reversed().forEach { (index, register, name) ->
                target.replaceInstruction(index, "invoke-static {}, $ext->$name()Landroid/graphics/Typeface;")
                target.addInstructions(index + 1, "move-result-object v$register")
            }
            calls += changes.size
        }
        require(calls > 0) { "Todoist font resolver changed" }
        println("Todoist: hooked $calls font resolver calls")
    }
}

