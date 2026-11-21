package app.template.patches.spotify.ui

/** Run by the testSpotifyAmoled Gradle task; no Android device is needed. */
object AmoledThemeTest {
    @JvmStatic
    fun main(args: Array<String>) {
        neutralDarkGraysAreDetected()
        accentsTextAndTranslucentsAreLeftAlone()

        println("Spotify AMOLED helpers passed")
    }

    private fun neutralDarkGraysAreDetected() {
        check(isNeutralDarkGray("#121212"))
        check(isNeutralDarkGray("#282828"))
        check(isNeutralDarkGray("#1e1e1e"))
        check(isNeutralDarkGray("#ff212121"))
        check(isNeutralDarkGray("#3A3A3A"))
    }

    private fun accentsTextAndTranslucentsAreLeftAlone() {
        check(!isNeutralDarkGray("#1ED760")) { "accent green must stay" }
        check(!isNeutralDarkGray("#ff808080")) { "mid gray is not a dark surface" }
        check(!isNeutralDarkGray("#80121212")) { "translucent surfaces keep their alpha" }
        check(!isNeutralDarkGray("#1212ff")) { "tinted blues are not neutral grays" }
        check(!isNeutralDarkGray("#12345")) { "malformed values are ignored" }
    }
}
