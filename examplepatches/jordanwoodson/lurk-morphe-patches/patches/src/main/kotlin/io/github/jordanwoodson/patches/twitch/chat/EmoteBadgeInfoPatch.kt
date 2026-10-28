package io.github.jordanwoodson.patches.twitch.chat

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val INFO = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchChatInfo;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val STRING = "Ljava/lang/String;"

@Suppress("unused")
val emoteBadgeInfoPatch = bytecodePatch(
    name = "Emote and badge info",
    description = "Adds a switch that shows a small sheet when you tap an emote or a badge in native chat, chat " +
        "history or VOD chat replay: the image larger, its name, where it comes from (Twitch, 7TV, BetterTTV, " +
        "FrankerFaceZ, Chatterino; channel or global; who made it, when the service's list says) and a Copy name " +
        "button. Signed in, Twitch emotes keep Twitch's own emote card; usernames and long presses keep what Twitch " +
        "does. Native chat only; React Native chat is unchanged. Starts off. Turn it on in Lurk settings > Chat.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)
    execute {
        // The badge and message spans, right before the line's spans are put together (after third-party badges
        // joined Twitch's and Compact chat had its say), get a tap span over each image without a tap of its own.
        val method = chatLineBuilder()
        val (init, start) = method.spanGroupConstructor()
        val badges = start + 2
        val message = start + 5
        method.addInstructions(init, """
            ${invokeStatic("$INFO->badges($CHAR_SEQUENCE)$CHAR_SEQUENCE", badges)}
            move-result-object v$badges
            ${invokeStatic("$INFO->message($CHAR_SEQUENCE)$CHAR_SEQUENCE", message)}
            move-result-object v$message
        """)
        bridgePlaceholder()
        hookBadgeRegistry()
        twitchSettings.add(
            SwitchSetting("chat_emote_info", "Emote and badge info",
                "Tap an emote or a badge in chat to see its name, a larger image and where it comes from, with a " +
                    "button that copies the name. Signed in, Twitch emotes keep Twitch's own emote card.",
                Section.CHAT, default = false),
        )
    }
}

/**
 * Every chat image span holds Twitch's placeholder drawable (the one the chat image size hook works on), whose
 * only String field is the image URL. The extension asks whether a drawable is one and reads its URL through two
 * bridges, so it never names the obfuscated class.
 */
private fun BytecodePatchContext.bridgePlaceholder() {
    val placeholder = ChatImageBoxFingerprint.twitchMatch("chat image box").method.parameterTypes[1].toString()
    val classDef = classDefBy(placeholder)
    if (classDef.superclass?.startsWith("Landroid/graphics/drawable/") != true) {
        throw PatchException("Twitch: the chat image placeholder isn't a drawable")
    }
    val url = classDef.fields.singleOrNull { it.type == STRING && !AccessFlags.STATIC.isSet(it.accessFlags) }
        ?: throw PatchException("Twitch: the chat image placeholder has no single URL field")
    Locators.record("twitch.emote_badge_info.placeholder", placeholder)
    bridge(INFO, "isPlaceholder", "instance-of p0, p0, $placeholder\nreturn p0")
    bridge(INFO, "placeholderUrl", """
        check-cast p0, $placeholder
        iget-object p0, p0, $placeholder->${url.name}:$STRING
        return-object p0
    """)
}

/**
 * Twitch's badge registry looks a badge key (set ID and version) up in the channel's badges, then in the global
 * ones. Right after each lookup's result is cast, the extension gets the URL (null when missing) with the key,
 * so the sheet can name a Twitch badge by its set and version and tell channel badges from global ones.
 */
private fun BytecodePatchContext.hookBadgeRegistry() {
    BadgeUrlFingerprint.twitchMatch("badge URL registry").method.apply {
        val instructions = instructionList()
        val created = instructions.indices.singleOrNull { instructions[it].opcode == Opcode.NEW_INSTANCE }
            ?: throw PatchException("Twitch: the badge registry makes no single key")
        val keyType = instructions[created].typeRef!!
        val printed = classDefBy(keyType).methods.singleOrNull { it.name == "toString" }?.implementation
            ?.instructions?.mapNotNull { it.stringRef }.orEmpty()
        if ("BadgeKey(setId=" !in printed || ", version=" !in printed) {
            throw PatchException("Twitch: the badge registry's key no longer prints its set and version")
        }
        val key = (instructions[created] as OneRegisterInstruction).registerA
        if (instructions.withIndex().any { (i, it) ->
                i != created && it.opcode.setsRegister() && (it as OneRegisterInstruction).registerA == key
            }) throw PatchException("Twitch: the badge registry reuses its key register")
        // The two lookups' results, cast to String: the channel's, then (after reading the global key) the global one.
        val casts = instructions.indices.filter { instructions[it].opcode == Opcode.CHECK_CAST && instructions[it].typeRef == STRING }
        if (casts.size != 2 || casts[0] < created || (casts[0]..casts[1]).none {
                instructions[it].opcode == Opcode.SGET_OBJECT && instructions[it].fieldRef?.type == "Ltv/twitch/android/models/Tuid;"
            }) throw PatchException("Twitch: unexpected badge registry lookups")
        listOf(casts[1] to "twitchGlobalBadge", casts[0] to "twitchChannelBadge").forEach { (cast, hook) ->
            val url = (instructions[cast] as OneRegisterInstruction).registerA
            requireNotBranchTarget(cast + 1, "badge registry lookup")
            addInstructions(cast + 1, invokeStatic("$INFO->$hook(${STRING}Ljava/lang/Object;)V", url, key))
        }
    }
}
