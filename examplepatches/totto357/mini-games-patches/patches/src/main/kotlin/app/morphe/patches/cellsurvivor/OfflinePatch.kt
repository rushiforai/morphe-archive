package app.morphe.patches.cellsurvivor

import app.morphe.patches.cellsurvivor.Constants.COMPATIBILITY_CELL_SURVIVOR
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val GOOGLE_GAME_SERVICE_PROVIDER = "Lcom/common/route/other/GoogleGameServiceProvider;"
private const val STATISTIC_UTILS = "Lcom/common/common/utils/StatisticUtils;"
private const val APPS_FLYER_COMMON = "Lcom/common/third/manager/AppsFlyerCommon;"
private const val PAY_STATISTIC_UTIL = "Lcom/common/pay/PayStatisticUtil;"
private const val ONLINE_CONFIG_TASK = "Lcom/common/tasks/OnlineConfigTask;"

internal object PlayGamesSignInFingerprint : Fingerprint(
    name = "signIn",
    parameters = listOf("Lcom/common/route/other/GameServiceSignInCallback;"),
    custom = { _, classDef ->
        classDef.interfaces.contains(GOOGLE_GAME_SERVICE_PROVIDER)
    },
)

internal object PlayGamesShowLeaderboardsFingerprint : Fingerprint(
    name = "showLeaderboards",
    parameters = listOf("Ljava/lang/String;", "I"),
    custom = { _, classDef ->
        classDef.interfaces.contains(GOOGLE_GAME_SERVICE_PROVIDER)
    },
)

internal object PlayGamesToastFingerprint : Fingerprint(
    strings = listOf("Problem! Please check the network"),
)

internal object BuglyInitFingerprint : Fingerprint(
    definingClass = STATISTIC_UTILS,
    name = "initBuglyStatic",
    parameters = listOf("Landroid/content/Context;"),
)

internal object AppsFlyerInitFingerprint : Fingerprint(
    definingClass = APPS_FLYER_COMMON,
    name = "initSDK",
    parameters = listOf("Landroid/app/Application;", "Z"),
)

internal object PayStatisticOnSucceedFingerprint : Fingerprint(
    definingClass = PAY_STATISTIC_UTIL,
    name = "onSucceedEvent",
    parameters =
        listOf(
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
        ),
)

internal object PayStatisticPaySuccessFingerprint : Fingerprint(
    definingClass = PAY_STATISTIC_UTIL,
    name = "paySuccessEvent",
    parameters = listOf("Ljava/lang/String;", "I"),
)

internal object OnlineConfigTaskRunFingerprint : Fingerprint(
    definingClass = ONLINE_CONFIG_TASK,
    name = "run",
    parameters = emptyList(),
)

@Suppress("unused")
val offlinePatch =
    bytecodePatch(
        name = "Disable Analytics, Crashlytics & Error Toasts",
        description = "Completely disables AppsFlyer, Bugly, OnlineConfig and annoying Google Play Games network toasts.",
    ) {
        compatibleWith(COMPATIBILITY_CELL_SURVIVOR)

        execute {
            PlayGamesSignInFingerprint.method.apply {
                ensureLocals(2)
                addInstructions(
                    0,
                    """
                    if-eqz p1, :cond_gps_dis
                    const/16 v0, 0x3ec
                    const-string v1, "GPS disabled"
                    invoke-interface {p1, v0, v1}, Lcom/common/route/other/GameServiceSignInCallback;->onSignInFailed(ILjava/lang/String;)V
                    :cond_gps_dis
                    return-void
                    """.trimIndent(),
                )
            }

            PlayGamesShowLeaderboardsFingerprint.method.addInstructions(
                0,
                """
                return-void
                """.trimIndent(),
            )

            PlayGamesToastFingerprint.matchAll().forEach { match ->
                match.method.addInstructions(
                    0,
                    """
                    return-void
                    """.trimIndent(),
                )
            }

            BuglyInitFingerprint.method.addInstructions(
                0,
                """
                return-void
                """.trimIndent(),
            )

            AppsFlyerInitFingerprint.method.addInstructions(
                0,
                """
                return-void
                """.trimIndent(),
            )

            PayStatisticOnSucceedFingerprint.method.addInstructions(
                0,
                """
                return-void
                """.trimIndent(),
            )

            PayStatisticPaySuccessFingerprint.method.addInstructions(
                0,
                """
                return-void
                """.trimIndent(),
            )

            OnlineConfigTaskRunFingerprint.method.addInstructions(
                0,
                """
                return-void
                """.trimIndent(),
            )
        }
    }
