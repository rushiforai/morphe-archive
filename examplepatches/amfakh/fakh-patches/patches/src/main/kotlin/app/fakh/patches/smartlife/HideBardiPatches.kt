package app.fakh.patches.smartlife

import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_BARDI
import app.morphe.patcher.patch.bytecodePatch

// BARDI renames the visibility method (`d` instead of `f`), so the cells are matched by their signature alone.
private val advertisingFingerprint = cellVisibilityFingerprint("AdvertisingCell", name = null)
private val miniWidgetFingerprint = cellVisibilityFingerprint("PersonalMiniWidgetCell", name = null)
private val appMallFingerprint = cellVisibilityFingerprint("MallCell", name = null)

@Suppress("unused")
val hideMallTabPatch = bytecodePatch(
    name = "Hide Mall tab",
    description = "Removes the Mall tab from the navigation bar.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BARDI)
    category("Layout")
    dependsOn(tabFilterPatch, switchRow("fakh_hide_mall_tab"), settingsSwitchesPatch)
}

@Suppress("unused")
val hideMeBannerPatch = bytecodePatch(
    name = "Hide Me banner",
    description = "Removes the promo banner (\"Enjoy Your Smart Life\") and the ad slot from the Me tab.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BARDI)
    category("Layout")
    extendWith("extensions/extension.mpe")
    dependsOn(switchRow("fakh_hide_me_banner"), settingsSwitchesPatch)

    execute {
        // The banner is a mini-app card the Tuya cloud configures; the advertising cell is the ad slot above it.
        advertisingFingerprint.method.whenSwitchOn("fakh_hide_me_banner", HIDE_CELL)
        miniWidgetFingerprint.method.whenSwitchOn("fakh_hide_me_banner", HIDE_CELL)
    }
}

@Suppress("unused")
val hideAppMallPatch = bytecodePatch(
    name = "Hide App Mall",
    description = "Removes the \"App Mall\" row from the Me tab.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BARDI)
    category("Layout")
    extendWith("extensions/extension.mpe")
    dependsOn(switchRow("fakh_hide_app_mall"), settingsSwitchesPatch)

    execute { appMallFingerprint.method.whenSwitchOn("fakh_hide_app_mall", HIDE_CELL) }
}
