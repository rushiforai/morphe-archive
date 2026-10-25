package app.template.patches.yahoosports.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_YAHOO_SPORTS
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Yahoo Sports serves GAM and Taboola ads through Yahoo's sponsored-moments SDK, always inside
 * SportsAdCardView, and IMA pre-rolls through the Verizon Media player. MobileAds, the
 * SponsoredMoments initializer and the generic config delegate are not touched.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_YAHOO_SPORTS)

    execute {
        // 1. Every ad card hides itself instead of building and loading its ad view. CardCtrl
        // sets VISIBLE before setData, so GONE here is final.
        SportsAdCardViewSetDataFingerprint.method.addInstructionsChecked(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
                return-void
            """,
        )

        // 2. The sponsored-moments ad switches (Taboola native pencil, Taboola stream ads, GAM
        // pencils) answer false. Fail loudly if R8 ever inlines them away.
        val switches = AdConfigManagerClinitFingerprint.classDef.methods.filter { method ->
            AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                AccessFlags.FINAL.isSet(method.accessFlags) &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "Z" &&
                method.parameterTypes.isEmpty() &&
                method.implementation != null
        }
        if (switches.isEmpty()) {
            throw PatchException("Disable ads: no ad switch getter found on the sponsored-moments config manager")
        }
        switches.forEach { it.returnEarly(false) }

        // 3. Videos carry no IMA ad tag, so no pre-roll is requested.
        SapiMediaItemGetAdTagUriFingerprint.method.addInstructionsChecked(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}
