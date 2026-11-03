/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.misc.inbox

import app.morphe.patches.pinedrama.misc.settings.configurableBytecodePatch as bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.pinedrama.misc.extension.sharedExtensionPatch
import app.morphe.patches.pinedrama.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.pinedrama.misc.settings.settingsPatch
import app.morphe.util.addInstruction

internal const val PUSH_REPORT = "Lapp/morphe/extension/pinedrama/inbox/PushDeliveryReport;"

/** Tells the report no native registration anchors are in place: PineDrama has no profile of them yet. */
internal val pushDeliveryDiagnosticsPatch = bytecodePatch {
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.pineDrama())
    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(0, "invoke-static {}, $PUSH_REPORT->nativeProfileUnsupported()V")
    }
}
