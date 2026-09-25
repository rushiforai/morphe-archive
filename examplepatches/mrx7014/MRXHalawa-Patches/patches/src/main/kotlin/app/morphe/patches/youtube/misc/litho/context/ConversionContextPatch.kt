/*
 * Copyright 2026 MRX Halawa.
 * https://github.com/mrx7014/MRXHalawa-Patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

@file:Suppress("SpellCheckingInspection")

package app.morphe.patches.youtube.misc.litho.context

import app.morphe.patches.shared.misc.litho.context.createConversionContextPatch
import app.morphe.patches.youtube.misc.extension.sharedExtensionPatch

val conversionContextPatch = createConversionContextPatch(sharedExtensionPatch)
