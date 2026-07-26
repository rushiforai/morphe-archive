package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags

internal enum class GboardExpressionCorpusPatchState {
    STOCK,
    CUSTOM_ONLY,
    TAB_ONLY,
    COMPOSED,
}

internal fun MutableMethod.requireGboardExpressionCorpusPatchState():
    GboardExpressionCorpusPatchState {
    check(
        definingClass == EXPRESSION_CORPUS_MANAGER_CLASS &&
            name == EXPRESSION_CORPUS_MANAGER_METHOD &&
            returnType == EXPRESSION_CORPUS_MANAGER_RETURN_TYPE &&
            parameterTypes == EXPRESSION_CORPUS_MANAGER_PARAMETERS,
    ) {
        "Refusing non-target expression corpus method " +
            "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    }
    check(accessFlags == EXPECTED_ACCESS_FLAGS) {
        "Unexpected access flags in $EXPRESSION_CORPUS_MANAGER_DESCRIPTOR: $accessFlags"
    }
    val fingerprint = gboardStructuralFingerprint()
    return when (fingerprint) {
        STOCK_FINGERPRINT -> GboardExpressionCorpusPatchState.STOCK
        CUSTOM_ONLY_FINGERPRINT -> GboardExpressionCorpusPatchState.CUSTOM_ONLY
        TAB_ONLY_FINGERPRINT -> GboardExpressionCorpusPatchState.TAB_ONLY
        COMPOSED_FINGERPRINT -> GboardExpressionCorpusPatchState.COMPOSED
        else -> error(
            "Unexpected expression corpus structure in $EXPRESSION_CORPUS_MANAGER_DESCRIPTOR: " +
                fingerprint,
        )
    }
}

private const val EXPRESSION_CORPUS_MANAGER_CLASS = "Lgan;"
private const val EXPRESSION_CORPUS_MANAGER_METHOD = "a"
private const val EXPRESSION_CORPUS_MANAGER_RETURN_TYPE = "Lvai;"
private val EXPRESSION_CORPUS_MANAGER_PARAMETERS =
    listOf("Landroid/view/inputmethod/EditorInfo;", "Z")
private const val EXPRESSION_CORPUS_MANAGER_DESCRIPTOR =
    "Lgan;->a(Landroid/view/inputmethod/EditorInfo;Z)Lvai;"
private val EXPECTED_ACCESS_FLAGS = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
private const val STOCK_FINGERPRINT =
    "b1b4031ea79b5a11dd43bfbc0255b59094777f03ddee9fcc4bd6a1826599f89c"
private const val CUSTOM_ONLY_FINGERPRINT =
    "d17862a628c4a3cd51858291cc858ef753a2fc24998edb348012ec106145a3d7"
private const val TAB_ONLY_FINGERPRINT =
    "b5d575c6a107e8e0ff0403f08c0fcfb231b8451b518dab50c5ab304ae393f1f5"
private const val COMPOSED_FINGERPRINT =
    "aaef53ad8d90b1985e23bd036bc905a2fd35b565339153753d60a6ffe9cdd89a"
