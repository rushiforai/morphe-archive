package app.cesbar.patches.velov

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode

object initializeDidomiFingerprint : Fingerprint(
    definingClass = "Lio/didomi/sdk/Didomi;",
    name = "initialize"
)

object isTrackingDialogSeenFingerprint : Fingerprint(
    strings = listOf("PREF_TRACKING_DIALOG_SEEN"),
    parameters = listOf(),
    returnType = "Z"
)

object matomoInitFingerprint : Fingerprint(
    strings = listOf("tracker.optout"),
    name = "<init>"
)

val blockDataCollectionPatch = bytecodePatch(
    name = "Block data collection",
    description = "Block Didomi & Matomo tracking SDKs, hide consent prompts for 3rd party & geolocation data"
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        initializeDidomiFingerprint.method.returnEarly()

        val moveResultIndex = isTrackingDialogSeenFingerprint.method.indexOfFirstInstruction(Opcode.MOVE_RESULT_OBJECT)
        isTrackingDialogSeenFingerprint.method.addInstructions(
            moveResultIndex + 1,
            """
                invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v0
                
                const-string v1, "PREF_TRACKING_DIALOG_SEEN"
                const/4 v2, 0x1
                invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                
                const-string v1, "PREF_TRACKING_ENABLED"
                const/4 v2, 0x0
                invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                
                invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
                
                const/4 v0, 0x1
                return v0
            """
        )

        val optoutStringIndex = matomoInitFingerprint.method.indexOfFirstInstruction(Opcode.CONST_STRING)
        matomoInitFingerprint.method.addInstructions(
            optoutStringIndex + 1,
            """
                invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v4
                const/4 v3, 0x1
                invoke-interface {v4, v2, v3}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v4
                invoke-interface {v4}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
            """
        )
    }
}
