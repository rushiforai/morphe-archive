package app.template.patches.gboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

// 1. Compatibility Target
internal val COMPATIBILITY_GBOARD = Compatibility(
    name = "Gboard",
    packageName = "com.google.android.inputmethod.latin",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x1A73E8,
    signatures = setOf(
        "7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053",
        "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83"
    ),
    targets = listOf(
        AppTarget(
            version = "17.0.10.880768217-release-arm64-v8a",
            isExperimental = false
        )
    )
)



// 3. Flag Value Override Patch
internal val gboardAiWritingToolsFlagValuePatch = bytecodePatch(
    description = "依官方四顆 Writing tools switch 與 runtime 設定覆寫 mky#g()。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = FLAG_VALUE_CLASS,
            name = "g",
            returnType = "Ljava/lang/Object;",
            parameterTypes = emptyList()
        )

        mutableMethod.addInstructions(0, "move-object v1, p0")

        val instructions = mutableMethod.implementation?.instructions
            ?: error("No instructions available in mky.g")
        val returnIndices = mutableMethod.returnInstructionIndices()
            .filter { index ->
                instructions[index].opcode.name.uppercase().replace('-', '_') == "RETURN_OBJECT"
            }
        check(returnIndices.isNotEmpty()) { "Could not resolve RETURN_OBJECT in mky.g" }

        returnIndices.asReversed().forEach { returnIndex ->
            val resultRegister = (instructions[returnIndex] as? OneRegisterInstruction)?.registerA
                ?: error("RETURN_OBJECT at $returnIndex does not expose registerA")
            
            mutableMethod.addInstructions(
                returnIndex,
                """
                invoke-static {v1, v$resultRegister}, $AI_WRITING_TOOLS_RUNTIME_CLASS->applyOverriddenFlagValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$resultRegister
                """.trimIndent()
            )
        }
    }
}

// 4. Official Preferences Patch
internal val gboardAiWritingToolsOfficialPreferencesPatch = bytecodePatch(
    description = "觀察官方四顆 Writing tools switch 的實際值，供 runtime 決策使用。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = PREFERENCE_MANAGER_CLASS,
            name = "at",
            returnType = "Z",
            parameterTypes = listOf("I")
        )

        mutableMethod.returnInstructionIndices()
            .asReversed()
            .forEach { returnIndex ->
                val instructions = mutableMethod.implementation?.instructions
                    ?: error("No instructions available in $PREFERENCE_MANAGER_CLASS.at")
                val resultRegister = (instructions[returnIndex] as? OneRegisterInstruction)?.registerA
                    ?: error("RETURN at $returnIndex does not expose registerA")
                
                mutableMethod.addInstructions(
                    returnIndex,
                    "invoke-static {p1, v$resultRegister}, $AI_WRITING_TOOLS_OFFICIAL_PREFS_CLASS->notePreferenceValue(IZ)V"
                )
            }
    }
}

// 5. Settings Visibility Patch
internal val gboardAiWritingToolsSettingsVisibilityPatch = bytecodePatch(
    description = "在 runtime 啟用時固定保留官方四顆 Writing tools settings rows。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = PREFERENCE_WRAPPER_CLASS,
            name = "g",
            returnType = "V",
            parameterTypes = listOf("I")
        )

        mutableMethod.addInstructions(
            0,
            """
            invoke-static {p1}, $AI_WRITING_TOOLS_RUNTIME_CLASS->shouldBypassSettingsRemoval(I)Z
            move-result v0
            if-eqz v0, :cond_jasondev_continue_original
            return-void
            :cond_jasondev_continue_original
            """.trimIndent()
        )
    }
}

// 6. Signal Patch
internal val gboardAiWritingToolsSignalPatch = bytecodePatch(
    description = "強制放行 Writing tools top-bar 與 account/minors signals。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = SIGNAL_GATE_CLASS,
            name = "e",
            returnType = "Z",
            parameterTypes = listOf(SIGNAL_MARKER_CLASS)
        )

        mutableMethod.addInstructions(
            0,
            """
            invoke-static {p0}, $AI_WRITING_TOOLS_RUNTIME_CLASS->shouldForceSignalTrue(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :cond_jasondev_continue_original
            const/4 v0, 0x1
            return v0
            :cond_jasondev_continue_original
            """.trimIndent()
        )
    }
}

// 7. Dependency Sync Patch
internal val gboardAiWritingToolsDependencyPatch = bytecodePatch(
    description = "依 AiCore 狀態、allow_gen_ai_server 與官方 server switch 同步 hcv fallback 模式。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        injectDependencySync(
            name = "eU",
            parameterTypes = listOf("Landroid/content/Context;", "Loeb;"),
            reason = "hcv#eU",
            contextRegister = "p1"
        )
        injectDependencySync(
            name = "i",
            parameterTypes = emptyList(),
            reason = "hcv#i"
        )
        injectDependencySync(
            name = "f",
            parameterTypes = listOf("Lmpn;"),
            reason = "hcv#f"
        )
    }
}

private fun BytecodePatchContext.injectDependencySync(
    name: String,
    parameterTypes: List<String>,
    reason: String,
    contextRegister: String? = null
) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = DEPENDENCY_MONITOR_CLASS,
        name = name,
        returnType = "V",
        parameterTypes = parameterTypes
    )

    mutableMethod.returnInstructionIndices()
        .asReversed()
        .forEach { returnIndex ->
            mutableMethod.addInstructions(
                returnIndex,
                if (contextRegister != null) {
                    """
                    const-string v0, "$reason"
                    invoke-static {p0, $contextRegister, v0}, $AI_WRITING_TOOLS_DEPENDENCY_RUNTIME_CLASS->syncDependencyProvider(Ljava/lang/Object;Landroid/content/Context;Ljava/lang/String;)V
                    """.trimIndent()
                } else {
                    """
                    const-string v0, "$reason"
                    invoke-static {p0, v0}, $AI_WRITING_TOOLS_DEPENDENCY_RUNTIME_CLASS->syncDependencyProvider(Ljava/lang/Object;Ljava/lang/String;)V
                    """.trimIndent()
                }
            )
        }
}

// 8. Feature Marker Patch
internal val gboardAiWritingToolsFeatureMarkerPatch = resourcePatch(
    description = "標記 AI Writing Tools feature 已被打入 target APK，共用 settings UI 過濾。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        // Since we don't have the custom settings UI feature, this is just metadata
    }
}

// 2. Main Resource Patch (the entry point that Morphe loads)
@Suppress("unused")
val gboardAiWritingToolsPatch = bytecodePatch(
    name = "AI Writing Tools",
    description = "啟用 AI 撰寫工具，支援所有語言\nEnable AI writing tools with support for all languages.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    // Pull in the precompiled Java extension file containing our runtime logic
    extendWith("extensions/extension.mpe")

    // Bind all bytecode modification patches
    dependsOn(gboardAiWritingToolsDependencyPatch)
    dependsOn(gboardAiWritingToolsSettingsVisibilityPatch)
    dependsOn(gboardAiWritingToolsFlagValuePatch)
    dependsOn(gboardAiWritingToolsSignalPatch)
    dependsOn(gboardAiWritingToolsOfficialPreferencesPatch)
    dependsOn(gboardAiWritingToolsFeatureMarkerPatch)

    execute {
        // Nothing to do directly in the main patch's execute block, all work is done in dependencies
    }
}

