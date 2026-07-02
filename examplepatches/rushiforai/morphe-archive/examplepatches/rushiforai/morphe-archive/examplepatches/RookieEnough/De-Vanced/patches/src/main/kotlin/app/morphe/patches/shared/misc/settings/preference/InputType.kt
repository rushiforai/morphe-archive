/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/shared/misc/settings/preference/InputType.kt
 */
package app.morphe.patches.shared.misc.settings.preference

enum class InputType(val type: String) {
    TEXT("text"),
    TEXT_CAP_CHARACTERS("textCapCharacters"),
    TEXT_MULTI_LINE("textMultiLine"),
    NUMBER("number"),
    NUMBER_DECIMAL("numberDecimal"),
}