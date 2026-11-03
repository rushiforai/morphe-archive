package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.util.findMutableMethodOf
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal fun BytecodePatchContext.patchXPostPreviewBindings() {
    patchXPostPreviewTouch()
    var count = 0
    boundClassForEach("XPostPreviewPatch:1") { definition ->
        if (!definition.type.startsWith("Lo/") && !definition.type.startsWith("Ljp/syoboi/")) return@boundClassForEach
        for (method in definition.methods) {
            val sites = method.implementation?.instructions?.mapIndexedNotNull { index, instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                if (ref?.name != "setText" || ref.returnType != "V" ||
                    ref.parameterTypes.firstOrNull() != "Ljava/lang/CharSequence;") return@mapIndexedNotNull null
                val receiver = when (instruction) {
                    is FiveRegisterInstruction -> instruction.registerC
                    is RegisterRangeInstruction -> instruction.startRegister
                    else -> return@mapIndexedNotNull null
                }
                index to receiver
            }.orEmpty()
            if (sites.isEmpty()) continue
            val mutable = mutableClassDefBy(definition).findMutableMethodOf(method)
            sites.asReversed().forEach { (index, receiver) ->
                mutable.addInstruction(index + 1,
                    "invoke-static/range {v$receiver .. v$receiver}, Lapp/morphe/extension/chmate/XPostPreview;->onBound(Ljava/lang/Object;)V")
                count++
            }
        }
    }
    check(count > 0)
    println("X post preview bindings: $count native text assignments")
}

/** A URLSpan appended after native URL parsing is not part of ChMate's link table. */
internal fun BytecodePatchContext.patchXPostPreviewTouch() {
    val classes = mutableMapOf<String, ClassDef>()
    boundClassForEach("XPostPreviewPatch:2") { classes[it.type] = it }
    fun native(type: String) = type.startsWith("Lo/") || type.startsWith("Ljp/syoboi/")
    fun textView(type: String?): Boolean {
        if (type == null) return false
        if (type in setOf("Landroid/widget/TextView;", "Landroid/widget/Button;", "Landroid/widget/EditText;")) return true
        return textView(classes[type]?.superclass)
    }
    var count = 0
    for (definition in classes.values) {
        if (!native(definition.type) || !textView(definition.superclass)) continue
        val existing = definition.methods.singleOrNull {
            it.name == "dispatchTouchEvent" && it.parameterTypes.map(CharSequence::toString) ==
                listOf("Landroid/view/MotionEvent;") && it.returnType == "Z"
        }
        // Hook the native root widget and any descendant with its own dispatcher.
        if (existing == null && native(definition.superclass ?: "")) continue
        val owner = mutableClassDefBy(definition)
        val delegate: String
        if (existing != null) {
            check(existing.implementation != null)
            val original = owner.methods.single { it.name == existing.name && it.parameterTypes == existing.parameterTypes }
            owner.methods.remove(original)
            val renamed = MutableMethod(ImmutableMethod(owner.type, "haiagaruPreviewDispatchTouch", original.parameters,
                original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions, original.implementation))
            owner.methods.add(renamed)
            delegate = "invoke-virtual {p0, p1}, $renamed"
        } else delegate = "invoke-super {p0, p1}, ${definition.superclass}->dispatchTouchEvent(Landroid/view/MotionEvent;)Z"
        val wrapper = MutableMethod(ImmutableMethod(owner.type, "dispatchTouchEvent",
            listOf(ImmutableMethodParameter("Landroid/view/MotionEvent;", emptySet(), null)), "Z",
            0x1, emptySet(), emptySet(), ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())))
        wrapper.addInstructions(0, """
            invoke-static {p0, p1}, Lapp/morphe/extension/chmate/XPostPreviewTouch;->onTouch(Ljava/lang/Object;Landroid/view/MotionEvent;)Z
            move-result v0
            if-eqz v0, :native_dispatch
            return v0
            :native_dispatch
            $delegate
            move-result v0
            return v0
        """.trimIndent())
        owner.methods.add(wrapper)
        count++
    }
    check(count > 0) { "No native TextView found for X post preview touch" }
    println("X post preview links: $count native TextView touch dispatchers")
}
