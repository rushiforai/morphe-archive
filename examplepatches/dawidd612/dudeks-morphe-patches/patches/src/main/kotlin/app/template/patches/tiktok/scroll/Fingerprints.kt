package app.template.patches.tiktok.scroll

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal const val CHAT_LAYOUT = "Lcom/ss/android/ugc/aweme/im/ui/recyclerview/InnerChatLinearLayoutManager;"
internal const val HOOK = "Lpl/dudek/extension/tiktok/KeepDmScrollPosition;"
internal fun Method.calls() = implementation?.instructions?.mapNotNull {
    (it as? ReferenceInstruction)?.reference as? MethodReference
}.orEmpty()

// The queue is already drained here. Suppress only the resulting auto-scroll,
// retaining dataset submission, bookkeeping, logging and completion callbacks.
internal object CommitScrollFingerprint : Fingerprint(
    strings = listOf("set_and_diff", ", shouldScroll=", "onSubmitListComplete"),
    returnType = "Ljava/lang/Object;",
    parameters = emptyList(),
    custom = { method, _ -> method.calls().any { it.name == "stopScroll" } &&
        method.calls().any { it.name == "scrollToPositionWithOffset" } },
)
internal object AttachListFingerprint : Fingerprint(
    definingClass = CHAT_LAYOUT, name = "onAttachedToWindow",
    parameters = listOf("Landroidx/recyclerview/widget/RecyclerView;"), returnType = "V",
)
internal object DetachListFingerprint : Fingerprint(
    definingClass = CHAT_LAYOUT, name = "onDetachedFromWindow", returnType = "V",
)
internal object LatestButtonFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    custom = { method, _ -> method.parameterTypes.size == 1 &&
        method.calls().any { it.name == "refresh" && it.definingClass.endsWith("/ChatroomEventAbility;") } &&
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name == "TAP_SCROLL_BOTTOM"
        } == true },
)
