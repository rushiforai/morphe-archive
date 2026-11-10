package app.morphe.patches.kicktv.chattext

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import app.morphe.patches.kicktv.KICK_TV
import app.morphe.patches.kicktv.settings.settingsPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

private const val EXTENSION_CLASS = "Lapp/morphe/extension/kicktv/chattext/"

/**
 * `vi4.<clinit>` builds the chat message TextStyle `vi4.m` as
 * `TextStyle(fontSize = sp(11), lineHeight = sp(16))`.
 *
 * The two `dh7.m(int)` calls right before the `vi4.m` write are the font size
 * and the line height. They are matched backwards from the field write, so
 * earlier styles in the same initializer (there are many `sp()` calls) are
 * never touched.
 */
private object ChatTextStyleFingerprint : Fingerprint(
    definingClass = "Lvi4;",
    name = "<clinit>",
    returnType = "V",
    filters = listOf(
        fieldAccess(definingClass = "Lvi4;", name = "m", type = "Lfv8;"),
        methodCall(
            definingClass = "Ldh7;",
            name = "m",
            parameters = listOf("I"),
            returnType = "J",
            location = InstructionLocation.MatchBeforeWithin(10),
        ),
        methodCall(
            definingClass = "Ldh7;",
            name = "m",
            parameters = listOf("I"),
            returnType = "J",
            location = InstructionLocation.MatchBeforeWithin(10),
        ),
    ),
)

/**
 * `KickApplication.onCreate()` runs before Compose builds any TextStyle, so
 * the extension can capture the context and read the saved preference in time.
 */
private object KickApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/kick/tv/KickApplication;",
    name = "onCreate",
    parameters = emptyList(),
    returnType = "V",
)

/**
 * CHAT TEXT SIZE tweak. Replaces the chat message font size and line height
 * with Twitch-like values (13 sp / 20 sp) so KICK fits a similar amount of
 * chat on screen. The Settings menu is provided by the SEYTTINGS base patch
 * this patch depends on.
 */
@Suppress("unused")
val chatTextPatch = patch(
    name = "CHAT TEXT SIZE",
    description = "Render chat messages with a larger, Twitch-like TV text size. " +
        "Pick 16 sp (default), 15 sp, 13 sp or the stock 11 sp in SEYTTINGS. " +
        "Requires the SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(KICK_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/KickChatText.mpe")

    execute {
        KickApplicationOnCreateFingerprint.apply {
            val applicationOnCreate = method
            val p0 = applicationOnCreate.implementation!!.registerCount - 1
            applicationOnCreate.addInstruction(
                0,
                BuilderInstruction3rc(
                    Opcode.INVOKE_STATIC_RANGE,
                    p0,
                    1,
                    ImmutableMethodReference(
                        "${EXTENSION_CLASS}ChatTextPrefs;",
                        "init",
                        listOf("Landroid/content/Context;"),
                        "V",
                    ),
                ),
            )
        }

        ChatTextStyleFingerprint.apply {
            // instructionMatches: [vi4.m write, line height sp(), font size sp()]
            val lineHeightIndex = instructionMatches[1].index
            val fontSizeIndex = instructionMatches[2].index

            method.replaceSpCall(fontSizeIndex, "fontSizeSp")
            method.replaceSpCall(lineHeightIndex, "lineHeightSp")
        }
    }
}

/**
 * Points a `dh7.m(int)` call at the extension while keeping the exact same
 * registers and call format (`invoke-static` or `invoke-static/range`).
 */
private fun MutableMethod.replaceSpCall(index: Int, targetName: String) {
    val instruction = getInstruction(index)
    val target = "$EXTENSION_CLASS" + "ChatTextPrefs;->$targetName(I)J"

    when (instruction) {
        is RegisterRangeInstruction -> {
            val start = instruction.startRegister
            val end = start + instruction.registerCount - 1
            replaceInstruction(index, "invoke-static/range {v$start .. v$end}, $target")
        }

        is FiveRegisterInstruction -> {
            require(instruction.registerCount == 1) {
                "Unexpected chat TextStyle register count: ${instruction.registerCount}"
            }
            replaceInstruction(index, "invoke-static {v${instruction.registerC}}, $target")
        }

        else -> error("Unexpected chat TextStyle instruction: $instruction")
    }
}
