package app.spicetify.patches.spotify.home

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.spicetify.patches.spotify.settings.NativeSettingsAbi
import app.spicetify.patches.spotify.settings.enableSetting
import app.spicetify.patches.spotify.settings.settingsPatch
import app.spicetify.patches.spotify.spotifyCompatibility
import java.util.Properties

@Suppress("unused")
val homePinsPatch = bytecodePatch(
    name = "Pin shortcuts on Home",
    description = "Choose which of Spotify's Home shortcuts appear first in Spicetify settings. " +
        "Pins are saved on this device. Restart Spotify after changing pins.",
    default = false,
) {
    compatibleWith(spotifyCompatibility)
    dependsOn(settingsPatch)

    execute {
        val snapshot = Properties().apply {
            NativeSettingsAbi::class.java.getResourceAsStream("/home/9.1.80.2221.properties")!!.use(::load)
        }
        for (type in snapshot.stringPropertyNames()) {
            val definition = classDefByOrNull(type)
                ?: throw PatchException("Spotify Home ABI changed: missing $type")
            if (NativeSettingsAbi.digest(definition) != snapshot.getProperty(type)) {
                throw PatchException("Spotify Home ABI changed: $type. Use the verified Spotify 9.1.80.2221 APK.")
            }
        }

        // Replace the constructor argument before assignment. Both native grid renderers
        // consume this model; its elements, click handlers, and server list remain intact.
        mutableClassDefBy("Lp/joz0;").methods.single {
            it.name == "<init>" && it.parameterTypes ==
                listOf("Ljava/lang/String;", "Ljava/util/ArrayList;", "Lp/qt10;")
        }.addInstructions(1, """
            invoke-static {p2}, Lapp/spicetify/extension/spotify/home/HomePins;->reorder(Ljava/util/ArrayList;)Ljava/util/ArrayList;
            move-result-object p2
        """.trimIndent())
        enableSetting("homePins")
    }
}
