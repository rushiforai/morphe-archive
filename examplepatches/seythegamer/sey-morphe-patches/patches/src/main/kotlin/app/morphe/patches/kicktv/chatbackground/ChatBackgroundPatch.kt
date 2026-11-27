package app.morphe.patches.kicktv.chatbackground

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.patch
import app.morphe.patches.kicktv.KICK_TV
import app.morphe.patches.kicktv.settings.settingsPatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/morphe/extension/kicktv/chatbackground/"

/**
 * `La79;.d(...)` is the ChatDialog composable that paints the chat panel on
 * the right of the player. It wraps the message list in a `Box` whose
 * background is `Lsz6;->n(modifier, color, shape)`, and the colour is read
 * from the application's Compose palette field `ng4.f` (0xFF070809).
 *
 * There are exactly two `sget-wide vX, Lng4;->f:J` reads in this method:
 * one for the overlay branch (alpha applied via `u31.b`) and one for the
 * split-screen branch. Both are the panel background, so both are replaced.
 *
 * The fingerprint deliberately uses `fieldAccess` on the real static field
 * instead of guessing colour literals: the colour is a packed Compose `long`
 * loaded from a field, so no `const` instruction ever contains it.
 */
private object ChatPanelBackgroundFingerprint : Fingerprint(
    definingClass = "La79;",
    name = "d",
    parameters = listOf(
        "Lrs7;",
        "Ljava/util/List;",
        "Ljava/lang/String;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function1;",
        "Ljava/util/List;",
        "Lvz2;",
        "Lkotlin/jvm/functions/Function1;",
        "F",
        "Z",
        "Z",
        "F",
        "Z",
        "Lp73;",
        "I",
        "I",
    ),
    returnType = "V",
    filters = listOf(
        fieldAccess(definingClass = "Lng4;", name = "f", type = "J"),
    ),
)

/**
 * The overlay branch of `La79;.d` reads the same palette colour a second time,
 * followed immediately by `sget-object La57;->H` (the overlay shape). The
 * `fieldAccess` filter above matches only the first colour read, so this
 * second fingerprint anchors on the unique shape read and patches the
 * `sget-wide` directly before it.
 */
private object ChatPanelOverlayShapeFingerprint : Fingerprint(
    definingClass = "La79;",
    name = "d",
    parameters = listOf(
        "Lrs7;",
        "Ljava/util/List;",
        "Ljava/lang/String;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function1;",
        "Ljava/util/List;",
        "Lvz2;",
        "Lkotlin/jvm/functions/Function1;",
        "F",
        "Z",
        "Z",
        "F",
        "Z",
        "Lp73;",
        "I",
        "I",
    ),
    returnType = "V",
    filters = listOf(
        fieldAccess(definingClass = "La57;", name = "H", type = "Lnh3;"),
    ),
)

/** MainActivity.onCreate() - capture the context so the preference is readable. */
private object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/kick/tv/MainActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

/**
 * CHAT BACKGROUND (AMOLED) tweak. Replaces the KICK chat panel background
 * with pure black (#000000) when enabled, at the exact smali instruction
 * where the stock #070809 colour is read. The Settings menu is provided by
 * the SEYTTINGS base patch this patch depends on.
 */
@Suppress("unused")
val chatBackgroundPatch = patch(
    name = "CHAT BACKGROUND",
    description = "Replaces the KICK chat background with pure black (#000000) for AMOLED screens. "
        + "Toggle it in SEYTTINGS. Requires the SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(KICK_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/KickChatBackground.mpe")

    execute {
        // Give the extension the application context before Compose builds the chat.
        MainActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, ${EXTENSION_CLASS}ChatBackgroundPrefs;->init(Landroid/content/Context;)V
            """,
        )

        ChatPanelBackgroundFingerprint.apply {
            // The first `sget-wide vX, Lng4;->f:J` (split-screen branch) uses a
            // wide register pair; replace it with the preference-driven colour.
            val index = instructionMatches[0].index
            val register = method.getInstruction<OneRegisterInstruction>(index).registerA
            method.replaceInstruction(
                index,
                "invoke-static {}, ${EXTENSION_CLASS}ChatBackgroundPrefs;->getChatPanelColorPacked()J",
            )
            method.addInstruction(index + 1, "move-result-wide v$register")
        }

        ChatPanelOverlayShapeFingerprint.apply {
            // Unique overlay shape read; the colour read is the immediately
            // preceding instruction in this branch.
            val index = instructionMatches[0].index - 1
            val register = method.getInstruction<OneRegisterInstruction>(index).registerA
            method.replaceInstruction(
                index,
                "invoke-static {}, ${EXTENSION_CLASS}ChatBackgroundPrefs;->getChatPanelColorPacked()J",
            )
            method.addInstruction(index + 1, "move-result-wide v$register")
        }
    }
}