package hooman.morphe.patches.twitch.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION = "Lapp/morphe/extension/twitch/seventv/SevenTvPatch;"

@Suppress("unused")
val sevenTvEmotesPatch = bytecodePatch(
    name = "7TV emotes",
    description = "Adds global, channel and personal 7TV emotes to chat, Twitch's picker and autocomplete, including zero-width overlays.",
) {
    compatibleWith(
        Compatibility(
            name = "Twitch",
            packageName = "tv.twitch.android.app",
            appIconColor = 0x9147FF,
            targets = listOf(AppTarget("30.5.0")),
        ),
    )

    extendWith("extensions/twitch.mpe")

    execute {
        // Main IRC messages: p1 is channelId and p4 is ChatMessageInfo.
        LegacyChatMessageRendererFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p1
                move-object/from16 v1, p4
                invoke-static { v0, v1 }, $EXTENSION->transformLegacyMessage(Ljava/lang/String;Ljava/lang/Object;)V
            """,
        )

        // Pinned/auxiliary messages: the static helper receives channelId and the message object.
        PublicChatMessageRendererFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p2 }, $EXTENSION->transformPublicMessage(ILjava/lang/Object;)V
            """,
        )

        // Replace Twitch's CDN URL for our synthetic native EmoticonToken IDs.
        val urlMethod = EmoteUrlResolverFingerprint.method
        val returnIndex = urlMethod.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        if (returnIndex < 0) throw PatchException("7TV: emote URL resolver has no object return")
        val returnRegister = (urlMethod.getInstruction(returnIndex) as OneRegisterInstruction).registerA
        urlMethod.addInstructions(
            returnIndex,
            """
                invoke-static { v$returnRegister }, $EXTENSION->replaceEmoteUrl(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$returnRegister
                check-cast v$returnRegister, Lsw0;
            """,
        )

        PickerSectionsFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION->augmentPickerSections(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """,
        )
        EmotePickerCreateFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, $EXTENSION->configurePicker(Ljava/lang/Object;)V",
        )

        MessageInputBindFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lpan;->n:Ltba;
                invoke-static { v0 }, $EXTENSION->registerAutoCompleteProvider(Ljava/lang/Object;)V
            """,
        )

        val userMethod = CurrentUserIdFingerprint.method
        val userReturnIndex = userMethod.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN }
        if (userReturnIndex < 0) throw PatchException("7TV: current user method has no return")
        val userRegister = (userMethod.getInstruction(userReturnIndex) as OneRegisterInstruction).registerA
        userMethod.addInstructions(
            userReturnIndex,
            "invoke-static { v$userRegister }, $EXTENSION->setCurrentUserId(I)V",
        )

        val emoteCardCreate = EmoteCardCreateFingerprint.method
        val superCreateIndex = emoteCardCreate.implementation!!.instructions.indexOfFirst {
            it.opcode == Opcode.INVOKE_SUPER || it.opcode == Opcode.INVOKE_SUPER_RANGE
        }
        if (superCreateIndex < 0) throw PatchException("7TV: emote card onCreate has no super call")
        emoteCardCreate.addInstructionsWithLabels(
            superCreateIndex + 1,
            """
                invoke-static { p0 }, $EXTENSION->handleSevenTvEmoteCard(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :original
                return-void
            """,
            ExternalLabel("original", emoteCardCreate.getInstruction(superCreateIndex + 1)),
        )

        val bareOpen = BareAutocompleteOpenFingerprint.method
        bareOpen.addInstructionsWithLabels(
            0,
            """
                iget v0, p0, Ltee;->j:I
                if-nez v0, :original
                invoke-static { p1 }, $EXTENSION->shouldOpenAutocomplete(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :original
                const/4 v0, 0x1
                return v0
            """,
            ExternalLabel("original", bareOpen.getInstruction(0)),
        )
        val bareStart = BareAutocompleteStartFingerprint.method
        bareStart.addInstructionsWithLabels(
            0,
            """
                iget v0, p0, Ltee;->j:I
                if-nez v0, :original
                invoke-static { p1 }, $EXTENSION->getBareAutocompleteStart(Ljava/lang/CharSequence;)I
                move-result v0
                if-ltz v0, :original
                return v0
            """,
            ExternalLabel("original", bareStart.getInstruction(0)),
        )

        val sizeMethod = ZeroWidthSizeFingerprint.method
        sizeMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0 }, $EXTENSION->isZeroWidthSpan(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :original
                const/4 v0, 0x0
                return v0
            """,
            ExternalLabel("original", sizeMethod.getInstruction(0)),
        )
        ZeroWidthDrawFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0, p5 }, $EXTENSION->adjustZeroWidthX(Ljava/lang/Object;F)F
                move-result p5
            """,
        )
    }
}
