package io.github.jordanwoodson.patches.kick.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.shared.apps.KICK
import io.github.jordanwoodson.patches.shared.apps.lurkSettings
import io.github.jordanwoodson.patches.shared.apps.reactNativeBundleLoader

internal val kickSettings = KICK.settings
internal const val KICK_BUNDLE = "Lio/github/jordanwoodson/extension/shared/kick/KickBundle;"

/** The Kick version the patches target, from COMPATIBILITY_KICK, for messages. */
private val KICK_VERSION = COMPATIBILITY_KICK.targets.joinToString(" or ") { "${it.version}" }

context(context: BytecodePatchContext)
internal fun Fingerprint.kickMatch(what: String): Match = matchAllOrNull()?.singleOrNull()
    ?: throw PatchException("Kick $KICK_VERSION: expected exactly one $what")

internal val kickSettingsPatch = bytecodePatch(
    description = "Adds Lurk settings to Kick: the Lurk settings launcher shortcut and the app settings link on " +
        "Android's App info page. Lurk in account menu adds a row to Kick's own menu.",
) {
    lurkSettings(KICK)
}

/** Only Hermes consumers need this hook. Native-only patch combinations never read a manifest. */
internal val kickBundleLoaderPatch = bytecodePatch {
    reactNativeBundleLoader(KICK, kickSettingsPatch)
}
