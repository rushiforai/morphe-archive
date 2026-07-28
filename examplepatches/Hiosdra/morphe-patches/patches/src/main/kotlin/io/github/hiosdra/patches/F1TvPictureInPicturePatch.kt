package io.github.hiosdra.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private val f1TvPictureInPictureResourcePatch = resourcePatch(
    name = "F1 TV - Picture-in-Picture manifest",
    description = "Allows the F1 TV player activity to enter Android Picture-in-Picture mode.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_F1_TV)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val activities = manifest.getElementsByTagName("activity")
            val activity = (0 until activities.length)
                .asSequence()
                .map { activities.item(it) as? Element }
                .firstOrNull { it?.getAttribute("android:name") == "com.avs.f1.ui.player.BasePlayerActivity" }
                ?: error("F1 TV BasePlayerActivity was not found in AndroidManifest.xml")

            activity.setAttribute("android:supportsPictureInPicture", "true")
            activity.setAttribute("android:resizeableActivity", "true")
        }
    }
}

private fun f1TvOnPauseFingerprint() = Fingerprint(
    definingClass = BASE_PLAYER_ACTIVITY,
    name = "onPause",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(methodCall(definingClass = PLAYER_SWITCHER, name = "onPause")),
)

@Suppress("unused")
val f1TvPictureInPicturePatch = bytecodePatch(
    name = "F1 TV - Picture-in-Picture",
    description = "Keeps F1 TV playback alive while entering Android Picture-in-Picture mode.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_F1_TV)
    dependsOn(f1TvPictureInPictureResourcePatch)

    execute {
        val onPause = f1TvOnPauseFingerprint()
        onPause.matchOrNull()?.let { match ->
            match.method.removeInstruction(match.instructionMatches.first().index)
        }

        val playerClass = mutableClassDefBy(BASE_PLAYER_ACTIVITY)
        if (playerClass.methods.none { it.name == "onUserLeaveHint" && it.parameterTypes.isEmpty() }) {
            playerClass.methods.add(
                ImmutableMethod(
                    BASE_PLAYER_ACTIVITY,
                    "onUserLeaveHint",
                    listOf<ImmutableMethodParameter>(),
                    "V",
                    AccessFlags.PUBLIC.value,
                    emptySet(),
                    emptySet(),
                    ImmutableMethodImplementation(
                        3,
                        """
                            invoke-super {v2}, Lcom/avs/f1/ui/BaseActivity;->onUserLeaveHint()V
                            invoke-virtual {v2}, $BASE_PLAYER_ACTIVITY->getPlayerSwitcher()$PLAYER_SWITCHER
                            move-result-object v0
                            invoke-interface {v0}, $PLAYER_SWITCHER->isPlaying()Z
                            move-result v1
                            if-eqz v1, :return
                            invoke-interface {v0}, $PLAYER_SWITCHER->isCasting()Z
                            move-result v1
                            if-nez v1, :return
                            invoke-virtual {v2}, Landroid/app/Activity;->enterPictureInPictureMode()V
                            :return
                            return-void
                        """.toInstructions(),
                        emptyList(),
                        emptyList(),
                    ),
                ).toMutable(),
            )
        }
    }
}
