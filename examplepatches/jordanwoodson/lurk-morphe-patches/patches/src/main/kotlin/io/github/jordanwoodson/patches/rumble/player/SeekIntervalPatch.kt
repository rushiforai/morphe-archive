package io.github.jordanwoodson.patches.rumble.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import io.github.jordanwoodson.patches.rumble.refresh.QualitySwitchFingerprint
import io.github.jordanwoodson.patches.rumble.settings.rumbleSettings
import io.github.jordanwoodson.patches.rumble.settings.settingsPatch
import io.github.jordanwoodson.patches.rumble.shared.Constants.COMPATIBILITY_RUMBLE
import io.github.jordanwoodson.patches.rumble.shared.RUMBLE_PLAYER
import io.github.jordanwoodson.patches.rumble.shared.single
import io.github.jordanwoodson.patches.shared.compose.mutableTwin
import io.github.jordanwoodson.patches.shared.copyDrawablePaths
import io.github.jordanwoodson.patches.shared.settings.ChoiceSetting
import io.github.jordanwoodson.patches.shared.settings.Section

private const val KEY = "seek_seconds"
private const val RUMBLE_SEEK = 15000

// The rewind and forward icons draw the arrow with strokes and "15s" as a filled path. The copies keep the
// arrow only; they are used while another interval is chosen.
private val seekIconsPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_RUMBLE)
    execute {
        listOf("ic_backward" to "lurk_seek_back", "ic_forward" to "lurk_seek_forward").forEach { (icon, name) ->
            copyDrawablePaths(icon, name, "Rumble") { paths ->
                val arrows = paths.filter { it.hasAttribute("android:strokeColor") }
                arrows.takeIf { it.isNotEmpty() && it.size < paths.size }
            }
        }
    }
}

@Suppress("unused")
val seekIntervalPatch = bytecodePatch(
    name = "Seek interval",
    description = "Sets how far the player's rewind and forward buttons skip, instead of 15 seconds. Starts " +
        "off. Choose it in Lurk settings > Playback.",
) {
    compatibleWith(COMPATIBILITY_RUMBLE)
    dependsOn(settingsPatch, seekIconsPatch)

    execute {
        // The buttons call the player's seekBack/seekForward through their default-argument twins, which fill
        // in 15000 ms. TV remote keys pass their own 10 s and stay.
        val player = QualitySwitchFingerprint.single("player quality switch").classDef
        val twins = player.methods.filter { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString) == listOf(player.type, "I", "I", "Ljava/lang/Object;") &&
                method.implementation?.instructions?.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == RUMBLE_SEEK } == true
        }
        if (twins.size != 2) throw PatchException("Rumble: expected the seek back and forward defaults, found ${twins.size}")
        twins.forEach { twin ->
            val code = twin.implementation!!.instructions.toList()
            val literal = code.indexOfFirst { (it as? NarrowLiteralInstruction)?.narrowLiteral == RUMBLE_SEEK }
            val register = (code[literal] as OneRegisterInstruction).registerA
            twin.addInstructions(
                literal + 1,
                """
                    invoke-static/range { v$register .. v$register }, $RUMBLE_PLAYER->seekMillis(I)I
                    move-result v$register
                """,
            )
        }

        // The buttons' icons, read from the R class fields holding their IDs.
        mapOf("ic_backward" to "seekBackIcon", "ic_forward" to "seekForwardIcon").forEach { (icon, helper) ->
            val id = resourceId(ResourceType.DRAWABLE, icon).toInt()
            val fields = mutableListOf<String>()
            classDefForEach { classDef ->
                classDef.staticFields.filter { (it.initialValue as? IntEncodedValue)?.value == id && it.type == "I" }
                    .forEach { fields += "${classDef.type}->${it.name}:I" }
            }
            val sites = mutableListOf<Pair<ClassDef, Method>>()
            classDefForEach { classDef ->
                classDef.methods.filter { method ->
                    method.implementation?.instructions?.any {
                        it.opcode == Opcode.SGET && (it as ReferenceInstruction).reference.toString() in fields
                    } == true
                }.forEach { sites += classDef to it }
            }
            if (sites.isEmpty()) throw PatchException("Rumble: nothing draws the $icon icon")
            sites.forEach { (classDef, site) ->
                val method = mutableTwin(classDef, site)
                val code = method.implementation!!.instructions.toList()
                code.indices.filter {
                    code[it].opcode == Opcode.SGET && (code[it] as ReferenceInstruction).reference.toString() in fields
                }.reversed().forEach { index ->
                    val register = (code[index] as OneRegisterInstruction).registerA
                    method.addInstructions(
                        index + 1,
                        """
                            invoke-static/range { v$register .. v$register }, $RUMBLE_PLAYER->$helper(I)I
                            move-result v$register
                        """,
                    )
                }
            }
        }

        rumbleSettings.add(
            ChoiceSetting(
                KEY,
                "Seek interval",
                "How far the player's rewind and forward buttons skip.",
                Section.PLAYBACK,
                default = "0",
                choices = listOf(
                    "15 seconds (Rumble's)" to "0", "5 seconds" to "5", "10 seconds" to "10",
                    "30 seconds" to "30", "1 minute" to "60",
                ),
            ),
        )
    }
}
