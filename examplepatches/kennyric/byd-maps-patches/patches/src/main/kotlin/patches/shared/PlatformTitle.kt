package patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

/**
 * Morphe groups patches per app name and does not separate the phone build from the TV
 * build. Apps whose phone and TV builds share one package name (Videoland, NPO Start)
 * therefore carry a platform suffix in every patch title, for example
 * "Hide ads (Android - v116.4)" next to "Hide ads (Android TV - v118)".
 *
 * The suffix derives from the declared [Compatibility] targets, so version bumps update
 * the titles without manual edits. Patches covering several platforms join them with
 * " & ", and the version part disappears when the platforms stop sharing one version.
 */
internal fun platformTitleSuffix(vararg apps: Compatibility): String {
    require(apps.isNotEmpty()) { "platformTitleSuffix needs at least one app" }
    val platforms = apps.flatMap { listOfNotNull(it.formFactor) }
        .distinct()
        .sortedBy { it == FormFactor.TV }
        .joinToString(" & ") { if (it == FormFactor.TV) "Android TV" else "Android" }
    val versions = apps.flatMap { it.targets }.mapNotNull(AppTarget::version).distinct().singleOrNull()
    return "($platforms${versions?.let { " - v${shortTargetVersion(it)}" }.orEmpty()})"
}

/** Abbreviates a target version the way the registry publishes it: 1.116.4 is v116.4 and 1.118.0 is v118. */
private fun shortTargetVersion(version: String): String {
    val withoutMajor = version.removePrefix("1.")
    return if (withoutMajor.endsWith(".0")) withoutMajor.removeSuffix(".0") else withoutMajor
}
