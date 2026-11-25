package dev.jason.gboardpatches.patches.gboard

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.shared.GboardFlagFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardFlagFamilyFeaturePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

// Rambler features Gboard 18.6.3 ships switched off behind server flags, each its own patch.
// All three are confirmed on a phone.

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val RAMBLER_SETTINGS = "res/xml/setting_rambler_voice_typing.xml"

/** The preference key Gboard reads (R.string pref_key_rambler_custom_instruction). */
internal const val CUSTOM_INSTRUCTION_KEY = "pref_key_rambler_custom_instruction"

private val customInstructionTexts = mapOf(
    "values" to listOf(
        "Custom instructions",
        "Style rules Rambler applies to everything you dictate, such as spelling, punctuation or tone",
        "Added to Rambler's own instructions. For example: Write every number in digits.",
    ),
    "values-nl" to listOf(
        "Eigen instructies",
        "Stijlregels die Rambler toepast op alles wat je dicteert, zoals spelling, interpunctie of toon",
        "Komt bij de eigen instructies van Rambler. Bijvoorbeeld: Schrijf elk getal in cijfers.",
    ),
)
private val customInstructionStringNames = listOf(
    "morphe_rambler_custom_instruction_title",
    "morphe_rambler_custom_instruction_summary",
    "morphe_rambler_custom_instruction_hint",
)

/**
 * Adds a text field for Gboard's own custom-instruction preference, in its own card at the top of the
 * Rambler voice typing screen. Gboard stores and reads the value itself; the field only writes it.
 */
internal fun addCustomInstructionPreference(screen: Document) {
    val root = screen.documentElement
    val nodes = screen.getElementsByTagName("*")
    val elements = (0 until nodes.length).map { nodes.item(it) as Element }
    if (elements.any { it.getAttributeNS(ANDROID_NS, "key") == CUSTOM_INSTRUCTION_KEY }) {
        throw PatchException("Rambler custom instructions are already in the settings screen")
    }
    val first = (0 until root.childNodes.length).map(root.childNodes::item).filterIsInstance<Element>()
        .firstOrNull { it.tagName.endsWith("PreferenceCategory") }
        ?: throw PatchException("Rambler voice typing settings have no preference category")
    // Its own card at the top, whichever other patch moves or empties the existing ones.
    val category = screen.createElement(first.tagName)
    root.insertBefore(category, first)
    val field = screen.createElement("EditTextPreference").apply {
        setAttributeNS(ANDROID_NS, "android:key", CUSTOM_INSTRUCTION_KEY)
        setAttributeNS(ANDROID_NS, "android:persistent", "true")
        setAttributeNS(ANDROID_NS, "android:defaultValue", "")
        setAttributeNS(ANDROID_NS, "android:title", "@string/${customInstructionStringNames[0]}")
        setAttributeNS(ANDROID_NS, "android:summary", "@string/${customInstructionStringNames[1]}")
        setAttributeNS(ANDROID_NS, "android:dialogTitle", "@string/${customInstructionStringNames[0]}")
        setAttributeNS(ANDROID_NS, "android:dialogMessage", "@string/${customInstructionStringNames[2]}")
    }
    category.insertBefore(field, category.firstChild)
}

private val customInstructionSettings = resourcePatch(
    description = "Add a custom instructions field to Gboard settings → Voice typing → Rambler.",
) {
    compatibleWith(gboard)

    execute {
        for ((folder, texts) in customInstructionTexts) {
            val path = "res/$folder/strings.xml"
            if (folder != "values" && !get(path).isFile) continue
            document(path).use { strings ->
                for ((name, value) in customInstructionStringNames.zip(texts)) {
                    strings.documentElement.appendChild(strings.createElement("string").apply {
                        setAttribute("name", name)
                        textContent = value
                    })
                }
            }
        }
        if (!get(RAMBLER_SETTINGS).isFile) throw PatchException("$RAMBLER_SETTINGS not found")
        document(RAMBLER_SETTINGS).use(::addCustomInstructionPreference)
    }
}

@Suppress("unused")
val ramblerCustomInstructions = bytecodePatch(
    name = "Rambler custom instructions",
    description = "Adds Custom instructions to Gboard settings → Voice typing → Rambler. Your text is added to " +
        "Rambler's own instructions, not a replacement for them: Rambler receives it with every dictation and " +
        "follows it for style only, such as spelling, punctuation, vocabulary and tone. For example: \"Write every " +
        "number in digits.\" Requires Rambler voice typing.",
) {
    compatibleWith(gboard)
    dependsOn(
        originalInput, ramblerVoiceTyping, customInstructionSettings,
        gboardFlagFamilyFeaturePatch(
            description = "Send Rambler's custom instructions with each dictation.",
            feature = GboardFlagFamilyFeature.RAMBLER_CUSTOM_INSTRUCTIONS,
        ),
    )
}

@Suppress("unused")
val ramblerCursorEditing = bytecodePatch(
    name = "Rambler cursor-aware editing",
    description = "Rambler also sees the text after the cursor, so spoken edits reach the whole text and dictating " +
        "in the middle of a text fits in. With text selected, only the selection is sent, so a spoken edit such as " +
        "\"make this more formal\" applies to it, and the result is selected again for the next edit. " +
        "Requires Rambler voice typing.",
) {
    compatibleWith(gboard)
    dependsOn(
        originalInput, ramblerVoiceTyping,
        gboardFlagFamilyFeaturePatch(
            description = "Send the text around the cursor and the selection to Rambler.",
            feature = GboardFlagFamilyFeature.RAMBLER_CURSOR_EDITING,
        ),
    )
}

@Suppress("unused")
val ramblerAppContext = bytecodePatch(
    name = "Rambler app context",
    description = "Rambler also receives the name of the app you dictate in and the text field's hint, so it can " +
        "match the tone of a chat, an e-mail or a search, and custom instructions can depend on the app. This " +
        "tells Google which app you are typing in. Requires Rambler voice typing.",
) {
    compatibleWith(gboard)
    dependsOn(
        originalInput, ramblerVoiceTyping,
        gboardFlagFamilyFeaturePatch(
            description = "Send the app's name and field hint to Rambler.",
            feature = GboardFlagFamilyFeature.RAMBLER_APP_CONTEXT,
        ),
    )
}
