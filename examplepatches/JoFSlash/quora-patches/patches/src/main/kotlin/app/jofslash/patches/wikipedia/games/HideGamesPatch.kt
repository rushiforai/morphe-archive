package app.jofslash.patches.wikipedia.games

import app.jofslash.patches.wikipedia.shared.Constants.COMPATIBILITY_WIKIPEDIA
import app.jofslash.patches.wikipedia.shared.methodOf
import app.jofslash.patches.wikipedia.shared.returnBoolean
import app.morphe.patcher.patch.bytecodePatch

private const val WIKI_GAMES = "Lorg/wikipedia/games/WikiGames;"

@Suppress("unused")
val hideGamesPatch = bytecodePatch(
    name = "Hide Games",
    description = "Hides Wikipedia Games (the daily \"Which came first?\" game): the Games entry in the More " +
            "menu, the game card on the home screen and the games module in Activity.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_WIKIPEDIA)

    execute {
        // Every place that shows a game first asks whether the game exists in your language: the
        // menu row, the home feed module, the Activity tab, the Games hub and the long-press menu.
        // Saying no for every language makes the app hide them as it does on wikis without games.
        methodOf(WIKI_GAMES, "isLangSupported").returnBoolean(false)
    }
}
