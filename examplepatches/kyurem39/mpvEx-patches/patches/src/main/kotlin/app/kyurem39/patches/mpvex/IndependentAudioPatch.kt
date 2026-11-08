package app.kyurem39.patches.mpvex

import app.kyurem39.patches.shared.Constants.COMPATIBILITY_MPVEX
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val MORPHE_HOOK = "Lapp/kyurem39/extension/MorpheHook;"
private const val MORPHE_PREFS = "Lapp/kyurem39/extension/MorphePrefs;"
private const val MAIN_ACTIVITY = "Lapp/marlboroadvance/mpvex/MainActivity;"
private const val PLAYER_ACTIVITY = "Lapp/marlboroadvance/mpvex/ui/player/PlayerActivity;"
private const val AUDIO_FOCUS_LISTENER = "Landroid/media/AudioManager\$OnAudioFocusChangeListener;"

private object RequestAudioFocusFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type == PLAYER_ACTIVITY && method.name == "requestAudioFocus"
    },
)

private object FocusChangeFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I"),
    strings = listOf("Audio focus request failed"),
    custom = { _, classDef ->
        classDef.interfaces.contains(AUDIO_FOCUS_LISTENER)
    },
)

/**
 * Prevents mpvEx from requesting audio focus or interrupting audio from other applications.
 */
@Suppress("unused")
val independentAudioPatch = bytecodePatch(
    name = "Independent audio",
    description = "Prevents mpvEx from requesting audio focus or reacting to audio focus changes.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MPVEX)

    dependsOn(patchSettingsPatch)

    execute {
        // Marks the independent audio section of the shared settings sheet as available.
        val mainOnCreate = mutableClassDefBy(MAIN_ACTIVITY).methods.firstOrNull { method ->
            method.name == "onCreate" &&
                method.parameterTypes.size == 1 &&
                method.parameterTypes[0].toString() == "Landroid/os/Bundle;" &&
                method.returnType == "V"
        } ?: throw PatchException("$MAIN_ACTIVITY has no onCreate(Bundle).")

        mainOnCreate.addInstructions(
            0,
            """
                invoke-static {}, $MORPHE_HOOK->enableIndependentAudio()V
            """,
        )

        val requestMatch = RequestAudioFocusFingerprint.match()
        requestMatch.method.addInstructions(
            0,
            """
                invoke-static {p0}, $MORPHE_PREFS->isIndependent(Landroid/content/Context;)Z
                move-result v0
                if-eqz v0, :cond_stock
                const/4 v0, 0x1
                return v0
                :cond_stock
            """,
        )

        val playerActivity = requestMatch.classDef
        val abandonMethod = playerActivity.methods.firstOrNull { method ->
            method.name == "abandonAudioFocus" &&
                method.parameterTypes.isEmpty() &&
                method.returnType == "V"
        } ?: throw PatchException("PlayerActivity has no abandonAudioFocus()V")

        abandonMethod.addInstructions(
            0,
            """
                invoke-static {p0}, $MORPHE_PREFS->isIndependent(Landroid/content/Context;)Z
                move-result v0
                if-eqz v0, :cond_stock
                return-void
                :cond_stock
            """,
        )

        val focusChangeMatch = FocusChangeFingerprint.match()
        focusChangeMatch.method.addInstructions(
            0,
            """
                invoke-static {}, $MORPHE_PREFS->isIndependent()Z
                move-result v0
                if-eqz v0, :cond_stock
                return-void
                :cond_stock
            """,
        )
    }
}
