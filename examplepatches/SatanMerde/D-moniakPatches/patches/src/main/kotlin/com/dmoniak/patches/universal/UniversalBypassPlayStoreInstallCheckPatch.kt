package com.dmoniak.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import java.util.logging.Logger

@Suppress("unused")
val universalBypassPlayStoreInstallCheckPatch = bytecodePatch(
    name = "Universal Bypass Play Store Install Check (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses Google Play Store installer source verification ('Download this app from Google Play' dialogs), preventing forced redirects to the Play Store when running sideloaded or patched APKs (such as VPN apps, tools, and games).",
) {
    // Universal patch: Applies to any sideloaded app enforcing Play Store installer verification
    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUniversalBypassPlayStoreInstallCheckLogic(logger)
    }
}

fun BytecodePatchContext.executeUniversalBypassPlayStoreInstallCheckLogic(logger: Logger) {
    logger.info("Executing Universal Bypass Play Store Install Check patch...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        // Skip Android framework internals
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Hook Boolean methods checking if app was installed from Play Store
            if (!isStatic && (
                mName == "isinstalledfromplaystore" ||
                mName == "isinstalledfromstore" ||
                mName == "isinstallervalid" ||
                mName == "verifyinstallationsource" ||
                mName == "isvalidinstaller" ||
                mName == "isplaystoresource" ||
                mName == "isverifiedinstaller" ||
                mName == "checkplaystoreinstall"
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
                    hookedPoints++
                    logger.info("[Play Store Check Bypass] Forced installer check to true: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Play Store Check Bypass] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Hook installer package name getter methods returning String -> return "com.android.vending"
            if (!isStatic && (
                mName == "getinstallerpackagename" ||
                mName == "getinstallsource" ||
                mName == "getinstallingsource"
            ) && retType == "Ljava/lang/String;" && pTypes.size <= 1) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const-string v0, "com.android.vending"
                        return-object v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Play Store Check Bypass] Spoofed installer package name to com.android.vending: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Play Store Check Bypass] Failed installer spoof ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Play Store Check Bypass] Total installer check hooks applied: $hookedPoints")
}
