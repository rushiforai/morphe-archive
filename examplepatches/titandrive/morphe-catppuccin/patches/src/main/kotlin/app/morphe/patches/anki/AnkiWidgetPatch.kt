// SPDX-License-Identifier: GPL-3.0-or-later
package app.morphe.patches.anki

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private object AnkiWidgetAssets
private const val WIDGET_EXT="Lapp/morphe/extension/anki/WidgetTheme;"

internal fun ResourcePatchContext.applyWidgetResources() {
    val font=get("res/font/catppuccin_widget_jetbrains.ttf")
    font.parentFile.mkdirs()
    AnkiWidgetAssets::class.java.classLoader!!.getResourceAsStream("catppuccin/anki/JetBrainsMono-Regular.ttf")!!.use { font.writeBytes(it.readBytes()) }
    val widgetLayouts=setOf("widget_card_analysis.xml","widget_deck_picker_large.xml","widget_item_deck_main.xml","widget_small.xml","widget_small_unthemed.xml","widget_add_note.xml")
    var labels=0
    for(directory in get("res").listFiles().orEmpty()) {
        if(!directory.name.startsWith("layout"))continue
        for(layout in directory.listFiles().orEmpty()) {
            if(layout.name !in widgetLayouts)continue
            document("res/${directory.name}/${layout.name}").use { xml ->
                val nodes=xml.getElementsByTagName("TextView")
                val text=(0 until nodes.length).map { nodes.item(it) as Element }
                for(label in text) {
                    label.setAttribute("android:fontFamily","@font/catppuccin_widget_jetbrains")
                    val id=label.getAttribute("android:id").substringAfter('/')
                    val wrapper=xml.createElement("FrameLayout")
                    val attributes=label.attributes
                    val moved=(0 until attributes.length).map { attributes.item(it).nodeName }.filter { it.startsWith("android:layout_") }
                    for(name in moved) { wrapper.setAttribute(name,label.getAttribute(name));label.removeAttribute(name) }
                    label.setAttribute("android:layout_width","match_parent")
                    label.setAttribute("android:layout_height","wrap_content")
                    val parent=label.parentNode
                    parent.replaceChild(wrapper,label);wrapper.appendChild(label)
                    wrapper.appendChild(xml.createElement("ImageView").apply {
                        setAttribute("android:id","@+id/catppuccin_widget_text_$id")
                        setAttribute("android:layout_width","match_parent")
                        setAttribute("android:layout_height","match_parent")
                        setAttribute("android:scaleType","centerInside")
                        setAttribute("android:importantForAccessibility","no")
                        setAttribute("android:clickable","false")
                        for(padding in listOf("padding","paddingLeft","paddingRight","paddingTop","paddingBottom","paddingStart","paddingEnd","paddingHorizontal","paddingVertical")) {
                            if(label.hasAttribute("android:$padding"))setAttribute("android:$padding",label.getAttribute("android:$padding"))
                        }
                    })
                    labels++
                }
            }
        }
    }
    require(labels>=10) { "AnkiDroid widget text layouts changed" }
    for((flavor,color) in listOf("latte" to "eff1f5","macchiato" to "24273a")) {
        for(opacity in 0..100 step 10) {
            val alpha="%02x".format((opacity*255+50)/100)
            get("res/drawable/catppuccin_widget_${flavor}_$opacity.xml").apply {
                parentFile.mkdirs()
                writeText("""<shape xmlns:android="http://schemas.android.com/apk/res/android" android:shape="rectangle"><corners android:radius="28dp"/><solid android:color="#$alpha$color"/></shape>""")
            }
        }
    }
    document("res/xml/preferences_appearance.xml").use { xml ->
        val category=xml.createElement("PreferenceCategory").apply { setAttribute("android:title","Widgets") }
        val preference=xml.createElement("Preference").apply {
            setAttribute("android:key","catppuccin_widget_settings")
            setAttribute("android:title","Widget appearance")
            setAttribute("android:summary","Catppuccin colors, JetBrains Mono, and background opacity")
        }
        preference.appendChild(xml.createElement("intent").apply {
            setAttribute("android:targetPackage","com.ichi2.anki")
            setAttribute("android:targetClass","app.morphe.extension.anki.WidgetSettingsActivity")
        })
        category.appendChild(preference)
        val elements=(0 until xml.documentElement.childNodes.length).mapNotNull { xml.documentElement.childNodes.item(it) as? Element }
        xml.documentElement.insertBefore(category,elements.getOrNull(2))
    }
    document("AndroidManifest.xml").use { xml ->
        xml.getElementsByTagName("application").item(0).appendChild(xml.createElement("activity").apply {
            setAttribute("android:name","app.morphe.extension.anki.WidgetSettingsActivity")
            setAttribute("android:exported","false")
            setAttribute("android:label","Widget appearance")
        })
    }
}

internal fun BytecodePatchContext.applyWidgetHooks() {
    val classes=mutableListOf<ClassDef>()
    classDefForEach { if(!it.type.startsWith("Lapp/morphe/extension/"))classes.add(it) }
    var updates=0
    var children=0
    for(klass in classes)for(method in klass.methods) {
        val instructions=method.implementation?.instructions?.toList() ?: continue
        val changes=instructions.mapIndexedNotNull { index,instruction ->
            val ref=(instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapIndexedNotNull null
            val signature=ref.parameterTypes.joinToString("")
            val owner=when {
                ref.definingClass=="Landroid/appwidget/AppWidgetManager;" && ref.name in listOf("updateAppWidget","partiallyUpdateAppWidget") &&
                    signature in listOf("ILandroid/widget/RemoteViews;","[ILandroid/widget/RemoteViews;","Landroid/content/ComponentName;Landroid/widget/RemoteViews;") -> {
                    updates++;"Landroid/appwidget/AppWidgetManager;"
                }
                ref.definingClass=="Landroid/widget/RemoteViews;" && ref.name=="setTextViewText" && signature=="ILjava/lang/CharSequence;" -> "Landroid/widget/RemoteViews;"
                ref.definingClass=="Landroid/widget/RemoteViews;" && ref.name=="setTextViewTextSize" && signature=="IIF" -> "Landroid/widget/RemoteViews;"
                ref.definingClass=="Landroid/widget/RemoteViews;" && ref.name in listOf("addView","addStableView") &&
                    signature in listOf("ILandroid/widget/RemoteViews;","ILandroid/widget/RemoteViews;I") -> {
                    children++;"Landroid/widget/RemoteViews;"
                }
                else -> return@mapIndexedNotNull null
            }
            val registers=when(instruction) {
                is RegisterRangeInstruction -> "invoke-static/range {v${instruction.startRegister} .. v${instruction.startRegister+instruction.registerCount-1}}"
                is FiveRegisterInstruction -> "invoke-static {"+listOf(instruction.registerC,instruction.registerD,instruction.registerE,instruction.registerF,instruction.registerG).take(instruction.registerCount).joinToString(", "){"v$it"}+"}"
                else -> error("Unsupported widget invocation")
            }
            index to "$registers, $WIDGET_EXT->${ref.name}($owner$signature)V"
        }
        if(changes.isEmpty())continue
        val mutable=mutableClassDefBy(klass).methods.single { it.name==method.name && it.parameterTypes==method.parameterTypes && it.returnType==method.returnType }
        for((index,code)in changes)mutable.replaceInstruction(index,code)
    }
    require(updates>=3 && children>=1) { "AnkiDroid widget update paths changed: $updates updates, $children rows" }
    println("AnkiDroid widgets: hooked $updates updates and $children nested rows")
}
