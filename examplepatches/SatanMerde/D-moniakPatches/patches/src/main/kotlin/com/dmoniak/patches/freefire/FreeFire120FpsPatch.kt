package com.dmoniak.patches.freefire

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FREE_FIRE
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FREE_FIRE_MAX
import java.util.logging.Logger

@Suppress("unused")
val freeFire120FpsPatch = bytecodePatch(
    name = "Free Fire MAX 120 FPS & Device Model Spoof (Experimental)",
    description = "⚠️ [Expérimental / Risque de ban en ligne] Débloque l'option 120 FPS / Taux de rafraîchissement élevé dans Free Fire MAX en simulant un modèle d'appareil gaming supporté (ASUS ROG Phone 8 Pro / ASUS_AI2401) et en forçant le taux de rafraîchissement de la fenêtre d'affichage à 120Hz.",
) {
    compatibleWith(COMPATIBILITY_FREE_FIRE_MAX, COMPATIBILITY_FREE_FIRE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFreeFire120FpsLogic(logger)
    }
}

fun BytecodePatchContext.executeFreeFire120FpsLogic(logger: Logger) {
    logger.info("Executing Free Fire MAX 120 FPS & Device Model Spoof patch...")
    var replacedBuildFields = 0
    var windowRateHooks = 0
    var reflectionHooks = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        // Skip core system packages
        if (tl.startsWith("landroid/os/") || tl.startsWith("landroid/view/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            val imp = method.implementation ?: continue
            val mName = method.name
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)

            // 1. Inject Reflection Build Spoofer in Application / MainActivity onCreate
            if (!isStatic && (mName == "onCreate" || mName == "attachBaseContext") &&
                (tl.contains("application") || tl.contains("mainactivity") || tl.contains("splashactivity"))
            ) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        :try_start_spoofer
                        const-string v0, "android.os.Build"
                        invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
                        move-result-object v0

                        const-string v1, "MODEL"
                        invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
                        move-result-object v1
                        const/4 v2, 0x1
                        invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V
                        const-string v3, "ASUS_AI2401"
                        const/4 v4, 0x0
                        invoke-virtual {v1, v4, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

                        const-string v1, "MANUFACTURER"
                        invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
                        move-result-object v1
                        invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V
                        const-string v3, "asus"
                        invoke-virtual {v1, v4, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

                        const-string v1, "BRAND"
                        invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
                        move-result-object v1
                        invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V
                        invoke-virtual {v1, v4, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
                        :try_end_spoofer
                        .catch Ljava/lang/Throwable; {:try_start_spoofer .. :try_end_spoofer} :catch_spoofer
                        :catch_spoofer
                        """.trimIndent()
                    )
                    reflectionHooks++
                    logger.info("[Free Fire 120 FPS] Injected reflection Build spoofer in ${type}->${mName}")
                } catch (e: Exception) {
                    logger.fine("[Free Fire 120 FPS] Skip reflection inject: ${e.message}")
                }
            }

            // 2. Hook Activity onCreate/onResume to configure 120Hz display refresh rate
            if (!isStatic && (mName == "onCreate" || mName == "onResume") && tl.contains("activity")) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                        move-result-object v0
                        if-nez v0, :morphe_ff_skip
                        invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager${'$'}LayoutParams;
                        move-result-object v1
                        if-nez v1, :morphe_ff_skip
                        const/high16 v2, 0x42f00000
                        iput v2, v1, Landroid/view/WindowManager${'$'}LayoutParams;->preferredRefreshRate:F
                        invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager${'$'}LayoutParams;)V
                        :morphe_ff_skip
                        """.trimIndent()
                    )
                    windowRateHooks++
                    logger.fine("[Free Fire 120 FPS] Configured 120Hz WindowManager in ${type}->${mName}")
                } catch (e: Exception) {
                    logger.fine("[Free Fire 120 FPS] Skip window hook: ${e.message}")
                }
            }

            // 3. Scan instructions for Build.MODEL / MANUFACTURER / BRAND reads
            val instructions = imp.instructions.toList()
            for ((index, instruction) in instructions.withIndex()) {
                if (instruction.opcode == Opcode.SGET_OBJECT) {
                    val fieldRef = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: continue
                    if (fieldRef.definingClass == "Landroid/os/Build;") {
                        val reg = (instruction as? OneRegisterInstruction)?.registerA ?: continue
                        val spoofVal = when (fieldRef.name) {
                            "MODEL", "DEVICE", "PRODUCT" -> "ASUS_AI2401"
                            "MANUFACTURER", "BRAND" -> "asus"
                            else -> null
                        }

                        if (spoofVal != null) {
                            try {
                                val mutableMethod = mutableClass.findMutableMethodOf(method)
                                val newInstruction = BuilderInstruction21c(
                                    Opcode.CONST_STRING,
                                    reg,
                                    ImmutableStringReference(spoofVal)
                                )
                                mutableMethod.replaceInstruction(index, newInstruction)
                                replacedBuildFields++
                            } catch (e: Exception) {
                                logger.fine("[Free Fire 120 FPS] Skip instruction replace: ${e.message}")
                            }
                        }
                    }
                }
            }

            // 4. Hook framerate getters returning int (target 120 fps)
            val mNameLower = mName.lowercase()
            if (!isStatic && (
                mNameLower == "gettargetfps" ||
                mNameLower == "getmaxframerate" ||
                mNameLower == "gettargetframerate" ||
                mNameLower == "getdesiredfps"
            ) && method.returnType == "I" && method.parameterTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/16 v0, 0x78
                        return v0
                        """.trimIndent() // 120
                    )
                    logger.info("[Free Fire 120 FPS] Hooked $mName to return 120")
                } catch (e: Exception) {
                    logger.fine("[Free Fire 120 FPS] Failed to hook $mName: ${e.message}")
                }
            }
        }
    }

    logger.info("[Free Fire 120 FPS] Finished: $reflectionHooks reflection hooks, $windowRateHooks window rate hooks, $replacedBuildFields Build field accesses spoofed.")
}
