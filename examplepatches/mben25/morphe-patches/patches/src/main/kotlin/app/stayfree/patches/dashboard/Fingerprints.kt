package app.stayfree.patches.dashboard

import app.morphe.patcher.Fingerprint

/**
 * Static initializer of the dashboard's lazy-list item holder (`Lva7;-><clinit>` in 20.16.1). It
 * builds the item ids from `LazyListItem.IdProvider("appUsage")` and caches a few fixed items;
 * `idWarningItem1` backs the "Tap to pair your devices for the best StayFree experience!" banner
 * (`va7.j = new LazyListItem(idWarningItem1, rx1.c)`, content `kx1` case 5).
 */
object DashboardListItemsFingerprint : Fingerprint(
    strings = listOf("appUsage", "idWarningItem1"),
    custom = { method, _ -> method.name == "<clinit>" },
)

/**
 * Static initializer of the "Cross Platform is here" bottom sheet destination (`Lib9;-><clinit>`
 * in 20.16.1): `ib9.g = new ib9(new ScreenBundle("connect-devices-information-bottom-sheet"))`.
 * Its content is `lb5.g` (header, explanation, "Share Download Links" / "Cancel").
 */
object ConnectDevicesInfoSheetFingerprint : Fingerprint(
    strings = listOf("connect-devices-information-bottom-sheet"),
    custom = { method, _ -> method.name == "<clinit>" },
)
