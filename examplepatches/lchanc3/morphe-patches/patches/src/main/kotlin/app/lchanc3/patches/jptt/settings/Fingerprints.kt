package app.lchanc3.patches.jptt.settings

import app.lchanc3.patches.jptt.shared.Constants.SETTINGS_PAGER_ADAPTER_CLASS
import app.morphe.patcher.Fingerprint

/**
 * `SettingsPagerAdapter.<clinit>()`, which builds the array of tab titles the
 * adapter derives its tab count, titles and fragment cache size from.
 */
internal object SettingsPagerAdapterClinitFingerprint : Fingerprint(
    definingClass = SETTINGS_PAGER_ADAPTER_CLASS,
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `SettingsPagerAdapter.getItem(int)`, a switch over the tab position whose
 * default branch returns null.
 */
internal object SettingsPagerAdapterGetItemFingerprint : Fingerprint(
    definingClass = SETTINGS_PAGER_ADAPTER_CLASS,
    name = "getItem",
    returnType = "Landroidx/fragment/app/Fragment;",
    parameters = listOf("I"),
)
