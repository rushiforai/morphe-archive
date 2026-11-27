package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.AccessFlags

internal fun BytecodePatchContext.patchDirectBodySelection(version: String) {
    val type = when (version) {
        "0.8.10.191 dev" -> "Lo/r8lambda1VMNzQcdpAFQ0ukC0aRPi4Owdo;"
        "0.8.10.226 dev" -> "Lo/PAGClientBidding;"
        "0.8.10.242 dev" -> "Lo/zzbhr;"
        else -> return
    }
    val owner = mutableClassDefBy(type)
    if (version == "0.8.10.242 dev") {
        val start = owner.methods.single { it.name == "d" && it.parameterTypes.isEmpty() && it.returnType == "V" }
        start.addInstructions(0,"invoke-static {p0}, Lapp/morphe/extension/chmate/CardTextSelection;->begin(Ljava/lang/Object;)V")
        check(owner.methods.none { it.name == "requestRectangleOnScreen" })
        val rectangle=MutableMethod(ImmutableMethod(type,"requestRectangleOnScreen",
            listOf(ImmutableMethodParameter("Landroid/graphics/Rect;",emptySet(),null),ImmutableMethodParameter("Z",emptySet(),null)),
            "Z",AccessFlags.PUBLIC.value,emptySet(),emptySet(),ImmutableMethodImplementation(4,emptyList(),emptyList(),emptyList())))
        rectangle.addInstructions(0,"""
            invoke-static {p0}, Lapp/morphe/extension/chmate/CardTextSelection;->suppressScroll(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :native_rectangle
            const/4 v0, 0x0
            return v0
            :native_rectangle
            invoke-super {p0, p1, p2}, ${owner.superclass}->requestRectangleOnScreen(Landroid/graphics/Rect;Z)Z
            move-result v0
            return v0
        """.trimIndent())
        owner.methods.add(rectangle)
    }
    val original = owner.methods.single { it.name == "dispatchTouchEvent" &&
        it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/MotionEvent;") }
    val delegate = MutableMethod(ImmutableMethod(type, "haiagaruDirectSelectionNativeDispatch", original.parameters,
        original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions, original.implementation))
    val wrapper = MutableMethod(ImmutableMethod(type, original.name, original.parameters, original.returnType,
        original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())))
    wrapper.addInstructions(0, """
        invoke-static {p0}, Lapp/morphe/extension/chmate/DirectBodySelection;->prepare(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :native_dispatch
        invoke-static {p0, p1}, Lapp/morphe/extension/chmate/DirectBodySelection;->dispatch(Landroid/widget/TextView;Landroid/view/MotionEvent;)Z
        move-result v0
        return v0
        :native_dispatch
        invoke-virtual {p0, p1}, $delegate
        move-result v0
        return v0
    """.trimIndent())
    owner.methods.remove(original)
    owner.methods.add(delegate)
    owner.methods.add(wrapper)
    check(owner.methods.none { it.name == "setOnLongClickListener" }) { "Unexpected native long-click setter: $type" }
    val listenerType = "Landroid/view/View\$OnLongClickListener;"
    val setter = MutableMethod(ImmutableMethod(type, "setOnLongClickListener",
        listOf(ImmutableMethodParameter(listenerType, emptySet(), null)), "V", AccessFlags.PUBLIC.value,
        emptySet(), emptySet(), ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())))
    setter.addInstructions(0, """
        invoke-static {p0, p1}, Lapp/morphe/extension/chmate/DirectBodySelection;->longClickListener(Ljava/lang/Object;$listenerType)$listenerType
        move-result-object v0
        invoke-super {p0, v0}, ${owner.superclass}->setOnLongClickListener($listenerType)V
        return-void
    """.trimIndent())
    owner.methods.add(setter)
    // View.performLongClick consults showContextMenu BEFORE TextView's Editor.
    // Returning false here lets Editor start platform selection instead of the
    // registered response context menu. Both overloads are used across Android APIs.
    for (parameters in listOf(emptyList(), listOf("F", "F"))) {
        check(owner.methods.none { it.name == "showContextMenu" &&
            it.parameterTypes.map(CharSequence::toString) == parameters })
        val contextMenu = MutableMethod(ImmutableMethod(type, "showContextMenu",
            parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, "Z", AccessFlags.PUBLIC.value,
            emptySet(), emptySet(), ImmutableMethodImplementation(parameters.size + 2, emptyList(), emptyList(), emptyList())))
        val registers = (0..parameters.size).joinToString(", ") { "p$it" }
        contextMenu.addInstructions(0, """
            invoke-static {p0}, Lapp/morphe/extension/chmate/DirectBodySelection;->selectionContext(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :native_context
            const/4 v0, 0x0
            return v0
            :native_context
            invoke-super {$registers}, ${owner.superclass}->showContextMenu(${parameters.joinToString("")})Z
            move-result v0
            return v0
        """.trimIndent())
        owner.methods.add(contextMenu)
    }
    // 191 suppresses selection updates outside its temporary native selection path.
    if (version == "0.8.10.191 dev") {
        val selection = owner.methods.single { it.name == "onSelectionChanged" }
        val nativeSelection = MutableMethod(ImmutableMethod(type, "haiagaruNativeSelectionChanged", selection.parameters,
            selection.returnType, selection.accessFlags, selection.annotations, selection.hiddenApiRestrictions, selection.implementation))
        val changed = MutableMethod(ImmutableMethod(type, selection.name, selection.parameters, selection.returnType,
            selection.accessFlags, selection.annotations, selection.hiddenApiRestrictions,
            ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList())))
        changed.addInstructions(0, """
            invoke-static {p0}, Lapp/morphe/extension/chmate/DirectBodySelection;->prepare(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :native_selection
            invoke-super {p0, p1, p2}, ${owner.superclass}->onSelectionChanged(II)V
            return-void
            :native_selection
            invoke-virtual {p0, p1, p2}, $nativeSelection
            return-void
        """.trimIndent())
        owner.methods.remove(selection)
        owner.methods.add(nativeSelection)
        owner.methods.add(changed)
    }
    println("Direct body selection: $version opt-in native body dispatcher")
}
