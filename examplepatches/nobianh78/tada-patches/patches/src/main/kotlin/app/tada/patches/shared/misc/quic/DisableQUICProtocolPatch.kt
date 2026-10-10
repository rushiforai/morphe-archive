/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.shared.misc.quic

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchBuilder
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.BasePreferenceScreen
import app.tada.patches.shared.misc.settings.preference.SwitchPreference

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/shared/patches/DisableQUICProtocolPatch;"

internal fun disableQUICProtocolPatch(
    block: BytecodePatchBuilder.() -> Unit,
    preferenceScreen: BasePreferenceScreen.Screen,
) = bytecodePatch(
    name = "Disable QUIC protocol",
    description = "Adds an option to disable QUIC (Quick UDP Internet Connections) network protocol."
) {
    block()

    execute {
        preferenceScreen.addPreferences(
            SwitchPreference("tada_disable_quic_protocol")
        )

        arrayOf(
            CronetEngineBuilderFingerprint,
            ExperimentalCronetEngineBuilderFingerprint
        ).forEach { fingerprint ->

            fingerprint.method.addInstructions(
                0,
                """
                    invoke-static { p1 }, $EXTENSION_CLASS->disableQUICProtocol(Z)Z
                    move-result p1
                """
            )
        }
    }
}