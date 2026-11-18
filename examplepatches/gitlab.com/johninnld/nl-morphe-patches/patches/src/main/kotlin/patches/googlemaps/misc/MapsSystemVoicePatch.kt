package org.ungoogled.patches.maps.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.ungoogled.patches.maps.ui.sharedExtensionPatch

private const val PROVIDER_SPEECH = "Lnl/johninnl/navigation/startup/ProviderSpeech;"
private const val TTS_CONSTRUCTOR =
    "Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech\$OnInitListener;Ljava/lang/String;)V"
private const val STRING_EQUALS = "Ljava/lang/String;->equals(Ljava/lang/Object;)Z"

/** Stock Maps 26.43 and 26.44. */
private val COMPATIBILITY_MAPS_SYSTEM_VOICE = Compatibility(
    name = "Google Maps",
    packageName = "com.google.android.apps.maps",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xFFFFFF,
    targets = listOf(
        AppTarget(
            version = "26.43.05.1002020710",
            versionCodes = SupportedAbi.entries.associateWith { 1068844719 },
            minSdk = 29,
        ),
        AppTarget(
            version = "26.44.06.1006895251",
            versionCodes = SupportedAbi.entries.associateWith { 1068856906 },
            minSdk = 29,
        ),
    ),
)

/**
 * Maps only declares Google TTS in <queries>. Android 11+ package visibility then hides
 * the user's default engine, so `new TextToSpeech(context, listener)` silently falls back
 * to Google. Declare the standard TTS service intent so the selected engine is visible.
 */
private val mapsSystemVoiceResources = resourcePatch {
    execute {
        val android = "http://schemas.android.com/apk/res/android"
        document("AndroidManifest.xml").use { doc ->
            val root = doc.documentElement
            val queries = (0 until doc.getElementsByTagName("queries").length)
                .map { doc.getElementsByTagName("queries").item(it) as Element }
                .firstOrNull() ?: doc.createElement("queries").also(root::appendChild)
            val hasTts = (0 until queries.getElementsByTagName("intent").length).any { i ->
                val intent = queries.getElementsByTagName("intent").item(i) as Element
                (0 until intent.getElementsByTagName("action").length).any { j ->
                    (intent.getElementsByTagName("action").item(j) as Element)
                        .getAttributeNS(android, "name") == "android.intent.action.TTS_SERVICE"
                }
            }
            if (!hasTts) {
                queries.appendChild(doc.createElement("intent").apply {
                    appendChild(doc.createElement("action").apply {
                        setAttributeNS(android, "android:name", "android.intent.action.TTS_SERVICE")
                    })
                })
            }
        }
    }
}

@Suppress("unused")
val mapsSystemVoicePatch = bytecodePatch(
    name = "Use the system voice for navigation",
    description = "Uses the phone's selected text-to-speech engine for Maps navigation instead of " +
        "requiring Google TTS. Select DriveDeck in Android's text-to-speech settings to hear Maps " +
        "with the local DriveDeck voice. If no system engine is ready, Maps keeps its original voice.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MAPS_SYSTEM_VOICE)
    dependsOn(sharedExtensionPatch, mapsSystemVoiceResources)

    execute {
        replaceMapsTtsConstructors()
        acceptMapsSystemEngine()
        bindMapsSynthesis()
    }
}

/** Find every explicit Google-engine TextToSpeech construction by its call shape, not a class name. */
context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun replaceMapsTtsConstructors() {
    var replaced = 0
    context.classDefForEach { cls ->
        cls.methods.forEach { method ->
            val implementation = method.implementation ?: return@forEach
            val instructions = implementation.instructions.toList()
            val calls = instructions.withIndex().filter { (index, insn) ->
                (insn as? ReferenceInstruction)?.reference?.toString() == TTS_CONSTRUCTOR &&
                    (maxOf(0, index - 6) until index).any { at ->
                        ((instructions[at] as? ReferenceInstruction)?.reference as? StringReference)?.string == "com.google.android.tts"
                    }
            }
            if (calls.isNotEmpty()) {
                val mutable = context.mutableClassDefBy(cls.type).methods.single {
                    it.name == method.name && it.returnType == method.returnType &&
                        it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
                }
                replaceMapsTtsConstructor(mutable)
                replaced += calls.size
            }
        }
    }
    if (replaced != 2 && replaced != 0) throw PatchException("Maps TTS constructors changed: expected 0 or 2, found $replaced")
    if (replaced == 0 && !alreadyHasProviderSpeechCall("create(Landroid/content/Context;Landroid/speech/tts/TextToSpeech\$OnInitListener;)Landroid/speech/tts/TextToSpeech;")) {
        throw PatchException("Maps TTS constructors changed: none found and no existing ProviderSpeech.create call")
    }
}

/** Accept the engine that completed initialization instead of requiring Google's package. */
context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun acceptMapsSystemEngine() {
    var replaced = 0
    context.classDefForEach { cls ->
        cls.methods.forEach { method ->
            val implementation = method.implementation ?: return@forEach
            val instructions = implementation.instructions.toList()
            val calls = instructions.withIndex().filter { (index, insn) ->
                (insn as? ReferenceInstruction)?.reference?.toString() == STRING_EQUALS &&
                    (maxOf(0, index - 8) until index).any { at ->
                        ((instructions[at] as? ReferenceInstruction)?.reference as? StringReference)?.string == "com.google.android.tts"
                    } &&
                    (maxOf(0, index - 8) until index).any { at ->
                        val ref = (instructions[at] as? ReferenceInstruction)?.reference?.toString()
                        ref == "Lbnak;->a()Ljava/lang/String;" || ref == "Lbmts;->a()Ljava/lang/String;"
                    }
            }
            if (calls.isNotEmpty()) {
                val mutable = context.mutableClassDefBy(cls.type).methods.single {
                    it.name == method.name && it.returnType == method.returnType &&
                        it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
                }
                acceptMapsSystemEngine(mutable)
                replaced += calls.size
            }
        }
    }
    // 26.43 and 26.44 both validate the engine returned by the TTS getter.
    if (replaced != 1 && replaced != 0) throw PatchException("Maps TTS engine check changed: patched $replaced, expected 0 or 1")
    if (replaced == 0 && !alreadyHasProviderSpeechCall("acceptedEngine(Ljava/lang/String;)Z")) {
        throw PatchException("Maps TTS engine check changed: none found and no existing acceptedEngine call")
    }
}

/** Replace `new TextToSpeech(context, listener, "com.google.android.tts")` by the default-engine constructor. */
internal fun replaceMapsTtsConstructor(method: MutableMethod) {
    val matches = method.instructions.withIndex().filter {
        (it.value as? ReferenceInstruction)?.reference?.toString() == TTS_CONSTRUCTOR
    }
    if (matches.size != 1) throw PatchException("Maps TTS constructor changed: expected one, found ${matches.size}")
    val (index, instruction) = matches.single()
    val call = instruction as? FiveRegisterInstruction
        ?: throw PatchException("Maps TTS constructor is not a five-register call")
    if (call.registerCount != 4) throw PatchException("Maps TTS constructor takes ${call.registerCount} registers")
    val instance = call.registerC
    val context = call.registerD
    val listener = call.registerE
    method.replaceInstruction(index,
        "invoke-static {v$context, v$listener}, $PROVIDER_SPEECH->create(Landroid/content/Context;Landroid/speech/tts/TextToSpeech\$OnInitListener;)Landroid/speech/tts/TextToSpeech;")
    method.addInstruction(index + 1, "move-result-object v$instance")
}

/** Accept whichever engine completed initialization, not only Google's package. */
internal fun acceptMapsSystemEngine(method: MutableMethod) {
    val matches = method.instructions.withIndex().filter { (index, instruction) ->
        (instruction as? ReferenceInstruction)?.reference?.toString() == STRING_EQUALS &&
            index > 0 && ((method.getInstruction(index - 1) as? ReferenceInstruction)
                ?.reference as? StringReference)?.string == "com.google.android.tts"
    }
    if (matches.size != 1) throw PatchException("Maps TTS engine check changed: expected one, found ${matches.size}")
    val (index, instruction) = matches.single()
    val call = instruction as? FiveRegisterInstruction
        ?: throw PatchException("Maps TTS engine check is not a five-register call")
    if (call.registerCount != 2) throw PatchException("Maps TTS engine check takes ${call.registerCount} registers")
    method.replaceInstruction(index,
        "invoke-static {v${call.registerC}}, $PROVIDER_SPEECH->acceptedEngine(Ljava/lang/String;)Z")
}


/**
 * Replace the queue's network/canned synthesis callback with DriveDeck. The queue hands
 * us the navigation text (bmcg.a / bmir.a) and an output path; the same method's TTS
 * fallbacks are left in place for engines that cannot synthesise.
 */
context(context: BytecodePatchContext)
private fun alreadyHasProviderSpeechCall(signature: String): Boolean {
    var found = false
    context.classDefForEach { cls ->
        cls.methods.forEach { method ->
            val instructions = method.implementation?.instructions ?: return@forEach
            if (instructions.any { (it as? ReferenceInstruction)?.reference?.toString() == "$PROVIDER_SPEECH->$signature" }) {
                found = true
            }
        }
    }
    return found
}

context(context: BytecodePatchContext)
internal fun bindMapsSynthesis() {
    // 26.43 and 26.44 name the callback differently, but both have the same shape:
    // (text-holder, optional route state, output path) -> boolean.
    val shapes = mapOf(
        "Lbmci;->b(Lbmcg;Lbjis;Ljava/lang/String;)Z" to "Lbmcg;",
        "Lbmit;->b(Lbmir;Lbjpk;Ljava/lang/String;)Z" to "Lbmir;",
    )
    var patched = 0
    context.classDefForEach { cls ->
        cls.methods.forEach { method ->
            val implementation = method.implementation ?: return@forEach
            val instructions = implementation.instructions.toList()
            val hits = implementation.instructions.withIndex().filter { (_, insn) ->
                shapes.containsKey((insn as? ReferenceInstruction)?.reference?.toString())
            }
            if (hits.isEmpty()) return@forEach
            if (hits.size != 1) throw PatchException("Maps synthesis callback changed: found ${hits.size} calls in ${cls.type}")
            val (index, instruction) = hits.single()
            val call = instruction as? FiveRegisterInstruction
                ?: throw PatchException("Maps synthesis callback is not a five-register call")
            if (call.registerCount != 4) throw PatchException("Maps synthesis callback takes ${call.registerCount} registers")
            val textRegister = call.registerD
            val pathRegister = call.registerF
            if (textRegister == 11 || pathRegister == 11) {
                throw PatchException("Maps synthesis registers changed: text=v$textRegister path=v$pathRegister")
            }
            val textClass = shapes.getValue((instruction as ReferenceInstruction).reference.toString())
            val mutable = context.mutableClassDefBy(cls.type).methods.single {
                it.name == method.name && it.returnType == method.returnType &&
                    it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
            }
            mutable.addInstruction(index,
                "iget-object v11, v$textRegister, $textClass->a:Ljava/lang/String;")
            mutable.replaceInstruction(index + 1,
                "invoke-static {v11, v$pathRegister}, $PROVIDER_SPEECH->synthesizeToFile(Ljava/lang/String;Ljava/lang/String;)Z")
            patched++
        }
    }
    if (patched != 1) throw PatchException("Maps synthesis callback changed: patched $patched, expected 1")
}
