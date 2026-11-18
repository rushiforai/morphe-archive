package patches.flitsmeister

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val TTS_CONSTRUCTOR =
    "Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech\$OnInitListener;Ljava/lang/String;)V"
private const val TTS_CONSTRUCTOR_DEFAULT =
    "Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech\$OnInitListener;)V"

private val COMPATIBILITY_FLITSMEISTER_SYSTEM_VOICE = Compatibility(
    name = "Flitsmeister",
    packageName = "nl.flitsmeister",
    apkFileType = ApkFileType.APKS,
    signatures = setOf("ba4fdde5ed7d1082f6ba1af87df2ca39c81b094af20d36ff55b583aa3e3353e6"),
    targets = listOf(AppTarget(version = "15.0", versionCode = 1289, minSdk = 29)),
)

/** The audio manager's TextToSpeech factory in 15.0. */
private object FlitsmeisterTtsFactoryFingerprint : Fingerprint(
    definingClass = "Lwd0;",
    name = "a",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(app.morphe.patcher.string("com.google.android.tts")),
)

@Suppress("unused")
val flitsmeisterSystemVoicePatch = bytecodePatch(
    name = "Use the system voice for navigation",
    description = "Speaks Flitsmeister navigation directions through the phone's selected " +
        "text-to-speech engine instead of requiring Google TTS. Select DriveDeck as the " +
        "system engine to hear the local DriveDeck voice; otherwise the voice the driver " +
        "chose remains in use.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FLITSMEISTER_SYSTEM_VOICE)
    extendWith("extensions/flitsmeister.mpe")

    execute {
        replaceFlitsmeisterTtsFactory(FlitsmeisterTtsFactoryFingerprint.method)
    }
}

/** Replace the explicit Google engine with the default engine and stop before the Samsung override. */
internal fun replaceFlitsmeisterTtsFactory(method: MutableMethod) {
    val matches = method.instructions.withIndex().filter { (index, instruction) ->
        (instruction as? ReferenceInstruction)?.reference?.toString() == TTS_CONSTRUCTOR &&
            index > 0 && ((method.getInstruction(index - 1) as? ReferenceInstruction)
                ?.reference as? com.android.tools.smali.dexlib2.iface.reference.StringReference)?.string == "com.google.android.tts"
    }
    if (matches.size != 1) throw PatchException("Flitsmeister TTS factory changed: expected one Google constructor, found ${matches.size}")
    val (index, instruction) = matches.single()
    val call = instruction as? FiveRegisterInstruction
        ?: throw PatchException("Flitsmeister TTS constructor is not a five-register call")
    if (call.registerCount != 4) throw PatchException("Flitsmeister TTS constructor takes ${call.registerCount} registers")
    method.replaceInstruction(index,
        "invoke-direct {v${call.registerC}, v${call.registerD}, v${call.registerE}}, $TTS_CONSTRUCTOR_DEFAULT")
    val store = method.instructions.withIndex().firstOrNull { (at, insn) ->
        at > index && (insn as? ReferenceInstruction)?.reference?.toString() == "Lwd0;->b:Landroid/speech/tts/TextToSpeech;"
    } ?: throw PatchException("Flitsmeister TTS factory lost its field store")
    method.addInstruction(store.index + 1, "return-void")
}
