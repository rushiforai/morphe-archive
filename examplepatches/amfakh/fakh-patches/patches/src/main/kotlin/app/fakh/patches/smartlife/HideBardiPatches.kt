package app.fakh.patches.smartlife

import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_BARDI
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch

// BARDI renames the visibility method (`d` instead of `f`), so the cells are matched by their signature alone.
private val advertisingFingerprint = cellVisibilityFingerprint("AdvertisingCell", name = null)
private val miniWidgetFingerprint = cellVisibilityFingerprint("PersonalMiniWidgetCell", name = null)
private val appMallFingerprint = cellVisibilityFingerprint("MallCell", name = null)

private const val MALL_TAB =
    """{"tabGetter":"com.thingclips.smart.thingmall.MallTabGetter","index":30,"url":"","name":"mall","ngName":"mall"},"""

@Suppress("unused")
val hideMallTabPatch = rawResourcePatch(
    name = "Hide Mall tab",
    description = "Removes the Mall tab from the bottom navigation.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BARDI)
    category("Layout")

    execute {
        val config = get("assets/tab_config.json")
        val json = config.readText()
        if (MALL_TAB !in json) throw PatchException("BARDI: the Mall tab entry was not found in tab_config.json.")
        config.writeText(json.replace(MALL_TAB, ""))
    }
}

@Suppress("unused")
val hideMeBannerPatch = bytecodePatch(
    name = "Hide Me banner",
    description = "Removes the promo banner (\"Enjoy Your Smart Life\") and the ad slot from the Me tab.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BARDI)
    category("Layout")
    dependsOn(signatureSpoofPatch)

    execute {
        // The banner is a mini-app card the Tuya cloud configures; the advertising cell is the ad slot above it.
        advertisingFingerprint.method.addInstructions(0, HIDE_CELL)
        miniWidgetFingerprint.method.addInstructions(0, HIDE_CELL)
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
    dependsOn(signatureSpoofPatch)

    execute { appMallFingerprint.method.addInstructions(0, HIDE_CELL) }
}
