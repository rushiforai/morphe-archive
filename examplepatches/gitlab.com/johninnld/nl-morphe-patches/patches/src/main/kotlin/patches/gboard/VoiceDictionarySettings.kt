package patches.gboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Document
import org.w3c.dom.Element

// Gboard keeps its voice correction list under Voice typing → Rambler. These patches give the
// dictionary its own Voice dictionary screen under Voice typing, opened by Gboard's own Rambler
// settings fragment so "Clear all corrected words" keeps its confirmation dialog. That fragment
// picks setting_rambler_voice_typing.xml once the correction list is unlocked, which leaves its
// older layout, setting_jetson_voice.xml, unused: it becomes the Voice dictionary screen.

private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val RAMBLER_SCREEN = "res/xml/setting_rambler_voice_typing.xml"
private const val DICTIONARY_SCREEN = "res/xml/setting_jetson_voice.xml"
private const val VOICE_SCREEN = "res/xml/setting_voice_unified.xml"
private const val RAMBLER_FRAGMENT = "com.google.android.apps.inputmethod.latin.preference.JetsonVoiceSettingsFragment"
private const val RAMBLER_FRAGMENT_TYPE = "Lcom/google/android/apps/inputmethod/latin/preference/JetsonVoiceSettingsFragment;"
private const val DICTIONARY_RUNTIME = "Ldev/jason/gboardpatches/extension/rambler/GboardVoiceDictionaryRuntime;"
private const val ARGUMENTS_MESSAGE = " does not have any arguments."
private const val HIDE_IF_FLAG = "hide_if_flag_is_false"

internal const val VOICE_DICTIONARY_KEY = "morphe_voice_dictionary"
internal const val SCREEN_EXTRA = "morphe_screen"
internal const val SCREEN_VOICE_DICTIONARY = "voice_dictionary"

/** Flags that gate the dictionary entries on Gboard's Rambler screen. */
private val dictionaryFlags = listOf(
    "show_rambler_dict_settings=", "show_clear_all_corrected_words_settings=",
    "show_personal_dict_biasing_settings_toggle=",
)

private val voiceDictionaryTexts = mapOf(
    "values" to listOf(
        "Voice dictionary",
        "Names and words voice typing should spell right",
        "Rambler receives these names and words with every dictation, so it spells them right. " +
            "Gboard's personal dictionary under Dictionary is for typing only.",
    ),
    "values-nl" to listOf(
        "Spraakwoordenboek",
        "Namen en woorden die spraakinvoer goed moet schrijven",
        "Rambler krijgt deze namen en woorden bij elk dictaat mee en schrijft ze daardoor goed. " +
            "Het persoonlijke woordenboek van Gboard onder Woordenboek is alleen voor typen.",
    ),
)
private val voiceDictionaryStringNames = listOf(
    "morphe_voice_dictionary_title", "morphe_voice_dictionary_summary", "morphe_voice_dictionary_footer",
)

private fun Element.children() = (0 until childNodes.length).map(childNodes::item).filterIsInstance<Element>()
private fun Document.elements() = getElementsByTagName("*").let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }
private fun Element.dictionaryEntry() = children().any { extra ->
    extra.tagName == "extra" && extra.getAttributeNS(ANDROID, "name") == HIDE_IF_FLAG &&
        dictionaryFlags.any { extra.getAttributeNS(ANDROID, "value").startsWith(it) }
}

/**
 * Moves the contact names switch, the voice correction list, "Clear all corrected words", the
 * hidden "remember corrected words" toggle and the explanation footer from the Rambler screen to
 * the Voice dictionary screen, which replaces the unused older Rambler layout.
 */
internal fun moveDictionaryEntries(rambler: Document, dictionary: Document) {
    val moved = rambler.elements().filter { it.dictionaryEntry() }
    if (moved.none { it.getAttributeNS(ANDROID, "fragment").endsWith(".VoiceCorrectionListFragment") }) {
        throw PatchException("Rambler settings no longer link the voice correction list")
    }
    val footers = moved.filter { it.tagName.endsWith("FooterPreference") }
    if (footers.size != 1 || moved.size < 4) {
        throw PatchException("Unexpected Rambler dictionary entries: ${moved.map { it.tagName }}")
    }
    val categoryTag = moved.first { it !in footers }.parentNode.let { (it as Element).tagName }

    val root = dictionary.documentElement
    while (root.firstChild != null) root.removeChild(root.firstChild)
    root.setAttributeNS(ANDROID, "android:key", VOICE_DICTIONARY_KEY)
    root.setAttributeNS(ANDROID, "android:title", "@string/${voiceDictionaryStringNames[0]}")
    val category = dictionary.createElement(categoryTag)
    root.appendChild(category)
    for (entry in moved) {
        val parent = entry.parentNode as Element
        parent.removeChild(entry)
        if (parent !== rambler.documentElement && parent.children().isEmpty()) parent.parentNode.removeChild(parent)
        val copy = dictionary.importNode(entry, true) as Element
        if (entry in footers) {
            copy.setAttributeNS(ANDROID, "android:title", "@string/${voiceDictionaryStringNames[2]}")
            root.appendChild(copy)
        } else {
            category.appendChild(copy)
        }
    }
}

/** Adds the Voice dictionary entry to Voice typing, above the Dictation type choice. */
internal fun addVoiceDictionaryEntry(voice: Document, icon: String) {
    val root = voice.documentElement
    if (voice.elements().any { it.getAttributeNS(ANDROID, "key") == VOICE_DICTIONARY_KEY }) {
        throw PatchException("Voice dictionary is already in the voice typing settings")
    }
    val dictationType = root.children().firstOrNull { it.tagName.endsWith("PreferenceCategory") }
        ?: throw PatchException("Voice typing settings have no Dictation type category")
    val entry = voice.createElement("Preference").apply {
        setAttributeNS(ANDROID, "android:key", VOICE_DICTIONARY_KEY)
        setAttributeNS(ANDROID, "android:persistent", "false")
        setAttributeNS(ANDROID, "android:title", "@string/${voiceDictionaryStringNames[0]}")
        setAttributeNS(ANDROID, "android:summary", "@string/${voiceDictionaryStringNames[1]}")
        if (icon.isNotEmpty()) setAttributeNS(ANDROID, "android:icon", icon)
        setAttributeNS(ANDROID, "android:fragment", RAMBLER_FRAGMENT)
        appendChild(voice.createElement("extra").apply {
            setAttributeNS(ANDROID, "android:name", SCREEN_EXTRA)
            setAttributeNS(ANDROID, "android:value", SCREEN_VOICE_DICTIONARY)
        })
    }
    root.insertBefore(entry, dictationType)
}

private val voiceDictionaryScreens = resourcePatch(
    description = "Move Rambler's dictionary settings to their own Voice dictionary screen under Voice typing.",
) {
    compatibleWith(gboard)

    execute {
        for ((folder, texts) in voiceDictionaryTexts) {
            val path = "res/$folder/strings.xml"
            if (folder != "values" && !get(path).isFile) continue
            document(path).use { strings ->
                for ((name, value) in voiceDictionaryStringNames.zip(texts)) {
                    strings.documentElement.appendChild(strings.createElement("string").apply {
                        setAttribute("name", name)
                        textContent = value
                    })
                }
            }
        }
        for (path in listOf(RAMBLER_SCREEN, DICTIONARY_SCREEN, VOICE_SCREEN)) {
            if (!get(path).isFile) throw PatchException("$path not found")
        }
        var icon = ""
        document(RAMBLER_SCREEN).use { rambler ->
            icon = rambler.elements().first { it.getAttributeNS(ANDROID, "fragment").endsWith(".VoiceCorrectionListFragment") }
                .getAttributeNS(ANDROID, "icon")
            document(DICTIONARY_SCREEN).use { dictionary -> moveDictionaryEntries(rambler, dictionary) }
        }
        document(VOICE_SCREEN).use { voice -> addVoiceDictionaryEntry(voice, icon) }
    }
}

/** The fragment's arguments field: the Bundle that androidx's requireArguments() checks. */
context(context: BytecodePatchContext)
private fun fragmentArgumentsField(fragmentType: String): FieldReference {
    var type: String? = fragmentType
    while (type != null) {
        val owner = context.classDefBy(type)
        for (method in owner.methods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            if (method.returnType != "Landroid/os/Bundle;" || method.parameterTypes.isNotEmpty()) continue
            if (instructions.none { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == ARGUMENTS_MESSAGE }) continue
            val reads = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
                .filter { it.type == "Landroid/os/Bundle;" && it.definingClass == owner.type }.distinct()
            return reads.singleOrNull() ?: throw PatchException("Expected one fragment arguments field, found ${reads.size}")
        }
        type = owner.superclass
    }
    throw PatchException("Fragment arguments field not found above $fragmentType")
}

private val voiceDictionaryFragment = bytecodePatch(
    description = "Open Gboard's Rambler settings fragment as the Voice dictionary screen.",
) {
    compatibleWith(gboard)

    execute {
        val fragment = mutableClassDefBy(RAMBLER_FRAGMENT_TYPE)
        val layoutFor = fragment.methods.singleOrNull {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "I" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Z")
        } ?: throw PatchException("Rambler settings layout choice not found")
        val layout = fragment.methods.singleOrNull { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "I" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.INVOKE_STATIC && ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.definingClass == fragment.type && ref.name == layoutFor.name
                    }
                } == true
        } ?: throw PatchException("Rambler settings layout method not found")
        // v0 is the only register in 18.6.3 (it is also `this`), which is fine as long as the original
        // body overwrites it before reading it; then the injected code may reuse it.
        val registers = layout.implementation?.registerCount ?: 0
        val first = layout.implementation?.instructions?.firstOrNull()
        if (registers < 1 || registers < 2 && !(first?.opcode == Opcode.SGET_OBJECT && (first as OneRegisterInstruction).registerA == 0)) {
            throw PatchException("Rambler settings layout method has no free register")
        }
        val arguments = fragmentArgumentsField(fragment.type)
        // Opened from Voice dictionary: show the older layout, which now holds the dictionary.
        layout.addInstructionsWithLabels(0, """
            iget-object v0, p0, ${arguments.definingClass}->${arguments.name}:${arguments.type}
            invoke-static {v0}, $DICTIONARY_RUNTIME->isVoiceDictionaryScreen(Landroid/os/Bundle;)Z
            move-result v0
            if-eqz v0, :rambler
            const/4 v0, 0x0
            invoke-static {v0}, ${fragment.type}->${layoutFor.name}(Z)I
            move-result v0
            return v0
        """.trimIndent(), ExternalLabel("rambler", layout.getInstruction(0)))
    }
}

/** Both halves of the Voice dictionary screen, applied by Rambler personal dictionary. */
internal val voiceDictionarySettings = bytecodePatch(
    description = "Give Rambler's dictionary its own Voice dictionary screen under Voice typing.",
) {
    compatibleWith(gboard)
    dependsOn(voiceDictionaryScreens, voiceDictionaryFragment)
}
