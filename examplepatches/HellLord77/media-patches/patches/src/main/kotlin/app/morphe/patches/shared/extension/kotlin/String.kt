package app.morphe.patches.shared.extension.kotlin

fun String.replaceLast(
    oldChar: Char,
    newChar: Char,
    ignoreCase: Boolean = false,
): String {
    val index = lastIndexOf(oldChar, ignoreCase = ignoreCase)
    return if (index < 0) this else replaceRange(index, index + 1, newChar.toString())
}

fun String.replaceLast(
    oldValue: String,
    newValue: String,
    ignoreCase: Boolean = false,
): String {
    val index = lastIndexOf(oldValue, ignoreCase = ignoreCase)
    return if (index < 0) this else replaceRange(index, index + oldValue.length, newValue)
}
