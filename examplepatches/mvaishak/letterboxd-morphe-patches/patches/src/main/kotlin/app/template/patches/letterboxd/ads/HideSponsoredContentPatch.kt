package app.template.patches.letterboxd.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.letterboxd.LetterboxdApplicationOnCreateFingerprint
import app.template.patches.letterboxd.modSettingsPatch
import app.template.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import com.android.tools.smali.dexlib2.AccessFlags

internal object HomeFeaturedTrailerFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/popular/PopularViewModel\$UIState\$MainView;",
    name = "getFeaturedTrailer",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/letterboxd/api/model/FeaturedContentItem\$FeaturedTrailer;",
    parameters = emptyList(),
)

/**
 * The Films home observer treats a null featured trailer as no sponsored placement and sets
 * its entire adComposeView to GONE. Taking that branch also skips the sponsored composable's
 * impression tracking, without changing regular film trailers or other home sections.
 */
@Suppress("unused")
val hideSponsoredContentPatch = bytecodePatch(
    name = "Hide sponsored content",
    description = "Hides Letterboxd's sponsored Spotlight / featured-trailer card on the Films " +
        "home tab, including its space. Toggle it in Mod settings. On by default.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)
    dependsOn(modSettingsPatch)

    execute {
        val prefs = "Lapp/template/extension/settings/Prefs;"
        LetterboxdApplicationOnCreateFingerprint.method.addInstruction(
            0, "invoke-static {}, $prefs->enableSponsoredSpotlightControl()V",
        )
        HomeFeaturedTrailerFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, $prefs->hideSponsoredSpotlight()Z
                move-result v0
                if-eqz v0, :keep
                const/4 v0, 0x0
                return-object v0
                :keep
                nop
            """,
        )
    }
}
