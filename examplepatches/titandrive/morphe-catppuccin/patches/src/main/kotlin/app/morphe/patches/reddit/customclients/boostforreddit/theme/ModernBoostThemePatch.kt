// SPDX-License-Identifier: GPL-3.0-or-later
package app.morphe.patches.reddit.customclients.boostforreddit.theme

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory

private object ModernBoostResources
private const val modernExt = "Lapp/morphe/extension/boost/BoostTheme;"

internal fun ResourcePatchContext.applyModernBoostResources() {
    fun template(name: String) = ModernBoostResources::class.java.classLoader
        .getResourceAsStream("catppuccin/$name")!!.use {
            DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(it)
        }
    // Keep native 1.14 resources intact: old restore.xml belongs only to 1.12.12.
    for ((path, source) in listOf("res/values/colors.xml" to template("palette.xml"),
        "res/values/styles.xml" to template("styles.xml"))) {
        document(path).use { xml ->
            val nodes = source.documentElement.childNodes
            val original = xml.documentElement.childNodes
            val names = (0 until original.length).mapNotNull {
                (original.item(it) as? Element)?.getAttribute("name")
            }.toMutableSet()
            for (i in 0 until nodes.length) {
                val node = nodes.item(i) as? Element ?: continue
                require(names.add(node.getAttribute("name"))) { "Use an original Boost APK; Catppuccin resources already exist." }
                if (node.tagName=="style") {
                    val name=node.getAttribute("name")
                    if(name=="Catppuccin.Latte" || name=="Catppuccin.Macchiato") {
                        val flavor=if(name.endsWith("Latte")) "latte" else "macchiato"
                        for(attr in listOf("colorSurfaceContainer", "colorSurfaceContainerLow", "colorSurfaceContainerHigh")) {
                            node.appendChild(source.createElement("item").apply {
                                setAttribute("name",attr);textContent="@color/catppuccin_${flavor}_mantle"
                            })
                        }
                    }
                    if(name.startsWith("Catppuccin.") && (name.endsWith(".Card") || name.endsWith(".FullCard") || name.endsWith(".MiniCard"))) {
                        val items=node.getElementsByTagName("item")
                        for(j in 0 until items.length) {
                            val item=items.item(j) as Element
                            if(item.getAttribute("name")=="strokeWidth") item.textContent="0dp"
                        }
                    }
                }
                xml.documentElement.appendChild(xml.importNode(node,true))
            }
        }
    }
    document("res/values/strings.xml").use { xml ->
        for (flavor in listOf("Latte", "Macchiato")) xml.documentElement.appendChild(xml.createElement("string").apply {
            setAttribute("name", "catppuccin_theme_${flavor.lowercase()}"); textContent="Catppuccin $flavor"
        })
    }
    document("res/values/public.xml").use { xml ->
        for ((type,name,id) in listOf(
            Triple("style","Catppuccin.Latte",0x7f141000), Triple("style","Catppuccin.Macchiato",0x7f141001),
            Triple("style","Catppuccin.Latte.Toolbar",0x7f141003), Triple("style","Catppuccin.Macchiato.Toolbar",0x7f141006),
            Triple("string","catppuccin_theme_latte",0x7f131000), Triple("string","catppuccin_theme_macchiato",0x7f131001))) {
            val value="0x${id.toString(16)}"
            val nodes=xml.documentElement.childNodes
            require((0 until nodes.length).none { (nodes.item(it) as? Element)?.getAttribute("id")==value }) {
                "Reserved Catppuccin resource ID is already in use: $value"
            }
            xml.documentElement.appendChild(xml.createElement("public").apply {
                setAttribute("type",type);setAttribute("name",name);setAttribute("id",value)
            })
        }
    }
    document("res/values/arrays.xml").use { xml ->
        val arrays=xml.documentElement.childNodes
        for (i in 0 until arrays.length) {
            val array=arrays.item(i) as? Element ?: continue
            if (!array.getAttribute("name").startsWith("pref_theme_values")) continue
            for (id in listOf("17","18")) array.appendChild(xml.createElement("item").apply { textContent=id })
        }
    }
}

internal fun BytecodePatchContext.applyModernBoostTheme() {
    val latest = packageMetadata.versionName == "1.14.3"
    val themeUtils = if (latest) "Ln83;" else "Lk83;"
    val downloadActivity = if (latest) "Lai0;" else "Ldi0;"
    val drawerActivity = if (latest) "Luj0;" else "Lxj0;"
    val viewUtils = if (latest) "Lkk3;" else "Ljk3;"
    // Use URL-specific visited styling instead of coloring every link as an accent.
    mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/customviews/LinkTextView;")
        .methods.single { it.name=="setText" }.addInstructions(0,"""
            invoke-static/range {p0 .. p1}, $modernExt->links(Landroid/widget/TextView;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
            move-result-object p1
        """)
    val linkListener=mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/customviews/c;")
        .methods.single { it.name=="a" }
    val openLink=linkListener.implementation!!.instructions.indexOfFirst { it.opcode==Opcode.INVOKE_STATIC }
    require(openLink>=0) { "Boost link click handler changed" }
    linkListener.addInstructions(openLink,"invoke-static/range {p0 .. p1}, $modernExt->visitLink(Landroid/content/Context;Ljava/lang/String;)V")
    mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/activities/ThemeActivity;")
        .methods.single { it.name=="d1" && it.parameterTypes==listOf("I") }
        .addInstructions(0,"invoke-static/range {p0 .. p1}, $modernExt->selectTheme(Landroid/app/Activity;I)V")
    val utils=mutableClassDefBy(themeUtils)
    val init=utils.methods.single { it.name=="<clinit>" }
    val code=StringBuilder()
    for ((field,type,values) in listOf(
        Triple("b","I",listOf("17","18")), Triple("c","I",listOf("0x7f141000","0x7f141001")),
        Triple("e","I",listOf("0x7f131000","0x7f131001")),
        Triple("d","Ljava/lang/String;",listOf("Catppuccin.Latte","Catppuccin.Macchiato")))) {
        val copy=if(type=="I") "I" else "Ljava/lang/Object;"
        code.append("sget-object v0, $themeUtils->$field:[$type\nconst/16 v1, 19\ninvoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([${copy}I)[$copy\nmove-result-object v0\ncheck-cast v0, [$type\n")
        values.forEachIndexed { i,value ->
            code.append("const/16 v1, ${17+i}\n")
            code.append(if(type=="I") "const v2, $value\naput v2, v0, v1\n" else "const-string v2, \"$value\"\naput-object v2, v0, v1\n")
        }
        code.append("sput-object v0, $themeUtils->$field:[$type\n")
    }
    init.addInstructions(init.implementation!!.instructions.indexOfFirst { it.opcode==Opcode.RETURN_VOID },code.toString())
    val select=mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/activities/a;").methods.single { it.name=="setCurrentTheme" }
    val limits=select.implementation!!.instructions.mapIndexedNotNull { i,ins ->
        if(ins.opcode==Opcode.CONST_16 && (ins as NarrowLiteralInstruction).narrowLiteral==17)
            i to (ins as OneRegisterInstruction).registerA else null
    }
    require(limits.size==1) { "Boost theme-selection loop changed" }
    for((i,reg) in limits) select.replaceInstruction(i,"const/16 v$reg, 19")
    mutableClassDefBy(modernExt).methods.single { it.name=="mode" }.addInstructions(0,"""
        invoke-static {}, Lps2;->n()Lps2;
        move-result-object v0
        invoke-virtual {v0}, Lps2;->R()I
        move-result v0
        return v0
    """)
    fun hook(type: String, name: String, helper: String, boolean: Boolean=false) {
        val method=mutableClassDefBy(type).methods.single { it.name==name }
        val returns=method.implementation!!.instructions.mapIndexedNotNull { i, ins ->
            if(ins.opcode==Opcode.RETURN) i to (ins as OneRegisterInstruction).registerA else null
        }
        require(returns.isNotEmpty()) { "Boost 1.14.2 method changed: $type->$name" }
        val valueType=if(boolean) "Z" else "I"
        for ((index,reg) in returns.reversed()) {
            method.replaceInstruction(index,"invoke-static/range {v$reg .. v$reg}, $modernExt->$helper($valueType)$valueType")
            method.addInstructions(index+1,"move-result v$reg\nreturn v$reg")
        }
    }
    for ((name,helper) in mapOf("c" to "accent","d" to "text","e" to "text","f" to "link",
        "g" to "header","h" to "header","i" to "secondary","j" to "sticky","k" to "secondary",
        "l" to "title","n" to "secondary","o" to "text","p" to "secondary")) hook(themeUtils,name,helper)
    hook(themeUtils,"t","material",true);hook(themeUtils,"s","dynamic",true);hook(themeUtils,"r","amoled",true)
    hook("Lps2;","V","toolbarMode")
    val index=utils.methods.single { it.name=="q" }
    val indexLimits=index.implementation!!.instructions.mapIndexedNotNull { i,ins ->
        if(ins.opcode==Opcode.CONST_16 && (ins as NarrowLiteralInstruction).narrowLiteral==17)
            i to (ins as OneRegisterInstruction).registerA else null
    }
    require(indexLimits.size==1) { "Boost theme-index loop changed" }
    for((i,reg) in indexLimits) index.replaceInstruction(i,"const/16 v$reg, 19")
    // Tint the new native Reply send icon; use the Menu parameter instead of a
    // resource ID from an older Boost release.
    val menu=mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/compose/FormatActivity;").methods.single { it.name=="onCreateOptionsMenu" }
    val menuReturns=menu.implementation!!.instructions.mapIndexedNotNull { i,ins -> if(ins.opcode==Opcode.RETURN) i else null }
    for (i in menuReturns.reversed()) {
        val reg=(menu.implementation!!.instructions[i] as OneRegisterInstruction).registerA
        menu.replaceInstruction(i,"invoke-static {p1}, $modernExt->tintMenu(Landroid/view/Menu;)V")
        menu.addInstructions(i+1,"return v$reg")
    }
    // Run after native media setup; the newer app reapplies AMOLED themes in
    // several base classes and inflates each gallery page separately.
    for(type in listOf(downloadActivity, "Lgq1;",
        "Lcom/rubenmayayo/reddit/ui/activities/ImageActivity;",
        "Lcom/rubenmayayo/reddit/ui/activities/ImageActivity2;",
        "Lcom/rubenmayayo/reddit/ui/activities/MediaImageActivity;",
        "Lcom/rubenmayayo/reddit/ui/activities/MediaVideoActivity;",
        "Lcom/rubenmayayo/reddit/ui/activities/HDImageActivity;",
        "Lcom/rubenmayayo/reddit/ui/activities/GalleryActivity;",
        "Lcom/rubenmayayo/reddit/ui/activities/GalleryGridActivity;",
        "Lcom/rubenmayayo/reddit/ui/activities/GifActivity;",
        "Lcom/rubenmayayo/reddit/ui/activities/ExoActivity;")) {
        val media=mutableClassDefBy(type).methods.single { it.name=="onCreate" }
        val instructions=media.implementation!!.instructions.toList()
        val receiver=media.implementation!!.registerCount-2
        val clobber=instructions.indexOfFirst {
            it.opcode.setsRegister() && it.opcode!=Opcode.CHECK_CAST &&
                (it as? OneRegisterInstruction)?.registerA==receiver
        }
        val call="invoke-static/range {p0 .. p0}, $modernExt->media(Landroid/app/Activity;)V"
        if(clobber>=0) {
            // A move-result must remain immediately after its native invoke.
            val site=if(instructions[clobber].opcode in listOf(Opcode.MOVE_RESULT,Opcode.MOVE_RESULT_OBJECT,Opcode.MOVE_RESULT_WIDE)) clobber-1 else clobber
            val original=instructions[site]
            media.replaceInstruction(site,call)
            media.addInstruction(site+1,original)
        } else {
            val sites=instructions.mapIndexedNotNull { i,ins -> if(ins.opcode==Opcode.RETURN_VOID)i else null }
            for(i in sites.reversed()) {
                media.replaceInstruction(i,call)
                media.addInstructions(i+1,"return-void")
            }
        }
    }
    val fragment=mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/fragments/imagemodel/ImageModelFragment;")
        .methods.single { it.name=="onCreateView" }
    val roots=fragment.implementation!!.instructions.mapIndexedNotNull { i,ins ->
        if(ins.opcode==Opcode.RETURN_OBJECT) i to (ins as OneRegisterInstruction).registerA else null
    }
    for((i,reg) in roots.reversed()) {
        fragment.replaceInstruction(i,"invoke-static/range {v$reg .. v$reg}, $modernExt->mediaView(Landroid/view/View;)Landroid/view/View;")
        fragment.addInstructions(i+1,"move-result-object v$reg\nreturn-object v$reg")
    }
    val extension=mutableClassDefBy(modernExt)
    fun helper(name:String, params:List<String>, registers:Int, code:String) {
        extension.directMethods.add(ImmutableMethod(modernExt,name,
            params.map { ImmutableMethodParameter(it, emptySet(),null) },"V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,null,null,
            MutableMethodImplementation(registers)).toMutable().apply { addInstructionsWithLabels(0,code) })
    }
    fun endHook(type:String,name:String,call:String) {
        val method=mutableClassDefBy(type).methods.single { it.name==name }
        val sites=method.implementation!!.instructions.mapIndexedNotNull { i,ins -> if(ins.opcode==Opcode.RETURN_VOID)i else null }
        require(sites.isNotEmpty()) { "Missing return: $type->$name" }
        for(i in sites.reversed()) {method.replaceInstruction(i,call);method.addInstructions(i+1,"return-void")}
    }
    // Plain-line indentation builds its own gray array instead of using the
    // preference palette. Apply the Catppuccin palette at bind time in all modes.
    helper("indent",listOf("Lcom/rubenmayayo/reddit/ui/customviews/IndentView;"),2,"""
        iget-object v0,p0,Lcom/rubenmayayo/reddit/ui/customviews/IndentView;->b:[I
        invoke-static {v0}, $modernExt->depth([I)[I
        move-result-object v0
        iput-object v0,p0,Lcom/rubenmayayo/reddit/ui/customviews/IndentView;->b:[I
        return-void
    """)
    mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/customviews/IndentView;")
        .methods.single { it.name=="setIndentLevel" }.addInstructions(0,
            "invoke-static/range {p0 .. p0}, $modernExt->indent(Lcom/rubenmayayo/reddit/ui/customviews/IndentView;)V")
    val indentConstructor=mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/customviews/IndentView;")
        .methods.single { it.name=="<init>" }
    val indentInstructions=indentConstructor.implementation!!.instructions.toList()
    for(i in indentInstructions.indices.reversed()) {
        val ins=indentInstructions[i]
        val field=(ins as? ReferenceInstruction)?.reference as? FieldReference ?: continue
        if(ins.opcode!=Opcode.IPUT || field.name!="c" || field.definingClass!="Lcom/rubenmayayo/reddit/ui/customviews/IndentView;") continue
        val registers=ins as TwoRegisterInstruction
        indentConstructor.replaceInstruction(i,"invoke-static {v${registers.registerB},v${registers.registerA}}, $modernExt->indentWidth(Landroid/view/View;I)I")
        indentConstructor.addInstructions(i+1,"move-result v${registers.registerA}")
        indentConstructor.addInstruction(i+2,ins)
    }
    mutableClassDefBy("Lcom/google/android/material/divider/MaterialDivider;")
        .methods.single { it.name=="setDividerColor" }.addInstructions(0,"""
            invoke-static/range {p0 .. p1}, $modernExt->divider(Landroid/view/View;I)I
            move-result p1
        """)
    val depth=mutableClassDefBy("Lps2;").methods.single { it.name=="D" }
    val depthReturns=depth.implementation!!.instructions.mapIndexedNotNull { i,ins ->
        if(ins.opcode==Opcode.RETURN_OBJECT)i to (ins as OneRegisterInstruction).registerA else null
    }
    for((i,r) in depthReturns.reversed()) {
        depth.replaceInstruction(i,"invoke-static/range {v$r .. v$r}, $modernExt->depth([I)[I")
        depth.addInstructions(i+1,"move-result-object v$r\nreturn-object v$r")
    }
    helper("usernameText",listOf("Landroid/widget/TextView;","I"),3,"""
        invoke-static {p1}, $modernExt->badgeText(I)I
        move-result p1
        invoke-virtual {p0,p1}, Landroid/widget/TextView;->setTextColor(I)V
        return-void
    """)
    for(role in 0..4) helper("username$role",listOf("Landroid/widget/TextView;","Landroid/graphics/drawable/Drawable;"),3,"""
        const/4 v0, $role
        invoke-static {p0,p1,v0}, $modernExt->username(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;I)V
        return-void
    """)
    val author=mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;").methods.single { it.name=="w" }
    val authorCode=author.implementation!!.instructions.toList()
    for(i in authorCode.indices.reversed()) {
        val ref=(authorCode[i] as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        val call=authorCode[i] as? FiveRegisterInstruction ?: continue
        if(ref.name=="setTextColor") author.replaceInstruction(i,"invoke-static {v${call.registerC},v${call.registerD}}, $modernExt->usernameText(Landroid/widget/TextView;I)V")
        if(ref.name=="setBackground") {
            val field=(authorCode[i-1] as? ReferenceInstruction)?.reference as? FieldReference
            val role=listOf("Y","X","Z","a0","b0").indexOf(field?.name)
            require(role>=0) { "Unknown Boost author badge: $field" }
            author.replaceInstruction(i,"invoke-static {v${call.registerC},v${call.registerD}}, $modernExt->username$role(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V")
        }
    }
    endHook("Lcom/rubenmayayo/reddit/models/reddit/RichFlairView;","c","invoke-static/range {p0 .. p0}, $modernExt->flair(Landroid/view/View;)V")
    val panelMethod = if(latest) "O" else "M"
    require(mutableClassDefBy(viewUtils).methods.single { it.name==panelMethod }.parameterTypes ==
        listOf("Landroid/content/Context;", "Landroid/view/View;")) { "Boost text-post panel signature changed" }
    endHook(viewUtils,panelMethod,"invoke-static/range {p1 .. p1}, $modernExt->postPanel(Landroid/view/View;)V")
    val postConstructor=mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;")
        .methods.single { it.name=="<init>" }
    val postBind=postConstructor.implementation!!.instructions.indexOfFirst {
        val ref=(it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass=="Lbutterknife/ButterKnife;" && ref.name=="bind"
    }
    require(postBind>=0)
    postConstructor.addInstructions(postBind+1,"invoke-static/range {p1 .. p1}, $modernExt->postCard(Landroid/view/View;)V")

    helper("follow",listOf("Lcom/google/android/material/chip/Chip;"),5,"""
        invoke-static {}, $modernExt->mode()I
        move-result v0
        const/16 v1,17
        if-eq v0,v1,:apply
        const/16 v1,18
        if-ne v0,v1,:done
        :apply
        const/4 v0,0
        invoke-static {v0}, $modernExt->accent(I)I
        move-result v0
        invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
        move-result-object v0
        invoke-virtual {p0,v0}, Lcom/google/android/material/chip/Chip;->setChipBackgroundColor(Landroid/content/res/ColorStateList;)V
        invoke-virtual {p0,v0}, Lcom/google/android/material/chip/Chip;->setChipStrokeColor(Landroid/content/res/ColorStateList;)V
        const/4 v0,-1
        invoke-static {v0}, $modernExt->badgeText(I)I
        move-result v0
        invoke-virtual {p0,v0}, Landroid/widget/TextView;->setTextColor(I)V
        invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
        move-result-object v0
        invoke-virtual {p0,v0}, Lcom/google/android/material/chip/Chip;->setChipIconTint(Landroid/content/res/ColorStateList;)V
        :done
        return-void
    """)
    for(name in listOf("<init>","setColor","setSubscribed","i"))
        endHook("Lcom/rubenmayayo/reddit/ui/customviews/SubscribeChip;",name,"invoke-static/range {p0 .. p0}, $modernExt->follow(Lcom/google/android/material/chip/Chip;)V")
    helper("refresh",listOf("Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;","[I"),6,"""
        invoke-static {}, $modernExt->mode()I
        move-result v0
        const/16 v1,17
        if-eq v0,v1,:latte
        const/16 v1,18
        if-ne v0,v1,:original
        const v0,0xffc6a0f6
        const v1,0xff363a4f
        goto :apply
        :latte
        const v0,0xff8839ef
        const v1,0xffccd0da
        :apply
        invoke-virtual {p0,v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setProgressBackgroundColorSchemeColor(I)V
        const/4 v1,1
        new-array v1,v1,[I
        const/4 v2,0
        aput v0,v1,v2
        invoke-virtual {p0,v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeColors([I)V
        return-void
        :original
        invoke-virtual {p0,p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V
        return-void
    """)
    for(type in listOf("ui/activities/WebViewActivity", "ui/comments/CommentsFragment",
        "ui/fragments/SubmissionRecyclerViewFragment", "ui/friends/ImportantUsersFragment",
        "ui/messages/fragment/ContributionListFragment", "ui/moderation/ModerationLogFragment",
        "ui/moderation/ModerationListFragment", "ui/sidebar/MultiredditFragment",
        "ui/profile/UserContributionListFragment", "ui/sidebar/TrendingFragment")) {
        for(method in mutableClassDefBy("Lcom/rubenmayayo/reddit/$type;").methods) {
            val instructions=method.implementation?.instructions?.toList() ?: continue
            for((i,ins) in instructions.withIndex()) {
                val ref=(ins as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                if(ref.definingClass!="Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;" || ref.name!="setColorSchemeResources")continue
                val call=ins as FiveRegisterInstruction
                method.replaceInstruction(i,"invoke-static {v${call.registerC},v${call.registerD}}, $modernExt->refresh(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;[I)V")
            }
        }
    }
    // Tint only the account-header pattern, leaving avatars and downloaded images intact.
    val drawer=mutableClassDefBy(drawerActivity)
    var patternHooks=0
    for(method in drawer.methods) {
        val instructions=method.implementation?.instructions?.toList() ?: continue
        for(i in instructions.indices.reversed()) {
            val ref=(instructions[i] as? ReferenceInstruction)?.reference as? MethodReference ?: continue
            if(ref.definingClass!=(if(latest) "Lha1;" else "Lia1;") || ref.name!="b")continue
            val call=instructions[i] as FiveRegisterInstruction
            method.addInstructions(i+1,"invoke-static {v${call.registerD}}, $modernExt->pattern(Landroid/widget/ImageView;)V")
            patternHooks++
        }
    }
    require(patternHooks==1) { "Boost account pattern loader changed: $patternHooks" }
    // Gallery pages are created lazily, including pages beyond the first image.
    val pager=mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/customviews/GalleryPagerView\$d;")
        .methods.single { it.name=="f" }
    val pageInstructions=pager.implementation!!.instructions.toList()
    val inflate=pageInstructions.indexOfFirst {
        val ref=(it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass=="Landroid/view/LayoutInflater;" && ref.name=="inflate"
    }
    require(inflate>=0)
    val pageReg=(pageInstructions[inflate+1] as OneRegisterInstruction).registerA
    pager.addInstructions(inflate+2,"invoke-static/range {v$pageReg .. v$pageReg}, $modernExt->mediaView(Landroid/view/View;)Landroid/view/View;")
    for(name in listOf("ImageActivity","ImageActivity2","MediaImageActivity","GalleryActivity","GalleryGridActivity","GifActivity","ExoActivity")) {
        val method=mutableClassDefBy("Lcom/rubenmayayo/reddit/ui/activities/$name;").methods.single { it.name=="onCreateOptionsMenu" }
        val instructions=method.implementation!!.instructions.toList()
        val menuRegister=method.implementation!!.registerCount-1
        val clobber=instructions.indexOfFirst {
            it.opcode.setsRegister() && it.opcode!=Opcode.CHECK_CAST &&
                (it as? OneRegisterInstruction)?.registerA==menuRegister
        }
        val call="invoke-static/range {p1 .. p1}, $modernExt->tintMenu(Landroid/view/Menu;)V"
        if(clobber>=0) {
            val site=if(instructions[clobber].opcode in listOf(Opcode.MOVE_RESULT,Opcode.MOVE_RESULT_OBJECT,Opcode.MOVE_RESULT_WIDE))clobber-1 else clobber
            val original=instructions[site]
            method.replaceInstruction(site,call);method.addInstruction(site+1,original)
        } else {
            val sites=instructions.mapIndexedNotNull { i,ins -> if(ins.opcode==Opcode.RETURN)i to (ins as OneRegisterInstruction).registerA else null }
            for((i,r) in sites.reversed()) {
                method.replaceInstruction(i,call);method.addInstructions(i+1,"return v$r")
            }
        }
    }

}
