package app.morphe.patches.mapsautomotive

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.stringOption

// The app's name: its label in the launcher, Settings, recents and the open-with chooser, the same in
// every locale. "Maps" by default, Google's own short name for Maps. Phone Maps on the same head unit
// is "Maps" too, so the option lets the user pick another name, such as "Maps Car". The problem
// report's launcher entry is "Report" and the name. The option belongs to the core patch, which the
// GUI shows; its manifest patch reads it.
internal const val DEFAULT_APP_NAME = "Maps"
private const val MAX_APP_NAME_LENGTH = 30
// Allowed besides letters, marks (Thai vowels and tone marks) and digits. No comma: Morphe Desktop shows
// a string option without presets as a list editor once its value holds one, so a name with a comma
// would break if the presets were ever dropped.
private const val APP_NAME_PUNCTUATION = " -_.'&()+!:"
private val WHITESPACE = Regex("[\\s\\p{Z}]+")

internal val appNameOption = stringOption(
    key = "appName",
    default = DEFAULT_APP_NAME,
    values = mapOf(DEFAULT_APP_NAME to DEFAULT_APP_NAME, "Maps Car" to "Maps Car"),
    title = "App name",
    description = "The name in the launcher and the app list. Up to $MAX_APP_NAME_LENGTH letters, digits, spaces and " +
        "- _ . ' & ( ) + ! : characters, starting with a letter or digit. The problem report's launcher entry is " +
        "\"Report\" and this name. Phone Maps is called Maps too: pick Maps Car to tell them apart.",
    required = true,
)

// The option's value as the manifest label: whitespace trimmed and runs of it made one space. Any other
// character outside the allowed set fails the patch, so a name never becomes a resource reference (a
// leading @ or ?), never loses a backslash and never breaks the manifest (control characters).
internal fun appLabel(value: String?): String {
    val name = (value ?: DEFAULT_APP_NAME).replace(WHITESPACE, " ").trim()
    val length = name.codePointCount(0, name.length)
    if (length !in 1..MAX_APP_NAME_LENGTH) {
        throw PatchException("App name must have 1 to $MAX_APP_NAME_LENGTH characters, found $length")
    }
    if (!Character.isLetterOrDigit(name.codePointAt(0))) {
        throw PatchException("App name must start with a letter or digit: \"$name\"")
    }
    var index = 0
    while (index < name.length) {
        val point = name.codePointAt(index)
        if (!allowedInAppName(point)) {
            throw PatchException("App name has a character that is not allowed (U+%04X) at %d".format(point, index))
        }
        index += Character.charCount(point)
    }
    return name
}

private fun allowedInAppName(point: Int) = when (Character.getType(point).toByte()) {
    Character.UPPERCASE_LETTER, Character.LOWERCASE_LETTER, Character.TITLECASE_LETTER, Character.MODIFIER_LETTER,
    Character.OTHER_LETTER, Character.NON_SPACING_MARK, Character.COMBINING_SPACING_MARK,
    Character.DECIMAL_DIGIT_NUMBER, Character.LETTER_NUMBER, Character.OTHER_NUMBER,
    -> true
    else -> point < 0x80 && APP_NAME_PUNCTUATION.indexOf(point.toChar()) >= 0
}
