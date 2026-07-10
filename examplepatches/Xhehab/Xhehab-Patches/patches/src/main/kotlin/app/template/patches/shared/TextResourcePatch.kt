package app.template.patches.shared

import app.morphe.patcher.patch.PatchException
import java.nio.charset.StandardCharsets

internal fun ByteArray.replaceTextOnce(
    path: String,
    search: String,
    replacement: String
): ByteArray {
    val text = toString(StandardCharsets.UTF_8)
    val matchCount = Regex.escape(search).toRegex().findAll(text).count()
    if (matchCount != 1) {
        throw PatchException("$path: expected one match for resource patch, found $matchCount.")
    }

    return text.replace(search, replacement).toByteArray(StandardCharsets.UTF_8)
}
