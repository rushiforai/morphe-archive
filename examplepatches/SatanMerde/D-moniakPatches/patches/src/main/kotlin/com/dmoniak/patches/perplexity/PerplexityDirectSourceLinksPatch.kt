package com.dmoniak.patches.perplexity

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PERPLEXITY
import java.util.logging.Logger

@Suppress("unused")
val perplexityDirectSourceLinksPatch = bytecodePatch(
    name = "Clean Links & Fast Copy - Perplexity (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips tracking redirects from cited web sources in Perplexity answers and enables one-tap formatted markdown export.",
) {
    compatibleWith(COMPATIBILITY_PERPLEXITY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePerplexityDirectSourceLinksLogic(logger)
    }
}

fun BytecodePatchContext.executePerplexityDirectSourceLinksLogic(logger: Logger) {
    logger.info("Executing Clean Links & Fast Copy patch for Perplexity...")
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

            // Hook direct source URLs and markdown export options
            if (!isStatic && (
                mName == "isdirecturlenabled" ||
                mName == "shouldstriptrackingredirects" ||
                mName == "ismarkdownexportenabled" ||
                mName == "cancopyformattedsources"
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
                    logger.info("[Perplexity Links] Enabled direct link/copy in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Perplexity Links] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Perplexity Clean Links & Copy] Total hooks applied: $hookedPoints")
}
