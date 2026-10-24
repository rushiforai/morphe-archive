// SPDX-License-Identifier: GPL-3.0-or-later
package app.morphe.patches.pocketcasts

import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patches.shared.fonts.readTrueType
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory

private val pocket = Compatibility(name = "Pocket Casts", packageName = "au.com.shiftyjelly.pocketcasts",
    targets = listOf(AppTarget(version = "8.23-rc-1")))
private const val ext = "Lapp/morphe/extension/pocketcasts/PocketThemes;"

private object PocketResources

private val themeResources = resourcePatch {
    compatibleWith(pocket)
    execute {
        val input = PocketResources::class.java.classLoader.getResourceAsStream("catppuccin/pocketcasts/themes.xml")!!
        val palette = input.use { DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(it) }
        document("res/values/colors.xml").use { xml ->
            val colors=palette.getElementsByTagName("color")
            for(i in 0 until colors.length) xml.documentElement.appendChild(xml.importNode(colors.item(i),true))
        }
        document("res/values/styles.xml").use { xml ->
            val styles = palette.getElementsByTagName("style")
            for (i in 0 until styles.length) xml.documentElement.appendChild(xml.importNode(styles.item(i), true))
        }
        document("res/values/attrs.xml").use { xml ->
            xml.documentElement.appendChild(xml.createElement("attr").apply {
                setAttribute("name","catppuccin_pocket_variant");setAttribute("format","integer")
            })
        }
        document("res/values/public.xml").use { xml ->
            xml.documentElement.appendChild(xml.createElement("public").apply {
                setAttribute("name","catppuccin_pocket_variant");setAttribute("type","attr");setAttribute("id","0x7f04f000")
            })
        }
        document("res/values/styles.xml").use { xml ->
            val styles=xml.getElementsByTagName("style")
            for(i in 0 until styles.length) {
                val style=styles.item(i) as Element
                val variant=when(style.getAttribute("name")) {
                    "Catppuccin.PocketCasts.Latte" -> 1
                    "Catppuccin.PocketCasts.Macchiato" -> 2
                    "Catppuccin.PocketCasts.Radioactivity" -> 3
                    else -> continue
                }
                style.appendChild(xml.createElement("item").apply { setAttribute("name","catppuccin_pocket_variant");textContent=variant.toString() })
            }
        }
        val variants = listOf("Latte", "Macchiato", "Radioactivity")
        document("res/values/strings.xml").use { xml ->
            variants.forEach { variant -> xml.documentElement.appendChild(xml.createElement("string").apply {
                setAttribute("name", "catppuccin_pocket_${variant.lowercase()}")
                textContent = if (variant == "Radioactivity") variant else "Catppuccin $variant"
            }) }
        }
        variants.forEach { variant ->
            val path="catppuccin/pocketcasts/${variant.lowercase()}.xml"
            PocketResources::class.java.classLoader.getResourceAsStream(path)!!.use { input ->
                get("res/drawable/catppuccin_pocket_${variant.lowercase()}.xml").writeBytes(input.readBytes())
            }
        }
        document("res/values/public.xml").use { xml ->
            for ((i, variant) in variants.withIndex()) {
                for ((type, name, id) in listOf(
                    Triple("style", "Catppuccin.PocketCasts.$variant", 0x7f15f000 + i),
                    Triple("drawable", "catppuccin_pocket_${variant.lowercase()}", 0x7f08f000 + i),
                    Triple("string", "catppuccin_pocket_${variant.lowercase()}", 0x7f14f000 + i))) {
                    xml.documentElement.appendChild(xml.createElement("public").apply {
                        setAttribute("type", type); setAttribute("name", name); setAttribute("id", "0x${id.toString(16)}")
                    })
                }
            }
        }
    }
}

private val notesStyles = bytecodePatch {
    extendWith("catppuccin/pocketcasts.dex")
    execute {
        val classes=mutableListOf<ClassDef>()
        classDefForEach { if(!it.type.startsWith("Lapp/morphe/extension/")) classes.add(it) }
        var hooks=0
        for(klass in classes) for(method in klass.methods) {
            val changes=method.implementation?.instructions?.mapIndexedNotNull { index,instruction ->
                val ref=(instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapIndexedNotNull null
                if(ref.definingClass!="Landroid/webkit/WebView;" || ref.name!="loadDataWithBaseURL") return@mapIndexedNotNull null
                val call=instruction as? RegisterRangeInstruction ?: error("Pocket Casts notes loading changed")
                index to call
            }.orEmpty()
            if(changes.isEmpty()) continue
            val target=mutableClassDefBy(klass).methods.single { it.name==method.name && it.parameterTypes==method.parameterTypes && it.returnType==method.returnType }
            changes.forEach { (index,call) -> target.replaceInstruction(index,
                "invoke-static/range {v${call.startRegister} .. v${call.startRegister+call.registerCount-1}}, Lapp/morphe/extension/pocketcasts/PocketSurfaces;->loadNotes(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V") }
            hooks+=changes.size
        }
        require(hooks>=2) { "Pocket Casts show notes loading changed" }
    }
}

val pocketCastsThemePatch = bytecodePatch(
    name = "Pocket Casts themes",
    description = "Adds Catppuccin Latte, Macchiato, and a restored Radioactivity palette as separate theme choices.",
    default = false,
) {
    compatibleWith(pocket)
    dependsOn(themeResources,notesStyles)
    extendWith("catppuccin/pocketcasts.dex")
    execute {
        val setting = mutableClassDefBy("Lutd;")
        val settingInit = setting.methods.single { it.name == "<clinit>" }
        val settingCode = StringBuilder()
        for ((i, name) in listOf("CATPPUCCIN_LATTE", "CATPPUCCIN_MACCHIATO", "RADIOACTIVITY").withIndex()) {
            settingCode.append("""
                new-instance v$i, Lutd;
                const-string v3, "$name"
                const-string v4, "${name.lowercase()}"
                const/16 v5, ${9+i}
                const-string v6, "${name.lowercase()}"
                invoke-direct {v$i, v3, v4, v5, v6}, Lutd;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
            """)
        }
        settingCode.append("""
            sget-object v3, Lutd;->P:[Lutd;
            invoke-static {v3, v0, v1, v2}, $ext->append(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v3
            check-cast v3, [Lutd;
            sput-object v3, Lutd;->P:[Lutd;
            new-instance v4, Lqz3;
            invoke-direct {v4, v3}, Lqz3;-><init>([Ljava/lang/Enum;)V
            sput-object v4, Lutd;->Q:Lqz3;
        """)
        settingInit.addInstructions(settingInit.implementation!!.instructions.count() - 1, settingCode.toString())

        val types = mutableClassDefBy("Lmtd;")
        val typeInit = types.methods.single { it.name == "<clinit>" }
        val code = StringBuilder()
        for ((i, name) in listOf("CATPPUCCIN_LATTE", "CATPPUCCIN_MACCHIATO", "RADIOACTIVITY").withIndex()) {
            code.append("""
                new-instance v0, Lmtd;
                const-string v1, "$name"
                const/16 v2, ${9+i}
                invoke-static {}, Lutd;->values()[Lutd;
                move-result-object v3
                const/16 v12, ${9+i}
                aget-object v3, v3, v12
                const v4, ${0x7f14f000+i}
                const v5, ${0x7f15f000+i}
                const v6, ${0x7f08f000+i}
                sget-object v7, Lv40;->G:Lo40;
                const/4 v8, ${if (i==0) 0 else 1}
                const/4 v9, ${if (i==0) 0 else 1}
                const/4 v10, ${if (i==0) 0 else 1}
                const/4 v11, 0x0
                invoke-direct/range {v0 .. v11}, Lmtd;-><init>(Ljava/lang/String;ILutd;IIILv40;ZZZZ)V
                move-object/from16 v${13+i}, v0
            """)
        }
        code.append("""
            sget-object v0, Lmtd;->X:[Lmtd;
            move-object/from16 v1, v13
            move-object/from16 v2, v14
            move-object/from16 v3, v15
            invoke-static {v0, v1, v2, v3}, $ext->append(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, [Lmtd;
            sput-object v0, Lmtd;->X:[Lmtd;
        """)
        typeInit.addInstructions(typeInit.implementation!!.instructions.count()-1, code.toString())
        val converter = mutableClassDefBy("Lb39;").methods.single {
            it.name=="g" && it.parameterTypes==listOf("Lutd;") && it.returnType=="Lmtd;"
        }
        converter.addInstructions(0, """
            invoke-static {p0}, $ext->theme(Ljava/lang/Enum;)Ljava/lang/Object;
            move-result-object p0
            check-cast p0, Lmtd;
            return-object p0
        """)
        // MaterialTheme also captures the palette separately from PocketCastsTheme.
        // Replace that local before both consumers receive it.
        val appTheme = mutableClassDefBy("Lstd;").methods.single { it.name=="a" && it.parameterTypes.firstOrNull()=="Lmtd;" }
        val create = appTheme.implementation!!.instructions.indexOfFirst {
            val ref=(it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass=="Low9;" && ref.name=="<init>"
        }
        require(create>=0) { "Pocket Casts Compose theme layout changed" }
        val call=appTheme.implementation!!.instructions.elementAt(create) as FiveRegisterInstruction
        appTheme.addInstructions(create,"""
            invoke-static {v${call.registerE}, v${call.registerD}}, $ext->palette(Ljava/lang/Object;Ljava/lang/Enum;)Ljava/lang/Object;
            move-result-object v${call.registerE}
            check-cast v${call.registerE}, Lptd;
        """)
        val compose = mutableClassDefBy("Low9;").methods.single { it.name=="<init>" }
        compose.addInstructions(0, """
            invoke-static {p2, p1}, $ext->palette(Ljava/lang/Object;Ljava/lang/Enum;)Ljava/lang/Object;
            move-result-object p2
            check-cast p2, Lptd;
        """)
        val surfaces="Lapp/morphe/extension/pocketcasts/PocketSurfaces;"
        for(type in listOf("Lfi1;","Lau/com/shiftyjelly/pocketcasts/player/view/MiniPlayer;")) {
            val holder=mutableClassDefBy(type)
            var hooks=0
            for(method in holder.methods) {
                val instructions=method.implementation?.instructions?.toList() ?: continue
                val changes=instructions.mapIndexedNotNull { index,instruction ->
                    val ref=(instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapIndexedNotNull null
                    val call=instruction as? FiveRegisterInstruction ?: return@mapIndexedNotNull null
                    val operation=when {
                        ref.name=="setBackgroundColor" && ref.parameterTypes==listOf("I") -> "surfaceColor(Landroid/view/View;I)I"
                        type=="Lfi1;" && ref.name=="setTextColor" && ref.parameterTypes==listOf("I") -> "featuredTextColor(Landroid/widget/TextView;I)I"
                        type=="Lfi1;" && ref.name=="setChipBackgroundColor" -> "featuredChipBackground(Landroid/view/View;Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;"
                        type!="Lfi1;" && ref.name in listOf("setImageTintList","setBackgroundTintList") && ref.parameterTypes==listOf("Landroid/content/res/ColorStateList;") -> "accentTint(Landroid/view/View;Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;"
                        else -> return@mapIndexedNotNull null
                    }
                    Triple(index,call,operation)
                }
                changes.reversed().forEach { (index,call,operation) ->
                    val result=if(operation.endsWith("I")) "move-result" else "move-result-object"
                    method.addInstructions(index,"invoke-static {v${call.registerC}, v${call.registerD}}, $surfaces->$operation\n$result v${call.registerD}")
                }
                hooks+=changes.size
            }
            require(hooks>=5) { "Pocket Casts artwork surface layout changed: $type ($hooks hooks)" }
        }
        var notesBackgrounds=0
        for(type in listOf("Leb8;","Lhb8;")) for(method in mutableClassDefBy(type).methods) {
            val changes=method.implementation?.instructions?.mapIndexedNotNull { index,instruction ->
                val ref=(instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapIndexedNotNull null
                if(ref.name!="setBackgroundColor" || ref.parameterTypes!=listOf("I")) return@mapIndexedNotNull null
                index to (instruction as FiveRegisterInstruction)
            }.orEmpty()
            changes.reversed().forEach { (index,call) -> method.addInstructions(index,
                "invoke-static {v${call.registerC}, v${call.registerD}}, $surfaces->notesSurfaceColor(Landroid/view/View;I)I\nmove-result v${call.registerD}") }
            notesBackgrounds+=changes.size
        }
        require(notesBackgrounds>=3) { "Pocket Casts notes backgrounds changed" }
        val notesView=mutableClassDefBy("Lhb8;").methods.single { it.name=="L" && it.returnType=="Landroid/view/View;" }
        val noteReturns=notesView.implementation!!.instructions.mapIndexedNotNull { index,instruction ->
            if(instruction.opcode==com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT)
                index to (instruction as OneRegisterInstruction).registerA else null
        }
        require(noteReturns.isNotEmpty()) { "Pocket Casts notes inflation changed" }
        noteReturns.reversed().forEach { (index,register) -> notesView.addInstructions(index,
            "invoke-static/range {v$register .. v$register}, $surfaces->notesRoot(Landroid/view/View;)Landroid/view/View;\nmove-result-object v$register") }
        val chapter=mutableClassDefBy("Lau/com/shiftyjelly/pocketcasts/player/view/ChapterProgressBar;").methods.single { it.name=="onDraw" }
        chapter.addInstructions(0,"invoke-static/range {p0 .. p0}, $surfaces->chapterProgress(Landroid/view/View;)V")
        val player=mutableClassDefBy("Lfh9;").methods.single { it.name=="<init>" }
        val returns=player.implementation!!.instructions.mapIndexedNotNull { i,instruction ->
            if(instruction.opcode==com.android.tools.smali.dexlib2.Opcode.RETURN_VOID) i else null
        }
        require(returns.size==1) { "Pocket Casts player constructor changed" }
        player.addInstructions(returns.single(),"invoke-static/range {p0 .. p0}, $surfaces->player(Ljava/lang/Object;)V")
        val classes = mutableListOf<ClassDef>()
        classDefForEach { if (!it.type.startsWith("Lapp/morphe/extension/") && it.type!="Lqz3;") classes.add(it) }
        var switches=0
        for (klass in classes) for (method in klass.methods) {
            val instructions=method.implementation?.instructions?.toList() ?: continue
            val changes=instructions.mapIndexedNotNull { index, instruction ->
                val ref=(instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapIndexedNotNull null
                if (ref.definingClass!="Ljava/lang/Enum;" || ref.name!="ordinal") return@mapIndexedNotNull null
                val invoke=when(instruction) {
                    is FiveRegisterInstruction -> "invoke-static {v${instruction.registerC}}"
                    is RegisterRangeInstruction -> "invoke-static/range {v${instruction.startRegister} .. v${instruction.startRegister}}"
                    else -> error("Unexpected theme dispatch instruction")
                }
                index to invoke
            }
            if (changes.isEmpty()) continue
            val target=mutableClassDefBy(klass).methods.single { it.name==method.name && it.parameterTypes==method.parameterTypes && it.returnType==method.returnType }
            changes.forEach { (index, invoke) -> target.replaceInstruction(index,"$invoke, $ext->ordinal(Ljava/lang/Enum;)I") }
            switches+=changes.size
        }
        println("Pocket Casts: added three theme identities and adapted $switches enum dispatches")
    }
}


val pocketCastsCustomFontPatch = bytecodePatch(
    name = "Pocket Casts custom font",
    description = "Embeds your TTF as the interface font, including Compose. Repatch to change or remove it.",
    default = false,
) {
    compatibleWith(pocket)
    dependsOn(notesStyles)
    extendWith("catppuccin/pocketcasts.dex")
    val fontFile = filePathOption(key="font-file", default=null, title="Custom TTF font",
        description="Choose a TTF for Pocket Casts.", required=true, allowedExtensions=listOf("ttf"))
    dependsOn(resourcePatch { execute {
        val bytes=readTrueType(requireNotNull(fontFile.value) { "Choose a TTF font." })
        get("assets/catppuccin/pocketcasts-custom.ttf").apply { parentFile.mkdirs(); writeBytes(bytes) }
        get("res/font/catppuccin_pocket_font.ttf").apply { parentFile.mkdirs(); writeBytes(bytes) }
        for (file in get("res/font").listFiles().orEmpty()) {
            if (file.extension=="ttf") file.writeBytes(bytes)
        }
        document("res/values/styles.xml").use { xml ->
            val items=xml.getElementsByTagName("item")
            for (i in 0 until items.length) {
                val item=items.item(i) as Element
                if (item.getAttribute("name") in listOf("android:fontFamily","fontFamily"))
                    item.textContent="@font/catppuccin_pocket_font"
            }
        }
    } })
    execute {
        val ext="Lapp/morphe/extension/pocketcasts/PocketFont;"
        mutableClassDefBy("Lau/com/shiftyjelly/pocketcasts/PocketCastsApplication;").methods.single { it.name=="onCreate" }
            .addInstructions(0,"invoke-static/range {p0 .. p0}, $ext->install(Landroid/app/Application;)V")
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
        require(calls > 0) { "Pocket Casts font resolver changed" }
        println("Pocket Casts: hooked $calls font resolver calls")
    }
}
