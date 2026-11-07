package app.twrailway.patches.review

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.twrailway.patches.shared.Constants.COMPATIBILITY_TRAIN_SCHEDULE
import com.android.tools.smali.dexlib2.iface.ClassDef

/**
 * The "App好用嗎？" (rate this app) dialog is drawn by Flutter, and whether it is shown is
 * stored with the shared_preferences plugin (`SharedPreferencesAsync.getBool`):
 *
 * - `shouldShowReviewKey-<version>`: the app's own review dialog (AppReviewView).
 * - `rateMyApp_doNotOpenAgain`: the rate_my_app package dialog.
 *
 * The native `getBool` implementations are hooked so these keys always read as
 * "do not show the dialog", whatever is stored.
 */
@Suppress("unused")
val hideReviewPromptPatch = bytecodePatch(
    name = "Hide review prompt",
    description = "Stops the \"App好用嗎？\" dialog asking to rate the app from showing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRAIN_SCHEDULE)

    execute {
        val setUpMethod = SharedPreferencesAsyncApiSetUpFingerprint.method
        val apiInterface = setUpMethod.parameterTypes[1].toString()

        val implementations = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (apiInterface in classDef.interfaces) implementations += classDef
        }
        if (implementations.isEmpty()) {
            throw PatchException("Could not find implementations of $apiInterface")
        }

        var patchedCount = 0
        implementations.forEach { classDef ->
            mutableClassDefBy(classDef).methods.filter { method ->
                // Boolean getBool(String key, SharedPreferencesPigeonOptions options)
                method.returnType == "Ljava/lang/Boolean;" &&
                    method.parameterTypes.size == 2 &&
                    method.parameterTypes[0].toString() == "Ljava/lang/String;" &&
                    method.implementation != null
            }.forEach { method ->
                val registerCount = method.implementation!!.registerCount
                // p0 (this), p1 (key) and p2 (options) are the last 3 registers.
                if (registerCount - 3 < 1 || registerCount > 16) {
                    throw PatchException("Unexpected register layout in ${classDef.type}->${method.name}")
                }

                method.addInstructionsWithLabels(
                    0,
                    """
                        const-string v0, "shouldShowReviewKey"
                        invoke-virtual { p1, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
                        move-result v0
                        if-eqz v0, :check_rate_my_app
                        sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                        return-object v0
                        :check_rate_my_app
                        const-string v0, "rateMyApp_doNotOpenAgain"
                        invoke-virtual { p1, v0 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
                        move-result v0
                        if-eqz v0, :original
                        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                        return-object v0
                    """,
                    ExternalLabel("original", method.getInstruction(0)),
                )
                patchedCount++
            }
        }

        if (patchedCount == 0) {
            throw PatchException("Could not find SharedPreferencesAsyncApi.getBool implementations")
        }
    }
}
