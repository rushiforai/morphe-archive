package io.github.jordanwoodson.patches.twitch.ads

import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.shared.addInstructionsIfEnabled
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.hex
import io.github.jordanwoodson.patches.twitch.shared.twitchHermes
import io.github.jordanwoodson.patches.twitch.shared.twitchHermesPatch
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val KEY = "block_display_ads"

@Suppress("unused")
val blockDisplayAdsPatch = bytecodePatch(
    name = "Block display ads",
    description = "Blocks the ad requests that Block client ads doesn't cover: stream display ads (squeezeback " +
        "and lower third), audio ads, multi-format ad pods, the Following headliner, feed display and video " +
        "ads and brand surveys, in both the native and React Native parts of the app. Each request gets the " +
        "failure or no-ad answer Twitch already handles. Sponsorship and paid-promotion labels are kept. " +
        "Ads stitched into the stream by the server still play.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch, twitchHermesPatch)
    execute {
        wrapAdEdgeServices()

        // React Native fetches its ads itself (feed, headliner, stream display and VAST video ads),
        // all from the same ad server. The URL check happens in the extension, per request.
        RnNetworkRequestFingerprint.twitchMatch("React Native network request").method.addInstructions(0, """
            invoke-static/range { p2 .. p2 }, $ADS->rnRequestUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """)

        // A VAST ad that reaches React Native's video ad player anyway gets Twitch's own no-fill error.
        val player = classDefBy(RN_VIDEO_AD_PLAYER)
        if (player.fields.none { it.name == "released" && it.type == "Z" } ||
            player.fields.none { it.name == "delegate" && it.type == RN_VIDEO_AD_DELEGATE }) {
            throw PatchException("Twitch: React Native video ad player state changed")
        }
        RnVideoAdParseFingerprint.twitchMatch("React Native video ad parse").method.addInstructionsIfEnabled(KEY, """
            invoke-static/range { p0 .. p0 }, $ADS->declineRnVideoAd(Ljava/lang/Object;)V
            return-void
        """)

        // A brand survey takes the place of a native feed ad that didn't fill.
        val survey = BrandSurveyStateFingerprint.twitchMatch("brand survey state").classDef
        val constructor = survey.methods.singleOrNull {
            it.name == "<init>" && it.parameterTypes.firstOrNull()?.toString() == BRAND_SURVEY_ITEM
        } ?: throw PatchException("Twitch: no unique brand survey state constructor")
        constructor.addInstructions(0, """
            invoke-static/range { p1 .. p1 }, $ADS->brandSurvey(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object p1
            check-cast p1, $BRAND_SURVEY_ITEM
        """)

        // React Native's feed (Home): no ad slots, so no feed ad requests, and no FeedAd cards.
        val slots = twitchHermes.function("extractAdSlots")
        // After `NewArray r0, 0`, return that empty array instead of reading the feed's edges.
        twitchHermes.replace(slots, KEY, hex("08 00 00 00 89 03 01"), hex("08 00 00 00 76 00 00"))
        // The FeedAd branch (`!context.removedAdIds.has(node.id)`, entered only by its jump) returns false.
        // Nothing jumps into the replaced instructions; the next one is the FeedRecap branch. The registers are
        // the compiler's for the supported version (removedAdIds r6, node r4).
        val visible = twitchHermes.function("isEdgeVisible")
        val has = twitchHermes.id8("has")
        val id = twitchHermes.id8("id")
        twitchHermes.replace(visible, KEY,
            hex("44 05 06 07 $has 44 04 04 0a $id 6e 04 05 06 04 13 00 04 76 00"),
            hex("96 00 76 00") + ByteArray(16))

        twitchSettings.add(SwitchSetting(KEY, "Block display ads",
            "Stream display, audio, headliner and feed ads, and brand surveys. Stitched stream ads still play.",
            Section.PRIVACY, restart = true))
    }
}

/**
 * Wraps the AdEdgeApi Retrofit service where each of its lazy creators makes it, so the extension can
 * answer its requests. The service is an unobfuscated interface; Retrofit's create method is renamed.
 */
private fun BytecodePatchContext.wrapAdEdgeServices() {
    val creators = AdEdgeApiCreatorFingerprint.matchAllOrNull().orEmpty()
    if (creators.size != 4) throw PatchException("Twitch: expected 4 AdEdgeApi creators, found ${creators.size}")
    creators.forEach { match ->
        val method = match.method
        val instructions = method.implementation!!.instructions.toList()
        val casts = instructions.indices.filter { index ->
            val type = ((instructions[index] as? ReferenceInstruction)?.reference as? TypeReference)?.type
            index >= 3 && type == AD_EDGE_API &&
                instructions[index].opcode == Opcode.CHECK_CAST &&
                instructions[index - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                instructions[index - 3].opcode == Opcode.CONST_CLASS &&
                ((instructions[index - 3] as ReferenceInstruction).reference as TypeReference).type == AD_EDGE_API &&
                ((instructions[index - 2] as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                    it.parameterTypes.map { type -> type.toString() } == listOf("Ljava/lang/Class;") &&
                        it.returnType == "Ljava/lang/Object;"
                } == true
        }
        val cast = casts.singleOrNull() ?: throw PatchException("Twitch: AdEdgeApi creation changed in ${method.definingClass}")
        val register = (instructions[cast - 1] as OneRegisterInstruction).registerA
        // Between Retrofit's result and its cast to AdEdgeApi; the proxy implements the same interface.
        method.addInstructions(cast, """
            invoke-static/range { v$register .. v$register }, $ADS->wrapAdEdge(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$register
        """)
    }
}
