package com.dmoniak.patches.protonpass

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PROTON_PASS
import java.util.logging.Logger

@Suppress("unused")
val protonPassAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Screen Recording - Proton Pass (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses Android WindowManager FLAG_SECURE restrictions in Proton Pass, allowing you to take screenshots or record screens of recovery keys, 2FA QR codes, and credentials.",
) {
    compatibleWith(COMPATIBILITY_PROTON_PASS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeProtonPassAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeProtonPassAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots patch for Proton Pass...")
    var unflaggedMethods = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()

            // 1. Hook security policy / screen security getters -> force false
            if (!isStatic && (
                mName == "isscreensecure" ||
                mName == "isflagsecureenabled" ||
                mName == "shouldenforceflagsecure" ||
                mName == "isblockscreenrecording" ||
                mName == "isscreenshotblocked"
            ) && method.returnType == "Z" && method.parameterTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    unflaggedMethods++
                    logger.fine("[Proton Pass Screenshots] Disabled screen security flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Proton Pass Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Clear FLAG_SECURE (0x2000) in Activity onCreate / onResume
            if (!isStatic && (method.name == "onCreate" || method.name == "onResume") && tl.contains("activity")) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                        move-result-object v0
                        if-nez v0, :morphe_pass_screen_skip
                        const/16 v1, 0x2000
                        invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V
                        :morphe_pass_screen_skip
                        """.trimIndent()
                    )
                    unflaggedMethods++
                    logger.fine("[Proton Pass Screenshots] Injected clearFlags(FLAG_SECURE) in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Proton Pass Screenshots] Failed to clear flag in ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Proton Pass Screenshots] Total screenshot restriction hooks applied: $unflaggedMethods")
}
