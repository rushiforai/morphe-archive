@file:Suppress("DEPRECATION")

package app.ra1nify.f4t.keyboard

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.resourceXml
import app.ra1nify.f4t.shared.OPLUS_KEYBOARD

private const val IME_CONFIG = "res/xml/ime_config.xml"

/**
 * Declares the keyboard as an inline-autofill capable input method.
 *
 * The autofill framework only pushes inline suggestions to an IME that advertises
 * `android:supportsInlineSuggestions` in its input method descriptor. The stock keyboard does not, so
 * password managers have no way to offer a fill suggestion inside the keyboard surface.
 *
 * This patch only adds the declaration. Rendering the fill bubble is done by the companion module,
 * which draws it in the keyboard's own window; the keyboard ships no inline suggestion UI of its own.
 * That split is deliberate: the declaration is a one-attribute resource change, while the UI depends
 * on the host version and belongs on the hooking side.
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

    // The anti-resale notice is not optional: every keyboard patch pulls it in.
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
