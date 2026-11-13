package com.dmoniak.patches.goodreads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOODREADS
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val goodreadsAmoledThemePatch = bytecodePatch(
    name = "Pure AMOLED Dark Theme & Ad-Free - Goodreads (Experimental)",
    description = "⚠️ [Experimental / Untested] Enforces a true pitch-black #000000 AMOLED dark theme across bookshelves, reader reviews, and book details, while stripping banner advertisements in Goodreads.",
) {
    compatibleWith(COMPATIBILITY_GOODREADS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGoodreadsAmoledThemeLogic(logger)
    }
}

fun BytecodePatchContext.executeGoodreadsAmoledThemeLogic(logger: Logger) {
    logger.info("Executing Pure AMOLED Dark Theme & Ad-Free patch for Goodreads...")
    var hooked = executeComprehensiveAdBlock(logger, "Goodreads")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("theme") || tl.contains("dark") || tl.contains("ad") || tl.contains("banner")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "isdarkmode" || mName == "isnightmode" || mName == "useoledtheme") && retType == "Z") {
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
                    } catch (e: Exception) {
                        logger.fine("[Goodreads Theme] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Goodreads Theme] Total hooks applied: $hooked")
}
