package app.morphed.patches.twitch.ad.stream

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphed.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import app.morphed.patches.twitch.shared.addInstructionsBeforeReturn
import app.morphed.patches.twitch.shared.indicesOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val HTTP_CLIENT = "Lcom/amazonaws/ivs/net/HttpClient;"
private const val WRAPPER_CLASS = "Lcom/amazonaws/ivs/net/MorphedHttpClient;"
private const val REFRESHER_CLASS = "Lapp/morphed/extension/twitch/patches/PlayerRefresher;"
private const val PLAYER = "Lcom/amazonaws/ivs/player/Player;"

@Suppress("unused")
val blockStreamAdsPatch = bytecodePatch(
    name = "Block stream ads",
    description = "Replaces ad-laden live playlists with ad-free ones from other player types, " +
        "and strips ad segments when no clean playlist exists.",
    default = true
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    extendWith("extensions/twitch.mpe")

    execute {
        HttpClientFactoryCreateFingerprint.method.apply {
            indicesOf(Opcode.RETURN_OBJECT).forEach { returnIndex ->
                val register = getInstruction<OneRegisterInstruction>(returnIndex).registerA
                addInstructionsBeforeReturn(
                    returnIndex,
                    """
                        invoke-static/range { v$register .. v$register }, $WRAPPER_CLASS->wrap($HTTP_CLIENT)$HTTP_CLIENT
                        move-result-object v$register
                    """
                )
            }
        }

        // Remember each player so it can be nudged back to the live edge after an ad break.
        CorePlayerImplConstructorFingerprint.method.apply {
            val thisRegister = implementation!!.registerCount - parameters.size - 1
            indicesOf(Opcode.RETURN_VOID).forEach { returnIndex ->
                addInstructionsBeforeReturn(
                    returnIndex,
                    "invoke-static/range { v$thisRegister .. v$thisRegister }, $REFRESHER_CLASS->register($PLAYER)V"
                )
            }
        }

        // Remember which surface each player draws on, so the "Blocking ads" label can find the
        // video of the stream being watched among all video views (previews included).
        CorePlayerImplSetSurfaceFingerprint.method.apply {
            val thisRegister = implementation!!.registerCount - 2
            addInstruction(
                0,
                "invoke-static/range { v$thisRegister .. v${thisRegister + 1} }, " +
                    "$REFRESHER_CLASS->onSurface($PLAYER Landroid/view/Surface;)V"
            )
        }
    }
}
