package dev.abotmaker.ramblerenhancements.patches

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal data class FlagTargets(
    val flagClass: MutableClass,
    val flagNameField: String,
    val recomputeMethod: MutableMethod,
    val notifyMethod: String,
    val resolvedValueRegister: Int,
    val insertIndex: Int,
)

internal data class AgenticExtensionTargets(
    val extensionClass: MutableClass,
    val contextConstructor: MutableMethod,
    val contextParamIndex: Int,
)

internal data class AppendSpacingTargets(
    val extensionClass: MutableClass,
    val targetMethod: MutableMethod,
    val callIndex: Int,
    val pcnRegister: Int,
    val textRegister: Int,
    val pcnType: String,
    val commitMethodName: String,
    val surroundingMethodName: String,
    val pdxType: String,
    val beforeCursorMethodName: String,
    val afterCursorMethodName: String,
)

internal data class WaveformTargets(
    val shaderType: String,
    val drawableClass: MutableClass,
    val drawMethod: MutableMethod,
    val attachMethod: MutableMethod,
    val speechLevelMethod: MutableMethod,
    val drawableShaderField: String,
    val drawableCornerRadiusField: String,
    val shaderProcessingField: String,
    val shaderCollapsingField: String,
    val shaderExitFadeField: String,
    val shaderGlobalAlphaField: String,
)

internal data class MuseStatsTargets(
    val moduleLoadMethod: String,
    val ufcInterfaceClass: String,
    val ufcFeatureEnumClass: String,
    val ufcEnumFromIdMethod: String,
    val ufcReadMethod: String,
    val ufcUpdateMethod: String,
    val functionInterfaceClass: String,
    val museStatsClass: String,
    val museStatsDefaultField: String,
    val museStatsWordsField: String,
    val museWordClass: String,
    val museWordDefaultField: String,
    val museWordTextField: String,
    val protoBaseClass: String,
    val protoBuilderClass: String,
    val protoListClass: String,
    val protoParseMethod: String,
    val protoToBuilderMethod: String,
    val protoMutableCopyMethod: String,
    val builderCopyOnWriteMethod: String,
    val builderBuildMethod: String,
    val builderInstanceField: String,
    val listIsModifiableMethod: String,
)

internal data class PrefsTargets(
    val prefsClass: String,
    val getInstanceMethod: String,
    val readStringMethod: String,
    val writeStringMethod: String,
)

internal data class PreferenceLaunchTargets(
    val preferenceClass: MutableClass,
    val performClickMethod: MutableMethod,
    val contextField: String,
    val intentField: String,
)

internal data class SessionBundleTargets(
    val bundleMethod: MutableMethod,
    val contextField: String,
    val editorInfoField: String,
    val returnIndicesAndRegisters: List<Pair<Int, Int>>,
)

internal data class ActivateHookTargets(
    val activateMethod: MutableMethod,
    val contextField: String,
)

internal data class CommitPipelineTargets(
    val targetMethod: MutableMethod,
    val insertIndex: Int,
    val pcnRegister: Int,
    val textRegister: Int,
    val pcnGetEditorInfoMethod: String,
    val pcnPerformActionMethod: String,
)

internal data class VoiceLifecycleTargets(
    val onVoiceStartMethod: MutableMethod,
    val onListeningStopMethod: MutableMethod,
)

internal data class AccessPointTargets(
    val orderFactoryMethod: MutableMethod,
    val controllerConstructor: MutableMethod,
    val immutableSetType: String,
    val controllerClass: String,
    val controllerOrderHelperField: String,
    val controllerRegisterMethod: String,
    val orderHelperClass: String,
    val orderHelperCatalogField: String,
    val immutableSetClass: String,
    val immutableSetCopyMethod: String,
    val descriptorClass: String,
    val descriptorBuilderFactoryMethod: String,
    val builderBaseClass: String,
    val builderConcreteClass: String,
    val builderTokenMethod: String,
    val builderRunnableMethod: String,
    val builderBuildMethod: String,
    val builderIconField: String,
    val builderLabelField: String,
)

internal data class SpacebarTriggerTargets(
    val langPickerClass: MutableClass,
    val consumeEventMethod: MutableMethod,
    val initialStateMethod: MutableMethod,
    val softKeyboardViewClass: MutableClass?,
    val softKeyboardDispatchTouchMethod: MutableMethod?,
    val eventGetKeyDataMethod: String,
    val eventActionField: String,
    val keyDataCodeField: String,
    val keyDataDataField: String,
    val extGetContextMethod: String,
    val agenticIsActiveMethod: String,
    val agenticTriggerMethod: String,
    val agenticClassName: String,
    val agenticUiManagerField: String,
    val uiManagerGetStateMethod: String,
)

internal object RamblerDynamicResolver {
    private const val CONTEXT_TYPE = "Landroid/content/Context;"
    private const val INTENT_TYPE = "Landroid/content/Intent;"
    private const val BUNDLE_TYPE = "Landroid/os/Bundle;"
    private const val EDITOR_INFO_TYPE = "Landroid/view/inputmethod/EditorInfo;"
    private const val ANDROIDX_PREFERENCE_TYPE = "Landroidx/preference/Preference;"
    private const val VIEW_TYPE = "Landroid/view/View;"
    private const val CANVAS_TYPE = "Landroid/graphics/Canvas;"
    private const val CHAR_SEQUENCE_TYPE = "Ljava/lang/CharSequence;"
    private const val STRING_TYPE = "Ljava/lang/String;"
    private const val OBJECT_TYPE = "Ljava/lang/Object;"
    private const val OBJECT_ARRAY_TYPE = "[Ljava/lang/Object;"
    private const val RUNTIME_SHADER_TYPE = "Landroid/graphics/RuntimeShader;"
    private const val DRAWABLE_TYPE = "Landroid/graphics/drawable/Drawable;"
    private const val MODULE_MANAGER_TYPE =
        "Lcom/google/android/libraries/inputmethod/module/ModuleManager;"
    private const val USER_FEATURE_CACHE_TYPE =
        "Lcom/google/android/libraries/inputmethod/userfeaturecache/UserFeatureCache;"

    private const val AGENTIC_EXTENSION_LOG_TAG =
        "com/google/android/apps/inputmethod/libs/agenticdictation/extension/AgenticDictationExtension"
    private const val ABSTRACT_UI_CONTROLLER_LOG_TAG =
        "com/google/android/apps/inputmethod/libs/agenticdictation/ui/impl/AbstractRamblerUiController"

    private const val FLOAT_BITS_0_25 = 0x3e800000
    private const val FLOAT_BITS_0_75 = 0x3f400000
    private const val FLOAT_BITS_1_3 = 0x3fa66666

    fun resolvePreferenceLaunchTargets(context: BytecodePatchContext): PreferenceLaunchTargets {
        val prefClassDef = context.classDefByOrNull(ANDROIDX_PREFERENCE_TYPE)
            ?: throw PatchException("Could not locate $ANDROIDX_PREFERENCE_TYPE in target APK")
        val prefClass = context.mutableClassDefBy(prefClassDef.type)

        val performClick = prefClass.methods.firstOrNull { method ->
            method.parameterTypes.isEmpty() &&
                method.returnType == "V" &&
                method.hasInstruction { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == CONTEXT_TYPE &&
                        ref.name == "startActivity" &&
                        ref.parameterTypes.map { it.toString() } == listOf(INTENT_TYPE)
                }
        } ?: throw PatchException(
            "Could not locate performClick()V calling Context.startActivity(Intent) on $ANDROIDX_PREFERENCE_TYPE",
        )

        val insns = performClick.implementation?.instructions?.toList().orEmpty()
        val intentField = insns.asReversed().firstNotNullOfOrNull { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
            if (insn.opcode == Opcode.IGET_OBJECT &&
                ref?.definingClass == ANDROIDX_PREFERENCE_TYPE &&
                ref.type == INTENT_TYPE
            ) {
                ref.name
            } else {
                null
            }
        } ?: prefClass.instanceFields.firstOrNull { it.type == INTENT_TYPE }?.name
            ?: throw PatchException("Could not locate Intent field on $ANDROIDX_PREFERENCE_TYPE")

        val contextField = insns.asReversed().firstNotNullOfOrNull { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
            if (insn.opcode == Opcode.IGET_OBJECT &&
                ref?.definingClass == ANDROIDX_PREFERENCE_TYPE &&
                ref.type == CONTEXT_TYPE
            ) {
                ref.name
            } else {
                null
            }
        } ?: prefClass.instanceFields.firstOrNull { it.type == CONTEXT_TYPE }?.name
            ?: throw PatchException("Could not locate Context field on $ANDROIDX_PREFERENCE_TYPE")

        return PreferenceLaunchTargets(
            preferenceClass = prefClass,
            performClickMethod = performClick,
            contextField = contextField,
            intentField = intentField,
        )
    }

    fun resolveFlagTargets(context: BytecodePatchContext): FlagTargets {
        var flagClassDef: ClassDef? = null
        context.classDefForEach { cls ->
            if (flagClassDef != null) return@classDefForEach
            val strings = cls.collectStrings()
            if (strings.contains("Clearing default value is disallowed [") &&
                strings.contains("Resetting default value is disallowed [") &&
                strings.contains("Invalid flag: ")
            ) {
                flagClassDef = cls
            }
        }
        val foundClassDef = flagClassDef ?: throw PatchException(
            "Could not locate Gboard's internal flag class (expected strings like " +
                "'Clearing default value is disallowed ['). This Gboard version may be unsupported.",
        )
        val flagClass = context.mutableClassDefBy(foundClassDef.type)

        val flagNameField = flagClass.instanceFields.singleOrNull { it.type == STRING_TYPE }?.name
            ?: throw PatchException(
                "Could not uniquely resolve flag name String field on ${flagClass.type}",
            )

        val recomputeMethod = flagClass.methods.singleOrNull { method ->
            method.parameterTypes.isEmpty() &&
                method.returnType == "Z" &&
                (method.accessFlags and AccessFlags.PRIVATE.value) != 0 &&
                method.hasInstruction { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    insn.opcode == Opcode.INVOKE_DIRECT &&
                        ref?.name == "<init>" &&
                        ref.parameterTypes.map { it.toString() } == listOf(OBJECT_TYPE, "I")
                }
        } ?: throw PatchException(
            "Could not locate internal flag recompute ()Z method on ${flagClass.type}",
        )

        val notifyMethod = findFlagNotifyMethod(flagClass, recomputeMethod.name)
            ?: throw PatchException(
                "Could not locate flag listener notify ()V method on ${flagClass.type}",
            )

        val instructions = recomputeMethod.implementation?.instructions
            ?: throw PatchException("Flag recompute method ${recomputeMethod.name} has no body")

        // Identify the resolved value register (v8 in 18.5.4) via <okr>-><init>(Object, I)V
        // and verify it matches Object.equals(prev, resolved) or Objects.deepEquals(prev, resolved).
        val snapshotCtorCall = instructions.firstOrNull { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            insn.opcode in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) &&
                ref?.name == "<init>" &&
                ref.parameterTypes.map { it.toString() } == listOf(OBJECT_TYPE, "I")
        } ?: throw PatchException("Could not locate flag snapshot constructor call in ${flagClass.type}->${recomputeMethod.name}")

        val resolvedValueReg = when (snapshotCtorCall) {
            is FiveRegisterInstruction -> snapshotCtorCall.registerD
            is RegisterRangeInstruction -> snapshotCtorCall.startRegister + 1
            else -> throw PatchException("Unexpected snapshot constructor opcode ${snapshotCtorCall.opcode}")
        }

        // Find the first aget-object reading from this.g ([Ljava/lang/Object;) into resolvedValueReg.
        val arrayLoadIndex = instructions.indices.firstOrNull { idx ->
            val insn = instructions[idx]
            insn.opcode == Opcode.AGET_OBJECT &&
                (insn as? OneRegisterInstruction)?.registerA == resolvedValueReg
        } ?: throw PatchException("Could not find array layer load in ${flagClass.type}->${recomputeMethod.name}")

        // Find the first Object.equals / Objects.deepEquals comparing old and resolvedValueReg.
        val equalsIndex = instructions.indices.firstOrNull { idx ->
            if (idx <= arrayLoadIndex) return@firstOrNull false
            val ref = (instructions[idx] as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@firstOrNull false
            (ref.definingClass == OBJECT_TYPE && ref.name == "equals") ||
                ref.name == "deepEquals"
        } ?: throw PatchException("Could not find equality check in ${flagClass.type}->${recomputeMethod.name}")

        // Find the `if-eqz vSnapshot, ...` guarding the comparison block right after the layer loop.
        // We pick the snapshot register from instruction 0 (`iget-object v0, p0, Loki;.f:Lokr;`).
        val snapshotReg = instructions.firstOrNull { insn ->
            insn.opcode == Opcode.IGET_OBJECT &&
                ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.definingClass == flagClass.type &&
                ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.type != OBJECT_ARRAY_TYPE
        }?.let { (it as? TwoRegisterInstruction)?.registerA }
            ?: throw PatchException("Could not identify snapshot field register in ${flagClass.type}->${recomputeMethod.name}")

        // The convergence block after the loop runs `const/4 ...` then `if-eqz vSnapshot, ...`
        // (checking `if (okrVar != null)`) before comparing `vPrev` and `vResolved`. Inserting right
        // at the FIRST `if-eqz vSnapshot` after `arrayLoadIndex` executes on EVERY loop exit path
        // (including first-time creation when `okrVar == null`!). Using `lastOrNull` would falsely
        // match a later `if-eqz` after R8 reuses `vSnapshot` for `this.e` inside `if (okrVar != null)`.
        val insertIndex = findPostLoopSnapshotCheckIndex(
            instructions = instructions,
            arrayLoadIndex = arrayLoadIndex,
            equalsIndex = equalsIndex,
            snapshotReg = snapshotReg,
        ) ?: throw PatchException(
            "Could not locate post-loop snapshot check in ${flagClass.type}->${recomputeMethod.name}",
        )

        val registerCount = recomputeMethod.implementation!!.registerCount
        val thisReg = registerCount - 1
        if (resolvedValueReg > 15 || thisReg > 15) {
            throw PatchException(
                "Flag recompute registers exceed 4-bit invoke range: this=v$thisReg, value=v$resolvedValueReg",
            )
        }

        return FlagTargets(
            flagClass = flagClass,
            flagNameField = flagNameField,
            recomputeMethod = recomputeMethod,
            notifyMethod = notifyMethod,
            resolvedValueRegister = resolvedValueReg,
            insertIndex = insertIndex,
        )
    }

    internal fun findPostLoopSnapshotCheckIndex(
        instructions: List<Instruction>,
        arrayLoadIndex: Int,
        equalsIndex: Int,
        snapshotReg: Int,
    ): Int? {
        for (idx in (arrayLoadIndex + 1) until equalsIndex) {
            val insn = instructions[idx]
            if (insn.opcode == Opcode.IF_EQZ &&
                (insn as? OneRegisterInstruction)?.registerA == snapshotReg
            ) {
                return idx
            }
            // Stop if snapshotReg is overwritten before we hit its post-loop null check.
            if (insn is OneRegisterInstruction &&
                insn.opcode.setsRegister() &&
                insn.registerA == snapshotReg
            ) {
                return null
            }
        }
        return null
    }

    private fun findFlagNotifyMethod(flagClass: MutableClass, recomputeName: String): String? {
        // In q(olk, Object) / l(olk) / n(Object, Z), immediately after invoke-direct recomputeMethod,
        // Gboard invokes `this.<notify>()` when recompute returned true.
        for (method in flagClass.methods) {
            if (method.name == recomputeName) continue
            val insns = method.implementation?.instructions ?: continue
            val callIdx = insns.indices.firstOrNull { idx ->
                val ref = (insns[idx] as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == flagClass.type && ref.name == recomputeName && ref.parameterTypes.isEmpty()
            } ?: continue
            for (idx in (callIdx + 1) until minOf(insns.size, callIdx + 12)) {
                val ref = (insns[idx] as? ReferenceInstruction)?.reference as? MethodReference
                    ?: continue
                if (ref.definingClass == flagClass.type &&
                    ref.parameterTypes.isEmpty() &&
                    ref.returnType == "V" &&
                    ref.name != "<init>"
                ) {
                    return ref.name
                }
            }
        }
        return null
    }

    fun resolveAgenticExtension(context: BytecodePatchContext): AgenticExtensionTargets {
        var agenticDef: ClassDef? = null
        context.classDefForEach { cls ->
            if (agenticDef != null) return@classDefForEach
            val hasContextCtor = cls.methods.any { method ->
                method.name == "<init>" &&
                    method.parameterTypes.isNotEmpty() &&
                    method.parameterTypes.first().toString() == CONTEXT_TYPE
            }
            if (!hasContextCtor) return@classDefForEach
            val strings = cls.collectStrings()
            if (strings.contains(AGENTIC_EXTENSION_LOG_TAG)) {
                agenticDef = cls
            }
        }
        val found = agenticDef ?: throw PatchException(
            "Could not locate AgenticDictationExtension with <init>(Context, ...) in target APK. This Gboard version may be unsupported.",
        )
        val extensionClass = context.mutableClassDefBy(found.type)
        val ctor = extensionClass.methods.first { method ->
            method.name == "<init>" &&
                method.parameterTypes.isNotEmpty() &&
                method.parameterTypes.first().toString() == CONTEXT_TYPE
        }
        return AgenticExtensionTargets(
            extensionClass = extensionClass,
            contextConstructor = ctor,
            contextParamIndex = 1, // p0 = this, p1 = Context
        )
    }

    fun resolveSessionBundleTargets(extensionClass: MutableClass): SessionBundleTargets {
        val bundleMethod = extensionClass.methods.singleOrNull { method ->
            method.returnType == BUNDLE_TYPE &&
                method.containsString("user_preferences") &&
                method.containsString("{CUSTOM_INSTRUCTION}")
        } ?: throw PatchException(
            "Could not uniquely locate AgenticDictationExtension Bundle builder containing " +
                "'user_preferences' and '{CUSTOM_INSTRUCTION}' on ${extensionClass.type}",
        )

        val impl = bundleMethod.implementation
            ?: throw PatchException("Session Bundle builder ${bundleMethod.name} has no body")
        val insns = impl.instructions.toList()

        val contextField = insns.firstNotNullOfOrNull { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
            if (insn.opcode == Opcode.IGET_OBJECT &&
                ref?.definingClass == extensionClass.type &&
                ref.type == CONTEXT_TYPE
            ) {
                ref.name
            } else {
                null
            }
        } ?: extensionClass.instanceFields.firstOrNull { it.type == CONTEXT_TYPE }?.name
            ?: throw PatchException("Could not resolve Context field on ${extensionClass.type}")

        val editorInfoField = insns.firstNotNullOfOrNull { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
            if (insn.opcode == Opcode.IGET_OBJECT &&
                ref?.definingClass == extensionClass.type &&
                ref.type == EDITOR_INFO_TYPE
            ) {
                ref.name
            } else {
                null
            }
        } ?: extensionClass.instanceFields.firstOrNull { it.type == EDITOR_INFO_TYPE }?.name
            ?: throw PatchException("Could not resolve EditorInfo field on ${extensionClass.type}")

        val returns = insns.mapIndexedNotNull { idx, insn ->
            if (insn.opcode == Opcode.RETURN_OBJECT) {
                idx to (insn as OneRegisterInstruction).registerA
            } else {
                null
            }
        }
        if (returns.isEmpty()) {
            throw PatchException("Session Bundle builder ${bundleMethod.name} has no return-object")
        }
        val paramWords = bundleMethod.parameterTypes.sumOf {
            if (it.toString() == "J" || it.toString() == "D") 2 else 1
        }
        val thisReg = impl.registerCount - 1 - paramWords
        if (thisReg > 15 || returns.any { (_, reg) -> reg > 15 }) {
            throw PatchException(
                "Session Bundle builder registers exceed 4-bit invoke range: this=v$thisReg, returns=$returns",
            )
        }
        return SessionBundleTargets(
            bundleMethod = bundleMethod,
            contextField = contextField,
            editorInfoField = editorInfoField,
            returnIndicesAndRegisters = returns,
        )
    }

    fun resolveAppendSpacingTargets(
        context: BytecodePatchContext,
        extensionClass: MutableClass,
    ): AppendSpacingTargets {
        data class Candidate(
            val method: MutableMethod,
            val callIndex: Int,
            val ref: MethodReference,
        )
        val candidates = mutableListOf<Candidate>()
        for (method in extensionClass.methods) {
            val insns = method.implementation?.instructions ?: continue
            insns.forEachIndexed { idx, insn ->
                if (insn.opcode != Opcode.INVOKE_INTERFACE && insn.opcode != Opcode.INVOKE_INTERFACE_RANGE) {
                    return@forEachIndexed
                }
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@forEachIndexed
                if (ref.parameterTypes.map { it.toString() } == listOf("I", "I", CHAR_SEQUENCE_TYPE) &&
                    ref.returnType == "Z"
                ) {
                    candidates.add(Candidate(method, idx, ref))
                }
            }
        }
        val hit = candidates.singleOrNull() ?: throw PatchException(
            "Expected exactly 1 Rambler direct-append commit call (IILjava/lang/CharSequence;)Z " +
                "in ${extensionClass.type}, found ${candidates.size}",
        )

        val pcnType = hit.ref.definingClass
        val pcnClass = context.classDefByOrNull(pcnType) ?: throw PatchException(
            "Could not resolve input connection interface $pcnType",
        )

        // Find (III)L<pdx>; on pcn where <pdx> has two ()CharSequence methods calling subSequence.
        var resolvedSurroundingMethod: String? = null
        var resolvedPdxType: String? = null
        var resolvedBefore: String? = null
        var resolvedAfter: String? = null

        for (method in pcnClass.methods) {
            if (method.parameterTypes.map { it.toString() } != listOf("I", "I", "I")) continue
            val retType = method.returnType
            if (!retType.startsWith("L")) continue
            val pdxClass = context.classDefByOrNull(retType) ?: continue
            val pair = resolveSurroundingTextBeforeAfter(pdxClass)
            if (pair != null) {
                resolvedSurroundingMethod = method.name
                resolvedPdxType = retType
                resolvedBefore = pair.first
                resolvedAfter = pair.second
                break
            }
        }

        if (resolvedSurroundingMethod == null || resolvedPdxType == null ||
            resolvedBefore == null || resolvedAfter == null
        ) {
            throw PatchException(
                "Could not dynamically resolve surrounding-text (III) and before/after CharSequence methods from $pcnType",
            )
        }

        val callInstruction = hit.method.implementation!!.instructions[hit.callIndex]
        val (pcnReg, textReg) = when (callInstruction.opcode) {
            Opcode.INVOKE_INTERFACE -> {
                val five = callInstruction as FiveRegisterInstruction
                five.registerC to five.registerF
            }
            Opcode.INVOKE_INTERFACE_RANGE -> {
                val range = callInstruction as RegisterRangeInstruction
                range.startRegister to (range.startRegister + 3)
            }
            else -> throw PatchException("Unexpected append commit opcode ${callInstruction.opcode}")
        }
        if (pcnReg > 15 || textReg > 15) {
            throw PatchException(
                "Append commit registers exceed 4-bit invoke range: pcn=v$pcnReg, text=v$textReg",
            )
        }

        return AppendSpacingTargets(
            extensionClass = extensionClass,
            targetMethod = hit.method,
            callIndex = hit.callIndex,
            pcnRegister = pcnReg,
            textRegister = textReg,
            pcnType = pcnType,
            commitMethodName = hit.ref.name,
            surroundingMethodName = resolvedSurroundingMethod,
            pdxType = resolvedPdxType,
            beforeCursorMethodName = resolvedBefore,
            afterCursorMethodName = resolvedAfter,
        )
    }

    fun resolveActivateHookTargets(extensionClass: MutableClass): ActivateHookTargets {
        val activateMethod = extensionClass.methods.singleOrNull { method ->
            method.parameterTypes.map { it.toString() } == listOf(EDITOR_INFO_TYPE) &&
                method.returnType == "V" &&
                method.containsString("onActivateInternal")
        } ?: throw PatchException(
            "Could not uniquely locate onActivateInternal(EditorInfo)V on ${extensionClass.type}",
        )
        val impl = activateMethod.implementation
            ?: throw PatchException("onActivateInternal ${activateMethod.name} has no body")
        if (impl.registerCount < 2) {
            throw PatchException(
                "onActivateInternal ${activateMethod.name} has unexpected register count ${impl.registerCount}",
            )
        }
        val contextField = extensionClass.instanceFields
            .firstOrNull { it.type == CONTEXT_TYPE }
            ?.name
            ?: "b"
        return ActivateHookTargets(
            activateMethod = activateMethod,
            contextField = contextField,
        )
    }

    fun resolveCommitPipelineTargets(
        context: BytecodePatchContext,
        spacing: AppendSpacingTargets,
    ): CommitPipelineTargets {
        val insns = spacing.targetMethod.implementation?.instructions?.toList()
            ?: throw PatchException("Commit target method ${spacing.targetMethod.name} has no body")

        // Walk backward from the direct-append call (spacing.callIndex) to the `if-eqz` branch
        // that separates direct-append from diff-edit, then find the `beginBatchEdit()V` call
        // on `pcn` right before that branch. Inserting at `beginBatchIndex + 1` transforms
        // `vText` for BOTH direct-append and diff-edit paths while keeping incoming jump labels
        // pointing at `beginBatchEdit`.
        val branchIdx = ((spacing.callIndex - 1) downTo maxOf(0, spacing.callIndex - 16))
            .firstOrNull { idx -> insns[idx].opcode == Opcode.IF_EQZ }
            ?: throw PatchException(
                "Could not locate direct-append branch before callIndex=${spacing.callIndex} in " +
                    "${spacing.extensionClass.type}->${spacing.targetMethod.name}",
            )

        val beginBatchIdx = ((branchIdx - 1) downTo maxOf(0, branchIdx - 16))
            .firstOrNull { idx ->
                val insn = insns[idx]
                if (insn.opcode != Opcode.INVOKE_INTERFACE && insn.opcode != Opcode.INVOKE_INTERFACE_RANGE) {
                    return@firstOrNull false
                }
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@firstOrNull false
                if (ref.definingClass != spacing.pcnType ||
                    ref.parameterTypes.isNotEmpty() ||
                    ref.returnType != "V"
                ) {
                    return@firstOrNull false
                }
                val recvReg = when (insn) {
                    is FiveRegisterInstruction -> insn.registerC
                    is RegisterRangeInstruction -> insn.startRegister
                    else -> -1
                }
                recvReg == spacing.pcnRegister
            } ?: throw PatchException(
            "Could not locate beginBatchEdit()V on ${spacing.pcnType} before branchIdx=$branchIdx in " +
                "${spacing.extensionClass.type}->${spacing.targetMethod.name}",
        )

        val pcnClass = context.classDefByOrNull(spacing.pcnType) ?: throw PatchException(
            "Could not resolve input connection interface ${spacing.pcnType}",
        )
        val getEditorInfoMethod = pcnClass.methods.singleOrNull { method ->
            method.parameterTypes.isEmpty() && method.returnType == EDITOR_INFO_TYPE
        }?.name ?: throw PatchException(
            "Could not resolve ()EditorInfo method on ${spacing.pcnType}",
        )

        var performActionMethod: String? = null
        context.classDefForEach { cls ->
            if (performActionMethod != null) return@classDefForEach
            if (!cls.interfaces.contains(spacing.pcnType)) return@classDefForEach
            val found = cls.methods.firstOrNull { method ->
                method.parameterTypes.map { it.toString() } == listOf("I") &&
                    method.returnType == "V" &&
                    method.containsString("InputConnectionWrapper.performEditorAction")
            }
            if (found != null) {
                performActionMethod = found.name
            }
        }
        val resolvedPerformAction = performActionMethod ?: throw PatchException(
            "Could not resolve performEditorAction(I)V implementation of ${spacing.pcnType}",
        )

        return CommitPipelineTargets(
            targetMethod = spacing.targetMethod,
            insertIndex = beginBatchIdx + 1,
            pcnRegister = spacing.pcnRegister,
            textRegister = spacing.textRegister,
            pcnGetEditorInfoMethod = getEditorInfoMethod,
            pcnPerformActionMethod = resolvedPerformAction,
        )
    }

    fun resolveVoiceLifecycleTargets(extensionClass: MutableClass): VoiceLifecycleTargets {
        val onVoiceStart = extensionClass.methods.singleOrNull { method ->
            method.returnType == "V" &&
                method.containsString("onVoiceStart")
        } ?: throw PatchException(
            "Could not uniquely locate onVoiceStart(...)V on ${extensionClass.type}",
        )
        val onListeningStop = extensionClass.methods.singleOrNull { method ->
            method.parameterTypes.isEmpty() &&
                method.returnType == "V" &&
                method.containsString("onListeningStop")
        } ?: throw PatchException(
            "Could not uniquely locate onListeningStop()V on ${extensionClass.type}",
        )
        return VoiceLifecycleTargets(
            onVoiceStartMethod = onVoiceStart,
            onListeningStopMethod = onListeningStop,
        )
    }

    private fun resolveSurroundingTextBeforeAfter(pdxClass: ClassDef): Pair<String, String>? {
        var beforeMethod: String? = null
        var afterMethod: String? = null
        for (method in pdxClass.methods) {
            if (method.parameterTypes.isNotEmpty() || method.returnType != CHAR_SEQUENCE_TYPE) continue
            val insns = method.implementation?.instructions?.toList() ?: continue
            val callsSubSequence = insns.any { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == CHAR_SEQUENCE_TYPE && ref.name == "subSequence"
            }
            if (!callsSubSequence) continue
            val callsLength = insns.any { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == CHAR_SEQUENCE_TYPE && ref.name == "length"
            }
            val passesZeroStart = insns.any { insn ->
                insn is NarrowLiteralInstruction && insn.narrowLiteral == 0
            }
            if (callsLength) {
                afterMethod = method.name
            } else if (passesZeroStart) {
                beforeMethod = method.name
            }
        }
        return if (beforeMethod != null && afterMethod != null) {
            beforeMethod to afterMethod
        } else {
            null
        }
    }

    fun resolveWaveformTargets(context: BytecodePatchContext): WaveformTargets {
        // 1. Find Rambler light-bar RuntimeShader subclass (fkm in 18.5.4).
        var shaderClassDef: ClassDef? = null
        context.classDefForEach { cls ->
            if (shaderClassDef != null) return@classDefForEach
            if (cls.superclass != RUNTIME_SHADER_TYPE) return@classDefForEach
            val strings = cls.collectStrings()
            if (strings.any { it.contains("uniform float globalAlpha;") && it.contains("featuredRoundedRect") }) {
                shaderClassDef = cls
            }
        }
        val shaderDef = shaderClassDef ?: throw PatchException(
            "Could not locate Rambler light-bar RuntimeShader class (AGSL globalAlpha/featuredRoundedRect). " +
                "This Gboard version may have refactored the Rambler light bar.",
        )

        // 2. Find light-bar Drawable subclass (fkl in 18.5.4) that owns a field of type shaderDef.type.
        var drawableClassDef: ClassDef? = null
        var drawableShaderField: String? = null
        context.classDefForEach { cls ->
            if (drawableClassDef != null) return@classDefForEach
            if (cls.superclass != DRAWABLE_TYPE) return@classDefForEach
            val field = cls.instanceFields.firstOrNull { it.type == shaderDef.type } ?: return@classDefForEach
            drawableClassDef = cls
            drawableShaderField = field.name
        }
        val foundDrawableDef = drawableClassDef ?: throw PatchException(
            "Could not locate Rambler light-bar Drawable holding ${shaderDef.type}",
        )
        val drawableClass = context.mutableClassDefBy(foundDrawableDef.type)
        val drawMethod = drawableClass.methods.singleOrNull { method ->
            method.name == "draw" &&
                method.parameterTypes.map { it.toString() } == listOf(CANVAS_TYPE) &&
                method.returnType == "V"
        } ?: throw PatchException("Could not locate draw(Canvas)V on ${drawableClass.type}")

        // Corner radius field: float instance field on drawableClass read inside draw(Canvas).
        val cornerRadiusField = drawMethod.implementation?.instructions
            ?.mapNotNull { insn ->
                if (insn.opcode != Opcode.IGET) return@mapNotNull null
                val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
                if (ref?.definingClass == drawableClass.type && ref.type == "F") ref.name else null
            }
            ?.firstOrNull()
            ?: drawableClass.instanceFields.firstOrNull { it.type == "F" }?.name
            ?: throw PatchException("Could not resolve corner-radius float field on ${drawableClass.type}")

        // 3. Find speech-level method (I, <drawable>, View)V and attach method (View, <drawable>)V,
        //    plus shader processing/collapsing/exitFade/globalAlpha fields!
        var speechLevelOwner: String? = null
        var speechLevelName: String? = null
        var attachOwner: String? = null
        var attachName: String? = null
        var processingField: String? = null
        var globalAlphaField: String? = null
        var exitFadeField: String? = null
        var collapsingField: String? = null

        context.classDefForEach { cls ->
            for (method in cls.methods) {
                val params = method.parameterTypes.map { it.toString() }
                if (speechLevelOwner == null &&
                    method.returnType == "V" &&
                    params == listOf("I", drawableClass.type, VIEW_TYPE)
                ) {
                    speechLevelOwner = cls.type
                    speechLevelName = method.name
                }
                if (attachOwner == null &&
                    method.returnType == "V" &&
                    params == listOf(VIEW_TYPE, drawableClass.type)
                ) {
                    val isUiController = cls.collectStrings().contains(ABSTRACT_UI_CONTROLLER_LOG_TAG) ||
                        method.hasInstruction { insn ->
                            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                            ref?.definingClass == VIEW_TYPE && ref.name == "setBackground"
                        }
                    if (isUiController) {
                        attachOwner = cls.type
                        attachName = method.name
                    }
                }
                if (processingField == null &&
                    method.containsString("in_noiseRatio") &&
                    method.containsFloatLiteral(FLOAT_BITS_1_3)
                ) {
                    processingField = findTrueBooleanFieldWrite(method, shaderDef.type)
                }
                if ((globalAlphaField == null || exitFadeField == null || collapsingField == null) &&
                    method.name == "doFrame" &&
                    params == listOf("J") &&
                    method.containsString("globalAlpha") &&
                    method.referencesType(shaderDef.type)
                ) {
                    val fields = resolveShaderDoFrameFields(method, shaderDef.type)
                    if (fields != null) {
                        globalAlphaField = fields.globalAlpha
                        exitFadeField = fields.exitFade
                        collapsingField = fields.collapsing
                    }
                }
            }
        }

        val resolvedSpeechOwner = speechLevelOwner ?: throw PatchException(
            "Could not locate Rambler speech-level method (I, ${drawableClass.type}, View)V",
        )
        val resolvedAttachOwner = attachOwner ?: throw PatchException(
            "Could not locate Rambler attach method (View, ${drawableClass.type})V",
        )
        val resolvedProcessing = processingField ?: throw PatchException(
            "Could not locate processing boolean field on ${shaderDef.type}",
        )
        val resolvedGlobalAlpha = globalAlphaField ?: throw PatchException(
            "Could not locate globalAlpha float field on ${shaderDef.type}",
        )
        val resolvedExitFade = exitFadeField ?: throw PatchException(
            "Could not locate exit-fade boolean field on ${shaderDef.type}",
        )
        val resolvedCollapsing = collapsingField ?: throw PatchException(
            "Could not locate collapsing boolean field on ${shaderDef.type}",
        )

        val speechLevelMethod = context.mutableClassDefBy(resolvedSpeechOwner).methods.single {
            it.name == speechLevelName &&
                it.parameterTypes.map { p -> p.toString() } == listOf("I", drawableClass.type, VIEW_TYPE)
        }
        val attachMethod = context.mutableClassDefBy(resolvedAttachOwner).methods.single {
            it.name == attachName &&
                it.parameterTypes.map { p -> p.toString() } == listOf(VIEW_TYPE, drawableClass.type)
        }

        return WaveformTargets(
            shaderType = shaderDef.type,
            drawableClass = drawableClass,
            drawMethod = drawMethod,
            attachMethod = attachMethod,
            speechLevelMethod = speechLevelMethod,
            drawableShaderField = drawableShaderField!!,
            drawableCornerRadiusField = cornerRadiusField,
            shaderProcessingField = resolvedProcessing,
            shaderCollapsingField = resolvedCollapsing,
            shaderExitFadeField = resolvedExitFade,
            shaderGlobalAlphaField = resolvedGlobalAlpha,
        )
    }

    private data class DoFrameShaderFields(
        val globalAlpha: String,
        val exitFade: String,
        val collapsing: String,
    )

    private fun resolveShaderDoFrameFields(method: Method, shaderType: String): DoFrameShaderFields? {
        val insns = method.implementation?.instructions?.toList() ?: return null
        // 1. globalAlpha: float field on shaderType read right before setFloatUniform("globalAlpha", vReg).
        var globalAlpha: String? = null
        for (i in insns.indices) {
            val strRef = (insns[i] as? ReferenceInstruction)?.reference as? StringReference
            if (strRef?.string == "globalAlpha") {
                for (j in i until minOf(insns.size, i + 8)) {
                    val fRef = (insns[j] as? ReferenceInstruction)?.reference as? FieldReference
                    if (insns[j].opcode == Opcode.IGET && fRef?.definingClass == shaderType && fRef.type == "F") {
                        globalAlpha = fRef.name
                        break
                    }
                }
                if (globalAlpha == null) {
                    for (j in (i - 1) downTo maxOf(0, i - 6)) {
                        val fRef = (insns[j] as? ReferenceInstruction)?.reference as? FieldReference
                        if (insns[j].opcode == Opcode.IGET && fRef?.definingClass == shaderType && fRef.type == "F") {
                            globalAlpha = fRef.name
                            break
                        }
                    }
                }
                break
            }
        }
        if (globalAlpha == null) return null

        // Collect all `iget-boolean ... shaderType->field:Z` indices in order.
        val boolReads = insns.indices.mapNotNull { idx ->
            if (insns[idx].opcode != Opcode.IGET_BOOLEAN) return@mapNotNull null
            val ref = (insns[idx] as? ReferenceInstruction)?.reference as? FieldReference
                ?: return@mapNotNull null
            if (ref.definingClass == shaderType && ref.type == "Z") idx to ref.name else null
        }

        // 2. exitFade: boolean branch guarding the write to globalAlpha (`iput ... globalAlpha`) + 166L.
        var exitFade: String? = null
        // 3. collapsing: boolean branch guarding 0.25f (0x3e800000) and 0.75f (0x3f400000) + 333L.
        var collapsing: String? = null

        for (b in boolReads.indices) {
            val (startIdx, fieldName) = boolReads[b]
            val endIdx = if (b + 1 < boolReads.size) boolReads[b + 1].first else insns.size
            val slice = insns.subList(startIdx, minOf(endIdx, startIdx + 35))
            val writesGlobalAlpha = slice.any { insn ->
                insn.opcode == Opcode.IPUT &&
                    ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                        it.definingClass == shaderType && it.name == globalAlpha
                    } == true
            }
            val has166 = slice.any { it.literalLongValue() == 166L }
            val has025 = slice.any { it.literalIntValue() == FLOAT_BITS_0_25 }
            val has075 = slice.any { it.literalIntValue() == FLOAT_BITS_0_75 }
            if (exitFade == null && writesGlobalAlpha && has166) {
                exitFade = fieldName
            }
            if (collapsing == null && has025 && has075) {
                collapsing = fieldName
            }
        }

        return if (exitFade != null && collapsing != null) {
            DoFrameShaderFields(globalAlpha, exitFade, collapsing)
        } else {
            null
        }
    }

    private fun findTrueBooleanFieldWrite(method: Method, ownerType: String): String? {
        val insns = method.implementation?.instructions?.toList() ?: return null
        val regConstValue = mutableMapOf<Int, Int>()
        for (insn in insns) {
            when (insn.opcode) {
                Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST -> {
                    val reg = (insn as? OneRegisterInstruction)?.registerA ?: continue
                    val lit = (insn as? NarrowLiteralInstruction)?.narrowLiteral ?: continue
                    regConstValue[reg] = lit
                }
                Opcode.IPUT_BOOLEAN -> {
                    val two = insn as? TwoRegisterInstruction ?: continue
                    val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference ?: continue
                    if (ref.definingClass == ownerType && ref.type == "Z" && regConstValue[two.registerA] == 1) {
                        return ref.name
                    }
                }
                else -> {
                    // Clear tracked register if overwritten by another instruction.
                    if (insn is OneRegisterInstruction && insn.opcode.setsRegister()) {
                        regConstValue.remove(insn.registerA)
                    }
                }
            }
        }
        return null
    }

    fun resolveMuseStatsTargets(
        context: BytecodePatchContext,
        agenticCtor: Method,
    ): MuseStatsTargets {
        // 1. ModuleManager load method from AgenticDictationExtension.<init>
        val moduleLoadMethod = agenticCtor.implementation?.instructions
            ?.mapNotNull { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@mapNotNull null
                if (ref.definingClass == MODULE_MANAGER_TYPE &&
                    ref.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Class;") &&
                    ref.returnType.startsWith("L")
                ) {
                    ref.name
                } else {
                    null
                }
            }
            ?.firstOrNull()
            ?: throw PatchException("Could not resolve ModuleManager module-load method from AgenticDictationExtension.<init>")

        // 2. Locate UserFeatureCache interface (see / akof) and its feature enum (sdo / aknd)
        //    directly from the unobfuscated UserFeatureCache class (works even when R8 renames enum constants!).
        val ufcImplDef = context.classDefByOrNull(USER_FEATURE_CACHE_TYPE) ?: throw PatchException(
            "Could not locate $USER_FEATURE_CACHE_TYPE",
        )
        var ufcInterfaceDef: ClassDef? = null
        var ufcEnumDef: ClassDef? = null
        var ufcReadMethod: String? = null
        for (ifaceType in ufcImplDef.interfaces) {
            val iface = context.classDefByOrNull(ifaceType) ?: continue
            val readM = iface.methods.firstOrNull { m ->
                val params = m.parameterTypes.map { it.toString() }
                params.size == 2 &&
                    params[1] == "Ljava/lang/Class;" &&
                    params[0].startsWith("L") &&
                    m.returnType.startsWith("L") &&
                    context.classDefByOrNull(params[0])?.superclass == "Ljava/lang/Enum;"
            }
            if (readM != null) {
                ufcInterfaceDef = iface
                ufcEnumDef = context.classDefByOrNull(readM.parameterTypes[0].toString())
                ufcReadMethod = readM.name
                break
            }
        }
        val foundUfcIface = ufcInterfaceDef ?: throw PatchException(
            "Could not locate UserFeatureCache interface from $USER_FEATURE_CACHE_TYPE",
        )
        val foundUfcEnum = ufcEnumDef ?: throw PatchException(
            "Could not locate UserFeatureCache feature enum from ${foundUfcIface.type}",
        )
        val ufcEnumFromIdMethod = foundUfcEnum.methods.singleOrNull { m ->
            (m.accessFlags and AccessFlags.STATIC.value) != 0 &&
                m.parameterTypes.map { it.toString() } == listOf("I") &&
                m.returnType == foundUfcEnum.type
        }?.name ?: throw PatchException(
            "Could not locate static (I)${foundUfcEnum.type} lookup method on ${foundUfcEnum.type}",
        )
        // Identify the static enum field for feature id 23 (MUSE_STATS), even if R8 renamed it.
        val museStatsFieldName = findEnumFieldForFeatureId(foundUfcEnum, 23) ?: "MUSE_STATS"

        // 3. Find caller invoking ufcInterface update (enum, Class, fn)V with a MuseStats proto class
        //    (identified by having an instance field implementing List & RandomAccess, and an element
        //    class with String fields).
        var ufcUpdateMethod: String? = null
        var functionInterfaceType: String? = null
        var museStatsDef: ClassDef? = null
        var museWordDef: ClassDef? = null
        var protoListDef: ClassDef? = null
        var museStatsWordsField: String? = null

        context.classDefForEach { cls ->
            if (museStatsDef != null) return@classDefForEach
            for (method in cls.methods) {
                val insns = method.implementation?.instructions?.toList() ?: continue
                for (i in insns.indices) {
                    val ref = (insns[i] as? ReferenceInstruction)?.reference as? MethodReference
                        ?: continue
                    if (ref.definingClass != foundUfcIface.type || ref.returnType != "V") continue
                    val params = ref.parameterTypes.map { it.toString() }
                    if (params.size != 3 || params[0] != foundUfcEnum.type || params[1] != "Ljava/lang/Class;") continue
                    val fnType = params[2]
                    val fnDef = context.classDefByOrNull(fnType) ?: continue
                    if (!fnDef.methods.any { it.name == "apply" && it.parameterTypes.size == 1 }) continue

                    // Look back a few instructions for `const-class <candidateStats>`
                    for (back in (i - 1) downTo maxOf(0, i - 10)) {
                        if (insns[back].opcode != Opcode.CONST_CLASS) continue
                        val candType = ((insns[back] as? ReferenceInstruction)?.reference as? TypeReference)
                            ?.type ?: continue
                        val candDef = context.classDefByOrNull(candType) ?: continue
                        val listField = candDef.instanceFields.firstOrNull { field ->
                            val fDef = context.classDefByOrNull(field.type)
                            fDef != null &&
                                fDef.interfaces.contains("Ljava/util/List;") &&
                                fDef.interfaces.contains("Ljava/util/RandomAccess;")
                        } ?: continue
                        val wordType = findProtoRepeatedElementType(candDef) ?: continue
                        val wordClass = context.classDefByOrNull(wordType) ?: continue
                        if (wordClass.instanceFields.count { it.type == STRING_TYPE } < 1) continue

                        // Verify this call site specifically passes feature 23 (MUSE_STATS enum field or fromId(23)).
                        val usesMuseStats = (maxOf(0, i - 16) until i).any { k ->
                            val insnK = insns[k]
                            val r = (insnK as? ReferenceInstruction)?.reference
                            (insnK.opcode == Opcode.SGET_OBJECT &&
                                r is FieldReference &&
                                r.definingClass == foundUfcEnum.type &&
                                r.name == museStatsFieldName) ||
                                (insnK.opcode == Opcode.INVOKE_STATIC &&
                                    r is MethodReference &&
                                    r.definingClass == foundUfcEnum.type &&
                                    r.name == ufcEnumFromIdMethod &&
                                    (maxOf(0, k - 3) until k).any { p -> insns[p].literalIntValue() == 23 })
                        }
                        if (!usesMuseStats) continue

                        ufcUpdateMethod = ref.name
                        functionInterfaceType = fnType
                        museStatsDef = candDef
                        museWordDef = wordClass
                        protoListDef = context.classDefByOrNull(listField.type)
                        museStatsWordsField = listField.name
                        break
                    }
                    if (museStatsDef != null) break
                }
                if (museStatsDef != null) break
            }
        }

        val statsClass = museStatsDef ?: throw PatchException(
            "Could not locate MUSE_STATS protobuf class & update method on ${foundUfcIface.type}",
        )
        val wordClass = museWordDef!!
        val listClass = protoListDef!!

        val statsDefaultField = statsClass.staticFields.singleOrNull { it.type == statsClass.type }?.name
            ?: throw PatchException("Could not resolve default instance field on ${statsClass.type}")
        val wordDefaultField = wordClass.staticFields.singleOrNull { it.type == wordClass.type }?.name
            ?: throw PatchException("Could not resolve default instance field on ${wordClass.type}")

        // Word spelling field: first String field name listed in wordClass's protobuf descriptor array
        val wordTextField = findFirstProtoStringField(wordClass)
            ?: wordClass.instanceFields.firstOrNull { it.type == STRING_TYPE }?.name
            ?: throw PatchException("Could not resolve word String field on ${wordClass.type}")

        val protoBaseType = statsClass.superclass ?: throw PatchException("Missing proto superclass on ${statsClass.type}")
        val protoBaseDef = context.classDefByOrNull(protoBaseType) ?: throw PatchException(
            "Could not load proto base class $protoBaseType",
        )

        val protoBuilderType = findProtoBuilderType(context, statsClass, protoBaseDef) ?: throw PatchException(
            "Could not resolve protobuf Builder class from ${statsClass.type}",
        )
        val protoBuilderDef = context.classDefByOrNull(protoBuilderType) ?: throw PatchException(
            "Could not load protobuf Builder class $protoBuilderType",
        )

        val protoParseMethod = protoBaseDef.methods.singleOrNull { m ->
            (m.accessFlags and AccessFlags.STATIC.value) != 0 &&
                m.parameterTypes.map { it.toString() } == listOf(protoBaseType, "[B") &&
                m.returnType == protoBaseType
        }?.name ?: throw PatchException("Could not resolve parseFrom(proto, byte[]) on $protoBaseType")

        val protoMutableCopyMethod = protoBaseDef.methods.singleOrNull { m ->
            (m.accessFlags and AccessFlags.STATIC.value) != 0 &&
                m.parameterTypes.map { it.toString() } == listOf(listClass.type) &&
                m.returnType == listClass.type
        }?.name ?: throw PatchException("Could not resolve mutableCopy(${listClass.type}) on $protoBaseType")

        // toBuilder() is the ()Builder method on protoBaseDef that also calls mergeFrom (largest code units
        // among public final ()Builder methods: l/n = 9 units, o = 12 units in 18.5.4).
        val protoToBuilderMethod = protoBaseDef.methods
            .filter { m ->
                (m.accessFlags and AccessFlags.STATIC.value) == 0 &&
                    (m.accessFlags and AccessFlags.PUBLIC.value) != 0 &&
                    m.parameterTypes.isEmpty() &&
                    m.returnType == protoBuilderType
            }
            .maxByOrNull { it.implementation?.instructions?.sumOf { insn -> insn.codeUnits } ?: 0 }
            ?.name ?: throw PatchException("Could not resolve toBuilder() on $protoBaseType")

        val builderInstanceField = protoBuilderDef.instanceFields.singleOrNull { f ->
            f.type == protoBaseType && (f.accessFlags and AccessFlags.FINAL.value) == 0
        }?.name ?: throw PatchException("Could not resolve mutable instance field on $protoBuilderType")

        val builderCopyOnWriteMethod = protoBuilderDef.methods.singleOrNull { m ->
            (m.accessFlags and AccessFlags.PUBLIC.value) != 0 &&
                (m.accessFlags and AccessFlags.FINAL.value) != 0 &&
                m.parameterTypes.isEmpty() &&
                m.returnType == "V" &&
                m.implementation?.instructions?.firstOrNull()?.let { first ->
                    val ref = (first as? ReferenceInstruction)?.reference as? FieldReference
                    first.opcode == Opcode.IGET_OBJECT &&
                        ref?.definingClass == protoBuilderType &&
                        ref.name == builderInstanceField
                } == true &&
                m.hasInstruction { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == protoBaseType && ref.parameterTypes.isEmpty() && ref.returnType == "Z"
                }
        }?.name ?: throw PatchException("Could not resolve copyOnWrite() on $protoBuilderType")

        // build(): public final ()protoBaseType method on protoBuilderDef invoked by bridge ()Laamr;
        val builderBuildMethod = protoBuilderDef.methods
            .filter { m ->
                (m.accessFlags and AccessFlags.PUBLIC.value) != 0 &&
                    (m.accessFlags and AccessFlags.FINAL.value) != 0 &&
                    m.parameterTypes.isEmpty() &&
                    m.returnType == protoBaseType
            }
            .firstOrNull { m ->
                m.hasInstruction { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == protoBuilderType && ref.parameterTypes.isEmpty() && ref.returnType == protoBaseType
                }
            }?.name ?: throw PatchException("Could not resolve build() on $protoBuilderType")

        val listIsModifiableMethod = listClass.methods.singleOrNull { m ->
            m.parameterTypes.isEmpty() && m.returnType == "Z"
        }?.name ?: throw PatchException("Could not resolve isModifiable()Z on ${listClass.type}")

        return MuseStatsTargets(
            moduleLoadMethod = moduleLoadMethod,
            ufcInterfaceClass = descriptorToJavaName(foundUfcIface.type),
            ufcFeatureEnumClass = descriptorToJavaName(foundUfcEnum.type),
            ufcEnumFromIdMethod = ufcEnumFromIdMethod,
            ufcReadMethod = ufcReadMethod!!,
            ufcUpdateMethod = ufcUpdateMethod!!,
            functionInterfaceClass = descriptorToJavaName(functionInterfaceType!!),
            museStatsClass = descriptorToJavaName(statsClass.type),
            museStatsDefaultField = statsDefaultField,
            museStatsWordsField = museStatsWordsField!!,
            museWordClass = descriptorToJavaName(wordClass.type),
            museWordDefaultField = wordDefaultField,
            museWordTextField = wordTextField,
            protoBaseClass = descriptorToJavaName(protoBaseType),
            protoBuilderClass = descriptorToJavaName(protoBuilderType),
            protoListClass = descriptorToJavaName(listClass.type),
            protoParseMethod = protoParseMethod,
            protoToBuilderMethod = protoToBuilderMethod,
            protoMutableCopyMethod = protoMutableCopyMethod,
            builderCopyOnWriteMethod = builderCopyOnWriteMethod,
            builderBuildMethod = builderBuildMethod,
            builderInstanceField = builderInstanceField,
            listIsModifiableMethod = listIsModifiableMethod,
        )
    }

    fun resolvePrefsTargets(
        context: BytecodePatchContext,
        extensionClass: ClassDef,
    ): PrefsTargets {
        // Inside AgenticDictationExtension, find "pref_key_always_show_agentic_dictation_onboarding"
        // and the static (Context)L<qvt>; call right before it.
        var prefsType: String? = null
        var getInstanceName: String? = null
        for (method in extensionClass.methods) {
            val insns = method.implementation?.instructions?.toList() ?: continue
            val strIdx = insns.indices.firstOrNull { idx ->
                val ref = (insns[idx] as? ReferenceInstruction)?.reference as? StringReference
                ref?.string == "pref_key_always_show_agentic_dictation_onboarding"
            } ?: continue
            for (back in (strIdx - 1) downTo maxOf(0, strIdx - 6)) {
                val ref = (insns[back] as? ReferenceInstruction)?.reference as? MethodReference
                    ?: continue
                if (insns[back].opcode == Opcode.INVOKE_STATIC &&
                    ref.parameterTypes.map { it.toString() } == listOf(CONTEXT_TYPE) &&
                    ref.returnType == ref.definingClass
                ) {
                    prefsType = ref.definingClass
                    getInstanceName = ref.name
                    break
                }
            }
            if (prefsType != null) break
        }
        val resolvedPrefsType = prefsType ?: throw PatchException(
            "Could not locate Gboard Preferences class from AgenticDictationExtension",
        )
        val prefsDef = context.classDefByOrNull(resolvedPrefsType) ?: throw PatchException(
            "Could not load Gboard Preferences class $resolvedPrefsType",
        )
        val readStringMethod = prefsDef.virtualMethods.singleOrNull { m ->
            (m.accessFlags and AccessFlags.PUBLIC.value) != 0 &&
                m.parameterTypes.map { it.toString() } == listOf(STRING_TYPE, STRING_TYPE) &&
                m.returnType == STRING_TYPE
        }?.name ?: throw PatchException("Could not resolve readString(String, String)String on $resolvedPrefsType")

        val writeStringMethod = prefsDef.virtualMethods.singleOrNull { m ->
            (m.accessFlags and AccessFlags.PUBLIC.value) != 0 &&
                m.parameterTypes.map { it.toString() } == listOf(STRING_TYPE, STRING_TYPE) &&
                m.returnType == "V"
        }?.name ?: throw PatchException("Could not resolve writeString(String, String)V on $resolvedPrefsType")

        return PrefsTargets(
            prefsClass = descriptorToJavaName(resolvedPrefsType),
            getInstanceMethod = getInstanceName!!,
            readStringMethod = readStringMethod,
            writeStringMethod = writeStringMethod,
        )
    }

    private fun findEnumFieldForFeatureId(enumDef: ClassDef, featureId: Int): String? {
        if (enumDef.staticFields.any { it.name == "MUSE_STATS" && it.type == enumDef.type }) {
            return "MUSE_STATS"
        }
        val clinit = enumDef.methods.firstOrNull { it.name == "<clinit>" } ?: return null
        val insns = clinit.implementation?.instructions?.toList() ?: return null
        val regInts = mutableMapOf<Int, Int>()
        for (i in insns.indices) {
            val insn = insns[i]
            val lit = insn.literalIntValue()
            if (lit != null && insn is OneRegisterInstruction) {
                regInts[insn.registerA] = lit
                continue
            }
            if (insn.opcode == Opcode.INVOKE_DIRECT) {
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                if (ref.definingClass == enumDef.type &&
                    ref.name == "<init>" &&
                    ref.parameterTypes.map { it.toString() } == listOf(STRING_TYPE, "I", "I")
                ) {
                    val five = insn as? FiveRegisterInstruction ?: continue
                    val passedId = regInts[five.registerF]
                    if (passedId == featureId) {
                        for (j in (i + 1) until minOf(insns.size, i + 4)) {
                            if (insns[j].opcode == Opcode.SPUT_OBJECT) {
                                val fRef = (insns[j] as? ReferenceInstruction)?.reference as? FieldReference
                                if (fRef?.definingClass == enumDef.type && fRef.type == enumDef.type) {
                                    return fRef.name
                                }
                            }
                        }
                    }
                }
            }
        }
        return null
    }

    private fun findProtoRepeatedElementType(statsDef: ClassDef): String? {
        for (method in statsDef.methods) {
            if (method.parameterTypes.map { it.toString() } != listOf("I", OBJECT_TYPE)) continue
            val insns = method.implementation?.instructions ?: continue
            for (insn in insns) {
                if (insn.opcode == Opcode.CONST_CLASS) {
                    val type = ((insn as? ReferenceInstruction)?.reference as? TypeReference)?.type
                    if (type != null && type != statsDef.type) {
                        return type
                    }
                }
            }
        }
        return null
    }

    private fun findProtoBuilderType(
        context: BytecodePatchContext,
        statsDef: ClassDef,
        protoBaseDef: ClassDef,
    ): String? {
        val protoBaseType = protoBaseDef.type
        // Strategy 1: direct `new <Builder>(protoBase)` in statsDef.a(int, Object)
        for (method in statsDef.methods) {
            if (method.parameterTypes.map { it.toString() } != listOf("I", OBJECT_TYPE)) continue
            val insns = method.implementation?.instructions ?: continue
            for (insn in insns) {
                if (insn.opcode == Opcode.INVOKE_DIRECT) {
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    if (ref?.name == "<init>" && ref.parameterTypes.map { it.toString() } == listOf(protoBaseType)) {
                        return ref.definingClass
                    }
                }
            }
        }
        // Strategy 2: return type of protoBase's `public final ()<Builder>` method whose class
        // holds a mutable instance field of type protoBaseType.
        return protoBaseDef.methods
            .filter { m ->
                (m.accessFlags and AccessFlags.STATIC.value) == 0 &&
                    (m.accessFlags and AccessFlags.PUBLIC.value) != 0 &&
                    m.parameterTypes.isEmpty() &&
                    m.returnType.startsWith("L") &&
                    m.returnType != protoBaseType
            }
            .map { it.returnType }
            .distinct()
            .firstOrNull { candType ->
                val candDef = context.classDefByOrNull(candType) ?: return@firstOrNull false
                candDef.instanceFields.any { f ->
                    f.type == protoBaseType && (f.accessFlags and AccessFlags.FINAL.value) == 0
                }
            }
    }

    private fun findFirstProtoStringField(wordDef: ClassDef): String? {
        val stringFields = wordDef.instanceFields.filter { it.type == STRING_TYPE }.map { it.name }.toSet()
        for (method in wordDef.methods) {
            if (method.parameterTypes.map { it.toString() } != listOf("I", OBJECT_TYPE)) continue
            val insns = method.implementation?.instructions ?: continue
            for (insn in insns) {
                val str = ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string
                if (str != null && str in stringFields) {
                    return str
                }
            }
        }
        return null
    }

    /**
     * Dynamically fingerprints Gboard's Toolbar Access Point catalog, controller, and descriptor
     * builder classes (verified on both Gboard 18.5.4 and 18.8.0) so a draggable "Rambler"
     * shortcut can be registered cleanly alongside GboardWu.
     */
    fun resolveAccessPointTargets(context: BytecodePatchContext): AccessPointTargets? {
        var orderClassDef: ClassDef? = null
        var orderHelperDef: ClassDef? = null
        var controllerDef: ClassDef? = null
        var descriptorDef: ClassDef? = null
        var concreteBuilderDef: ClassDef? = null

        context.classDefForEach { cls ->
            val strings = cls.collectStrings()
            if (orderClassDef == null &&
                "AbstractAccessPointOrder.java" in strings &&
                "pref_key_access_points_showing_order" in strings
            ) {
                orderClassDef = cls
            }
            if (orderHelperDef == null &&
                "AccessPointOrderHelper.java" in strings &&
                "Invalid access points count on bar %d" in strings
            ) {
                orderHelperDef = cls
            }
            if (controllerDef == null &&
                "AccessPointsListHolderController.java" in strings &&
                "No ListHolderControllerDelegate!" in strings
            ) {
                controllerDef = cls
            }
            if (descriptorDef == null &&
                "Cannot set shortcuts after calling shortcutsBuilder()" in strings
            ) {
                descriptorDef = cls
            }
            if (concreteBuilderDef == null &&
                "Missing required properties:" in strings &&
                "Null stringId" in strings &&
                " a11yClickActionLabel" in strings
            ) {
                concreteBuilderDef = cls
            }
        }

        val orderCls = orderClassDef ?: return null
        val orderHelperCls = orderHelperDef ?: return null
        val controllerCls = controllerDef ?: return null
        val descriptorCls = descriptorDef ?: return null
        val concreteBuilderCls = concreteBuilderDef ?: return null

        val orderMutable = context.mutableClassDefBy(orderCls.type)
        val orderFactory = orderMutable.methods.singleOrNull { m ->
            (m.accessFlags and AccessFlags.STATIC.value) != 0 &&
                m.returnType == orderCls.type &&
                m.parameterTypes.size == 5 &&
                m.parameterTypes[0].toString() == CONTEXT_TYPE &&
                m.parameterTypes[3].toString() == m.parameterTypes[4].toString() &&
                m.parameterTypes[3].toString().startsWith("L")
        } ?: return null

        val immutableSetType = orderFactory.parameterTypes[3].toString()
        val immutableSetDef = context.classDefByOrNull(immutableSetType) ?: return null
        val immutableSetCopy = immutableSetDef.methods.singleOrNull { m ->
            (m.accessFlags and AccessFlags.STATIC.value) != 0 &&
                m.returnType == immutableSetType &&
                m.parameterTypes.map { it.toString() } == listOf("Ljava/util/Collection;")
        } ?: return null

        val orderHelperCatalogField = orderHelperCls.instanceFields.singleOrNull { f ->
            f.type == immutableSetType
        }?.name ?: return null

        val controllerMutable = context.mutableClassDefBy(controllerCls.type)
        val controllerCtor = controllerMutable.methods.singleOrNull { m ->
            m.name == "<init>" &&
                m.parameterTypes.size == 2 &&
                m.parameterTypes[0].toString() == CONTEXT_TYPE
        } ?: return null
        val controllerOrderHelperField = controllerCls.instanceFields.singleOrNull { f ->
            f.type == orderHelperCls.type
        }?.name ?: return null
        val controllerRegisterMethod = controllerCls.methods.singleOrNull { m ->
            (m.accessFlags and AccessFlags.STATIC.value) == 0 &&
                m.returnType == "V" &&
                m.parameterTypes.map { it.toString() } == listOf(descriptorCls.type, "Z")
        }?.name ?: return null

        val builderBaseType = if (concreteBuilderCls.superclass != null &&
            concreteBuilderCls.superclass != OBJECT_TYPE
        ) {
            concreteBuilderCls.superclass!!
        } else {
            concreteBuilderCls.type
        }
        val builderBaseDef = context.classDefByOrNull(builderBaseType) ?: concreteBuilderCls

        val descriptorBuilderFactory = descriptorCls.methods.singleOrNull { m ->
            (m.accessFlags and AccessFlags.STATIC.value) != 0 &&
                m.parameterTypes.isEmpty() &&
                (m.returnType == builderBaseType || m.returnType == concreteBuilderCls.type)
        }?.name ?: return null

        val builderTokenMethod = concreteBuilderCls.methods.singleOrNull { m ->
            (m.accessFlags and AccessFlags.STATIC.value) == 0 &&
                m.returnType == "V" &&
                m.parameterTypes.map { it.toString() } == listOf(STRING_TYPE) &&
                m.containsString("Null stringId")
        } ?: return null

        // Determine which String field tokenMethod writes so we identify the other String field (label)
        val tokenWrittenField = builderTokenMethod.implementation?.instructions
            ?.firstNotNullOfOrNull { insn ->
                if (insn.opcode == Opcode.IPUT_OBJECT) {
                    val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
                    if (ref?.definingClass == concreteBuilderCls.type && ref.type == STRING_TYPE) {
                        ref.name
                    } else {
                        null
                    }
                } else {
                    null
                }
            }

        val builderIconField = concreteBuilderCls.instanceFields.singleOrNull { f ->
            f.type == "Landroid/graphics/drawable/Icon;"
        }?.name ?: return null

        val builderLabelField = concreteBuilderCls.instanceFields
            .filter { f -> f.type == STRING_TYPE && f.name != tokenWrittenField }
            .singleOrNull()?.name ?: return null

        val builderRunnableMethod = (builderBaseDef.methods + concreteBuilderCls.methods)
            .firstOrNull { m ->
                (m.accessFlags and AccessFlags.STATIC.value) == 0 &&
                    (m.accessFlags and AccessFlags.ABSTRACT.value) == 0 &&
                    m.returnType == "V" &&
                    m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Runnable;")
            }?.name ?: return null

        // Prefer the non-abstract build() wrapper on the base builder (e.g. aadm.b() on 18.8.0,
        // mtm.a() on 18.5.4) so actions/params maps are finalized before constructing AccessPointDef.
        val builderBuildMethod = builderBaseDef.methods.firstOrNull { m ->
            (m.accessFlags and AccessFlags.STATIC.value) == 0 &&
                (m.accessFlags and AccessFlags.ABSTRACT.value) == 0 &&
                m.parameterTypes.isEmpty() &&
                m.returnType == descriptorCls.type
        }?.name ?: concreteBuilderCls.methods.firstOrNull { m ->
            (m.accessFlags and AccessFlags.STATIC.value) == 0 &&
                (m.accessFlags and AccessFlags.ABSTRACT.value) == 0 &&
                m.parameterTypes.isEmpty() &&
                m.returnType == descriptorCls.type
        }?.name ?: return null

        return AccessPointTargets(
            orderFactoryMethod = orderFactory,
            controllerConstructor = controllerCtor,
            immutableSetType = immutableSetType,
            controllerClass = descriptorToJavaName(controllerCls.type),
            controllerOrderHelperField = controllerOrderHelperField,
            controllerRegisterMethod = controllerRegisterMethod,
            orderHelperClass = descriptorToJavaName(orderHelperCls.type),
            orderHelperCatalogField = orderHelperCatalogField,
            immutableSetClass = descriptorToJavaName(immutableSetType),
            immutableSetCopyMethod = immutableSetCopy.name,
            descriptorClass = descriptorToJavaName(descriptorCls.type),
            descriptorBuilderFactoryMethod = descriptorBuilderFactory,
            builderBaseClass = descriptorToJavaName(builderBaseType),
            builderConcreteClass = descriptorToJavaName(concreteBuilderCls.type),
            builderTokenMethod = builderTokenMethod.name,
            builderRunnableMethod = builderRunnableMethod,
            builderBuildMethod = builderBuildMethod,
            builderIconField = builderIconField,
            builderLabelField = builderLabelField,
        )
    }

    /**
     * Dynamically fingerprints Gboard's {@code LanguagePickerExtension} ({@code Lpvd;} in 18.5.4,
     * {@code Lafzt;} in 18.8.0) and {@code AgenticDictationExtension}'s activation/trigger methods
     * so long-pressing the Spacebar toggles Rambler dictation with zero conflict against GboardWu.
     */
    fun resolveSpacebarTriggerTargets(
        context: BytecodePatchContext,
        agenticClass: MutableClass,
    ): SpacebarTriggerTargets? {
        var langPickerDef: ClassDef? = null
        context.classDefForEach { cls ->
            if (langPickerDef != null) return@classDefForEach
            val strings = cls.collectStrings()
            if ("floating_globe" in strings &&
                "space_long_press_ime_picker" in strings &&
                "LanguagePicker" in strings
            ) {
                langPickerDef = cls
            }
        }
        val foundLangPicker = langPickerDef ?: return null
        val langPickerClass = context.mutableClassDefBy(foundLangPicker.type)

        val consumeEventMethod = langPickerClass.methods.singleOrNull { m ->
            m.parameterTypes.size == 1 &&
                m.returnType == "Z" &&
                m.containsString("floating_globe") &&
                m.containsString("space") &&
                m.hasInstruction { it.literalIntValue() == -10022 }
        } ?: return null

        val eventType = consumeEventMethod.parameterTypes[0].toString()
        val eventActionField = context.classDefByOrNull(eventType)?.instanceFields?.firstOrNull { f ->
            val fieldCls = context.classDefByOrNull(f.type)
            fieldCls?.superclass == "Ljava/lang/Enum;" && "LONG_PRESS" in fieldCls.collectStrings()
        }?.name ?: "a"
        val consumeInsns = consumeEventMethod.implementation?.instructions?.toList() ?: return null

        val keyDataGetterRef = consumeInsns.firstNotNullOfOrNull { insn ->
            if (insn.opcode != Opcode.INVOKE_VIRTUAL && insn.opcode != Opcode.INVOKE_VIRTUAL_RANGE) {
                return@firstNotNullOfOrNull null
            }
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@firstNotNullOfOrNull null
            if (ref.definingClass == eventType &&
                ref.parameterTypes.isEmpty() &&
                ref.returnType.startsWith("L")
            ) {
                ref
            } else {
                null
            }
        } ?: return null
        val keyDataType = keyDataGetterRef.returnType

        val keyDataCodeField = consumeInsns.firstNotNullOfOrNull { insn ->
            if (insn.opcode != Opcode.IGET) return@firstNotNullOfOrNull null
            val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
                ?: return@firstNotNullOfOrNull null
            if (ref.definingClass == keyDataType && ref.type == "I") ref.name else null
        } ?: return null

        val keyDataDataField = consumeInsns.firstNotNullOfOrNull { insn ->
            if (insn.opcode != Opcode.IGET_OBJECT) return@firstNotNullOfOrNull null
            val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
                ?: return@firstNotNullOfOrNull null
            if (ref.definingClass == keyDataType && ref.type == OBJECT_TYPE) ref.name else null
        } ?: return null

        val extGetContextMethod = consumeInsns.firstNotNullOfOrNull { insn ->
            if (insn.opcode != Opcode.INVOKE_VIRTUAL && insn.opcode != Opcode.INVOKE_VIRTUAL_RANGE) {
                return@firstNotNullOfOrNull null
            }
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@firstNotNullOfOrNull null
            if ((ref.definingClass == langPickerClass.type ||
                    ref.definingClass == langPickerClass.superclass) &&
                ref.parameterTypes.isEmpty() &&
                ref.returnType == CONTEXT_TYPE
            ) {
                ref.name
            } else {
                null
            }
        } ?: return null

        val initialStateMethod = langPickerClass.methods.singleOrNull { m ->
            !m.name.startsWith("morpheRambler") &&
                (m.accessFlags and AccessFlags.PRIVATE.value) == 0 &&
                m.parameterTypes.size == 2 &&
                m.parameterTypes[1].toString() == EDITOR_INFO_TYPE &&
                m.returnType == "J" &&
                m.hasInstruction { it.literalLongValue() == 0x10000000000L }
        } ?: return null

        val agenticTriggerMethodObj = agenticClass.methods.singleOrNull { m ->
            (m.accessFlags and AccessFlags.STATIC.value) == 0 &&
                m.parameterTypes.isEmpty() &&
                m.returnType == "Z" &&
                m.containsString("maybeShowOnboardingOrEduAndProceed")
        } ?: return null
        val agenticTriggerMethod = agenticTriggerMethodObj.name

        // Extract UI manager field (e.g. `c:Lfkj;` / `c:Lkuh;`) and its state getter (`h()Lfkw;` / `h()Lkvc;`)
        // from the `c.h() != IDLING` guard right at the top of `agenticTriggerMethod` (`C()Z`).
        var agenticUiManagerField = "c"
        var uiManagerGetStateMethod = "h"
        val triggerInsns = agenticTriggerMethodObj.implementation?.instructions?.toList().orEmpty()
        for (i in triggerInsns.indices) {
            val insn = triggerInsns[i]
            if (insn.opcode != Opcode.IGET_OBJECT) continue
            val fieldRef = (insn as? ReferenceInstruction)?.reference as? FieldReference ?: continue
            if (fieldRef.definingClass != agenticClass.type) continue
            val uiMgrType = fieldRef.type
            val stateCall = ((i + 1)..minOf(triggerInsns.lastIndex, i + 8)).firstNotNullOfOrNull { j ->
                val call = triggerInsns[j]
                if (call.opcode != Opcode.INVOKE_VIRTUAL && call.opcode != Opcode.INVOKE_VIRTUAL_RANGE) {
                    return@firstNotNullOfOrNull null
                }
                val mRef = (call as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@firstNotNullOfOrNull null
                if (mRef.definingClass == uiMgrType &&
                    mRef.parameterTypes.isEmpty() &&
                    mRef.returnType.startsWith("L") &&
                    context.classDefByOrNull(mRef.returnType)?.superclass == "Ljava/lang/Enum;"
                ) {
                    mRef.name
                } else {
                    null
                }
            }
            if (stateCall != null) {
                agenticUiManagerField = fieldRef.name
                uiManagerGetStateMethod = stateCall
                break
            }
        }

        val softKeyboardViewClass = context.classDefByOrNull(
            "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;",
        )?.let { skvDef ->
            context.mutableClassDefBy(skvDef.type)
        }
        val softKeyboardDispatchTouchMethod = softKeyboardViewClass?.methods?.singleOrNull { m ->
            m.name == "dispatchTouchEvent" &&
                m.parameterTypes.map { it.toString() } == listOf("Landroid/view/MotionEvent;") &&
                m.returnType == "Z"
        }

        val agenticConsumeMethod = agenticClass.methods.singleOrNull { m ->
            (m.accessFlags and AccessFlags.STATIC.value) == 0 &&
                m.parameterTypes.map { it.toString() } == listOf(eventType) &&
                m.returnType == "Z"
        } ?: return null

        val agenticIsActiveMethod = agenticConsumeMethod.implementation?.instructions
            ?.firstNotNullOfOrNull { insn ->
                if (insn.opcode != Opcode.INVOKE_VIRTUAL &&
                    insn.opcode != Opcode.INVOKE_VIRTUAL_RANGE
                ) {
                    return@firstNotNullOfOrNull null
                }
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@firstNotNullOfOrNull null
                if ((ref.definingClass == agenticClass.type ||
                        ref.definingClass == agenticClass.superclass) &&
                    ref.parameterTypes.isEmpty() &&
                    ref.returnType == "Z"
                ) {
                    ref.name
                } else {
                    null
                }
            } ?: return null

        return SpacebarTriggerTargets(
            langPickerClass = langPickerClass,
            consumeEventMethod = consumeEventMethod,
            initialStateMethod = initialStateMethod,
            softKeyboardViewClass = softKeyboardViewClass,
            softKeyboardDispatchTouchMethod = softKeyboardDispatchTouchMethod,
            eventGetKeyDataMethod = keyDataGetterRef.name,
            eventActionField = eventActionField,
            keyDataCodeField = keyDataCodeField,
            keyDataDataField = keyDataDataField,
            extGetContextMethod = extGetContextMethod,
            agenticIsActiveMethod = agenticIsActiveMethod,
            agenticTriggerMethod = agenticTriggerMethod,
            agenticClassName = descriptorToJavaName(agenticClass.type),
            agenticUiManagerField = agenticUiManagerField,
            uiManagerGetStateMethod = uiManagerGetStateMethod,
        )
    }

    private fun descriptorToJavaName(descriptor: String): String {
        require(descriptor.startsWith("L") && descriptor.endsWith(";")) {
            "Expected class descriptor, got $descriptor"
        }
        return descriptor.substring(1, descriptor.length - 1).replace('/', '.')
    }

    private fun BytecodePatchContext.classDefByOrNull(type: String): ClassDef? =
        runCatching { classDefBy(type) }.getOrNull()

    private fun ClassDef.collectStrings(): Set<String> {
        val result = mutableSetOf<String>()
        for (method in methods) {
            val insns = method.implementation?.instructions ?: continue
            for (insn in insns) {
                val ref = (insn as? ReferenceInstruction)?.reference as? StringReference
                if (ref != null) result.add(ref.string)
            }
        }
        return result
    }

    private fun Method.hasInstruction(predicate: (Instruction) -> Boolean): Boolean =
        implementation?.instructions?.any(predicate) == true

    private fun Method.containsString(needle: String): Boolean = hasInstruction { insn ->
        ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string == needle
    }

    private fun Method.containsFloatLiteral(bits: Int): Boolean = hasInstruction { insn ->
        insn.literalIntValue() == bits
    }

    private fun Method.referencesType(typeDescriptor: String): Boolean = hasInstruction { insn ->
        val ref = (insn as? ReferenceInstruction)?.reference
        (ref is TypeReference && ref.type == typeDescriptor) ||
            (ref is FieldReference && (ref.definingClass == typeDescriptor || ref.type == typeDescriptor)) ||
            (ref is MethodReference && ref.definingClass == typeDescriptor)
    }

    private fun Instruction.literalIntValue(): Int? =
        (this as? NarrowLiteralInstruction)?.narrowLiteral

    private fun Instruction.literalLongValue(): Long? = when (this) {
        is WideLiteralInstruction -> wideLiteral
        is NarrowLiteralInstruction -> narrowLiteral.toLong()
        else -> null
    }
}
