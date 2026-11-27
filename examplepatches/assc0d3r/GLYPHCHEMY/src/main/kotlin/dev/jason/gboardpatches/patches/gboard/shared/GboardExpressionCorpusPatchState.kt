package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags

internal enum class GboardExpressionCorpusPatchState {
    STOCK,
    CUSTOM_ONLY,
    TAB_ONLY,
    COMPOSED,
}

/**
 * Every structural fingerprint one release's expression-corpus body is allowed to hash to.
 *
 * The fingerprints cover the whole method, references included, so they are per release: 18.8.0
 * obfuscates the class, the corpus list type and the receiver wrapper, and a fingerprint recorded
 * from another release would never match. A state missing from the set is not a candidate shape -
 * the classifier fails instead of guessing which delegate is already applied.
 */
internal class GboardExpressionCorpusFingerprints(
    val stock: Set<String>,
    val customOnly: Set<String>,
    val tabOnly: Set<String>,
    val composed: Set<String>,
)

/**
 * Classifies the expression-corpus method of the release in front of us.
 *
 * The target and its fingerprints come from the caller because the same method carries several
 * features: Custom Symbols owns the custom-corpus delegate and Symbol Footer owns the reorder one,
 * and each release renames all of it. A default pair keeps the 18.6.3-only callers unchanged.
 */
internal fun MutableMethod.requireGboardExpressionCorpusPatchState(
    target: GboardMethodTarget = GBOARD_EXPRESSION_CORPUS_18_6_3,
    fingerprints: GboardExpressionCorpusFingerprints =
        GBOARD_EXPRESSION_CORPUS_FINGERPRINTS_18_6_3,
): GboardExpressionCorpusPatchState {
    check(target.matches(this)) {
        "Refusing non-target expression corpus method " +
            "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    }
    check(accessFlags == EXPECTED_ACCESS_FLAGS) {
        "Unexpected access flags in ${target.reference}: $accessFlags"
    }
    val fingerprint = gboardStructuralFingerprint()
    return when (fingerprint) {
        in fingerprints.stock -> GboardExpressionCorpusPatchState.STOCK
        in fingerprints.customOnly -> GboardExpressionCorpusPatchState.CUSTOM_ONLY
        in fingerprints.tabOnly -> GboardExpressionCorpusPatchState.TAB_ONLY
        in fingerprints.composed -> GboardExpressionCorpusPatchState.COMPOSED
        else -> error(
            "Unexpected expression corpus structure in ${target.reference}: " +
                fingerprint,
        )
    }
}

internal val GBOARD_EXPRESSION_CORPUS_18_6_3 = GboardMethodTarget(
    classType = "Lgva;",
    name = "a",
    parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
    returnType = "Lwhe;",
)

internal val GBOARD_EXPRESSION_CORPUS_FINGERPRINTS_18_6_3 = GboardExpressionCorpusFingerprints(
    stock = setOf(
        // 18.5.4 stock body.
        "c071e8a7f60078eb4470e8abb45518697d7793ae17b939a5dab118432c7b94bf",
        // 18.6.3 stock body.
        "3b15b7bd34893ca50cd94e74d6bdb8b3cad7642a12c6b72d167aa7634ebdb305",
    ),
    customOnly = setOf(
        "74b1e0d9ce128bc5d2635e6d12400ba8f3b13f740a1306b3874b978833017ad0",
        // 18.6.3 body after the Custom Symbols corpus delegate is applied.
        "81d9b9e65c352c6419c09247021baa7e135d0e8ffd5423ba8dfb95fc6a052b0e",
    ),
    tabOnly = setOf(
        "bdcdf808949e414c9efb3c210601571d6a13350eb6c42ef4b675eb20135a5e8f",
        "1fbdabc2bdca958dbcff9d5614f7ec33f3b35005cdbeb73b69db473b07e147f8",
    ),
    composed = setOf(
        "31eca2eb752633ad1e09cfab1d90f5772462c2a69211e9990d2ba9517bcf004d",
        // 18.6.3 body with both the Custom Symbols and the tab-order delegates applied.
        "4f9029e9b07e2126a5703eceaa9962cce919afc1ee7e59d74149b3c97e6071c6",
    ),
)

/**
 * 18.8.0 keeps the whole corpus-list method and only renames what it refers to: the manager
 * (`Lgva;` -> `Lnxt;`), the list type (`Lwhe;` -> `Lauaz;`) and the receiver wrapper
 * (`Lguy;` -> `Lnxp;`), with the same fourteen registers and the same single
 * `return-object` of a `check-cast` on the second `Stream.collect`.
 */
internal val GBOARD_EXPRESSION_CORPUS_18_8 = GboardMethodTarget(
    classType = "Lnxt;",
    name = "a",
    parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
    returnType = "Lauaz;",
)

internal val GBOARD_EXPRESSION_CORPUS_FINGERPRINTS_18_8 = GboardExpressionCorpusFingerprints(
    stock = setOf(
        "1489b9465696f3e789c5628ec24a93fd113b7ab177f77ac7b947f497d95fd445",
    ),
    // Custom Symbols is not offered for 18.8.0, so no delegate-applied state can be produced.
    customOnly = emptySet(),
    tabOnly = setOf(
        // 18.8.0 body with the tab-order delegate applied: 17 registers, the entry copies and the
        // delegated `return-object v11`. Recorded from the first apply of this patch.
        "e5642f9390e45a492875fdb17845ac4e2f2503a0d0bdb5fec7071a145c34ad7a",
    ),
    composed = emptySet(),
)

private val EXPECTED_ACCESS_FLAGS = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
