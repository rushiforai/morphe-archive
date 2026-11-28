/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.imo.patches.menu

import app.loki.patches.universal.menuPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val ROWS = "Lapp/loki/extension/LokiRows;"

/** `Home` is IMO's main screen (it holds the chat tabs and the Me page) and keeps its name because the manifest names it. */
private val homeOnResume = Fingerprint(
    definingClass = "Lcom/imo/android/imoim/home/Home;",
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
)

/**
 * A "Loki Patches" row on IMO's Me page, right under Settings.
 *
 * The Me page is a normal layout of item rows that IMO inflates when you open it, not something drawn at startup, so the
 * row cannot be added where the page is built without naming obfuscated classes. Instead `Home.onResume` hands the screen
 * to the extension, which waits for IMO's own Settings row to appear and adds a copy of it with our title. The Home
 * screen is named in the manifest, so this hook does not move between IMO versions.
 */
internal val imoMenuRowPatch = bytecodePatch {
    dependsOn(menuPatch)

    execute {
        // /range: the plain form silently assembles to nothing in a method with many registers.
        homeOnResume.method.addInstructions(0, "invoke-static/range {p0 .. p0}, $ROWS->imoAttachMe(Landroid/app/Activity;)V")
    }
}
