package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.shared.GOV_APPS
import semicoloncolonel.mobilestream.patches.shared.SHOPPING_APPS
import semicoloncolonel.mobilestream.patches.abcnews.shared.Constants as AbcNews
import semicoloncolonel.mobilestream.patches.amc.shared.Constants as Amc
import semicoloncolonel.mobilestream.patches.apnews.shared.Constants as ApNews
import semicoloncolonel.mobilestream.patches.att.shared.Constants as Att
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants as CbsNews
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants as Cnn
import semicoloncolonel.mobilestream.patches.costco.shared.Constants as Costco
import semicoloncolonel.mobilestream.patches.cspan.shared.Constants as Cspan
import semicoloncolonel.mobilestream.patches.dailywire.shared.Constants as DailyWire
import semicoloncolonel.mobilestream.patches.disney.shared.Constants as Disney
import semicoloncolonel.mobilestream.patches.espn.shared.Constants as Espn
import semicoloncolonel.mobilestream.patches.fandango.shared.Constants as Fandango
import semicoloncolonel.mobilestream.patches.foxlocal.shared.Constants as FoxLocal
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants as FoxNews
import semicoloncolonel.mobilestream.patches.foxone.shared.Constants as FoxOne
import semicoloncolonel.mobilestream.patches.hbomax.shared.Constants as HboMax
import semicoloncolonel.mobilestream.patches.hulu.shared.Constants as Hulu
import semicoloncolonel.mobilestream.patches.justwatch.shared.Constants as JustWatch
import semicoloncolonel.mobilestream.patches.mgm.shared.Constants as Mgm
import semicoloncolonel.mobilestream.patches.mint.shared.Constants as Mint
import semicoloncolonel.mobilestream.patches.mlb.shared.Constants as Mlb
import semicoloncolonel.mobilestream.patches.moviebase.shared.Constants as Moviebase
import semicoloncolonel.mobilestream.patches.msnow.shared.Constants as MsNow
import semicoloncolonel.mobilestream.patches.nba.shared.Constants as Nba
import semicoloncolonel.mobilestream.patches.nbcnews.shared.Constants as NbcNews
import semicoloncolonel.mobilestream.patches.newsnation.shared.Constants as NewsNation
import semicoloncolonel.mobilestream.patches.nfl.shared.Constants as Nfl
import semicoloncolonel.mobilestream.patches.npr.shared.Constants as Npr
import semicoloncolonel.mobilestream.patches.nytimes.shared.Constants as NyTimes
import semicoloncolonel.mobilestream.patches.paramount.shared.Constants as Paramount
import semicoloncolonel.mobilestream.patches.pbs.shared.Constants as Pbs
import semicoloncolonel.mobilestream.patches.peacock.shared.Constants as Peacock
import semicoloncolonel.mobilestream.patches.plex.shared.Constants as Plex
import semicoloncolonel.mobilestream.patches.pluto.shared.Constants as Pluto
import semicoloncolonel.mobilestream.patches.primevideo.shared.Constants as PrimeVideo
import semicoloncolonel.mobilestream.patches.shudder.shared.Constants as Shudder
import semicoloncolonel.mobilestream.patches.siriusxm.shared.Constants as SiriusXm
import semicoloncolonel.mobilestream.patches.starz.shared.Constants as Starz
import semicoloncolonel.mobilestream.patches.substack.shared.Constants as Substack
import semicoloncolonel.mobilestream.patches.sundancenow.shared.Constants as SundanceNow
import semicoloncolonel.mobilestream.patches.thescore.shared.Constants as TheScore
import semicoloncolonel.mobilestream.patches.tlife.shared.Constants as TLife
import semicoloncolonel.mobilestream.patches.tmobileplay.shared.Constants as TMobilePlay
import semicoloncolonel.mobilestream.patches.truthsocial.shared.Constants as TruthSocial
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants as Tubi
import semicoloncolonel.mobilestream.patches.verizon.shared.Constants as Verizon
import semicoloncolonel.mobilestream.patches.visible.shared.Constants as Visible
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants as WashingtonPost
import semicoloncolonel.mobilestream.patches.whitehouse.shared.Constants as WhiteHouse
import semicoloncolonel.mobilestream.patches.wsj.shared.Constants as Wsj
import semicoloncolonel.mobilestream.patches.xfinity.shared.Constants as Xfinity
import semicoloncolonel.mobilestream.patches.xumo.shared.Constants as Xumo
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants as YtTv

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
    // Apple TV, CNBC, Recreation.gov, NewsBreak, and USA TODAY have their own
    // Hide rating prompt patch, which includes this one.
    compatibleWith(
        Tubi.COMPATIBILITY,
        Disney.COMPATIBILITY,
        Hulu.COMPATIBILITY,
        Pluto.COMPATIBILITY,
        Paramount.COMPATIBILITY,
        HboMax.COMPATIBILITY, HboMax.STREAM_COMPATIBILITY,
        Peacock.COMPATIBILITY,
        PrimeVideo.COMPATIBILITY,
        Mgm.COMPATIBILITY,
        FoxOne.COMPATIBILITY,
        Amc.COMPATIBILITY,
        Starz.COMPATIBILITY,
        Pbs.COMPATIBILITY,
        Plex.COMPATIBILITY,
        Xumo.COMPATIBILITY,
        Shudder.COMPATIBILITY,
        SundanceNow.COMPATIBILITY,
        SiriusXm.COMPATIBILITY,
        Fandango.COMPATIBILITY,
        Moviebase.COMPATIBILITY,
        JustWatch.COMPATIBILITY,
        YtTv.COMPATIBILITY,
        Espn.COMPATIBILITY,
        Nfl.COMPATIBILITY,
        Nba.COMPATIBILITY,
        Mlb.COMPATIBILITY,
        TheScore.COMPATIBILITY,
        NyTimes.COMPATIBILITY,
        WashingtonPost.COMPATIBILITY,
        Wsj.COMPATIBILITY,
        FoxNews.COMPATIBILITY,
        MsNow.COMPATIBILITY,
        Cnn.COMPATIBILITY,
        CbsNews.COMPATIBILITY,
        NbcNews.COMPATIBILITY,
        FoxLocal.COMPATIBILITY,
        AbcNews.COMPATIBILITY,
        Npr.COMPATIBILITY,
        ApNews.COMPATIBILITY,
        Substack.COMPATIBILITY,
        Cspan.COMPATIBILITY,
        NewsNation.COMPATIBILITY, NewsNation.TV_COMPATIBILITY,
        DailyWire.COMPATIBILITY,
        TruthSocial.COMPATIBILITY,
        WhiteHouse.COMPATIBILITY,
        *GOV_APPS,
        *SHOPPING_APPS,
        Costco.COMPATIBILITY,
        Mint.COMPATIBILITY,
        Verizon.COMPATIBILITY,
        Att.COMPATIBILITY,
        TLife.COMPATIBILITY,
        TMobilePlay.COMPATIBILITY,
        Visible.COMPATIBILITY,
        Xfinity.COMPATIBILITY,
    )

    dependsOn(blockPlayReviewSheetPatch)
}
