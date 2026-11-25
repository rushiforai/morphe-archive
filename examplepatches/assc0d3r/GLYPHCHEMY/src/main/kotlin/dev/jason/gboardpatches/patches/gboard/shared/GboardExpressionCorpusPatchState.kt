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
        definingClass.toString() == EXPRESSION_CORPUS_MANAGER_CLASS &&
            name.toString() == EXPRESSION_CORPUS_MANAGER_METHOD &&
            returnType.toString() == EXPRESSION_CORPUS_MANAGER_RETURN_TYPE &&
            parameterTypes.map(CharSequence::toString) == EXPRESSION_CORPUS_MANAGER_PARAMETERS,
    ) {
        "Refusing non-target expression corpus method " +
            "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    }
    check(accessFlags == EXPECTED_ACCESS_FLAGS) {
        "Unexpected access flags in $EXPRESSION_CORPUS_MANAGER_DESCRIPTOR: $accessFlags"
    }
    val fingerprint = gboardStructuralFingerprint()
    return when (fingerprint) {
        STOCK_FINGERPRINT,
        STOCK_FINGERPRINT_18_6_3 -> GboardExpressionCorpusPatchState.STOCK
        CUSTOM_ONLY_FINGERPRINT,
        CUSTOM_ONLY_FINGERPRINT_18_6_3 -> GboardExpressionCorpusPatchState.CUSTOM_ONLY
        TAB_ONLY_FINGERPRINT,
        TAB_ONLY_FINGERPRINT_18_6_3 -> GboardExpressionCorpusPatchState.TAB_ONLY
        COMPOSED_FINGERPRINT,
        COMPOSED_FINGERPRINT_18_6_3 -> GboardExpressionCorpusPatchState.COMPOSED
        else -> error(
            "Unexpected expression corpus structure in $EXPRESSION_CORPUS_MANAGER_DESCRIPTOR: " +
                fingerprint,
        )
    }
}

private const val EXPRESSION_CORPUS_MANAGER_CLASS = "Lgva;"
private const val EXPRESSION_CORPUS_MANAGER_METHOD = "a"
private const val EXPRESSION_CORPUS_MANAGER_RETURN_TYPE = "Lwhe;"
private val EXPRESSION_CORPUS_MANAGER_PARAMETERS =
    listOf("Landroid/view/inputmethod/EditorInfo;", "Z")
private const val EXPRESSION_CORPUS_MANAGER_DESCRIPTOR =
    "Lgva;->a(Landroid/view/inputmethod/EditorInfo;Z)Lwhe;"
private val EXPECTED_ACCESS_FLAGS = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
// 18.6.3 stock body (18.5.4's was c071e8a7...); recomputed with the same structural algorithm.
private const val STOCK_FINGERPRINT_18_6_3 =
    "3b15b7bd34893ca50cd94e74d6bdb8b3cad7642a12c6b72d167aa7634ebdb305"
private const val STOCK_FINGERPRINT =
    "c071e8a7f60078eb4470e8abb45518697d7793ae17b939a5dab118432c7b94bf"
// 18.6.3 body after the Custom Symbols corpus delegate is applied, recomputed with the
// same structural algorithm as the other fingerprints.
private const val CUSTOM_ONLY_FINGERPRINT_18_6_3 =
    "81d9b9e65c352c6419c09247021baa7e135d0e8ffd5423ba8dfb95fc6a052b0e"
private const val CUSTOM_ONLY_FINGERPRINT =
    "74b1e0d9ce128bc5d2635e6d12400ba8f3b13f740a1306b3874b978833017ad0"
private const val TAB_ONLY_FINGERPRINT =
    "bdcdf808949e414c9efb3c210601571d6a13350eb6c42ef4b675eb20135a5e8f"
private const val TAB_ONLY_FINGERPRINT_18_6_3 =
    "1fbdabc2bdca958dbcff9d5614f7ec33f3b35005cdbeb73b69db473b07e147f8"
// 18.6.3 body with both the Custom Symbols and the tab-order delegates applied.
private const val COMPOSED_FINGERPRINT_18_6_3 =
    "4f9029e9b07e2126a5703eceaa9962cce919afc1ee7e59d74149b3c97e6071c6"
private const val COMPOSED_FINGERPRINT =
    "31eca2eb752633ad1e09cfab1d90f5772462c2a69211e9990d2ba9517bcf004d"
