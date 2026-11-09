// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.accountcolors

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

internal const val DRAWER_ITEM_DESCRIPTOR = "Lcom/onelouder/baconreader/adapters/DrawerAdapter\$DrawerItem;"
internal const val DRAWER_HOLDER_DESCRIPTOR = "Lcom/onelouder/baconreader/adapters/DrawerAdapter\$Holder;"

/** The app's Application.onCreate. */
internal object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/BaconReader;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/** Shows a row of the menu, made or reused: its text, its icons, for the item it shows. */
internal object DrawerHolderUpdateViewFingerprint : Fingerprint(
    definingClass = DRAWER_HOLDER_DESCRIPTOR,
    name = "updateView",
    returnType = "V",
    parameters = listOf(DRAWER_ITEM_DESCRIPTOR),
)

/** Builds the drawer's items: when the drawer is made, and again whenever the account changes. */
internal object DrawerHandlerUpdateDrawerFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/DrawerHandler;",
    name = "updateDrawer",
    returnType = "V",
    parameters = listOf(),
)

/** The OK of the dialog the ✕ of an account row asks first: removes the account with removeSession(context, name). */
internal object RemoveAccountClickFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/DrawerHandler\$2\$1;",
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/content/DialogInterface;", "I"),
    filters = listOf(
        methodCall(definingClass = "Lcom/onelouder/baconreader/data/SessionManager;", name = "removeSession"),
    ),
)
