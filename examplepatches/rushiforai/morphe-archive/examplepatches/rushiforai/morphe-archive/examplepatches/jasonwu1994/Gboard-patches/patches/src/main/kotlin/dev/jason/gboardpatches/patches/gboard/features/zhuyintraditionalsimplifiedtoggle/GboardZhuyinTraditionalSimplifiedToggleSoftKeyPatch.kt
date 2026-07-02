package dev.jason.gboardpatches.patches.gboard.features.zhuyintraditionalsimplifiedtoggle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import dev.jason.gboardpatches.patches.gboard.shared.addHelperMethodIfMissing
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow

private const val SOFT_KEY_VIEW_CLASS =
    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"

internal val gboardZhuyinTraditionalSimplifiedToggleSoftKeyPatch = bytecodePatch(
    description = "修正注音 ㄥ 上滑繁簡切換鍵的 SoftKeyView bind-time metadata。"
) {
    execute {
        addHelperMethod()
        injectMethodDelegate()
    }
}

context(context: BytecodePatchContext)
private fun addHelperMethod() = with(context) {
    addHelperMethodIfMissing(
        classType = SOFT_KEY_VIEW_CLASS,
        name = "jasondevPatchToggleIncomingMetadata",
        parameterTypes = listOf("Loaa;"),
        returnType = "Loaa;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 14,
        body = PATCH_TOGGLE_INCOMING_METADATA_BODY
    )
}

context(context: BytecodePatchContext)
private fun injectMethodDelegate() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = SOFT_KEY_VIEW_CLASS,
        name = "p",
        returnType = "Z",
        parameterTypes = listOf("Loaa;", "J")
    )

    mutableMethod.addInstructions(0, PATCH_TOGGLE_INCOMING_METADATA_DELEGATE)
}

private val PATCH_TOGGLE_INCOMING_METADATA_DELEGATE = """
    invoke-direct {p0, p1}, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;->jasondevPatchToggleIncomingMetadata(Loaa;)Loaa;

    move-result-object p1
""".trimIndent()

private val PATCH_TOGGLE_INCOMING_METADATA_BODY = """
    if-eqz p1, :cond_return_original

    iget v0, p1, Loaa;->c:I

    const v1, 0x7f0b23fd

    if-ne v0, v1, :cond_return_original

    invoke-virtual {p0}, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Loql;->O(Landroid/content/Context;)Loql;

    move-result-object v1

    const v2, 0x7f140969

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_return_original

    invoke-virtual {v1, v2}, Loql;->au(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_label_simplified

    const-string v2, "\u7e41"

    goto :goto_label

    :cond_label_simplified
    const-string v2, "\u7c21"

    :goto_label
    new-instance v0, Lnzv;

    invoke-direct {v0}, Lnzv;-><init>()V

    invoke-virtual {v0, p1}, Lnzv;->j(Loaa;)V

    new-instance v1, Lnxj;

    invoke-direct {v1}, Lnxj;-><init>()V

    sget-object v3, Lnxi;->c:Lnxi;

    iput-object v3, v1, Lnxj;->a:Lnxi;

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v4, v3

    iput-object v4, v1, Lnxj;->c:[Ljava/lang/String;

    const v2, -0x2719

    sget-object v4, Lnye;->b:Lnye;

    const-string v5, ""

    invoke-virtual {v1, v2, v4, v5}, Lnxj;->p(ILnye;Ljava/lang/Object;)V

    invoke-virtual {v1}, Lnxj;->c()Lnxl;

    move-result-object v1

    if-eqz v1, :cond_return_original

    invoke-virtual {v0, v1}, Lnzv;->q(Lnxl;)V

    invoke-virtual {v0}, Lnzv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loaa;

    if-eqz v0, :cond_return_original

    return-object v0

    :cond_return_original
    return-object p1
""".trimIndent()
