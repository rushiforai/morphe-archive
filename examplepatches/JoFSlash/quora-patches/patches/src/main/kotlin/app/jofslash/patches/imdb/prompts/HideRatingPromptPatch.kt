package app.jofslash.patches.imdb.prompts

import app.jofslash.patches.imdb.shared.Constants.COMPATIBILITY_IMDB
import app.jofslash.patches.imdb.shared.methodOf
import app.jofslash.patches.imdb.shared.returnBoolean
import app.morphe.patcher.patch.bytecodePatch

// The "Like the IMDb app?" dialog (I love it! / I have some feedback / Dismiss) is one of the startup
// dialogs. show() displays it when shouldAlwaysShow() or wantToShow(), and otherwise just calls
// onDismissed, which lets the next startup dialog run.
private const val RATE_APP_DIALOG = "Lcom/imdb/mobile/rateapp/RateAppDialog;"

@Suppress("unused")
val hideRatingPromptPatch = bytecodePatch(
    name = "Hide rating prompt",
    description = "Hides the \"Like the IMDb app?\" dialog that asks you to rate the app on Google Play.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_IMDB)

    execute {
        // Take show()'s own "not now" branch: it calls onDismissed and the startup carries on.
        methodOf(RATE_APP_DIALOG, "shouldAlwaysShow").returnBoolean(false)
        methodOf(RATE_APP_DIALOG, "wantToShow").returnBoolean(false)
    }
}
