package com.dmoniak.patches.googledrive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOOGLE_DRIVE
import java.util.logging.Logger

@Suppress("unused")
val googleDriveAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Secure Share - Google Drive",
    description = "Removes Android FLAG_SECURE window restrictions in Google Drive to permit taking screenshots and screen recordings of documents, spreadsheets, and presentation previews.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_DRIVE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGoogleDriveAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeGoogleDriveAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots & Secure Share patch for Google Drive...")
    var hookedActivities = 0
    var hookedMethods = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Hook all Google Drive Activity classes (DocListActivity, PdfActivity, PreviewActivity, etc.)
        val superType = classDef.superType ?: ""
        val isActivity = superType.contains("Activity") || type.contains("Activity")

        if (isActivity && tl.contains("com/google/android/apps/docs")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name
                val pTypes = method.parameterTypes

                // Inject clearFlags(0x2000) at top of onResume or onCreate
                if (!isStatic && (
                    (mName == "onResume" && pTypes.isEmpty()) ||
                    (mName == "onCreate" && pTypes.size == 1 && pTypes[0] == "Landroid/os/Bundle;")
                )) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                            move-result-object v0
                            if-eqz v0, :cond_clear_flag_secure
                            const/16 v1, 0x2000
                            invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V
                            :cond_clear_flag_secure
                            """.trimIndent()
                        )
                        hookedActivities++
                        logger.info("[Drive Screenshots] Injected Window.clearFlags(FLAG_SECURE) in ${type}->${mName}")
                    } catch (e: Exception) {
                        logger.warning("[Drive Screenshots] Failed to inject clearFlags in ${type}->${mName}: ${e.message}")
                    }
                }
            }
        }

        // 2. Also neutralize any internal methods that explicitly calculate or return shouldBlockScreenshots / isSecure
        if (!tl.contains("androidx") && !tl.contains("android/support")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name.lowercase()
                val retType = method.returnType

                if (!isStatic && (
                    mName == "issecurewindowrequired" ||
                    mName == "shouldapplyflagsecure" ||
                    mName == "isscreencaptureblocked" ||
                    mName == "isconfidentialmodeenabled" ||
                    mName == "isdocumentprotectedfromscreenshot"
                ) && retType == "Z") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedMethods++
                        logger.info("[Drive Screenshots] Neutralized flag secure check in: ${type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Drive Screenshots] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }
    logger.info("[Google Drive Allow Screenshots] Total hooks applied: Activities=$hookedActivities, Methods=$hookedMethods")
}
