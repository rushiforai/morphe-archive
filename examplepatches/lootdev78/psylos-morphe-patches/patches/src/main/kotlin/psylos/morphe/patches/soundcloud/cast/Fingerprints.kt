/**
 * Copyright 2026 Psylos
 * Private SoundCloud patch.
 */

package psylos.morphe.patches.soundcloud.cast

import app.morphe.patcher.Fingerprint

internal object CastMenuInstallerFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/cast/ui/DefaultCastButtonInstaller;",
    name = "a",
    returnType = "Lcom/soundcloud/java/optional/Optional;",
    parameters = listOf(
        "Landroidx/fragment/app/FragmentActivity;",
        "Landroid/view/Menu;",
        "I",
    ),
)

internal object CastViewInstallerFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/cast/ui/DefaultCastButtonInstaller;",
    name = "b",
    returnType = "V",
    parameters = listOf("Lcom/soundcloud/android/cast/ui/ThemeableMediaRouteButton;"),
)
