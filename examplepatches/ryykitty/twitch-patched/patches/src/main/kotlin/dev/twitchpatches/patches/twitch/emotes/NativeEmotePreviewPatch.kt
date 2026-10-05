package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import dev.twitchpatches.patches.twitch.shared.*
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val PREVIEW = "Ldev/twitchpatches/extension/emotes/NativeEmotePreview;"
private var nativePreviewIds = emptyList<Int>()

internal fun validateNativeEmoteHeader(document: Document) {
    val nodes = document.getElementsByTagName("*")
    val elements = (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
    fun element(name: String): Element = elements.filter { it.getAttribute("android:id") == "@id/$name" }
        .uniqueHook("native emote preview $name")
    val content = element("emote_card_loaded_content")
    if (content.tagName != "androidx.constraintlayout.widget.ConstraintLayout" ||
        element("emote_icon").tagName != "tv.twitch.android.shared.ui.elements.image.SquareNetworkImageWidget" ||
        listOf("emote_name", "emote_desc").any { element(it).tagName != "TextView" } ||
        listOf("emote_icon", "emote_name", "emote_desc").any { element(it).parentNode != content } ||
        content.parentNode.nodeName != "FrameLayout")
        throw PatchException("Emotes: native preview header hierarchy changed.")
}

private val nativeEmoteResources = resourcePatch {
    execute {
        val public = parseResourceXml(get("res/values/public.xml").readText())
        val nodes = public.getElementsByTagName("public")
        val symbols = (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
        nativePreviewIds = listOf("layout" to "emote_card_dialog", "id" to "emote_card_loaded_content",
            "id" to "emote_icon", "id" to "emote_name", "id" to "emote_desc", "dimen" to "default_margin").map { (type, name) ->
            symbols.filter { it.getAttribute("type") == type && it.getAttribute("name") == name }
                .uniqueHook("native emote $type/$name").getAttribute("id").removePrefix("0x").toLong(16).toInt()
        }
        validateNativeEmoteHeader(parseResourceXml(get("res/layout/emote_card_dialog.xml").readText()))
    }
}

internal val nativeEmotePreviewPatch = bytecodePatch {
    dependsOn(twitchExtensionPatch, nativeEmoteResources)
    execute {
        val fragment = classDefBy("Lcom/google/android/material/bottomsheet/BottomSheetDialogFragment;")
        val factory = fragment.methods.filter { it.name == "onCreateDialog" &&
            it.isInstance(listOf("Landroid/os/Bundle;"), "Landroid/app/Dialog;") }.uniqueHook("native sheet factory")
        val constructor = factory.references().filterIsInstance<MethodReference>().filter {
            it.name == "<init>" && it.parameterTypes == listOf("Landroid/content/Context;", "I") && it.returnType == "V"
        }.uniqueHook("original native sheet constructor")
        val declaration = classDefBy(constructor.definingClass).methods.filter { it.reference == constructor.toString() }
            .uniqueHook("native sheet constructor declaration")
        if (!AccessFlags.PUBLIC.isSet(declaration.accessFlags) || nativePreviewIds.size != 6)
            throw PatchException("Emotes: native sheet bridge contract changed.")
        val preview = mutableClassDefBy(PREVIEW)
        val dialog = preview.methods.filter { it.name == "createDialog" &&
            it.parameterTypes == listOf("Landroid/content/Context;") && it.returnType == "Landroid/app/Dialog;" &&
            AccessFlags.STATIC.isSet(it.accessFlags) }.uniqueHook("native preview dialog bridge")
        val dialogBridge = ImmutableMethod(dialog.definingClass, dialog.name, dialog.parameters, dialog.returnType,
            dialog.accessFlags, dialog.annotations, dialog.hiddenApiRestrictions, MutableMethodImplementation(3)).toMutable()
        dialogBridge.addInstructions(0, """
            new-instance v0, ${constructor.definingClass}
            const/4 v1, 0x0
            invoke-direct {v0, p0, v1}, $constructor
            return-object v0
        """)
        preview.methods.remove(dialog)
        preview.methods.add(dialogBridge)
        val ids = preview.methods.filter { it.name == "resourceIds" && it.parameterTypes.isEmpty() &&
            it.returnType == "[I" && AccessFlags.STATIC.isSet(it.accessFlags) }.uniqueHook("native preview resource bridge")
        val idsBridge = ImmutableMethod(ids.definingClass, ids.name, ids.parameters, ids.returnType,
            ids.accessFlags, ids.annotations, ids.hiddenApiRestrictions, MutableMethodImplementation(6)).toMutable()
        idsBridge.addInstructions(0, nativePreviewIds.mapIndexed { index, id -> "const v$index, $id" }.joinToString("\n") + """

            filled-new-array/range {v0 .. v5}, [I
            move-result-object v0
            return-object v0
        """)
        preview.methods.remove(ids)
        preview.methods.add(idsBridge)
    }
}
