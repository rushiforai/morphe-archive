package com.dmoniak.patches.fossify

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FOSSIFY_PHONE
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val fossifyCallRecordingPatch = bytecodePatch(
    name = "Silent & Unrestricted Call Recording - Fossify Phone (Experimental)",
    description = "Unlocks call recording across all regions/devices, suppresses carrier/recording warning beeps and disclosure alerts, and automatically enables two-way audio recording directly to local storage.",
) {
    compatibleWith(COMPATIBILITY_FOSSIFY_PHONE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFossifyCallRecordingLogic(logger)
    }
}

fun BytecodePatchContext.executeFossifyCallRecordingLogic(logger: Logger) {
    logger.info("Executing Silent & Unrestricted Call Recording patch for Fossify Phone...")
    var hooked = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (
            tl.startsWith("landroid/") ||
            tl.startsWith("landroidx/") ||
            tl.startsWith("lkotlin/") ||
            tl.startsWith("ljava/") ||
            tl.startsWith("lcom/google/")
        ) return@classDefForEach

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Hook call recording availability and permission checks -> return true
            if (!isStatic && pTypes.isEmpty() && retType == "Z") {
                if (
                    mName == "iscallrecordingavailable" ||
                    mName == "canrecordcalls" ||
                    mName == "iscallrecordingsupported" ||
                    mName == "iscallrecordingenabled" ||
                    mName == "canshowcallrecording" ||
                    mName == "iscallrecordingpermitted" ||
                    mName == "hascallrecordingpermission" ||
                    mName == "canrecordaudio" ||
                    mName == "isautorecordingenabled" ||
                    mName == "canrecord" ||
                    mName == "isrecordingallowed" ||
                    mName == "iscallrecordable"
                ) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hooked++
                        logger.info("[Fossify Record] Unlocked recording check: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.fine("[Fossify Record] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }

            // 2. Suppress warning beeps, tones, and alert disclaimers -> return-void
            if (retType == "V") {
                if (
                    mName == "playrecordingtone" ||
                    mName == "playwarningbeep" ||
                    mName == "playcallrecordingtone" ||
                    mName == "playrecordingbeep" ||
                    mName == "showrecordingwarningdialog" ||
                    mName == "showrecordingdisclaimer" ||
                    mName == "playbeep" ||
                    mName == "playcallrecordtone"
                ) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 1,
                            smaliCode = "return-void"
                        )
                        hooked++
                        logger.info("[Fossify Record] Silenced recording beep/warning: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.fine("[Fossify Record] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }

            // 3. Suppress boolean warning beep check -> return false
            if (!isStatic && pTypes.isEmpty() && retType == "Z") {
                if (
                    mName == "shouldplayrecordingbeep" ||
                    mName == "shouldplaywarningtone" ||
                    mName == "mustwarnotherparty" ||
                    mName == "iswarningtoneenabled"
                ) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hooked++
                        logger.info("[Fossify Record] Disabled warning beep flag: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.fine("[Fossify Record] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Fossify Record] Finished: $hooked call recording hooks applied.")
}
