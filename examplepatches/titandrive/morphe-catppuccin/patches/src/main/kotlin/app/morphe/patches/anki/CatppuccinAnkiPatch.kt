// SPDX-License-Identifier: GPL-3.0-or-later
package app.morphe.patches.anki

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private object AnkiAssets

private const val EXT = "Lapp/morphe/extension/anki/AnkiTheme;"
private val ankiResources = resourcePatch {
    execute {
        applyWidgetResources()
        val files = listOf("theme.xml", "catppuccin_drawer_text.xml", "catppuccin_latte_drawer_background.xml", "catppuccin_macchiato_drawer_background.xml", "catppuccin_button_again.xml", "catppuccin_button_hard.xml", "catppuccin_button_good.xml", "catppuccin_button_easy.xml", "nav_drawer_catppuccin_latte.png", "nav_drawer_catppuccin_macchiato.png")
        val loader = AnkiAssets::class.java.classLoader!!
        // Theme_Light and Theme_Dark retain their resource IDs and upstream selectors.
        document(loader.getResourceAsStream("catppuccin/anki/theme.xml")!!).use { source ->
            for(directory in get("res").listFiles().orEmpty()) {
                if(!directory.name.startsWith("values")) continue
                val file = java.io.File(directory,"styles.xml")
                if(!file.exists()) continue
                document("res/${directory.name}/styles.xml").use { target ->
                    val incoming = source.getElementsByTagName("style")
                    for(i in 0 until incoming.length) {
                        val style = incoming.item(i) as Element
                        val original = when(style.getAttribute("name")) {
                            "Theme.Catppuccin.Latte" -> "Theme_Light"
                            "Theme.Catppuccin.Macchiato" -> "Theme_Dark"
                            else -> null
                        }
                        if(original == null) {
                            if(directory.name == "values") target.documentElement.appendChild(target.importNode(style,true))
                            continue
                        }
                        val styles=target.getElementsByTagName("style")
                        val existing=(0 until styles.length).map {styles.item(it) as Element}.singleOrNull {it.getAttribute("name")==original} ?: continue
                        val nodes=style.childNodes
                        for(j in 0 until nodes.length) {
                            val item=nodes.item(j) as? Element ?: continue
                            if(item.getAttribute("name") in listOf("useThemePrimaryContainer","showAnswerButtonRef")) continue
                            val children=existing.childNodes
                            (0 until children.length).mapNotNull {children.item(it) as? Element}.filter {it.getAttribute("name")==item.getAttribute("name")}.forEach {existing.removeChild(it)}
                            existing.appendChild(target.importNode(item,true))
                        }
                    }
                }
            }
            document("res/values/colors.xml").use { target ->
                val colors = source.getElementsByTagName("color")
                for(i in 0 until colors.length) target.documentElement.appendChild(target.importNode(colors.item(i),true))
            }
        }
        for(name in files.drop(1)) {
            val directory = if(name.endsWith(".png")) "drawable-nodpi" else if(name == "catppuccin_drawer_text.xml") "color" else "drawable"
            get("res/$directory/$name").apply { parentFile.mkdirs(); loader.getResourceAsStream("catppuccin/anki/$name")!!.use { writeBytes(it.readBytes()) } }
        }
        for(name in listOf("JetBrainsMono-Regular.ttf", "font.js", "pages.css", "latte.css", "macchiato.css", "OFL-1.1.txt")) get("assets/catppuccin/anki/$name").apply {
            parentFile.mkdirs(); loader.getResourceAsStream("catppuccin/anki/$name")!!.use { writeBytes(it.readBytes()) }
        }
        for(directory in get("res").listFiles().orEmpty()) {
            if(!directory.name.startsWith("values")) continue
            val strings = java.io.File(directory,"strings.xml")
            if(!strings.exists()) continue
            document("res/${directory.name}/strings.xml").use { xml ->
                val labels = xml.getElementsByTagName("string")
                for(i in 0 until labels.length) {
                    val label=labels.item(i) as Element
                    when(label.getAttribute("name")) {
                        "day_theme_light" -> label.textContent="Catppuccin Latte"
                        "night_theme_dark" -> label.textContent="Catppuccin Macchiato"
                    }
                }
            }
        }
        document("res/xml/preferences_appearance.xml").use { xml ->
            val preference = xml.createElement("Preference")
            preference.setAttribute("android:key", "catppuccin_font_settings")
            preference.setAttribute("android:title", "Font and text size")
            preference.setAttribute("android:summary", "JetBrains Mono, custom TTF, and text scaling")
            val intent = xml.createElement("intent")
            intent.setAttribute("android:targetPackage", "com.ichi2.anki")
            intent.setAttribute("android:targetClass", "app.morphe.extension.anki.FontSettingsActivity")
            preference.appendChild(intent)
            val category = xml.createElement("PreferenceCategory")
            category.setAttribute("android:title", "Fonts")
            category.appendChild(preference)
            val elements = (0 until xml.documentElement.childNodes.length).mapNotNull { xml.documentElement.childNodes.item(it) as? Element }
            xml.documentElement.insertBefore(category, elements.getOrNull(1))
        }
        document("AndroidManifest.xml").use { xml ->
            val activity = xml.createElement("activity")
            activity.setAttribute("android:name", "app.morphe.extension.anki.FontSettingsActivity")
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:label", "Font and text size")
            xml.getElementsByTagName("application").item(0).appendChild(activity)
        }
    }
}

@Suppress("unused")
val catppuccinAnkiPatch = bytecodePatch(
    name = "AnkiDroid Catppuccin theme and fonts",
    description = "Replaces Light with Latte and Dark with Macchiato. Adds JetBrains Mono, custom TTF import, and font sizing under Appearance. Selected fonts override card template fonts. Themes widgets with JetBrains Mono and adjustable background opacity.",
    default = false,
) {
    compatibleWith(Compatibility(name="AnkiDroid", packageName="com.ichi2.anki", targets=listOf(AppTarget(version="2.25.1"), AppTarget(version="2.25.2"))))
    dependsOn(ankiResources)
    extendWith("catppuccin/anki.dex")
    execute {
        applyWidgetHooks()
        mutableClassDefBy("Lcom/ichi2/anki/AnkiDroidApp;").methods.single { it.name == "onCreate" }.addInstructions(0,
            "invoke-static/range {p0 .. p0}, $EXT->install(Landroid/app/Application;)V")
        // Locate the shared Activity base structurally, rather than hardcoding its R8 name.
        var owner = classDefBy("Lcom/ichi2/anki/DeckPicker;")
        while(owner.methods.none { it.name == "attachBaseContext" && it.parameterTypes == listOf("Landroid/content/Context;") }) {
            owner = classDefBy(owner.superclass ?: error("AnkiDroid Activity base has changed"))
        }
        mutableClassDefBy(owner).methods.single { it.name == "attachBaseContext" && it.parameterTypes == listOf("Landroid/content/Context;") }.addInstructions(0,
            "invoke-static/range {p1 .. p1}, $EXT->scaled(Landroid/content/Context;)Landroid/content/Context;\nmove-result-object p1")
        val pageClient = classDefBy { klass -> klass.methods.any { method -> method.implementation?.instructions?.any { instruction ->
            (instruction as? ReferenceInstruction)?.reference?.toString() == "backend/sveltekit/index.html"
        } == true } }
        val client = mutableClassDefBy(pageClient)
        val intercept = client.virtualMethods.single {
            it.name == "shouldInterceptRequest" &&
                it.parameterTypes == listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;")
        }
        // R8 reuses the native WebView parameter register before returning.
        // Keep the original arguments in a separate frame while the native method runs.
        val originalName = "catppuccinInterceptRequest"
        val wrapper = ImmutableMethod(
            client.type, intercept.name, intercept.parameters, intercept.returnType,
            intercept.accessFlags, intercept.annotations, intercept.hiddenApiRestrictions,
            MutableMethodImplementation(4),
        ).toMutable()
        wrapper.addInstructions(0, """
            invoke-virtual {p0, p1, p2}, ${client.type}->$originalName(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
            move-result-object v0
            invoke-static {p1, v0}, $EXT->response(Landroid/webkit/WebView;Landroid/webkit/WebResourceResponse;)Landroid/webkit/WebResourceResponse;
            move-result-object v0
            return-object v0
        """.trimIndent())
        check(client.virtualMethods.remove(intercept))
        check(client.methods.remove(intercept))
        intercept.setName(originalName)
        client.virtualMethods.add(intercept)
        client.virtualMethods.add(wrapper)
        client.methods.add(intercept)
        client.methods.add(wrapper)
        var webCalls=0
        var fontCalls=0
        val classes = mutableListOf<ClassDef>()
        classDefForEach { if(!it.type.startsWith("Lapp/morphe/extension/")) classes.add(it) }
        for (klass in classes) {
            for (method in klass.methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue
                val changes = instructions.mapIndexedNotNull { index, instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapIndexedNotNull null
                    val target = when {
                        ref.definingClass == "Landroid/webkit/WebView;" && ref.name == "loadDataWithBaseURL" && instruction.opcode !in listOf(com.android.tools.smali.dexlib2.Opcode.INVOKE_SUPER, com.android.tools.smali.dexlib2.Opcode.INVOKE_SUPER_RANGE) -> "load(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V"
                        ref.definingClass == "Landroid/graphics/Typeface;" && ref.name == "create" && ref.parameterTypes == listOf("Ljava/lang/String;","I") -> "create(Ljava/lang/String;I)Landroid/graphics/Typeface;"
                        ref.definingClass == "Landroid/graphics/Typeface;" && ref.name == "create" && ref.parameterTypes == listOf("Landroid/graphics/Typeface;","I") -> "create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;"
                        else -> return@mapIndexedNotNull null
                    }
                    if(target.startsWith("load")) webCalls++ else fontCalls++
                    val registers = when(instruction) {
                        is RegisterRangeInstruction -> "invoke-static/range {v${instruction.startRegister} .. v${instruction.startRegister+instruction.registerCount-1}}"
                        is FiveRegisterInstruction -> "invoke-static {" + listOf(instruction.registerC,instruction.registerD,instruction.registerE,instruction.registerF,instruction.registerG).take(instruction.registerCount).joinToString(", ") { "v$it" } + "}"
                        else -> error("Unsupported invocation format")
                    }
                    index to "$registers, $EXT->$target"
                }
                val defaults = instructions.mapIndexedNotNull { index, instruction ->
                    val value=(instruction as? ReferenceInstruction)?.reference?.toString()
                    val selected = when(value) {
                        "Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;" -> "defaultFont"
                        "Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;" -> "defaultBoldFont"
                        else -> return@mapIndexedNotNull null
                    }
                    Triple(index,(instruction as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA,selected)
                }
                if(changes.isNotEmpty() || defaults.isNotEmpty()) {
                    val mutable = mutableClassDefBy(klass).methods.single { it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType }
                    changes.forEach { (index, code) -> mutable.replaceInstruction(index,code) }
                    defaults.reversed().forEach { (index, register, name) ->
                        mutable.replaceInstruction(index,"invoke-static {}, $EXT->$name()Landroid/graphics/Typeface;")
                        mutable.addInstructions(index + 1,"move-result-object v$register")
                    }
                }
            }
        }
        require(webCalls >= 2) { "Card HTML hooks changed; refusing to apply an incomplete patch" }
        require(fontCalls > 0) { "Font resolver changed" }
        println("AnkiDroid: hooked $webCalls HTML loads and $fontCalls font resolvers")
    }
}
