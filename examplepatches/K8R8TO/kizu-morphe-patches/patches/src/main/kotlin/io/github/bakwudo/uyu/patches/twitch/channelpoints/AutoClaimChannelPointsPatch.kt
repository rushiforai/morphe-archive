package io.github.bakwudo.uyu.patches.twitch.channelpoints

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.sharedExtensionPatch

private const val CHANNEL_CLASS =
    "Ltv/twitch/android/shared/chat/pub/messages/data/ChannelChatConnectionKey;"
private const val CHANNEL_POINTS =
    "Lapp/morphe/extension/channelpoints/ChannelPoints;"

internal val autoClaimChannelPointsPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(sharedExtensionPatch)

    execute {
        val classDef = classDefByOrNull(CHANNEL_CLASS)
            ?: throw PatchException("Kizu Channel Points: ChannelChatConnectionKey was not found.")
        val channelClass = mutableClassDefBy(classDef)
        val constructor = channelClass.methods.singleOrNull { method ->
            method.name == "<init>" &&
                method.returnType == "V" &&
                method.parameterTypes.map { it.toString() } ==
                    listOf("Ljava/lang/String;", "Ljava/lang/String;")
        } ?: throw PatchException(
            "Kizu Channel Points: expected one ChannelChatConnectionKey(String,String) constructor.",
        )

        val returnIndex = constructor.implementation?.instructions?.indexOfLast {
            it.opcode == Opcode.RETURN_VOID
        } ?: -1
        if (returnIndex < 0) {
            throw PatchException("Kizu Channel Points: channel constructor has no return-void.")
        }

        // This hook is owned by the Channel Points patch so auto-claim remains functional even
        // if the third-party-emotes patch changes independently.
        constructor.addInstruction(
            returnIndex,
            BuilderInstruction35c(
                Opcode.INVOKE_STATIC,
                2, 1, 2, 0, 0, 0,
                ImmutableMethodReference(
                    CHANNEL_POINTS,
                    "onChannelChanged",
                    listOf("Ljava/lang/String;", "Ljava/lang/String;"),
                    "V",
                ),
            ),
        )
    }
}
