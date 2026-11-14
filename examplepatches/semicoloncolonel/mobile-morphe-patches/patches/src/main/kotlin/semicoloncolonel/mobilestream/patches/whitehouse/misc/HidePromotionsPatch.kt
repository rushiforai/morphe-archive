package semicoloncolonel.mobilestream.patches.whitehouse.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.whitehouse.shared.Constants

// White House 47.7.8 draws its promotions in JavaScript, with no setting or
// server switch to turn them off. PromoHider watches the main activity's
// layout and hides the button around each label chosen in the patch
// options.

private const val PROMO_HIDER = "Lsemicoloncolonel/mobilestream/extension/whitehouse/PromoHider;"

internal object HiddenLabelsFingerprint : Fingerprint(
    definingClass = PROMO_HIDER,
    name = "hiddenLabels",
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
)

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lgov/whitehouse/app/MainActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

private val PROMOTIONS = listOf(
    Triple("text_president", "Text President Trump", "Hide the \"Text President Trump\" button."),
    Triple("get_in_touch", "Get in Touch", "Hide the \"Get in Touch\" button on the social feeds."),
)

@Suppress("unused")
val hidePromotionsPatch = bytecodePatch(
    name = "Hide promotions",
    description = "Hides the promotional buttons you choose in the patch options.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    val options = PROMOTIONS.map { (key, label, description) ->
        label to booleanOption(
            key = "hide_$key",
            default = true,
            title = label,
            description = description,
            required = true,
        )
    }

    execute {
        val labels = options.filter { (_, option) -> option.value == true }.map { (label, _) -> label }
        if (labels.isEmpty()) throw PatchException("Choose at least one promotion to hide")

        HiddenLabelsFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "${labels.joinToString("|")}"
                return-object v0
            """.trimIndent(),
        )

        MainActivityOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p0 }, $PROMO_HIDER->install(Landroid/app/Activity;)V",
        )
    }
}
