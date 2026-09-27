package com.dmoniak.patches.signal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SIGNAL
import java.util.logging.Logger

@Suppress("unused")
val signalAmoledDeclutterPatch = bytecodePatch(
    name = "AMOLED Dark Theme & Hide Donation Nags - Signal (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects pure OLED pitch black (#000000) into Signal chat threads and settings, and suppresses donor badges and 'Support Signal' donation reminders.",
) {
    compatibleWith(COMPATIBILITY_SIGNAL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSignalAmoledDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeSignalAmoledDeclutterLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme & Hide Donation Nags patch for Signal...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Hook dark theme background color getters -> pure OLED black (#000000)
            if (!isStatic && (
                mName == "getchatbackgroundcolor" ||
                mName == "getdarkthemerootbackground" ||
                mName == "getsignalsurfacecolor"
            ) && retType == "I") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, -0x1000000
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Signal AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Signal AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress donation banners and 'Support Signal' nag dialogs
            if (!isStatic && (
                mName == "shouldshowdonationsbanner" ||
                mName == "isdonationsenabled" ||
                mName == "shouldpromptforsupportsignal" ||
                mName == "isdonorbadgereminderdue"
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
                    hookedPoints++
                    logger.info("[Signal Declutter] Suppressed donation prompt in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Signal Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Signal AMOLED & Declutter] Total hooks applied: $hookedPoints")
}
