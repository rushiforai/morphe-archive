package app.morphe.patches.tiktok.misc.commenttools

import app.morphe.patcher.Fingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val COMMENT_MENU_PANEL = "Lcom/ss/android/ugc/aweme/comment/longpresspanel/ui/CommentLongPressFragment;"
private const val LIST = "Ljava/util/List;"

/**
 * The comment menu's one list sink: the panel's single `(List)` method, which builds its
 * adapter, stores the finished rows in it and sets it on the RecyclerView. The panel keeps its
 * name and both callers (the preloaded rows and the loaded ones) go through it.
 */
internal fun isCommentMenuListSink(method: Method): Boolean {
    if (method.definingClass != COMMENT_MENU_PANEL || method.returnType != "V" ||
        method.parameterTypes.map(CharSequence::toString) != listOf(LIST)
    ) return false
    val implementation = method.implementation ?: return false
    val instructions = implementation.instructions.toList()
    val rows = implementation.registerCount - 1
    val adapters = instructions.filter { it.opcode == Opcode.NEW_INSTANCE }
        .mapNotNull { it.getReference<TypeReference>()?.type }.toSet()
    val storesRows = instructions.any { instruction ->
        val field = instruction.getReference<FieldReference>()
        instruction.opcode == Opcode.IPUT_OBJECT && instruction is TwoRegisterInstruction &&
            instruction.registerA == rows && field?.type == LIST && field.definingClass in adapters
    }
    val setsAdapter = instructions.any { instruction ->
        instruction.getReference<MethodReference>()?.let {
            it.definingClass == "Landroidx/recyclerview/widget/RecyclerView;" && it.name == "setAdapter" &&
                it.parameterTypes.size == 1
        } == true
    }
    return storesRows && setsAdapter
}

internal object CommentMenuListFingerprint : Fingerprint(
    definingClass = COMMENT_MENU_PANEL,
    returnType = "V",
    parameters = listOf(LIST),
    custom = { method, _ -> isCommentMenuListSink(method) },
)
