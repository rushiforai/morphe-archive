package app.noam.patches.geocaching.statistics

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.geocaching.misc.extension.extensionHookPatch
import app.noam.patches.geocaching.shared.Constants

private object UserStatisticsFingerprint : Fingerprint(
    definingClass = "Lcom/groundspeak/geocaching/intro/network/api/stats/b;",
    name = "a",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
)

/** Part of Unlock Statistics: the numbers are worked out from your own finds list. */
internal val statisticsFromFindsPatch = bytecodePatch(
    description = "Works Statistics out from your own finds list.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(extensionHookPatch)

    execute {
        UserStatisticsFingerprint.method.replaceInstructions(
            0,
            """
                invoke-static { p2 }, ${Constants.GC_USER_STATS}->statsAsync(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                return-object v0
            """,
        )
    }
}
