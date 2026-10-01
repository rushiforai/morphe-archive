package app.spicetify.patches.spotify.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.util.Properties

private const val EXTENSION = "Lapp/spicetify/extension/spotify/settings/"
private const val ACTIVITY = "app.spicetify.extension.spotify.settings.SpicetifySettingsActivity"
private const val ANDROID = "http://schemas.android.com/apk/res/android"

private val settingsResourcesPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0)
            val activity = manifest.createElement("activity")
            activity.setAttributeNS(ANDROID, "android:name", ACTIVITY)
            activity.setAttributeNS(ANDROID, "android:exported", "false")
            activity.setAttributeNS(ANDROID, "android:label", "Spicetify")
            application.appendChild(activity)
        }
    }
}

internal val settingsPatch = bytecodePatch {
    dependsOn(settingsResourcesPatch)
    extendWith("extensions/spotify.mpe")
    extendWith("extensions/settings.dex")

    execute {
        val snapshot = Properties().apply {
            NativeSettingsAbi::class.java.getResourceAsStream("/settings/9.1.80.2221.properties")!!.use(::load)
        }
        for (type in NativeSettingsAbi.TYPES) {
            val definition = classDefByOrNull(type)
                ?: throw PatchException("Spotify settings ABI changed: missing $type")
            if (NativeSettingsAbi.digest(definition) != snapshot.getProperty(type)) {
                throw PatchException("Spotify settings ABI changed: $type. Use the verified Spotify 9.1.80.2221 APK.")
            }
        }

        val root = mutableClassDefBy("Lp/xlt;").methods.single { it.name == "create" }
        val rootInstructions = root.implementation!!.instructions
        val insertion = rootInstructions.indices.single { index ->
            val reference = (rootInstructions[index] as? ReferenceInstruction)?.reference
            reference.toString() == "Lp/ion;->c:Ljava/lang/Object;" &&
                (rootInstructions.getOrNull(index + 1) as? ReferenceInstruction)?.reference.toString() == "Lp/dpb;"
        }
        // Snapshot proves v6 is the unfrozen list and v2 is still the root factory here.
        root.addInstructions(insertion,
            "invoke-static {v6, v2}, ${EXTENSION}nativebridge/SettingsBridge;->append(Ljava/util/List;Lp/ion;)V")

        val analytics = mutableClassDefBy("Lp/c3g0;").methods.single {
            it.name == "<init>" && it.parameterTypes == listOf("I", "Lp/ct71;", "I")
        }
        val instructions = analytics.implementation!!.instructions
        val marker = instructions.indexOfFirst {
            (it as? ReferenceInstruction)?.reference.toString() == "mobile-settings-element-standard-navigation"
        }
        val switch = (marker + 1 until instructions.size).first { instructions[it].opcode == Opcode.PACKED_SWITCH }
        val sink = (switch + 1 until instructions.size).first {
            (instructions[it] as? ReferenceInstruction)?.reference.toString() == "Lp/it71;->b:Ljava/lang/String;"
        }
        // v7's discriminator and metadata strings have been consumed. All native cases
        // use v0 for their label, including ad_partners, so leave v0 intact on mismatch.
        analytics.addInstructionsWithLabels(switch, """
            const/4 v7, -0x1
            if-ne v5, v7, :native_labels
            const-string v0, "spicetify_settings"
            goto/16 :label_sink
        """.trimIndent(), ExternalLabel("native_labels", analytics.getInstruction(switch)),
            ExternalLabel("label_sink", analytics.getInstruction(sink)))

        mutableClassDefBy("Lcom/spotify/music/SpotifyApplication;").methods.single { it.name == "onCreate" }
            .addInstructions(0,
                "invoke-static/range {p0 .. p0}, ${EXTENSION}PatchSettings;->initialize(Landroid/content/Context;)V")
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
