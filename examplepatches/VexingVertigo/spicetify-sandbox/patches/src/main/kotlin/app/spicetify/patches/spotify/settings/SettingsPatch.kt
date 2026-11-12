package app.spicetify.patches.spotify.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val EXTENSION = "Lapp/spicetify/extension/spotify/settings/"

internal val settingsPatch = bytecodePatch {
    extendWith("extensions/spotify.mpe")
    extendWith("extensions/settings.dex")

    execute {
        for (type in NativeSettingsAbi.TYPES) {
            classDefByOrNull(type)
                ?: throw PatchException("Spotify settings ABI changed: missing $type")
        }

        val root = mutableClassDefBy("Lp/dns;").methods.single { it.name == "create" }
        val rootInstructions = root.implementation!!.instructions
        val freezeCall = rootInstructions.indices.single { index ->
            val reference = (rootInstructions[index] as? ReferenceInstruction)?.reference
            reference.toString() == "Lp/mqo1;->F(Ljava/lang/Iterable;)Lp/c9;" &&
                (rootInstructions.getOrNull(index - 2) as? ReferenceInstruction)?.reference.toString() ==
                "Lp/f46;->i0([Ljava/lang/Object;)Ljava/util/List;"
        }
        root.addInstructions(freezeCall, """
            move-object/from16 v1, p0
            invoke-static {v0, v1}, ${EXTENSION}nativebridge/SettingsBridge;->append(Ljava/util/List;Lp/dns;)V
        """.trimIndent())

        val analytics = mutableClassDefBy("Lp/opl0;").methods.single {
            it.name == "<init>" && it.parameterTypes == listOf("I", "Lp/r6h1;", "B")
        }
        val instructions = analytics.implementation!!.instructions
        val marker = instructions.indexOfFirst {
            (it as? ReferenceInstruction)?.reference.toString() == "mobile-settings-element-standard-navigation"
        }
        val switch = (marker + 1 until instructions.size).first { instructions[it].opcode == Opcode.PACKED_SWITCH }
        val sink = (switch + 1 until instructions.size).first {
            (instructions[it] as? ReferenceInstruction)?.reference.toString() == "Lp/x6h1;->b:Ljava/lang/String;"
        }
        analytics.addInstructionsWithLabels(switch, """
            const/4 v8, -0x1
            if-ne p1, v8, :native_labels
            const-string v0, "spicetify_settings"
            goto/16 :label_sink
        """.trimIndent(), ExternalLabel("native_labels", analytics.getInstruction(switch)),
            ExternalLabel("label_sink", analytics.getInstruction(sink)))

        var appType: String? = "Lcom/spotify/music/SpotifyApplication;"
        while (appType != null && classDefByOrNull(appType)?.methods?.none { it.name == "onCreate" && it.parameterTypes.isEmpty() } == true) {
            appType = classDefByOrNull(appType)?.superclass
        }
        mutableClassDefBy(appType ?: "Lcom/spotify/music/SpotifyApplication;").methods.single { it.name == "onCreate" && it.parameterTypes.isEmpty() }
            .addInstructions(0, "invoke-static/range {p0 .. p0}, ${EXTENSION}PatchSettings;->initialize(Landroid/content/Context;)V")
    }
}

internal fun BytecodePatchContext.enableSetting(name: String) {
    mutableClassDefBy("${EXTENSION}InstalledPatches;").methods.single { it.name == name }
        .replaceInstruction(0, "const/4 v0, 0x1")
}

internal val themeSettingsPatch = bytecodePatch {
    dependsOn(settingsPatch)
    execute { enableSetting("themeColors") }
}
