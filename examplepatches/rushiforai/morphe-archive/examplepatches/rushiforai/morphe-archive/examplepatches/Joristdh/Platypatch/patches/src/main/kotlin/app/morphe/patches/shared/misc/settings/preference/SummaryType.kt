/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/shared/misc/settings/preference/SummaryType.kt
 */
package app.morphe.patches.shared.misc.settings.preference

enum class SummaryType(val type: String) {
    DEFAULT("summary"), ON("summaryOn"), OFF("summaryOff")
}