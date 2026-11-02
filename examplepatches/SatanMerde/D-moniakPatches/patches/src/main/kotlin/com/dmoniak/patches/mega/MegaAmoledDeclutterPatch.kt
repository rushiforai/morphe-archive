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
val megaAmoledDeclutterPatch = bytecodePatch(
    name = "AMOLED Dark Theme & Declutter - MEGA (Experimental)",
    description = "Forces pure OLED pitch black (#000000) across MEGA cloud file browser, transfer queue, settings, and navigation bars, and suppresses Pro upgrade promotion banners.",
) {
    compatibleWith(COMPATIBILITY_MEGA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMegaAmoledDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeMegaAmoledDeclutterLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme & Declutter patch for MEGA (mega.privacy.android.app)...")
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

        // 1. Inject pure black window background, status bar, and navigation bar in all Activities
        if (isActivity && (tl.contains("mega") || !tl.startsWith("lcom/google/"))) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name
                val pTypes = method.parameterTypes

                if (!isStatic && mName == "onResume" && pTypes.isEmpty()) {
                    try {
                        val cloned = cloneMethodWithAdditionalRegisters(method, 3)
                        cloned.addInstructions(
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
                        logger.fine("[MEGA AMOLED] Injected pure black Window styling in ${type}->${mName}")
                    } catch (e: Exception) {
                        logger.fine("[MEGA AMOLED] Skip activity background injection: ${e.message}")
                    }
                }
            }
        }

        // 2. Hook dark mode boolean getters & background color getters
        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // Enforce dark mode on all theme/appearance checks
            val isDarkThemeCheck = !isStatic && (
                mName == "isdarkmode" ||
                mName == "isdarkmodeenabled" ||
                mName == "isdarktheme" ||
                mName == "isdarkthemeenabled" ||
                mName == "isnightmode" ||
                mName == "isnightmodeactive" ||
                mName == "shouldusedarktheme" ||
                mName.contains("isdarktheme") ||
                mName.contains("isnightmode")
            ) && retType == "Z" && pTypes.isEmpty()

            if (isDarkThemeCheck) {
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
                    logger.info("[MEGA AMOLED] Enforced dark mode in: ${type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[MEGA AMOLED] Skip dark mode check hook: ${e.message}")
                }
            }

            // Inject pure pitch black (#000000 / 0xFF000000) on color getters
            val isColorGetter = (
                mName.contains("backgroundcolor") ||
                mName.contains("surfacecolor") ||
                mName.contains("darkbackground") ||
                mName.contains("windowbackground") ||
                mName.contains("filebrowserbackground")
            ) && retType == "I" && pTypes.isEmpty()

            if (isColorGetter) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 2,
                        smaliCode = """
                            const/high16 v0, -0x1000000
                            return v0
                        """.trimIndent()
                    )
                    hookedMethods++
                    logger.info("[MEGA AMOLED] Injected pure black color in: ${type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[MEGA AMOLED] Skip color getter hook: ${e.message}")
                }
            }

            // Suppress Pro upgrade banners, upsell dialogs, and quota popups
            val isBannerCheck = !isStatic && (
                mName.contains("proupgrade") ||
                mName.contains("upgradebanner") ||
                mName.contains("upsellbanner") ||
                mName.contains("promobanner") ||
                mName.contains("procard") ||
                mName.contains("shouldshowbanner") ||
                mName.contains("shouldshowpromo") ||
                mName.contains("ispromotionvisible") ||
                mName.contains("shouldshowupgrade")
            ) && retType == "Z" && pTypes.isEmpty()

            if (isBannerCheck) {
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
                    logger.info("[MEGA Declutter] Suppressed Pro banner check in: ${type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[MEGA Declutter] Skip banner check hook: ${e.message}")
                }
            }
        }
    }

    logger.info("[MEGA AMOLED & Declutter] Total hooks applied: Activities=$hookedActivities, Methods=$hookedMethods")
}
