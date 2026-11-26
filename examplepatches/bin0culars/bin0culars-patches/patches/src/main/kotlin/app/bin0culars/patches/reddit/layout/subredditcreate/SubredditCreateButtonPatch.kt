package app.bin0culars.patches.reddit.layout.subredditcreate

import app.bin0culars.patches.reddit.layout.autoscroll.MainActivityResumeFingerprint
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection.NAVIGATION
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/SubredditCreateButtonPatch;"

@Suppress("unused")
val subredditCreateButtonPatch =
    patch(
        name = "Create button in communities",
        description = "Adds a Create post button to the top bar of each community. Turn it on in Settings → bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "subreddit_create_button",
                    section = NAVIGATION,
                    title = "Create button in communities",
                    summary = "Adds a + button next to Search in each community to start a post there. Handy if you hide the Create button in the navigation bar. Restart Reddit to apply.",
                    default = false,
                ),
            )

            val headerStateType = HeaderStateToStringFingerprint.classDef.type
            val displayNameField = HeaderStateToStringFingerprint.instructionMatches.last().fieldReference
            val displayNameFieldRef =
                "${displayNameField.definingClass}->${displayNameField.name}:${displayNameField.type}"

            val testTagMatch = SubredditToolbarSearchButtonFingerprint.instructionMatches[1]
            val dMatch = SubredditToolbarSearchButtonFingerprint.instructionMatches[2]
            val dRef = dMatch.methodReference

            val iconType = dRef.parameterTypes[0].toString()
            val modifierType = testTagMatch.methodReference.returnType.toString()
            val composerType = dRef.parameterTypes[8].toString()
            val dMethodRef =
                "${dRef.definingClass}->${dRef.name}(${dRef.parameterTypes.joinToString("")})${dRef.returnType}"

            val toolbarClass = SubredditToolbarSearchButtonFingerprint.classDef
            val helperName = "patch_createButton"
            val helperParamsDescriptor = "Ljava/lang/Object;$modifierType${composerType}Z"

            ImmutableMethod(
                toolbarClass.type,
                helperName,
                listOf(
                    ImmutableMethodParameter("Ljava/lang/Object;", null, null),
                    ImmutableMethodParameter(modifierType, null, null),
                    ImmutableMethodParameter(composerType, null, null),
                    ImmutableMethodParameter("Z", null, null),
                ),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(15),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static { }, $EXTENSION_CLASS->isEnabled()Z
                        move-result v0
                        if-nez v0, :enabled
                        return-void
                        :enabled
                        invoke-static { }, $EXTENSION_CLASS->iconRes()I
                        move-result v3
                        if-nez v3, :has_icon
                        return-void
                        :has_icon
                        check-cast p0, $headerStateType
                        iget-object v10, p0, $displayNameFieldRef
                        new-instance v0, $iconType
                        const-wide v1, 0x1400000014L
                        const/4 v4, 0x0
                        invoke-direct/range { v0 .. v4 }, $iconType-><init>(JIZ)V
                        invoke-static { }, $EXTENSION_CLASS->label()Ljava/lang/String;
                        move-result-object v1
                        invoke-static { v10 }, $EXTENSION_CLASS->contentDescription(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v2
                        move-object v3, v2
                        move v4, p3
                        invoke-static { v10 }, $EXTENSION_CLASS->onClick(Ljava/lang/String;)Lkotlin/jvm/functions/Function0;
                        move-result-object v5
                        move-object v6, p1
                        const/4 v7, 0x0
                        move-object v8, p2
                        const/high16 v9, 0x180000
                        invoke-static/range { v0 .. v9 }, $dMethodRef
                        return-void
                    """.trimIndent(),
                )
            }.let(toolbarClass.methods::add)

            val baseModifierReg = testTagMatch.instruction.registersUsed.first()
            val composerReg = dMatch.instruction.registersUsed[8]
            val isExpandedReg = dMatch.instruction.registersUsed[4]
            val insertIndex = dMatch.index + 1

            SubredditToolbarSearchButtonFingerprint.method.apply {
                val p0Reg = p0Register
                val needModReg = baseModifierReg >= 16
                val needComposerReg = composerReg >= 16
                val needExpandedReg = isExpandedReg >= 16
                val needed =
                    1 +
                        (if (needModReg) 1 else 0) +
                        (if (needComposerReg) 1 else 0) +
                        (if (needExpandedReg) 1 else 0)
                val registerProvider =
                    getFreeRegisterProvider(
                        insertIndex,
                        needed,
                        p0Reg,
                        baseModifierReg,
                        composerReg,
                        isExpandedReg,
                    )
                val stateReg = registerProvider.getFreeRegister4Bit()
                val modReg = if (needModReg) registerProvider.getFreeRegister4Bit() else baseModifierReg
                val compReg = if (needComposerReg) registerProvider.getFreeRegister4Bit() else composerReg
                val expandedReg = if (needExpandedReg) registerProvider.getFreeRegister4Bit() else isExpandedReg

                val smali = buildString {
                    appendLine("move-object/from16 v$stateReg, p0")
                    if (needModReg) {
                        appendLine("move-object/from16 v$modReg, v$baseModifierReg")
                    }
                    if (needComposerReg) {
                        appendLine("move-object/from16 v$compReg, v$composerReg")
                    }
                    if (needExpandedReg) {
                        appendLine("move/from16 v$expandedReg, v$isExpandedReg")
                    }
                    append(
                        "invoke-static { v$stateReg, v$modReg, v$compReg, v$expandedReg }, " +
                            "${toolbarClass.type}->$helperName($helperParamsDescriptor)V",
                    )
                }
                addInstructions(insertIndex, smali)
            }

            Fingerprint(
                definingClass = EXTENSION_CLASS,
                name = "submitIntent",
            ).method.addInstructions(
                0,
                """
                    invoke-static { p0, p1 }, Lcom/reddit/deeplink/PostSubmitDeeplinkModule;->submit(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;
                    move-result-object p0
                    return-object p0
                """,
            )

            MainActivityResumeFingerprint.method.addInstructions(
                0,
                "invoke-static { p0 }, $EXTENSION_CLASS->onActivityResumed(Landroid/app/Activity;)V",
            )
        }
    }
