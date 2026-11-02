package com.dmoniak.patches.mega

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MEGA
import com.dmoniak.patches.shared.cloneMethodWithAdditionalRegisters
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val megaAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Export - MEGA (Experimental)",
    description = "Disables FLAG_SECURE window restrictions to allow taking screenshots of documents and media in MEGA, and bypasses local export restrictions.",
) {
    compatibleWith(COMPATIBILITY_MEGA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMegaAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeMegaAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots & Export patch for MEGA (mega.privacy.android.app)...")
    var hookedActivities = 0
    var hookedMethods = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.startsWith("landroidx/") || tl.startsWith("landroid/support/") || tl.startsWith("lkotlin/")) {
            return@classDefForEach
        }

        val superType = classDef.superclass ?: ""
        val isActivity = superType.endsWith("Activity;") ||
                         type.endsWith("Activity;") ||
                         type.contains("Activity$") ||
                         superType.contains("Activity")

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Inject Window.clearFlags(0x2000) into every Activity lifecycle (onResume or onCreate)
        if (isActivity && (tl.contains("mega") || !tl.startsWith("lcom/google/"))) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name
                val pTypes = method.parameterTypes

                val isLifecycle = !isStatic && (
                    (mName == "onResume" && pTypes.isEmpty()) ||
                    (mName == "onAttachedToWindow" && pTypes.isEmpty()) ||
                    (mName == "onCreate" && pTypes.size == 1 && pTypes[0] == "Landroid/os/Bundle;")
                )

                if (isLifecycle) {
                    try {
                        val cloned = cloneMethodWithAdditionalRegisters(method, 2)
                        cloned.addInstructions(
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
                        logger.fine("[MEGA Screenshots] Injected Window.clearFlags(0x2000) in ${type}->${mName}")
                    } catch (e: Exception) {
                        logger.fine("[MEGA Screenshots] Skip activity lifecycle injection on ${type}->${mName}: ${e.message}")
                    }
                }
            }
        }

        // 2. Neutralize methods explicitly setting or querying FLAG_SECURE / screen security
        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            val isSecuritySetter = !isStatic && (
                mName.contains("flagsecure") ||
                mName.contains("screensecurity") ||
                mName.contains("blockscreenshot") ||
                mName.contains("disablescreenshot") ||
                mName.contains("protectwindow") ||
                mName.contains("securescreen")
            ) && retType == "V"

            if (isSecuritySetter) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 2,
                        smaliCode = "return-void"
                    )
                    hookedMethods++
                    logger.info("[MEGA Screenshots] Neutralized screen security setter: ${type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[MEGA Screenshots] Skip setter hook: ${e.message}")
                }
            }

            val isSecurityGetter = !isStatic && (
                mName.contains("flagsecure") ||
                mName.contains("screensecurity") ||
                mName.contains("blockscreenshot") ||
                mName.contains("disablescreenshot") ||
                mName.contains("issecurewindow")
            ) && retType == "Z" && pTypes.isEmpty()

            if (isSecurityGetter) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 2,
                        smaliCode = """
                            const/4 v0, 0x0
                            return v0
                        """.trimIndent()
                    )
                    hookedMethods++
                    logger.info("[MEGA Screenshots] Forced screen security to false: ${type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[MEGA Screenshots] Skip getter hook: ${e.message}")
                }
            }

            // 3. Unlock export, download and screenshot permissions
            val isExportGetter = !isStatic && (
                mName == "isexportallowed" ||
                mName == "canexport" ||
                mName == "isdownloadallowed" ||
                mName == "candownload" ||
                mName == "issaveallowed" ||
                mName == "cansavetodevice" ||
                mName == "isscreenshotallowed" ||
                mName == "canscreenshot" ||
                mName == "isofflineallowed"
            ) && retType == "Z" && pTypes.isEmpty()

            if (isExportGetter) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 2,
                        smaliCode = """
                            const/4 v0, 0x1
                            return v0
                        """.trimIndent()
                    )
                    hookedMethods++
                    logger.info("[MEGA Export] Unlocked export permission: ${type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[MEGA Export] Skip export hook: ${e.message}")
                }
            }
        }
    }

    logger.info("[MEGA Allow Screenshots & Export] Total hooks applied: Activities=$hookedActivities, Methods=$hookedMethods")
}
