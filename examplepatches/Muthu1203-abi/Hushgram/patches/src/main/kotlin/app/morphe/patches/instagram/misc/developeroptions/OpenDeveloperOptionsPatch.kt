/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 * Adapted for HushGram. See NOTICE for GPLv3 §7(b) attribution terms.
 */
package app.morphe.patches.instagram.misc.developeroptions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.misc.extension.classesLoadingString
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.extension.patchLog
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val DEVELOPER_OPTIONS_BRIDGE = "$EXTENSION_PACKAGE/misc/DeveloperOptions;"
private const val QE_FRAGMENT_DESCRIPTOR = "Lcom/instagram/debug/quickexperiment/QuickExperimentCategoriesFragment;"
private const val QE_FLAG_LABEL_ENTRY = "LX/08Rv;"

/**
 * Opens Instagram's own developer options by long-pressing the Home tab.
 * Adapted from Rex IG Lite's Unlock developer options hook.
 */
@Suppress("unused")
val openDeveloperOptionsPatch = bytecodePatch(
    name = "Open developer options",
    description = "Long-press the Home tab to open Instagram's developer options. Changes there can affect " +
        "Instagram's behavior for this account. Turn on in HushGram settings. Starts on.",
    default = false,
) {
    category("Settings")
    dependsOn(settingsPatch, instagramExtensionPatch)
    compatibleWith(*AppCompatibilities.instagram())

    execute {
        runCatching {
            enableStatus("developerOptions")
        }.getOrThrow()
        runCatching {
            val listener = HomeIconOnClickListenerFingerprint.matchAllOrNull()?.firstOrNull()?.method
                ?: throw PatchException("Open developer options: Home long-click listener was not found")

            try {
                val labelEntryClass = classDefByOrNull(QE_FLAG_LABEL_ENTRY)
                    ?: throw PatchException("Open developer options: Quick Experiment label entry was not found")

                fun idFieldReadBy(name: String): String {
                    val getter = labelEntryClass.methods.singleOrNull {
                        it.name == name && it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty() &&
                            !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
                    } ?: throw PatchException("Open developer options: $QE_FLAG_LABEL_ENTRY->$name()String was not found")
                    val idFields = getter.implementation!!.instructions.mapNotNull { instruction ->
                        (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    }.filter {
                        it.definingClass == QE_FLAG_LABEL_ENTRY && it.type == "I"
                    }.map { it.name }.distinct()
                    return idFields.singleOrNull()
                        ?: throw PatchException("Open developer options: $QE_FLAG_LABEL_ENTRY->$name() did not identify one ID field")
                }

                // Read obfuscated ID field names from the getters instead of assuming Instagram
                // keeps the same names across releases.
                val indexField = idFieldReadBy("A01")
                val configField = idFieldReadBy("A02")
                val mutableLabelEntry = mutableClassDefBy(QE_FLAG_LABEL_ENTRY)

                fun hookLabelGetter(name: String, bridgeMethod: String, idFields: List<String>) {
                    val original = labelEntryClass.methods.single {
                        it.name == name && it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty() &&
                            !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
                    }
                    val returnSites = original.implementation!!.instructions.withIndex()
                        .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                        .map { it.index }
                        .asReversed()
                    if (returnSites.isEmpty()) {
                        throw PatchException("Open developer options: $QE_FLAG_LABEL_ENTRY->$name() has no String return")
                    }
                    val method = mutableLabelEntry.methods.single {
                        it.name == name && it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty()
                    }
                    val bridgeParameters = buildString {
                        append("Ljava/lang/Object;Ljava/lang/String;")
                        repeat(idFields.size) { append("Ljava/lang/String;") }
                    }
                    for (at in returnSites) {
                        val returnRegister = (method.implementation!!.instructions[at] as? OneRegisterInstruction)?.registerA
                            ?: throw PatchException("Open developer options: $QE_FLAG_LABEL_ENTRY->$name() has an invalid return")
                        val thisRegister = method.implementation!!.registerCount - 1
                        val registers = method.getFreeRegisterProvider(at, 2 + idFields.size, thisRegister, returnRegister)
                        val entryRegister = registers.getFreeRegister4Bit()
                        val labelRegister = registers.getFreeRegister4Bit()
                        val idRegisters = idFields.map { registers.getFreeRegister4Bit() }
                        val idLoads = idRegisters.zip(idFields).joinToString("\n") { (register, field) ->
                            "const-string v$register, \"$field\""
                        }
                        val arguments = (listOf(entryRegister, labelRegister) + idRegisters).joinToString(", ") { "v$it" }
                        method.addInstructionsWithLabels(
                            at,
                            """
                                move-object/from16 v$entryRegister, p0
                                move-object/from16 v$labelRegister, v$returnRegister
                                $idLoads
                                invoke-static {$arguments}, $DEVELOPER_OPTIONS_BRIDGE->$bridgeMethod($bridgeParameters)Ljava/lang/String;
                                move-result-object v$labelRegister
                                move-object/from16 v$returnRegister, v$labelRegister
                            """.trimIndent(),
                        )
                    }
                }

                hookLabelGetter("A01", "parameterLabel", listOf(configField, indexField))
                hookLabelGetter("A02", "configLabel", listOf(configField))
            } catch (failure: Exception) {
                patchLog.warning(
                    "${failure.message ?: "MetaConfig label hooks were not compatible"}. " +
                        "Developer options will still open, but MetaConfig name mapping was skipped.",
                )
            }

            val openerClass = DeveloperOptionCallWithCallableFingerprint.matchAllOrNull()?.firstOrNull()?.classDef
                ?: throw PatchException("Open developer options: DeveloperOptionCallWithCallable class was not found")
            val openerInstance = openerClass.fields.firstOrNull {
                AccessFlags.STATIC.isSet(it.accessFlags) && it.type == openerClass.type
            }
                ?: throw PatchException("Open developer options: Instagram's developer-options singleton field was not found")
            val openerParameters = listOf(
                "Landroid/content/Context;",
                "Landroidx/fragment/app/FragmentActivity;",
                "Lcom/instagram/common/session/UserSession;",
            )
            val openerMethod = openerClass.methods.firstOrNull {
                !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
                    it.parameterTypes.map { type -> type.toString() } == openerParameters
            }
                ?: throw PatchException("Open developer options: Instagram's developer-options opener method was not found")

            val fragmentClass = classesLoadingString("FragmentNavigator.transitionInternal").firstOrNull()
                ?: FragmentNavigatorTransitionFingerprint.matchAllOrNull()?.firstOrNull()?.classDef
                ?: throw PatchException("Open developer options: FragmentNavigator class was not found")

            val fragmentConstructor = fragmentClass.methods.firstOrNull { method ->
                method.name == "<init>" && method.parameterTypes.size == 2 &&
                    method.parameterTypes[0] == "Landroidx/fragment/app/FragmentActivity;"
            } ?: throw PatchException("Open developer options: FragmentNavigator constructor not found")

            val fragmentSetMethod = fragmentClass.methods.firstOrNull { method ->
                !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                    method.parameterTypes.map(Any::toString) == listOf("Landroidx/fragment/app/Fragment;") &&
                    method.implementation?.instructions?.any { inst ->
                        ((inst as? ReferenceInstruction)?.reference as? MethodReference)?.let { mr ->
                            mr.parameterTypes.map(Any::toString) == listOf("Landroid/os/Bundle;", "Landroidx/fragment/app/Fragment;")
                        } ?: false
                    } == true
            } ?: fragmentClass.methods.firstOrNull { method ->
                !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                    method.parameterTypes.map(Any::toString) == listOf("Landroidx/fragment/app/Fragment;")
            } ?: throw PatchException("Open developer options: FragmentNavigator setFragment method not found")

            val fragmentCallMethod = fragmentClass.methods.lastOrNull { method ->
                !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                    method.parameterTypes.isEmpty() &&
                    method.implementation?.instructions?.any { it.opcode == Opcode.SGET_OBJECT } == true
            } ?: fragmentClass.methods.firstOrNull { method ->
                !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && method.parameterTypes.isEmpty()
            } ?: throw PatchException("Open developer options: FragmentNavigator commit method not found")

            val userSessionCastType = fragmentConstructor.parameterTypes[1]

            listener.apply {
                val activityRegister = getInstruction(0).registersUsed.firstOrNull()
                    ?: throw PatchException("Open developer options: Home long-click activity register was not found")
                val sessionRegister = getInstruction(1).registersUsed.firstOrNull()
                    ?: throw PatchException("Open developer options: Home long-click session register was not found")
                val firstInvokeInstruction = getInstruction(2)

                val registerProvider = getFreeRegisterProvider(2, 2, activityRegister, sessionRegister)
                val freeRegister = registerProvider.getFreeRegister()
                val freeRegister2 = registerProvider.getFreeRegister()

                addInstructionsWithLabels(
                    2,
                    """
                        invoke-static {v$activityRegister}, $DEVELOPER_OPTIONS_BRIDGE->enableDevOptions(Landroid/app/Activity;)Z
                        move-result v$freeRegister
                        if-eqz v$freeRegister, :no_dev

                        invoke-static {}, $DEVELOPER_OPTIONS_BRIDGE->directlyOpenMetaConfig()Z
                        move-result v$freeRegister
                        if-eqz v$freeRegister, :not_direct_config

                        check-cast v$sessionRegister, $userSessionCastType
                        new-instance v$freeRegister, $QE_FRAGMENT_DESCRIPTOR
                        invoke-direct {v$freeRegister}, $QE_FRAGMENT_DESCRIPTOR-><init>()V

                        new-instance v$freeRegister2, ${fragmentClass.type}
                        invoke-direct {v$freeRegister2, v$activityRegister, v$sessionRegister}, $fragmentConstructor
                        invoke-virtual {v$freeRegister2, v$freeRegister}, $fragmentSetMethod

                        invoke-virtual {v$freeRegister2}, $fragmentCallMethod
                        const/4 v$freeRegister2, 0x1
                        return v$freeRegister2

                        :not_direct_config
                        sget-object v$freeRegister, $openerInstance
                        invoke-virtual {v$freeRegister, v$activityRegister, v$activityRegister, v$sessionRegister}, $openerMethod
                        const/4 v$freeRegister, 0x1
                        return v$freeRegister
                    """.trimIndent(),
                    ExternalLabel("no_dev", firstInvokeInstruction),
                )
            }
        }.getOrThrow()
    }
}
