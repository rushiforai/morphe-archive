package dev.jason.gboardpatches.patches.gboard.features.englishqwerty

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import dev.jason.gboardpatches.patches.gboard.shared.addFieldIfMissing
import dev.jason.gboardpatches.patches.gboard.shared.addHelperMethodIfMissing
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.indexOfFirstMethodCall

private val pointerTrackerClass = GboardVersionBindings.pointerOwner.classType
private const val SOFT_KEY_VIEW_TYPE =
    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"
private const val ENGLISH_UPPERCASE_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/keyboard/GboardEnglishUppercaseToggleRuntime;"
private const val ENGLISH_ANCHOR_FIELD_NAME = "jasondevEnglishAnchorKey"

internal val gboardEnglishQwertyPointerPatch = bytecodePatch(
    description = "在 17.7.7 pbl reset 前固定 English 上滑起始 key 並抑制 retarget。"
) {
    execute {
        addEnglishAnchorField()
        addEnglishPointerHelpers()
        injectEnglishPointerOwner()
        injectEnglishPointerCleanup()
    }
}

context(context: BytecodePatchContext)
private fun addEnglishAnchorField() = with(context) {
    addFieldIfMissing(
        classType = pointerTrackerClass,
        fieldName = ENGLISH_ANCHOR_FIELD_NAME,
        fieldType = SOFT_KEY_VIEW_TYPE,
        accessFlags = AccessFlags.PRIVATE.value
    )
}

context(context: BytecodePatchContext)
private fun addEnglishPointerHelpers() = with(context) {
    addHelperMethodIfMissing(
        classType = pointerTrackerClass,
        name = "jasondevShouldSuppressEnglishRetarget",
        parameterTypes = listOf(SOFT_KEY_VIEW_TYPE, "F", "F"),
        returnType = "Z",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 9,
        body = SHOULD_SUPPRESS_ENGLISH_RETARGET_BODY
    )
    addHelperMethodIfMissing(
        classType = pointerTrackerClass,
        name = "jasondevClearEnglishAnchor",
        parameterTypes = emptyList(),
        returnType = "V",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 2,
        body = CLEAR_ENGLISH_POINTER_ANCHOR_BODY
    )
}

context(context: BytecodePatchContext)
private fun injectEnglishPointerOwner() = with(context) {
    val pointerOwnerMethod = findMutableMethodOrThrow(GboardVersionBindings.pointerOwner)
    val rCallIndex = pointerOwnerMethod.indexOfFirstMethodCall(
        definingClass = pointerTrackerClass,
        name = "r",
        returnType = "V",
        parameterTypes = listOf("J", "I")
    )
    val acCallIndex = pointerOwnerMethod.indexOfFirstMethodCall(
        definingClass = pointerTrackerClass,
        name = "ac",
        returnType = "V",
        parameterTypes = emptyList()
    )
    check(rCallIndex >= 0) { "Unable to find target pbl->r(JI)V inside pointer owner" }
    check(acCallIndex >= 0) { "Unable to find target pbl->ac()V inside pointer owner" }
    check(rCallIndex < acCallIndex) {
        "Target pointer owner must finish the prior session before resetting tracker state"
    }

    pointerOwnerMethod.addInstructions(rCallIndex, "nop")
    val continuationInstruction = pointerOwnerMethod.implementation!!.instructions[rCallIndex]
    pointerOwnerMethod.addInstructionsWithLabels(
        rCallIndex,
        ENGLISH_POINTER_OWNER_PRE_RESET_DELEGATE,
        ExternalLabel(
            "jasondev_continue_english_pointer_owner",
            continuationInstruction
        )
    )
}

context(context: BytecodePatchContext)
private fun injectEnglishPointerCleanup() = with(context) {
    val cancelMethod = findMutableMethodOrThrow(GboardVersionBindings.pointerCancel)
    cancelMethod.addInstructions(0, CLEAR_ENGLISH_POINTER_ANCHOR_DELEGATE)

    val resetMethod = findMutableMethodOrThrow(GboardVersionBindings.pointerReset)
    resetMethod.addInstructions(0, CLEAR_ENGLISH_POINTER_ANCHOR_DELEGATE)
}

private val ENGLISH_POINTER_OWNER_PRE_RESET_DELEGATE = """
    invoke-direct {p0, p1, v0, v1}, $pointerTrackerClass->jasondevShouldSuppressEnglishRetarget(${SOFT_KEY_VIEW_TYPE}FF)Z

    move-result v4

    if-eqz v4, :jasondev_continue_english_pointer_owner

    return-void
""".trimIndent()

private val CLEAR_ENGLISH_POINTER_ANCHOR_DELEGATE = """
    invoke-direct {p0}, $pointerTrackerClass->jasondevClearEnglishAnchor()V
""".trimIndent()

private val CLEAR_ENGLISH_POINTER_ANCHOR_BODY = """
    const/4 v0, 0x0

    iput-object v0, p0, $pointerTrackerClass->$ENGLISH_ANCHOR_FIELD_NAME:$SOFT_KEY_VIEW_TYPE

    return-void
""".trimIndent()

private val SHOULD_SUPPRESS_ENGLISH_RETARGET_BODY = """
    :try_start_0
    invoke-static {}, $ENGLISH_UPPERCASE_RUNTIME_CLASS->isEnabled()Z

    move-result v0

    if-nez v0, :cond_enabled

    const/4 v0, 0x0

    iput-object v0, p0, Lpbl;->jasondevEnglishAnchorKey:$SOFT_KEY_VIEW_TYPE

    goto :cond_return_false

    :cond_enabled
    iget-object v0, p0, Lpbl;->jasondevEnglishAnchorKey:$SOFT_KEY_VIEW_TYPE

    if-nez v0, :cond_have_anchor

    iget-object v1, p0, Lpbl;->m:$SOFT_KEY_VIEW_TYPE

    if-nez v1, :cond_return_false

    if-eqz p1, :cond_return_false

    iget-object v1, p1, $SOFT_KEY_VIEW_TYPE->e:Lowd;

    if-eqz v1, :cond_return_false

    invoke-static {v1}, $ENGLISH_UPPERCASE_RUNTIME_CLASS->isPatchedMetadata(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_return_false

    move-object v0, p1

    iput-object v0, p0, Lpbl;->jasondevEnglishAnchorKey:$SOFT_KEY_VIEW_TYPE

    :cond_have_anchor
    iget-object v1, v0, $SOFT_KEY_VIEW_TYPE->e:Lowd;

    if-eqz v1, :cond_return_false

    invoke-static {v1}, $ENGLISH_UPPERCASE_RUNTIME_CLASS->isPatchedMetadata(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_return_false

    invoke-virtual {p0}, Lpbl;->i()Loth;

    move-result-object v2

    invoke-virtual {p0, p2, p3, v2}, Lpbl;->h(FFLoth;)Loth;

    move-result-object v2

    sget-object v3, Loth;->c:Loth;

    if-ne v2, v3, :cond_return_false

    invoke-virtual {v1, v2}, Lowd;->h(Loth;)Lotk;

    move-result-object v1

    if-eqz v1, :cond_return_false

    const/4 v0, 0x1

    return v0

    :cond_return_false
    const/4 v0, 0x0

    return v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v0, 0x0

    return v0
""".trimIndent()
