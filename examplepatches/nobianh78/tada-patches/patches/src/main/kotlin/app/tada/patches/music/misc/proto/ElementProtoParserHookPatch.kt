/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.music.misc.proto

import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.shared.misc.proto.createElementProtoParserHookPatch

@Suppress("unused")
val elementProtoParserHookPatch = createElementProtoParserHookPatch(sharedExtensionPatch)
