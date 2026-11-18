package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.mlb.shared.Constants as Mlb
import semicoloncolonel.mobilestream.patches.pluto.shared.Constants as Pluto

// Every Mask live ad breaks and Mask ads cover takes its text from
// AdBreakText, which picks a translation by the device's language once
// translate() returns true. Without a mask patch, nothing reads it.
internal object AdBreakTranslateFingerprint : Fingerprint(
    definingClass = "Lsemicoloncolonel/mobilestream/extension/shared/misc/AdBreakText;",
    name = "translate",
    returnType = "Z",
)

@Suppress("unused")
val translateAdBreakScreenPatch = bytecodePatch(
    name = "Translate ad break screen",
    description = "Experimental. Shows the \"We'll be right back!\" screen in your device's language when it is " +
        "Arabic, Chinese, French, German, Greek, Italian, Korean, Portuguese, Russian, Spanish, Tagalog, or Vietnamese. " +
        "Other languages show English. The translations come from a translation service. " +
        "Please submit corrections or rewrites through GitHub issues.",
) {
    category("Ads")
    compatibleWith(Mlb.COMPATIBILITY, Pluto.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        AdBreakTranslateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
