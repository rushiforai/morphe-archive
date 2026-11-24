@file:Suppress("DEPRECATION")

package app.ra1nify.f4t.keyboard

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.resourceXml
import app.ra1nify.f4t.shared.OPLUS_KEYBOARD

private const val IME_CONFIG = "res/xml/ime_config.xml"

/**
 * Adds `android:supportsInlineSuggestions="true"` to the input method descriptor.
 *
 * The autofill framework only pushes inline suggestions to an IME that advertises this attribute.
 * The fill bubble itself is drawn by the companion module.
 */
@Suppress("unused")
val enableInlineAutofillPatch = resourcePatch(
    name = "Enable Inline Autofill",
    description = "Declares the keyboard as an inline-autofill capable IME " +
        "(android:supportsInlineSuggestions in the input method descriptor), so the autofill framework " +
        "offers password manager fill suggestions to it. The declaration is the whole patch: drawing " +
        "the fill bubble is done by the companion module, not by the keyboard.",
    default = false,
) {
    compatibleWith(OPLUS_KEYBOARD)

    dependsOn(keyboardAntiResalePatch)

    execute {
        enableInlineSuggestions()

        println("[keyboard] inline autofill declared in $IME_CONFIG")
    }
}

private fun enableInlineSuggestions() {
    resourceXml(IME_CONFIG).use { imeConfig ->
        val inputMethod = imeConfig.elements("input-method").firstOrNull()
            ?: throw PatchException("$IME_CONFIG has no <input-method> element")
        if (inputMethod.attribute("android:supportsInlineSuggestions") == "true") {
            println("[keyboard] inline suggestions already enabled in $IME_CONFIG")
            return
        }
        inputMethod.setAttribute("android:supportsInlineSuggestions", "true")
        println("[keyboard] inline suggestions enabled in $IME_CONFIG")
    }
}
