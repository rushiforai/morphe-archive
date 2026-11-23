package io.github.xxlc.patches.grok

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val NAME_HELPER = "Lio/github/xxlc/extension/grok/DownloadNameHelper;"
private const val FOLDER_HELPER = "Lio/github/xxlc/extension/grok/DownloadFolderHelper;"
private const val DOWNLOAD_MANAGER_REQUEST = "Landroid/app/DownloadManager\$Request;"
private const val GUESS_FILE_NAME = "Landroid/webkit/URLUtil;->guessFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"

private fun MutableMethod.replaceNameString(original: String, replacement: String, register: Int) {
    val index = implementation!!.instructions.withIndex().single { (_, instruction) ->
        instruction.opcode == Opcode.CONST_STRING &&
            ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == original
    }.index
    requireRegisters(index, register)
    replaceInstruction(index, "const-string v$register, \"$replacement\"")
}

private fun mediaFileMethod(name: String, parameters: List<String>, isStatic: Boolean, returnType: String) =
    Fingerprint(
        definingClass = GrokNames.MEDIA_FILES,
        name = name,
        isStatic = isStatic,
        returnType = returnType,
        parameters = parameters,
    )

@Suppress("unused")
val downloadFileNamesPatch = bytecodePatch(
    name = "Download file names",
    description = "Name downloaded images and videos Grok_yyyyMMdd_HHmmss with milliseconds and a sequence number to avoid collisions within a process. Keeps file extensions and the existing deduplication. Not tested on a device.",
    default = true,
) {
    compatibleWith(grokCompatibility)
    extendWith("extensions/extension.mpe")
    val enabled by enabledOption(default = true)

    execute {
        if (enabled != true) return@execute
        Fingerprint(
            definingClass = GrokNames.VIDEO_DATE_FORMAT,
            name = "<clinit>",
            isStatic = true,
            returnType = "V",
            parameters = emptyList(),
        ).method.apply {
            requireRegisterCount(1)
            replaceNameString("yyyy-MM-dd-HH-mm-ss", "yyyyMMdd_HHmmss_SSS", 0)
        }
        Fingerprint(
            definingClass = GrokNames.VIDEO_NAMES,
            name = GrokNames.VIDEO_NAME_METHOD,
            isStatic = false,
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
        ).method.apply {
            requireRegisterCount(3)
            replaceNameString("grok_video_", "Grok_", 0)
            val formatIndex = indexOfReference(
                Opcode.INVOKE_VIRTUAL,
                "Ljava/time/LocalDateTime;->format(Ljava/time/format/DateTimeFormatter;)Ljava/lang/String;",
            )
            requireRegisters(formatIndex, 2, 0)
            requireRegisters(formatIndex + 1, 2)
            addInstructions(
                formatIndex + 2,
                """
                    invoke-static {p0}, $NAME_HELPER->appendSequence(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p0
                """,
            )
        }
        // Shared save flow (library, GrokBot): rename before name is sanitized, preserve file extension.
        Fingerprint(
            definingClass = GrokNames.PUBLIC_VIDEO_FILES,
            name = GrokNames.PUBLIC_MEDIA_SAVE_METHOD,
            isStatic = true,
            returnType = "Ljava/lang/Object;",
            parameters = listOf("Landroid/content/Context;", "Ljava/io/InputStream;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
        ).method.apply {
            requireRegisterCount(9)
            val insertIndex = indexOfReference(Opcode.CONST_STRING, "/")
            requireRegisters(insertIndex, 0)
            addInstructions(
                insertIndex,
                """
                    invoke-static {p3, p2}, $NAME_HELPER->renameMedia(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p3
                """,
            )
        }
        listOf(
            Triple(GrokNames.MEDIA_NAME_METHOD, listOf("Ljava/lang/String;", "Landroid/net/Uri;", "Ljava/lang/String;", "Landroid/content/Context;"), 16),
            Triple(GrokNames.LEGACY_MEDIA_NAME_METHOD, listOf("Ljava/lang/String;", "Ljava/io/File;", "Ljava/lang/String;"), 9),
        ).forEach { (name, parameters, registers) ->
            mediaFileMethod(name, parameters, true, "Ljava/lang/String;").method.apply {
                requireRegisterCount(registers)
                val guessIndex = indexOfReference(Opcode.INVOKE_STATIC, GUESS_FILE_NAME)
                val fileRegister = "p0"
                requireRegisters(guessIndex, if (registers == 16) 12 else 6, 0, if (registers == 16) 14 else 8)
                requireRegisters(guessIndex + 1, if (registers == 16) 12 else 6)
                // Overwrite only guessFileName result, preserving URI, Context, MIME, and dedupe loop.
                addInstructions(
                    guessIndex + 2,
                    """
                        invoke-static {$fileRegister, p2}, $NAME_HELPER->renameMedia(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                        move-result-object $fileRegister
                    """,
                )
            }
        }
    }
}

private fun MutableMethod.replaceSingleReference(opcode: Opcode, original: String, replacement: String, register: Int) {
    val index = indexOfReference(opcode, original)
    requireRegisters(index, register)
    replaceInstruction(index, replacement)
}

@Suppress("unused")
val downloadFoldersPatch = bytecodePatch(
    name = "Download folders",
    description = "Save every download to Download/Grok/Pictures (images), Download/Grok/Videos (videos) or Download/Grok (other files) through MediaStore Downloads (or Download/Grok/... before Android 10). Not tested on a device.",
    default = true,
) {
    compatibleWith(grokCompatibility)
    extendWith("extensions/extension.mpe")
    val enabled by enabledOption(default = true)

    execute {
        if (enabled != true) return@execute
        Fingerprint(
            definingClass = GrokNames.PUBLIC_VIDEO_FILES,
            name = GrokNames.PUBLIC_MEDIA_SAVE_METHOD,
            isStatic = true,
            returnType = "Ljava/lang/Object;",
            parameters = listOf("Landroid/content/Context;", "Ljava/io/InputStream;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
        ).method.apply {
            requireRegisterCount(9)
            val insertIndex = indexOfReference(Opcode.CONST_STRING, "/")
            requireRegisters(insertIndex, 0)
            addInstructions(
                insertIndex,
                """
                    invoke-static {p2, p3}, $FOLDER_HELPER->resolveFolder(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p4
                """,
            )
        }
        Fingerprint(
            definingClass = GrokNames.MEDIA_DOWNLOADER,
            name = GrokNames.DOWNLOAD_MANAGER_REQUEST_METHOD,
            isStatic = false,
            returnType = "Landroid/app/DownloadManager\$Request;",
            parameters = listOf("Landroid/net/Uri;", "Ljava/lang/String;", "Ljava/lang/String;", "Z"),
        ).method.apply {
            requireRegisterCount(7)
            val destIndex = indexOfReference(
                Opcode.INVOKE_VIRTUAL,
                "Landroid/app/DownloadManager\$Request;->setDestinationInExternalPublicDir(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager\$Request;",
            )
            requireRegisters(destIndex, 0, 1, 4)
            val titleIndex = indexOfReference(
                Opcode.INVOKE_VIRTUAL,
                "Landroid/app/DownloadManager\$Request;->setTitle(Ljava/lang/CharSequence;)Landroid/app/DownloadManager\$Request;",
            )
            requireRegisters(titleIndex, 0, 4)
            requireRegisters(titleIndex + 1, 4)
            replaceInstruction(titleIndex + 1, "move-object p2, v0")
            replaceInstruction(titleIndex, "nop")
            addInstructions(
                destIndex - 1,
                """
                    invoke-virtual {v0, p2}, $DOWNLOAD_MANAGER_REQUEST->setTitle(Ljava/lang/CharSequence;)$DOWNLOAD_MANAGER_REQUEST
                    invoke-static {p3, p2}, $FOLDER_HELPER->resolveDownloadManagerSubPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p2
                """,
            )
        }
        Fingerprint(
            definingClass = GrokNames.MEDIA_SAVE_TASK,
            name = "invokeSuspend",
            isStatic = false,
            returnType = "Ljava/lang/Object;",
            parameters = listOf("Ljava/lang/Object;"),
        ).method.apply {
            requireRegisterCount(15)
            replaceSingleReference(
                Opcode.SGET_OBJECT,
                "Landroid/provider/MediaStore\$Video\$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;",
                "sget-object v0, Landroid/provider/MediaStore\$Downloads;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;",
                0,
            )
            replaceSingleReference(
                Opcode.SGET_OBJECT,
                "Landroid/os/Environment;->DIRECTORY_MOVIES:Ljava/lang/String;",
                "const-string v14, \"Download/Grok/Videos\"",
                14,
            )
            replaceSingleReference(
                Opcode.SGET_OBJECT,
                "Landroid/provider/MediaStore\$Images\$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;",
                "sget-object v0, Landroid/provider/MediaStore\$Downloads;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;",
                0,
            )
            replaceSingleReference(
                Opcode.SGET_OBJECT,
                "Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;",
                "const-string v14, \"Download/Grok/Pictures\"",
                14,
            )
        }
        mediaFileMethod(
            GrokNames.GENERIC_MEDIA_SAVE_METHOD,
            listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
            false, "V",
        ).method.apply {
            requireRegisterCount(9)
            val dirIndex = indexOfReference(Opcode.SGET_OBJECT, "Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;")
            requireRegisters(dirIndex, 0)
            requireRegisters(dirIndex - 1, 8)
            replaceInstruction(dirIndex, "nop")
            addInstructions(
                dirIndex - 1,
                """
                    invoke-static {p3, p2}, $FOLDER_HELPER->resolveFolder(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v0
                """,
            )
        }
        mediaFileMethod(
            GrokNames.LEGACY_MEDIA_SAVE_METHOD,
            listOf("Ljava/lang/String;", "Ljava/lang/String;", "Landroid/content/Context;", "Ljava/lang/String;"),
            false, "V",
        ).method.apply {
            requireRegisterCount(7)
            val mkdirIndex = indexOfReference(Opcode.INVOKE_VIRTUAL, "Ljava/io/File;->mkdir()Z")
            requireRegisters(mkdirIndex, 6)
            replaceInstruction(mkdirIndex, "invoke-virtual {p4}, Ljava/io/File;->mkdirs()Z")
            val pubDirIndex = indexOfReference(
                Opcode.INVOKE_STATIC,
                "Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;",
            )
            requireRegisters(pubDirIndex, 6)
            addInstructions(
                pubDirIndex,
                """
                    invoke-static {p2, p1}, $FOLDER_HELPER->resolveFolder(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p4
                """,
            )
        }
    }
}
