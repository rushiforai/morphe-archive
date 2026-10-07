package app.twoeno.patches.spotify.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getMutableMethod
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstStringInstruction
import app.twoeno.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import app.twoeno.patches.shared.EXTENSION
import app.twoeno.patches.shared.EXTENSION_PACKAGE
import app.twoeno.patches.shared.parameterRegister
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/HidePlayerAdsPatch;"

private const val EMBEDDED_AD_NPV_PLUGIN = "EmbeddedAdNpvPlugin"

@Suppress("unused")
val hidePlaylistAdsPatch = bytecodePatch(
    name = "Hide playlist ads",
    description = "Removes ads embedded into playlists.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith(EXTENSION)

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
            if (classDefByOrNull(type)?.superclass != "Ljava/lang/Enum;") return@forEach

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

@Suppress("unused")
val hideVideoAdsPatch = bytecodePatch(
    name = "Hide video ads",
    description = "Disables the video ad plugin of the now playing view.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith(EXTENSION)

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
        if (entryConstructors.isEmpty()) throw PatchException("Could not find the now playing view plugin entries")

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
