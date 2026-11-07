package app.morphe.patches.reddit.customclients.boostforreddit.theme

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Document
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory

private object CatppuccinResources

private const val ATTRIBUTION =
    "This app uses code from Patcheddit. To learn more, visit https://reddit.com/r/patcheddit"

private fun Element.elements(): List<Element> {
    // Android getChildNodes() copies every child into a new NodeList. Fetching it
    // again for each item makes resource edits quadratic and takes minutes.
    val nodes = childNodes
    return (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
}

/** Replace individual items so inherited widget behavior and resource IDs are retained. */
private fun mergeItems(target: Element, source: Element) {
    for (item in source.elements()) {
        target.elements().firstOrNull { it.getAttribute("name") == item.getAttribute("name") }
            ?.let { target.removeChild(it) }
        target.appendChild(target.ownerDocument.importNode(item, true))
    }
}

// Resource IDs are reserved explicitly because the theme registry lives in DEX.
private val themeStyleIds = listOf(0x7f141000, 0x7f141001)
private val themeLabelIds = listOf(0x7f131000, 0x7f131001)

private val catppuccinResourcesPatch = resourcePatch {
    execute {
        if (packageMetadata.versionName in setOf("1.14.2", "1.14.3")) {
            applyModernBoostResources()
            return@execute
        }
        val templates: Document = checkNotNull(
            CatppuccinResources::class.java.classLoader.getResourceAsStream("catppuccin/styles.xml"),
        ).use { DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(it) }
        val styles = templates.documentElement.elements().associateBy { it.getAttribute("name") }
        val palette = checkNotNull(
            CatppuccinResources::class.java.classLoader.getResourceAsStream("catppuccin/palette.xml"),
        ).use { DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(it) }
        // Material navigation resolves text colors through TypedValue.resourceId.
        // Raw #hex style values have resourceId = 0 and crash during inflation.
        document("res/values/colors.xml").use { xml ->
            for (color in palette.documentElement.elements()) {
                xml.documentElement.elements()
                    .firstOrNull { it.getAttribute("name") == color.getAttribute("name") }
                    ?.let { xml.documentElement.removeChild(it) }
                xml.documentElement.appendChild(xml.importNode(color, true))
            }
        }

        // Undo earlier releases without replacing unrelated Patcheddit resources.
        val restore = checkNotNull(CatppuccinResources::class.java.classLoader
            .getResourceAsStream("catppuccin/restore.xml")).use {
            DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(it)
        }
        for (file in restore.documentElement.elements()) {
            val path = file.getAttribute("path")
            if (!get(path).exists()) continue
            document(path).use { xml ->
                if (file.getAttribute("mode") == "document") {
                    xml.replaceChild(xml.importNode(file.elements().single(), true), xml.documentElement)
                } else {
                    for (original in file.elements()) {
                        xml.documentElement.elements().firstOrNull {
                            it.getAttribute("name") == original.getAttribute("name")
                        }?.let { xml.documentElement.removeChild(it) }
                        xml.documentElement.appendChild(xml.importNode(original, true))
                    }
                }
                val namespaces = restore.documentElement.attributes
                for (index in 0 until namespaces.length) {
                    val attribute = namespaces.item(index)
                    if (attribute.nodeName.startsWith("xmlns:"))
                        xml.documentElement.setAttribute(attribute.nodeName, attribute.nodeValue)
                }
            }
        }
        document("res/values/styles.xml").use { xml ->
            for ((name, style) in styles) {
                xml.documentElement.elements().firstOrNull { it.getAttribute("name") == name }
                    ?.let { xml.documentElement.removeChild(it) }
                xml.documentElement.appendChild(xml.importNode(style, true))
            }
        }
        document("res/values/strings.xml").use { xml ->
            for ((index, flavor) in listOf("Latte", "Macchiato").withIndex()) {
                val name = "catppuccin_theme_${flavor.lowercase()}"
                xml.documentElement.elements().firstOrNull { it.getAttribute("name") == name }
                    ?.let { xml.documentElement.removeChild(it) }
                xml.documentElement.appendChild(xml.createElement("string").apply {
                    setAttribute("name", name)
                    textContent = "Catppuccin $flavor"
                })
            }
        }
        document("res/values/public.xml").use { xml ->
            for ((index, flavor) in listOf("Latte", "Macchiato").withIndex()) {
                for ((type, name, id) in listOf(
                    Triple("style", "Catppuccin.$flavor", themeStyleIds[index]),
                    Triple("style", "Catppuccin.$flavor.Toolbar", listOf(0x7f141003, 0x7f141006)[index]),
                    Triple("string", "catppuccin_theme_${flavor.lowercase()}", themeLabelIds[index]),
                )) {
                    xml.documentElement.elements().firstOrNull {
                        it.getAttribute("type") == type && it.getAttribute("name") == name
                    }?.let { xml.documentElement.removeChild(it) }
                    check(xml.documentElement.elements().none { it.getAttribute("id") == "0x${id.toString(16)}" })
                    xml.documentElement.appendChild(xml.createElement("public").apply {
                        setAttribute("type", type); setAttribute("name", name)
                        setAttribute("id", "0x${id.toString(16)}")
                    })
                }
            }
        }
        document("res/values/arrays.xml").use { xml ->
            for (array in xml.documentElement.elements()) {
                if (array.getAttribute("name").startsWith("pref_theme_values")) {
                    for (value in listOf("17", "18")) {
                        if (array.elements().none { it.textContent == value })
                            array.appendChild(xml.createElement("item").apply { textContent = value })
                    }
                }
            }
        }

        // Keep the upstream project's required notice accessible in both settings UIs.
        for (path in listOf("res/xml/pref_about.xml", "res/xml/pref_about_v2.xml")) {
            if (!get(path).exists()) continue
            document(path).use { xml ->
                val preference = xml.createElement("Preference").apply {
                    setAttribute("android:key", "catppuccin_patch_attribution")
                    setAttribute("android:title", "Boost Catppuccin")
                    setAttribute("android:summary", ATTRIBUTION)
                    setAttribute("android:selectable", "false")
                }
                val existing = xml.getElementsByTagName("Preference")
                (0 until existing.length).mapNotNull { existing.item(it) as? Element }
                    .filter { it.getAttribute("android:key") == "catppuccin_patch_attribution" }
                    .forEach { it.parentNode.removeChild(it) }
                xml.documentElement.appendChild(preference)
            }
        }
    }
}

@Suppress("unused")
val catppuccinThemePatch = bytecodePatch(
    name = "Catppuccin theme",
    description = "Adds separate Catppuccin Latte and Macchiato choices while preserving Boost's original themes.",
    default = false,
) {
    extendWith("catppuccin/boost-modern.dex")
    dependsOn(catppuccinResourcesPatch)
    compatibleWith(Compatibility(name = "Boost for Reddit", packageName = "com.rubenmayayo.reddit",
        targets = listOf(AppTarget(version = "1.12.12"), AppTarget(version = "1.14.2"), AppTarget(version = "1.14.3"))))
    execute {
        if (packageMetadata.versionName in setOf("1.14.2", "1.14.3")) {
            applyModernBoostTheme()
            return@execute
        }
        val utils = mutableClassDefBy("Lhe/f0;")
        val init = utils.methods.single { it.name == "<clinit>" }
        val alreadyPatched = init.implementation!!.instructions.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "Catppuccin.Latte"
        }
        if (!alreadyPatched) {
            val code = StringBuilder()
            for ((field, type, values) in listOf(
                Triple("b", "I", listOf("17", "18")),
                Triple("c", "I", themeStyleIds.map { "0x${it.toString(16)}" }),
                Triple("e", "I", themeLabelIds.map { "0x${it.toString(16)}" }),
                Triple("d", "Ljava/lang/String;", listOf("Catppuccin.Latte", "Catppuccin.Macchiato")),
            )) {
                val copyType = if (type == "I") "I" else "Ljava/lang/Object;"
                code.append("""
                    sget-object v0, Lhe/f0;->$field:[$type
                    const/16 v1, 19
                    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([${copyType}I)[$copyType
                    move-result-object v0
                    check-cast v0, [$type
                """)
                for ((i, value) in values.withIndex()) {
                    code.append("\nconst/16 v1, ${17 + i}\n")
                    if (type == "I") code.append("const v2, $value\naput v2, v0, v1\n")
                    else code.append("const-string v2, \"$value\"\naput-object v2, v0, v1\n")
                }
                code.append("sput-object v0, Lhe/f0;->$field:[$type\n")
            }
            init.addInstructions(init.implementation!!.instructions.indexOfFirst { it.opcode == Opcode.RETURN_VOID }, code.toString())
            // Both new slots use Material widgets; Latte also needs light-theme behavior.
            utils.methods.single { it.name == "J" }.addInstructions(0, """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :cat_material
                const/16 v1, 18
                if-ne v0, v1, :cat_original
                :cat_material
                const/4 v0, 1
                return v0
                :cat_original
                nop
            """)
            utils.methods.single { it.name == "D" }.addInstructions(0, """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-ne v0, v1, :cat_original
                const/16 v0, 100
                return v0
                :cat_original
                nop
            """)
            utils.methods.single { it.name == "H" }.addInstructions(0, """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                add-int/lit8 v0, v0, -17
                if-ltz v0, :cat_original
                add-int/lit8 v0, v0, -1
                if-gtz v0, :cat_original
                const/4 v0, 0
                return v0
                :cat_original
                nop
            """)
            val menu = mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/compose/FormatActivity;")
                .methods.single { it.name == "onCreateOptionsMenu" }
            menu.addInstructions(0, """
                const-string v0, "Catppuccin send accent"
            """)
            // Apply the tint after inflation, only for the two dedicated selections.
            menu.addInstructionsWithLabels(menu.implementation!!.instructions.indexOfFirst { it.opcode == Opcode.RETURN } - 1, """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :cat_latte
                const/16 v1, 18
                if-ne v0, v1, :cat_done
                const v0, 0xffc6a0f6
                goto :cat_tint
                :cat_latte
                const v0, 0xff8839ef
                :cat_tint
                invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
                move-result-object v0
                const v1, 0x7f0a009b
                invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;
                move-result-object v1
                invoke-interface {v1, v0}, Landroid/view/MenuItem;->setIconTintList(Landroid/content/res/ColorStateList;)Landroid/view/MenuItem;
                :cat_done
                const/4 p1, 1
            """)
        }
        // Media activities use a separate black theme and hard-coded backgrounds.
        // Keep their original behavior unless one of our two selections is active.
        // Saved custom toolbar colors can otherwise override the selected Catppuccin style.
        val headerMarker = "Catppuccin header palette"
        for ((name, colors) in mapOf(
            "k" to ("0xffccd0da" to "0xff1e2030"),
            "l" to ("0xffccd0da" to "0xff1e2030"),
            "w" to ("0xff4c4f69" to "0xff8aadf4"),
            "e" to ("0xff4c4f69" to "0xffcad3f5"),
            "o" to ("0xff6c6f85" to "0xffa5adcb"),
            "x" to ("0xff4c4f69" to "0xffcad3f5"),
            "f" to ("0xff8839ef" to "0xffc6a0f6"),
        )) {
            val method = utils.methods.single { it.name == name }
            // Rebuild w's prefix once, including when upgrading from the broken 0.2.5.
            // A single labeled insertion avoids stale branch offsets in Patcher 1.15.
            if (name == "w") {
                val original = method.implementation!!.instructions.indexOfFirst {
                    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Lhe/f0;" && ref.name == "H"
                }
                require(original >= 0)
                if (original > 0) method.removeInstructions(0, original)
            }
            if (method.implementation!!.instructions.any {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == headerMarker
            }) {
                if (name != "k" && name != "l") continue
                val end = method.implementation!!.instructions.indexOfFirst { it.opcode == Opcode.NOP }
                require(end >= 0)
                method.removeInstructions(0, end + 1)
            }
            method.addInstructionsWithLabels(0, """
                const-string v0, "$headerMarker"
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :cat_header_latte
                const/16 v1, 18
                if-ne v0, v1, :cat_header_original
                const v0, ${colors.second}
                return v0
                :cat_header_latte
                const v0, ${colors.first}
                return v0
                :cat_header_original
                nop
            """)
        }
        // Override saved rainbow palettes only for the two Catppuccin selections.
        val depth = mutableClassDefBy("Lid/b;").methods.single { it.name == "K1" }
        val commentMarker = "Catppuccin comment depth palette"
        if (depth.implementation!!.instructions.none {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == commentMarker
        }) depth.addInstructionsWithLabels(0, """
                const-string v0, "$commentMarker"
                invoke-virtual {p0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :cat_depth_latte
                const/16 v1, 18
                if-ne v0, v1, :cat_depth_original
                const/16 v0, 11
                new-array v0, v0, [I
                const v2, 0xffc6a0f6
                const/16 v1, 1
                aput v2, v0, v1
                const v2, 0xffed8796
                const/16 v1, 2
                aput v2, v0, v1
                const v2, 0xfff5a97f
                const/16 v1, 3
                aput v2, v0, v1
                const v2, 0xffeed49f
                const/16 v1, 4
                aput v2, v0, v1
                const v2, 0xffa6da95
                const/16 v1, 5
                aput v2, v0, v1
                const v2, 0xff8bd5ca
                const/16 v1, 6
                aput v2, v0, v1
                const v2, 0xff91d7e3
                const/16 v1, 7
                aput v2, v0, v1
                const v2, 0xff7dc4e4
                const/16 v1, 8
                aput v2, v0, v1
                const v2, 0xff8aadf4
                const/16 v1, 9
                aput v2, v0, v1
                const v2, 0xffb7bdf8
                const/16 v1, 10
                aput v2, v0, v1
                return-object v0
                :cat_depth_latte
                const/16 v0, 11
                new-array v0, v0, [I
                const v2, 0xff8839ef
                const/16 v1, 1
                aput v2, v0, v1
                const v2, 0xffd20f39
                const/16 v1, 2
                aput v2, v0, v1
                const v2, 0xfffe640b
                const/16 v1, 3
                aput v2, v0, v1
                const v2, 0xffdf8e1d
                const/16 v1, 4
                aput v2, v0, v1
                const v2, 0xff40a02b
                const/16 v1, 5
                aput v2, v0, v1
                const v2, 0xff179299
                const/16 v1, 6
                aput v2, v0, v1
                const v2, 0xff04a5e5
                const/16 v1, 7
                aput v2, v0, v1
                const v2, 0xff209fb5
                const/16 v1, 8
                aput v2, v0, v1
                const v2, 0xff1e66f5
                const/16 v1, 9
                aput v2, v0, v1
                const v2, 0xff7287fd
                const/16 v1, 10
                aput v2, v0, v1
                return-object v0
                :cat_depth_original
                nop
        """)
        if (utils.methods.none { it.name == "catppuccinUsername" }) {
            fun usernameHelper(name: String, params: List<String>, code: String) {
                utils.directMethods.add(ImmutableMethod(utils.type, name,
                    params.map { ImmutableMethodParameter(it, emptySet(), null) }, "V",
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                    MutableMethodImplementation(5)).toMutable().apply { addInstructions(0, code) })
            }
            usernameHelper("catppuccinUsername", listOf("Landroid/widget/TextView;", "I"), """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :latte
                const/16 v1, 18
                if-ne v0, v1, :done
                const/16 v1, 0
                if-ne p1, v1, :m0
                const v0, 0xffc6a0f6
                goto :tint
                :m0
                const/16 v1, 1
                if-ne p1, v1, :m1
                const v0, 0xff8aadf4
                goto :tint
                :m1
                const/16 v1, 2
                if-ne p1, v1, :m2
                const v0, 0xffeed49f
                goto :tint
                :m2
                const/16 v1, 3
                if-ne p1, v1, :m3
                const v0, 0xffa6da95
                goto :tint
                :m3
                const v0, 0xffed8796
                goto :tint
                :latte
                const/16 v1, 0
                if-ne p1, v1, :l0
                const v0, 0xff8839ef
                goto :tint
                :l0
                const/16 v1, 1
                if-ne p1, v1, :l1
                const v0, 0xff1e66f5
                goto :tint
                :l1
                const/16 v1, 2
                if-ne p1, v1, :l2
                const v0, 0xff7287fd
                goto :tint
                :l2
                const/16 v1, 3
                if-ne p1, v1, :l3
                const v0, 0xff40a02b
                goto :tint
                :l3
                const v0, 0xffd20f39
                :tint
                invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
                move-result-object v1
                if-eqz v1, :done
                invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;
                move-result-object v1
                invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V
                :done
                return-void
            """)
            usernameHelper("catppuccinUsernameText", listOf("Landroid/widget/TextView;", "I"), """
                const/4 v0, -1
                if-ne p1, v0, :apply
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :light
                const/16 v1, 18
                if-ne v0, v1, :apply
                const p1, 0xff24273a
                goto :apply
                :light
                const p1, 0xffeff1f5
                :apply
                invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V
                return-void
            """)
            val author = mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;").methods.single { it.name == "I" }
            val instructions = author.implementation!!.instructions.toList()
            for (index in instructions.indices.reversed()) {
                val ref = (instructions[index] as? ReferenceInstruction)?.reference
                if (ref is MethodReference && ref.name == "setTextColor") {
                    val call = instructions[index] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
                    author.replaceInstruction(index, "invoke-static {v${call.registerC}, v${call.registerD}}, Lhe/f0;->catppuccinUsernameText(Landroid/widget/TextView;I)V")
                }
                if (ref is MethodReference && ref.name == "setBackground") {
                    val field = (instructions[index - 1] as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference
                    val role = listOf("k", "j", "l", "m", "n").indexOf(field?.name)
                    require(role >= 0)
                    author.addInstructionsWithLabels(index + 1, "const/16 v0, $role\ninvoke-static {p1, v0}, Lhe/f0;->catppuccinUsername(Landroid/widget/TextView;I)V")
                }
            }
        }
        // Shared by inline post flair, rich post flair, and rich user flair.
        // Preserve solid badges and their hue families, replacing subreddit colors.
        val flair = mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/customviews/m;")
        if (flair.methods.none { it.name == "catppuccinFlairBackground" }) {
            fun flairHelper(name: String, params: List<String>, registers: Int, code: String) {
                flair.directMethods.add(ImmutableMethod(flair.type, name,
                    params.map { ImmutableMethodParameter(it, emptySet(), null) }, "I",
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                    MutableMethodImplementation(registers)).toMutable().apply { addInstructionsWithLabels(0, code) })
            }
            flairHelper("catppuccinFlairBackground", listOf("I"), 7, """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :cat_flair
                const/16 v1, 18
                if-eq v0, v1, :cat_flair
                return p0
                :cat_flair
                if-nez p0, :colored
                return p0
                :colored
                const/4 v1, 3
                new-array v1, v1, [F
                invoke-static {p0, v1}, Landroid/graphics/Color;->colorToHSV(I[F)V
                const/4 v2, 1
                aget v3, v1, v2
                const v4, 0x3e19999a
                cmpg-float v3, v3, v4
                if-gez v3, :chromatic
                const/16 v3, 11
                goto :palette
                :chromatic
                const/4 v2, 0
                aget v3, v1, v2
                float-to-int v3, v3
                const/16 v4, 15
                if-ge v3, v4, :hue0
                const/16 v3, 0
                goto :palette
                :hue0
                const/16 v4, 45
                if-ge v3, v4, :hue1
                const/16 v3, 1
                goto :palette
                :hue1
                const/16 v4, 75
                if-ge v3, v4, :hue2
                const/16 v3, 2
                goto :palette
                :hue2
                const/16 v4, 165
                if-ge v3, v4, :hue3
                const/16 v3, 3
                goto :palette
                :hue3
                const/16 v4, 185
                if-ge v3, v4, :hue4
                const/16 v3, 4
                goto :palette
                :hue4
                const/16 v4, 205
                if-ge v3, v4, :hue5
                const/16 v3, 5
                goto :palette
                :hue5
                const/16 v4, 225
                if-ge v3, v4, :hue6
                const/16 v3, 6
                goto :palette
                :hue6
                const/16 v4, 255
                if-ge v3, v4, :hue7
                const/16 v3, 7
                goto :palette
                :hue7
                const/16 v4, 275
                if-ge v3, v4, :hue8
                const/16 v3, 8
                goto :palette
                :hue8
                const/16 v4, 300
                if-ge v3, v4, :hue9
                const/16 v3, 9
                goto :palette
                :hue9
                const/16 v4, 345
                if-ge v3, v4, :hue10
                const/16 v3, 10
                goto :palette
                :hue10
                const/4 v3, 0
                goto :palette
                :palette
                const/16 v4, 17
                if-eq v0, v4, :latte
                const/16 v4, 0
                if-ne v3, v4, :m0
                const v0, 0xffed8796
                return v0
                :m0
                const/16 v4, 1
                if-ne v3, v4, :m1
                const v0, 0xfff5a97f
                return v0
                :m1
                const/16 v4, 2
                if-ne v3, v4, :m2
                const v0, 0xffeed49f
                return v0
                :m2
                const/16 v4, 3
                if-ne v3, v4, :m3
                const v0, 0xffa6da95
                return v0
                :m3
                const/16 v4, 4
                if-ne v3, v4, :m4
                const v0, 0xff8bd5ca
                return v0
                :m4
                const/16 v4, 5
                if-ne v3, v4, :m5
                const v0, 0xff91d7e3
                return v0
                :m5
                const/16 v4, 6
                if-ne v3, v4, :m6
                const v0, 0xff7dc4e4
                return v0
                :m6
                const/16 v4, 7
                if-ne v3, v4, :m7
                const v0, 0xff8aadf4
                return v0
                :m7
                const/16 v4, 8
                if-ne v3, v4, :m8
                const v0, 0xffb7bdf8
                return v0
                :m8
                const/16 v4, 9
                if-ne v3, v4, :m9
                const v0, 0xffc6a0f6
                return v0
                :m9
                const/16 v4, 10
                if-ne v3, v4, :m10
                const v0, 0xfff5bde6
                return v0
                :m10
                const v0, 0xff363a4f
                return v0
                :latte
                const/16 v4, 0
                if-ne v3, v4, :l0
                const v0, 0xffd20f39
                return v0
                :l0
                const/16 v4, 1
                if-ne v3, v4, :l1
                const v0, 0xfffe640b
                return v0
                :l1
                const/16 v4, 2
                if-ne v3, v4, :l2
                const v0, 0xffdf8e1d
                return v0
                :l2
                const/16 v4, 3
                if-ne v3, v4, :l3
                const v0, 0xff40a02b
                return v0
                :l3
                const/16 v4, 4
                if-ne v3, v4, :l4
                const v0, 0xff179299
                return v0
                :l4
                const/16 v4, 5
                if-ne v3, v4, :l5
                const v0, 0xff04a5e5
                return v0
                :l5
                const/16 v4, 6
                if-ne v3, v4, :l6
                const v0, 0xff209fb5
                return v0
                :l6
                const/16 v4, 7
                if-ne v3, v4, :l7
                const v0, 0xff1e66f5
                return v0
                :l7
                const/16 v4, 8
                if-ne v3, v4, :l8
                const v0, 0xff7287fd
                return v0
                :l8
                const/16 v4, 9
                if-ne v3, v4, :l9
                const v0, 0xff8839ef
                return v0
                :l9
                const/16 v4, 10
                if-ne v3, v4, :l10
                const v0, 0xffea76cb
                return v0
                :l10
                const v0, 0xffccd0da
                return v0
            """)
            flairHelper("catppuccinFlairText", listOf("I", "I"), 6, """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :latte
                const/16 v1, 18
                if-ne v0, v1, :original
                if-eqz p0, :dark_neutral
                invoke-static {p0}, Lcom/rubenmayayo/reddit/ui/customviews/m;->catppuccinFlairBackground(I)I
                move-result v0
                const v1, 0xff363a4f
                if-eq v0, v1, :dark_neutral
                const v0, 0xff24273a
                return v0
                :dark_neutral
                const v0, 0xffcad3f5
                return v0
                :latte
                if-eqz p0, :light_neutral
                invoke-static {p0}, Lcom/rubenmayayo/reddit/ui/customviews/m;->catppuccinFlairBackground(I)I
                move-result v0
                const v1, 0xffccd0da
                if-eq v0, v1, :light_neutral
                const v1, 0xffd20f39
                if-eq v0, v1, :light_ink
                const v1, 0xff1e66f5
                if-eq v0, v1, :light_ink
                const v1, 0xff8839ef
                if-eq v0, v1, :light_ink
                const v0, 0xff181926
                return v0
                :light_ink
                const v0, 0xffeff1f5
                return v0
                :light_neutral
                const v0, 0xff4c4f69
                return v0
                :original
                return p1
            """)
            val background = flair.methods.single { it.name == "a" }
            background.replaceInstruction(background.implementation!!.instructions.indexOfFirst { it.opcode == Opcode.RETURN }, """
                invoke-static {v0}, Lcom/rubenmayayo/reddit/ui/customviews/m;->catppuccinFlairBackground(I)I
            """)
            background.addInstructions(background.implementation!!.instructions.size, "move-result v0\nreturn v0")
            val text = flair.methods.single { it.name == "c" }
            // One local register is enough: pass the existing text color in v0,
            // then reuse p0 for the original background after reading the field.
            text.replaceInstruction(text.implementation!!.instructions.indexOfFirst { it.opcode == Opcode.RETURN }, "iget p0, p0, Lcom/rubenmayayo/reddit/ui/customviews/m;->a:I")
            text.addInstructions(text.implementation!!.instructions.size, """
                invoke-static {p0, v0}, Lcom/rubenmayayo/reddit/ui/customviews/m;->catppuccinFlairText(II)I
                move-result v0
                return v0
            """)
        }
        if (utils.methods.none { it.name == "catppuccinViewer" }) {
            fun helper(name: String, parameters: List<String>, registers: Int, code: String) {
                utils.directMethods.add(ImmutableMethod(utils.type, name,
                    parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, "V",
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                    MutableMethodImplementation(registers)).toMutable().apply { addInstructionsWithLabels(0, code) })
            }
            helper("catppuccinViewerTheme", listOf("Landroid/app/Activity;"), 3, """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :apply
                const/16 v1, 18
                if-ne v0, v1, :done
                :apply
                invoke-static {p0}, Lhe/f0;->N(Landroid/app/Activity;)I
                :done
                return-void
            """)
            helper("catppuccinViewerControls", listOf("Landroid/view/View;", "I"), 6, """
                if-eqz p0, :done
                instance-of v0, p0, Landroid/widget/TextView;
                if-eqz v0, :image
                move-object v0, p0
                check-cast v0, Landroid/widget/TextView;
                invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V
                :image
                instance-of v0, p0, Landroid/widget/ImageView;
                if-eqz v0, :children
                move-object v0, p0
                check-cast v0, Landroid/widget/ImageView;
                invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
                move-result-object v1
                invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V
                :children
                instance-of v0, p0, Landroid/view/ViewGroup;
                if-eqz v0, :done
                check-cast p0, Landroid/view/ViewGroup;
                const/4 v0, 0
                :loop
                invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I
                move-result v1
                if-ge v0, v1, :done
                invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
                move-result-object v2
                invoke-static {v2, p1}, Lhe/f0;->catppuccinViewerControls(Landroid/view/View;I)V
                add-int/lit8 v0, v0, 1
                goto :loop
                :done
                return-void
            """)
            // Reserve image space between controls instead of painting opaque panels over zoomed content.
            helper("catppuccinViewer", listOf("Landroid/app/Activity;"), 7, """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :latte
                const/16 v1, 18
                if-ne v0, v1, :done
                const v1, 0xff24273a
                const v2, 0xff24273a
                const v3, 0xffcad3f5
                goto :apply
                :latte
                const v1, 0xffeff1f5
                const v2, 0xffeff1f5
                const v3, 0xff4c4f69
                :apply
                invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                move-result-object v0
                invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;
                move-result-object v4
                invoke-virtual {v4, v1}, Landroid/view/View;->setBackgroundColor(I)V
                invoke-virtual {v0, v2}, Landroid/view/Window;->setStatusBarColor(I)V
                invoke-virtual {v0, v2}, Landroid/view/Window;->setNavigationBarColor(I)V
                const v0, 0x7f0a01ac
                invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v0
                if-eqz v0, :main
                invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V
                :main
                const v0, 0x7f0a0374
                invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v0
                if-eqz v0, :bottom
                invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V
                :bottom
                const v0, 0x7f0a015c
                invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v0
                if-eqz v0, :toolbar
                const/4 v4, 0
                invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundColor(I)V
                invoke-static {v0, v3}, Lhe/f0;->catppuccinViewerControls(Landroid/view/View;I)V
                :toolbar
                const v0, 0x7f0a0668
                invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v0
                if-eqz v0, :done
                const/4 v4, 0
                invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundColor(I)V
                invoke-static {v0, v3}, Lhe/f0;->catppuccinViewerControls(Landroid/view/View;I)V
                :done
                return-void
            """)
            helper("catppuccinViewerMenu", listOf("Landroid/view/Menu;"), 7, """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :latte
                const/16 v1, 18
                if-ne v0, v1, :done
                const v1, 0xffcad3f5
                const v4, 0xffc6a0f6
                goto :apply
                :latte
                const v1, 0xff4c4f69
                const v4, 0xff8839ef
                :apply
                invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
                move-result-object v1
                invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
                move-result-object v4
                const/4 v0, 0
                :loop
                invoke-interface {p0}, Landroid/view/Menu;->size()I
                move-result v2
                if-ge v0, v2, :done
                invoke-interface {p0, v0}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;
                move-result-object v2
                invoke-interface {v2}, Landroid/view/MenuItem;->getItemId()I
                move-result v3
                const v5, 0x7f0a004f
                if-eq v3, v5, :accent
                const v5, 0x7f0a0065
                if-eq v3, v5, :accent
                invoke-interface {v2, v1}, Landroid/view/MenuItem;->setIconTintList(Landroid/content/res/ColorStateList;)Landroid/view/MenuItem;
                goto :next
                :accent
                invoke-interface {v2, v4}, Landroid/view/MenuItem;->setIconTintList(Landroid/content/res/ColorStateList;)Landroid/view/MenuItem;
                :next
                add-int/lit8 v0, v0, 1
                goto :loop
                :done
                return-void
            """)
            for (name in listOf("ImageActivity", "MediaImageActivity", "HDImageActivity", "GalleryActivity")) {
                val activity = mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/activities/$name;")
                activity.methods.firstOrNull { it.name == "onCreateOptionsMenu" }?.let { menu ->
                    val inflate = menu.implementation!!.instructions.indexOfFirst {
                        val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
                        reference?.definingClass == "Landroid/view/MenuInflater;" && reference.name == "inflate"
                    }
                    check(inflate >= 0)
                    menu.addInstructions(inflate + 1,
                        """
                            invoke-static {p0}, Lhe/f0;->catppuccinViewer(Landroid/app/Activity;)V
                            invoke-static {p1}, Lhe/f0;->catppuccinViewerMenu(Landroid/view/Menu;)V
                        """)
                }
                val create = activity.methods.single { it.name == "onCreate" }
                val content = create.implementation!!.instructions.indexOfFirst {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "setContentView"
                }
                check(content >= 0)
                create.addInstructions(content + 1,
                    "invoke-static {p0}, Lhe/f0;->catppuccinViewer(Landroid/app/Activity;)V")
                create.addInstructions(0,
                    "invoke-static {p0}, Lhe/f0;->catppuccinViewerTheme(Landroid/app/Activity;)V")
            }
        }
        // Gallery pages are inflated lazily, independently of the activity root.
        // Video/GIF players also have their own cover and shutter surfaces.
        if (utils.methods.none { it.name == "catppuccinMediaSurface" }) {
            fun surfaceHelper(name: String, parameters: List<String>, registers: Int, code: String) {
                utils.directMethods.add(ImmutableMethod(utils.type, name,
                    parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, "V",
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                    MutableMethodImplementation(registers)).toMutable().apply { addInstructionsWithLabels(0, code) })
            }
            surfaceHelper("catppuccinMediaSurface", listOf("Landroid/view/View;"), 7, """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :latte
                const/16 v1, 18
                if-ne v0, v1, :done
                const v1, 0xff24273a
                const v2, 0xffcad3f5
                goto :apply
                :latte
                const v1, 0xffeff1f5
                const v2, 0xff4c4f69
                :apply
                invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundColor(I)V
                const v4, 0x7f0a01ac
                invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;
                move-result-object v3
                if-eqz v3, :surface0
                invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundColor(I)V
                :surface0
                const v4, 0x7f0a0374
                invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;
                move-result-object v3
                if-eqz v3, :surface1
                invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundColor(I)V
                :surface1
                const v4, 0x7f0a06be
                invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;
                move-result-object v3
                if-eqz v3, :surface2
                invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundColor(I)V
                :surface2
                const v4, 0x7f0a06bb
                invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;
                move-result-object v3
                if-eqz v3, :surface3
                invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundColor(I)V
                :surface3
                const v4, 0x7f0a0243
                invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;
                move-result-object v3
                if-eqz v3, :surface4
                invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundColor(I)V
                :surface4
                const v4, 0x7f0a06ba
                invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;
                move-result-object v3
                if-eqz v3, :surface5
                invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundColor(I)V
                :surface5
                const v4, 0x7f0a03e7
                invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;
                move-result-object v3
                if-eqz v3, :done
                const/4 v4, 0
                invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundColor(I)V
                invoke-static {v3, v2}, Lhe/f0;->catppuccinViewerControls(Landroid/view/View;I)V
                :done
                return-void
            """)
            surfaceHelper("catppuccinMediaActivity", listOf("Landroid/app/Activity;"), 3, """
                invoke-static {p0}, Lhe/f0;->catppuccinViewer(Landroid/app/Activity;)V
                invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                move-result-object v0
                invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;
                move-result-object v0
                invoke-static {v0}, Lhe/f0;->catppuccinMediaSurface(Landroid/view/View;)V
                return-void
            """)
            surfaceHelper("catppuccinPostBody", listOf("Landroid/view/View;"), 5, """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :latte
                const/16 v1, 18
                if-ne v0, v1, :done
                const v1, 0xff24273a
                const v2, 0xffcad3f5
                goto :apply
                :latte
                const v1, 0xffe6e9ef
                const v2, 0xff4c4f69
                :apply
                const v2, 0x7f0a05b2
                invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;
                move-result-object v2
                if-eqz v2, :preview
                invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundColor(I)V
                :preview
                const v2, 0x7f0a05c0
                invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;
                move-result-object v2
                if-eqz v2, :done
                invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundColor(I)V
                :done
                return-void
            """)
            val holder = mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;")
                .methods.single { it.name == "<init>" }
            val bind = holder.implementation!!.instructions.indexOfFirst {
                val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lbutterknife/ButterKnife;" && ref.name == "bind"
            }
            require(bind >= 0)
            holder.addInstructionsWithLabels(bind + 1, "invoke-static/range {p1 .. p1}, Lhe/f0;->catppuccinPostBody(Landroid/view/View;)V")
            fun hookInflatedView(type: String, methodName: String) {
                val method = mutableClassDefBy(type).methods.single { it.name == methodName }
                val index = method.implementation!!.instructions.indexOfFirst {
                    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Landroid/view/LayoutInflater;" && ref.name == "inflate"
                }
                require(index >= 0)
                val result = method.implementation!!.instructions.elementAt(index + 1)
                    as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
                method.addInstructionsWithLabels(index + 2,
                    "invoke-static/range {v${result.registerA} .. v${result.registerA}}, Lhe/f0;->catppuccinMediaSurface(Landroid/view/View;)V")
            }
            hookInflatedView("Lcom/rubenmayayo/reddit/ui/fragments/imagemodel/ImageModelFragment;", "onCreateView")
            // Inline gallery carousel pages also inflate their own image root.
            val pager = mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/customviews/GalleryPagerView\$d;")
            val pageMethod = pager.methods.single { method ->
                method.implementation?.instructions?.any {
                    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Landroid/view/LayoutInflater;" && ref.name == "inflate"
                } == true
            }
            hookInflatedView(pager.type, pageMethod.name)
            for (name in listOf("MediaVideoActivity", "GifActivity", "VideoActivity")) {
                val activity = mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/activities/$name;")
                val create = activity.methods.single { it.name == "onCreate" }
                val content = create.implementation!!.instructions.indexOfFirst {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "setContentView"
                }
                require(content >= 0)
                create.addInstructionsWithLabels(content + 1,
                    "invoke-static/range {p0 .. p0}, Lhe/f0;->catppuccinMediaActivity(Landroid/app/Activity;)V")
                // YouTube's activity handles its own non-AppCompat theme setup.
                if (name != "VideoActivity") create.addInstructionsWithLabels(0,
                    "invoke-static/range {p0 .. p0}, Lhe/f0;->catppuccinViewerTheme(Landroid/app/Activity;)V")
            }
        }

        // Rounded backgrounds are applied after the view-holder's initial setup.
        // Replace the color at the final drawable creation point, preserving corners.
        if (utils.methods.none { it.name == "catppuccinPostPanelColor" }) {
            utils.directMethods.add(ImmutableMethod(utils.type, "catppuccinPostPanelColor",
                listOf("Landroid/view/View;", "I").map { ImmutableMethodParameter(it, emptySet(), null) }, "I",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                MutableMethodImplementation(5)).toMutable().apply { addInstructionsWithLabels(0, """
                invoke-virtual {p0}, Landroid/view/View;->getId()I
                move-result v0
                const v1, 0x7f0a05b2
                if-eq v0, v1, :post_panel
                const v1, 0x7f0a05c0
                if-ne v0, v1, :original
                :post_panel
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :latte
                const/16 v1, 18
                if-ne v0, v1, :original
                const v0, 0xff24273a
                return v0
                :latte
                const v0, 0xffe6e9ef
                return v0
                :original
                return p1
            """) })
            val rounded = mutableClassDefBy("Lhe/h0;").methods.single { it.name == "z0" }
            rounded.addInstructionsWithLabels(0, """
                invoke-static {p0, p2}, Lhe/f0;->catppuccinPostPanelColor(Landroid/view/View;I)I
                move-result p2
            """)
        }

        // Album/gallery viewers name their toolbar differently from image viewers.
        if (utils.methods.none { it.name == "catppuccinMediaToolbar" }) {
            utils.directMethods.add(ImmutableMethod(utils.type, "catppuccinMediaToolbar",
                listOf(ImmutableMethodParameter("Landroid/app/Activity;", emptySet(), null)), "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                MutableMethodImplementation(5)).toMutable().apply { addInstructionsWithLabels(0, """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :latte
                const/16 v1, 18
                if-ne v0, v1, :done
                const v1, 0xffcad3f5
                goto :apply
                :latte
                const v1, 0xff4c4f69
                :apply
                const v2, 0x7f0a0434
                invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v0
                if-eqz v0, :done
                const/4 v2, 0
                invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V
                invoke-virtual {v0, v2}, Landroid/view/View;->setElevation(F)V
                invoke-static {v0, v1}, Lhe/f0;->catppuccinViewerControls(Landroid/view/View;I)V
                :done
                return-void
            """) })
            // Hook parsed activity methods rather than modifying a freshly assembled helper:
            // older patchers can corrupt its branch offsets when prepending instructions.
            for (name in listOf("ImageActivity", "MediaImageActivity", "HDImageActivity", "GalleryActivity")) {
                val activity = mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/activities/$name;")
                for (method in activity.methods.filter { it.name == "onCreate" || it.name == "onCreateOptionsMenu" }) {
                    val calls = method.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
                        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        if (reference?.definingClass == utils.type && reference.name == "catppuccinViewer") index else null
                    }
                    for (index in calls.asReversed()) {
                        method.addInstructionsWithLabels(index + 1,
                            "invoke-static/range {p0 .. p0}, Lhe/f0;->catppuccinMediaToolbar(Landroid/app/Activity;)V")
                    }
                }
            }
        }

        if (utils.directMethods.none { it.name == "catppuccinRefresh" }) {
            fun contrastHelper(name: String, parameters: List<String>, registers: Int, result: String = "V", code: String) {
                utils.directMethods.add(ImmutableMethod(utils.type, name,
                    parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                    MutableMethodImplementation(registers)).toMutable().apply { addInstructionsWithLabels(0, code) })
            }
            contrastHelper("catppuccinToolbarStyle", listOf("I"), 3, "I", """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :latte
                const/16 v1, 18
                if-ne v0, v1, :original
                const p0, 0x7f141006
                return p0
                :latte
                const p0, 0x7f141003
                :original
                return p0
            """)
            val toolbarStyle = utils.methods.single { it.name == "C" }
            val styleReturn = toolbarStyle.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN }
            toolbarStyle.addInstructionsWithLabels(styleReturn, """
                invoke-static {p0}, Lhe/f0;->catppuccinToolbarStyle(I)I
                move-result p0
            """)
            contrastHelper("catppuccinFollow", listOf("Lcom/google/android/material/chip/Chip;"), 4, code = """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :latte
                const/16 v1, 18
                if-ne v0, v1, :done
                const v1, 0xff24273a
                const v2, 0xffc6a0f6
                goto :apply
                :latte
                const v1, 0xffeff1f5
                const v2, 0xff8839ef
                :apply
                invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextColor(I)V
                invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
                move-result-object v1
                invoke-virtual {p0, v1}, Lcom/google/android/material/chip/Chip;->setChipIconTint(Landroid/content/res/ColorStateList;)V
                invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
                move-result-object v2
                invoke-virtual {p0, v2}, Lcom/google/android/material/chip/Chip;->setChipBackgroundColor(Landroid/content/res/ColorStateList;)V
                invoke-virtual {p0, v2}, Lcom/google/android/material/chip/Chip;->setChipStrokeColor(Landroid/content/res/ColorStateList;)V
                :done
                return-void
            """)
            val chip = mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/customviews/SubscribeChip;")
            for (method in chip.methods.filter { it.name in listOf("<init>", "setColor", "setSubscribed", "I") }) {
                val returns = method.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
                    if (instruction.opcode == Opcode.RETURN_VOID) index else null
                }
                for (index in returns.asReversed()) method.addInstructionsWithLabels(index,
                    "invoke-static/range {p0 .. p0}, Lhe/f0;->catppuccinFollow(Lcom/google/android/material/chip/Chip;)V")
            }
            contrastHelper("catppuccinRefresh", listOf("Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;", "[I"), 4, code = """
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :latte
                const/16 v1, 18
                if-ne v0, v1, :original
                const v0, 0xffc6a0f6
                const v1, 0xff363a4f
                goto :apply
                :latte
                const v0, 0xff8839ef
                const v1, 0xffccd0da
                :apply
                invoke-virtual {p0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setProgressBackgroundColorSchemeColor(I)V
                const/4 v1, 1
                new-array p1, v1, [I
                const/4 v1, 0
                aput v0, p1, v1
                invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeColors([I)V
                return-void
                :original
                invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V
                return-void
            """)
            for (type in listOf(
                "ui/activities/WebViewActivity", "ui/comments/CommentsFragment",
                "ui/fragments/SubmissionRecyclerViewFragment", "ui/friends/ImportantUsersFragment",
                "ui/messages/fragment/ContributionListFragment", "ui/moderation/ModerationLogFragment",
                "ui/moderation/ModerationListFragment", "ui/sidebar/MultiredditFragment",
                "ui/profile/UserContributionListFragment", "ui/sidebar/TrendingFragment",
            )) {
                for (method in mutableClassDefBy("Lcom/rubenmayayo/reddit/$type;").methods) {
                    val instructions = method.implementation?.instructions?.toList() ?: continue
                    for ((index, instruction) in instructions.withIndex()) {
                        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        if (reference?.definingClass != "Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;" || reference.name != "setColorSchemeResources") continue
                        val call = instruction as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
                        method.replaceInstruction(index,
                            "invoke-static {v${call.registerC}, v${call.registerD}}, Lhe/f0;->catppuccinRefresh(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;[I)V")
                    }
                }
            }
            contrastHelper("catppuccinPattern", listOf("Landroid/widget/ImageView;"), 5, code = """
                if-eqz p0, :done
                invoke-virtual {p0}, Landroid/view/View;->getId()I
                move-result v0
                const v1, 0x7f0a0383
                if-ne v0, v1, :done
                invoke-static {}, Lid/b;->v0()Lid/b;
                move-result-object v0
                invoke-virtual {v0}, Lid/b;->D3()I
                move-result v0
                const/16 v1, 17
                if-eq v0, v1, :latte
                const/16 v1, 18
                if-ne v0, v1, :done
                const/16 v0, 20
                new-array v0, v0, [F
                fill-array-data v0, :mac_matrix
                goto :apply
                :latte
                const/16 v0, 20
                new-array v0, v0, [F
                fill-array-data v0, :latte_matrix
                :apply
                new-instance v1, Landroid/graphics/ColorMatrixColorFilter;
                invoke-direct {v1, v0}, Landroid/graphics/ColorMatrixColorFilter;-><init>([F)V
                invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V
                :done
                return-void
                :mac_matrix
                .array-data 4
                0x3d7532a3
                0x3e4dc53d
                0x3ca5c47d
                0x00000000
                0x400b4b4b
                0x3d804d1a
                0x3e575757
                0x3cad7a47
                0x00000000
                0x40387878
                0x3d944257
                0x3e78d6b5
                0x3cc8768b
                0x00000000
                0x4165a5a6
                0x00000000
                0x00000000
                0x00000000
                0x3f800000
                0x00000000
                .end array-data
                :latte_matrix
                .array-data 4
                0x3cb67908
                0x3d9921aa
                0x3bf6b949
                0x00000000
                0x4341a5a6
                0x3cb67908
                0x3d9921aa
                0x3bf6b949
                0x00000000
                0x4345a5a6
                0x3c9fa9e7
                0x3d85fd75
                0x3bd7e220
                0x00000000
                0x4350f0f1
                0x00000000
                0x00000000
                0x00000000
                0x3f800000
                0x00000000
                .end array-data
            """)
            val drawer = mutableClassDefBy("Lqa/c;").methods.single { it.name == "c" }
            val load = drawer.implementation!!.instructions.indexOfFirst {
                val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lab/c;" && ref.name == "b"
            }
            require(load >= 0)
            val loadCall = drawer.implementation!!.instructions.elementAt(load) as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
            drawer.addInstructionsWithLabels(load + 1,
                "invoke-static {v${loadCall.registerD}}, Lhe/f0;->catppuccinPattern(Landroid/widget/ImageView;)V")
        }

    }
}
