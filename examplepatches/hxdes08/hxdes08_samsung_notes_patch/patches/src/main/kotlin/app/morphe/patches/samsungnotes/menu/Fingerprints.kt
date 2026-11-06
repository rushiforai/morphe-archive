package app.morphe.patches.samsungnotes.menu

import app.morphe.patcher.Fingerprint

// Edit-Modus-Dispatch (enthält action_share, action_print, ...).
internal object OptionsItemSelectedToShareFingerprint : Fingerprint(
    name = "doOptionsItemSelectedToShare",
    returnType = "Z",
    parameters = listOf("I")
)

// View-Modus-Dispatch (enthält action_print, action_lock, ...).
internal object OptionsItemSelectedForViewModeFingerprint : Fingerprint(
    name = "doOptionsItemSelectedForViewModeMenu",
    returnType = "Z",
    parameters = listOf("I")
)