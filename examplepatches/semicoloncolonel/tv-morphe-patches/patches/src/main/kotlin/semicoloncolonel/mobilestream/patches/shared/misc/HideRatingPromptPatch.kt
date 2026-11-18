package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.disney.shared.Constants as Disney
import semicoloncolonel.mobilestream.patches.espn.shared.Constants as Espn
import semicoloncolonel.mobilestream.patches.foxone.shared.Constants as FoxOne
import semicoloncolonel.mobilestream.patches.hbomax.shared.Constants as HboMax
import semicoloncolonel.mobilestream.patches.justwatch.shared.Constants as JustWatch
import semicoloncolonel.mobilestream.patches.mgm.shared.Constants as Mgm
import semicoloncolonel.mobilestream.patches.mlb.shared.Constants as Mlb
import semicoloncolonel.mobilestream.patches.nba.shared.Constants as Nba
import semicoloncolonel.mobilestream.patches.newsnation.shared.Constants as NewsNation
import semicoloncolonel.mobilestream.patches.nfl.shared.Constants as Nfl
import semicoloncolonel.mobilestream.patches.pbs.shared.Constants as Pbs
import semicoloncolonel.mobilestream.patches.peacock.shared.Constants as Peacock
import semicoloncolonel.mobilestream.patches.plex.shared.Constants as Plex
import semicoloncolonel.mobilestream.patches.pluto.shared.Constants as Pluto
import semicoloncolonel.mobilestream.patches.starz.shared.Constants as Starz
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants as Tubi

// Apps open Google Play's in-app review sheet with
// ReviewManager.launchReviewFlow(Activity, ReviewInfo), which returns a
// com.google.android.gms.tasks.Task. Every such call, in the app's own code
// and in the libraries it bundles (Play's Kotlin extensions, React Native and
// Expo review modules, marketing SDKs), now goes to RatingPromptBlocker
// instead. It returns a task that has already completed, as Play does when it
// decides not to show the sheet, so the app's completion listeners still run.
//
// Apps that rename Google's review classes (myAT&T 2026.10.2, Recreation.gov
// 2.2.67.1, and the Apple TV phone app 3.0.0) or its Task class (Tubi 10.44.2)
// have no call to match, so the patch applies and does nothing there.
// App-specific "Hide rating prompt" patches, for apps that also decide on
// their own when to ask for a rating, depend on this one, and those apps are
// left out of the list below so no app lists the name twice.

private const val EXTENSION_PACKAGE = "Lsemicoloncolonel/mobilestream/extension/"
private const val REVIEW_PACKAGE = "Lcom/google/android/play/core/review/"
private const val GMS_TASK = "Lcom/google/android/gms/tasks/Task;"
private const val TASKS_FOR_RESULT = "Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)$GMS_TASK"
private const val REPLACEMENT =
    "Lsemicoloncolonel/mobilestream/extension/shared/misc/RatingPromptBlocker;->" +
        "launchReviewFlow(Ljava/lang/Object;Landroid/app/Activity;Ljava/lang/Object;)$GMS_TASK"

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
)

// Matches the ReviewManager interface and its implementations (the real
// manager and FakeReviewManager), all of which live in Play's review package.
private fun Instruction.isLaunchReviewFlow(): Boolean {
    if (opcode !in INVOKE_OPCODES) return false
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return reference.definingClass.startsWith(REVIEW_PACKAGE) &&
        reference.name == "launchReviewFlow" &&
        reference.returnType == GMS_TASK &&
        reference.parameterTypes.map { it.toString() } ==
        listOf("Landroid/app/Activity;", "${REVIEW_PACKAGE}ReviewInfo;")
}

/**
 * Replaces every call to Google Play's launchReviewFlow with
 * RatingPromptBlocker.launchReviewFlow. App-specific rating patches depend on
 * it, so it carries no name of its own.
 */
internal val blockPlayReviewSheetPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        // RatingPromptBlocker builds its answer with Tasks.forResult. An app
        // that renamed it would crash on the replacement, so skip it instead.
        if (missingMethods(listOf(TASKS_FOR_RESULT)).isNotEmpty()) return@execute

        // Collect first, mutate after: mutableClassDefBy swaps the class map
        // entry, which must not happen mid-iteration.
        val targets = mutableListOf<String>()
        classDefForEach { classDef ->
            if (!classDef.type.startsWith(EXTENSION_PACKAGE) &&
                classDef.methods.any { method -> method.implementation?.instructions?.any { it.isLaunchReviewFlow() } == true }
            ) {
                targets += classDef.type
            }
        }

        targets.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                // Snapshot: replaceInstruction mutates the live list.
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    if (!instruction.isLaunchReviewFlow()) return@forEachIndexed
                    // The receiver, the activity, and the review info keep
                    // their registers, so the move-result after it still works.
                    val smali = when (instruction) {
                        is FiveRegisterInstruction -> with(instruction) {
                            "invoke-static { v$registerC, v$registerD, v$registerE }, $REPLACEMENT"
                        }
                        is RegisterRangeInstruction -> with(instruction) {
                            "invoke-static/range { v$startRegister .. v${startRegister + 2} }, $REPLACEMENT"
                        }
                        else -> return@forEachIndexed
                    }
                    method.replaceInstruction(index, smali)
                }
            }
        }
    }
}

@Suppress("unused")
val hideRatingPromptPatch = bytecodePatch(
    name = "Hide rating prompt",
    description = "Stops Google Play's rate-this-app sheet.",
) {
    // Apple TV, CNBC, Recreation.gov, NewsBreak, USA TODAY, and NewsNation's
    // Android TV build have their own Hide rating prompt patch, which includes
    // this one.
    compatibleWith(
        Tubi.COMPATIBILITY,
        Disney.COMPATIBILITY,
        Pluto.COMPATIBILITY,
        HboMax.COMPATIBILITY,
        HboMax.STREAM_COMPATIBILITY,
        Peacock.COMPATIBILITY,
        Mgm.COMPATIBILITY,
        FoxOne.COMPATIBILITY,
        Starz.COMPATIBILITY,
        Pbs.COMPATIBILITY,
        Plex.COMPATIBILITY,
        JustWatch.COMPATIBILITY,
        Espn.COMPATIBILITY,
        Nfl.COMPATIBILITY,
        Nba.COMPATIBILITY,
        Mlb.COMPATIBILITY,
    )

    dependsOn(blockPlayReviewSheetPatch)
}
