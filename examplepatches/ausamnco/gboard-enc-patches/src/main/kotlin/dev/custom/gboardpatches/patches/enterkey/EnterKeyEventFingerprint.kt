package dev.custom.gboardpatches.patches.enterkey

import app.morphe.patcher.Fingerprint

/**
 * Matches GoogleInputMethodService.dD(Event) in Gboard.
 *
 * This method receives every softkey press event (including Enter and IME actions)
 * right at the InputMethodService level before routing.
 *
 * Characteristics:
 * - Direct subclass of `android.inputmethodservice.InputMethodService`
 * - Return type: `V` (void)
 * - Single parameter: Event object (`Lnur;`)
 * - Contains string literal: `"Expected in UI thread, but not."`
 */
object EnterKeyEventFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Expected in UI thread, but not."),
    custom = { method, classDef ->
        classDef.superclass == "Landroid/inputmethodservice/InputMethodService;" &&
        method.parameterTypes.size == 1 &&
        method.parameterTypes[0].startsWith("L")
    }
)
