package app.morphe.patches.music.layout.miniplayer.m3navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import app.morphe.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val TRANSPARENT_STATUS_BAR_CLASS =
    "Lapp/morphe/extension/music/patches/miniplayer/TransparentStatusBarFilter;"

private object TransparentStatusBarAttachFingerprint : Fingerprint(
    name = "<init>",
    filters = listOf(
        resourceLiteral(ResourceType.ID, "mini_player_play_pause_replay_button"),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            name = "findViewById",
            location = MatchAfterWithin(12)
        ),
        string("sharedToggleMenuItemMutations")
    )
)

private val COMPATIBILITY_YOUTUBE_MUSIC_TRANSPARENT_STATUS_BAR = Compatibility(
    name = "YouTube Music",
    packageName = "com.google.android.apps.youtube.music",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xFF0000,
    signatures = COMPATIBILITY_YOUTUBE_MUSIC.signatures,
    targets = listOf(
        AppTarget(
            version = null,
            minSdk = 26
        )
    )
)

@Suppress("unused")
val transparentStatusBarPatch = patch(
    name = "Transparent status bar",
    description = "[Pre-release] Makes the status bar completely transparent with no status bar layer so scrolled content flows edge-to-edge behind the status bar icons.",
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC_TRANSPARENT_STATUS_BAR)
    extendWith("extensions/m3navigation.mpe")

    finalize {
        TransparentStatusBarAttachFingerprint.let {
            it.clearMatch()
            it.method.apply {
                val findViewByIdIndex = it.instructionMatches[1].index
                val parentViewRegister = getInstruction<FiveRegisterInstruction>(findViewByIdIndex).registerC

                addInstruction(
                    findViewByIdIndex,
                    "invoke-static { v$parentViewRegister }, " +
                        "$TRANSPARENT_STATUS_BAR_CLASS->onAttach(Landroid/view/View;)V"
                )
            }
        }
    }
}
