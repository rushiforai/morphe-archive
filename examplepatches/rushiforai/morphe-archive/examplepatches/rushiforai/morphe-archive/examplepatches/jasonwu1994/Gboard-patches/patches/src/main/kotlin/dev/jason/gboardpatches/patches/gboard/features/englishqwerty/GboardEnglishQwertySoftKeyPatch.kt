package dev.jason.gboardpatches.patches.gboard.features.englishqwerty

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import dev.jason.gboardpatches.patches.gboard.shared.addHelperMethodIfMissing
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow

private const val SOFT_KEY_VIEW_CLASS =
    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"
private const val ENGLISH_UPPERCASE_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/keyboard/GboardEnglishUppercaseToggleRuntime;"

internal val gboardEnglishQwertySoftKeyPatch = bytecodePatch(
    description = "將英文 QWERTY 的 SoftKeyView metadata 收斂成上滑大小寫切換。"
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
        parameterTypes = listOf("Loaa;"),
        returnType = "Ljava/lang/String;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 7,
        body = RESOLVE_PRIMARY_LABEL_BODY
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
        parameterTypes = listOf("Loaa;"),
        returnType = "Loaa;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 16,
        body = PATCH_INCOMING_METADATA_BODY
    )
    addHelperMethodIfMissing(
        classType = SOFT_KEY_VIEW_CLASS,
        name = "jasondevIsEnglishUppercaseToggleEnabled",
        parameterTypes = emptyList(),
        returnType = "Z",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 1,
        body = IS_ENGLISH_UPPERCASE_TOGGLE_ENABLED_BODY
    )
    addHelperMethodIfMissing(
        classType = SOFT_KEY_VIEW_CLASS,
        name = "jasondevStripSlideUpAction",
        parameterTypes = listOf("Loaa;"),
        returnType = "Loaa;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 8,
        body = STRIP_SLIDE_UP_ACTION_BODY
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

    mutableMethod.addInstructions(0, PATCH_INCOMING_METADATA_DELEGATE)
}

private val PATCH_INCOMING_METADATA_DELEGATE = """
    invoke-direct {p0, p1}, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;->jasondevPatchIncomingMetadata(Loaa;)Loaa;

    move-result-object p1
""".trimIndent()

private val TOGGLE_ASCII_CASE_BODY = """
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    goto :cond_2

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x61

    if-lt v0, v1, :cond_1

    const/16 v1, 0x7a

    if-gt v0, v1, :cond_1

    add-int/lit8 v0, v0, -0x20

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    const/16 v1, 0x41

    if-lt v0, v1, :cond_2

    const/16 v1, 0x5a

    if-gt v0, v1, :cond_2

    add-int/lit8 v0, v0, 0x20

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
""".trimIndent()

private val RESOLVE_PRIMARY_LABEL_BODY = """
    if-eqz p0, :cond_2

    iget-object v0, p0, Loaa;->o:[I

    if-eqz v0, :cond_2

    iget-object p0, p0, Loaa;->n:[Ljava/lang/CharSequence;

    if-eqz p0, :cond_2

    array-length v1, v0

    array-length v2, p0

    if-gt v1, v2, :cond_0

    move v2, v1

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_2

    aget v3, v0, v1

    const v4, 0x7f0b0607

    if-ne v3, v4, :cond_1

    aget-object v3, p0, v1

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-gtz v5, :cond_return_label

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_return_label
    return-object v4

    :cond_2
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
        0x7f0b1819 -> :sswitch_0
        0x7f0b1828 -> :sswitch_0
        0x7f0b182a -> :sswitch_0
        0x7f0b1831 -> :sswitch_0
        0x7f0b1836 -> :sswitch_0
        0x7f0b1848 -> :sswitch_0
        0x7f0b184a -> :sswitch_0
        0x7f0b1855 -> :sswitch_0
        0x7f0b185a -> :sswitch_0
        0x7f0b186b -> :sswitch_0
        0x7f0b186d -> :sswitch_0
        0x7f0b1871 -> :sswitch_0
        0x7f0b1875 -> :sswitch_0
        0x7f0b1879 -> :sswitch_0
        0x7f0b1882 -> :sswitch_0
        0x7f0b1897 -> :sswitch_0
        0x7f0b1899 -> :sswitch_0
        0x7f0b189a -> :sswitch_0
        0x7f0b189e -> :sswitch_0
        0x7f0b18a7 -> :sswitch_0
        0x7f0b18b1 -> :sswitch_0
        0x7f0b18c4 -> :sswitch_0
        0x7f0b18c6 -> :sswitch_0
        0x7f0b18c9 -> :sswitch_0
        0x7f0b18ca -> :sswitch_0
        0x7f0b18ce -> :sswitch_0
        0x7f0b18f5 -> :sswitch_0
        0x7f0b1905 -> :sswitch_0
        0x7f0b190a -> :sswitch_0
        0x7f0b1917 -> :sswitch_0
        0x7f0b1924 -> :sswitch_0
        0x7f0b193a -> :sswitch_0
        0x7f0b193e -> :sswitch_0
        0x7f0b194d -> :sswitch_0
        0x7f0b1953 -> :sswitch_0
        0x7f0b1964 -> :sswitch_0
        0x7f0b1968 -> :sswitch_0
        0x7f0b1970 -> :sswitch_0
        0x7f0b197c -> :sswitch_0
        0x7f0b1982 -> :sswitch_0
        0x7f0b198e -> :sswitch_0
        0x7f0b19a4 -> :sswitch_0
        0x7f0b19aa -> :sswitch_0
        0x7f0b19ad -> :sswitch_0
        0x7f0b19b7 -> :sswitch_0
        0x7f0b19df -> :sswitch_0
        0x7f0b19ff -> :sswitch_0
        0x7f0b1a14 -> :sswitch_0
        0x7f0b1a17 -> :sswitch_0
        0x7f0b1a1b -> :sswitch_0
        0x7f0b1a1e -> :sswitch_0
        0x7f0b1a24 -> :sswitch_0
    .end sparse-switch
""".trimIndent()

private val IS_ENGLISH_UPPERCASE_TOGGLE_ENABLED_BODY = """
    invoke-static {}, $ENGLISH_UPPERCASE_RUNTIME_CLASS->isEnabled()Z

    move-result v0

    return v0
""".trimIndent()

private val STRIP_SLIDE_UP_ACTION_BODY = """
    if-eqz p0, :cond_return_original

    new-instance v0, Lnzv;

    invoke-direct {v0}, Lnzv;-><init>()V

    invoke-virtual {v0, p0}, Lnzv;->j(Loaa;)V

    iget-object v1, v0, Lnzv;->b:Ljava/util/EnumMap;

    sget-object v2, Lnxi;->c:Lnxi;

    invoke-virtual {v1, v2}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lnzv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loaa;

    if-eqz v0, :cond_return_original

    return-object v0

    :cond_return_original
    return-object p0
""".trimIndent()

private val PATCH_INCOMING_METADATA_BODY = """
    if-eqz p1, :cond_return_original

    :try_start_0
    iget v0, p1, Loaa;->c:I

    invoke-static {v0}, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;->jasondevIsEnglishQwertyKeyId(I)Z

    move-result v0

    if-eqz v0, :cond_return_original_safe

    invoke-static {}, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;->jasondevIsEnglishUppercaseToggleEnabled()Z

    move-result v3

    if-nez v3, :cond_toggle_enabled

    invoke-static {p1}, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;->jasondevStripSlideUpAction(Loaa;)Loaa;

    move-result-object v0

    if-eqz v0, :cond_return_original_safe

    return-object v0

    :cond_toggle_enabled

    invoke-static {p1}, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;->jasondevResolvePrimaryLabel(Loaa;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_return_original_safe

    invoke-static {v1}, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;->jasondevToggleAsciiCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_return_original_safe

    new-instance v4, Lnzv;

    invoke-direct {v4}, Lnzv;-><init>()V

    invoke-virtual {v4, p1}, Lnzv;->j(Loaa;)V

    new-instance v5, Lnxj;

    invoke-direct {v5}, Lnxj;-><init>()V

    sget-object v6, Lnxi;->c:Lnxi;

    iput-object v6, v5, Lnxj;->a:Lnxi;

    const/4 v6, 0x1

    new-array v7, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v2, v7, v6

    iput-object v7, v5, Lnxj;->c:[Ljava/lang/String;

    const v7, -0x2719

    sget-object v8, Lnye;->b:Lnye;

    invoke-virtual {v5, v7, v8, v2}, Lnxj;->p(ILnye;Ljava/lang/Object;)V

    invoke-virtual {v5}, Lnxj;->c()Lnxl;

    move-result-object v5

    if-eqz v5, :cond_return_original_safe

    invoke-virtual {v4, v5}, Lnzv;->q(Lnxl;)V

    invoke-virtual {v4}, Lnzv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loaa;

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
