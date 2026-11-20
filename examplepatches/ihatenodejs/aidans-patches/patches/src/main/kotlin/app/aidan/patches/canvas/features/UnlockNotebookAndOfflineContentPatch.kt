package app.aidan.patches.canvas.features

import app.aidan.patches.canvas.shared.COMPATIBILITY_CANVAS
import app.aidan.patches.shared.isEnabled
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

private const val FEATURE_FLAG_PROVIDER = "Lcom/instructure/pandautils/utils/FeatureFlagProvider;"

@Suppress("unused")
val unlockNotebookAndOfflineContentPatch = bytecodePatch(
    name = "Unlock Notebook and Offline Content",
    description = "Forces the client-side Notebook and Offline Content environment feature flags on, " +
        "regardless of the institution's rollout. Server support is still required for content sync.",
    default = false
) {
    category("Features")
    compatibleWith(COMPATIBILITY_CANVAS)

    val enableNotebook = booleanOption(
        key = "enableNotebook",
        default = true,
        title = "Enable Notebook",
        description = "Forces FeatureFlagProvider.notebookEnabled to return true."
    )
    val enableOfflineContent = booleanOption(
        key = "enableOfflineContent",
        default = true,
        title = "Enable Offline Content",
        description = "Forces FeatureFlagProvider.offlineEnabled to return true."
    )

    execute {
        if (enableNotebook.isEnabled) returnTrueFromSuspendingBoolean("notebookEnabled")
        if (enableOfflineContent.isEnabled) returnTrueFromSuspendingBoolean("offlineEnabled")
    }
}

/**
 * Makes every Kotlin suspend method named [methodName] in FeatureFlagProvider return Boolean.TRUE
 * without executing its body. Callers only test for COROUTINE_SUSPENDED before unboxing the result,
 * so a direct boxed return is equivalent to the completed continuation result.
 */
private fun BytecodePatchContext.returnTrueFromSuspendingBoolean(methodName: String) {
    val mutableClass = mutableClassDefByOrNull(FEATURE_FLAG_PROVIDER)
        ?: throw PatchException("Required class $FEATURE_FLAG_PROVIDER not found.")
    val methods = mutableClass.methods.filter {
        it.name == methodName &&
            it.returnType == "Ljava/lang/Object;" &&
            it.implementation != null
    }
    if (methods.isEmpty()) {
        throw PatchException(
            "Required suspend method $FEATURE_FLAG_PROVIDER->$methodName(Lju/c;)Ljava/lang/Object; not found."
        )
    }

    for (method in methods) {
        method.addInstructions(
            0,
            """
            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            return-object v0
            """.trimIndent()
        )
    }
}
