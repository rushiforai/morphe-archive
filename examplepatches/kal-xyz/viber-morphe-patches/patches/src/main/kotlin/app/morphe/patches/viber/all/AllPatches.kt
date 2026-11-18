package app.morphe.patches.viber.all

import app.morphe.patches.viber.ad.hideAdsPatch
import app.morphe.patches.viber.messages.antiDeletePatch
import app.morphe.patches.viber.privacy.ghostModePatch
import app.morphe.patches.viber.secondary.secondaryDevicePatch
import app.morphe.patches.viber.ui.cleanUiPatch

/**
 * Registry of all available Viber patches.
 */
val allViberPatches = listOf(
    hideAdsPatch,
    ghostModePatch,
    antiDeletePatch,
    cleanUiPatch,
    secondaryDevicePatch
)
