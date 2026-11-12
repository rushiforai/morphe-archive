package com.dmoniak.patches.macrodroid

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MACRODROID
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val macroDroidUnlimitedMacrosPatch = bytecodePatch(
    name = "Unlimited Macros and Import - MacroDroid (Experimental)",
    description = "Removes the free-tier restriction limiting users to 5 macros. Enables creating, running, and importing an unlimited number of active automation macros and action blocks.",
) {
    compatibleWith(COMPATIBILITY_MACRODROID)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMacroDroidUnlimitedMacrosLogic(logger)
    }
}

fun BytecodePatchContext.executeMacroDroidUnlimitedMacrosLogic(logger: Logger) {
    logger.info("Executing Unlimited Macros and Import patch for MacroDroid...")
    var hookedPoints = 0

    // Key DEX evidence:
    //   - Lcom/arlosoft/macrodroid/importexport/SelectiveImportUiState;->getMaxMacros() -> I
    //   - Strings: "too_many_macros", "you_have_x_of_y_macros_remaining", "maxMacros"
    //   - Strings: "unlimited_number_of_macros", "unlimitedMacrosLabel"

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (!tl.contains("androidx") && !tl.contains("android/support")) {
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name.lowercase()
                val retType = method.returnType
                val params = method.parameterTypes

                // 1. Hook macro ceiling limit getters -> 999999
                if (!isStatic && retType == "I" && params.isEmpty() && (
                    mName == "getmaxmacros" ||
                    mName == "getmacrolimit" ||
                    mName == "getfreemacrolimit" ||
                    mName == "getallowedmacrocount"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 3,
                            smaliCode = """
                                const v0, 0x000F423F
                                return v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[MacroDroid Macros] Set max macro capacity -> 999999: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MacroDroid Macros] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 2. Disable macro limit reached checks -> false
                if (!isStatic && retType == "Z" && params.isEmpty() && (
                    mName == "ismacrolimitreached" ||
                    mName == "islimitreached" ||
                    mName == "hasexceededmacrolimit" ||
                    mName == "hasreachedmaximummacros" ||
                    mName == "istoomanymacros"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 3,
                            smaliCode = """
                                const/4 v0, 0x0
                                return v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[MacroDroid Macros] Disabled macro limit reached check -> false: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MacroDroid Macros] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 3. Force canAddMacro / canCreateMacro / canImportMacro -> true
                if (!isStatic && retType == "Z" && params.isEmpty() && (
                    mName == "canaddmacro" ||
                    mName == "cancreatemacro" ||
                    mName == "canimportmacro" ||
                    mName == "isunlimitedmacrosenabled"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 3,
                            smaliCode = """
                                const/4 v0, 0x1
                                return v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[MacroDroid Macros] Enabled unlimited macro creation: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MacroDroid Macros] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[MacroDroid Macros] Total macro capacity hooks applied: $hookedPoints")
}
