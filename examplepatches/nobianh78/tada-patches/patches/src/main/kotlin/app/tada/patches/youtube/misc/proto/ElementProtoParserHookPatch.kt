/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.misc.proto

import app.tada.patches.shared.misc.proto.createElementProtoParserHookPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch

val elementProtoParserHookPatch = createElementProtoParserHookPatch(sharedExtensionPatch)