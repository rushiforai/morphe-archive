package app.spicetify.patches.spotify.home

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.spicetify.patches.spotify.extensions.playerBridgePatch
import app.spicetify.patches.spotify.settings.NativeSettingsAbi
import app.spicetify.patches.spotify.settings.enableSetting
import app.spicetify.patches.spotify.settings.settingsPatch
import app.spicetify.patches.spotify.spotifyCompatibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import java.util.Properties

private const val SECTION_MODEL = "Lp/joz0;"
private const val HOME_TILE_BRIDGE = "Lapp/spicetify/extension/spotify/home/nativebridge/HomeTileBridge;"

@Suppress("unused")
val homePinsPatch = bytecodePatch(
    name = "Pin shortcuts on Home",
    description = "Pick playlists, albums or Liked Songs to pin first on Home, or turn on Show only " +
        "my pins to hide Spotify's other shortcuts. Pins are saved on this device; restart Spotify " +
        "after changing them.",
    default = false,
) {
    compatibleWith(spotifyCompatibility)
    dependsOn(settingsPatch, playerBridgePatch) // the picker reads Your Library through the player bridge

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

        // The section model's constructor, which Lp/jne1;->u calls once Spotify has cut its rows to 10, gets
        // them from the bridge before storing them from p2 at index 1. Both native grid renderers read this
        // model. Spotify's rows stay the same objects, with their click handlers, and the bridge adds a tile
        // only for a pin Spotify left out.
        val constructor = mutableClassDefBy(SECTION_MODEL).methods.single {
            it.name == "<init>" && it.parameterTypes ==
                listOf("Ljava/lang/String;", "Ljava/util/ArrayList;", "Lp/qt10;")
        }
        if (!isRowsStore(constructor.implementation!!.instructions.getOrNull(1))) {
            throw PatchException("Spotify Home ABI changed: $SECTION_MODEL. Use the verified Spotify 9.1.80.2221 APK.")
        }
        constructor.addInstructions(1, """
            invoke-static {p1, p2}, $HOME_TILE_BRIDGE->apply(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;
            move-result-object p2
        """.trimIndent())
        enableSetting("homePins")
    }
}

/**
 * Whether [instruction] is `iput-object v2, v0, Lp/joz0;->a`, the section model's constructor storing its rows
 * from p2, which the hook replaces first.
 */
internal fun isRowsStore(instruction: Instruction?): Boolean =
    instruction?.opcode == Opcode.IPUT_OBJECT &&
        (instruction as ReferenceInstruction).reference.toString() == "$SECTION_MODEL->a:Ljava/util/ArrayList;" &&
        (instruction as TwoRegisterInstruction).registerA == 2 && instruction.registerB == 0
