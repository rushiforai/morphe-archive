package app.deviceinfo.patches.settings

import app.deviceinfo.patches.settings.resource.preferenceScreen
import app.deviceinfo.patches.settings.resource.removePreference
import app.deviceinfo.patches.shared.Constants.COMPATIBILITY_DEVICEINFO
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private val removeDonatePreferencePatch = resourcePatch {
    execute {
        // The fragment null-checks `findPreference("pref_donate")`. Already gone when
        // Hide Support Us Section removed its whole category - removePreference is a no-op then.
        preferenceScreen("res/xml/settings.xml") {
            removePreference("pref_donate")
        }
    }
}

@Suppress("unused")
val removeDonateScreenPatch = bytecodePatch(
    name = "Remove Donate Screen",
    description = "Removes every way into the Donate screen (Settings \"Donate (Remove Ads)\", " +
        "the overflow-menu and About-screen \"Remove Ads\" buttons) and makes the screen close " +
        "itself immediately if anything still opens it.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DEVICEINFO)

    dependsOn(removeDonatePreferencePatch, hideRemoveAdsButtonPatch)

    execute {
        // Launch sites in 3.4.4.0: settings pref (`Lei2;`), menu (`Lsi1;`), About button (`Lkq;`)
        // and the promo card's button (`Le;`, only shown while not ad-free). The first three are
        // removed by the resource patches above; this guard covers the promo card and anything
        // added later. `.locals 28` puts p0 at v28, past the 4-bit range of a plain invoke.
        DonateActivityOnCreateFingerprint.let {
            it.method.addInstructions(
                it.instructionMatches.first().index + 1,
                """
                    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->finish()V
                    return-void
                """,
            )
        }
    }
}
