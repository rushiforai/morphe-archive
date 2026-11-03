package app.consumerclarity.patches.talabat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

private fun displayPreference(name: String, description: String, key: String) = consumerBytecodePatch(
    name,
    description,
    "Accessibility",
    key,
    kind = key,
) {
    execute {
        mutableClassDefBy("LEf/m;").methods.single { it.name == "onCreate" }.addInstructions(
            0,
            "invoke-static {p0}, Lapp/consumerclarity/ConsumerClarityDisplay;->apply(Landroid/app/Activity;)V",
        )
    }
}

@Suppress("unused")
val preferredLanguagePatch = displayPreference(
    "Preferred app language",
    "Adds System Default, English, Arabic, and Kurdish language choices for Talabat's interface.",
    "preferred_language",
)

@Suppress("unused")
val textScalePatch = displayPreference(
    "Text size",
    "Adds independent text scaling from 85% to 130% without changing device-wide font settings.",
    "text_scale",
)
