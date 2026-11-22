package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION = "Lapp/voidhack/extension/applemusic/LiquidGlass;"
private const val SHEET_BRIDGE = "Lapp/voidhack/extension/applemusic/GlassPlayerSheet;"
private const val VIEW = "Landroid/view/View;"
private const val TOUCH_EVENT = "Landroid/view/MotionEvent;"
private const val COORDINATOR = "Landroidx/coordinatorlayout/widget/CoordinatorLayout;"
private const val COORDINATOR_BEHAVIOR = "Landroidx/coordinatorlayout/widget/CoordinatorLayout\$c;"
private const val BEHAVIOR = "Lcom/google/android/material/bottomsheet/BottomSheetBehavior;"
private const val LAYOUT_PARAMS = "Landroid/view/ViewGroup\$LayoutParams;"

private object MusicContentViewCreated : Fingerprint(
    definingClass = "Lcom/apple/android/music/common/fragment/MusicContentFragment;",
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
    strings = listOf("miniPlayerBlur", "getDecorView(...)"),
)

private object PlayerSheetSlide : Fingerprint(
    definingClass = "Lcom/apple/android/music/player/fragment/PlayerMainFragment\$i;",
    name = "b",
    parameters = listOf("Landroid/view/View;", "F"),
    returnType = "V",
    strings = listOf("View.NO_ID"),
)

private object MainActivityCreated : Fingerprint(
    definingClass = "Lcom/apple/android/music/common/MainActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

@Suppress("unused")
val liquidGlassBottomBarPatch = bytecodePatch(
    name = "Liquid Glass bottom bar",
    description = "Adds live refractive glass to Apple Music's mini-player and bottom tabs, an animated selection lens, and a glass transition between the mini-player and Now Playing. Refraction requires Android 13 or newer.",
) {
    compatibleWith(appleMusicCompatibility)
    extendWith("extensions/extension.mpe")

    execute {
        MusicContentViewCreated.method.addInstruction(
            0,
            "invoke-static/range {p1 .. p1}, $EXTENSION->install(Landroid/view/View;)V",
        )
        patchPlayerSlide()
        patchControlDrag()

        val activity = MainActivityCreated.classDef
        check(activity.methods.none { it.name == "dispatchTouchEvent" && it.parameterTypes == listOf(TOUCH_EVENT) })
        activity.addPlayerMethod("dispatchTouchEvent", listOf(TOUCH_EVENT), "Z", 3,
            """
                invoke-static {p0, p1}, $EXTENSION->onPlayerControlTouch(Landroid/app/Activity;${TOUCH_EVENT})Z
                move-result v0
                if-nez v0, :handled
                invoke-super {p0, p1}, ${activity.superclass}->dispatchTouchEvent(${TOUCH_EVENT})Z
                move-result v0
                :handled
                return v0
            """,
        )
    }
}

private fun BytecodePatchContext.patchPlayerSlide() {
    val host = PlayerSheetSlide.classDef
    val slide = PlayerSheetSlide.method
    val updateViews = host.methods.single {
        it.name == "d" && it.parameterTypes == listOf("F") && it.returnType == "V"
    }
    val layoutCall = updateViews.instructions.withIndex().single { (_, instruction) ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference?.name == "setLayoutParams" && reference.parameterTypes == listOf(LAYOUT_PARAMS)
    }
    val registers = layoutCall.value as FiveRegisterInstruction
    updateViews.replaceInstruction(
        layoutCall.index,
        "invoke-static {v${registers.registerC}, v${registers.registerD}}, " +
            "$EXTENSION->layoutPlayerBackground($VIEW$LAYOUT_PARAMS)V",
    )

    // The native callback reuses p1. Keep the original sheet and progress in the
    // wrapper and publish them after the native artwork and visibility updates.
    host.methods.remove(slide)
    slide.setName("glassNativeSlide")
    host.methods.add(slide)
    host.addPlayerMethod("b", listOf(VIEW, "F"), "V", 3,
        """
            invoke-virtual {p0, p1, p2}, $slide
            invoke-static {p1, p2}, $EXTENSION->onPlayerSlide(${VIEW}F)V
            return-void
        """,
    )
}

private fun BytecodePatchContext.patchControlDrag() {
    val behavior = mutableClassDefBy(BEHAVIOR)
    fun method(name: String, returnType: String, vararg parameters: String) =
        behavior.methods.single {
            it.name == name && it.returnType == returnType && it.parameterTypes == parameters.toList()
        }

    val fromView = method("D", BEHAVIOR, VIEW)
    val top = method("G", "I", "I")
    val onSlide = method("B", "V", "I")
    val setInternalState = method("N", "V", "I")
    val settle = method("P", "V", VIEW, "I", "Z")
    val intercept = method("l", "Z", COORDINATOR, VIEW, TOUCH_EVENT)
    val touch = method("w", "Z", COORDINATOR, VIEW, TOUCH_EVENT)

    // Resolve obfuscated fields through the methods that read them. These are
    // the LayoutParams behavior, current sheet state, and the draggable flag.
    val layoutType = fromView.instructions.firstField(Opcode.IGET_OBJECT, COORDINATOR_BEHAVIOR).definingClass
    val state = setInternalState.instructions.firstField(Opcode.IGET, "I")
    val draggable = intercept.instructions.firstField(Opcode.IGET_BOOLEAN, "Z")
    val layout = mutableClassDefBy(layoutType)
    layout.interfaces.add(SHEET_BRIDGE)

    layout.addPlayerMethod("glassPlayerCanDrag", listOf(VIEW), "Z", 4,
        """
            invoke-static {p1}, $fromView
            move-result-object v0
            iget-boolean v1, v0, $draggable
            if-eqz v1, :no
            iget v0, v0, $state
            const/4 v1, 0x3
            if-ne v0, v1, :no
            const/4 v0, 0x1
            return v0
            :no
            const/4 v0, 0x0
            return v0
        """,
    )
    layout.addPlayerMethod("glassPlayerTop", listOf(VIEW, "I"), "I", 4,
        """
            invoke-static {p1}, $fromView
            move-result-object v0
            invoke-virtual {v0, p2}, $top
            move-result v0
            return v0
        """,
    )
    layout.addPlayerMethod("glassPlayerDrag", listOf(VIEW, "I"), "V", 6,
        """
            invoke-static {p1}, $fromView
            move-result-object v0
            iget v1, v0, $state
            const/4 v2, 0x3
            if-eq v1, v2, :clamp
            const/4 v2, 0x1
            if-ne v1, v2, :end
            :clamp
            const/4 v1, 0x3
            invoke-virtual {v0, v1}, $top
            move-result v1
            invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I
            move-result p2
            const/4 v1, 0x4
            invoke-virtual {v0, v1}, $top
            move-result v1
            invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I
            move-result p2
            invoke-virtual {p1}, $VIEW->getTop()I
            move-result v1
            sub-int v1, p2, v1
            if-eqz v1, :end
            const/4 v2, 0x1
            invoke-virtual {v0, v2}, $setInternalState
            invoke-virtual {p1, v1}, $VIEW->offsetTopAndBottom(I)V
            invoke-virtual {v0, p2}, $onSlide
            :end
            return-void
        """,
    )
    layout.addPlayerMethod("glassPlayerSettle", listOf(VIEW, "Z"), "V", 6,
        """
            invoke-static {p1}, $fromView
            move-result-object v0
            iget v1, v0, $state
            const/4 v2, 0x1
            if-ne v1, v2, :end
            const/4 v1, 0x3
            if-eqz p2, :settle
            const/4 v1, 0x4
            :settle
            const/4 v2, 0x0
            invoke-virtual {v0, p1, v1, v2}, $settle
            :end
            return-void
        """,
    )

    // A foreground control can overlap a nested scrolling child. For this
    // stream, let the child receive taps while our recognizer owns sheet motion.
    for (native in listOf(intercept, touch)) {
        native.addInstructionsWithLabels(0,
            """
                invoke-static/range {p2 .. p2}, $EXTENSION->ownsPlayerControlTouch($VIEW)Z
                move-result v0
                if-eqz v0, :native_touch
                const/4 v0, 0x0
                return v0
            """,
            ExternalLabel("native_touch", native.getInstruction(0)),
        )
    }
}

private fun Iterable<Instruction>.firstField(
    opcode: Opcode, type: String,
): FieldReference = asSequence()
    .filter { it.opcode == opcode }
    .map { (it as ReferenceInstruction).reference as FieldReference }
    .first { it.type == type }

private fun MutableClass.addPlayerMethod(
    name: String, parameters: List<String>, returns: String, registers: Int, code: String,
) {
    val method = MutableMethod(
        ImmutableMethod(
            type, name, parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, returns,
            AccessFlags.PUBLIC.value, emptySet(), emptySet(),
            ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList()),
        ),
    )
    method.addInstructions(0, code)
    methods.add(method)
}
