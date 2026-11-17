/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.badfella.patches.ultimea.upstream.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.SupportedAbi
import app.badfella.patches.ultimea.upstream.shared.misc.dart.dartAotLibrary
import app.badfella.patches.ultimea.upstream.shared.misc.requireArm64
import app.badfella.patches.ultimea.upstream.settings.markPatchApplied
import app.badfella.patches.ultimea.upstream.settings.patchesSettingsPatch

private const val EXTENSION_CLASS = "Lapp/hxreborn/extension/ultimea/AccentColor;"

@Suppress("unused")
val accentColorPatch: BytecodePatch = bytecodePatch(
    name = "Accent color",
    description = "Changes accent colors with a chosen color or Material You.",
) {
    compatibleWith(Compatibility(
        name = "Ultimea", packageName = "com.dynanic.ultimea",
        targets = listOf(AppTarget(version = "1.4.4", versionCodes = mapOf(SupportedAbi.ARM64_V8A to 495))),
    ))
    availability(requireArm64)
    dependsOn(patchesSettingsPatch, resourcePatch {
        execute {
            val library = dartAotLibrary()
            val image = ThemeElfImage(library.readBytes())
            val matches = AccentInstructions(image.bytes, image.codeStart, image.codeEnd).match()
            val palette = AccentHooks.apply(image, matches)
            library.writeBytes(image.bytes)
            get("assets/hx_ultimea/accent_colors").apply {
                parentFile.mkdirs()
                writeBytes(palette)
            }
        }
    })

    execute {
        markPatchApplied("accentColor", accentColorPatch)
        app.badfella.patches.ultimea.upstream.theme.FlutterInitFingerprint.matchSingle().method.addInstructions(0,
            "invoke-static { p1 }, $EXTENSION_CLASS->prepare(Landroid/content/Context;)Z")
    }
}
