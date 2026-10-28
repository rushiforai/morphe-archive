package io.github.jordanwoodson.patches.twitch.chat

import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.twitch.emotes.EmoteUrlFingerprint
import io.github.jordanwoodson.patches.twitch.shared.requireKept
import io.github.jordanwoodson.patches.shared.settings.ChoiceSetting
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.requireLocals
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val STYLE = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchChatStyle;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val KEY = "chat_appearance"

/** Text sizes, in percent of Twitch's. 85, 115 and 130 are the first ones the setting had; they stay valid. */
private val TEXT_SIZES = listOf(70, 75, 80, 85, 90, 95, 105, 110, 115, 120, 125, 130, 140, 150, 175, 200)
/** Emote and badge sizes, in percent of Twitch's (24 dp emotes, 18 dp badges). */
private val IMAGE_SIZES = listOf(50, 75, 90, 110, 125, 150, 175, 200, 250, 300)
/** Space above and below each message, in percent of Twitch's. */
private val SPACINGS = listOf(25, 50, 75, 150, 200, 300)

private fun percents(default: String, values: List<Int>) =
    listOf(default to "0") + values.map { "$it%" to it.toString() }

@Suppress("unused")
val chatAppearancePatch = bytecodePatch(
    name = "Chat appearance",
    description = "Adds chat look settings: text, emote and badge size, message spacing, alternating row " +
        "backgrounds, plain /me messages, and the width and background opacity of the landscape chat panel. Each " +
        "keeps Twitch's look until changed in Lurk settings. Native live chat, chat history and VOD chat replay; " +
        "React Native chat gets the text size, row backgrounds, /me style and landscape panel only.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchRNChatPatch, twitchSettingsPatch)
    execute {
        styleLines()
        numberLiveMessages()
        hookChatRows("$STYLE->bindRow(Landroid/view/View;Landroid/widget/TextView;)V")
        sizeChatImages()
        sharpenLargeEmotes()
        sizeLandscapeChat()
        sizeTheatreChat()
        twitchSettings.add(
            SwitchSetting(KEY, "Chat appearance",
                "Use the chat look chosen below. Off, or with every choice at Twitch's default, chat looks as in Twitch.",
                Section.CHAT),
            ChoiceSetting("chat_text_size", "Chat text size", "Live chat, chat history and VOD chat replay.",
                Section.CHAT, "0", percents("Twitch's default", TEXT_SIZES), parent = KEY),
            ChoiceSetting("chat_emote_size", "Emote size",
                "Twitch's and third-party emotes in native chat, chat history and VOD chat replay. Larger sizes " +
                    "load Twitch's larger emote images.",
                Section.CHAT, "0", percents("Twitch's default (24 dp)", IMAGE_SIZES), parent = KEY),
            ChoiceSetting("chat_badge_size", "Badge size",
                "Twitch's and third-party badges in native chat, chat history and VOD chat replay.",
                Section.CHAT, "0", percents("Twitch's default (18 dp)", IMAGE_SIZES), parent = KEY),
            ChoiceSetting("chat_message_spacing", "Message spacing",
                "Space above and below each message in native chat, chat history and VOD chat replay.",
                Section.CHAT, "0", percents("Twitch's default", SPACINGS), parent = KEY),
            SwitchSetting("chat_alternate_rows", "Alternating row backgrounds", "Shade every other chat message.",
                Section.CHAT, default = false, parent = KEY),
            ChoiceSetting("chat_me_style", "/me messages", "How messages sent with /me look.",
                Section.CHAT, "0", listOf("Twitch's default (italic)" to "0", "Plain" to "1"), parent = KEY),
            ChoiceSetting("chat_landscape_width", "Landscape chat width",
                "Share of the screen width taken by the chat panel in landscape. Applies when the player is next laid out.",
                Section.CHAT, "0",
                listOf("Twitch's default (30%, 20% on tablets)" to "0", "20%" to "20", "25%" to "25", "35%" to "35",
                    "40%" to "40"),
                parent = KEY),
            ChoiceSetting("chat_landscape_opacity", "Landscape chat background",
                "Opacity of the landscape chat panel's background, over the video or the player's black background.",
                Section.CHAT, "0",
                listOf("Twitch's default (85% dark, 95% light)" to "0", "75%" to "75", "50%" to "50", "25%" to "25"),
                parent = KEY),
        )
    }
}

/**
 * The line builder takes the message style. Swap Twitch's /me style (italic) for the normal message style when
 * /me messages are plain, and note the message ID and where the line is shown; at the end, mark every other
 * line's sender span for the alternating backgrounds.
 */
private fun BytecodePatchContext.styleLines() {
    val method = chatLineBuilder()
    val styleType = method.parameterTypes[11].toString()
    // The builder's own default style (flag 0x400): Twitch's normal message, a singleton of a subclass.
    val normal = method.instructionList().firstNotNullOfOrNull { instruction ->
        instruction.takeIf { it.opcode == Opcode.SGET_OBJECT }?.fieldRef
            ?.takeIf { it.type == it.definingClass && classDefByOrNull(it.type)?.superclass == styleType }
    } ?: throw PatchException("Twitch: the chat line builder has no default message style")
    if (classDefBy(normal.type).let { !AccessFlags.FINAL.isSet(it.accessFlags) }) {
        throw PatchException("Twitch: unexpected chat message style")
    }
    method.addInstructions(0, """
        move-object/from16 v0, p11
        sget-object v1, $normal
        move-object/from16 v2, p9
        move-object/from16 v3, p13
        invoke-static { v0, v1, v2, v3 }, $STYLE->beginLine(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v0
        check-cast v0, $styleType
        move-object/from16 p11, v0
    """)
    val (init, start) = method.spanGroupConstructor()
    val sender = start + 3
    method.addInstructions(init, """
        invoke-static/range { v$sender .. v${sender + 2} }, $STYLE->markLine($CHAR_SEQUENCE$CHAR_SEQUENCE$CHAR_SEQUENCE)$CHAR_SEQUENCE
        move-result-object v$sender
    """)
}

/**
 * Live chat and chat history make each line's list item when the message arrives, in order. Number the
 * messages there (with their sender and tokens, so hidden ones are skipped), so alternating backgrounds stay
 * with their message when old lines leave the list.
 */
private fun BytecodePatchContext.numberLiveMessages() {
    val line = liveChatLine()
    val method = ChatLineItemFingerprint.twitchMatch("chat line item").method
    if (method.parameterTypes[0].toString() != line.type || AccessFlags.STATIC.isSet(method.accessFlags)) {
        throw PatchException("Twitch: the chat line item isn't made from a live chat message")
    }
    method.requireLocals(3)
    method.addInstructions(0, """
        move-object/from16 v2, p1
        iget-object v0, v2, ${line.id}
        iget-object v1, v2, ${line.sender}
        iget-object v2, v2, ${line.tokens}
        invoke-static { v0, v1, v2 }, $STYLE->onMessage(Ljava/lang/String;Ljava/lang/Object;Ljava/util/List;)V
    """)
}

/**
 * Every chat image span (emote, badge, notice icon) gets a square box sized from its size class before its image
 * loads; the loaded image is fitted into it. At each return of that size, the extension scales emotes' and badges'.
 * The size class is read once at the start and its register isn't written again.
 */
private fun BytecodePatchContext.sizeChatImages() {
    val match = ChatImageBoxFingerprint.twitchMatch("chat image box")
    val sizeClass = match.instructionMatches.first().instruction.methodRef!!.definingClass
    // The size class is Twitch's enum of chat image kinds; the extension tells them apart by constant name.
    val constants = classDefBy(sizeClass).methods.singleOrNull { it.name == "<clinit>" }?.implementation
        ?.instructions?.mapNotNull { it.stringRef }.orEmpty()
    if (!constants.containsAll(listOf("Emote", "GigantifiedEmote", "Badge"))) {
        throw PatchException("Twitch: chat image size classes changed")
    }
    match.method.apply {
        val instructions = instructionList()
        val read = instructions.indexOfFirst { it.opcode == Opcode.IGET_OBJECT && it.fieldRef?.type == sizeClass }
        if (read != 0) throw PatchException("Twitch: the chat image box doesn't start with its size class")
        val kind = (instructions[read] as TwoRegisterInstruction).registerA
        if (instructions.drop(1).any { it.opcode.setsRegister() && (it as OneRegisterInstruction).registerA == kind }) {
            throw PatchException("Twitch: the chat image box reuses its size class register")
        }
        val returns = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN }
        if (returns.isEmpty()) throw PatchException("Twitch: the chat image box has no return")
        returns.reversed().forEach { index ->
            val size = (instructions[index] as OneRegisterInstruction).registerA
            requireNotBranchTarget(index, "chat image box return")
            addInstructions(index, """
                ${invokeStatic("$STYLE->imageSize(ILjava/lang/Object;)I", size, kind)}
                move-result v$size
            """)
        }
    }
}

/** The emote URL builder's image scale (a Float, null for the screen's own), at its start. */
private fun BytecodePatchContext.sharpenLargeEmotes() {
    EmoteUrlFingerprint.twitchMatch("emote URL builder").method.apply {
        if (parameterTypes[3].toString() != "Ljava/lang/Float;") throw PatchException("Twitch: emote URL scale moved")
        val scale = parameterRegister(4)
        addInstructions(0, """
            ${invokeStatic("$STYLE->emoteScale(Ljava/lang/Float;)Ljava/lang/Float;", scale)}
            move-result-object v$scale
        """)
    }
}

/** Right after the landscape chat panel gets Twitch's width, adjust its width and background. */
private fun BytecodePatchContext.sizeLandscapeChat() {
    val match = LandscapeChatWidthFingerprint.twitchMatch("landscape chat width")
    match.method.apply {
        val call = match.instructionMatches.last().index
        val panel = (instructionList()[call] as FiveRegisterInstruction).registerD
        if (panel > 15) throw PatchException("Twitch: landscape chat panel register out of range")
        requireNotBranchTarget(call + 1, "landscape chat width")
        addInstructions(call + 1, "invoke-static { v$panel }, $STYLE->landscapeChat(Landroid/view/View;)V")
    }
}

/**
 * The native theatre lays its landscape chat column out from a guideline at 70% of the width (80% on tablets).
 * Right after Twitch sets that percentage, set the one the extension returns, which also adjusts the column's
 * background. Twitch's 100% (no chat column) jumps past this.
 */
private fun BytecodePatchContext.sizeTheatreChat() {
    TheatreLayoutFingerprint.twitchMatch("theatre layout").method.apply {
        val instructions = instructionList()
        val phone = instructions.indexOfFirst {
            it.opcode == Opcode.CONST && (it as NarrowLiteralInstruction).narrowLiteral == 0.7f.toRawBits()
        }
        if (phone < 0) throw PatchException("Twitch: no theatre chat guideline percentage")
        val percent = (instructions[phone] as OneRegisterInstruction).registerA
        // Right after the constant: set(percent, guideline ID) on the constraint set.
        val call = phone + 1
        val setter = instructions[call].methodRef
        if (instructions[call].opcode != Opcode.INVOKE_VIRTUAL || setter?.returnType != "V" ||
            setter.parameterTypes.map { it.toString() } != listOf("F", "I") ||
            (instructions[call] as FiveRegisterInstruction).registerD != percent) {
            throw PatchException("Twitch: the theatre chat guideline percentage isn't set right away")
        }
        val set = instructions[call] as FiveRegisterInstruction
        // The constraint set was cloned from the theatre's ConstraintLayout, which the same register still holds.
        val layoutType = "Landroidx/constraintlayout/widget/ConstraintLayout;"
        val clone = (call downTo 0).firstOrNull { i ->
            val instruction = instructions[i]
            instruction.opcode == Opcode.INVOKE_VIRTUAL && (instruction as FiveRegisterInstruction).registerC == set.registerC &&
                instruction.methodRef?.let { ref ->
                    ref.definingClass == setter.definingClass && ref.parameterTypes.map { it.toString() } == listOf(layoutType)
                } == true
        } ?: throw PatchException("Twitch: the theatre constraint set isn't cloned from its layout")
        val layout = (instructions[clone] as FiveRegisterInstruction).registerD
        requireKept(clone, call + 1, layout, "theatre layout")
        if (listOf(layout, set.registerC, set.registerD, set.registerE).any { it > 15 }) {
            throw PatchException("Twitch: theatre layout registers out of range")
        }
        // Inserted after the call: the branch for 100% (no chat column) targets the next original instruction.
        addInstructions(call + 1, """
            invoke-static { v$layout, v$percent }, $STYLE->landscapeChatGuide(Landroid/view/View;F)F
            move-result v$percent
            invoke-virtual { v${set.registerC}, v$percent, v${set.registerE} }, $setter
        """)
    }
}
