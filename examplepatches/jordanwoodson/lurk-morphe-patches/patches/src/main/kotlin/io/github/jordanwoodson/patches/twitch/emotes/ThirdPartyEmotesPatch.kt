package io.github.jordanwoodson.patches.twitch.emotes

import io.github.jordanwoodson.patches.twitch.chat.twitchRNChatPatch

import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import io.github.jordanwoodson.patches.twitch.shared.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.jordanwoodson.patches.shared.settings.ChoiceSetting
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.twitch.shared.freeRegister
import io.github.jordanwoodson.patches.twitch.shared.requireFreeRegister
import io.github.jordanwoodson.patches.twitch.shared.requireKept
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val EMOTES = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchEmotes;"

@Suppress("unused")
val thirdPartyEmotesPatch = bytecodePatch(
    name = "Third-party emotes",
    description = "Adds switches that show 7TV, BetterTTV and FrankerFaceZ emotes in chat, Twitch's chat history " +
        "and VOD chat replay. When on, each sends the ID of the channel you watch to that service (7tv.io, " +
        "api.betterttv.net, api.frankerfacez.com) for its emote lists and loads the emote images from its CDN. " +
        "\"Emotes in the picker\" also lists them in the emote picker, one section per service, and in " +
        "autocomplete after ':', from the same lists; that part was checked with Twitch's own picker and " +
        "autocomplete code on Android's runtime, not in the app, which needs an account to open the picker. " +
        "\"Autocomplete without ':'\" suggests emotes (Twitch's and these) for a plain word of three letters or " +
        "more, checked the same way. \"Favorite emotes\" adds a Favorites section to the picker: long-press an " +
        "emote to add it, long-press a favorite to remove it; kept on the phone, checked the same way. " +
        "Starts off. Turn it on in Lurk settings > Chat.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchRNChatPatch, twitchSettingsPatch, chatImageSizePatch, thirdPartyImageCachePatch)
    execute {
        hookLiveMatcher()
        hookReplayTokens()
        hookEmoteUrl()
        hookEmoteClick()
        hookReactNative()
        hookEmotePicker(ClientEmoteFingerprint.twitchMatch("client emote class").classDef.type)
        ChatConnectFingerprint.twitchMatch("chat connect").method.apply {
            val channel = parameterRegister(1)
            addInstructions(0, "invoke-static/range { v$channel .. v$channel }, $EMOTES->onChatChannel(Ljava/lang/Object;)V")
        }
        twitchSettings.add(
            SwitchSetting("emotes_7tv", "7TV emotes",
                "Shows 7TV emotes in chat. Sends the ID of the channel you watch to 7tv.io and loads images from cdn.7tv.app.",
                Section.CHAT, default = false),
            SwitchSetting("emotes_bttv", "BetterTTV emotes",
                "Shows BetterTTV emotes in chat. Sends the ID of the channel you watch to api.betterttv.net and loads images from cdn.betterttv.net.",
                Section.CHAT, default = false),
            SwitchSetting("emotes_ffz", "FrankerFaceZ emotes",
                "Shows FrankerFaceZ emotes in chat. Sends the ID of the channel you watch to api.frankerfacez.com and loads images from cdn.frankerfacez.com.",
                Section.CHAT, default = false),
            SwitchSetting("emotes_picker", "Emotes in the picker",
                "Lists the emotes of the services turned on above in the emote picker, one section each, and in " +
                    "autocomplete after ':'. Uses the lists chat already loads and sends nothing else.",
                Section.CHAT, default = false),
            SwitchSetting("emotes_autocomplete_bare", "Autocomplete without ':'",
                "Suggests emotes for the word you are typing once it has a few characters, without typing ':' " +
                    "first. Twitch's emotes, plus the services' above while Emotes in the picker is on. " +
                    "Not after a command (/...).",
                Section.CHAT, default = false),
            ChoiceSetting("emotes_autocomplete_bare_min", "Autocomplete after", "", Section.CHAT, "3",
                listOf("2 characters" to "2", "3 characters" to "3", "4 characters" to "4"),
                parent = "emotes_autocomplete_bare"),
            ChoiceSetting("emotes_autocomplete_bare_match", "Autocomplete matches", "", Section.CHAT, "0",
                listOf("Start of the name" to "0", "Anywhere in the name" to "1"),
                parent = "emotes_autocomplete_bare"),
            SwitchSetting("emotes_favorites", "Favorite emotes",
                "Long-press an emote in the emote picker to add it to a Favorites section at the top; long-press a " +
                    "favorite to remove it. Twitch's and the services' emotes. Emotes with Twitch's own variants " +
                    "keep their long press. The list stays on this phone.",
                Section.CHAT, default = false),
        )
    }
}

/** The instruction index whose string constant is [value]. */
private fun MutableMethod.stringIndex(value: String) = implementation!!.instructions.indexOfFirst {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
}

/**
 * Live chat, Twitch's chat history and shared chat: right after the matcher reads the client-parsed emote set,
 * the set is replaced by Twitch's set plus third-party emotes made as Twitch's own emote class.
 */
private fun BytecodePatchContext.hookLiveMatcher() {
    val emoteType = ClientEmoteFingerprint.twitchMatch("client emote class").classDef.type
    val data = LiveChatMessageDataFingerprint.twitchMatch("live chat message data").method
    val label = data.stringIndex(", clientParsedEmotes=")
    val setField = data.implementation!!.instructions.drop(label + 1).firstOrNull { it.opcode == Opcode.IGET_OBJECT }
        ?.let { (it as ReferenceInstruction).reference as FieldReference }
        ?.takeIf { it.type == "Ljava/util/Set;" && it.definingClass == data.definingClass }
        ?: throw PatchException("Twitch: no client-parsed emote set field")

    EmoteMatcherFingerprint.twitchMatch("chat emote matcher").method.apply {
        val instructions = implementation!!.instructions
        val reads = instructions.indices.filter { i ->
            instructions[i].opcode == Opcode.IGET_OBJECT &&
                (instructions[i] as ReferenceInstruction).reference.toString() == setField.toString()
        }
        val read = reads.singleOrNull() ?: throw PatchException("Twitch: expected one emote set read, found ${reads.size}")
        val set = (instructions[read] as TwoRegisterInstruction).registerA
        // The loop that consumes the set casts its elements to the emote class.
        if (instructions.none { it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == emoteType }) {
            throw PatchException("Twitch: emote matcher no longer uses $emoteType")
        }
        // The prologue copies the channel (p1) to a low register that is still unchanged at the read.
        val p1 = parameterRegister(1)
        val copy = instructions.indices.firstOrNull { i ->
            instructions[i].opcode == Opcode.MOVE_OBJECT_FROM16 && (instructions[i] as TwoRegisterInstruction).registerB == p1
        } ?: throw PatchException("Twitch: emote matcher doesn't copy its channel")
        val channel = (instructions[copy] as TwoRegisterInstruction).registerA
        if (copy > read) throw PatchException("Twitch: emote matcher copies its channel late")
        requireKept(copy, read, channel, "emote matcher channel")
        val insert = read + 1
        requireNotBranchTarget(insert, "emote set read")
        val scratch = freeRegister(insert, listOf(set, channel), "emote matcher")
        if (set > 15 || channel > 15) throw PatchException("Twitch: emote matcher registers out of range")
        addInstructions(insert, """
            const-class v$scratch, $emoteType
            invoke-static { v$set, v$scratch, v$channel }, $EMOTES->clientEmotes(Ljava/util/Set;Ljava/lang/Class;Ljava/lang/Object;)Ljava/util/Set;
            move-result-object v$set
        """)
    }
}

/** VOD chat replay: the message's named MessageToken list, right after the builder reads it. */
private fun BytecodePatchContext.hookReplayTokens() {
    val matcherClass = EmoteMatcherFingerprint.twitchMatch("chat emote matcher").classDef.type
    val match = ReplayTokensFingerprint.twitchMatch("chat replay builder")
    match.method.apply {
        if (match.classDef.type != matcherClass || parameterTypes[0].toString() != matcherClass) {
            throw PatchException("Twitch: chat replay builder moved")
        }
        val instructions = implementation!!.instructions
        val call = match.instructionMatches.first().index
        val result = instructions[call + 1]
        if (result.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("Twitch: replay tokens not kept")
        val tokens = (result as OneRegisterInstruction).registerA
        val insert = call + 2
        requireNotBranchTarget(insert, "replay tokens")
        val scratch = freeRegister(insert, listOf(tokens), "replay tokens")
        if (tokens > 15) throw PatchException("Twitch: replay tokens register out of range")
        addInstructions(insert, """
            move-object/from16 v$scratch, p1
            invoke-static { v$tokens, v$scratch }, $EMOTES->messageTokens(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;
            move-result-object v$tokens
        """)
    }
}

/** Emote URLs: the finished static-cdn URL string, before it goes into the URL details. */
private fun BytecodePatchContext.hookEmoteUrl() {
    EmoteUrlFingerprint.twitchMatch("emote URL builder").method.apply {
        val details = returnType
        val instructions = implementation!!.instructions
        val constructors = instructions.indices.filter { i ->
            val ref = (instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
            instructions[i].opcode == Opcode.INVOKE_DIRECT && ref?.definingClass == details && ref.name == "<init>" &&
                ref.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/String;" && ref.parameterTypes.size == 2
        }
        val index = constructors.singleOrNull() ?: throw PatchException("Twitch: expected one emote URL result")
        val url = (instructions[index] as FiveRegisterInstruction).registerD
        val built = instructions[index - 1]
        if (built.opcode != Opcode.MOVE_RESULT_OBJECT || (built as OneRegisterInstruction).registerA != url) {
            throw PatchException("Twitch: emote URL is not the string just built")
        }
        requireNotBranchTarget(index, "emote URL result")
        addInstructions(index, """
            invoke-static { v$url }, $EMOTES->url(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$url
        """)
    }
}

/**
 * Emote spans: third-party emotes get no click span, since Twitch's emote card would look their synthetic
 * IDs up on Twitch and fail.
 */
private fun BytecodePatchContext.hookEmoteClick() {
    EmoteSpanFingerprint.twitchMatch("emote span builder").method.apply {
        val instructions = implementation!!.instructions
        val clicks = instructions.indices.filter { i ->
            val ref = (instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
            instructions[i].opcode == Opcode.INVOKE_DIRECT && ref?.name == "<init>" &&
                ref.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;", TUID,
                    "Ltv/twitch/android/core/mvp/viewdelegate/EventDispatcher;")
        }
        val init = clicks.singleOrNull() ?: throw PatchException("Twitch: expected one emote click span")
        val clickType = ((instructions[init] as ReferenceInstruction).reference as MethodReference).definingClass
        val create = (init downTo 0).first { i ->
            instructions[i].opcode == Opcode.NEW_INSTANCE &&
                ((instructions[i] as ReferenceInstruction).reference as TypeReference).type == clickType
        }
        // if-eqz <dispatcher>, :no_click / new-instance <click span> / iget-object <id>, <emote>, ->id
        val guard = instructions[create - 1]
        if (guard.opcode != Opcode.IF_EQZ) throw PatchException("Twitch: emote click span isn't optional")
        val skip = (guard as BuilderOffsetInstruction).target.location.instruction
            ?: throw PatchException("Twitch: no emote click span skip target")
        val id = instructions[create + 1]
        if (id.opcode != Opcode.IGET_OBJECT || ((id as ReferenceInstruction).reference as FieldReference).type != "Ljava/lang/String;") {
            throw PatchException("Twitch: emote click span doesn't read the emote ID")
        }
        val scratch = (id as TwoRegisterInstruction).registerA
        val emote = id.registerB
        requireNotBranchTarget(create, "emote click span")
        requireFreeRegister(create, scratch, "emote click span")
        if (scratch > 15 || emote > 15) throw PatchException("Twitch: emote click registers out of range")
        addInstructionsWithLabels(create, """
            iget-object v$scratch, v$emote, ${id.reference}
            invoke-static { v$scratch }, $EMOTES->isThirdParty(Ljava/lang/String;)Z
            move-result v$scratch
            if-nez v$scratch, :lurk_no_click
        """, ExternalLabel("lurk_no_click", skip))
    }
}

/**
 * React Native chat (live channels while Twitch's Ultralight experiment is on): chat frames get emote
 * ranges for third-party words, and image sources map the synthetic emote URLs to the provider CDN. Both
 * hooks pass every other string through.
 */
private fun BytecodePatchContext.hookReactNative() {
    RnWebSocketTextFingerprint.twitchMatch("React Native WebSocket text listener").method.apply {
        val text = parameterRegister(2)
        addInstructions(0, """
            invoke-static/range { v$text .. v$text }, $EMOTES->rnFrame(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$text
        """)
    }
    RnImageSourceFingerprint.twitchMatch("React Native image source").method.apply {
        // Before the superclass constructor; only the URI parameter is touched, never this.
        val uri = parameterRegister(2)
        addInstructions(0, """
            invoke-static/range { v$uri .. v$uri }, $EMOTES->url(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$uri
        """)
    }
}
