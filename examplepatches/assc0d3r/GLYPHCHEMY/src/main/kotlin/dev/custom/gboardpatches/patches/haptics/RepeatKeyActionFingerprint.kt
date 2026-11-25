package dev.custom.gboardpatches.patches.haptics

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/**
 * Matches the key repeat dispatch method in Gboard's PointerTracker (`pvi.q`).
 *
 * In stock Gboard, this method is invoked on every auto-repeat tick when a repeatable key
 * (such as Backspace / KEYCODE_DEL) is held down.
 *
 * Method signature:
 * `(Lcom/google/android/libraries/inputmethod/metadata/ActionDef;Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;JZJI)V`
 */
object RepeatKeyActionFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lcom/google/android/libraries/inputmethod/metadata/ActionDef;",
        "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;",
        "J",
        "Z",
        "J",
        "I"
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/android/libraries/inputmethod/metadata/ActionDef;",
            name = "b"
        ),
        methodCall(
            name = "f",
            returnType = "V"
        )
    )
)
