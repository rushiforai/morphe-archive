package app.smartlife.patches.smartlife.misc.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * ToolbarSettingCell.k(ViewGroup): builds the settings button shown top-right of the profile
 * ("me") tab and wires its click. We locate the setOnClickListener call to attach a long-press
 * next to it. Matched by the class plus the "tvSetting" string in that method.
 */
internal object ProfileSettingsCellFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/personal/center/plug/cell/toolbar/setting/ToolbarSettingCell;",
    filters = listOf(
        string("tvSetting"),
        methodCall(definingClass = "Landroid/view/View;", name = "setOnClickListener"),
    ),
)

/**
 * SettingActivity.initToolbar(): sets up the in-app Settings screen toolbar. We attach a
 * long-press to the toolbar returned by getToolBar().
 */
internal object SettingActivityToolbarFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/personal/setting/plug/activity/SettingActivity;",
    name = "initToolbar",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(name = "getToolBar"),
    ),
)
