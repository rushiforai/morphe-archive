/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.settings

import app.crimera.patches.instagram.utils.Constants.ACTIVITY_SETTINGS_STATUS_CLASS
import app.crimera.patches.instagram.utils.Constants.HOOK_FLAGS_DESCRIPTOR
import app.morphe.patcher.Fingerprint

internal object HookFlagsClinitFingerprint : Fingerprint(
    definingClass = HOOK_FLAGS_DESCRIPTOR,
    name = "<clinit>",
)

internal object SettingsStatusClinitFingerprint : Fingerprint(
    definingClass = ACTIVITY_SETTINGS_STATUS_CLASS,
    name = "<clinit>",
)
