/*
 * Copyright (C) 2026 realme Link mode-memory patch contributors.
 * SPDX-License-Identifier: GPL-3.0-only
 * Built as a local extension of hxreborn/morphe-patches v1.80.0.
 */
package app.morphe.patches.realmelink.modes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle
import app.morphe.patches.shared.compat.AppCompatibilities

private const val EXT = "Lapp/hxreborn/extension/realmelink/ModeKeeper;"
private const val DEVICE = "Lcom/realme/iot/common/devices/Device;"
private const val SETTINGS = "Lcom/realme/iot/headset/contract/bean/SettingsInfo;"
private const val CALLBACK = "Lcom/realme/iot/headset/contract/callback/ISettingsCallback;"
private const val ACTIVITY = "Lcom/realme/iot/headset/activity/device/HeadsetDeviceActivity;"
private const val PRESENTER = "Lcom/realme/iot/headset/activity/device/HeadsetDevicePresenter;"

// These method signatures were verified in classes40.dex of realme Link 5.8.811.2814.
// The UI hooks do not hardcode wire-mode values; they learn the actual SettingsInfo
// type/key/value from the UI's real write to the headset. Unknown rows are ignored.
private object AppCreate : Fingerprint(
    definingClass = "Lcom/realme/link/LinkApplication;",
    name = "onCreate", returnType = "V", parameters = listOf(),
)
private object ProxyWrite : Fingerprint(
    definingClass = "Lcom/realme/iot/headset/manager/HeadsetManagerProxy;",
    name = "J3", returnType = "V", parameters = listOf(DEVICE, SETTINGS, CALLBACK),
)
private object DeviceConnection : Fingerprint(
    definingClass = PRESENTER,
    name = "K0", returnType = "V", parameters = listOf(DEVICE, "Z"),
)
private object DeviceInit : Fingerprint(
    definingClass = PRESENTER,
    name = "m0", returnType = "V", parameters = listOf(DEVICE),
)
private object RadioClick : Fingerprint(
    definingClass = ACTIVITY,
    name = "R9", returnType = "V", parameters = listOf("Landroid/view/View;", "Lcom/realme/iot/headset/model/BaseItemInfo;", "I"),
)
private object AlternateRadioClick : Fingerprint(
    definingClass = ACTIVITY,
    name = "Y9", returnType = "V", parameters = listOf("Landroid/view/View;", "Lcom/realme/iot/headset/model/BaseItemInfo;", "I"),
)
private object ToggleClick : Fingerprint(
    definingClass = ACTIVITY,
    name = "S9", returnType = "V", parameters = listOf("Lcom/realme/iot/headset/model/SwitcherTwoTextItemInfo;", "I"),
)
private object AlternateToggleClick : Fingerprint(
    definingClass = ACTIVITY,
    name = "X9", returnType = "V", parameters = listOf("Landroid/view/View;", "Lcom/realme/iot/headset/model/SwitcherTwoTextItemInfo;"),
)

// One shared hook prevents double-writing and keeps ANC and Game Mode independently selectable.
private val modeMemoryInfrastructure = bytecodePatch {
    compatibleWith(AppCompatibilities.REALME_LINK)
    extendWith("extensions/extension.mpe")

    execute {
        AppCreate.matchSingle().method.addInstructions(
            0, "invoke-static { p0 }, $EXT->initialize(Ljava/lang/Object;)V",
        )
        ProxyWrite.matchSingle().method.addInstructions(
            0, "invoke-static { p1, p2 }, $EXT->observeWrite(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
        DeviceConnection.matchSingle().method.addInstructions(
            0, "invoke-static { p1, p2 }, $EXT->onConnection(Ljava/lang/Object;Z)V",
        )
        DeviceInit.matchSingle().method.addInstructions(
            0, "invoke-static { p1 }, $EXT->onDeviceReady(Ljava/lang/Object;)V",
        )
    }
}

@Suppress("unused")
val rememberNoiseControlModePatch = bytecodePatch(
    name = "Remember noise control mode",
    description = "Stores manually selected ANC/Transparency/Off and restores it when realme Link reconnects to the earbuds.",
    default = true,
) {
    compatibleWith(AppCompatibilities.REALME_LINK)
    dependsOn(modeMemoryInfrastructure)
    execute {
        AppCreate.matchSingle().method.addInstructions(0, "invoke-static {}, $EXT->enableNoiseControl()V")
        RadioClick.matchSingle().method.addInstructions(
            0, "invoke-static { p0, p2 }, $EXT->markUiAction(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
        AlternateRadioClick.matchSingle().method.addInstructions(
            0, "invoke-static { p0, p2 }, $EXT->markUiAction(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }
}

@Suppress("unused")
val rememberGameModePatch = bytecodePatch(
    name = "Remember game mode",
    description = "Stores manually selected Game Mode on/off and restores it when realme Link reconnects to the earbuds.",
    default = true,
) {
    compatibleWith(AppCompatibilities.REALME_LINK)
    dependsOn(modeMemoryInfrastructure)
    execute {
        AppCreate.matchSingle().method.addInstructions(0, "invoke-static {}, $EXT->enableGameMode()V")
        ToggleClick.matchSingle().method.addInstructions(
            0, "invoke-static { p0, p1 }, $EXT->markUiAction(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
        AlternateToggleClick.matchSingle().method.addInstructions(
            0, "invoke-static { p0, p2 }, $EXT->markUiAction(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }
}
