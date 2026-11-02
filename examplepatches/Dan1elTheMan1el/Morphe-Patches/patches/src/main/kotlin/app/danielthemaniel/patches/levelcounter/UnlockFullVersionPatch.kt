package app.danielthemaniel.patches.levelcounter

import app.morphe.patcher.patch.resourcePatch

private const val MAIN_BUNDLE = "assets/www/cordova.d6b87a48.js"
private const val FULL_VERSION_SELECTOR = "function b(e){return e.settings.fullVersion}"
private const val UNLOCKED_FULL_VERSION_SELECTOR = "function b(e){return!0}"

/**
 * Unlocks Counter's built-in full-version features by forcing the app's
 * central fullVersion selector to report true.
 *
 * The underlying billing and persisted Redux state are left untouched. This
 * only changes what the application sees when it reads settings.fullVersion,
 * so every feature using the shared full-version context follows the stock
 * unlocked UI/behavior without patching each premium screen individually.
 */
@Suppress("unused")
val unlockFullVersionPatch = resourcePatch(
    name = "Unlock Full Version",
    description = "Unlocks Counter's built-in full-version features, including the Color menu.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LEVEL_COUNTER)

    execute {
        val bundle = get(MAIN_BUNDLE)
        val content = bundle.readText()

        val matches = Regex(Regex.escape(FULL_VERSION_SELECTOR))
            .findAll(content)
            .count()

        require(matches == 1) {
            "Expected exactly one fullVersion selector in $MAIN_BUNDLE, found $matches"
        }

        bundle.writeText(
            content.replace(
                oldValue = FULL_VERSION_SELECTOR,
                newValue = UNLOCKED_FULL_VERSION_SELECTOR,
            )
        )
    }
}
