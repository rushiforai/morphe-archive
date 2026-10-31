// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.savemedia

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

internal const val SAVE_IMAGE_SERVICE_CLASS = "Lcom/onelouder/baconreader/imageutils/SaveImageService;"

internal object DownloadToFileFingerprint : Fingerprint(
    definingClass = SAVE_IMAGE_SERVICE_CLASS,
    name = "getSingleFile",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Landroidx/documentfile/provider/DocumentFile;"),
)

/**
 * Downloads into the chosen folder: getSingleFile(url, folder, name), which calls getSingleFile(url, file) and
 * reads its result twice (a first try, then a retry with the full url).
 */
internal object DownloadIntoFolderFingerprint : Fingerprint(
    definingClass = SAVE_IMAGE_SERVICE_CLASS,
    name = "getSingleFile",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Landroidx/documentfile/provider/DocumentFile;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        downloadToFile(),
        opcode(Opcode.MOVE_RESULT, location = MatchAfterImmediately()),
        downloadToFile(),
        opcode(Opcode.MOVE_RESULT, location = MatchAfterImmediately()),
    ),
)

private fun downloadToFile() = methodCall(
    definingClass = SAVE_IMAGE_SERVICE_CLASS,
    name = "getSingleFile",
    returnType = "Z",
    opcode = Opcode.INVOKE_DIRECT,
)
