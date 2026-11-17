/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.badfella.patches.ultimea.upstream.popups

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.SupportedAbi
import app.badfella.patches.ultimea.upstream.shared.misc.dart.dartAotLibrary
import app.badfella.patches.ultimea.upstream.shared.misc.requireArm64
import app.badfella.patches.ultimea.upstream.shared.readInt
import app.badfella.patches.ultimea.upstream.settings.markPatchApplied
import app.badfella.patches.ultimea.upstream.settings.nativeMethods
import app.badfella.patches.ultimea.upstream.settings.patchesSettingsPatch
import app.badfella.patches.ultimea.upstream.settings.writeNativeEdits

private const val INSTRUCTION_BYTES = 4
private const val BRANCH = 0x14000000
private const val BRANCH_MASK = 0xfc000000.toInt()
private val RETURN_NULL = "e00316aac0035fd6".hexToByteArray()

@Suppress("unused")
val removePopupsPatch: BytecodePatch = bytecodePatch(
    name = "Remove popups",
    description = "Removes promotional and rating popups.",
) {
    compatibleWith(Compatibility(
        name = "Ultimea", packageName = "com.dynanic.ultimea",
        targets = listOf(AppTarget(version = "1.4.4", versionCodes = mapOf(SupportedAbi.ARM64_V8A to 495))),
    ))
    availability(requireArm64)
    dependsOn(patchesSettingsPatch, resourcePatch {
        execute {
            val library = dartAotLibrary().readBytes()
            val popup = nativeMethods.single("app_popup") { "language_english" !in it.stringLoads.values }.start
            val ratingFunction = nativeMethods.single("/api/base/v1/review/trigger")
            val rating = nativeMethods.asyncBodyStart(ratingFunction)
            val completedResult = (rating until ratingFunction.end step INSTRUCTION_BYTES).first {
                library.readInt(it + INSTRUCTION_BYTES) and BRANCH_MASK == BRANCH &&
                    runCatching { nativeMethods.poolOffset(it) }.isSuccess
            }
            val branch = BRANCH or ((completedResult - rating) / INSTRUCTION_BYTES)
            val instruction = ByteArray(INSTRUCTION_BYTES) { (branch ushr (it * Byte.SIZE_BITS)).toByte() }
            writeNativeEdits("remove_popups", library, listOf(popup to RETURN_NULL, rating to instruction))
        }
    })
    execute { markPatchApplied("removePopups", removePopupsPatch) }
}
