package app.sircoderin.patches.spotify

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The Home page's state-restore method (obfuscated, `p.xpr.b(Object)` in 9.2.0.2053). It reads the saved row count
 * with `bundle.getInt("viewDataHoldersSize", 0)`.
 *
 * Class and method names are obfuscated, so this keys on the string literal followed by the `getInt` call.
 * The only other method using the literal (`serialize()`) calls `putInt`, so it cannot match.
 */
internal object ViewDataHoldersSizeRestoreFingerprint : Fingerprint(
    filters = listOf(
        string("viewDataHoldersSize"),
        methodCall(
            definingClass = "Landroid/os/BaseBundle;",
            name = "getInt",
            parameters = listOf("Ljava/lang/String;", "I"),
            returnType = "I",
        ),
    ),
)

/**
 * The Home page's `serialize()` (obfuscated, `p.zu00.serialize()`): saves the view state and the loaded row count with
 * `putInt("viewDataHoldersSize", ...)` when the user leaves Home. Keys on the same string literal as above, but on the
 * `putInt` call and the `Bundle` return type, so it cannot match the restore method.
 */
internal object ViewDataHoldersSizeSerializeFingerprint : Fingerprint(
    returnType = "Landroid/os/Bundle;",
    filters = listOf(
        string("viewDataHoldersSize"),
        methodCall(
            definingClass = "Landroid/os/BaseBundle;",
            name = "putInt",
            parameters = listOf("Ljava/lang/String;", "I"),
            returnType = "V",
        ),
    ),
)

/**
 * The Home page constructor (obfuscated, `p.zu00.<init>`): finds the `evo_swipe_refresh_layout` SwipeRefreshLayout and
 * enables it (and its refresh listener) only when a remote flag is on. Keys on the unobfuscated androidx calls.
 */
internal object HomePageConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;",
            name = "setEnabled",
            parameters = listOf("Z"),
            returnType = "V",
        ),
        methodCall(
            definingClass = "Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;",
            name = "setProgressBackgroundColorSchemeResource",
            parameters = listOf("I"),
            returnType = "V",
        ),
        methodCall(
            definingClass = "Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;",
            name = "setOnRefreshListener",
        ),
    ),
)

/**
 * The Home loop starter (a lambda `switch` case, obfuscated): logs "EvoLoadableResource :: startLoop", then asks the
 * strategy chooser (`kjc0.t(Z)`) which load strategy the first `LoadHomeStructure` should use.
 * The last match is that chooser call: the first call taking a single boolean after the string.
 */
internal object HomeStartLoopFingerprint : Fingerprint(
    filters = listOf(
        string("EvoLoadableResource :: startLoop"),
        methodCall(parameters = listOf("Z")),
    ),
)

/**
 * The Home image-link carousel's view constructor (obfuscated, `p.q680.<init>`). It creates a `LinkedHashMap` of
 * carousel LayoutManager states keyed by section id, which its LayoutManager (the anonymous
 * `ImageLinkCarouselElementUI$view$1$1`, whose name R8 keeps) saves into on detach and restores from on attach.
 * Keys on that class name.
 */
internal object HomeCarouselConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    filters = listOf(
        newInstance("Ljava/util/LinkedHashMap;"),
        newInstance("Lcom/spotify/home/evopage/element/imagelinks/ImageLinkCarouselElementUI\$view\$1\$1;"),
    ),
)

private const val LINEAR_LAYOUT_MANAGER = "Landroidx/recyclerview/widget/LinearLayoutManager;"
private const val VIEW = "Landroid/view/View;"

/**
 * `LinearLayoutManager.scrollToPositionWithOffset(II)V` (obfuscated, `w1` in 9.2.0.2053). Its whole body is: store
 * both ints, clear the pending saved state (`if (state != null) state.anchor = -1`), `requestLayout()`. Matched by the
 * exact opcode sequence, which no other `(II)V` method of the class shares (the others touch the orientation helper).
 */
internal object ScrollToPositionWithOffsetFingerprint : Fingerprint(
    definingClass = LINEAR_LAYOUT_MANAGER,
    returnType = "V",
    parameters = listOf("I", "I"),
    custom = { method, _ ->
        method.implementation?.instructions?.map { it.opcode } == listOf(
            Opcode.IPUT,
            Opcode.IPUT,
            Opcode.IGET_OBJECT,
            Opcode.IF_EQZ,
            Opcode.CONST_4,
            Opcode.IPUT,
            Opcode.INVOKE_VIRTUAL,
            Opcode.RETURN_VOID,
        )
    },
)

/** The value of the `const` that last wrote [register] before [index], or null if it was written otherwise. */
private fun constBefore(instructions: List<Instruction>, index: Int, register: Int): Int? {
    for (i in index - 1 downTo 0) {
        val ins = instructions[i]
        if (ins is OneRegisterInstruction && ins.registerA == register) {
            return if (ins.opcode == Opcode.CONST_4 || ins.opcode == Opcode.CONST_16 || ins.opcode == Opcode.CONST) {
                (ins as NarrowLiteralInstruction).narrowLiteral
            } else null
        }
    }
    return null
}

/** `LayoutManager.getPosition(View)I`: the static call [method] makes on a View, or null. */
internal fun getPositionCall(method: Method): MethodReference? =
    method.implementation?.instructions?.firstNotNullOfOrNull {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.takeIf { r ->
            it.opcode == Opcode.INVOKE_STATIC && r.returnType == "I" && r.parameterTypes.map(Any::toString) == listOf(VIEW)
        }
    }

/**
 * `LinearLayoutManager.findFirstVisibleItemPosition()I` (obfuscated, `f1` in 9.2.0.2053): calls
 * `findOneVisibleChild(0, childCount, completelyVisible = false, acceptPartially = true)` and maps the result with the
 * static `LayoutManager.getPosition(View)`. The sibling variants (first completely visible, last visible, ...) differ
 * only in those arguments, so the constants passed are checked.
 */
internal object FindFirstVisibleItemPositionFingerprint : Fingerprint(
    definingClass = LINEAR_LAYOUT_MANAGER,
    returnType = "I",
    parameters = listOf(),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions?.toList().orEmpty()
        val callIndex = instructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            it.opcode == Opcode.INVOKE_VIRTUAL && ref != null && ref.definingClass == LINEAR_LAYOUT_MANAGER &&
                ref.returnType == VIEW && ref.parameterTypes.map(Any::toString) == listOf("I", "I", "Z", "Z")
        }
        val call = instructions.getOrNull(callIndex) as? FiveRegisterInstruction
        call != null &&
            constBefore(instructions, callIndex, call.registerD) == 0 &&
            constBefore(instructions, callIndex, call.registerF) == 0 &&
            constBefore(instructions, callIndex, call.registerG) == 1 &&
            getPositionCall(method) != null
    },
)

/** `RecyclerView.onInterceptTouchEvent(MotionEvent)Z`: a framework override, so its name survives obfuscation. */
internal object RecyclerViewInterceptTouchFingerprint : Fingerprint(
    definingClass = "Landroidx/recyclerview/widget/RecyclerView;",
    name = "onInterceptTouchEvent",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

/** The extension's [app.sircoderin.extension.spotify.HomeListBridge] placeholders the patch replaces. */
internal object ChildPositionBridgeFingerprint : Fingerprint(
    definingClass = "Lapp/sircoderin/extension/spotify/HomeListBridge;",
    name = "childPosition",
)

internal object ScrollBridgeFingerprint : Fingerprint(
    definingClass = "Lapp/sircoderin/extension/spotify/HomeListBridge;",
    name = "scrollToPositionWithOffset",
)
