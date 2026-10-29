package com.dmoniak.patches.altosadventure

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_ALTOS_ADVENTURE
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val altosAdventureUnlockCharactersPatch = bytecodePatch(
    name = "Unlock All Characters & Workshop - Alto's Adventure (Experimental)",
    description = "⚠️ [Experimental / Untested] Unlocks all snowboarders (Maya, Paz, Izel, Felipe, Tupa), workshop items (Llama Horn, Helmets, Chasm Rescues), and coin doublers in Alto's Adventure without spending coins or real money.",
) {
    compatibleWith(COMPATIBILITY_ALTOS_ADVENTURE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeAltosAdventureUnlockCharactersLogic(logger)
    }
}

fun BytecodePatchContext.executeAltosAdventureUnlockCharactersLogic(logger: Logger) {
    logger.info("Executing Unlock All Characters & Workshop patch for Alto's Adventure...")
    var hookedPoints = 0

    // 1. Hook Google Play BillingClient for Coin Doubler & Workshop IAP
    hookedPoints += executeGooglePlayBillingBypass(logger, "AltosAdventure")

    // 2. Hook character & item unlocked methods with clean replaceMethod
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            if (!isStatic && retType == "Z" && (
                mName == "ischaracterunlocked" ||
                mName == "isitemunlocked" ||
                mName == "haspurchasedcoindoubler" ||
                mName == "iscoindoubleractive" ||
                mName == "isworkshopitemunlocked" ||
                mName == "hasunlockedcharacter"
            )) {
                try {
                    replaceMethod(
                        method = method,
                        registerCount = 3,
                        smaliCode = """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Alto's Adventure] Hooked ${classDef.type}->${method.name} -> true")
                } catch (e: Exception) {
                    logger.fine("[Alto's Adventure] Failed ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Alto's Adventure] Total character/workshop hooks applied: $hookedPoints")
}
