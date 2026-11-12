package app.spicetify.patches.spotify.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import java.util.Properties

private const val EXTENSION = "Lapp/spicetify/extension/spotify/settings/"

// Adds nothing to the manifest. A root mount install keeps the stock manifest, so the settings
// pages are dialogs over Spotify's activity (SpicetifySettingsScreen) instead of an activity.
internal val settingsPatch = bytecodePatch {
    extendWith("extensions/spotify.mpe")
    extendWith("extensions/settings.dex")

    execute {
        val snapshot = Properties().apply {
            NativeSettingsAbi::class.java.getResourceAsStream("/settings/9.1.94.1929.properties")!!.use(::load)
        }
        for (type in NativeSettingsAbi.TYPES) {
            val definition = classDefByOrNull(type)
                ?: throw PatchException("Spotify settings ABI changed: missing $type")
            if (NativeSettingsAbi.digest(definition) != snapshot.getProperty(type)) {
                throw PatchException("Spotify settings ABI changed: $type. Use the verified Spotify 9.1.94.1929 APK.")
            }
        }

        // Spotify 9.1.94.1929: Lp/wbs;->create builds three pages; the settings root is the one that casts
        // its field to the root factory Lp/jsp;. That method reuses its `this` register before the entries
        // exist, so the factory is stashed where it is cast and consumed where Lp/r06;->i0 has just returned
        // the mutable entries list, before Lp/fdn1;->E freezes it.
        val root = mutableClassDefBy("Lp/wbs;").methods.single { it.name == "create" }
        val rootInstructions = root.implementation!!.instructions.toList()
        val listCalls = rootInstructions.indices.filter {
            (rootInstructions[it] as? ReferenceInstruction)?.reference.toString() ==
                "Lp/r06;->i0([Ljava/lang/Object;)Ljava/util/List;"
        }
        val factoryCasts = rootInstructions.indices.filter {
            rootInstructions[it].opcode == Opcode.CHECK_CAST &&
                (rootInstructions[it] as ReferenceInstruction).reference.toString() == "Lp/jsp;"
        }
        if (listCalls.size != 1 || factoryCasts.size != 1 || factoryCasts.single() > listCalls.single()
            || rootInstructions.getOrNull(listCalls.single() + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT
            || (rootInstructions.getOrNull(listCalls.single() + 2) as? ReferenceInstruction)?.reference.toString() !=
                "Lp/fdn1;->E(Ljava/lang/Iterable;)Lp/r8;"
        ) {
            throw PatchException("Spotify settings ABI changed: Lp/wbs;->create. Use the verified Spotify 9.1.94.1929 APK.")
        }
        val list = (rootInstructions[listCalls.single() + 1] as OneRegisterInstruction).registerA
        val factory = (rootInstructions[factoryCasts.single()] as OneRegisterInstruction).registerA
        // Later index first, so the earlier insertion doesn't move it.
        root.addInstructions(listCalls.single() + 2,
            "invoke-static/range {v$list .. v$list}, ${EXTENSION}nativebridge/SettingsBridge;->append(Ljava/util/List;)V")
        root.addInstructions(factoryCasts.single() + 1,
            "invoke-static/range {v$factory .. v$factory}, ${EXTENSION}nativebridge/SettingsBridge;->prepare(Lp/jsp;)V")

        val analytics = mutableClassDefBy("Lp/b3l0;").methods.single {
            it.name == "<init>" && it.parameterTypes == listOf("I", "Lp/v2g1;", "B")
        }
        val instructions = analytics.implementation!!.instructions.toList()
        val marker = instructions.indexOfFirst {
            (it as? ReferenceInstruction)?.reference.toString() == "mobile-settings-element-standard-navigation"
        }
        val switch = (marker + 1 until instructions.size).first { instructions[it].opcode == Opcode.PACKED_SWITCH }
        val sink = (switch + 1 until instructions.size).first {
            (instructions[it] as? ReferenceInstruction)?.reference.toString() == "Lp/b3g1;->b:Ljava/lang/String;"
        }
        // The switch reads the discriminator parameter. The last parameter's register was already reused for
        // the metadata strings set just above, so it is free as scratch. All native cases put their label in
        // the sink's value register, including ad_partners, so that register is left intact on mismatch.
        val discriminator = (instructions[switch] as OneRegisterInstruction).registerA
        val scratch = analytics.implementation!!.registerCount - 1
        val label = (instructions[sink] as TwoRegisterInstruction).registerA
        if (marker < 0 || discriminator > 15 || scratch > 15 || scratch == discriminator || scratch == label) {
            throw PatchException("Spotify settings ABI changed: Lp/b3l0;. Use the verified Spotify 9.1.94.1929 APK.")
        }
        analytics.addInstructionsWithLabels(switch, """
            const/16 v$scratch, -0x1
            if-ne v$discriminator, v$scratch, :native_labels
            const-string v$label, "spicetify_settings"
            goto/16 :label_sink
        """.trimIndent(), ExternalLabel("native_labels", analytics.getInstruction(switch)),
            ExternalLabel("label_sink", analytics.getInstruction(sink)))

        applicationMethod("onCreate", emptyList())
            .addInstructions(0,
                "invoke-static/range {p0 .. p0}, ${EXTENSION}PatchSettings;->initialize(Landroid/content/Context;)V")
    }
}

/**
 * Spotify's Application lifecycle method [name], on whichever of its own classes declares it. In Spotify
 * 9.1.94.1929 `SpotifyApplication` only has a constructor, and its sole superclass `Lp/k1a1;` declares
 * onCreate and onTrimMemory; in 9.1.80.2221 they were on `SpotifyApplication` itself.
 */
internal fun BytecodePatchContext.applicationMethod(name: String, parameters: List<String>): MutableMethod {
    var type: String? = "Lcom/spotify/music/SpotifyApplication;"
    while (type != null && type.startsWith("L") && !type.startsWith("Landroid/")) {
        val definition = classDefByOrNull(type) ?: break
        definition.methods.firstOrNull { it.name == name && it.parameterTypes == parameters && it.returnType == "V" }
            ?.let { return mutableClassDefBy(type!!).methods.single { m -> m.name == name && m.parameterTypes == parameters && m.returnType == "V" } }
        type = definition.superclass
    }
    throw PatchException("Spotify's Application no longer declares $name. Use the verified Spotify 9.1.94.1929 APK.")
}

internal fun BytecodePatchContext.enableSetting(name: String) {
    mutableClassDefBy("${EXTENSION}InstalledPatches;").methods.single { it.name == name }
        .replaceInstruction(0, "const/4 v0, 0x1")
}

internal val themeSettingsPatch = bytecodePatch {
    dependsOn(settingsPatch)
    execute { enableSetting("themeColors") }
}
