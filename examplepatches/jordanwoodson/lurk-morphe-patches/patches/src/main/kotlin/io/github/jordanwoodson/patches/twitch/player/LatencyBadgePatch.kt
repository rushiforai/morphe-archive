package io.github.jordanwoodson.patches.twitch.player

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.requireLowRegisters
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val LATENCY = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchLatency;"

@Suppress("unused")
val latencyBadgePatch = bytecodePatch(
    name = "Latency badge",
    description = "Shows how far a live stream plays behind the broadcast on Twitch's native player in the " +
        "theatre, read from the player itself once a second (the latency the stats panel reports). Tapping it " +
        "reloads the stream through Twitch's own Retry, a new access token and playlist that start at the live " +
        "edge: the native player has no seek to live. After a switch between channels the player can lose its " +
        "measure until the stream reloads; the badge then shows Twitch's own delay behind the broadcast from the " +
        "stream's timing tags, and reads ? s only until the first tag arrives. " +
        "Feed previews, videos and clips show nothing. " +
        "Starts off. Turn it on in Lurk settings > Playback.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)
    execute {
        // The presenter's latency: the base class method that returns its player's latency, which the IVS
        // wrapper reads from its MediaPlayer.
        val wrapper = NativePlayerLatencyFingerprint.twitchMatch("native player latency")
        val presenter = playerPresenterClass()
        val latency = presenter.methods.singleOrNull { method ->
            method.returnType == "J" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    instruction.opcode == Opcode.INVOKE_INTERFACE && ref?.name == wrapper.method.name &&
                        ref.returnType == "J" && ref.parameterTypes.isEmpty() && ref.definingClass in wrapper.classDef.interfaces
                } == true
        } ?: throw PatchException("Twitch: the player presenter no longer reads its player's latency")
        Locators.record("twitch.latency_badge.latency", latency)
        bridge(LATENCY, "latencyMillis", """
            check-cast p0, ${presenter.type}
            invoke-virtual { p0 }, ${presenter.type}->${latency.name}()J
            move-result-wide v0
            long-to-int v0, v0
            return v0
        """, locals = 2)
        // Twitch's own delay behind the broadcast, from the stream's ID3 timing tags: the badge's reading while
        // IVS reports a negative latency after a channel switch (issue 99). The parser's Long field written
        // from currentTimeMillis minus transc_r, and the wrapper's event made from the parsed tags.
        val command = Id3LatencyCommandFingerprint.twitchMatch("ID3 latency command").method
        val commandCode = command.implementation!!.instructions.toList()
        val clock = commandCode.indexOfLast { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == "Ljava/lang/System;" && it.name == "currentTimeMillis" } == true
        }
        val delay = commandCode.drop(clock + 1).firstOrNull { it.opcode == Opcode.IPUT_OBJECT }
            ?.let { (it as ReferenceInstruction).reference as FieldReference }
            ?.takeIf { clock >= 0 && it.type == "Ljava/lang/Long;" }
            ?: throw PatchException("Twitch: the ID3 parser no longer stores the delay behind the broadcast")
        val metadata = PlayerId3MetadataFingerprint.twitchMatch("player ID3 metadata")
        if (metadata.classDef.type != wrapper.classDef.type) {
            throw PatchException("Twitch: ID3 metadata is no longer parsed by the IVS player wrapper")
        }
        val metadataMethod = metadata.method
        val metadataCode = metadataMethod.implementation!!.instructions.toList()
        val eventIndex = metadataCode.indexOfFirst { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_DIRECT && ref?.name == "<init>" &&
                ref.parameterTypes.map { it.toString() } == listOf(delay.definingClass)
        }
        if (eventIndex < 0) throw PatchException("Twitch: the player no longer makes an event from ID3 tags")
        val tags = (metadataCode[eventIndex] as FiveRegisterInstruction).registerD
        val self = metadataMethod.parameterRegister(0)
        metadataMethod.requireUnwritten(self, eventIndex, "IVS player wrapper")
        metadataMethod.requireNotBranchTarget(eventIndex + 1, "ID3 metadata event")
        metadataMethod.requireLowRegisters("ID3 metadata event", self, tags)
        metadataMethod.addInstructions(eventIndex + 1,
            invokeStatic("$LATENCY->id3(Ljava/lang/Object;Ljava/lang/Object;)V", self, tags))
        Locators.record("twitch.latency_badge.id3", metadataMethod)
        bridge(LATENCY, "id3Delay", """
            check-cast p0, ${delay.definingClass}
            iget-object p0, p0, $delay
            return-object p0
        """)
        val playerField = latency.implementation!!.instructions.firstOrNull { it.opcode == Opcode.IGET_OBJECT }
            ?.let { (it as ReferenceInstruction).reference as FieldReference }
            ?: throw PatchException("Twitch: the player presenter's latency no longer reads its player field")
        bridge(LATENCY, "player", """
            check-cast p0, ${presenter.type}
            iget-object p0, p0, $playerField
            return-object p0
        """)

        val retry = playerRetry()
        bridge(LATENCY, "retry", """
            check-cast p0, ${retry.definingClass}
            const/4 v0, 0x0
            invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
            move-result-object v0
            const/4 v1, 0x1
            invoke-interface { p0, v0, v1 }, $retry
            return-void
        """, locals = 2)

        // Each presenter's player view, where the badge goes.
        hookPlayerViewAttach()

        twitchSettings.add(SwitchSetting("latency_badge", "Latency badge",
            "Shows how far a live stream is behind the broadcast on the player. Tap it to reload the stream at " +
                "the live edge (a new access token and playlist, as Twitch's Retry). When the player loses its measure, it " +
                "shows Twitch's own delay behind the broadcast instead. Applies to players opened after it's turned on.",
            Section.PLAYBACK, default = false))
    }
}
