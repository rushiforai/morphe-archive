package dev.abotmaker.ramblerenhancements.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.util.WeakHashMap

internal const val GBOARD_PACKAGE = "com.google.android.inputmethod.latin"
internal const val VERIFIED_GBOARD_VERSION = "18.5.4.993608717-release-arm64-v8a"
internal const val EXPERIMENTAL_GBOARD_VERSION = "18.8.0.1022711984-beta-arm64-v8a"
internal val COMPATIBILITY_GBOARD = Compatibility(
    name = "Gboard",
    packageName = GBOARD_PACKAGE,
    appIconColor = 0x1A73E8,
    targets = listOf(
        AppTarget(
            version = VERIFIED_GBOARD_VERSION,
            isExperimental = false,
            description = "Verified target (works alongside Gboard Patches / GboardWu).",
        ),
        AppTarget(
            version = EXPERIMENTAL_GBOARD_VERSION,
            isExperimental = true,
            description = "Experimental standalone target (without Gboard Patches).",
        ),
    ),
)
internal const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
internal const val OPEN_SETTINGS_ACTION = "dev.abotmaker.ramblerenhancements.OPEN_SETTINGS"
internal const val SETTINGS_ACTIVITY_CLASS =
    "dev.abotmaker.ramblerenhancements.RamblerEnhancementsActivity"
internal const val DYNAMIC_CONFIG_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerDynamicConfig;"
internal const val FLAG_RUNTIME_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerFlagRuntime;"
internal const val CONTACTS_RUNTIME_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerContactsRuntime;"
internal const val WAVEFORM_RUNTIME_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerWaveformRuntime;"
internal const val PREF_LAUNCHER_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerPreferenceLauncher;"
internal const val TEXT_PIPELINE_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerTextPipeline;"
internal const val DICTATION_STATS_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerDictationStats;"
internal const val TOOLBAR_ACCESS_POINT_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerToolbarAccessPoint;"
internal const val SPACEBAR_TRIGGER_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerSpacebarTrigger;"

internal enum class RamblerFeature {
    WAVEFORM,
    PRODUCTIVITY_TOOLS,
}

internal class RamblerPatchRunState {
    val selectedFeatures = linkedSetOf<RamblerFeature>()
    var flagTargets: FlagTargets? = null
    var agenticTargets: AgenticExtensionTargets? = null
    var appendSpacingTargets: AppendSpacingTargets? = null
    var waveformTargets: WaveformTargets? = null
    var prefsTargets: PrefsTargets? = null
    var prefLaunchTargets: PreferenceLaunchTargets? = null
    var activateHookTargets: ActivateHookTargets? = null
    var commitPipelineTargets: CommitPipelineTargets? = null
    var voiceLifecycleTargets: VoiceLifecycleTargets? = null
    var accessPointTargets: AccessPointTargets? = null
    var spacebarTriggerTargets: SpacebarTriggerTargets? = null
    var agenticCtorHooked: Boolean = false
}

internal object RamblerPatchStateStore {
    private val byContext = WeakHashMap<BytecodePatchContext, RamblerPatchRunState>()

    @Synchronized
    fun state(context: BytecodePatchContext): RamblerPatchRunState =
        byContext.getOrPut(context) { RamblerPatchRunState() }

    @Synchronized
    fun take(context: BytecodePatchContext): RamblerPatchRunState? =
        byContext.remove(context)
}

internal val ramblerSharedExtensionPatch = bytecodePatch(
    description = "Attach Rambler Enhancements runtime extension and wire dynamically fingerprinted bindings.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    extendWith("extensions/rambler-enhancements.rve")

    execute { }

    finalize {
        val state = RamblerPatchStateStore.take(this) ?: return@finalize
        if (state.selectedFeatures.isEmpty()) return@finalize

        val needsFlags = RamblerFeature.PRODUCTIVITY_TOOLS in state.selectedFeatures

        if (needsFlags) {
            val flags = state.flagTargets ?: RamblerDynamicResolver.resolveFlagTargets(this).also {
                state.flagTargets = it
            }
            installConflictFreeFlagHook(flags)
        }

        val needsAgenticCtorHook = RamblerFeature.PRODUCTIVITY_TOOLS in state.selectedFeatures
        if (needsAgenticCtorHook && !state.agenticCtorHooked) {
            val agentic = state.agenticTargets ?: RamblerDynamicResolver.resolveAgenticExtension(this)
                .also { state.agenticTargets = it }
            installAgenticCtorStartupHook(agentic)
            state.agenticCtorHooked = true
        }

        val needsPrefs = RamblerFeature.PRODUCTIVITY_TOOLS in state.selectedFeatures
        if (needsPrefs) {
            val agentic = state.agenticTargets ?: RamblerDynamicResolver.resolveAgenticExtension(this)
                .also { state.agenticTargets = it }
            if (state.prefsTargets == null) {
                state.prefsTargets = RamblerDynamicResolver.resolvePrefsTargets(
                    this,
                    agentic.extensionClass,
                )
            }
        }

        val needsActivateHook = RamblerFeature.PRODUCTIVITY_TOOLS in state.selectedFeatures
        if (needsActivateHook) {
            val agentic = state.agenticTargets ?: RamblerDynamicResolver.resolveAgenticExtension(this)
                .also { state.agenticTargets = it }
            val activateTargets = RamblerDynamicResolver.resolveActivateHookTargets(agentic.extensionClass)
            state.activateHookTargets = activateTargets
            installExtensionActivateHook(activateTargets)
        }

        if (RamblerFeature.PRODUCTIVITY_TOOLS in state.selectedFeatures) {
            val agentic = state.agenticTargets ?: RamblerDynamicResolver.resolveAgenticExtension(this)
                .also { state.agenticTargets = it }
            val spacing = state.appendSpacingTargets
                ?: RamblerDynamicResolver.resolveAppendSpacingTargets(this, agentic.extensionClass)
                    .also { state.appendSpacingTargets = it }
            val pipelineTargets = RamblerDynamicResolver.resolveCommitPipelineTargets(this, spacing)
            state.commitPipelineTargets = pipelineTargets
            installCommitPipelineHook(pipelineTargets)
            val lifecycleTargets = RamblerDynamicResolver.resolveVoiceLifecycleTargets(agentic.extensionClass)
            state.voiceLifecycleTargets = lifecycleTargets
            installVoiceLifecycleStatsHooks(lifecycleTargets)
        }

        val prefLaunch = RamblerDynamicResolver.resolvePreferenceLaunchTargets(this)
        state.prefLaunchTargets = prefLaunch
        installExplicitPreferenceLaunchHook(prefLaunch)

        // The toolbar button, spacebar modes and dictation stats all belong to Productivity Tools;
        // installing them for a Waveform-only selection would put hooks in a build that never asks
        // the runtime for them.
        if (RamblerFeature.PRODUCTIVITY_TOOLS in state.selectedFeatures) {
            val apTargets = RamblerDynamicResolver.resolveAccessPointTargets(this)
            if (apTargets != null) {
                state.accessPointTargets = apTargets
                installToolbarAccessPointHooks(apTargets)
            }
        }

        if (RamblerFeature.PRODUCTIVITY_TOOLS in state.selectedFeatures) {
            val agenticForSpacebar = state.agenticTargets
                ?: runCatching { RamblerDynamicResolver.resolveAgenticExtension(this) }.getOrNull()
                    ?.also { state.agenticTargets = it }
            if (agenticForSpacebar != null) {
                val spacebarTargets = RamblerDynamicResolver.resolveSpacebarTriggerTargets(
                    this,
                    agenticForSpacebar.extensionClass,
                )
                if (spacebarTargets != null) {
                    state.spacebarTriggerTargets = spacebarTargets
                    installSpacebarTriggerHooks(agenticForSpacebar, spacebarTargets)
                }
            }
        }

        rewriteDynamicConfigClinit(state)
    }
}

internal fun installExtensionActivateHook(targets: ActivateHookTargets) {
    // Use invoke-static/range so methods with >16 registers (e.g. fhv.I / kov.L) verify cleanly.
    targets.activateMethod.addInstructions(
        0,
        "invoke-static/range {p0 .. p1}, $TEXT_PIPELINE_TYPE->onExtensionActivate(Ljava/lang/Object;Landroid/view/inputmethod/EditorInfo;)V",
    )
}

internal fun installCommitPipelineHook(targets: CommitPipelineTargets) {
    val pcnReg = targets.pcnRegister
    val textReg = targets.textRegister
    targets.targetMethod.addInstructions(
        targets.insertIndex,
        """
        invoke-static {v$pcnReg, v$textReg}, $TEXT_PIPELINE_TYPE->processCommitText(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
        move-result-object v$textReg
        """.trimIndent(),
    )
}

internal fun installVoiceLifecycleStatsHooks(targets: VoiceLifecycleTargets) {
    targets.onVoiceStartMethod.addInstructions(
        0,
        "invoke-static {}, $DICTATION_STATS_TYPE->onVoiceStart()V",
    )
    targets.onListeningStopMethod.addInstructions(
        0,
        "invoke-static {}, $DICTATION_STATS_TYPE->onListeningStop()V",
    )
}

internal fun installToolbarAccessPointHooks(targets: AccessPointTargets) {
    val orderMethod = targets.orderFactoryMethod
    val orderImpl = orderMethod.implementation
        ?: throw PatchException("AccessPoint order factory has no implementation")
    val localRegs = orderImpl.registerCount - 5
    check(localRegs >= 2) {
        "AccessPoint order factory needs >= 2 local registers, found $localRegs"
    }
    orderMethod.addInstructions(
        0,
        """
        move-object/from16 v0, p0
        move-object/from16 v1, p3
        invoke-static {v0, v1}, $TOOLBAR_ACCESS_POINT_TYPE->includeOrderCatalog(Landroid/content/Context;Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v0
        move-object/from16 p3, v0
        check-cast p3, ${targets.immutableSetType}
        """.trimIndent(),
    )

    val ctor = targets.controllerConstructor
    val ctorInsns = ctor.implementation?.instructions
        ?: throw PatchException("AccessPoint controller constructor has no implementation")
    val returnIndices = ctorInsns.indices.filter { ctorInsns[it].opcode == Opcode.RETURN_VOID }
    check(returnIndices.isNotEmpty()) {
        "AccessPoint controller constructor has no return-void"
    }
    for (retIdx in returnIndices.asReversed()) {
        ctor.replaceInstruction(
            retIdx,
            "invoke-static/range {p0 .. p1}, $TOOLBAR_ACCESS_POINT_TYPE->afterControllerCreated(Ljava/lang/Object;Landroid/content/Context;)V",
        )
        ctor.addInstructions(retIdx + 1, "return-void")
    }
}

private fun installExplicitPreferenceLaunchHook(targets: PreferenceLaunchTargets) {
    val impl = targets.performClickMethod.implementation
        ?: throw PatchException("Preference.performClick has no implementation")
    if (impl.registerCount !in 2..16) {
        throw PatchException(
            "Preference.performClick register count out of range: ${impl.registerCount}",
        )
    }
    val firstInsn = impl.instructions.firstOrNull()
        ?: throw PatchException("Preference.performClick has no instructions")
    targets.performClickMethod.addInstructionsWithLabels(
        0,
        """
        invoke-static {p0}, $PREF_LAUNCHER_TYPE->maybeLaunch(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :rambler_stock_pref_click
        return-void
        """.trimIndent(),
        ExternalLabel("rambler_stock_pref_click", firstInsn),
    )
}

private fun installConflictFreeFlagHook(targets: FlagTargets) {
    val vReg = targets.resolvedValueRegister
    targets.recomputeMethod.addInstructions(
        targets.insertIndex,
        """
        invoke-static {p0, v$vReg}, $FLAG_RUNTIME_TYPE->applyResolvedFlag(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v$vReg
        """.trimIndent(),
    )
}

internal fun installAgenticCtorStartupHook(targets: AgenticExtensionTargets) {
    val insns = targets.contextConstructor.implementation?.instructions
        ?: throw PatchException("AgenticDictationExtension.<init> has no instructions")
    // Insert right after super.<init>()V rather than before return-void because R8 on Gboard
    // 18.8.0+ reuses p1 (Context) for a local object before returning from the constructor.
    val superInitIdx = insns.indices.firstOrNull { idx ->
        val insn = insns[idx]
        if (insn.opcode != Opcode.INVOKE_DIRECT && insn.opcode != Opcode.INVOKE_DIRECT_RANGE) {
            return@firstOrNull false
        }
        val ref = (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
            ?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
        ref?.name == "<init>" && ref.definingClass == targets.extensionClass.superclass
    } ?: 0
    val pIdx = targets.contextParamIndex
    targets.contextConstructor.addInstructions(
        superInitIdx + 1,
        "invoke-static {p$pIdx}, $CONTACTS_RUNTIME_TYPE->onRamblerStart(Landroid/content/Context;)V",
    )
}

internal fun installSpacebarTriggerHooks(
    agenticTargets: AgenticExtensionTargets,
    targets: SpacebarTriggerTargets,
) {
    // 1. Capture live AgenticDictationExtension instance right before constructor return-void
    //    (using p0 only so R8 register reuse of p1 on 18.8.0+ is never touched).
    val ctor = agenticTargets.contextConstructor
    val ctorImpl = ctor.implementation
        ?: throw PatchException("AgenticDictationExtension.<init> has no implementation")
    val ctorReturnIndices = ctorImpl.instructions.indices.filter {
        ctorImpl.instructions[it].opcode == Opcode.RETURN_VOID
    }
    check(ctorReturnIndices.isNotEmpty()) {
        "AgenticDictationExtension.<init> has no return-void"
    }
    val ctorParamWords = ctor.parameterTypes.sumOf {
        if (it.toString() == "J" || it.toString() == "D") 2 else 1
    }
    val ctorThisReg = ctorImpl.registerCount - 1 - ctorParamWords
    val captureInsn = if (ctorThisReg <= 15) {
        "invoke-static {p0}, $SPACEBAR_TRIGGER_TYPE->onAgenticExtensionCreated(Ljava/lang/Object;)V"
    } else {
        "invoke-static/range {p0 .. p0}, $SPACEBAR_TRIGGER_TYPE->onAgenticExtensionCreated(Ljava/lang/Object;)V"
    }
    for (retIdx in ctorReturnIndices.asReversed()) {
        ctor.replaceInstruction(retIdx, captureInsn)
        ctor.addInstructions(retIdx + 1, "return-void")
    }

    // 2. Intercept Spacebar long-press (-10022, "space") at entry of LanguagePickerExtension.consumeEvent.
    val consumeMethod = targets.consumeEventMethod
    val consumeImpl = consumeMethod.implementation
        ?: throw PatchException("LanguagePickerExtension.consumeEvent has no implementation")
    val firstConsumeInsn = consumeImpl.instructions.firstOrNull()
        ?: throw PatchException("LanguagePickerExtension.consumeEvent has no instructions")
    val consumeLocalRegs = consumeImpl.registerCount - 2
    check(consumeLocalRegs >= 1) {
        "LanguagePickerExtension.consumeEvent needs >= 1 local register, found $consumeLocalRegs"
    }
    val invokeConsume = if (consumeImpl.registerCount <= 16) {
        "invoke-static {p0, p1}, $SPACEBAR_TRIGGER_TYPE->maybeHandleSpaceLongPress(Ljava/lang/Object;Ljava/lang/Object;)Z"
    } else {
        "invoke-static/range {p0 .. p1}, $SPACEBAR_TRIGGER_TYPE->maybeHandleSpaceLongPress(Ljava/lang/Object;Ljava/lang/Object;)Z"
    }
    consumeMethod.addInstructionsWithLabels(
        0,
        """
        $invokeConsume
        move-result v0
        if-eqz v0, :rambler_stock_lang_picker_event
        const/4 v0, 0x1
        return v0
        """.trimIndent(),
        ExternalLabel("rambler_stock_lang_picker_event", firstConsumeInsn),
    )

    // 3. Wrap LanguagePickerExtension.getInitialKeyboardState (3 regs / 0 locals -> rename stock
    //    method to private helper and replace with a 5-register wrapper so p0/p1/p2 stay intact).
    val langPickerClass = targets.langPickerClass
    val stockMethod = targets.initialStateMethod
    val stockImpl = stockMethod.implementation
        ?: throw PatchException("LanguagePickerExtension.getInitialKeyboardState has no implementation")
    val originalName = stockMethod.name
    val originalAccess = stockMethod.accessFlags
    val paramTypes = stockMethod.parameterTypes.map { it.toString() }
    val immutableParams = paramTypes.map { ImmutableMethodParameter(it, emptySet(), null) }
    val helperName = "morpheRamblerStockInitialState"

    if (langPickerClass.methods.none { it.name == helperName }) {
        langPickerClass.methods.remove(stockMethod)

        val renamedStock = ImmutableMethod(
            langPickerClass.type,
            helperName,
            immutableParams,
            "J",
            AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
            emptySet(),
            emptySet(),
            stockImpl,
        ).toMutable()
        langPickerClass.methods.add(renamedStock)

        val wrapper = ImmutableMethod(
            langPickerClass.type,
            originalName,
            immutableParams,
            "J",
            originalAccess,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(5),
        ).toMutable()
        val paramDesc = paramTypes.joinToString("")
        wrapper.addInstructions(
            0,
            """
            invoke-static {p0}, $SPACEBAR_TRIGGER_TYPE->shouldClearNoImePickerState(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :rambler_stock_initial_state
            const-wide/16 v0, 0x0
            return-wide v0
            :rambler_stock_initial_state
            invoke-direct {p0, p1, p2}, ${langPickerClass.type}->$helperName($paramDesc)J
            move-result-wide v0
            return-wide v0
            """.trimIndent(),
        )
        langPickerClass.methods.add(wrapper)
    }

    // 4. Observe keyboard touch release at entry of SoftKeyboardView.dispatchTouchEvent(MotionEvent)Z
    //    for Hold-to-Talk & Smart Hybrid modes (zero-conflict with GboardWu's InputView/KeyboardViewHolder hooks).
    val dispatchTouch = targets.softKeyboardDispatchTouchMethod
    val dispatchImpl = dispatchTouch?.implementation
    if (dispatchTouch != null && dispatchImpl != null) {
        val alreadyHooked = dispatchImpl.instructions.any { insn ->
            val ref = (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                ?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
            ref?.definingClass == SPACEBAR_TRIGGER_TYPE && ref.name == "onKeyboardTouchEvent"
        }
        if (!alreadyHooked) {
            val touchInvoke = if (dispatchImpl.registerCount <= 16) {
                "invoke-static {p1}, $SPACEBAR_TRIGGER_TYPE->onKeyboardTouchEvent(Landroid/view/MotionEvent;)V"
            } else {
                "invoke-static/range {p1 .. p1}, $SPACEBAR_TRIGGER_TYPE->onKeyboardTouchEvent(Landroid/view/MotionEvent;)V"
            }
            dispatchTouch.addInstructions(0, touchInvoke)
        }
    }
}

private fun BytecodePatchContext.rewriteDynamicConfigClinit(state: RamblerPatchRunState) {
    val configClass = mutableClassDefBy(DYNAMIC_CONFIG_TYPE)
    rewriteDynamicConfigClinitOnClass(configClass, state)
}

internal fun rewriteDynamicConfigClinitOnClass(
    configClass: MutableClass,
    state: RamblerPatchRunState,
) {
    // D8 folds static constant initializers into DEX static_values and may emit a 0-register
    // <clinit> (or omit <clinit> entirely). Replacing it with a fresh MutableMethodImplementation
    // guarantees registerCount >= 1 so ART never rejects v0 with VerifyError (0 >= 0).
    configClass.methods.removeAll { it.name == "<clinit>" }
    val clinit = ImmutableMethod(
        configClass.type,
        "<clinit>",
        emptyList(),
        "V",
        AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value,
        emptySet(),
        emptySet(),
        MutableMethodImplementation(2),
    ).toMutable()

    val sb = StringBuilder()

    fun putBool(fieldName: String, value: Boolean) {
        sb.appendLine("const/4 v0, ${if (value) "0x1" else "0x0"}")
        sb.appendLine("sput-boolean v0, $DYNAMIC_CONFIG_TYPE->$fieldName:Z")
    }

    fun putStr(fieldName: String, value: String) {
        val escaped = value.replace("\\", "\\\\").replace("\"", "\\\"")
        sb.appendLine("const-string v0, \"$escaped\"")
        sb.appendLine("sput-object v0, $DYNAMIC_CONFIG_TYPE->$fieldName:Ljava/lang/String;")
    }

    // Selected feature gates. The five features this bundle does not port are not written at all:
    // their flags ship false in the extension's own static values, and this bundle's own Rambler
    // patches already cover them, so turning the upstream implementations on would double every hook.
    putBool("FEATURE_WAVEFORM", RamblerFeature.WAVEFORM in state.selectedFeatures)
    putBool("FEATURE_PRODUCTIVITY_TOOLS", RamblerFeature.PRODUCTIVITY_TOOLS in state.selectedFeatures)

    // Flag bindings (resolved or 18.5.4 defaults)
    val flags = state.flagTargets
    putStr("FLAG_NAME_FIELD", flags?.flagNameField ?: "a")
    putStr("FLAG_RECOMPUTE_METHOD", flags?.recomputeMethod?.name ?: "x")
    putStr("FLAG_NOTIFY_METHOD", flags?.notifyMethod ?: "t")

    // Waveform bindings (resolved or 18.5.4 defaults)
    val wf = state.waveformTargets
    putStr("DRAWABLE_SHADER_FIELD", wf?.drawableShaderField ?: "e")
    putStr("DRAWABLE_CORNER_RADIUS_FIELD", wf?.drawableCornerRadiusField ?: "h")
    putStr("SHADER_PROCESSING_FIELD", wf?.shaderProcessingField ?: "l")
    putStr("SHADER_COLLAPSING_FIELD", wf?.shaderCollapsingField ?: "i")
    putStr("SHADER_EXIT_FADE_FIELD", wf?.shaderExitFadeField ?: "j")
    putStr("SHADER_GLOBAL_ALPHA_FIELD", wf?.shaderGlobalAlphaField ?: "o")

    // The personal-dictionary MUSE_STATS / Protobuf bindings are not written either: that feature
    // is not ported, its gate never turns on, and the extension's static values already hold them.
    // Preferences bindings (resolved or 18.5.4 defaults)
    val prefs = state.prefsTargets
    putStr("PREFS_CLASS", prefs?.prefsClass ?: "qvt")
    putStr("PREFS_GET_INSTANCE_METHOD", prefs?.getInstanceMethod ?: "I")
    putStr("PREFS_READ_STRING_METHOD", prefs?.readStringMethod ?: "d")
    putStr("PREFS_WRITE_STRING_METHOD", prefs?.writeStringMethod ?: "i")

    // AndroidX Preference launch bindings (resolved or 18.5.4 defaults)
    val prefLaunch = state.prefLaunchTargets
    putStr("PREF_CONTEXT_FIELD", prefLaunch?.contextField ?: "j")
    putStr("PREF_INTENT_FIELD", prefLaunch?.intentField ?: "s")

    // AgenticDictationExtension context field used by the activate hook (resolved or 18.5.4 default).
    // AGENTIC_EDITOR_INFO_FIELD is only read by the unported custom-instruction rules, so it keeps
    // the extension's own default.
    putStr("AGENTIC_CONTEXT_FIELD", state.activateHookTargets?.contextField ?: "b")

    // InputConnection wrapper interface methods (resolved or 18.5.4 defaults)
    val pipeline = state.commitPipelineTargets
    putStr("PCN_GET_EDITOR_INFO_METHOD", pipeline?.pcnGetEditorInfoMethod ?: "k")
    putStr("PCN_PERFORM_ACTION_METHOD", pipeline?.pcnPerformActionMethod ?: "y")

    // Gboard Toolbar Access Point bindings (resolved or 18.5.4 defaults)
    val ap = state.accessPointTargets
    putStr("AP_CONTROLLER_CLASS", ap?.controllerClass ?: "mwv")
    putStr("AP_CONTROLLER_ORDER_HELPER_FIELD", ap?.controllerOrderHelperField ?: "g")
    putStr("AP_CONTROLLER_REGISTER_METHOD", ap?.controllerRegisterMethod ?: "g")
    putStr("AP_ORDER_HELPER_CLASS", ap?.orderHelperClass ?: "mwg")
    putStr("AP_ORDER_HELPER_CATALOG_FIELD", ap?.orderHelperCatalogField ?: "c")
    putStr("AP_IMMUTABLE_SET_CLASS", ap?.immutableSetClass ?: "wpa")
    putStr("AP_IMMUTABLE_SET_COPY_METHOD", ap?.immutableSetCopyMethod ?: "n")
    putStr("AP_DESCRIPTOR_CLASS", ap?.descriptorClass ?: "mtr")
    putStr("AP_DESCRIPTOR_BUILDER_FACTORY_METHOD", ap?.descriptorBuilderFactoryMethod ?: "c")
    putStr("AP_BUILDER_BASE_CLASS", ap?.builderBaseClass ?: "mtm")
    putStr("AP_BUILDER_CONCRETE_CLASS", ap?.builderConcreteClass ?: "mtm")
    putStr("AP_BUILDER_TOKEN_METHOD", ap?.builderTokenMethod ?: "l")
    putStr("AP_BUILDER_RUNNABLE_METHOD", ap?.builderRunnableMethod ?: "q")
    putStr("AP_BUILDER_BUILD_METHOD", ap?.builderBuildMethod ?: "a")
    putStr("AP_BUILDER_ICON_FIELD", ap?.builderIconField ?: "c")
    putStr("AP_BUILDER_LABEL_FIELD", ap?.builderLabelField ?: "d")

    // Spacebar long-press -> Rambler trigger bindings (resolved or 18.5.4 defaults)
    val sp = state.spacebarTriggerTargets
    putStr("SPACEBAR_LP_EVENT_GET_KEYDATA_METHOD", sp?.eventGetKeyDataMethod ?: "g")
    putStr("SPACEBAR_LP_KEYDATA_CODE_FIELD", sp?.keyDataCodeField ?: "c")
    putStr("SPACEBAR_LP_KEYDATA_DATA_FIELD", sp?.keyDataDataField ?: "e")
    putStr("SPACEBAR_LP_EXT_GET_CONTEXT_METHOD", sp?.extGetContextMethod ?: "ac")
    putStr("SPACEBAR_LP_AGENTIC_IS_ACTIVE_METHOD", sp?.agenticIsActiveMethod ?: "ag")
    putStr("SPACEBAR_LP_AGENTIC_TRIGGER_METHOD", sp?.agenticTriggerMethod ?: "C")
    putStr("SPACEBAR_LP_AGENTIC_CLASS", sp?.agenticClassName ?: "fhv")
    putStr("SPACEBAR_LP_AGENTIC_UI_MANAGER_FIELD", sp?.agenticUiManagerField ?: "c")
    putStr("SPACEBAR_LP_UI_MANAGER_GET_STATE_METHOD", sp?.uiManagerGetStateMethod ?: "h")

    sb.appendLine("return-void")
    clinit.addInstructions(0, sb.toString().trimIndent())
    configClass.methods.add(clinit)
}

internal fun MutableClass.addHelperMethodIfMissing(
    name: String,
    parameterTypes: List<String>,
    returnType: String,
    accessFlags: Int,
    registerCount: Int,
    body: String,
) {
    if (methods.any { it.name == name && it.parameterTypes.map { p -> p.toString() } == parameterTypes && it.returnType == returnType }) {
        return
    }
    val trimmedBody = body.trimIndent()
    val params = parameterTypes.map { ImmutableMethodParameter(it, emptySet(), null) }
    val method = ImmutableMethod(
        type,
        name,
        params,
        returnType,
        accessFlags,
        emptySet(),
        emptySet(),
        MutableMethodImplementation(registerCount),
    ).toMutable()
    method.addInstructions(0, trimmedBody)
    method.retainHelperExceptionMetadata(trimmedBody)
    methods.add(method)
}

private fun MutableMethod.retainHelperExceptionMetadata(body: String) {
    val lines = body.lineSequence().map { it.substringBefore('#').trim() }.toList()
    val catchLines = lines.filter { it.startsWith(".catch") }
    if (catchLines.isEmpty()) return
    val pattern = Regex(
        """^\.catch(?:(all)|\s+(L[^;]+;))\s+\{(:[^\s}]+)\s+\.\.\s+(:[^\s}]+)\}\s+(:[^\s]+)$""",
    )
    val catches = catchLines.map { line ->
        checkNotNull(pattern.matchEntire(line)) { "Unsupported helper catch directive: $line" }
    }
    val labels = mutableMapOf<String, Int>()
    var instructionCount = 0
    lines.forEach { line ->
        when {
            line.isEmpty() -> Unit
            line.startsWith(':') -> {
                check(labels.put(line, instructionCount) == null) { "Duplicate helper label: $line" }
            }
            line.startsWith('.') -> check(
                !line.startsWith(".packed-switch") && !line.startsWith(".sparse-switch") &&
                    !line.startsWith(".array-data"),
            ) { "Catch-bearing helper payloads require full-method assembly" }
            else -> instructionCount++
        }
    }
    val code = checkNotNull(implementation)
    check(instructionCount == code.instructions.size) {
        "Helper catch label/instruction layout drift: $definingClass->$name"
    }
    check(code.tryBlocks.isEmpty()) { "Helper assembler already supplied exception metadata" }
    catches.forEach { match ->
        fun index(group: Int): Int = checkNotNull(labels[match.groupValues[group]]) {
            "Undefined helper catch label: ${match.groupValues[group]}"
        }
        val start = index(3)
        val end = index(4)
        val handler = index(5)
        check(start < end && end <= instructionCount && handler < instructionCount) {
            "Invalid helper exception range: $definingClass->$name"
        }
        val exceptionType = match.groupValues[2].takeIf(String::isNotEmpty)
        code.addCatch(
            exceptionType,
            code.newLabelForIndex(start),
            code.newLabelForIndex(end),
            code.newLabelForIndex(handler),
        )
    }
}

internal const val JETSON_VOICE_SETTINGS_XML = "res/xml/setting_jetson_voice.xml"

internal object RamblerResourceStateStore {
    private val byContext = WeakHashMap<ResourcePatchContext, LinkedHashSet<RamblerFeature>>()

    @Synchronized
    fun markSelected(context: ResourcePatchContext, feature: RamblerFeature) {
        byContext.getOrPut(context) { linkedSetOf() }.add(feature)
    }

    @Synchronized
    fun takeSelected(context: ResourcePatchContext): Set<RamblerFeature> =
        byContext.remove(context) ?: emptySet()
}

internal val ramblerSharedSettingsResourcePatch = resourcePatch(
    description = "Register standalone Rambler Enhancements settings Activity and inject exhaustive Rambler voice typing & Voice typing settings controls.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute { }

    finalize {
        val selected = RamblerResourceStateStore.takeSelected(this)
        if (selected.isEmpty()) return@finalize

        // 1. Register Activity in AndroidManifest.xml with exported=false + internal action
        //    so Android resolves it inside this exact Gboard/GboardWu package even after Package Rename.
        document("AndroidManifest.xml").use { manifestDoc ->
            registerSettingsActivity(manifestDoc)
            if (RamblerFeature.PRODUCTIVITY_TOOLS in selected) {
                ensureLauncherQueries(manifestDoc)
            }
        }

        // 2. Add settings strings (English + Traditional Chinese if present)
        val stringsByFolder = mapOf(
            "values" to listOf(
                "rambler_enhancements_entry_title" to "Rambler Enhancements",
                "rambler_enhancements_entry_summary" to
                    "Waveforms, instructions, dictation behavior, voice actions, dictionary, stats, history, and backup",
                "rambler_enh_pref_instructions_title" to "Instructions & app rules",
                "rambler_enh_pref_instructions_summary" to
                    "Default style prompt, per-app rules & behavior overrides, and disabled apps",
                "rambler_enh_pref_waveform_title" to "Waveform animation (Hex)",
                "rambler_enh_pref_waveform_summary" to
                    "Listening & processing animations, colors, and Hex tuning",
                "rambler_enh_pref_behavior_title" to "Dictation & reliability",
                "rambler_enh_pref_behavior_summary" to
                    "Append-only, cursor editing, app context, trailing period, auto retry, and max duration",
                "rambler_enh_pref_productivity_title" to "Voice actions, snippets & replace",
                "rambler_enh_pref_productivity_summary" to
                    "Hands-free send/search suffixes, voice snippets, and find & replace rules",
                "rambler_enh_pref_dictionary_title" to "Voice dictionary & contacts",
                "rambler_enh_pref_dictionary_summary" to
                    "MUSE_STATS biasing words, import/export, and phone contact names sync",
                "rambler_enh_pref_history_title" to "Dictation stats & history",
                "rambler_enh_pref_history_summary" to
                    "On-device WPM, cloud latency & time-saved stats plus your last 50 dictations",
                "rambler_enh_pref_backup_title" to "Backup & restore (.json)",
                "rambler_enh_pref_backup_summary" to
                    "Export or import all Rambler settings, rules, snippets, and dictionary words",
            ),
            "values-zh-rTW" to zhHantSettingsStrings(),
            "values-b+zh+Hant" to zhHantSettingsStrings(),
        )
        for ((folder, pairs) in stringsByFolder) {
            val path = "res/$folder/strings.xml"
            if (folder != "values" && !get(path).isFile) continue
            document(path).use { doc ->
                for ((name, value) in pairs) {
                    ensureString(doc, name, value)
                }
            }
        }

        var injectedCount = 0

        // 3. Inject exhaustive native controls into Gboard's Rambler voice typing screen
        if (get(JETSON_VOICE_SETTINGS_XML).isFile) {
            document(JETSON_VOICE_SETTINGS_XML).use { doc ->
                injectExhaustiveJetsonVoicePreferences(doc, selected)
            }
            injectedCount++
        }

        // 4. Keep unified Rambler Enhancements entry in Voice typing screens
        val voiceXmls = listOf(
            "res/xml/setting_voice_unified.xml",
            "res/xml/setting_voice.xml",
        )
        for (xmlPath in voiceXmls) {
            if (!get(xmlPath).isFile) continue
            document(xmlPath).use { doc ->
                injectSettingsEntryPreference(doc)
            }
            injectedCount++
        }
        if (injectedCount == 0) {
            throw PatchException(
                "Could not locate any Gboard Voice typing settings XML ($JETSON_VOICE_SETTINGS_XML, ${voiceXmls.joinToString()})",
            )
        }
    }
}

private fun ramblerFeatureSelectionResourcePatch(
    feature: RamblerFeature,
    description: String,
) = resourcePatch(description = description) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(ramblerSharedSettingsResourcePatch)

    execute {
        RamblerResourceStateStore.markSelected(this, feature)
    }
}

internal val ramblerWaveformResourcePatch = ramblerFeatureSelectionResourcePatch(
    RamblerFeature.WAVEFORM,
    "Expose Hex waveform settings directly inside Gboard's Rambler voice typing screen.",
)
internal val ramblerProductivityToolsResourcePatch = ramblerFeatureSelectionResourcePatch(
    RamblerFeature.PRODUCTIVITY_TOOLS,
    "Expose Hands-free voice actions, Snippets, Find/Replace, History, Auto retry, and Backup inside Gboard's Rambler voice typing screen.",
)

private fun zhHantSettingsStrings(): List<Pair<String, String>> = listOf(
    "rambler_enhancements_entry_title" to "Rambler 增強功能",
    "rambler_enhancements_entry_summary" to "聲波動畫、自訂指示、聽寫行為、語音動作、語音辭典、統計、紀錄與備份",
    "rambler_enh_pref_instructions_title" to "自訂指示與應用程式規則",
    "rambler_enh_pref_instructions_summary" to "預設風格指示、各應用程式規則與行為覆寫，以及停用名單",
    "rambler_enh_pref_waveform_title" to "聲波動畫 (Hex)",
    "rambler_enh_pref_waveform_summary" to "聆聽與處理動畫、配色與 Hex 細節微調",
    "rambler_enh_pref_behavior_title" to "聽寫行為與連線穩定性",
    "rambler_enh_pref_behavior_summary" to "僅附加、游標編輯、應用程式情境、去句號、弱網重試與最長時限",
    "rambler_enh_pref_productivity_title" to "語音動作、片語與取代",
    "rambler_enh_pref_productivity_summary" to "語音送出/搜尋後綴、固定語音片語與尋找取代規則",
    "rambler_enh_pref_dictionary_title" to "語音辭典與聯絡人",
    "rambler_enh_pref_dictionary_summary" to "MUSE_STATS 詞彙管理、匯入/匯出與手機聯絡人同步",
    "rambler_enh_pref_history_title" to "聽寫統計與本機紀錄",
    "rambler_enh_pref_history_summary" to "裝置本機字數、語速 WPM、延遲與省時統計，以及最近 50 筆聽寫紀錄",
    "rambler_enh_pref_backup_title" to "備份與還原 (.json)",
    "rambler_enh_pref_backup_summary" to "匯出或匯入所有 Rambler 設定、規則、片語與語音辭典詞彙",
)

internal fun injectExhaustiveJetsonVoicePreferences(
    screenDoc: Document,
    selected: Set<RamblerFeature>,
) {
    if (selected.isEmpty()) return
    val root = screenDoc.documentElement
    val categoryTag = root.preferredCategoryTag()
    // Place our single clean category above Gboard's trailing Help & feedback PreferenceCategory.
    val anchor = root.childElements()
        .lastOrNull { el ->
            el.tagName.endsWith("PreferenceCategory") &&
                !el.containsPreferenceKey("rambler_enh_custom_instructions_entry") &&
                el.androidAttr("key")?.startsWith("rambler_enh_cat_") != true
        }

    fun sectionIntentPreference(
        key: String,
        titleRes: String,
        summaryRes: String,
        section: String,
    ): Element? {
        if (screenDoc.hasPreferenceKey(key)) return null
        val pref = screenDoc.createElement("Preference").apply {
            setAndroidAttr("key", key)
            setAndroidAttr("persistent", "false")
            setAndroidAttr("title", titleRes)
            setAndroidAttr("summary", summaryRes)
        }
        val intent = screenDoc.createElement("intent").apply {
            setAndroidAttr("action", OPEN_SETTINGS_ACTION)
        }
        val extra = screenDoc.createElement("extra").apply {
            setAndroidAttr("name", "section")
            setAndroidAttr("value", section)
        }
        intent.appendChild(extra)
        pref.appendChild(intent)
        return pref
    }

    val categoryKey = "rambler_enh_cat_enhancements"
    if (screenDoc.hasPreferenceKey(categoryKey)) return

    val rows = mutableListOf<Element>()
    if (RamblerFeature.WAVEFORM in selected) {
        sectionIntentPreference(
            key = "rambler_enh_waveform_entry",
            titleRes = "@string/rambler_enh_pref_waveform_title",
            summaryRes = "@string/rambler_enh_pref_waveform_summary",
            section = "waveform",
        )?.let(rows::add)
    }
    if (RamblerFeature.PRODUCTIVITY_TOOLS in selected) {
        sectionIntentPreference(
            key = "rambler_enh_behavior_entry",
            titleRes = "@string/rambler_enh_pref_behavior_title",
            summaryRes = "@string/rambler_enh_pref_behavior_summary",
            section = "behavior",
        )?.let(rows::add)
    }
    if (RamblerFeature.PRODUCTIVITY_TOOLS in selected) {
        sectionIntentPreference(
            key = "rambler_enh_productivity_entry",
            titleRes = "@string/rambler_enh_pref_productivity_title",
            summaryRes = "@string/rambler_enh_pref_productivity_summary",
            section = "productivity",
        )?.let(rows::add)
    }
    if (RamblerFeature.PRODUCTIVITY_TOOLS in selected) {
        sectionIntentPreference(
            key = "rambler_enh_history_entry",
            titleRes = "@string/rambler_enh_pref_history_title",
            summaryRes = "@string/rambler_enh_pref_history_summary",
            section = "history",
        )?.let(rows::add)
    }
    sectionIntentPreference(
        key = "rambler_enh_backup_entry",
        titleRes = "@string/rambler_enh_pref_backup_title",
        summaryRes = "@string/rambler_enh_pref_backup_summary",
        section = "backup",
    )?.let(rows::add)

    if (rows.isEmpty()) return
    val category = screenDoc.createElement(categoryTag).apply {
        setAndroidAttr("key", categoryKey)
        setAndroidAttr("title", "@string/rambler_enhancements_entry_title")
    }
    rows.forEach(category::appendChild)
    if (anchor != null) {
        root.insertBefore(category, anchor)
    } else {
        root.appendChild(category)
    }
}

private fun Document.hasPreferenceKey(key: String): Boolean =
    findPreferenceElementByKey(key) != null

private fun Document.findPreferenceElementByKey(key: String): Element? {
    val all = getElementsByTagName("*")
    for (i in 0 until all.length) {
        val el = all.item(i) as? Element ?: continue
        if (el.androidAttr("key") == key) {
            return el
        }
    }
    return null
}

private fun Element.containsPreferenceKey(key: String): Boolean {
    if (androidAttr("key") == key) return true
    val all = getElementsByTagName("*")
    for (i in 0 until all.length) {
        val el = all.item(i) as? Element ?: continue
        if (el.androidAttr("key") == key) {
            return true
        }
    }
    return false
}

private fun Element.preferredCategoryTag(): String =
    childElements()
        .firstOrNull { it.tagName.endsWith("PreferenceCategory") }
        ?.tagName
        ?: "androidx.preference.PreferenceCategory"

internal fun registerSettingsActivity(manifestDoc: Document) {
    val manifest = manifestDoc.documentElement
    val application = manifest.childElements("application").firstOrNull()
        ?: throw PatchException("AndroidManifest.xml is missing <application>")

    val existing = application.childElements("activity").firstOrNull {
        it.androidAttr("name") == SETTINGS_ACTIVITY_CLASS
    }
    val activity = existing ?: manifestDoc.createElement("activity").also(application::appendChild)
    activity.setAndroidAttr("name", SETTINGS_ACTIVITY_CLASS)
    activity.setAndroidAttr("exported", "false")
    activity.setAndroidAttr("theme", "@android:style/Theme.DeviceDefault.Settings")
    activity.setAndroidAttr("label", "@string/rambler_enhancements_entry_title")

    val filter = activity.childElements("intent-filter").firstOrNull { f ->
        f.childElements("action").any { it.androidAttr("name") == OPEN_SETTINGS_ACTION }
    } ?: manifestDoc.createElement("intent-filter").also(activity::appendChild)

    if (filter.childElements("action").none { it.androidAttr("name") == OPEN_SETTINGS_ACTION }) {
        filter.appendChild(
            manifestDoc.createElement("action").apply {
                setAndroidAttr("name", OPEN_SETTINGS_ACTION)
            },
        )
    }
    if (filter.childElements("category").none { it.androidAttr("name") == "android.intent.category.DEFAULT" }) {
        filter.appendChild(
            manifestDoc.createElement("category").apply {
                setAndroidAttr("name", "android.intent.category.DEFAULT")
            },
        )
    }
}

internal fun ensureLauncherQueries(manifestDoc: Document) {
    val manifest = manifestDoc.documentElement
    val existingQueries = manifest.childElements("queries").firstOrNull()
    val queries = existingQueries ?: manifestDoc.createElement("queries").also {
        val appEl = manifest.childElements("application").firstOrNull()
        if (appEl != null) {
            manifest.insertBefore(it, appEl)
        } else {
            manifest.appendChild(it)
        }
    }
    val hasLauncherIntent = queries.childElements("intent").any { intentEl ->
        intentEl.childElements("action").any { it.androidAttr("name") == "android.intent.action.MAIN" } &&
            intentEl.childElements("category").any { it.androidAttr("name") == "android.intent.category.LAUNCHER" }
    }
    if (!hasLauncherIntent) {
        val intentEl = manifestDoc.createElement("intent").apply {
            appendChild(
                manifestDoc.createElement("action").apply {
                    setAndroidAttr("name", "android.intent.action.MAIN")
                },
            )
            appendChild(
                manifestDoc.createElement("category").apply {
                    setAndroidAttr("name", "android.intent.category.LAUNCHER")
                },
            )
        }
        queries.appendChild(intentEl)
    }
}

internal fun injectSettingsEntryPreference(screenDoc: Document) {
    val root = screenDoc.documentElement
    val allNodes = screenDoc.getElementsByTagName("*")
    for (i in 0 until allNodes.length) {
        val el = allNodes.item(i) as? Element ?: continue
        if (el.androidAttr("key") == "rambler_enhancements_entry") {
            return
        }
    }

    val categoryTag = root.childElements()
        .firstOrNull { it.tagName.endsWith("PreferenceCategory") }
        ?.tagName
        ?: "PreferenceCategory"

    val category = screenDoc.createElement(categoryTag)
    val pref = screenDoc.createElement("Preference").apply {
        setAndroidAttr("key", "rambler_enhancements_entry")
        setAndroidAttr("persistent", "false")
        setAndroidAttr("title", "@string/rambler_enhancements_entry_title")
        setAndroidAttr("summary", "@string/rambler_enhancements_entry_summary")
    }
    val intent = screenDoc.createElement("intent").apply {
        setAndroidAttr("action", OPEN_SETTINGS_ACTION)
    }
    pref.appendChild(intent)
    category.appendChild(pref)
    root.appendChild(category)
}

internal fun ensureString(stringsDoc: Document, name: String, value: String) {
    val root = stringsDoc.documentElement
    if (root.childElements("string").any { it.getAttribute("name") == name }) {
        return
    }
    root.appendChild(
        stringsDoc.createElement("string").apply {
            setAttribute("name", name)
            textContent = value
        },
    )
}

internal fun Element.childElements(tagName: String? = null): List<Element> {
    val result = mutableListOf<Element>()
    val children = childNodes
    for (i in 0 until children.length) {
        val child = children.item(i) as? Element ?: continue
        if (tagName == null || child.tagName == tagName) {
            result.add(child)
        }
    }
    return result
}

internal fun Element.androidAttr(localName: String): String? {
    val ns = getAttributeNS(ANDROID_NS, localName)
    if (ns.isNotBlank()) return ns
    return getAttribute("android:$localName").takeIf { it.isNotBlank() }
}

internal fun Element.setAndroidAttr(localName: String, value: String) {
    setAttributeNS(ANDROID_NS, "android:$localName", value)
}
