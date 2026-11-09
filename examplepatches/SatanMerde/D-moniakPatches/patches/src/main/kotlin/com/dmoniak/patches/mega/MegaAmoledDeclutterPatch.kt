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
    name = "Pure AMOLED Dark Theme - MEGA",
    description = "Enforces pure pitch-black (#000000) across MEGA's Jetpack Compose theme system (BackgroundColor, ComponentsColor), navigation bar, status bar, and root Activity windows for maximum OLED battery savings.",
) {
    compatibleWith(COMPATIBILITY_MEGA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMegaAmoledDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeMegaAmoledDeclutterLogic(logger: Logger) {
    logger.info("Executing Pure AMOLED Dark Theme patch for MEGA (mega.privacy.android.app)...")
    var hookedActivities = 0
    var hookedMethods = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.startsWith("landroidx/core/") || tl.startsWith("lkotlin/")) {
            return@classDefForEach
        }

        val superType = classDef.superclass ?: ""
        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Compose Design Tokens: Hook BackgroundColor and ComponentsColor to return pure black (0xFF000000)
        if (type.startsWith("Lmega/android/core/ui/theme/values/") &&
            (type.contains("BackgroundColor;") || type.contains("ComponentsColor;") || type.contains("SurfaceColor;"))
        ) {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                val retType = method.returnType
                // getBackgroundColor-vNxB06k(...) -> J, getComponentsColor-vNxB06k(...) -> J, getSurfaceColor-vNxB06k(...) -> J
                if (retType == "J" && (mName.startsWith("getBackground") || mName.startsWith("getComponents") || mName.startsWith("getSurface"))) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                                const-wide v0, -0x1000000000000000L
                                return-wide v0
                            """.trimIndent()
                        )
                        hookedMethods++
                        logger.info("[MEGA AMOLED] Hooked Compose color token: $type->$mName -> 0xFF000000 (Pure Black)")
                    } catch (e: Exception) {
                        logger.fine("[MEGA AMOLED] Skip Compose color token hook: ${e.message}")
                    }
                }
            }
        }

        // 2. Compose Theme Mode: Force isDarkTheme to true in ThemeModeExtKt and DarkThemeKt
        if (type == "Lmega/privacy/android/core/sharedcomponents/extension/ThemeModeExtKt;" ||
            type == "Landroidx/compose/foundation/DarkThemeKt;"
        ) {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                val retType = method.returnType
                if (retType == "Z" && (mName == "a" || mName == "isSystemInDarkTheme")) {
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
                        logger.info("[MEGA AMOLED] Forced Compose dark theme active: $type->$mName -> true")
                    } catch (e: Exception) {
                        logger.fine("[MEGA AMOLED] Skip Compose dark theme hook: ${e.message}")
                    }
                }
            }
        }

        // 3. Compose AppTheme root: Inject darkTheme = true (const/16 p0, 0x1) into ThemeKt.a
        if (type == "Lmega/android/core/ui/theme/ThemeKt;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "a" && method.returnType == "V" && method.parameterTypes.size >= 3) {
                    try {
                        val cloned = cloneMethodWithAdditionalRegisters(method, 1)
                        cloned.addInstructions(
                            0,
                            """
                            const/16 p0, 0x1
                            """.trimIndent()
                        )
                        hookedMethods++
                        logger.info("[MEGA AMOLED] Injected darkTheme=true into ThemeKt->${method.name}")
                    } catch (e: Exception) {
                        logger.fine("[MEGA AMOLED] Skip ThemeKt injection: ${e.message}")
                    }
                }
            }
        }

        // 4. Inject pure black window background, status bar, and navigation bar in all concrete Activities
        val isConcreteActivity = !type.contains("$") &&
                (type.endsWith("Activity;") || superType.endsWith("Activity;") || superType.contains("Activity")) &&
                (tl.contains("mega") || !tl.startsWith("lcom/google/"))

        if (isConcreteActivity) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name
                val pTypes = method.parameterTypes

                val isLifecycle = !isStatic && (
                    (mName == "onResume" && pTypes.isEmpty()) ||
                    (mName == "onCreate" && pTypes.size == 1 && pTypes[0] == "Landroid/os/Bundle;")
                )

                if (isLifecycle) {
                    try {
                        val cloned = cloneMethodWithAdditionalRegisters(method, 3)
                        cloned.addInstructions(
                            0,
                            """
                            invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                            move-result-object v0
                            if-eqz v0, :cond_skip_amoled_bg
                            const/high16 v1, -0x1000000
                            invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V
                            invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V
                            new-instance v2, Landroid/graphics/drawable/ColorDrawable;
                            invoke-direct {v2, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
                            invoke-virtual {v0, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
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

        // 5. Hook dark mode boolean getters & background color getters
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
                mName == "shouldusedarktheme"
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
                    logger.fine("[MEGA AMOLED] Hooked dark theme getter: ${type}->${method.name} -> true")
                } catch (e: Exception) {
                    logger.fine("[MEGA AMOLED] Skip getter hook on ${type}: ${e.message}")
                }
            }
        }
    }

    logger.info("[MEGA AMOLED] Total hooks applied: Activities=$hookedActivities, Methods=$hookedMethods")
}
