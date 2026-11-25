package dev.materialtidal.patches.tidal.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL
import dev.materialtidal.patches.shared.EXTENSION_PATH
import dev.materialtidal.patches.shared.MATERIAL_YOU_CONFIG_CLASS
import dev.materialtidal.patches.shared.PATCH_SETTINGS_BRIDGE_CLASS
import dev.materialtidal.patches.shared.PATCH_SETTINGS_CLICK_ADAPTER_CLASS
import dev.materialtidal.patches.shared.PATCH_SETTINGS_ITEM_ADAPTER_CLASS

@Suppress("unused")
val patchSettingsPatch = patch(
    name = "In-app patch settings",
    description = "Adds a 'MaterialTidal' menu inside TIDAL's main Settings screen so you can toggle and customize installed MaterialTidal patches live without re-patching, with quick controls, organized sub-pages, and per-page or full reset.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    execute {
        // 1. Mark In-app patch settings as installed on MaterialYouConfig.
        mutableClassDefBy(MATERIAL_YOU_CONFIG_CLASS)
            .methods.single { it.name == "isPatchSettingsInstalled" }.returnEarly(true)

        // 2. Match App.onCreate and main Settings items builder (Lhsg;.a()Ljava/util/List;).
        val appOnCreateMatch = PatchSettingsAppOnCreateFingerprint.matchSingle()
        val mainSettingsMatch = MainSettingsItemsBuildFingerprint.matchSingle()

        // 3. Dynamically resolve SettingsItem, ViewState, Function0, and SettingsItemEvent types.
        val hsgClass = mutableClassDefBy(mainSettingsMatch.classDef.type)
        val offlineField = hsgClass.instanceFields.firstOrNull {
            it.type == "Lcom/aspiro/wamp/settings/items/profile/SettingsItemOfflineMode;"
        } ?: throw PatchException("Could not find SettingsItemOfflineMode field on ${hsgClass.type}")
        val offlineItemClass = mutableClassDefBy(offlineField.type)

        val settingsItemInterface = generateSequence<ClassDef>(offlineItemClass) { cur ->
            cur.superclass?.let { mutableClassDefByOrNull(it) }
        }.firstNotNullOfOrNull { cur ->
            cur.interfaces.firstNotNullOfOrNull { iface ->
                val ifaceCls = mutableClassDefByOrNull(iface) ?: return@firstNotNullOfOrNull null
                val hasVs = ifaceCls.methods.any { it.parameterTypes.isEmpty() && it.returnType != "V" }
                val hasRefresh = ifaceCls.methods.any { it.parameterTypes.isEmpty() && it.returnType == "V" }
                if (ifaceCls.methods.size == 2 && hasVs && hasRefresh) ifaceCls.type else null
            }
        } ?: throw PatchException("Could not resolve SettingsItem interface from ${offlineItemClass.type}")

        val settingsItemInterfaceClass = mutableClassDefBy(settingsItemInterface)
        val settingsGetViewStateMethod = settingsItemInterfaceClass.methods.single {
            it.parameterTypes.isEmpty() && it.returnType != "V"
        }
        val settingsRefreshMethod = settingsItemInterfaceClass.methods.single {
            it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        val settingsViewStateInterface = settingsGetViewStateMethod.returnType

        val settingsRefreshEventClass = classDefByOrNull { cls ->
            cls.superclass == "Lcom/aspiro/wamp/settings/b;" &&
                cls.methods.any { m ->
                    m.name == "<init>" &&
                        m.parameterTypes.map { it.toString() } == listOf(settingsItemInterface)
                }
        } ?: throw PatchException(
            "Could not resolve SettingsItemRefreshEvent subclass of Lcom/aspiro/wamp/settings/b;",
        )
        val settingsRefreshEventType = settingsRefreshEventClass.type
        val settingsRefreshEventInit = settingsRefreshEventClass.methods.single { m ->
            m.name == "<init>" && m.parameterTypes.map { it.toString() } == listOf(settingsItemInterface)
        }

        var clickableViewStateType: String? = null
        var clickableViewStateInit8: MethodReference? = null
        for (field in hsgClass.instanceFields) {
            val itemClass = mutableClassDefByOrNull(field.type) ?: continue
            val subFields = buildList {
                addAll(itemClass.instanceFields)
                itemClass.superclass?.let { mutableClassDefByOrNull(it) }?.let { addAll(it.instanceFields) }
            }
            for (subField in subFields) {
                val vsClass = mutableClassDefByOrNull(subField.type) ?: continue
                if (!vsClass.interfaces.contains(settingsViewStateInterface)) continue
                val init8 = vsClass.methods.firstOrNull { m ->
                    m.name == "<init>" &&
                        m.parameterTypes.size == 8 &&
                        m.parameterTypes.take(3).all { it.toString() == "Ljava/lang/CharSequence;" } &&
                        m.parameterTypes.subList(3, 7).all { it.toString() == "Z" }
                }
                if (init8 != null) {
                    clickableViewStateType = vsClass.type
                    clickableViewStateInit8 = init8
                    break
                }
            }
            if (clickableViewStateInit8 != null) break
        }
        val resolvedClickableVsType = clickableViewStateType
            ?: throw PatchException("Could not resolve clickable Settings ViewState class from ${hsgClass.type}")
        val resolvedClickableVsInit8 = clickableViewStateInit8
            ?: throw PatchException("Could not resolve 8-arg <init> on $resolvedClickableVsType")
        val function0Type = resolvedClickableVsInit8.parameterTypes[7].toString()

        // 4. Wire extension adapters to TIDAL's obfuscated interfaces.
        mutableClassDefBy(PATCH_SETTINGS_CLICK_ADAPTER_CLASS).apply {
            addInterface(function0Type)
        }

        mutableClassDefBy(PATCH_SETTINGS_ITEM_ADAPTER_CLASS).apply {
            addInterface(settingsItemInterface)
            addForwardingMethod(
                name = settingsGetViewStateMethod.name,
                params = emptyList(),
                returnType = settingsViewStateInterface,
                implName = "getViewStateImpl",
                implParams = emptyList(),
                implReturnType = "Ljava/lang/Object;",
            )
            addForwardingMethod(
                name = settingsRefreshMethod.name,
                params = emptyList(),
                returnType = "V",
                implName = "refreshImpl",
                implParams = emptyList(),
                implReturnType = "V",
            )
        }

        // 5. Replace PatchSettingsBridge native* stub bodies with Dalvik bytecode.
        val bridgeClass = mutableClassDefBy(PATCH_SETTINGS_BRIDGE_CLASS)

        replaceBridgeMethod(
            bridgeClass,
            "nativeCreatePublishSubject",
            """
                invoke-static {}, Lio/reactivex/subjects/PublishSubject;->create()Lio/reactivex/subjects/PublishSubject;
                move-result-object v0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeMergeObservables",
            """
                check-cast p0, Lio/reactivex/ObservableSource;
                check-cast p1, Lio/reactivex/ObservableSource;
                invoke-static { p0, p1 }, Lio/reactivex/Observable;->merge(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;
                move-result-object v0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativePublishNext",
            """
                if-eqz p0, :done
                if-eqz p1, :done
                check-cast p0, Lio/reactivex/subjects/PublishSubject;
                invoke-virtual { p0, p1 }, Lio/reactivex/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V
                :done
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeCreateSettingsRefreshEvent",
            """
                if-nez p0, :has_item
                const/4 v0, 0x0
                return-object v0
                :has_item
                check-cast p0, $settingsItemInterface
                new-instance v0, $settingsRefreshEventType
                invoke-direct { v0, p0 }, $settingsRefreshEventInit
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeCreateSettingsRowViewState",
            """
                check-cast p3, $function0Type
                new-instance v0, $resolvedClickableVsType
                move-object v1, p0
                move-object v2, p1
                move-object v3, p2
                const/4 v4, 0x1
                const/4 v5, 0x1
                const/4 v6, 0x0
                const/4 v7, 0x1
                move-object v8, p3
                invoke-direct/range { v0 .. v8 }, $resolvedClickableVsInit8
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeCreateEmptyMaybe",
            """
                invoke-static {}, Lio/reactivex/Maybe;->empty()Lio/reactivex/Maybe;
                move-result-object v0
                return-object v0
            """,
        )

        // 6. Hook App.onCreate() to initialize PatchSettingsPrefs and register ActivityLifecycleCallbacks.
        appOnCreateMatch.method.let { m ->
            val p0 = m.p0Register
            val sputIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.SPUT_OBJECT &&
                    ((insn as ReferenceInstruction).reference as FieldReference).definingClass == "Lcom/aspiro/wamp/App;"
            }
            if (sputIdx < 0) {
                throw PatchException("Could not find App sput-object in App.onCreate")
            }
            m.addInstructions(
                sputIdx + 1,
                "invoke-static/range { v$p0 .. v$p0 }, $PATCH_SETTINGS_BRIDGE_CLASS->initApplication(Landroid/app/Application;)V",
            )
        }

        // 7. Hook Lhsg;.a()Ljava/util/List; at every return-object branch to inject the MaterialTidal row.
        mainSettingsMatch.method.let { m ->
            val returnIndices = m.instructions.withIndex()
                .filter { (_, insn) -> insn.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .sortedDescending()
            if (returnIndices.isEmpty()) {
                throw PatchException("Could not find return-object in ${m.definingClass}.${m.name}")
            }
            for (retIdx in returnIndices) {
                val retReg = (m.getInstruction(retIdx) as OneRegisterInstruction).registerA
                m.addInstructionsAtControlFlowLabel(
                    retIdx,
                    "invoke-static/range { v$retReg .. v$retReg }, $PATCH_SETTINGS_BRIDGE_CLASS->onMainSettingsBuilt(Ljava/util/List;)V",
                )
            }
        }

        // 8. Hook Lhsg;.b()Lio/reactivex/Observable; to emit live badge refresh events after in-app changes.
        hsgClass.methods.single {
            it.returnType == "Lio/reactivex/Observable;" && it.parameterTypes.isEmpty()
        }.let { m ->
            val retIdx = m.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            if (retIdx < 0) {
                throw PatchException("Could not find return-object in ${hsgClass.type}.${m.name}")
            }
            val retReg = (m.getInstruction(retIdx) as OneRegisterInstruction).registerA
            m.addInstructionsAtControlFlowLabel(
                retIdx,
                """
                    invoke-static/range { v$retReg .. v$retReg }, $PATCH_SETTINGS_BRIDGE_CLASS->mergeSettingsRefreshObservable(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$retReg
                    check-cast v$retReg, Lio/reactivex/Observable;
                """.trimIndent(),
            )
        }
    }
}

private fun MutableClass.addInterface(interfaceType: String) {
    if (!interfaces.contains(interfaceType)) {
        interfaces.add(interfaceType)
    }
}

private fun MutableClass.addForwardingMethod(
    name: String,
    params: List<String>,
    returnType: String,
    implName: String,
    implParams: List<String>,
    implReturnType: String,
) {
    val paramList = params.mapIndexed { idx, t -> ImmutableMethodParameter(t, null, "p$idx") }
    val implSig = "${this.type}->$implName(${implParams.joinToString("")})$implReturnType"
    val paramRegs = (0..params.size).joinToString(", ") { "p$it" }

    val body = buildString {
        appendLine("invoke-virtual { $paramRegs }, $implSig")
        when (returnType) {
            "V" -> appendLine("return-void")
            "Z", "B", "S", "C", "I", "F" -> {
                appendLine("move-result v0")
                appendLine("return v0")
            }
            "J", "D" -> {
                appendLine("move-result-wide v0")
                appendLine("return-wide v0")
            }
            else -> {
                appendLine("move-result-object v0")
                if (implReturnType != returnType) {
                    appendLine("check-cast v0, $returnType")
                }
                appendLine("return-object v0")
            }
        }
    }

    val totalRegs = 2 + params.sumOf { if (it == "J" || it == "D") 2 else 1 } + 1
    val newMethod = ImmutableMethod(
        this.type,
        name,
        paramList,
        returnType,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        null,
        null,
        MutableMethodImplementation(maxOf(4, totalRegs)),
    ).toMutable()

    newMethod.addInstructionsWithLabels(0, body.trimIndent())
    methods.removeAll { it.name == name && it.parameterTypes.map { p -> p.toString() } == params }
    methods.add(newMethod)
}

private fun replaceBridgeMethod(
    bridgeClass: MutableClass,
    methodName: String,
    smali: String,
) {
    val oldMethod = bridgeClass.methods.singleOrNull { it.name == methodName }
        ?: throw PatchException("Bridge method not found: ${bridgeClass.type}->$methodName")

    val paramWords = oldMethod.parameters.sumOf { if (it.type == "J" || it.type == "D") 2 else 1 }
    val newMethod = ImmutableMethod(
        bridgeClass.type,
        oldMethod.name,
        oldMethod.parameters.map { ImmutableMethodParameter(it.type, it.annotations, it.name) },
        oldMethod.returnType,
        oldMethod.accessFlags,
        oldMethod.annotations,
        oldMethod.hiddenApiRestrictions,
        MutableMethodImplementation(10 + paramWords),
    ).toMutable()

    newMethod.addInstructionsWithLabels(0, smali.trimIndent())

    bridgeClass.methods.remove(oldMethod)
    bridgeClass.methods.add(newMethod)
}
