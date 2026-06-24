package dev.jason.gboardpatches.patches.gboard.features.addsymbols

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.instructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.indexOfFirstFieldAccess

private const val EMOTICON_KEYBOARD_CLASS =
    "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;"
private const val EMOTICON_HEADER_CALLBACK_CLASS = "Lfhj;"
private const val HEADER_VIEW_CLASS =
    "Lcom/google/android/apps/inputmethod/libs/expression/header/ConstraintHeaderViewImpl;"
private const val VIEW_UTIL_CLASS = "Lqzu;"

internal val gboardZhuyinCustomSymbolsEmoticonStatePatch = bytecodePatch(
    description = "移植 add-symbols 的 emoticon host / state isolation / header 主線。"
) {
    dependsOn(gboardZhuyinCustomSymbolsExtensionPatch)

    execute {
        patchConstructor()
        patchBodyReady()
        patchCategoryNameLookup()
        patchSelectedIndex()
        patchCategoryChange()
        patchCategoryBind()
        patchHeaderCallback()
        patchHeaderStartEdgeGuard()
        patchViewUtilTransformGuard()
    }
}

context(context: BytecodePatchContext)
private fun patchConstructor() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = EMOTICON_KEYBOARD_CLASS,
        name = "<init>",
        returnType = "V",
        parameterTypes = listOf(
            "Landroid/content/Context;",
            "Lnin;",
            "Lnyt;",
            "Lnxy;",
            "Lnzd;"
        )
    )
    val superConstructorIndex = mutableMethod.indexOfMethodCallOrThrow(
        definingClass = "Lcom/google/android/libraries/inputmethod/keyboard/impl/LifecycleKeyboard;",
        name = "<init>",
        returnType = "V",
        parameterTypes = listOf(
            "Landroid/content/Context;",
            "Lnin;",
            "Lnyt;",
            "Lnxy;",
            "Lnzd;"
        )
    )
    mutableMethod.addInstructions(superConstructorIndex + 1, CONSTRUCTOR_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchBodyReady() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = EMOTICON_KEYBOARD_CLASS,
        name = "ek",
        returnType = "V",
        parameterTypes = listOf(
            "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;",
            "Lnzi;"
        )
    )
    val emptyStateFieldWriteIndex = mutableMethod.indexOfFirstFieldAccess(
        definingClass = EMOTICON_KEYBOARD_CLASS,
        name = "r",
        type = "Landroid/view/ViewGroup;",
        opcodeName = "IPUT_OBJECT"
    )
    check(emptyStateFieldWriteIndex >= 0) {
        "Could not resolve EmoticonKeyboardM2.r field write in ek()"
    }
    mutableMethod.addInstructions(emptyStateFieldWriteIndex + 1, BODY_READY_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchCategoryNameLookup() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = EMOTICON_KEYBOARD_CLASS,
        name = "k",
        returnType = "Ljava/lang/String;",
        parameterTypes = listOf("I")
    )
    mutableMethod.addInstructions(0, CATEGORY_NAME_LOOKUP_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchSelectedIndex() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = EMOTICON_KEYBOARD_CLASS,
        name = "j",
        returnType = "I",
        parameterTypes = listOf("Ltvg;")
    )
    mutableMethod.addInstructions(0, SELECTED_INDEX_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchCategoryChange() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = EMOTICON_KEYBOARD_CLASS,
        name = "B",
        returnType = "V",
        parameterTypes = listOf("I", "I")
    )
    mutableMethod.addInstructions(0, CATEGORY_CHANGE_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchCategoryBind() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = EMOTICON_KEYBOARD_CLASS,
        name = "A",
        returnType = "V",
        parameterTypes = listOf(
            "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonRecyclerView;",
            "Ljava/lang/String;"
        )
    )
    mutableMethod.addInstructions(0, CATEGORY_BIND_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchHeaderCallback() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = EMOTICON_HEADER_CALLBACK_CLASS,
        name = "accept",
        returnType = "V",
        parameterTypes = listOf("Ljava/lang/Object;")
    )
    mutableMethod.addInstructions(0, HEADER_CALLBACK_BEFORE_DELEGATE)
    val returnIndices = mutableMethod.instructionIndices("RETURN_VOID")
    check(returnIndices.isNotEmpty()) {
        "Could not resolve return-void instructions in fhj.accept()"
    }
    returnIndices.sortedDescending().forEach { returnIndex ->
        mutableMethod.addInstructions(returnIndex, HEADER_CALLBACK_DELEGATE)
    }
}

context(context: BytecodePatchContext)
private fun patchHeaderStartEdgeGuard() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = HEADER_VIEW_CLASS,
        name = "n",
        returnType = "V",
        parameterTypes = listOf("Lfiu;")
    )
    mutableMethod.addInstructions(0, HEADER_START_EDGE_GUARD_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchViewUtilTransformGuard() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = VIEW_UTIL_CLASS,
        name = "h",
        returnType = "Landroid/view/View;",
        parameterTypes = listOf(
            "Landroid/graphics/Matrix;",
            "Landroid/view/View;",
            "Landroid/view/View;"
        )
    )
    mutableMethod.addInstructions(0, VIEW_UTIL_TRANSFORM_GUARD_DELEGATE)
}

private val CONSTRUCTOR_DELEGATE = """
    invoke-static {p0, p5}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->onEmoticonKeyboardConstructed(Ljava/lang/Object;Ljava/lang/Object;)V
""".trimIndent()

private val BODY_READY_DELEGATE = """
    invoke-static {p0}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->onEmoticonBodyReady(Ljava/lang/Object;)V
""".trimIndent()

private val CATEGORY_NAME_LOOKUP_DELEGATE = """
    invoke-static {p0, p1}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->overrideCategoryNameFromIndex(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :jasondev_continue

    return-object v0

    :jasondev_continue
""".trimIndent()

private val SELECTED_INDEX_DELEGATE = """
    invoke-static {p0, p1}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->resolveSelectedCategoryIndex(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :jasondev_continue

    return v0

    :jasondev_continue
""".trimIndent()

private val CATEGORY_CHANGE_DELEGATE = """
    invoke-static {p0, p1, p2}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->handleCategoryChange(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :jasondev_continue

    return-void

    :jasondev_continue
""".trimIndent()

private val CATEGORY_BIND_DELEGATE = """
    invoke-static {p0, p1, p2}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->handleCategoryBind(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :jasondev_continue

    return-void

    :jasondev_continue
""".trimIndent()

private val HEADER_CALLBACK_DELEGATE = """
    invoke-static {}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->onHeaderCallbackAfter()V
""".trimIndent()

private val HEADER_CALLBACK_BEFORE_DELEGATE = """
    invoke-static {p0}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->onHeaderCallbackBefore(Ljava/lang/Object;)V
""".trimIndent()

private val HEADER_START_EDGE_GUARD_DELEGATE = """
    invoke-static {p0}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->shouldSkipHeaderStartEdgeUpdate(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :jasondev_continue

    return-void

    :jasondev_continue
""".trimIndent()

private val VIEW_UTIL_TRANSFORM_GUARD_DELEGATE = """
    invoke-static {p0, p1, p2}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->shouldSkipDetachedViewTransform(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :jasondev_continue

    return-object p1

    :jasondev_continue
""".trimIndent()
