package patches.gboard.features.shiftdelete

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import patches.gboard.Constants.COMPATIBILITY_GBOARD
import patches.gboard.shared.GboardMethodTarget
import patches.gboard.shared.findMutableMethodOrThrow
import patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import patches.gboard.shared.isFieldReference
import patches.gboard.shared.isMethodReference
import patches.gboard.shared.isOpcode
import patches.gboard.shared.mutableClass
import patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import patches.gboard.shared.runtimeabi.RuntimeCallId

private const val INPUT_VIEW = "Lcom/google/android/libraries/inputmethod/inputview/InputView;"
private const val MOTION_EVENT = "Landroid/view/MotionEvent;"
private const val EVENT = "Ladan;"
private const val ACTION = "Lagkl;"
private const val ENTRY = "Lagmb;"
private const val INTENTION = "Lagma;"
private const val NATIVE_PRESS_FALLBACK = "Laerp;->b(Laerw;Lagmb;I)I"

private val inputDispatch = GboardMethodTarget("Lafae;", "bT", listOf(EVENT), "V")
private val touchDispatch = GboardMethodTarget(INPUT_VIEW, "dispatchTouchEvent", listOf(MOTION_EVENT), "Z")
private val editorFallback = GboardMethodTarget("Laepp;", "C", listOf(EVENT), "V")

internal val gboardShiftDeleteBytecodePatch = bytecodePatch(
    description = "Remap the held soft Shift and Backspace chord to native Forward Delete.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        validateEventBinding()
        val input = findMutableMethodOrThrow(inputDispatch)
        val touch = findMutableMethodOrThrow(touchDispatch)
        val editor = findMutableMethodOrThrow(editorFallback)

        input.verifyHostEntry(
            "Lafae;->ay(Ladan;)Z",
            "Ladan;->g()Lagmb;",
            "Lafae;->ai()Laepw;",
            "Laepw;->C(Ladan;)V",
        )
        touch.verifyHostEntry(
            "Landroid/view/MotionEvent;->getAction()I",
            "Lafda;->e(Landroid/view/View;Landroid/view/MotionEvent;)Z",
            "Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z",
        )
        editor.verifyHostEntry("Laepu;->g(Landroid/view/KeyEvent;)V", NATIVE_PRESS_FALLBACK)

        // Validate the complete dispatch chain before mutating either entry.
        input.addInstructions(
            0,
            """
                ${RuntimeCallEmitter.invoke(RuntimeCallId.SHIFT_DELETE_RUNTIME_REMAP_INPUT, "p0 .. p1")}
                move-result-object p1
                check-cast p1, $EVENT
            """.trimIndent(),
        )
        touch.addInstructions(
            0,
            RuntimeCallEmitter.invoke(RuntimeCallId.SHIFT_DELETE_RUNTIME_ON_TOUCH_EVENT, "p1"),
        )
    }
}

private fun BytecodePatchContext.validateEventBinding() {
    val event = mutableClass(EVENT)
    val entry = mutableClass(ENTRY)
    val eventFields = mapOf(
        "a" to ACTION,
        "b" to "[$ENTRY",
        "c" to "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;",
        "u" to "Landroid/view/KeyEvent;",
    )
    check(eventFields.all { (name, type) ->
        event.fields.count {
            it.name == name && it.type == type && !AccessFlags.STATIC.isSet(it.accessFlags)
        } == 1
    }) { "Shift-delete input event field layout changed" }
    check(entry.fields.any { it.name == "e" && it.type == INTENTION } &&
        entry.fields.any { it.name == "f" && it.type == "Ljava/lang/Object;" }
    ) { "Shift-delete key data field layout changed" }

    val copy = findMutableMethodOrThrow(EVENT, "c", EVENT, listOf(EVENT))
    val ctor = findMutableMethodOrThrow(ENTRY, "<init>", "V", listOf("I", INTENTION, "Ljava/lang/Object;", "I"))
    val hash = findMutableMethodOrThrow(ENTRY, "hashCode", "I", emptyList())
    check(AccessFlags.STATIC.isSet(copy.accessFlags) && eventFields.all { (name, type) ->
        copy.implementation?.instructions?.any {
            it.isOpcode("IPUT_OBJECT") && it.isFieldReference("$EVENT->$name:$type")
        } == true
    }) { "Shift-delete event copy no longer preserves the input fields" }
    check(listOf("d", "g").all { name ->
        ctor.implementation?.instructions?.any {
            it.isOpcode("IPUT") && it.isFieldReference("$ENTRY->$name:I")
        } == true
    } && hash.implementation?.instructions?.any {
        it.isOpcode("IPUT") && it.isFieldReference("$ENTRY->g:I")
    } == true) { "Shift-delete key code or cached hash layout changed" }

    val enumInitializer = findMutableMethodOrThrow(ACTION, "<clinit>", "V", emptyList())
    val enumNames = enumInitializer.implementation?.instructions.orEmpty()
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
    check(mutableClass(ACTION).superclass == "Ljava/lang/Enum;" &&
        enumNames.containsAll(listOf("DOWN", "UP", "PRESS"))
    ) { "Shift-delete soft-key actions changed" }
}

private fun MutableMethod.verifyHostEntry(vararg expectedCalls: String) {
    val code = checkNotNull(implementation) { "Missing Gboard Shift-delete host implementation: $this" }
    check(!AccessFlags.STATIC.isSet(accessFlags) && code.registerCount in 2..16 &&
        expectedCalls.all { expected -> code.instructions.any { it.isMethodReference(expected) } }
    ) { "Gboard Shift-delete host entry changed: $this" }
}
