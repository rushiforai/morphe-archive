/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.entity.videoData

import app.crimera.utils.changeFirstString
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.library.instagram.patches.instagramExtensionPatch

val videoDataEntity =
    bytecodePatch(
        description = "This patch is used for decoding obfuscated code of Video data",
    ) {
        dependsOn(instagramExtensionPatch)
        execute {
            // Both classes serialise to a map through the same interface method. On 449
            // ImmutablePandoVideoVersion also has a second, identical one (BGY beside HXf), so
            // its method is not matched on its own: VideoVersion's name is used for both.
            val mapperName = VideoVersionMapperFingerprint.method.name

            classDefBy(IMMUTABLE_PANDO_VIDEO_VERSION_CLASS).methods.singleOrNull { method ->
                method.name == mapperName && method.returnType == "Ljava/util/Map;" && method.parameterTypes.isEmpty()
            } ?: throw PatchException("ImmutablePandoVideoVersion has no $mapperName map method")

            ImmutablePandoVideoVersionMapExtensionFingerprint.changeFirstString(mapperName)

            VideoVersionMapExtensionFingerprint.changeFirstString(mapperName)
        }
    }
