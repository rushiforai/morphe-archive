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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
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
            NativeSettingsAbi::class.java.getResourceAsStream("/ads/player-9.1.94.1929.properties")!!.use(::load)
        }
        for (type in snapshot.stringPropertyNames()) {
            val definition = classDefByOrNull(type)
                ?: throw PatchException("Spotify player advertising ABI changed: missing $type")
            if (NativeSettingsAbi.digest(definition) != snapshot.getProperty(type)) {
                throw PatchException("Spotify player advertising ABI changed: $type. Use the verified Spotify 9.1.94.1929 APK.")
            }
        }

        val method = mutableClassDefBy("Lp/zwa1;").methods.single {
            it.name == "invoke" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }
        val instructions = method.implementation!!.instructions.toList()
        // Spotify 9.1.94.1929: Section.Z() tests sectionTypeCase_ == IMAGE_BRAND_AD (30); it was o0() in
        // 9.1.80.2221. Its true branch reads Section.x(), the ImageBrandAd.
        val getter = "Lcom/spotify/scrollsita/v1/Section;->Z()Z"
        val matches = instructions.indices.filter {
            (instructions[it] as? ReferenceInstruction)?.reference.toString() == getter
        }
        if (matches.size != 1 || instructions.getOrNull(matches.single() + 1)?.opcode != Opcode.MOVE_RESULT) {
            throw PatchException("Expected one Now Playing image-ad mapper in Lp/zwa1;->invoke.")
        }
        val result = matches.single() + 1
        val register = (instructions[result] as OneRegisterInstruction).registerA
        // The branch on the result follows directly now; 9.1.80.2221 had one constant load in between.
        val branch = (result + 1..result + 2).firstOrNull { instructions.getOrNull(it)?.opcode == Opcode.IF_EQZ }
        if (branch == null || (instructions[branch] as OneRegisterInstruction).registerA != register) {
            throw PatchException("Now Playing image-ad branch changed its result register.")
        }
        method.addInstructions(result + 1, """
            invoke-static/range {v$register .. v$register}, Lapp/spicetify/extension/spotify/ads/PlayerAdCards;->showImageBrandAd(Z)Z
            move-result v$register
        """.trimIndent())

        // Spotify 9.1.94.1929: Lp/qns;->p (was Lp/onq;->z). It now loads its field into the `this` register,
        // which leaves v0 unassigned until the method's own first write, so v0 is still free as scratch.
        val embeddedAd = mutableClassDefBy("Lp/qns;").methods.single {
            it.name == "p" && it.returnType == "Z"
                && it.parameterTypes == listOf("Lcom/spotify/player/model/ContextTrack;")
        }
        val first = embeddedAd.getInstruction(0)
        val self = embeddedAd.implementation!!.registerCount - 2
        if (first.opcode != Opcode.IGET_OBJECT || (first as TwoRegisterInstruction).registerA != self
            || first.registerB != self || self == 0
            || (first as ReferenceInstruction).reference.toString() != "Lp/qns;->b:Ljava/lang/Object;"
        ) {
            throw PatchException("Expected the Now Playing embedded-ad predicate in Lp/qns;->p.")
        }
        embeddedAd.addInstructionsWithLabels(0, """
            invoke-static {}, Lapp/spicetify/extension/spotify/ads/PlayerAdCards;->showEmbeddedAd()Z
            move-result v0
            if-nez v0, :show
            const/4 v0, 0x0
            return v0
        """.trimIndent(), ExternalLabel("show", first))
        enableSetting("hidePlayerAdCards")
    }
}
