/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.analytics.disableAnalyticsPatch
import app.morphe.patches.facebook.ads.disableAdsPatch
import app.morphe.patches.facebook.feed.cleanHomeFeedPatch
import app.morphe.patches.facebook.feed.refresh.blockReturnRefreshPatch
import app.morphe.patches.facebook.navigation.marketplace.openMarketplaceOnLaunchPatch
import app.morphe.patches.facebook.misc.optimizeFacebookPatch
import app.morphe.patches.facebook.misc.signatureCompatibilityPatch
import app.morphe.patches.facebook.pip.pictureInPicturePatch
import app.morphe.patches.facebook.quality.mediaQualityPatch
import app.morphe.patches.facebook.shared.Constants
import app.morphe.patches.facebook.shared.FacebookTargets
import app.morphe.patches.facebook.theme.amoledThemePatch
import app.morphe.patches.facebook.theme.materialYouThemePatch
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.util.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val extensionPatch = sharedExtensionPatch("facebook", false)

private fun invokeRegisters(instruction: Any): List<Int> = when (instruction) {
    is FiveRegisterInstruction -> listOf(
        instruction.registerC,
        instruction.registerD,
        instruction.registerE,
        instruction.registerF,
        instruction.registerG,
    ).take(instruction.registerCount)

    is RegisterRangeInstruction ->
        (instruction.startRegister until
            instruction.startRegister + instruction.registerCount).toList()

    else -> error("Unsupported invoke register shape")
}

@Suppress("unused")
val facebookSettingsPatch = bytecodePatch(
    name = "De-Vanced Settings",
    description = "Adds De-Vanced controls to Facebook Profile Settings.",
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(
        extensionPatch,
        facebookSettingsResourcePatch,
        amoledThemePatch,
        materialYouThemePatch,
        disableAnalyticsPatch,
        disableAdsPatch,
        optimizeFacebookPatch,
        signatureCompatibilityPatch,
        mediaQualityPatch,
        pictureInPicturePatch,
        cleanHomeFeedPatch,
        blockReturnRefreshPatch,
        openMarketplaceOnLaunchPatch,
    )

    execute {
        val onCreate = FacebookSettingsApplicationOnCreateFingerprint.method
        val returnIndex = onCreate.implementation!!.instructions
            .indexOfLast { instruction -> instruction.opcode == Opcode.RETURN_VOID }
        check(returnIndex >= 0) {
            "FacebookApplication.onCreate return was not resolved"
        }
        onCreate.addInstructions(
            returnIndex,
            """
                invoke-static {p0}, Lapp/morphe/extension/facebook/settings/DeVancedSettings;->initialize(Landroid/app/Application;)V
            """.trimIndent(),
        )

        if (packageMetadata.versionName == FacebookTargets.V578 ||
            packageMetadata.versionName == FacebookTargets.V580
        ) {
            val dataDiffRender = FacebookDataDiffRenderFingerprint.method
            val dataDiffCast = dataDiffRender.implementation!!.instructions
                .withIndex()
                .filter { (_, instruction) ->
                    instruction.opcode == Opcode.CHECK_CAST &&
                        (instruction as? ReferenceInstruction)
                            ?.reference
                            ?.toString() == dataDiffRender.definingClass
                }
                .getOrNull(1)
                ?: error("Facebook ${packageMetadata.versionName} data diff section was not resolved")
            val dataDiffRegister =
                (dataDiffCast.value as OneRegisterInstruction).registerA
            dataDiffRender.addInstructions(
                dataDiffCast.index + 1,
                """
                    invoke-static/range {v$dataDiffRegister .. v$dataDiffRegister}, Lapp/morphe/extension/facebook/settings/DeVancedSettings;->appendNativeDataDiffAction(Ljava/lang/Object;)V
                """.trimIndent(),
            )

            val nativeActionDispatch =
                FacebookNativeProfileActionDispatchFingerprint.method
            val actionRegister = nativeActionDispatch
                .getFreeRegisterProvider(0, 1)
                .getFreeRegister()
            val modelParameter = if (
                AccessFlags.STATIC.isSet(nativeActionDispatch.accessFlags)
            ) {
                "p8"
            } else {
                "p9"
            }
            nativeActionDispatch.addInstructions(
                0,
                """
                    move-object/from16 v$actionRegister, $modelParameter
                    invoke-static/range {v$actionRegister .. v$actionRegister}, Lapp/morphe/extension/facebook/settings/DeVancedSettings;->dispatchNativeProfileClickForRvr(Ljava/lang/Object;)Z
                    move-result v$actionRegister
                    if-eqz v$actionRegister, :morphe_devanced_native_action_continue
                    return-void
                    :morphe_devanced_native_action_continue
                    nop
                """.trimIndent(),
            )

            val nativeRowRender =
                FacebookNativeProfileRowRenderFingerprint.method
            val rowInstructions =
                nativeRowRender.implementation!!.instructions.toList()
            val modelType =
                nativeRowRender.parameterTypes[3].toString()
            val labelIndex = rowInstructions.withIndex()
                .firstOrNull { (_, instruction) ->
                    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) {
                        return@firstOrNull false
                    }
                    val reference =
                        (instruction as? ReferenceInstruction)
                            ?.reference as? MethodReference
                            ?: return@firstOrNull false
                    reference.name == "A04" &&
                        reference.returnType == "Ljava/lang/String;" &&
                        reference.parameterTypes.size == 2 &&
                        reference.parameterTypes[1].toString() == modelType
                }?.index
                ?: error("Facebook ${packageMetadata.versionName} profile row label was not resolved")
            val labelRegisters =
                invokeRegisters(rowInstructions[labelIndex])
            val modelRegister = labelRegisters.last()
            val labelResult =
                (rowInstructions[labelIndex + 1] as OneRegisterInstruction)
                    .registerA

            val drawableIndex = rowInstructions.withIndex()
                .firstOrNull { (_, instruction) ->
                    if (instruction.opcode != Opcode.INVOKE_INTERFACE) {
                        return@firstOrNull false
                    }
                    val reference =
                        (instruction as? ReferenceInstruction)
                            ?.reference as? MethodReference
                            ?: return@firstOrNull false
                    reference.returnType ==
                        "Landroid/graphics/drawable/Drawable;" &&
                        reference.parameterTypes.size == 4 &&
                        reference.parameterTypes[0].toString() ==
                        "Landroid/content/Context;"
                }?.index
                ?: error("Facebook ${packageMetadata.versionName} profile row drawable was not resolved")
            check(drawableIndex > labelIndex) {
                "Facebook ${packageMetadata.versionName} profile row order changed"
            }
            val drawableRegisters =
                invokeRegisters(rowInstructions[drawableIndex])
            val contextRegister = drawableRegisters[1]
            val drawableResult =
                (rowInstructions[drawableIndex + 1] as OneRegisterInstruction)
                    .registerA

            check(
                drawableResult == modelRegister + 1 &&
                    contextRegister == drawableResult + 1
            ) {
                "Facebook ${packageMetadata.versionName} native row register order changed"
            }
            nativeRowRender.addInstructions(
                drawableIndex + 2,
                """
                    invoke-static/range {v$modelRegister .. v$contextRegister}, Lapp/morphe/extension/facebook/settings/DeVancedSettings;->overrideNativeProfileDrawableRange(Ljava/lang/Object;Landroid/graphics/drawable/Drawable;Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
                    move-result-object v$drawableResult
                """.trimIndent(),
            )

            check(labelResult < 16 && modelRegister < 16) {
                "Facebook ${packageMetadata.versionName} label registers exceed 4-bit encoding"
            }
            nativeRowRender.addInstructions(
                labelIndex + 2,
                """
                    invoke-static {v$labelResult, v$modelRegister}, Lapp/morphe/extension/facebook/settings/DeVancedSettings;->overrideProfileActionLabel(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v$labelResult
                """.trimIndent(),
            )

            println(
                "[Settings${packageMetadata.versionName}] dataDiff=${dataDiffRender.definingClass} " +
                    "row=${nativeRowRender.definingClass} " +
                    "dispatch=${nativeActionDispatch.definingClass}",
            )
            return@execute
        }

        val profileSection = FacebookProfileSettingsSectionFingerprint.method
        val profileInstructions = profileSection.implementation!!.instructions

        fun findStaticCall(
            definingClass: String,
            name: String,
            returnType: String,
            parameters: List<String>,
        ): Int {
            return profileInstructions.withIndex()
                .firstOrNull { (_, instruction) ->
                    if (instruction.opcode != Opcode.INVOKE_STATIC) return@firstOrNull false
                    val reference =
                        (instruction as? ReferenceInstruction)
                            ?.reference as? MethodReference
                            ?: return@firstOrNull false
                    reference.definingClass == definingClass &&
                        reference.name == name &&
                        reference.returnType == returnType &&
                        reference.parameterTypes == parameters
                }?.index ?: error(
                "Facebook profile section call was not resolved: " +
                    "$definingClass->$name"
            )
        }

        val appendActionIndex = findStaticCall(
            definingClass = "LX/19f;",
            name = "A1P",
            returnType = "V",
            parameters = listOf(
                "Ljava/lang/Object;",
                "Ljava/lang/Object;",
                "Ljava/util/AbstractCollection;",
            ),
        )
        val renderSection = FacebookProfileSettingsRenderFingerprint.method
        val renderInstructions = renderSection.implementation!!.instructions
        val renderSectionIndex = renderInstructions.withIndex()
            .firstOrNull { (_, instruction) ->
                if (instruction.opcode != Opcode.INVOKE_STATIC) {
                    return@firstOrNull false
                }
                val reference =
                    (instruction as? ReferenceInstruction)
                        ?.reference as? MethodReference
                        ?: return@firstOrNull false
                reference.definingClass == "LX/PyD;" &&
                    reference.name == "A1j" &&
                    reference.returnType == "LX/2Su;" &&
                    reference.parameterTypes == listOf(
                        "LX/dBt;",
                        "LX/2St;",
                        "LX/94m;",
                    )
            }?.index ?: error("Facebook profile render call was not resolved")
        val responseRender = FacebookResponseQueryRenderFingerprint.method
        val responseReturnIndex = responseRender.implementation!!.instructions
            .indexOfLast { instruction -> instruction.opcode == Opcode.RETURN_OBJECT }
        check(responseReturnIndex >= 0) {
            "Facebook response query render return was not resolved"
        }
        val dataDiffRender = FacebookDataDiffRenderFingerprint.method
        val dataDiffInstructions = dataDiffRender.implementation!!.instructions
        val dataDiffCheckCastIndex = dataDiffInstructions.withIndex()
            .filter { (_, instruction) ->
                instruction.opcode == Opcode.CHECK_CAST &&
                    (instruction as? ReferenceInstruction)
                        ?.reference
                        ?.toString() == "LX/3Sa;"
            }
            .getOrNull(1)
            ?.index
            ?: error("Facebook data diff render was not resolved")
        val nativeRowRender = FacebookNativeProfileRowRenderFingerprint.method
        val nativeRowLabelIndex = nativeRowRender.implementation!!.instructions
            .withIndex()
            .firstOrNull { (_, instruction) ->
                if (instruction.opcode != Opcode.INVOKE_VIRTUAL) {
                    return@firstOrNull false
                }
                val reference =
                    (instruction as? ReferenceInstruction)
                        ?.reference as? MethodReference
                        ?: return@firstOrNull false
                reference.definingClass == "LX/Te5;" &&
                    reference.name == "A04" &&
                    reference.returnType == "Ljava/lang/String;" &&
                    reference.parameterTypes == listOf(
                        "LX/3Q3;",
                        "LX/UT0;",
                    )
            }?.index
            ?: error("Facebook native profile row label resolver was not resolved")
        val nativeRowDrawableIndex = nativeRowRender.implementation!!.instructions
            .withIndex()
            .firstOrNull { (_, instruction) ->
                if (instruction.opcode != Opcode.INVOKE_INTERFACE) {
                    return@firstOrNull false
                }
                val reference =
                    (instruction as? ReferenceInstruction)
                        ?.reference as? MethodReference
                        ?: return@firstOrNull false
                reference.definingClass == "LX/aSL;" &&
                    reference.name == "Av7" &&
                    reference.returnType ==
                        "Landroid/graphics/drawable/Drawable;" &&
                    reference.parameterTypes == listOf(
                        "Landroid/content/Context;",
                        "LX/aPg;",
                        "LX/aPh;",
                        "LX/XPz;",
                    )
            }?.index
            ?: error("Facebook native profile row drawable resolver was not resolved")
        val nativeRowIndex = findStaticCall(
            definingClass = "LX/PyI;",
            name = "A0Z",
            returnType = "LX/9mv;",
            parameters = listOf(
                "LX/3Q3;",
                "Ljava/lang/CharSequence;",
            ),
        )
        val lastCopyProfileLinkIndex = profileInstructions.withIndex()
            .filter { (_, instruction) ->
                (instruction as? ReferenceInstruction)
                    ?.reference
                    ?.toString() == "COPY_PROFILE_LINK"
            }
            .lastOrNull()
            ?.index
            ?: error("COPY_PROFILE_LINK action was not resolved")
        val clickHandlerIndex = profileInstructions.withIndex()
            .firstOrNull { (index, instruction) ->
                index > lastCopyProfileLinkIndex &&
                    instruction.opcode == Opcode.CHECK_CAST &&
                    (instruction as? ReferenceInstruction)
                        ?.reference
                        ?.toString() == "Ljava/lang/String;"
            }?.index
            ?: error("Profile action click handler was not resolved")
        val nativeActionDispatch =
            FacebookNativeProfileActionDispatchFingerprint.method

        dataDiffRender.addInstructions(
            dataDiffCheckCastIndex + 1,
            """
                invoke-static {v11}, Lapp/morphe/extension/facebook/settings/DeVancedSettings;->appendNativeDataDiffAction(Ljava/lang/Object;)V
            """.trimIndent(),
        )
        nativeActionDispatch.addInstructions(
            0,
            """
                invoke-static/range {v52 .. v52}, Lapp/morphe/extension/facebook/settings/DeVancedSettings;->dispatchNativeProfileClickForRvr(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :morphe_devanced_tfw_continue
                return-void
                :morphe_devanced_tfw_continue
            """.trimIndent(),
        )
        nativeRowRender.addInstructions(
            nativeRowDrawableIndex + 2,
            """
                invoke-static {v5, v4, v6}, Lapp/morphe/extension/facebook/settings/DeVancedSettings;->overrideNativeProfileDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Object;Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
                move-result-object v5
            """.trimIndent(),
        )
        nativeRowRender.addInstructions(
            nativeRowLabelIndex + 2,
            """
                invoke-static {v1, v4}, Lapp/morphe/extension/facebook/settings/DeVancedSettings;->overrideProfileActionLabel(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v1
            """.trimIndent(),
        )

        profileSection.addInstructions(
            clickHandlerIndex + 1,
            """
                invoke-static {v7, v1}, Lapp/morphe/extension/facebook/settings/DeVancedSettings;->handleNativeProfileClick(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v7
            """.trimIndent(),
        )

        profileSection.addInstructions(
            nativeRowIndex + 2,
            """
                invoke-static {v4, v11, v1}, Lapp/morphe/extension/facebook/settings/DeVancedSettings;->configureNativeProfileRow(Ljava/lang/Object;Ljava/lang/CharSequence;Ljava/lang/Object;)V
            """.trimIndent(),
        )

        profileSection.addInstructions(
            appendActionIndex + 1,
            """
                invoke-static {v7}, Lapp/morphe/extension/facebook/settings/DeVancedSettings;->appendNativeProfileAction(Ljava/util/AbstractCollection;)V
            """.trimIndent(),
        )
    }
}

object FacebookSettingsApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/katana/app/FacebookApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

object FacebookProfileSettingsSectionFingerprint : Fingerprint(
    definingClass = "LX/SlB;",
    name = "A3R",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("LX/dBt;", "Ljava/lang/Object;"),
)

object FacebookProfileSettingsRenderFingerprint : Fingerprint(
    definingClass = "LX/SlB;",
    name = "A3Q",
    returnType = "LX/2Su;",
    parameters = listOf("LX/1oa;"),
)

object FacebookResponseQueryRenderFingerprint : Fingerprint(
    definingClass = "LX/94k;",
    name = "A3Q",
    returnType = "LX/2Su;",
    parameters = listOf("LX/1oa;"),
)

object FacebookNativeProfileActionDispatchFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/view/View;",
        "Lcom/facebook/auth/usersession/FbUserSession;",
        "L",
        "L",
        "L",
        "L",
        "L",
        "L",
        "L",
        "Lcom/facebook/xapp/messaging/feature/profiledirectory/model/ProfileDirectorySummary;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z",
    ),
    strings = listOf(
        "ProfileDynamicActionBarHandler:NullActionType",
    ),
)

object FacebookNativeProfileRowRenderFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf(
        "L",
        "L",
        "L",
        "L",
        "I",
        "Z",
    ),
    strings = listOf(
        "null cannot be cast to non-null type @[GraphQLProfileActionType] kotlin.String",
    ),
)

object FacebookDataDiffRenderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "L",
        "L",
        "L",
        "L",
    ),
    strings = listOf(
        "sections.calculateDiff",
    ),
)
