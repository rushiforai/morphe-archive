package com.dmoniak.patches.googledrive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOOGLE_DRIVE
import java.util.logging.Logger

@Suppress("unused")
val googleDriveAmoledDeclutterPatch = bytecodePatch(
    name = "AMOLED Dark Theme & Declutter - Google Drive",
    description = "Forces pure OLED pitch black (#000000) across Google Drive file lists, folder navigation, status bars, and navigation bars, eliminating dark gray tint for maximum OLED power savings.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_DRIVE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGoogleDriveAmoledDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeGoogleDriveAmoledDeclutterLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme & Declutter patch for Google Drive...")
    var hookedActivities = 0
    var hookedMethods = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Inject pure black ColorDrawable and setStatusBarColor/setNavigationBarColor in Activity onResume
        val superType = classDef.superType ?: ""
        val isActivity = superType.contains("Activity") || type.contains("Activity")

        if (isActivity && tl.contains("com/google/android/apps/docs")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name
                val pTypes = method.parameterTypes

                if (!isStatic && mName == "onResume" && pTypes.isEmpty()) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                            move-result-object v0
                            if-eqz v0, :cond_skip_amoled_bg
                            new-instance v1, Landroid/graphics/drawable/ColorDrawable;
                            const/high16 v2, -0x1000000
                            invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
                            invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
                            const/high16 v2, -0x1000000
                            invoke-virtual {v0, v2}, Landroid/view/Window;->setNavigationBarColor(I)V
                            invoke-virtual {v0, v2}, Landroid/view/Window;->setStatusBarColor(I)V
                            :cond_skip_amoled_bg
                            """.trimIndent()
                        )
                        hookedActivities++
                        logger.info("[Drive AMOLED] Injected pure black Window styling in ${type}->${mName}")
                    } catch (e: Exception) {
                        logger.warning("[Drive AMOLED] Failed to inject black background in ${type}->${mName}: ${e.message}")
                    }
                }
            }
        }

        // 2. Hook dark mode boolean getters to ensure dark theme assets are always selected
        if (!tl.contains("androidx") && !tl.contains("android/support")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name.lowercase()
                val retType = method.returnType

                if (!isStatic && (
                    mName == "isdarkmodeenabled" ||
                    mName == "shouldusedarktheme" ||
                    mName == "isnightmodeactive" ||
                    mName == "isdarkthemeactive"
                ) && retType == "Z") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedMethods++
                        logger.info("[Drive AMOLED] Forced dark mode in: ${type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Drive AMOLED] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }
    logger.info("[Google Drive AMOLED & Declutter] Total hooks applied: Activities=$hookedActivities, Methods=$hookedMethods")
}
