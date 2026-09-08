/**
 * Copyright 2026 Psylos
 * Private SoundCloud patch.
 */

package psylos.morphe.patches.soundcloud.shared

import app.morphe.patcher.Fingerprint

internal object SettingsScreenFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/settings/main/SettingsScreenKt;",
    name = "a",
    returnType = "V",
    parameters = listOf(
        "Lcom/soundcloud/android/settings/main/SettingsState;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function1;",
        "Landroidx/compose/runtime/Composer;",
        "I",
    ),
)

internal object DownloadPatchStatusFingerprint : Fingerprint(
    definingClass = "Lpsylos/morphe/extension/soundcloud/PatchStatus;",
    name = "downloadButtonHookIncluded",
    returnType = "Z",
    parameters = emptyList(),
)

internal object HideCastPatchStatusFingerprint : Fingerprint(
    definingClass = "Lpsylos/morphe/extension/soundcloud/PatchStatus;",
    name = "hideCastIconIncluded",
    returnType = "Z",
    parameters = emptyList(),
)
