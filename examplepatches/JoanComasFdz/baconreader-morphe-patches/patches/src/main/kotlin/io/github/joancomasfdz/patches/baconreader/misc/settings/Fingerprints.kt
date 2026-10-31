// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.misc.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode

internal object GoogleApiActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/common/api/GoogleApiActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/** Builds the settings menu from the titles of the app's sections (sectionTitles). */
internal object SettingsMenuInitAdapterFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/SettingsMenuFragment;",
    name = "initAdapter",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, name = "sectionTitles"),
    ),
)

internal object SettingsActivityOpenFragmentFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/SettingsActivity;",
    name = "openFragment",
    returnType = "V",
    parameters = listOf("I"),
)

/** Builds the drawer's items; runs when the drawer is made and again on each change. */
internal object DrawerHandlerUpdateDrawerFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/DrawerHandler;",
    name = "updateDrawer",
    returnType = "V",
)
