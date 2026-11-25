package dev.custom.gboardpatches.patches.extras

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val CANDIDATE_HOLDER_CLASS =
    "Lcom/google/android/apps/inputmethod/latin/keyboard/widget/LatinFixedCountCandidatesHolderView;"
private const val HELPER_CLASS = "Ldev/custom/gboardpatches/ui/MultilingualSuggestionHelper;"

/**
 * Promotes suggestions written in a different script to the front of the candidate strip.
 * The hook touches only p0/p1 so it works regardless of the host method's register count.
 */
val multilingualSuggestionPatch = bytecodePatch(
    name = "Multilingual Suggestion",
    description = "Promotes glide and typing suggestions written in a different script.",
    default = true
) {
    compatibleWith(
        Compatibility(
            name = "Gboard",
            packageName = "com.google.android.inputmethod.latin",
            targets = listOf(
                AppTarget(version = "18.6.3.1002251336-release-arm64-v8a"),
                AppTarget(version = "18.5.4.993608717-release-arm64-v8a"),
                AppTarget(version = null, isExperimental = true)
            )
        )
    )
    extendWith("colorwheel.dex")

    execute {
        val holderClass = mutableClassDefByOrNull(CANDIDATE_HOLDER_CLASS)
            ?: error("Gboard candidate holder class not found.")

        val updateCandidates = holderClass.methods.firstOrNull { method ->
            method.name == "D" &&
                method.returnType == "V" &&
                method.parameterTypes.size == 2 &&
                method.parameterTypes[0] == "Ljava/util/List;"
        } ?: error("Gboard candidate-row update method not found.")

        updateCandidates.injectStaticCall(
            hookOwner = HELPER_CLASS,
            hookName = "applyToView",
            hookParameterTypes = listOf("Landroid/view/View;", "Ljava/util/List;"),
            firstParam = 0,
            paramCount = 2,
            includeReceiver = true
        )
    }
}
