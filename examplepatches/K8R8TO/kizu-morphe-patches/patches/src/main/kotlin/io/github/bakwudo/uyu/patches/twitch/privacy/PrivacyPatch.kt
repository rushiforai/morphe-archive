package io.github.bakwudo.uyu.patches.twitch.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.sharedExtensionPatch

private const val SUPPORT = "Lio/github/bakwudo/uyu/extension/settings/PrivacySupport;"
private const val COMSCORE = "Lcom/comscore/Analytics;"
private const val CRASH_REPORTER = "Ltv/twitch/android/core/crashreporter/a;"
private const val FIREBASE_CRASHLYTICS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"

internal val privacyPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(sharedExtensionPatch)

    execute {
        val comscoreDef = classDefByOrNull(COMSCORE)
            ?: throw PatchException("Kizu privacy: Comscore Analytics class was not found.")
        val comscore = mutableClassDefBy(comscoreDef)
        val start = comscore.methods.singleOrNull { method ->
            method.name == "start" &&
                method.returnType == "V" &&
                method.parameterTypes.map { it.toString() } ==
                    listOf("Landroid/content/Context;")
        } ?: throw PatchException("Kizu privacy: Comscore Analytics.start(Context) was not found.")

        start.addInstructions(
            0,
            """
            invoke-static {}, $SUPPORT->shouldDisableComscore()Z
            move-result v0
            if-eqz v0, :kizu_comscore_continue
            return-void
            :kizu_comscore_continue
            """,
        )

        val crashDef = classDefByOrNull(CRASH_REPORTER)
            ?: throw PatchException("Kizu privacy: Twitch 31.3.1 CrashReporter class was not found.")
        val crash = mutableClassDefBy(crashDef)

        val getter = crash.methods.singleOrNull { method ->
            method.name == "a" &&
                method.returnType == FIREBASE_CRASHLYTICS &&
                method.parameterTypes.isEmpty()
        } ?: throw PatchException("Kizu privacy: CrashReporter Firebase getter was not found.")

        getter.addInstructions(
            0,
            "invoke-static {}, $SUPPORT->beforeCrashReport()V",
        )

        val nonFatal = crash.methods.singleOrNull { method ->
            method.name == "g" &&
                method.returnType == "V" &&
                method.parameterTypes.map { it.toString() } ==
                    listOf(CRASH_REPORTER, "Ljava/lang/Throwable;", "Lnpa;", "I")
        } ?: throw PatchException("Kizu privacy: CrashReporter non-fatal reporter was not found.")

        nonFatal.addInstructions(
            0,
            """
            invoke-static {}, $SUPPORT->shouldDisableCrashReporting()Z
            move-result v0
            if-eqz v0, :kizu_crash_continue
            return-void
            :kizu_crash_continue
            """,
        )
    }
}
