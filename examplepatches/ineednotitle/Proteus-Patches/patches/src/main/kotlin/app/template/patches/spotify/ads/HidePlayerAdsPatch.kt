package app.template.patches.spotify.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.SPOTIFY_COMPATIBILITY
import app.template.patches.shared.getMutableMethod
import app.template.patches.shared.getReference
import app.template.patches.shared.indexOfFirstStringInstruction
import app.template.patches.spotify.shared.parameterRegister
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS =
    "Lapp/template/extension/extension/SpotifyPlayerAdFilter;"

private const val EMBEDDED_AD_NPV_PLUGIN = "EmbeddedAdNpvPlugin"

// Removes ads embedded into playlists.
//
// Playlist ad slots are described by an "embedded ad playlist" properties
// object whose first two parameters are ad-placement enums. The patch replaces
// those enum parameters with the placement's NONE constant (resolved by name at
// runtime through the extension), so the playlist renders without ad slots.
// Non-enum parameters are left alone.
//
// Fail-safe: the extension returns the original value when the enum has no
// NONE constant; a properties class that no longer matches its string markers
// fails the patch loudly at patch time.

@Suppress("unused")
val spotifyHidePlaylistAdsPatch = bytecodePatch(
    name = "Hide playlist ads",
    description = "Removes ads embedded into playlists.",
    default = true,
) {
    compatibleWith(SPOTIFY_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val propertiesClass = classDefByStrings("android-embeddedadplaylist")
            .intersect(classDefByStrings("embedded_ad_placement").toSet())
            .singleOrNull() ?: throw PatchException("Could not find the embedded ad playlist properties")

        val constructor = mutableClassDefBy(propertiesClass).methods.singleOrNull { method ->
            method.name == "<init>" && method.implementation != null && method.parameterTypes.size > 2
        } ?: throw PatchException("Could not find the embedded ad playlist properties constructor")

        // The first two parameters are the ad placement enums. Replace them with NONE.
        (0..1).forEach { index ->
            val type = constructor.parameterTypes[index].toString()
            if (runCatching { classDefBy(type) }.getOrNull()?.superclass != "Ljava/lang/Enum;") return@forEach

            val register = constructor.parameterRegister(index)
            constructor.addInstructions(
                0,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->toNone(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$register
                    check-cast v$register, $type
                """,
            )
        }
    }
}

// Disables the video ad plugin of the now playing view.
//
// Now-playing plugins are registered through entries of the shape
// (String name, Plugin plugin, boolean enabled). The patch routes the enabled
// flag through the extension, which turns it off for the embedded video ad
// plugin ("EmbeddedAdNpvPlugin") and keeps every other plugin's flag.
//
// Fail-safe: plugin registrations that do not match the (String, ?, boolean)
// shape are never touched; the extension passes unknown plugin names through.

@Suppress("unused")
val spotifyHideVideoAdsPatch = bytecodePatch(
    name = "Hide video ads",
    description = "Disables the video ad plugin of the now playing view.",
    default = true,
) {
    compatibleWith(SPOTIFY_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // Plugin entries are created with (String name, Plugin plugin, boolean enabled).
        val entryConstructors = classDefByStrings(EMBEDDED_AD_NPV_PLUGIN)
            .flatMap { it.methods }
            .filter { it.implementation != null && it.indexOfFirstStringInstruction(EMBEDDED_AD_NPV_PLUGIN) >= 0 }
            .flatMap { it.instructions }
            .mapNotNull { it.getReference<MethodReference>() }
            .filter { reference ->
                val parameters = reference.parameterTypes.map { it.toString() }
                reference.name == "<init>" &&
                    parameters.size == 3 && parameters[0] == "Ljava/lang/String;" && parameters[2] == "Z"
            }
            .distinctBy { it.toString() }
        if (entryConstructors.isEmpty()) {
            throw PatchException("Could not find the now playing view plugin entries")
        }

        entryConstructors.forEach { reference ->
            val constructor = reference.getMutableMethod()
            val nameRegister = constructor.parameterRegister(0)
            val enabledRegister = constructor.parameterRegister(2)
            val pluginType = constructor.parameterTypes[1].toString()

            val isEnabledCall = if (pluginType.startsWith("L") || pluginType.startsWith("[")) {
                "invoke-static/range { v$nameRegister .. v$enabledRegister }, " +
                    "$EXTENSION_CLASS->isPluginEnabled(Ljava/lang/String;Ljava/lang/Object;Z)Z"
            } else {
                "invoke-static { v$nameRegister, v$enabledRegister }, " +
                    "$EXTENSION_CLASS->isPluginEnabled(Ljava/lang/String;Z)Z"
            }
            constructor.addInstructions(
                0,
                """
                    $isEnabledCall
                    move-result v$enabledRegister
                """,
            )
        }
    }
}
