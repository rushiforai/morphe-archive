package app.spicetify.patches.spotify.navigation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.spicetify.patches.spotify.settings.NativeSettingsAbi
import app.spicetify.patches.spotify.settings.enableSetting
import app.spicetify.patches.spotify.settings.settingsPatch
import app.spicetify.patches.spotify.spotifyCompatibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.Properties

@Suppress("unused")
val premiumTabPatch = bytecodePatch(
    name = "Hide Premium tab",
    description = "Hides the Premium navigation tab. Change this in Spicetify settings, " +
        "then restart Spotify. Does not change your subscription or remove other ads.",
    default = false,
) {
    compatibleWith(spotifyCompatibility)
    dependsOn(settingsPatch)

    execute {
        val snapshot = Properties().apply {
            NativeSettingsAbi::class.java.getResourceAsStream("/navigation/9.1.80.2221.properties")!!.use(::load)
        }
        for (type in snapshot.stringPropertyNames()) {
            val definition = classDefByOrNull(type)
                ?: throw PatchException("Spotify navigation ABI changed: missing $type")
            if (NativeSettingsAbi.digest(definition) != snapshot.getProperty(type)) {
                throw PatchException("Spotify navigation ABI changed: $type. Use the verified Spotify 9.1.80.2221 APK.")
            }
        }

        val method = mutableClassDefBy("Lp/tkd0;").methods.single {
            it.name == "invoke" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/Object;"
        }
        val instructions = method.implementation!!.instructions.toList()
        val matches = instructions.indices.filter { index ->
            val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Lp/f4p0;" && reference.name == "b" &&
                reference.parameterTypes.isEmpty() && reference.returnType == "Z"
        }
        if (matches.size != 1 || instructions.getOrNull(matches.single() + 1)?.opcode != Opcode.MOVE_RESULT) {
            throw PatchException("Expected one Premium navigation flag result.")
        }
        val index = matches.single() + 1
        val register = (instructions[index] as OneRegisterInstruction).registerA
        method.addInstructions(index + 1, """
            invoke-static/range {v$register .. v$register}, Lapp/spicetify/extension/spotify/settings/PatchSettings;->showPremiumTab(Z)Z
            move-result v$register
        """.trimIndent())
        enableSetting("hidePremiumTab")
    }
}
