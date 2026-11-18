package app.waze.elevenlabs.maps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.waze.elevenlabs.MAPS_MIN_SDK
import app.waze.elevenlabs.MAPS_VERSION
import app.waze.elevenlabs.MAPS_VERSION_CODE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

private const val BRIDGE = "Lapp/waze/elevenlabs/extension/MapsBridge;"
private const val ACTIVITY = "app.waze.elevenlabs.extension.ElevenLabsActivity"
private const val ANDROID = "http://schemas.android.com/apk/res/android"

// Same Maps version nl-morphe-patches targets, so both bundles patch one APK together.
private val COMPATIBILITY_MAPS = Compatibility(
    name = "Google Maps",
    packageName = "com.google.android.apps.maps",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xFFFFFF,
    targets = listOf(
        AppTarget(
            version = MAPS_VERSION,
            versionCodes = SupportedAbi.entries.associateWith { MAPS_VERSION_CODE },
            minSdk = MAPS_MIN_SDK,
        ),
    ),
)

/** Declares the activity that hosts the settings dialog. */
private val settingsActivityPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element
            application.appendChild(doc.createElement("activity").apply {
                setAttributeNS(ANDROID, "android:name", ACTIVITY)
                setAttributeNS(ANDROID, "android:exported", "false")
                setAttributeNS(ANDROID, "android:excludeFromRecents", "true")
                setAttributeNS(ANDROID, "android:theme", "@android:style/Theme.Translucent.NoTitleBar")
                setAttributeNS(ANDROID, "android:configChanges", "orientation|screenSize|screenLayout|keyboardHidden|uiMode")
            })
        }
    }
}

private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

/** Argument registers of an invoke, range or not. */
private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> throw PatchException("$opcode is not an invoke")
}

/** Index of the move-result-object right after [index], or a PatchException. */
private fun MutableMethod.resultAfter(index: Int, what: String): Int {
    val next = instructions.getOrNull(index + 1)
    if (next?.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("$what result is not kept")
    return index + 1
}

@Suppress("unused")
val mapsElevenLabsVoicePatch = bytecodePatch(
    name = "ElevenLabs voice for navigation",
    description = "Speaks navigation instructions with an ElevenLabs voice. Adds an \"ElevenLabs voice\" " +
        "entry to Maps' navigation settings under Sound & voice for the API key, voice and model. " +
        "Maps' own voice speaks whenever ElevenLabs is off, not configured or unreachable.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    dependsOn(settingsActivityPatch)
    extendWith("extensions/elevenlabs.mpe")

    execute {
        // The speech queue asks one of several synthesizers (Google's server voice or the TTS
        // engine) to write each instruction to a file: synthesizer.x(instruction, route, path).
        val queue = SpeechQueueFingerprint.method
        val synthCalls = queue.instructions.withIndex().filter { (_, insn) ->
            val ref = insn.methodRef() ?: return@filter false
            (insn.opcode == Opcode.INVOKE_INTERFACE || insn.opcode == Opcode.INVOKE_INTERFACE_RANGE) &&
                ref.returnType == "Z" && ref.parameterTypes.size == 3 && ref.parameterTypes[2].toString() == "Ljava/lang/String;"
        }
        val (synthIndex, synthCall) = synthCalls.singleOrNull()
            ?: throw PatchException("Expected one synthesizer call in the speech queue, found ${synthCalls.size}")
        val synthRegs = synthCall.registers()
        val synthesize = "$BRIDGE->synthesize(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Z"
        queue.replaceInstruction(synthIndex,
            if (synthCall is RegisterRangeInstruction) "invoke-static/range {v${synthRegs.first()} .. v${synthRegs.last()}}, $synthesize"
            else "invoke-static {${synthRegs.joinToString { "v$it" }}}, $synthesize")

        // The cache lookup: the queue's only one-argument call that returns a File.
        val lookups = queue.instructions.withIndex().filter { (_, insn) ->
            val ref = insn.methodRef() ?: return@filter false
            ref.returnType == "Ljava/io/File;" && ref.parameterTypes.size == 1
        }
        val lookup = lookups.singleOrNull()?.index
            ?: throw PatchException("Expected one cache lookup in the speech queue, found ${lookups.size}")
        val cached = queue.resultAfter(lookup, "Cache lookup")
        val cachedReg = (queue.instructions[cached] as OneRegisterInstruction).registerA
        queue.addInstructions(cached + 1, """
            invoke-static/range {v$cachedReg .. v$cachedReg}, $BRIDGE->cachedVoice(Ljava/io/File;)Ljava/io/File;
            move-result-object v$cachedReg
        """)

        // Runs before the cache reads its directory, so a cache filled with another voice is dropped.
        SpeechCacheFingerprint.method.addInstructions(0,
            "invoke-static/range {p1 .. p1}, $BRIDGE->initialize(Landroid/content/Context;)V")

        // Settings entry: hand the "Sound & voice" category to the extension right after lookup.
        val settings = SoundVoiceSettingsFingerprint.method
        val categoryKey = settings.instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "sound_voice_settings"
        }
        val find = (categoryKey + 1 until settings.instructions.size).firstOrNull { settings.instructions[it].methodRef() != null }
            ?: throw PatchException("Sound & voice category lookup not found")
        val category = settings.resultAfter(find, "Sound & voice category lookup")
        val categoryReg = (settings.instructions[category] as OneRegisterInstruction).registerA
        settings.addInstructions(category + 1,
            "invoke-static/range {v$categoryReg .. v$categoryReg}, $BRIDGE->addSettingsEntry(Ljava/lang/Object;)V")

        // androidx.preference method names for this build. Locals are unused at method entry.
        val summary = PreferenceSetSummaryFingerprint.method
        val title = PreferenceSetSummaryFingerprint.classDef.methods.filter { method ->
            method.returnType == "V" && method.name != summary.name &&
                method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/CharSequence;")
        }.singleOrNull() ?: throw PatchException("Cannot identify Preference.setTitle")
        val key = PreferenceSetKeyFingerprint.method
        val add = PreferenceGroupAddFingerprint.method
        val locals = settings.implementation!!.registerCount - settings.parameterTypes.size - 1
        if (locals < 4) throw PatchException("Navigation settings have too few registers ($locals)")
        settings.addInstructions(0, """
            const-string v0, "${title.name}"
            const-string v1, "${summary.name}"
            const-string v2, "${key.name}"
            const-string v3, "${add.name}"
            invoke-static {v0, v1, v2, v3}, $BRIDGE->bindPreferences(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
        """)
    }
}
