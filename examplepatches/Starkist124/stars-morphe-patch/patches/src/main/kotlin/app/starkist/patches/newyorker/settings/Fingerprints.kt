package app.starkist.patches.newyorker.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Collector inside SettingsViewModel.getViewComponents that publishes the list of
 * settings rows (SettingsViewModel$l$a.a in 10.7.2). It is the only method that
 * reads the private _settingsViewComponents field from a nested class.
 */
object SettingsListCollectorFingerprint : Fingerprint(
    definingClass = "Lcom/condenast/thenewyorker/settings/viewmodel/SettingsViewModel\$",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "L"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/condenast/thenewyorker/settings/viewmodel/SettingsViewModel;",
            name = "access\$get_settingsViewComponents\$p",
        ),
    )
)

/**
 * SettingsFragment's click handler for buttons and the Display Settings row
 * (SettingsFragment.E(View, String) in 10.7.2).
 */
object SettingsRowClickFingerprint : Fingerprint(
    definingClass = "Lcom/condenast/thenewyorker/settings/view/SettingsFragment;",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Ljava/lang/String;"),
    filters = listOf(
        string("CLICK_SUBSCRIBE"),
    )
)
