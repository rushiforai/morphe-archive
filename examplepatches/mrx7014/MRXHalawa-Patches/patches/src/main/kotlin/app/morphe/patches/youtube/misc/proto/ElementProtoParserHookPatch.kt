/*
 * Copyright 2026 MRX Halawa.
 * https://github.com/mrx7014/MRXHalawa-Patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.patches.youtube.misc.proto

import app.morphe.patches.shared.misc.proto.createElementProtoParserHookPatch
import app.morphe.patches.youtube.misc.extension.sharedExtensionPatch

val elementProtoParserHookPatch = createElementProtoParserHookPatch(sharedExtensionPatch)