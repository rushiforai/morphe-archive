package app.spicetify.patches.spotify.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.spicetify.patches.spotify.settings.NativeSettingsAbi
import app.spicetify.patches.spotify.settings.enableSetting
import app.spicetify.patches.spotify.settings.settingsPatch
import app.spicetify.patches.spotify.spotifyCompatibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.util.Properties

@Suppress("unused")
val playerAdCardsPatch = bytecodePatch(
    name = "Hide player ad cards",
    description = "Hides image brand-ad cards and embedded ad pages in Now Playing. " +
        "Does not suppress audio ads or other player overlays. Experimental.",
    default = false,
) {
    compatibleWith(spotifyCompatibility)
    dependsOn(settingsPatch)

    execute {
        val snapshot = Properties().apply {
            NativeSettingsAbi::class.java.getResourceAsStream("/ads/player-9.1.88.2204.properties")!!.use(::load)
        }
        for (type in snapshot.stringPropertyNames()) {
            val definition = classDefByOrNull(type)
                ?: throw PatchException("Spotify player advertising ABI changed: missing $type")
            if (NativeSettingsAbi.digest(definition) != snapshot.getProperty(type)) {
                throw PatchException("Spotify player advertising ABI changed: $type. Use the verified Spotify 9.1.88.2204 APK.")
            }
        }

        val method = mutableClassDefBy("Lp/t771;").methods.single {
            it.name == "invoke" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }
        val instructions = method.implementation!!.instructions.toList()
        val getter = "Lcom/spotify/scrollsita/v1/Section;->Z()Z"
        val matches = instructions.indices.filter {
            (instructions[it] as? ReferenceInstruction)?.reference.toString() == getter
        }
        if (matches.size != 1 || instructions.getOrNull(matches.single() + 1)?.opcode != Opcode.MOVE_RESULT ||
            instructions.getOrNull(matches.single() + 2)?.opcode != Opcode.IF_EQZ
        ) {
            throw PatchException("Expected one Now Playing image-ad mapper in Lp/t771;->invoke.")
        }
        val result = matches.single() + 1
        val register = (instructions[result] as OneRegisterInstruction).registerA
        if ((instructions[result + 1] as OneRegisterInstruction).registerA != register) {
            throw PatchException("Now Playing image-ad branch changed its result register.")
        }
        method.addInstructions(
            result + 1,
            """
            invoke-static/range {v$register .. v$register}, Lapp/spicetify/extension/spotify/ads/PlayerAdCards;->showImageBrandAd(Z)Z
            move-result v$register
            """.trimIndent(),
        )

        val embeddedAd = mutableClassDefBy("Lp/uur;").methods.single {
            it.name == "n" && it.returnType == "Z" &&
                it.parameterTypes == listOf("Lcom/spotify/player/model/ContextTrack;")
        }
        val first = embeddedAd.getInstruction(0)
        if (first.opcode != Opcode.IGET_OBJECT ||
            (first as ReferenceInstruction).reference.toString() != "Lp/uur;->b:Ljava/lang/Object;"
        ) {
            throw PatchException("Expected the Now Playing embedded-ad predicate in Lp/uur;->n.")
        }
        // The early return writes v0 before the body runs, so it must be a local, not a parameter.
        val parameterRegisters = embeddedAd.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } + 1
        if (embeddedAd.implementation!!.registerCount <= parameterRegisters) {
            throw PatchException("Lp/uur;->n has no free register for its hook.")
        }
        embeddedAd.addInstructionsWithLabels(
            0,
            """
            invoke-static {}, Lapp/spicetify/extension/spotify/ads/PlayerAdCards;->showEmbeddedAd()Z
            move-result v0
            if-nez v0, :show
            const/4 v0, 0x0
            return v0
            """.trimIndent(),
            ExternalLabel("show", first),
        )
        enableSetting("hidePlayerAdCards")
    }
}
