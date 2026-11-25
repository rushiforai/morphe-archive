package patches.gboard

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.w3c.dom.Document
import org.w3c.dom.Element

// Gboard's VoiceInputManager stops listening (keeping the text) when its timeout runs out; for
// Rambler that timer is a fixed five-minute session limit. This patch lets the user pick a silence
// time: the timer gets that length and restarts while Gboard's speech level shows speech. Rambler
// sends no transcript text until it stops, so transcript updates cannot measure silence.

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val RAMBLER_SETTINGS_SCREEN = "res/xml/setting_rambler_voice_typing.xml"
private const val RECOGNIZER_CALLBACK = "com/google/android/apps/inputmethod/libs/voiceime/VoiceInputManager\$RecognizerCallback"
private const val SILENCE_RUNTIME = "Ldev/jason/gboardpatches/extension/rambler/GboardRamblerSilenceRuntime;"
private const val DURATION = "Lj\$/time/Duration;"
private const val STRING = "Ljava/lang/String;"

internal const val SILENCE_KEY = "morphe_rambler_silence_stop"
private const val START_HELPER = "morpheRamblerSilenceStart"
private const val UPDATE_HELPER = "morpheRamblerSilenceUpdate"
private const val LEVEL_HELPER = "morpheRamblerSilenceLevel"

private val silenceTexts = mapOf(
    "values" to listOf(
        "Stop after silence",
        "Stops Rambler and keeps the text after this long without new speech: %s",
        "Off", "3 seconds", "5 seconds", "8 seconds", "10 seconds",
    ),
    "values-nl" to listOf(
        "Stoppen na stilte",
        "Stopt Rambler en houdt de tekst na zo lang zonder nieuwe spraak: %s",
        "Uit", "3 seconden", "5 seconden", "8 seconden", "10 seconden",
    ),
)
private val silenceStringNames = listOf(
    "morphe_rambler_silence_title", "morphe_rambler_silence_summary",
    "morphe_rambler_silence_off", "morphe_rambler_silence_3", "morphe_rambler_silence_5",
    "morphe_rambler_silence_8", "morphe_rambler_silence_10",
)
private val silenceValues = listOf("0", "3", "5", "8", "10")
/** Seconds of silence after which Rambler stops when the user never picked a time. */
internal const val SILENCE_DEFAULT = "3"

/** Adds the Stop after silence choice in its own card, just above Help & feedback. */
internal fun addSilenceStopPreference(screen: Document) {
    val root = screen.documentElement
    val nodes = screen.getElementsByTagName("*")
    if ((0 until nodes.length).any { (nodes.item(it) as Element).getAttributeNS(ANDROID_NS, "key") == SILENCE_KEY }) {
        throw PatchException("Stop after silence is already in the Rambler settings")
    }
    val categories = (0 until root.childNodes.length).map(root.childNodes::item).filterIsInstance<Element>()
        .filter { it.tagName.endsWith("PreferenceCategory") }
    val help = categories.lastOrNull() ?: throw PatchException("Rambler voice typing settings have no preference category")
    val category = screen.createElement(help.tagName)
    category.appendChild(screen.createElement("ListPreference").apply {
        setAttributeNS(ANDROID_NS, "android:key", SILENCE_KEY)
        setAttributeNS(ANDROID_NS, "android:persistent", "true")
        setAttributeNS(ANDROID_NS, "android:defaultValue", SILENCE_DEFAULT)
        setAttributeNS(ANDROID_NS, "android:title", "@string/${silenceStringNames[0]}")
        setAttributeNS(ANDROID_NS, "android:dialogTitle", "@string/${silenceStringNames[0]}")
        setAttributeNS(ANDROID_NS, "android:summary", "@string/${silenceStringNames[1]}")
        setAttributeNS(ANDROID_NS, "android:entries", "@array/morphe_rambler_silence_entries")
        setAttributeNS(ANDROID_NS, "android:entryValues", "@array/morphe_rambler_silence_values")
    })
    root.insertBefore(category, help)
}

/** The two string arrays behind the choice; entries point at the translated strings. */
internal fun addSilenceStopArrays(arrays: Document) {
    fun array(name: String, items: List<String>) = arrays.createElement("string-array").apply {
        setAttribute("name", name)
        items.forEach { item -> appendChild(arrays.createElement("item").apply { textContent = item }) }
    }
    arrays.documentElement.appendChild(array("morphe_rambler_silence_entries", silenceStringNames.drop(2).map { "@string/$it" }))
    arrays.documentElement.appendChild(array("morphe_rambler_silence_values", silenceValues))
}

private val silenceStopSettings = resourcePatch(
    description = "Add Stop after silence to Gboard settings → Voice typing → Rambler.",
) {
    compatibleWith(gboard)

    execute {
        for ((folder, texts) in silenceTexts) {
            val path = "res/$folder/strings.xml"
            if (folder != "values" && !get(path).isFile) continue
            document(path).use { strings ->
                for ((name, value) in silenceStringNames.zip(texts)) {
                    strings.documentElement.appendChild(strings.createElement("string").apply {
                        setAttribute("name", name)
                        // %s is filled in by the list with the chosen entry.
                        if (value.contains("%s")) setAttribute("formatted", "false")
                        textContent = value
                    })
                }
            }
        }
        if (!get("res/values/arrays.xml").isFile) throw PatchException("res/values/arrays.xml not found")
        document("res/values/arrays.xml").use(::addSilenceStopArrays)
        if (!get(RAMBLER_SETTINGS_SCREEN).isFile) throw PatchException("$RAMBLER_SETTINGS_SCREEN not found")
        document(RAMBLER_SETTINGS_SCREEN).use(::addSilenceStopPreference)
    }
}

private fun Method.strings() = implementation?.instructions?.mapNotNull {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
}.orEmpty()

private fun MethodReference.smali() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
private fun FieldReference.smali() = "$definingClass->$name:$type"

/** What the helpers need from Gboard's voice input manager, read from onTranscriptionUpdate. */
private class SilenceTimerWiring(
    val manager: FieldReference,
    val ramblerSession: FieldReference,
    val timer: FieldReference,
    val restart: MethodReference,
    val setLength: MethodReference,
    val preferences: FieldReference,
    val readString: MethodReference,
)

context(context: BytecodePatchContext)
private fun silenceTimerWiring(callbackType: String, update: Method): SilenceTimerWiring {
    val instructions = update.implementation!!.instructions.toList()
    val fields = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
    val manager = fields.firstOrNull { it.definingClass == callbackType && !it.type.startsWith("[") && it.type.startsWith("L") }
        ?: throw PatchException("Voice input manager field not found in onTranscriptionUpdate")
    val ramblerSession = instructions.filter { it.opcode == Opcode.IGET_BOOLEAN }
        .map { (it as ReferenceInstruction).reference as FieldReference }.filter { it.definingClass == manager.type }
        .distinct().singleOrNull() ?: throw PatchException("Rambler session flag not found in onTranscriptionUpdate")
    // The timer is the manager field whose no-argument void method is called right after it is read.
    val timerRead = instructions.indices.singleOrNull { index ->
        val field = (instructions[index] as? ReferenceInstruction)?.reference as? FieldReference
        val next = instructions.getOrNull(index + 1)
        val call = (next as? ReferenceInstruction)?.reference as? MethodReference
        instructions[index].opcode == Opcode.IGET_OBJECT && field?.definingClass == manager.type &&
            next?.opcode == Opcode.INVOKE_VIRTUAL && call?.definingClass == field.type &&
            call.parameterTypes.isEmpty() && call.returnType == "V"
    } ?: throw PatchException("Timeout timer restart not found in onTranscriptionUpdate")
    val timer = (instructions[timerRead] as ReferenceInstruction).reference as FieldReference
    val restart = (instructions[timerRead + 1] as ReferenceInstruction).reference as MethodReference
    val timerClass = context.classDefBy(timer.type)
    val setLength = timerClass.methods.singleOrNull {
        it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(DURATION)
    } ?: throw PatchException("Timeout timer has no length setter")
    val preferences = fields.distinct().filter { it.definingClass == manager.type && it.type.startsWith("L") }
        .singleOrNull { field ->
            context.classDefByOrNull(field.type)?.methods?.any {
                it.name == "d" && it.returnType == STRING && it.parameterTypes.map(CharSequence::toString) == listOf(STRING, STRING)
            } == true
        } ?: throw PatchException("Gboard preferences not reachable from onTranscriptionUpdate")
    val read = context.classDefBy(preferences.type).methods.single {
        it.name == "d" && it.returnType == STRING && it.parameterTypes.map(CharSequence::toString) == listOf(STRING, STRING)
    }
    return SilenceTimerWiring(
        manager, ramblerSession, timer, restart,
        ImmutableMethodReference(timerClass.type, setLength.name, setLength.parameterTypes, "V"),
        preferences,
        ImmutableMethodReference(preferences.type, read.name, read.parameterTypes, STRING),
    )
}

private val silenceStopTimer = bytecodePatch(
    description = "Let Gboard's voice timeout stop Rambler after the chosen silence.",
) {
    compatibleWith(gboard)

    execute {
        val owners = classDefByStrings(RECOGNIZER_CALLBACK, StringComparisonType.EQUALS)
        val owner = owners.singleOrNull { owner -> owner.methods.any { "onTranscriptionUpdate" in it.strings() } }
            ?: throw PatchException("VoiceInputManager recognizer callback not found")
        val callback = mutableClassDefBy(owner.type)
        fun named(log: String) = callback.methods.singleOrNull { !AccessFlags.STATIC.isSet(it.accessFlags) && log in it.strings() }
            ?: throw PatchException("Recognizer callback $log not found")
        val start = named("onStartSuccess")
        val update = named("onTranscriptionUpdate")
        val wiring = silenceTimerWiring(callback.type, update)
        val ofSeconds = classDefByOrNull(DURATION)?.methods?.singleOrNull {
            it.name == "ofSeconds" && it.parameterTypes.map(CharSequence::toString) == listOf("J")
        } ?: throw PatchException("Duration.ofSeconds is not in this Gboard build")

        val manager = mutableClassDefBy(wiring.manager.type)
        val stopListening = manager.methods.singleOrNull { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && method.parameterTypes.size == 1 &&
                "stopListeningVoice" in method.strings()
        } ?: throw PatchException("VoiceInputManager stopListeningVoice not found")

        fun addHelper(name: String, parameters: List<String>, registers: Int, body: List<String>) {
            if (callback.methods.any { it.name == name }) throw PatchException("$name already exists")
            callback.methods.add(ImmutableMethod(
                callback.type, name, parameters.map { ImmutableMethodParameter(it, null, null) }, "V",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(registers),
            ).toMutable().apply { addInstructions(0, body.joinToString("\n")) })
        }
        // The settings screen writes Gboard's default preferences; the manager's own preferences
        // object is the separate private file, so read the choice through the default instance.
        val contextField = manager.fields.singleOrNull { it.type == "Landroid/content/Context;" }
            ?: throw PatchException("VoiceInputManager has no single Context field")
        val defaultPreferences = classDefBy(wiring.preferences.type).methods.singleOrNull {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == wiring.preferences.type &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;")
        } ?: throw PatchException("Gboard default preferences accessor not found")
        val levelUpdate = named("onSpeechLevelUpdate")
        if (levelUpdate.parameterTypes.map(CharSequence::toString) != listOf("I")) throw PatchException("onSpeechLevelUpdate changed shape")

        // Start: arm the timer with the chosen seconds for a Rambler session (and log the session).
        addHelper(START_HELPER, listOf(callback.type), 7, listOf(
            "iget-object v0, p0, ${wiring.manager.smali()}",
            "iget-boolean v1, v0, ${wiring.ramblerSession.smali()}",
            // Android stores a list's default only once its screen is shown: unset means the default.
            "const-string v3, \"$SILENCE_DEFAULT\"",
            "iget-object v2, v0, ${wiring.manager.type}->${contextField.name}:Landroid/content/Context;",
            "if-eqz v2, :read",
            "invoke-static {v2}, ${wiring.preferences.type}->${defaultPreferences.name}(Landroid/content/Context;)${wiring.preferences.type}",
            "move-result-object v2",
            "if-eqz v2, :read",
            "const-string v4, \"$SILENCE_KEY\"",
            "invoke-virtual {v2, v4, v3}, ${wiring.readString.smali()}",
            "move-result-object v3",
            ":read",
            "invoke-static {v1, v3}, $SILENCE_RUNTIME->onSessionStart(Z$STRING)J",
            "move-result-wide v1",
            "const-wide/16 v3, 0x0",
            "cmp-long v5, v1, v3",
            "if-lez v5, :done",
            "invoke-static {v1, v2}, $DURATION->${ofSeconds.name}(J)$DURATION",
            "move-result-object v1",
            "iget-object v2, v0, ${wiring.timer.smali()}",
            "invoke-virtual {v2, v1}, ${wiring.setLength.smali()}",
            ":done",
            "return-void",
        ))
        // Speech level: restart the countdown while the level shows speech.
        addHelper(LEVEL_HELPER, listOf(callback.type, "I"), 6, listOf(
            "iget-object v0, p0, ${wiring.manager.smali()}",
            "iget-boolean v1, v0, ${wiring.ramblerSession.smali()}",
            "invoke-static {v1, p1}, $SILENCE_RUNTIME->onSpeechLevel(ZI)Z",
            "move-result v1",
            "if-eqz v1, :done",
            "iget-object v2, v0, ${wiring.timer.smali()}",
            "invoke-virtual {v2}, ${wiring.restart.smali()}",
            ":done",
            "return-void",
        ))
        // Transcript updates: counted for the log only (Rambler sends text only when it stops).
        addHelper(UPDATE_HELPER, listOf(callback.type, update.parameterTypes.single().toString()), 4, listOf(
            "iget-object v0, p0, ${wiring.manager.smali()}",
            "iget-boolean v1, v0, ${wiring.ramblerSession.smali()}",
            "invoke-static {v1, p1}, $SILENCE_RUNTIME->onTranscriptionUpdate(ZLjava/lang/Object;)Z",
            "return-void",
        ))

        start.addInstructions(0, "invoke-static {p0}, ${callback.type}->$START_HELPER(${callback.type})V")
        levelUpdate.addInstructions(0, "invoke-static {p0, p1}, ${callback.type}->$LEVEL_HELPER(${callback.type}I)V")
        update.addInstructions(0, "invoke-static {p0, p1}, ${callback.type}->$UPDATE_HELPER(${callback.type}${update.parameterTypes.single()})V")
        // Record why listening stops, so a session that does not stop can be diagnosed from logcat.
        stopListening.addInstructions(0, "invoke-static {p1}, $SILENCE_RUNTIME->onStopListening(Ljava/lang/Object;)V")
    }
}

@Suppress("unused")
val ramblerSilenceStop = bytecodePatch(
    name = "Rambler stop after silence",
    description = "Rambler stops by itself after 3 seconds without speech and keeps the text, as when you tap ✓. " +
        "Change the time (3, 5, 8 or 10 seconds) or switch it off under Gboard settings → Voice typing → Rambler → " +
        "Stop after silence. Requires Rambler voice typing.",
) {
    compatibleWith(gboard)
    dependsOn(originalInput, ramblerVoiceTyping, silenceStopSettings, silenceStopTimer)
}
