package io.github.henr1klmb.patches.oebb

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val DEFAULT_TILE_URL = "https://tile.openstreetmap.org/{z}/{x}/{y}.png"

private fun updateOrAppendProperty(text: String, key: String, value: String): String {
    val regex = Regex("""^$key=.*$""", RegexOption.MULTILINE)
    return if (text.contains(regex)) {
        text.replace(regex, "$key=$value")
    } else {
        buildString {
            append(text)
            if (!text.endsWith("\n")) append("\n")
            appendLine("$key=$value")
        }
    }
}

@Suppress("unused")
val enableOsmMapPatch = patch(
    name = "Enable OSM map",
    description = "Activates the built-in OpenStreetMap / HaCon map engine",
) {
    compatibleWith(OEBB_COMPATIBILITY)

    val customTileUrl by stringOption(
        key = "tileServerUrl",
        default = DEFAULT_TILE_URL,
        title = "Tile server URL",
        description = "URL template for OSM background tiles (supports {z}, {x}, {y}).",
    )

    execute {
        val tileUrl = customTileUrl?.trim().takeUnless { it.isNullOrEmpty() } ?: DEFAULT_TILE_URL

        // 1. Resource patch: set MAP_STYLE=OSM and MAP_SERVER_OSM in haf_config_merge.properties
        runCatching {
            val configFile = resourceFile("res/raw/haf_config_merge.properties")
            if (configFile.exists()) {
                val text = configFile.readText()
                var updated = updateOrAppendProperty(text, "MAP_STYLE", "OSM")
                updated = updateOrAppendProperty(updated, "MAP_SERVER_OSM", tileUrl)
                configFile.writeText(updated)
            }
        }

        // 2. Fallback bytecode patch 1: replace GoogleMapComponent with HaconMapComponent
        MapScreenMapComponentFingerprint.methodOrNull?.let { method ->
            val instructions = method.implementation?.instructions?.toList() ?: emptyList()
            val googleMapIndex = instructions.indexOfFirst {
                val isConstString = (it.opcode == Opcode.CONST_STRING) || (it.opcode == Opcode.CONST_STRING_JUMBO)
                isConstString && ((it as? ReferenceInstruction)?.reference?.toString() == "de.hafas.googlemap.component.GoogleMapComponent")
            }
            if (googleMapIndex != -1) {
                val register = (instructions[googleMapIndex] as? OneRegisterInstruction)?.registerA ?: 3
                method.replaceInstruction(
                    googleMapIndex,
                    "const-string v$register, \"de.hafas.haconmap.component.HaconMapComponent\"",
                )
            }
        }

        // 3. Fallback bytecode patch 2: default tile URL in OSM Tile Provider (sc9 constructor)
        OsmTileProviderFingerprint.methodOrNull?.let { method ->
            val instructions = method.implementation?.instructions?.toList() ?: emptyList()
            val mapServerOsmIndex = instructions.indexOfFirst {
                val isConstString = (it.opcode == Opcode.CONST_STRING) || (it.opcode == Opcode.CONST_STRING_JUMBO)
                isConstString && ((it as? ReferenceInstruction)?.reference?.toString() == "MAP_SERVER_OSM")
            }
            if (mapServerOsmIndex != -1 && mapServerOsmIndex + 1 < instructions.size) {
                val nextIndex = mapServerOsmIndex + 1
                val reg = (instructions[nextIndex] as Any as? OneRegisterInstruction)?.registerA ?: 3
                method.replaceInstruction(
                    nextIndex,
                    "const-string v$reg, \"$tileUrl\"",
                )
            }
        }

        // 4. Bytecode patch 3: inject clean User-Agent header into tile HTTP connections to prevent OSM HTTP 403 / x-blocked
        TileHttpConnectionFingerprint.methodOrNull?.let { method ->
            val instructions = method.implementation?.instructions?.toList() ?: emptyList()
            val returnIndex = instructions.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
            if (returnIndex != -1) {
                method.addInstructions(
                    returnIndex,
                    """
                        const-string v0, "User-Agent"
                        const-string p0, "OEBB-Scotty/9.0.5 (Android)"
                        invoke-virtual {p1, v0, p0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
                    """.trimIndent(),
                )
            }
        }
    }
}
