package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.twitchpatches.patches.twitch.shared.*
import org.w3c.dom.Element

private var pickerFooterId = 0

private val pickerResources = resourcePatch {
    execute {
        val public = parseResourceXml(get("res/values/public.xml").readText()).getElementsByTagName("public")
        pickerFooterId = (0 until public.length).map { public.item(it) as Element }.filter {
            it.getAttribute("type") == "id" && it.getAttribute("name") == "all_emotes_button"
        }.uniqueHook("picker footer resource").getAttribute("id").removePrefix("0x").toLong(16).toInt()
        document("res/layout/emote_picker.xml").use { document ->
            val root = document.documentElement
            val buttons = listOf("show_keyboard_button", "frequent_emotes_button", "channel_emotes_button", "all_emotes_button")
                .map { name -> (0 until root.childNodes.length).mapNotNull { root.childNodes.item(it) as? Element }
                    .filter { it.getAttribute("android:id") == "@id/$name" }.uniqueHook("picker $name") }
            val scroll = document.createElement("HorizontalScrollView").apply {
                setAttribute("android:layout_width", "0dp")
                setAttribute("android:layout_height", "@dimen/emote_picker_button_height")
                setAttribute("android:scrollbars", "none")
                setAttribute("app:layout_constraintStart_toStartOf", "parent")
                setAttribute("app:layout_constraintEnd_toStartOf", "@id/delete_emote_button")
                setAttribute("app:layout_constraintBottom_toBottomOf", "@id/bottom_bar_background")
            }
            val bar = document.createElement("LinearLayout").apply {
                setAttribute("android:layout_width", "wrap_content")
                setAttribute("android:layout_height", "@dimen/emote_picker_button_height")
                setAttribute("android:orientation", "horizontal")
            }
            root.insertBefore(scroll, buttons.first())
            scroll.appendChild(bar)
            buttons.forEach { button ->
                (0 until button.attributes.length).map { button.attributes.item(it).nodeName }
                    .filter { it.startsWith("app:layout_constraint") }.forEach(button::removeAttribute)
                button.setAttribute("android:minWidth", "44dp")
                bar.appendChild(button)
            }
        }
    }
}

internal val nativeEmotePickerPatch = bytecodePatch {
    dependsOn(twitchExtensionPatch, pickerResources)
    execute {
        val h = resolveNativePickerHooks()
        nativePickerBridges(h, pickerFooterId)
        val presenter = mutableClassDefBy(h.presenter.type)
        val start = presenter.methods.single { it.reference == h.start.reference }
        val began = emotePickerStartBridge(h.start)
        start.addInstructions(0, "invoke-static/range {p0 .. p1}, $began")
        val destroyed = presenter.methods.filter { it.name == "onDestroy" && it.isInstance(emptyList(), "V") }
            .uniqueHook("picker destruction")
        destroyed.addInstructions(0, "invoke-static/range {p0 .. p0}, $PICKER_RUNTIME->close(Ljava/lang/Object;)V")
        val event = mutableClassDefBy(h.event.definingClass).methods.single { it.reference == h.event.reference }
        event.addInstructions(0, """
            invoke-static/range {p1 .. p2}, $PICKER_RUNTIME->augment(Ljava/util/List;Z)Ljava/util/List;
            move-result-object p1
        """)
        val delegate = mutableClassDefBy(h.delegate.definingClass).methods.single { it.reference == h.delegate.reference }
        val bound = emotePickerBindBridge(h.delegate)
        delegate.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed().forEach {
            delegate.insertAtReturn(it, "invoke-static/range {p0 .. p0}, $bound")
        }
        val url = mutableClassDefBy(h.url.definingClass).methods.single { it.reference == h.url.reference }
        require((url.implementation?.registerCount ?: 0) > 4) { "Emotes: picker URL scratch register unavailable." }
        url.addInstructionsWithLabels(0, """
            invoke-static/range {p2 .. p2}, $PICKER_RUNTIME->imageURL(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v0
            if-eqz v0, :native_url
            return-object v0
            :native_url
            nop
        """)
        val imageBinder = mutableClassDefBy(h.imageBinder.definingClass).methods.single { it.reference == h.imageBinder.reference }
        val imageCode = imageBinder.code()
        val builder = imageCode.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == h.url.reference }
        val load = (builder + 1 until imageCode.size).first { (imageCode[it] as? ReferenceInstruction)?.reference?.toString()
            ?.startsWith("Ltv/twitch/android/shared/ui/elements/image/NetworkImageWidget;->") == true }
        val call = imageCode[load] as? RegisterRangeInstruction ?: error("Emotes: picker image register range changed.")
        require(call.registerCount == 8 && imageCode[load].opcode == Opcode.INVOKE_STATIC_RANGE)
        val loader = (imageCode[load] as ReferenceInstruction).reference as MethodReference
        val imageBridge = pickerImageBridge(loader, imageBinder.definingClass)
        imageBinder.replaceInstruction(load, "invoke-static/range {v${call.startRegister} .. v${call.startRegister + 7}}, $imageBridge")
    }
}
