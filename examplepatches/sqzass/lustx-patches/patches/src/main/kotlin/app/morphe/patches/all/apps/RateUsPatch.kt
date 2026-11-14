package app.morphe.patches.all.rateus

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.returnEarly

private val VOID_RE = Regex(
    "^(show|prompt|request|ask|maybe|check|display|launch|trigger|open|start|handle)" +
        ".*(rate|review|rating|store|market)$",
    RegexOption.IGNORE_CASE,
)
private val BOOL_RE = Regex(
    "^(should|can|is|maybe|has|will|need).*(show|prompt|display|request|ask|trigger)?" +
        ".*(rate|review|rating)$|^(shouldShow|isEligible|shouldPrompt|canPrompt)",
    RegexOption.IGNORE_CASE,
)

@Suppress("unused")
val rateUsPatch = bytecodePatch(
    name = "Remove rate-us / review prompts",
    description = "Suppresses in-app rating/review dialogs and gates. Optionally blocks the Play " +
        "Core system review dialog (may crash apps that don't null-check the returned Task).",
    default = false,
) {
    val blockSystemReview by booleanOption(
        key = "blockSystemReview", default = false,
        title = "Block Play Core review dialog",
        description = "No-ops ReviewManager.requestReviewFlow/launchReviewFlow. Off by default: " +
            "some apps NPE on the null Task. Enable only if you see the system dialog.",
    )

    execute {
        classDefForEach { classDef ->
            val targets = classDef.methods.filter { m ->
                (m.returnType == "V" && VOID_RE.matches(m.name)) ||
                    (m.returnType == "Z" && BOOL_RE.matches(m.name))
            }
            if (targets.isEmpty()) return@forEach
            val mc = mutableClassDefBy(classDef)
            targets.forEach { m ->
                val mm = mc.findMutableMethodOf(m)
                if (m.returnType == "V") mm.returnEarly() else mm.returnEarly(false)
            }
        }

        if (blockSystemReview == true) {
            mutableClassDefByOrNull("Lcom/google/android/play/core/review/ReviewManager;")
                ?.methods?.filter { it.name == "requestReviewFlow" || it.name == "launchReviewFlow" }
                ?.forEach { it.returnEarly(null as Void?) }
        }
    }
}