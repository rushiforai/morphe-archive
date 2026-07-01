package dev.jason.gboardpatches.patches.gboard.features.zhuyintraditionalsimplifiedtoggle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import dev.jason.gboardpatches.patches.gboard.shared.addHelperMethodIfMissing
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.indexOfFirstMethodCall

private const val OFI_CLASS = "Lofi;"
private const val SOFT_KEYBOARD_VIEW_CLASS =
    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;"
private const val BASIC_POPUP_VIEW_CLASS =
    "Lcom/google/android/libraries/inputmethod/popup/BasicPopupView;"

internal val gboardZhuyinTraditionalSimplifiedToggleRuntimePatch = bytecodePatch(
    description = "處理注音 ㄥ 上滑繁簡切換的 runtime 行為、可見鍵刷新與 popup 文案。"
) {
    execute {
        installOfiHelpers()
        patchSoftKeyboardView()
        patchBasicPopupView()
    }
}

context(context: BytecodePatchContext)
internal fun BytecodePatchContext.installZhuyinToggleOfiHelpers() = with(this) {
    addHelperMethodIfMissing(
        classType = OFI_CLASS,
        name = "jasondevDispatchOrToggle",
        parameterTypes = listOf("Lofk;", "Lnxi;", "Lnyf;", "Loaa;", "J", "Z", "Z", "I", "Z", "J", "I"),
        returnType = "V",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 18,
        body = OFI_DISPATCH_OR_TOGGLE_BODY
    )
    addHelperMethodIfMissing(
        classType = OFI_CLASS,
        name = "jasondevResolveInputMethodService",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "Landroid/inputmethodservice/InputMethodService;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 3,
        body = OFI_RESOLVE_IME_SERVICE_BODY
    )
    addHelperMethodIfMissing(
        classType = OFI_CLASS,
        name = "jasondevPatchVisibleToggleMetadata",
        parameterTypes = listOf("Loaa;", "Z"),
        returnType = "Loaa;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 8,
        body = OFI_PATCH_VISIBLE_TOGGLE_METADATA_BODY
    )
    addHelperMethodIfMissing(
        classType = OFI_CLASS,
        name = "jasondevRefreshVisibleToggleKey",
        parameterTypes = listOf("Loaa;", "J", "Z"),
        returnType = "V",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 8,
        body = OFI_REFRESH_VISIBLE_TOGGLE_KEY_BODY
    )
    addHelperMethodIfMissing(
        classType = OFI_CLASS,
        name = "jasondevMarkInputViewForReset",
        parameterTypes = listOf("Landroid/inputmethodservice/InputMethodService;"),
        returnType = "V",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 7,
        body = OFI_MARK_INPUT_VIEW_FOR_RESET_BODY
    )
    addHelperMethodIfMissing(
        classType = OFI_CLASS,
        name = "jasondevRefreshCurrentInputView",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "V",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 3,
        body = OFI_REFRESH_CURRENT_INPUT_VIEW_BODY
    )
}

context(context: BytecodePatchContext)
private fun installOfiHelpers() = with(context) {
    installZhuyinToggleOfiHelpers()
}

context(context: BytecodePatchContext)
private fun patchSoftKeyboardView() = with(context) {
    addHelperMethodIfMissing(
        classType = SOFT_KEYBOARD_VIEW_CLASS,
        name = "jasondevPatchTogglePopupMetadata",
        parameterTypes = listOf("Loaa;"),
        returnType = "Loaa;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 9,
        body = SOFT_KEYBOARD_VIEW_PATCH_TOGGLE_POPUP_METADATA_BODY
    )

    val mutableMethod = findMutableMethodOrThrow(
        classType = SOFT_KEYBOARD_VIEW_CLASS,
        name = "z",
        returnType = "V",
        parameterTypes = listOf("I", "Loaa;", "J")
    )
    mutableMethod.addInstructions(0, SOFT_KEYBOARD_VIEW_Z_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchBasicPopupView() = with(context) {
    addHelperMethodIfMissing(
        classType = BASIC_POPUP_VIEW_CLASS,
        name = "jasondevResolveTogglePopupLabel",
        parameterTypes = listOf("Landroid/view/View;", "Lnxi;"),
        returnType = "Ljava/lang/String;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 7,
        body = BASIC_POPUP_VIEW_RESOLVE_TOGGLE_POPUP_LABEL_BODY
    )
    addHelperMethodIfMissing(
        classType = BASIC_POPUP_VIEW_CLASS,
        name = "jasondevSelectPopupLabel",
        parameterTypes = listOf("Landroid/view/View;", "Lnxi;", "Ljava/lang/String;"),
        returnType = "Ljava/lang/String;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 5,
        body = BASIC_POPUP_VIEW_SELECT_POPUP_LABEL_BODY
    )

    val mutableMethod = findMutableMethodOrThrow(
        classType = BASIC_POPUP_VIEW_CLASS,
        name = "b",
        returnType = "Lnyf;",
        parameterTypes = listOf(
            "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;",
            "Landroid/view/View;",
            "F",
            "F",
            "Lnxl;",
            "[I",
            "Z"
        )
    )

    mutableMethod.addInstructions(0, BASIC_POPUP_VIEW_B_PRESERVE_VIEW)

    val popupActionIndex = mutableMethod.indexOfFirstMethodCall(
        definingClass = "Lnxl;",
        name = "a",
        returnType = "I",
        parameterTypes = listOf("I")
    )
    check(popupActionIndex >= 0) { "Unable to find Lnxl.a(I) anchor in BasicPopupView.b" }

    val overrideAnchorIndex = popupActionIndex + 4
    check(overrideAnchorIndex < mutableMethod.implementation!!.instructions.size) {
        "Computed BasicPopupView override anchor is out of bounds"
    }
    mutableMethod.addInstructions(overrideAnchorIndex + 1, BASIC_POPUP_VIEW_B_OVERRIDE)
}

private val OFI_F_DELEGATE_INSTRUCTIONS = """
    invoke-direct/range {p0 .. p13}, Lofi;->jasondevDispatchOrToggle(Lofk;Lnxi;Lnyf;Loaa;JZZIZJI)V

    return-void
""".trimIndent()

private val OFI_DISPATCH_OR_TOGGLE_BODY = """
    sget-object v0, Lnxi;->c:Lnxi;

    if-ne p2, v0, :cond_0

    if-eqz p4, :cond_0

    iget v0, p4, Loaa;->c:I

    const v1, 0x7f0b23fd

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lofi;->c:Landroid/content/Context;

    if-eqz v0, :cond_0

    invoke-static {v0}, Loql;->O(Landroid/content/Context;)Loql;

    move-result-object v1

    const v2, 0x7f140969

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, v2}, Loql;->au(Ljava/lang/String;)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    invoke-virtual {v1, v2, v3}, Loql;->f(Ljava/lang/String;Z)V

    invoke-static {v0}, Lofi;->jasondevRefreshCurrentInputView(Landroid/content/Context;)V

    move-object v0, p4

    move-wide v1, p11

    invoke-direct {p0, v0, v1, v2, v3}, Lofi;->jasondevRefreshVisibleToggleKey(Loaa;JZ)V

    return-void

    :cond_0
    iget-object p0, p0, Lofi;->o:Lofg;

    invoke-interface/range {p0 .. p13}, Lofg;->o(Lofk;Lnxi;Lnyf;Loaa;JZZIZJI)V

    return-void
""".trimIndent()

private val OFI_RESOLVE_IME_SERVICE_BODY = """
    const/4 v0, 0x0

    :goto_0
    if-eqz p0, :cond_1

    const/16 v1, 0xc

    if-ge v0, v1, :cond_1

    instance-of v1, p0, Landroid/inputmethodservice/InputMethodService;

    if-eqz v1, :cond_0

    check-cast p0, Landroid/inputmethodservice/InputMethodService;

    return-object p0

    :cond_0
    instance-of v1, p0, Landroid/content/ContextWrapper;

    if-eqz v1, :cond_1

    check-cast p0, Landroid/content/ContextWrapper;

    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
""".trimIndent()

private val OFI_PATCH_VISIBLE_TOGGLE_METADATA_BODY = """
    if-eqz p0, :cond_return_original

    new-instance v0, Lnzv;

    invoke-direct {v0}, Lnzv;-><init>()V

    invoke-virtual {v0, p0}, Lnzv;->j(Loaa;)V

    new-instance v1, Lnxj;

    invoke-direct {v1}, Lnxj;-><init>()V

    sget-object v2, Lnxi;->c:Lnxi;

    iput-object v2, v1, Lnxj;->a:Lnxi;

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz p1, :cond_label_simplified

    const-string v4, "\u7e41"

    goto :goto_label

    :cond_label_simplified
    const-string v4, "\u7c21"

    :goto_label
    aput-object v4, v3, v2

    iput-object v3, v1, Lnxj;->c:[Ljava/lang/String;

    const v3, -0x2719

    sget-object v4, Lnye;->b:Lnye;

    const-string v5, ""

    invoke-virtual {v1, v3, v4, v5}, Lnxj;->p(ILnye;Ljava/lang/Object;)V

    invoke-virtual {v1}, Lnxj;->c()Lnxl;

    move-result-object v1

    if-eqz v1, :cond_return_original

    invoke-virtual {v0, v1}, Lnzv;->q(Lnxl;)V

    invoke-virtual {v0}, Lnzv;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Loaa;

    return-object p0

    :cond_return_original
    return-object p0
""".trimIndent()

private val OFI_REFRESH_VISIBLE_TOGGLE_KEY_BODY = """
    if-nez p1, :cond_have_metadata

    return-void

    :cond_have_metadata
    iget-object v0, p0, Lofi;->q:Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;

    if-nez v0, :cond_have_keyboard

    return-void

    :cond_have_keyboard
    invoke-static {p1, p4}, Lofi;->jasondevPatchVisibleToggleMetadata(Loaa;Z)Loaa;

    move-result-object p1

    if-nez p1, :cond_have_patched

    return-void

    :cond_have_patched
    iget v1, p1, Loaa;->c:I

    if-nez v1, :cond_have_key_id

    return-void

    :cond_have_key_id
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p2, p3}, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;->z(ILoaa;J)V

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;->z(ILoaa;J)V

    return-void
""".trimIndent()

private val OFI_MARK_INPUT_VIEW_FOR_RESET_BODY = """
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "ao"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    new-array v1, v2, [Ljava/lang/Object;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    aput-object v2, v1, v5

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    return-void
""".trimIndent()

private val OFI_REFRESH_CURRENT_INPUT_VIEW_BODY = """
    invoke-static {p0}, Lofi;->jasondevResolveInputMethodService(Landroid/content/Context;)Landroid/inputmethodservice/InputMethodService;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/inputmethodservice/InputMethodService;->getCurrentInputEditorInfo()Landroid/view/inputmethod/EditorInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-static {p0}, Lofi;->jasondevMarkInputViewForReset(Landroid/inputmethodservice/InputMethodService;)V

    invoke-virtual {p0, v0, v1}, Landroid/inputmethodservice/InputMethodService;->onStartInput(Landroid/view/inputmethod/EditorInfo;Z)V

    invoke-virtual {p0, v0, v1}, Landroid/inputmethodservice/InputMethodService;->onStartInputView(Landroid/view/inputmethod/EditorInfo;Z)V

    :cond_0
    return-void
""".trimIndent()

private val SOFT_KEYBOARD_VIEW_Z_DELEGATE = """
    invoke-direct {p0, p2}, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;->jasondevPatchTogglePopupMetadata(Loaa;)Loaa;

    move-result-object p2
""".trimIndent()

private val SOFT_KEYBOARD_VIEW_PATCH_TOGGLE_POPUP_METADATA_BODY = """
    if-eqz p1, :cond_return_original

    iget v0, p1, Loaa;->c:I

    const v1, 0x7f0b23fd

    if-ne v0, v1, :cond_return_original

    invoke-virtual {p0}, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_return_original

    invoke-static {v0}, Loql;->O(Landroid/content/Context;)Loql;

    move-result-object v1

    const v2, 0x7f140969

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_return_original

    invoke-virtual {v1, v0}, Loql;->au(Ljava/lang/String;)Z

    move-result v0

    new-instance v1, Lnzv;

    invoke-direct {v1}, Lnzv;-><init>()V

    invoke-virtual {v1, p1}, Lnzv;->j(Loaa;)V

    sget-object v2, Lnxi;->c:Lnxi;

    invoke-virtual {p1, v2}, Loaa;->a(Lnxi;)Lnxl;

    move-result-object v3

    new-instance v4, Lnxj;

    invoke-direct {v4}, Lnxj;-><init>()V

    if-eqz v3, :cond_prepare_action

    invoke-virtual {v4, v3}, Lnxj;->k(Lnxl;)V

    :cond_prepare_action
    iput-object v2, v4, Lnxj;->a:Lnxi;

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz v0, :cond_label_simplified

    const-string v0, "\u7e41"

    goto :goto_label

    :cond_label_simplified
    const-string v0, "\u7c21"

    :goto_label
    aput-object v0, v3, v2

    iput-object v3, v4, Lnxj;->c:[Ljava/lang/String;

    const v0, -0x2719

    sget-object v2, Lnye;->b:Lnye;

    const-string v3, ""

    invoke-virtual {v4, v0, v2, v3}, Lnxj;->p(ILnye;Ljava/lang/Object;)V

    invoke-virtual {v4}, Lnxj;->c()Lnxl;

    move-result-object v0

    if-eqz v0, :cond_return_original

    invoke-virtual {v1, v0}, Lnzv;->q(Lnxl;)V

    invoke-virtual {v1}, Lnzv;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Loaa;

    if-eqz p0, :cond_return_original

    return-object p0

    :cond_return_original
    return-object p1
""".trimIndent()

private val BASIC_POPUP_VIEW_B_PRESERVE_VIEW = """
    move-object v0, p2
""".trimIndent()

private val BASIC_POPUP_VIEW_B_OVERRIDE = """
    invoke-direct {p0, v0, p5, p4}, Lcom/google/android/libraries/inputmethod/popup/BasicPopupView;->jasondevSelectPopupLabel(Landroid/view/View;Lnxi;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4
""".trimIndent()

private val BASIC_POPUP_VIEW_RESOLVE_TOGGLE_POPUP_LABEL_BODY = """
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    instance-of v0, p1, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;

    iget-object v0, p1, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;->e:Loaa;

    if-eqz v0, :cond_1

    iget v0, v0, Loaa;->c:I

    const v1, 0x7f0b23fd

    if-ne v0, v1, :cond_1

    sget-object v1, Lnxi;->c:Lnxi;

    if-ne p2, v1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/libraries/inputmethod/popup/BasicPopupView;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {v0}, Loql;->O(Landroid/content/Context;)Loql;

    move-result-object v1

    const v2, 0x7f140969

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v1, v0}, Loql;->au(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "\u7e41"

    return-object p0

    :cond_0
    const-string p0, "\u7c21"

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
""".trimIndent()

private val BASIC_POPUP_VIEW_SELECT_POPUP_LABEL_BODY = """
    invoke-direct {p0, p1, p2}, Lcom/google/android/libraries/inputmethod/popup/BasicPopupView;->jasondevResolveTogglePopupLabel(Landroid/view/View;Lnxi;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_return_original

    return-object p0

    :cond_return_original
    return-object p3
""".trimIndent()
