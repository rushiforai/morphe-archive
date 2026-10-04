package com.dmoniak.patches.googledrive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOOGLE_DRIVE
import java.util.logging.Logger

@Suppress("unused")
val googleDriveViewOnlyBypassPatch = bytecodePatch(
    name = "Unlock View-Only Download & Export Restrictions - Google Drive (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses 'Viewers cannot download, print, or copy' restrictions on shared Google Drive files, re-enabling the download, save, print, and export menu actions for protected documents and PDFs.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_DRIVE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGoogleDriveViewOnlyBypassLogic(logger)
    }
}

fun BytecodePatchContext.executeGoogleDriveViewOnlyBypassLogic(logger: Logger) {
    logger.info("Executing Unlock View-Only Download & Export Restrictions patch for Google Drive...")
    var unblockedPermissions = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Force permission checks allowing download, copy, print, export
            if (!isStatic && (
                mName == "candownloadfile" ||
                mName == "candownload" ||
                mName == "canexportfile" ||
                mName == "canexport" ||
                mName == "canprintfile" ||
                mName == "canprint" ||
                mName == "cancopyfile" ||
                mName == "isdownloadallowed" ||
                mName == "isexportallowed" ||
                mName == "isprintallowed"
            ) && retType == "Z" && method.parameterTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    unblockedPermissions++
                    logger.fine("[Google Drive ViewOnly Bypass] Enabled capability: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Google Drive ViewOnly Bypass] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Neutralize restriction flags
            if (!isStatic && (
                mName == "isdownloadrestricted" ||
                mName == "isviewerdownloadrestricted" ||
                mName == "isviewercopyrestricted" ||
                mName == "isprintdisabled" ||
                mName == "iscopydisabled" ||
                mName == "isexportblocked" ||
                mName == "getcopyrequirespermission"
            ) && retType == "Z" && method.parameterTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    unblockedPermissions++
                    logger.fine("[Google Drive ViewOnly Bypass] Neutralized restriction: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Google Drive ViewOnly Bypass] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Google Drive ViewOnly Bypass] Total view-only restriction bypasses applied: $unblockedPermissions")
}
