package dev.jason.gboardpatches.patches.gboard.features.englishqwerty

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import dev.jason.gboardpatches.patches.gboard.features.toprowswipe.TOP_ROW_SWIPE_RUNTIME_CLASS
import dev.jason.gboardpatches.patches.gboard.shared.addHelperMethodIfMissing
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.indexOfFirstMethodCall
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

private const val SOFT_KEY_VIEW_CLASS =
    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"
private val ENGLISH_UPPERCASE_RUNTIME_CLASS = RuntimeAbiCatalog.abi(
    RuntimeCallId.ENGLISH_UPPERCASE_TOGGLE_RUNTIME_IS_ENABLED,
).owner
private val softKeyMetadataType = GboardVersionBindings.softKeyMetadataType.descriptor

internal val gboardEnglishQwertySoftKeyPatch = bytecodePatch(
    description = "在 17.7.7 English QWERTY bind time 注入缺少的上滑大小寫 action。"
) {
    execute {
        addHelperMethods()
        injectMethodDelegate()
    }
}

context(context: BytecodePatchContext)
private fun addHelperMethods() = with(context) {
    addHelperMethodIfMissing(
        classType = SOFT_KEY_VIEW_CLASS,
        name = "jasondevToggleAsciiCase",
        parameterTypes = listOf("Ljava/lang/String;"),
        returnType = "Ljava/lang/String;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 3,
        body = TOGGLE_ASCII_CASE_BODY
    )
    addHelperMethodIfMissing(
        classType = SOFT_KEY_VIEW_CLASS,
        name = "jasondevResolvePrimaryLabel",
        parameterTypes = listOf(softKeyMetadataType),
        returnType = "Ljava/lang/String;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 6,
        body = RESOLVE_PRIMARY_LABEL_BODY
    )
    addHelperMethodIfMissing(
        classType = SOFT_KEY_VIEW_CLASS,
        name = "jasondevResolvePressPayload",
        parameterTypes = listOf(softKeyMetadataType),
        returnType = "Ljava/lang/String;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 7,
        body = RESOLVE_PRESS_PAYLOAD_BODY
    )
    addHelperMethodIfMissing(
        classType = SOFT_KEY_VIEW_CLASS,
        name = "jasondevIsEnglishQwertyKeyId",
        parameterTypes = listOf("I"),
        returnType = "Z",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 2,
        body = IS_ENGLISH_QWERTY_KEY_ID_BODY
    )
    addHelperMethodIfMissing(
        classType = SOFT_KEY_VIEW_CLASS,
        name = "jasondevPatchIncomingMetadata",
        parameterTypes = listOf(softKeyMetadataType),
        returnType = softKeyMetadataType,
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 16,
        body = PATCH_INCOMING_METADATA_BODY
    )
}

context(context: BytecodePatchContext)
private fun injectMethodDelegate() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(GboardVersionBindings.softKeyBind)
    val topRowDelegateCallIndex = mutableMethod.indexOfFirstMethodCall(
        definingClass = TOP_ROW_SWIPE_RUNTIME_CLASS,
        name = "patchIncomingSoftKeyMetadata",
        returnType = "Ljava/lang/Object;",
        parameterTypes = listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
    )
    val insertIndex = if (topRowDelegateCallIndex >= 0) {
        topRowDelegateCallIndex + 3
    } else {
        0
    }

    mutableMethod.addInstructions(insertIndex, PATCH_INCOMING_METADATA_DELEGATE)
}

private val PATCH_INCOMING_METADATA_DELEGATE = """
    invoke-direct {p0, p1}, $SOFT_KEY_VIEW_CLASS->jasondevPatchIncomingMetadata($softKeyMetadataType)$softKeyMetadataType

    move-result-object p1
""".trimIndent()

private val TOGGLE_ASCII_CASE_BODY = """
    if-eqz p0, :cond_invalid

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_invalid

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x61

    if-lt v0, v1, :cond_uppercase

    const/16 v1, 0x7a

    if-gt v0, v1, :cond_uppercase

    add-int/lit8 v0, v0, -0x20

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_uppercase
    const/16 v1, 0x41

    if-lt v0, v1, :cond_invalid

    const/16 v1, 0x5a

    if-gt v0, v1, :cond_invalid

    add-int/lit8 v0, v0, 0x20

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_invalid
    const/4 p0, 0x0

    return-object p0
""".trimIndent()

private val RESOLVE_PRIMARY_LABEL_BODY = """
    if-eqz p0, :cond_none

    iget-object p0, p0, Lowd;->g:[Ljava/lang/CharSequence;

    if-eqz p0, :cond_none

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_none

    aget-object v2, p0, v1

    if-eqz v2, :cond_next

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_next

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_next

    return-object v2

    :cond_next
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_none
    const/4 p0, 0x0

    return-object p0
""".trimIndent()

private val RESOLVE_PRESS_PAYLOAD_BODY = """
    if-eqz p0, :cond_none

    sget-object v0, Loth;->a:Loth;

    invoke-virtual {p0, v0}, Lowd;->h(Loth;)Lotk;

    move-result-object v0

    if-eqz v0, :cond_none

    iget-object v0, v0, Lotk;->d:[Loud;

    if-eqz v0, :cond_none

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_none

    aget-object v3, v0, v2

    if-eqz v3, :cond_next

    iget-object v3, v3, Loud;->e:Ljava/lang/Object;

    instance-of v4, v3, Ljava/lang/CharSequence;

    if-eqz v4, :cond_next

    check-cast v3, Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_next

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_next

    return-object v3

    :cond_next
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_none
    const/4 p0, 0x0

    return-object p0
""".trimIndent()

private val IS_ENGLISH_QWERTY_KEY_ID_BODY = """
    sparse-switch p0, :sswitch_data_0

    const/4 p0, 0x0

    return p0

    :sswitch_0
    const/4 p0, 0x1

    return p0

    :sswitch_data_0
    .sparse-switch
        0x7f0b19f6 -> :sswitch_0
        0x7f0b18df -> :sswitch_0
        0x7f0b1a66 -> :sswitch_0
        0x7f0b190d -> :sswitch_0
        0x7f0b196d -> :sswitch_0
        0x7f0b187b -> :sswitch_0
        0x7f0b19fa -> :sswitch_0
        0x7f0b18e0 -> :sswitch_0
        0x7f0b1a2d -> :sswitch_0
        0x7f0b18ee -> :sswitch_0
        0x7f0b1a6e -> :sswitch_0
        0x7f0b1911 -> :sswitch_0
        0x7f0b1a4e -> :sswitch_0
        0x7f0b18f8 -> :sswitch_0
        0x7f0b199c -> :sswitch_0
        0x7f0b18a0 -> :sswitch_0
        0x7f0b19d9 -> :sswitch_0
        0x7f0b18c8 -> :sswitch_0
        0x7f0b19ef -> :sswitch_0
        0x7f0b18dd -> :sswitch_0
        0x7f0b193c -> :sswitch_0
        0x7f0b185e -> :sswitch_0
        0x7f0b1a05 -> :sswitch_0
        0x7f0b18e5 -> :sswitch_0
        0x7f0b195f -> :sswitch_0
        0x7f0b1876 -> :sswitch_0
        0x7f0b1983 -> :sswitch_0
        0x7f0b188e -> :sswitch_0
        0x7f0b1987 -> :sswitch_0
        0x7f0b1890 -> :sswitch_0
        0x7f0b1996 -> :sswitch_0
        0x7f0b189b -> :sswitch_0
        0x7f0b19ad -> :sswitch_0
        0x7f0b18b1 -> :sswitch_0
        0x7f0b19b1 -> :sswitch_0
        0x7f0b18b3 -> :sswitch_0
        0x7f0b19b9 -> :sswitch_0
        0x7f0b18b7 -> :sswitch_0
        0x7f0b1a75 -> :sswitch_0
        0x7f0b1915 -> :sswitch_0
        0x7f0b1a6b -> :sswitch_0
        0x7f0b1910 -> :sswitch_0
        0x7f0b1951 -> :sswitch_0
        0x7f0b186f -> :sswitch_0
        0x7f0b1a63 -> :sswitch_0
        0x7f0b190b -> :sswitch_0
        0x7f0b194c -> :sswitch_0
        0x7f0b186d -> :sswitch_0
        0x7f0b19cd -> :sswitch_0
        0x7f0b18bf -> :sswitch_0
        0x7f0b19c6 -> :sswitch_0
        0x7f0b18bb -> :sswitch_0
    .end sparse-switch
""".trimIndent()

private val PATCH_INCOMING_METADATA_BODY = """
    if-eqz p1, :cond_return_original

    :try_start_0
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ENGLISH_UPPERCASE_TOGGLE_RUNTIME_IS_ENABLED, "")}

    move-result v0

    if-eqz v0, :cond_return_original_safe

    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ENGLISH_UPPERCASE_TOGGLE_RUNTIME_IS_PATCHED_METADATA,
        "p1",
    )}

    move-result v0

    if-nez v0, :cond_return_original_safe

    iget v0, p1, Lowd;->d:I

    invoke-static {v0}, $SOFT_KEY_VIEW_CLASS->jasondevIsEnglishQwertyKeyId(I)Z

    move-result v0

    if-eqz v0, :cond_return_original_safe

    sget-object v0, Loth;->c:Loth;

    invoke-virtual {p1, v0}, Lowd;->h(Loth;)Lotk;

    move-result-object v0

    if-nez v0, :cond_return_original_safe

    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ENGLISH_UPPERCASE_TOGGLE_RUNTIME_GET_CACHED_PATCHED_METADATA,
        "p1",
    )}

    move-result-object v0

    if-eqz v0, :cond_cache_miss

    check-cast v0, Lowd;

    return-object v0

    :cond_cache_miss

    invoke-static {p1}, $SOFT_KEY_VIEW_CLASS->jasondevResolvePrimaryLabel(Lowd;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, $SOFT_KEY_VIEW_CLASS->jasondevResolvePressPayload(Lowd;)Ljava/lang/String;

    move-result-object v2

    if-nez v1, :cond_have_base_label

    move-object v1, v2

    :cond_have_base_label
    invoke-static {v1}, $SOFT_KEY_VIEW_CLASS->jasondevToggleAsciiCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_return_original_safe

    if-eqz v2, :cond_build_action

    invoke-static {v2}, $SOFT_KEY_VIEW_CLASS->jasondevToggleAsciiCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_return_original_safe

    :cond_build_action
    new-instance v4, Lovv;

    invoke-direct {v4}, Lovv;-><init>()V

    invoke-virtual {v4, p1}, Lovv;->j(Lowd;)V

    new-instance v5, Loti;

    invoke-direct {v5}, Loti;-><init>()V

    sget-object v6, Loth;->c:Loth;

    iput-object v6, v5, Loti;->a:Loth;

    const/4 v6, 0x1

    new-array v7, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v3, v7, v6

    iput-object v7, v5, Loti;->c:[Ljava/lang/String;

    const v7, -0x2719

    sget-object v8, Louc;->c:Louc;

    invoke-virtual {v5, v7, v8, v3}, Loti;->q(ILouc;Ljava/lang/Object;)V

    invoke-virtual {v5}, Loti;->c()Lotk;

    move-result-object v5

    if-eqz v5, :cond_return_original_safe

    invoke-virtual {v4, v5}, Lovv;->q(Lotk;)V

    invoke-virtual {v4}, Lovv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lowd;

    if-eqz v0, :cond_return_original_safe

    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ENGLISH_UPPERCASE_TOGGLE_RUNTIME_CACHE_PATCHED_METADATA,
        "p1, v0",
    )}

    move-result-object v0

    check-cast v0, Lowd;

    if-eqz v0, :cond_return_original_safe

    return-object v0

    :cond_return_original_safe
    return-object p1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_return_original
    return-object p1

    :catch_0
    return-object p1
""".trimIndent()
