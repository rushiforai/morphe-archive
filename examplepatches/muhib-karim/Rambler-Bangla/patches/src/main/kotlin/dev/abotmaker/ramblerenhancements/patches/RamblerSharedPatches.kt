package dev.abotmaker.ramblerenhancements.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
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
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
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
internal const val CUSTOM_INSTR_RULES_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerCustomInstructionRules;"
internal const val TEXT_PIPELINE_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerTextPipeline;"
internal const val DICTATION_STATS_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerDictationStats;"
internal const val TOOLBAR_ACCESS_POINT_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerToolbarAccessPoint;"
internal const val SPACEBAR_TRIGGER_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerSpacebarTrigger;"
internal const val AT_MENTION_STRIP_RUNTIME_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerAtMentionStripRuntime;"

internal enum class RamblerFeature {
    WAVEFORM,
    CUSTOM_INSTRUCTIONS,
    PERSONAL_DICTIONARY,
    CONTACT_NAMES,
    CURSOR_EDITING,
    APP_CONTEXT,
    PRODUCTIVITY_TOOLS,
    BANGLA_LITE_SCRIPT,
    BANGLA_PHONETIC,
    RAMBLER_EXTRAS,
    HIDDEN_FLAGS,
    AT_MENTION_SUGGESTIONS,
}

internal class RamblerPatchRunState {
    val selectedFeatures = linkedSetOf<RamblerFeature>()
    var flagTargets: FlagTargets? = null
    var agenticTargets: AgenticExtensionTargets? = null
    var appendSpacingTargets: AppendSpacingTargets? = null
    var waveformTargets: WaveformTargets? = null
    var museStatsTargets: MuseStatsTargets? = null
    var prefsTargets: PrefsTargets? = null
    var prefLaunchTargets: PreferenceLaunchTargets? = null
    var sessionBundleTargets: SessionBundleTargets? = null
    var activateHookTargets: ActivateHookTargets? = null
    var commitPipelineTargets: CommitPipelineTargets? = null
    var voiceLifecycleTargets: VoiceLifecycleTargets? = null
    var accessPointTargets: AccessPointTargets? = null
    var spacebarTriggerTargets: SpacebarTriggerTargets? = null
    var nativeAtMentionTargets: NativeAtMentionTargets? = null
    var agenticCtorHooked: Boolean = false
}

internal data class NativeAtMentionTargets(
    val imeActiveBundleMethod: String,
    val textCandidatesUpdatedMethod: String,
    val bundleWrapperField: String,
    val wrapperControllerField: String,
    val wrapperActiveMethod: String,
    val controllerAppendMethod: String,
    val candidateClass: String,
    val candidateBuilderClass: String,
)

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

        val needsFlags = state.selectedFeatures.any {
            it == RamblerFeature.CUSTOM_INSTRUCTIONS ||
                it == RamblerFeature.PERSONAL_DICTIONARY ||
                it == RamblerFeature.CURSOR_EDITING ||
                it == RamblerFeature.APP_CONTEXT ||
                it == RamblerFeature.PRODUCTIVITY_TOOLS ||
                it == RamblerFeature.BANGLA_LITE_SCRIPT ||
                it == RamblerFeature.BANGLA_PHONETIC ||
                it == RamblerFeature.RAMBLER_EXTRAS ||
                it == RamblerFeature.HIDDEN_FLAGS ||
                it == RamblerFeature.AT_MENTION_SUGGESTIONS
        }

        if (needsFlags) {
            val flags = state.flagTargets ?: RamblerDynamicResolver.resolveFlagTargets(this).also {
                state.flagTargets = it
            }
            installConflictFreeFlagHook(flags)
        }

        val needsAgenticCtorHook =
            RamblerFeature.PERSONAL_DICTIONARY in state.selectedFeatures ||
                RamblerFeature.CONTACT_NAMES in state.selectedFeatures ||
                RamblerFeature.CURSOR_EDITING in state.selectedFeatures ||
                RamblerFeature.APP_CONTEXT in state.selectedFeatures ||
                RamblerFeature.PRODUCTIVITY_TOOLS in state.selectedFeatures
        if (needsAgenticCtorHook && !state.agenticCtorHooked) {
            val agentic = state.agenticTargets ?: RamblerDynamicResolver.resolveAgenticExtension(this)
                .also { state.agenticTargets = it }
            installAgenticCtorStartupHook(agentic)
            state.agenticCtorHooked = true
        }

        if (RamblerFeature.PERSONAL_DICTIONARY in state.selectedFeatures) {
            val agentic = state.agenticTargets ?: RamblerDynamicResolver.resolveAgenticExtension(this)
                .also { state.agenticTargets = it }
            if (state.museStatsTargets == null) {
                state.museStatsTargets = RamblerDynamicResolver.resolveMuseStatsTargets(
                    this,
                    agentic.contextConstructor,
                )
            }
        }

        val needsPrefs = RamblerFeature.CUSTOM_INSTRUCTIONS in state.selectedFeatures ||
            RamblerFeature.PERSONAL_DICTIONARY in state.selectedFeatures ||
            RamblerFeature.CURSOR_EDITING in state.selectedFeatures ||
            RamblerFeature.APP_CONTEXT in state.selectedFeatures ||
            RamblerFeature.PRODUCTIVITY_TOOLS in state.selectedFeatures
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

        if (RamblerFeature.CUSTOM_INSTRUCTIONS in state.selectedFeatures) {
            val agentic = state.agenticTargets ?: RamblerDynamicResolver.resolveAgenticExtension(this)
                .also { state.agenticTargets = it }
            val sessionBundle = RamblerDynamicResolver.resolveSessionBundleTargets(agentic.extensionClass)
            state.sessionBundleTargets = sessionBundle
            installPerAppCustomInstructionHook(sessionBundle)
        }

        val needsActivateHook =
            RamblerFeature.CUSTOM_INSTRUCTIONS in state.selectedFeatures ||
                RamblerFeature.PRODUCTIVITY_TOOLS in state.selectedFeatures ||
                RamblerFeature.BANGLA_PHONETIC in state.selectedFeatures
        if (needsActivateHook) {
            val agentic = state.agenticTargets ?: RamblerDynamicResolver.resolveAgenticExtension(this)
                .also { state.agenticTargets = it }
            val activateTargets = RamblerDynamicResolver.resolveActivateHookTargets(agentic.extensionClass)
            state.activateHookTargets = activateTargets
            installExtensionActivateHook(activateTargets)
        }

        val needsCommitPipeline =
            RamblerFeature.PRODUCTIVITY_TOOLS in state.selectedFeatures ||
                RamblerFeature.BANGLA_PHONETIC in state.selectedFeatures
        if (needsCommitPipeline) {
            val agentic = state.agenticTargets ?: RamblerDynamicResolver.resolveAgenticExtension(this)
                .also { state.agenticTargets = it }
            val spacing = state.appendSpacingTargets
                ?: RamblerDynamicResolver.resolveAppendSpacingTargets(this, agentic.extensionClass)
                    .also { state.appendSpacingTargets = it }
            val pipelineTargets = RamblerDynamicResolver.resolveCommitPipelineTargets(this, spacing)
            state.commitPipelineTargets = pipelineTargets
            installCommitPipelineHook(pipelineTargets)
            if (RamblerFeature.PRODUCTIVITY_TOOLS in state.selectedFeatures) {
                val lifecycleTargets = RamblerDynamicResolver.resolveVoiceLifecycleTargets(agentic.extensionClass)
                state.voiceLifecycleTargets = lifecycleTargets
                installVoiceLifecycleStatsHooks(lifecycleTargets)
            }
        }

        val prefLaunch = RamblerDynamicResolver.resolvePreferenceLaunchTargets(this)
        state.prefLaunchTargets = prefLaunch
        installExplicitPreferenceLaunchHook(prefLaunch)

        val apTargets = RamblerDynamicResolver.resolveAccessPointTargets(this)
        if (apTargets != null) {
            state.accessPointTargets = apTargets
            installToolbarAccessPointHooks(apTargets)
        }

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

        if (RamblerFeature.AT_MENTION_SUGGESTIONS in state.selectedFeatures) {
            state.nativeAtMentionTargets = installAtMentionLifecycleHooks(this)
        }

        rewriteDynamicConfigClinit(state)
    }
}

internal fun installAtMentionLifecycleHooks(context: BytecodePatchContext): NativeAtMentionTargets {
    val inputViewType = "Lcom/google/android/libraries/inputmethod/inputview/InputView;"
    var imeClassType: String? = null
    var inputViewFieldName: String? = null
    val classByType = hashMapOf<String, ClassDef>()
    var inputBundleClass: ClassDef? = null

    context.classDefForEach { cls ->
        classByType[cls.type] = cls
        val field = cls.instanceFields.firstOrNull { it.type == inputViewType }
        if (field != null) {
            val hasStart = cls.methods.any {
                it.name == "onStartInputView" &&
                    it.parameterTypes.map { p -> p.toString() } == listOf("Landroid/view/inputmethod/EditorInfo;", "Z") &&
                    it.returnType == "V"
            }
            val hasSel = cls.methods.any {
                it.name == "onUpdateSelection" &&
                    it.parameterTypes.map { p -> p.toString() } == listOf("I", "I", "I", "I", "I", "I") &&
                    it.returnType == "V"
            }
            val hasHidden = cls.methods.any {
                it.name == "onWindowHidden" && it.parameterTypes.isEmpty() && it.returnType == "V"
            }
            if (hasStart && hasSel && hasHidden) {
                if (imeClassType != null) {
                    throw PatchException(
                        "FAIL-CLOSED: Multiple InputMethodService classes own InputView field: $imeClassType and ${cls.type}",
                    )
                }
                imeClassType = cls.type
                inputViewFieldName = field.name
            }
        }
        val hasInputBundleTag = cls.methods.any { m ->
            m.implementation?.instructions?.any { insn ->
                ((insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                    ?.reference as? StringReference)?.string == "InputBundle.activate"
            } == true
        }
        if (hasInputBundleTag) {
            if (inputBundleClass != null && inputBundleClass!!.type != cls.type) {
                throw PatchException(
                    "FAIL-CLOSED: Multiple InputBundle classes found: ${inputBundleClass!!.type} and ${cls.type}",
                )
            }
            inputBundleClass = cls
        }
    }
    val resolvedClass = imeClassType
        ?: throw PatchException("FAIL-CLOSED: Could not find InputMethodService class with $inputViewType field")
    val resolvedField = inputViewFieldName!!
    val imeClass = context.mutableClassDefBy(resolvedClass)
    installAtMentionLifecycleHooksOnClass(
        imeClass = imeClass,
        inputViewFieldRef = "$resolvedClass->$resolvedField:$inputViewType",
    )

    val bundleDef = inputBundleClass
        ?: throw PatchException("FAIL-CLOSED: Could not locate Gboard InputBundle class for native @mention strip")
    val bundleType = bundleDef.type

    // 1. Resolve InputBundle.textCandidatesUpdated(Z)V (K) + wrapper/controller/candidate types
    // Uniquely identified on InputBundle as the (Z)V method that calls wrapper.p()Z and controller.l(Z)V.
    val textCandidatesMethod = bundleDef.methods.singleOrNull { m ->
        m.parameterTypes.map { it.toString() } == listOf("Z") &&
            m.returnType == "V" &&
            m.implementation?.instructions?.any { insn ->
                insn.opcode == Opcode.INVOKE_VIRTUAL && run {
                    val mr = (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                        ?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
                    mr != null && mr.parameterTypes.isEmpty() && mr.returnType == "Z"
                }
            } == true
    } ?: throw PatchException(
        "FAIL-CLOSED: Could not find InputBundle.textCandidatesUpdated(Z)V on $bundleType",
    )

    val tcInsns = textCandidatesMethod.implementation!!.instructions.toList()
    val bundleWrapperFieldRef = tcInsns.mapNotNull { insn ->
        if (insn.opcode == Opcode.IGET_OBJECT) {
            val f = (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                ?.reference as? FieldReference
            if (f != null && f.definingClass == bundleType) f else null
        } else {
            null
        }
    }.firstOrNull() ?: throw PatchException(
        "FAIL-CLOSED: Could not resolve KeyboardWrapper field in $bundleType->${textCandidatesMethod.name}",
    )
    val wrapperType = bundleWrapperFieldRef.type
    val wrapperControllerFieldRef = tcInsns.mapNotNull { insn ->
        if (insn.opcode == Opcode.IGET_OBJECT) {
            val f = (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                ?.reference as? FieldReference
            if (f != null && f.definingClass == wrapperType) f else null
        } else {
            null
        }
    }.firstOrNull() ?: throw PatchException(
        "FAIL-CLOSED: Could not resolve candidate controller field on $wrapperType",
    )
    val wrapperActiveMethodRef = tcInsns.mapNotNull { insn ->
        if (insn.opcode == Opcode.INVOKE_VIRTUAL) {
            val m = (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                ?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
            if (m != null && m.definingClass == wrapperType && m.parameterTypes.isEmpty() && m.returnType == "Z") {
                m
            } else {
                null
            }
        } else {
            null
        }
    }.firstOrNull()

    val controllerType = wrapperControllerFieldRef.type
    val controllerDef = classByType[controllerType]
        ?: throw PatchException("FAIL-CLOSED: Missing candidate controller class $controllerType")
    val appendMethod = controllerDef.methods.singleOrNull { m ->
        m.returnType == "V" &&
            m.parameterTypes.size == 3 &&
            m.parameterTypes[0].toString() == "Ljava/util/List;" &&
            m.parameterTypes[1].toString().startsWith("L") &&
            m.parameterTypes[2].toString() == "Z"
    } ?: throw PatchException(
        "FAIL-CLOSED: Could not find appendTextCandidates(List, Candidate, Z)V on $controllerType",
    )
    val candidateType = appendMethod.parameterTypes[1].toString()
    val candidateDef = classByType[candidateType]
        ?: throw PatchException("FAIL-CLOSED: Missing Candidate class $candidateType")
    val builderType = candidateDef.methods.singleOrNull { m ->
        m.name == "<init>" && m.parameterTypes.size == 1 && m.parameterTypes[0].toString().startsWith("L")
    }?.parameterTypes?.single()?.toString()
        ?: throw PatchException("FAIL-CLOSED: Could not find Candidate(Builder) constructor on $candidateType")

    // 2. Resolve IKeyboardDelegate.requestCandidates(IZ)V (pbo.aa)
    fun hasBundleField(cls: ClassDef): Boolean {
        var cur: ClassDef? = cls
        var hops = 0
        while (cur != null && hops < 5) {
            if (cur.instanceFields.any { it.type == bundleType }) return true
            cur = classByType[cur.superclass]
            hops++
        }
        return false
    }
    val delegateMatches = mutableListOf<Pair<ClassDef, com.android.tools.smali.dexlib2.iface.Method>>()
    for (cls in classByType.values) {
        if (!hasBundleField(cls)) continue
        for (m in cls.methods) {
            if (m.parameterTypes.map { it.toString() } == listOf("I", "Z") && m.returnType == "V") {
                val callsImeReq = m.implementation?.instructions?.any { insn ->
                    insn.opcode == Opcode.INVOKE_INTERFACE && run {
                        val mr = (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                            ?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
                        mr != null &&
                            mr.parameterTypes.map { it.toString() } == listOf("I", "Z") &&
                            mr.returnType == "V"
                    }
                } == true
                if (callsImeReq) {
                    delegateMatches.add(cls to m)
                }
            }
        }
    }
    val (delegateClassDef, requestCandidatesMethod) = delegateMatches.singleOrNull()
        ?: throw PatchException(
            "FAIL-CLOSED: Expected 1 IKeyboardDelegate.requestCandidates(IZ)V referencing $bundleType, found ${delegateMatches.size}",
        )

    // 3. Resolve GoogleInputMethodService.getActiveInputBundle()Lpbh; and handleEvent(Lohe;)Z
    val activeBundleMethod = imeClass.methods.singleOrNull { m ->
        m.parameterTypes.isEmpty() && m.returnType == bundleType
    } ?: throw PatchException(
        "FAIL-CLOSED: Could not find getActiveInputBundle()$bundleType on ${imeClass.type}",
    )

    val handleEventMethod = imeClass.methods.singleOrNull { m ->
        m.returnType == "Z" &&
            m.parameterTypes.size == 1 &&
            m.parameterTypes[0].toString().startsWith("L") &&
            (m.implementation?.instructions?.size ?: 0) > 100 &&
            run {
                val eventCls = classByType[m.parameterTypes[0].toString()]
                eventCls?.instanceFields?.any { it.name == "b" && it.type.startsWith("[L") } == true
            }
    } ?: throw PatchException(
        "FAIL-CLOSED: Could not find handleEvent(Event)Z on ${imeClass.type}",
    )

    // 4. Install the 3 native suggestion-strip hooks (all idempotent)
    val mutableBundle = context.mutableClassDefBy(bundleType)
    val mutableTcMethod = mutableBundle.methods.single {
        it.name == textCandidatesMethod.name &&
            it.parameterTypes.map { p -> p.toString() } == listOf("Z") &&
            it.returnType == "V"
    }
    installNativeTextCandidatesUpdatedHook(mutableTcMethod)

    val mutableDelegate = context.mutableClassDefBy(delegateClassDef.type)
    val mutableReqMethod = mutableDelegate.methods.single {
        it.name == requestCandidatesMethod.name &&
            it.parameterTypes.map { p -> p.toString() } == listOf("I", "Z") &&
            it.returnType == "V"
    }
    installNativeRequestCandidatesHook(mutableReqMethod)

    installNativeHandleEventHook(handleEventMethod)

    return NativeAtMentionTargets(
        imeActiveBundleMethod = activeBundleMethod.name,
        textCandidatesUpdatedMethod = textCandidatesMethod.name,
        bundleWrapperField = bundleWrapperFieldRef.name,
        wrapperControllerField = wrapperControllerFieldRef.name,
        wrapperActiveMethod = wrapperActiveMethodRef?.name ?: "p",
        controllerAppendMethod = appendMethod.name,
        candidateClass = candidateType.removePrefix("L").removeSuffix(";").replace('/', '.'),
        candidateBuilderClass = builderType.removePrefix("L").removeSuffix(";").replace('/', '.'),
    )
}

internal fun installNativeTextCandidatesUpdatedHook(method: MutableMethod) {
    val insns = method.implementation?.instructions
        ?: throw PatchException("textCandidatesUpdated has no implementation")
    val alreadyHooked = insns.any {
        (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
            ?.reference?.toString()?.contains("RamblerAtMentionStripRuntime;->onTextCandidatesUpdated") == true
    }
    if (alreadyHooked) return
    method.addInstructions(
        0,
        """
        invoke-static {p0, p1}, $AT_MENTION_STRIP_RUNTIME_TYPE->onTextCandidatesUpdated(Ljava/lang/Object;Z)Z
        move-result p1
        """.trimIndent(),
    )
}

internal fun installNativeRequestCandidatesHook(method: MutableMethod) {
    val insns = method.implementation?.instructions
        ?: throw PatchException("requestCandidates has no implementation")
    val alreadyHooked = insns.any {
        (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
            ?.reference?.toString()?.contains("RamblerAtMentionStripRuntime;->trySupplyNativeCandidatesFromDelegate") == true
    }
    if (alreadyHooked) return
    method.addInstructionsWithLabels(
        0,
        """
        invoke-static {p0, p1}, $AT_MENTION_STRIP_RUNTIME_TYPE->trySupplyNativeCandidatesFromDelegate(Ljava/lang/Object;I)Z
        move-result v0
        if-eqz v0, :rambler_stock_request_candidates
        return-void
        """.trimIndent(),
        ExternalLabel("rambler_stock_request_candidates", method.getInstruction(0)),
    )
}

internal fun installNativeHandleEventHook(method: MutableMethod) {
    val insns = method.implementation?.instructions
        ?: throw PatchException("handleEvent has no implementation")
    val alreadyHooked = insns.any {
        (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
            ?.reference?.toString()?.contains("RamblerAtMentionStripRuntime;->tryHandleNativeCandidateEvent") == true
    }
    if (alreadyHooked) return
    method.addInstructionsWithLabels(
        0,
        """
        invoke-static/range {p0 .. p1}, $AT_MENTION_STRIP_RUNTIME_TYPE->tryHandleNativeCandidateEvent(Ljava/lang/Object;Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :rambler_stock_handle_event
        const/4 v0, 0x1
        return v0
        """.trimIndent(),
        ExternalLabel("rambler_stock_handle_event", method.getInstruction(0)),
    )
}

internal fun installAtMentionLifecycleHooksOnClass(
    imeClass: MutableClass,
    inputViewFieldRef: String,
) {
    val helperName = "ramblerBanglaAtMentionSelection"
    val helperRef = "${imeClass.type}->$helperName(II)V"

    // 1. Hook onStartInputView right after any leading invoke-static hooks (e.g. Manual Incognito)
    val onStart = imeClass.methods.single {
        it.name == "onStartInputView" &&
            it.parameterTypes.map { p -> p.toString() } == listOf("Landroid/view/inputmethod/EditorInfo;", "Z") &&
            it.returnType == "V"
    }
    val startInsns = onStart.implementation?.instructions
        ?: throw PatchException("onStartInputView has no implementation")
    val alreadyHasStart = startInsns.any {
        (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
            ?.reference?.toString()?.contains("RamblerAtMentionStripRuntime;->onInputViewStarted") == true
    }
    if (!alreadyHasStart) {
        var insertAt = 0
        while (insertAt < startInsns.size &&
            (startInsns[insertAt].opcode == Opcode.INVOKE_STATIC ||
                startInsns[insertAt].opcode == Opcode.INVOKE_STATIC_RANGE)
        ) {
            insertAt++
        }
        onStart.addInstructions(
            insertAt,
            "invoke-static/range {p0 .. p1}, $AT_MENTION_STRIP_RUNTIME_TYPE->onInputViewStarted(Ljava/lang/Object;Landroid/view/inputmethod/EditorInfo;)V",
        )
    }

    // 2. Add private helper and hook onUpdateSelection after any leading invoke-direct helper (e.g. Calculator)
    imeClass.addHelperMethodIfMissing(
        name = helperName,
        parameterTypes = listOf("I", "I"),
        returnType = "V",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 4,
        body = """
            iget-object v0, p0, $inputViewFieldRef
            invoke-static {p0, v0, p1, p2}, $AT_MENTION_STRIP_RUNTIME_TYPE->onSelectionUpdated(Ljava/lang/Object;Landroid/view/View;II)V
            return-void
        """.trimIndent(),
    )
    val onUpdate = imeClass.methods.single {
        it.name == "onUpdateSelection" &&
            it.parameterTypes.map { p -> p.toString() } == listOf("I", "I", "I", "I", "I", "I") &&
            it.returnType == "V"
    }
    val updateInsns = onUpdate.implementation?.instructions
        ?: throw PatchException("onUpdateSelection has no implementation")
    val alreadyHasUpdate = updateInsns.any {
        (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
            ?.reference?.toString() == helperRef
    }
    if (!alreadyHasUpdate) {
        var insertAt = 0
        while (insertAt < updateInsns.size &&
            (updateInsns[insertAt].opcode == Opcode.INVOKE_DIRECT ||
                updateInsns[insertAt].opcode == Opcode.INVOKE_DIRECT_RANGE)
        ) {
            insertAt++
        }
        val useRange = (onUpdate.implementation?.registerCount ?: 8) > 16
        if (useRange) {
            throw PatchException("FAIL-CLOSED: Unexpected registerCount > 16 in ${imeClass.type}->onUpdateSelection")
        }
        onUpdate.addInstructions(
            insertAt,
            "invoke-direct {p0, p3, p4}, $helperRef",
        )
    }

    // 3. Hook onWindowHidden at entry
    val onHidden = imeClass.methods.single {
        it.name == "onWindowHidden" && it.parameterTypes.isEmpty() && it.returnType == "V"
    }
    val hiddenInsns = onHidden.implementation?.instructions
        ?: throw PatchException("onWindowHidden has no implementation")
    val alreadyHasHidden = hiddenInsns.any {
        (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
            ?.reference?.toString()?.contains("RamblerAtMentionStripRuntime;->onInputWindowHidden") == true
    }
    if (!alreadyHasHidden) {
        onHidden.addInstructions(
            0,
            "invoke-static {}, $AT_MENTION_STRIP_RUNTIME_TYPE->onInputWindowHidden()V",
        )
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

internal fun installPerAppCustomInstructionHook(targets: SessionBundleTargets) {
    // Replace each `return-object vX` IN PLACE so any branch targeting that return's label
    // (for example `if-eqz v4, :return_bundle` when App context is off and Default prompt is empty)
    // lands on `applyPerAppCustomInstruction(vX)` before returning, then append `return-object vX`
    // immediately after it. Iterating in reverse keeps earlier indices and index 0 stable.
    for ((retIndex, bundleReg) in targets.returnIndicesAndRegisters.asReversed()) {
        targets.bundleMethod.replaceInstruction(
            retIndex,
            "invoke-static {v$bundleReg}, $CUSTOM_INSTR_RULES_TYPE->applyPerAppCustomInstruction(Landroid/os/Bundle;)V",
        )
        targets.bundleMethod.addInstructions(
            retIndex + 1,
            "return-object v$bundleReg",
        )
    }
    targets.bundleMethod.addInstructions(
        0,
        "invoke-static {p0}, $CUSTOM_INSTR_RULES_TYPE->captureSessionContext(Ljava/lang/Object;)V",
    )
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
        // Use addInstructionsWithLabels (even with no external labels) so Morphe rebinds
        // the internal `:rambler_stock_initial_state` label to `wrapper`'s implementation.
        // Plain `addInstructions` leaves internal labels bound to the temporary inline-smali
        // method, which breaks branch offsets if another patch ever prepends instructions.
        wrapper.addInstructionsWithLabels(
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

    // 4. Observe keyboard touch release via a branchless wrapper on SoftKeyboardView.dispatchTouchEvent(MotionEvent)Z
    //    for Hold-to-Talk & Smart Hybrid modes.
    //    Wrapping (rename existing method verbatim -> branchless wrapper) instead of prepending with
    //    `addInstructions(0, ...)` guarantees zero instruction shifts in any existing wrapper installed
    //    by another patch pack (notably GboardWu v4.5.0+'s GboardClipboardSelectAllPatch, whose wrapper
    //    contains an internal `:stock` branch compiled via `addInstructions` that would otherwise
    //    become a zero-offset branch VerifyError at [0x7] when shifted by 3 code units).
    val softKeyboardClass = targets.softKeyboardViewClass
    val dispatchTouch = targets.softKeyboardDispatchTouchMethod
    val dispatchImpl = dispatchTouch?.implementation
    val dispatchTouchHelperName = "morpheRamblerStockDispatchTouch"
    if (softKeyboardClass != null && dispatchTouch != null && dispatchImpl != null &&
        softKeyboardClass.methods.none { it.name == dispatchTouchHelperName }
    ) {
        val touchParams = listOf(
            ImmutableMethodParameter("Landroid/view/MotionEvent;", emptySet(), null),
        )
        val touchAccess = dispatchTouch.accessFlags
        val touchAnnotations = dispatchTouch.annotations
        val touchHiddenApi = dispatchTouch.hiddenApiRestrictions

        softKeyboardClass.methods.remove(dispatchTouch)

        val renamedDispatch = ImmutableMethod(
            softKeyboardClass.type,
            dispatchTouchHelperName,
            touchParams,
            "Z",
            AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
            emptySet(),
            emptySet(),
            dispatchImpl,
        ).toMutable()
        softKeyboardClass.methods.add(renamedDispatch)

        val touchWrapper = ImmutableMethod(
            softKeyboardClass.type,
            "dispatchTouchEvent",
            touchParams,
            "Z",
            touchAccess,
            touchAnnotations,
            touchHiddenApi,
            MutableMethodImplementation(3),
        ).toMutable()
        touchWrapper.addInstructions(
            0,
            """
            invoke-static {p1}, $SPACEBAR_TRIGGER_TYPE->onKeyboardTouchEvent(Landroid/view/MotionEvent;)V
            invoke-direct {p0, p1}, ${softKeyboardClass.type}->$dispatchTouchHelperName(Landroid/view/MotionEvent;)Z
            move-result v0
            return v0
            """.trimIndent(),
        )
        softKeyboardClass.methods.add(touchWrapper)
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

    // Selected feature gates
    putBool("FEATURE_WAVEFORM", RamblerFeature.WAVEFORM in state.selectedFeatures)
    putBool("FEATURE_CUSTOM_INSTRUCTIONS", RamblerFeature.CUSTOM_INSTRUCTIONS in state.selectedFeatures)
    putBool("FEATURE_PERSONAL_DICTIONARY", RamblerFeature.PERSONAL_DICTIONARY in state.selectedFeatures)
    putBool("FEATURE_CONTACT_NAMES", RamblerFeature.CONTACT_NAMES in state.selectedFeatures)
    putBool("FEATURE_CURSOR_EDITING", RamblerFeature.CURSOR_EDITING in state.selectedFeatures)
    putBool("FEATURE_APP_CONTEXT", RamblerFeature.APP_CONTEXT in state.selectedFeatures)
    putBool("FEATURE_PRODUCTIVITY_TOOLS", RamblerFeature.PRODUCTIVITY_TOOLS in state.selectedFeatures)
    putBool("FEATURE_BANGLA_LITE_SCRIPT", RamblerFeature.BANGLA_LITE_SCRIPT in state.selectedFeatures)
    putBool("FEATURE_BANGLA_PHONETIC", RamblerFeature.BANGLA_PHONETIC in state.selectedFeatures)
    putBool("FEATURE_RAMBLER_EXTRAS", RamblerFeature.RAMBLER_EXTRAS in state.selectedFeatures)
    putBool("FEATURE_HIDDEN_FLAGS", RamblerFeature.HIDDEN_FLAGS in state.selectedFeatures)
    putBool("FEATURE_AT_MENTION_SUGGESTIONS", RamblerFeature.AT_MENTION_SUGGESTIONS in state.selectedFeatures)

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

    // MUSE_STATS / Protobuf bindings (resolved or 18.5.4 defaults)
    val ms = state.museStatsTargets
    putStr("MODULE_LOAD_METHOD", ms?.moduleLoadMethod ?: "b")
    putStr("UFC_INTERFACE_CLASS", ms?.ufcInterfaceClass ?: "see")
    putStr("UFC_FEATURE_ENUM_CLASS", ms?.ufcFeatureEnumClass ?: "sdo")
    putStr("UFC_ENUM_FROM_ID_METHOD", ms?.ufcEnumFromIdMethod ?: "a")
    putStr("UFC_READ_METHOD", ms?.ufcReadMethod ?: "c")
    putStr("UFC_UPDATE_METHOD", ms?.ufcUpdateMethod ?: "n")
    putStr("FUNCTION_INTERFACE_CLASS", ms?.functionInterfaceClass ?: "wgh")
    putStr("MUSE_STATS_CLASS", ms?.museStatsClass ?: "scf")
    putStr("MUSE_STATS_DEFAULT_FIELD", ms?.museStatsDefaultField ?: "a")
    putStr("MUSE_STATS_WORDS_FIELD", ms?.museStatsWordsField ?: "b")
    putStr("MUSE_WORD_CLASS", ms?.museWordClass ?: "sce")
    putStr("MUSE_WORD_DEFAULT_FIELD", ms?.museWordDefaultField ?: "a")
    putStr("MUSE_WORD_TEXT_FIELD", ms?.museWordTextField ?: "b")
    putStr("PROTO_BASE_CLASS", ms?.protoBaseClass ?: "aaln")
    putStr("PROTO_BUILDER_CLASS", ms?.protoBuilderClass ?: "aali")
    putStr("PROTO_LIST_CLASS", ms?.protoListClass ?: "aamd")
    putStr("PROTO_PARSE_METHOD", ms?.protoParseMethod ?: "t")
    putStr("PROTO_TO_BUILDER_METHOD", ms?.protoToBuilderMethod ?: "o")
    putStr("PROTO_MUTABLE_COPY_METHOD", ms?.protoMutableCopyMethod ?: "E")
    putStr("BUILDER_COPY_ON_WRITE_METHOD", ms?.builderCopyOnWriteMethod ?: "t")
    putStr("BUILDER_BUILD_METHOD", ms?.builderBuildMethod ?: "o")
    putStr("BUILDER_INSTANCE_FIELD", ms?.builderInstanceField ?: "b")
    putStr("LIST_IS_MODIFIABLE_METHOD", ms?.listIsModifiableMethod ?: "c")

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

    // AgenticDictationExtension fields for per-app custom instructions (resolved or 18.5.4 defaults)
    val bundle = state.sessionBundleTargets
    putStr(
        "AGENTIC_CONTEXT_FIELD",
        bundle?.contextField ?: state.activateHookTargets?.contextField ?: "b",
    )
    putStr("AGENTIC_EDITOR_INFO_FIELD", bundle?.editorInfoField ?: "h")

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
    putStr("SPACEBAR_LP_EVENT_ACTION_FIELD", sp?.eventActionField ?: "a")
    putStr("SPACEBAR_LP_KEYDATA_CODE_FIELD", sp?.keyDataCodeField ?: "c")
    putStr("SPACEBAR_LP_KEYDATA_DATA_FIELD", sp?.keyDataDataField ?: "e")
    putStr("SPACEBAR_LP_EXT_GET_CONTEXT_METHOD", sp?.extGetContextMethod ?: "ac")
    putStr("SPACEBAR_LP_AGENTIC_IS_ACTIVE_METHOD", sp?.agenticIsActiveMethod ?: "ag")
    putStr("SPACEBAR_LP_AGENTIC_TRIGGER_METHOD", sp?.agenticTriggerMethod ?: "C")
    putStr("SPACEBAR_LP_AGENTIC_CLASS", sp?.agenticClassName ?: "fhv")
    putStr("SPACEBAR_LP_AGENTIC_UI_MANAGER_FIELD", sp?.agenticUiManagerField ?: "c")
    putStr("SPACEBAR_LP_UI_MANAGER_GET_STATE_METHOD", sp?.uiManagerGetStateMethod ?: "h")

    // Native Gboard suggestion-strip @mention bindings (resolved or 18.5.4 defaults)
    val am = state.nativeAtMentionTargets
    putStr("AT_MENTION_IME_ACTIVE_BUNDLE_METHOD", am?.imeActiveBundleMethod ?: "ah")
    putStr("AT_MENTION_TEXT_CANDIDATES_UPDATED_METHOD", am?.textCandidatesUpdatedMethod ?: "K")
    putStr("AT_MENTION_BUNDLE_WRAPPER_FIELD", am?.bundleWrapperField ?: "k")
    putStr("AT_MENTION_WRAPPER_CONTROLLER_FIELD", am?.wrapperControllerField ?: "s")
    putStr("AT_MENTION_WRAPPER_ACTIVE_METHOD", am?.wrapperActiveMethod ?: "p")
    putStr("AT_MENTION_CONTROLLER_APPEND_METHOD", am?.controllerAppendMethod ?: "c")
    putStr("AT_MENTION_CANDIDATE_CLASS", am?.candidateClass ?: "owu")
    putStr("AT_MENTION_CANDIDATE_BUILDER_CLASS", am?.candidateBuilderClass ?: "owr")

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

internal const val CUSTOM_INSTRUCTION_PREF_KEY = "pref_key_rambler_custom_instruction"
internal const val USE_DICTIONARY_WORDS_PREF_KEY = "pref_rambler_use_dictionary_words"
internal const val APPEND_ONLY_PREF_KEY = "pref_rambler_append_only"
internal const val CURSOR_EDITING_PREF_KEY = "pref_rambler_cursor_editing_enabled"
internal const val RESELECT_AFTER_EDIT_PREF_KEY = "pref_rambler_reselect_after_edit"
internal const val APP_CONTEXT_PREF_KEY = "pref_rambler_app_context_enabled"
internal const val AUTO_PARALLEL_RETRY_PREF_KEY = "pref_rambler_auto_parallel_retry"
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
            if (RamblerFeature.CUSTOM_INSTRUCTIONS in selected ||
                RamblerFeature.PRODUCTIVITY_TOOLS in selected
            ) {
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
                "rambler_enh_pref_bangla_title" to "Rambler Bangla (phonetic & script)",
                "rambler_enh_pref_bangla_summary" to
                    "Bengali Unicode voice script policy, phonetic & multilingual engine, and diagnostics",
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
internal val ramblerCustomInstructionsResourcePatch = ramblerFeatureSelectionResourcePatch(
    RamblerFeature.CUSTOM_INSTRUCTIONS,
    "Expose Custom instructions directly inside Gboard's Rambler voice typing screen.",
)
internal val ramblerPersonalDictionaryResourcePatch = ramblerFeatureSelectionResourcePatch(
    RamblerFeature.PERSONAL_DICTIONARY,
    "Expose Use dictionary words toggle and Voice dictionary manager inside Gboard's Rambler voice typing screen.",
)
internal val ramblerContactNamesResourcePatch = ramblerFeatureSelectionResourcePatch(
    RamblerFeature.CONTACT_NAMES,
    "Expose Contact names sync inside Gboard's Rambler voice typing screen.",
)
internal val ramblerCursorEditingResourcePatch = ramblerFeatureSelectionResourcePatch(
    RamblerFeature.CURSOR_EDITING,
    "Expose Append-only dictation and Cursor-aware editing toggles inside Gboard's Rambler voice typing screen.",
)
internal val ramblerAppContextResourcePatch = ramblerFeatureSelectionResourcePatch(
    RamblerFeature.APP_CONTEXT,
    "Expose App context toggle inside Gboard's Rambler voice typing screen.",
)
internal val ramblerProductivityToolsResourcePatch = ramblerFeatureSelectionResourcePatch(
    RamblerFeature.PRODUCTIVITY_TOOLS,
    "Expose Hands-free voice actions, Snippets, Find/Replace, History, Auto retry, and Backup inside Gboard's Rambler voice typing screen.",
)
internal val ramblerBanglaLiteScriptResourcePatch = ramblerFeatureSelectionResourcePatch(
    RamblerFeature.BANGLA_LITE_SCRIPT,
    "Expose Rambler Bangla script policy controls inside Gboard's Rambler voice typing screen.",
)
internal val ramblerBanglaPhoneticResourcePatch = ramblerFeatureSelectionResourcePatch(
    RamblerFeature.BANGLA_PHONETIC,
    "Expose Rambler Bangla phonetic & multilingual engine controls inside Gboard's Rambler voice typing screen.",
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
    "rambler_enh_pref_bangla_title" to "Rambler Bangla（孟加拉語音與拼字）",
    "rambler_enh_pref_bangla_summary" to "孟加拉文 Unicode 腳本保護、拼音與多語聽寫引擎與診斷開關",
)

internal fun addCustomInstructionPrefIdempotently(screenDoc: Document) {
    if (screenDoc.hasPreferenceKey("rambler_enh_custom_instructions_entry")) return
    val root = screenDoc.documentElement
    val categoryTag = root.preferredCategoryTag()
    val category = screenDoc.createElement(categoryTag).apply {
        setAndroidAttr("key", "rambler_enh_cat_instructions")
    }
    val pref = screenDoc.createElement("Preference").apply {
        setAndroidAttr("key", "rambler_enh_custom_instructions_entry")
        setAndroidAttr("persistent", "false")
        setAndroidAttr("title", "@string/rambler_enh_pref_instructions_title")
        setAndroidAttr("summary", "@string/rambler_enh_pref_instructions_summary")
    }
    val intent = screenDoc.createElement("intent").apply {
        setAndroidAttr("action", OPEN_SETTINGS_ACTION)
    }
    val extra = screenDoc.createElement("extra").apply {
        setAndroidAttr("name", "section")
        setAndroidAttr("value", "custom_instructions")
    }
    intent.appendChild(extra)
    pref.appendChild(intent)
    category.appendChild(pref)
    root.insertBefore(category, root.firstChild)
}

internal fun injectExhaustiveJetsonVoicePreferences(
    screenDoc: Document,
    selected: Set<RamblerFeature>,
) {
    if (selected.isEmpty()) return
    if (RamblerFeature.CUSTOM_INSTRUCTIONS in selected) {
        addCustomInstructionPrefIdempotently(screenDoc)
    }

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
    if (RamblerFeature.BANGLA_LITE_SCRIPT in selected || RamblerFeature.BANGLA_PHONETIC in selected) {
        sectionIntentPreference(
            key = "rambler_enh_bangla_entry",
            titleRes = "@string/rambler_enh_pref_bangla_title",
            summaryRes = "@string/rambler_enh_pref_bangla_summary",
            section = "bangla",
        )?.let(rows::add)
    }
    if (RamblerFeature.WAVEFORM in selected) {
        sectionIntentPreference(
            key = "rambler_enh_waveform_entry",
            titleRes = "@string/rambler_enh_pref_waveform_title",
            summaryRes = "@string/rambler_enh_pref_waveform_summary",
            section = "waveform",
        )?.let(rows::add)
    }
    if (RamblerFeature.CURSOR_EDITING in selected ||
        RamblerFeature.APP_CONTEXT in selected ||
        RamblerFeature.PRODUCTIVITY_TOOLS in selected
    ) {
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
    if (RamblerFeature.PERSONAL_DICTIONARY in selected || RamblerFeature.CONTACT_NAMES in selected) {
        sectionIntentPreference(
            key = "rambler_enh_dictionary_entry",
            titleRes = "@string/rambler_enh_pref_dictionary_title",
            summaryRes = "@string/rambler_enh_pref_dictionary_summary",
            section = "dictionary",
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
