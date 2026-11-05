package app.template.patches.sofascore.controls

import app.morphe.patcher.Fingerprint

// The Settings screen: SettingsFragment keeps its name (it is a Hilt fragment). Its onViewCreated
// work is R8-renamed (O here): AbstractFragment.onViewCreated calls this abstract (View, Bundle)V
// with the fragment's root view, the inflated fragment_settings layout. It is the only method of
// that shape in the class.
internal object SettingsFragmentViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/sofascore/results/settings/SettingsFragment;",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)
