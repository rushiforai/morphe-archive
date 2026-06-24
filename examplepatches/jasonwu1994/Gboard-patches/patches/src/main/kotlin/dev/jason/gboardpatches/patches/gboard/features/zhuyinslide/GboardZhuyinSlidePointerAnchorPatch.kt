package dev.jason.gboardpatches.patches.gboard.features.zhuyinslide

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import dev.jason.gboardpatches.patches.gboard.shared.addFieldIfMissing
import dev.jason.gboardpatches.patches.gboard.shared.addHelperMethodIfMissing
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.indexOfFirstMethodCall

private const val OFK_CLASS = "Lofk;"
private const val ANCHOR_FIELD_NAME = "jasondevAnchorKey"
private const val ANCHOR_FIELD_TYPE = "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"
private const val RESOLVE_ANCHOR_METHOD_NAME = "jasondevResolveAnchoredKey"
private const val IS_ZHUYIN_METADATA_METHOD_NAME = "jasondevIsZhuyinMetadata"

internal val gboardZhuyinSlidePointerAnchorPatch = bytecodePatch(
    description = "讓注音垂直滑動在手勢期間固定錨定起始 SoftKeyView。"
) {
    execute {
        ensurePointerAnchorField()
        ensurePointerAnchorMetadataHelper()
        ensurePointerAnchorHelper()
        injectPointerAnchorGuard()
    }
}

context(context: BytecodePatchContext)
private fun ensurePointerAnchorField() = with(context) {
    addFieldIfMissing(
        classType = OFK_CLASS,
        fieldName = ANCHOR_FIELD_NAME,
        fieldType = ANCHOR_FIELD_TYPE,
        accessFlags = AccessFlags.PRIVATE.value
    )
}

context(context: BytecodePatchContext)
private fun ensurePointerAnchorMetadataHelper() = with(context) {
    addHelperMethodIfMissing(
        classType = OFK_CLASS,
        name = IS_ZHUYIN_METADATA_METHOD_NAME,
        parameterTypes = listOf("Loaa;"),
        returnType = "Z",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 5,
        body = IS_ZHUYIN_METADATA_BODY
    )
}

context(context: BytecodePatchContext)
private fun ensurePointerAnchorHelper() = with(context) {
    addHelperMethodIfMissing(
        classType = OFK_CLASS,
        name = RESOLVE_ANCHOR_METHOD_NAME,
        parameterTypes = listOf(ANCHOR_FIELD_TYPE, ANCHOR_FIELD_TYPE, "F", "F"),
        returnType = ANCHOR_FIELD_TYPE,
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 9,
        body = RESOLVE_POINTER_ANCHOR_BODY
    )
}

context(context: BytecodePatchContext)
private fun injectPointerAnchorGuard() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = OFK_CLASS,
        name = "B",
        returnType = "V",
        parameterTypes = listOf(
            "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;",
            "F",
            "F",
            "J",
            "I"
        )
    )

    val insertIndex = mutableMethod.indexOfFirstMethodCall(
        definingClass = OFK_CLASS,
        name = "ac",
        returnType = "V",
        parameterTypes = emptyList()
    )
    check(insertIndex >= 0) { "Unable to find Lofk->ac() call inside Lofk->B" }

    mutableMethod.addInstructions(insertIndex + 1, POINTER_ANCHOR_DELEGATE)
}

private val POINTER_ANCHOR_DELEGATE = """
    invoke-direct {p0, p1, v3, v0, v1}, Lofk;->jasondevResolveAnchoredKey(Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;FF)Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;

    move-result-object p1
""".trimIndent()

private val RESOLVE_POINTER_ANCHOR_BODY = """
    if-eqz p2, :cond_use_hit_or_saved

    move-object v0, p2

    goto :cond_have_candidate

    :cond_use_hit_or_saved
    if-eqz p1, :cond_use_saved_anchor

    move-object v0, p1

    goto :cond_have_candidate

    :cond_use_saved_anchor
    iget-object v0, p0, Lofk;->jasondevAnchorKey:Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;

    :cond_have_candidate
    if-eqz v0, :cond_return_original

    iget-object v1, v0, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;->e:Loaa;

    if-eqz v1, :cond_return_original

    invoke-static {v1}, Lofk;->jasondevIsZhuyinMetadata(Loaa;)Z

    move-result v2

    if-eqz v2, :cond_return_original

    iput-object v0, p0, Lofk;->jasondevAnchorKey:Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;

    invoke-virtual {p0}, Lofk;->i()Lnxi;

    move-result-object v2

    invoke-virtual {p0, p3, p4, v2}, Lofk;->h(FFLnxi;)Lnxi;

    move-result-object v2

    if-eqz v2, :cond_return_original

    sget-object v3, Lnxi;->c:Lnxi;

    if-eq v2, v3, :cond_check_vertical_action

    sget-object v3, Lnxi;->d:Lnxi;

    if-ne v2, v3, :cond_return_original

    :cond_check_vertical_action
    invoke-virtual {v1, v2}, Loaa;->a(Lnxi;)Lnxl;

    move-result-object v1

    if-eqz v1, :cond_return_original

    return-object v0

    :cond_return_original
    return-object p1
""".trimIndent()

private val IS_ZHUYIN_METADATA_BODY = """
    if-eqz p0, :cond_false

    iget-object p0, p0, Loaa;->n:[Ljava/lang/CharSequence;

    if-eqz p0, :cond_false

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_false

    aget-object v2, p0, v1

    if-eqz v2, :cond_next

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_next

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_next

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x3105

    if-lt v2, v3, :cond_check_tone_marks

    const/16 v3, 0x3129

    if-le v2, v3, :cond_true

    :cond_check_tone_marks
    const/16 v3, 0x2c7

    if-eq v2, v3, :cond_true

    const/16 v3, 0x2ca

    if-eq v2, v3, :cond_true

    const/16 v3, 0x2cb

    if-eq v2, v3, :cond_true

    const/16 v3, 0x2d9

    if-eq v2, v3, :cond_true

    :cond_next
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_true
    const/4 p0, 0x1

    return p0

    :cond_false
    const/4 p0, 0x0

    return p0
""".trimIndent()
