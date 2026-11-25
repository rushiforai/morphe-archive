package dev.materialtidal.patches.tidal.playback.crossfade

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL
import dev.materialtidal.patches.shared.CROSSFADE_BRIDGE_CLASS
import dev.materialtidal.patches.shared.CROSSFADE_CONFIG_CLASS
import dev.materialtidal.patches.shared.CROSSFADE_CONTEXT_MENU_ITEM_ADAPTER_CLASS
import dev.materialtidal.patches.shared.CROSSFADE_ENGINE_CLASS
import dev.materialtidal.patches.shared.CROSSFADE_SETTINGS_CLICK_ADAPTER_CLASS
import dev.materialtidal.patches.shared.CROSSFADE_SETTINGS_ITEM_ADAPTER_CLASS
import dev.materialtidal.patches.shared.EXTENSION_PATH
import dev.materialtidal.patches.shared.MATERIAL_YOU_CONFIG_CLASS

private val CROSSFADE_DURATION_CHOICES = mapOf(
    "Off (0 seconds — adjust in app)" to 0,
    "2 seconds" to 2,
    "3 seconds" to 3,
    "4 seconds" to 4,
    "5 seconds (Recommended)" to 5,
    "6 seconds" to 6,
    "8 seconds" to 8,
    "10 seconds" to 10,
    "12 seconds" to 12,
)

private val CROSSFADE_CURVE_CHOICES = mapOf(
    "Equal Power (Recommended)" to 0,
    "Smooth S-Curve" to 1,
    "Soft Dip" to 2,
    "DJ Blend" to 3,
)

private val CROSSFADE_STRENGTH_CHOICES = mapOf(
    "Gentle (25%)" to 25,
    "Balanced (50%, recommended)" to 50,
    "Strong (75%)" to 75,
    "Maximum (100%)" to 100,
)

@Suppress("unused")
val crossfadePlaybackPatch = patch(
    name = "Seamless track transitions (Crossfade)",
    description = "Unlocks dual-player Crossfade with adjustable duration (0–12 s), 4 audio fade curves, blend intensity, gapless-album preservation, and a clean full-screen Crossfade menu in Settings and the Now Playing menu.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    val defaultSecondsOption by intOption(
        key = "crossfadeDefaultSeconds",
        default = 5,
        values = CROSSFADE_DURATION_CHOICES,
        title = "Default crossfade duration",
        description = "Initial crossfade overlap length in seconds (adjustable live anytime in Settings → MaterialTidal, Audio & Playback, or the Now Playing menu).",
        required = true,
    )

    val defaultCurveOption by intOption(
        key = "crossfadeDefaultCurve",
        default = 0,
        values = CROSSFADE_CURVE_CHOICES,
        title = "Default transition curve",
        description = "Audio volume curve used when blending outgoing and incoming tracks (adjustable live in the Crossfade menu).",
        required = true,
    )

    val defaultStrengthOption by intOption(
        key = "crossfadeDefaultStrength",
        default = 50,
        values = CROSSFADE_STRENGTH_CHOICES,
        title = "Default blend intensity",
        description = "Controls how strongly both tracks overlap at the midpoint of a transition (adjustable from 0% to 100% in the Crossfade menu).",
        required = true,
    )

    val preserveGaplessAlbumsOption by booleanOption(
        key = "crossfadePreserveGaplessAlbums",
        default = false,
        title = "Keep albums gapless by default",
        description = "Plays consecutive tracks from the same album gaplessly without crossfading (can be toggled live in the Crossfade menu).",
        required = true,
    )

    execute {
        // 1. Apply patch option defaults onto CrossfadeConfig and mark patch installed.
        mutableClassDefBy(MATERIAL_YOU_CONFIG_CLASS)
            .methods.single { it.name == "isCrossfadePatchInstalled" }.returnEarly(true)
        mutableClassDefBy(CROSSFADE_CONFIG_CLASS).apply {
            methods.single { it.name == "getDefaultDurationSeconds" }
                .returnEarly(defaultSecondsOption ?: 5)
            methods.single { it.name == "getDefaultCurveType" }
                .returnEarly(defaultCurveOption ?: 0)
            methods.single { it.name == "getDefaultStrengthPercent" }
                .returnEarly(defaultStrengthOption ?: 50)
            methods.single { it.name == "isDefaultPreserveGaplessAlbums" }
                .returnEarly(preserveGaplessAlbumsOption ?: false)
        }

        // 2. Match fingerprints and resolve obfuscated TIDAL runtime types dynamically.
        val flagMatch = CrossfadeFeatureFlagClinitFingerprint.matchSingle()
        val prefInitMatch = CrossfadePreferenceInitFingerprint.matchSingle()
        val prefReadMatch = CrossfadePreferenceReadFingerprint.matchSingle()
        val prefFlowMatch = CrossfadePreferenceFlowFingerprint.matchSingle()
        val durationLambdaMatch = CrossfadeDurationLambdaFingerprint.matchSingle()
        val settingsBuildMatch = AudioAndPlaybackSettingsBuildFingerprint.matchSingle()
        val commitMatch = SettingsItemCrossfadeCommitFingerprint.matchSingle()
        val boomboxMatch = BoomboxOnActivatedFingerprint.matchSingle()
        val engineInitMatch = ExoPlayerPlaybackEngineInitFingerprint.matchSingle()
        val trackMenuMatch = TrackContextMenuBuildFingerprint.matchSingle()
        val appOnCreateMatch = AppOnCreateFingerprint.matchSingle()

        val mwdType = flagMatch.classDef.type
        val crossfadePrefType = prefInitMatch.classDef.type
        val prefReadMethod = prefReadMatch.method

        // Resolve SecurePreferences store field & write methods from Lyog.call().
        val commitInsns = commitMatch.method.instructions
        val prefStoreField = commitInsns.firstNotNullOfOrNull { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
            if (insn.opcode == Opcode.IGET_OBJECT && ref?.definingClass == crossfadePrefType) ref else null
        } ?: throw PatchException("Could not resolve SecurePreferences field on $crossfadePrefType")

        val zdgPutIntMethod = commitInsns.firstNotNullOfOrNull { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            if (insn.opcode == Opcode.INVOKE_INTERFACE &&
                ref?.definingClass == prefStoreField.type &&
                ref.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/Integer;")
            ) {
                ref
            } else {
                null
            }
        } ?: throw PatchException("Could not resolve putInt method on ${prefStoreField.type}")

        val editorType = zdgPutIntMethod.returnType
        val editorApplyMethod = commitInsns.firstNotNullOfOrNull { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            if (ref?.definingClass == editorType && ref.parameterTypes.isEmpty() && ref.returnType == "V") ref else null
        } ?: throw PatchException("Could not resolve apply()V on $editorType")

        val settingsRefreshEventInit = commitInsns.lastOrNull { insn ->
            insn.opcode == Opcode.INVOKE_DIRECT &&
                ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.name == "<init>"
        }?.let { (it as ReferenceInstruction).reference as MethodReference }
            ?: throw PatchException("Could not resolve SettingsItemEvent.<init> in ${commitMatch.classDef.type}")

        val settingsRefreshEventType = settingsRefreshEventInit.definingClass
        val settingsItemInterface = settingsRefreshEventInit.parameterTypes.singleOrNull()?.toString()
            ?: throw PatchException("Unexpected parameter types on $settingsRefreshEventInit")
        val settingsItemInterfaceClass = mutableClassDefBy(settingsItemInterface)
        val settingsGetViewStateMethod = settingsItemInterfaceClass.methods.single {
            it.parameterTypes.isEmpty() && it.returnType != "V"
        }
        val settingsRefreshMethod = settingsItemInterfaceClass.methods.single {
            it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        val settingsViewStateInterface = settingsGetViewStateMethod.returnType

        // Resolve Lrrg$a; (clickable SettingsItemTextRow ViewState) and Lzm7; (Function0) from Lk61 fields.
        val k61Class = mutableClassDefBy(settingsBuildMatch.classDef.type)
        var clickableViewStateType: String? = null
        var clickableViewStateInit8: MethodReference? = null
        for (field in k61Class.instanceFields) {
            val itemClass = mutableClassDefByOrNull(field.type) ?: continue
            for (subField in itemClass.instanceFields) {
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
            ?: throw PatchException("Could not resolve clickable Settings ViewState class from ${k61Class.type}")
        val resolvedClickableVsInit8 = clickableViewStateInit8
            ?: throw PatchException("Could not resolve 8-arg <init> on $resolvedClickableVsType")
        val function0Type = resolvedClickableVsInit8.parameterTypes[7].toString()

        // Resolve ExoPlayerPlaybackEngine crossfade field E:Lzi4;, Lbud;.g(J)V, Lzi4;.f(Lc5b;)Z, and Lyi4;.run()V.
        val engineInitMethod = engineInitMatch.method
        val engineClass = mutableClassDefBy(engineInitMatch.classDef.type)
        val engineInitInsns = engineInitMethod.instructions
        val zi4PutIdx = engineInitInsns.indexOfFirst { insn ->
            insn.opcode == Opcode.IPUT_OBJECT &&
                ((insn as ReferenceInstruction).reference as FieldReference).let { ref ->
                    ref.definingClass == engineClass.type &&
                        engineClass.methods.any { m ->
                            m.parameterTypes.map { p -> p.toString() } == listOf("J") &&
                                m.returnType == "V" &&
                                m.instructions.any { i ->
                                    i.opcode == Opcode.IGET_OBJECT &&
                                        ((i as ReferenceInstruction).reference as FieldReference) == ref
                                }
                        }
                }
        }
        if (zi4PutIdx < 0) {
            throw PatchException("Could not resolve CrossfadeController field on ${engineClass.type}")
        }
        val engineCrossfadeField = (engineInitInsns[zi4PutIdx] as ReferenceInstruction).reference as FieldReference
        val crossfadeControllerType = engineCrossfadeField.type
        val crossfadeControllerClass = mutableClassDefBy(crossfadeControllerType)

        val engineSetCrossfadeMethod = engineClass.methods.single { m ->
            m.parameterTypes.map { it.toString() } == listOf("J") &&
                m.returnType == "V" &&
                m.instructions.any { insn ->
                    insn.opcode == Opcode.IGET_OBJECT &&
                        ((insn as ReferenceInstruction).reference as FieldReference) == engineCrossfadeField
                }
        }

        // Resolve Lbud; (PlaybackEngine interface) & LocalPlayQueue (Loz9;) from BoomboxPlayback (Lcom/aspiro/wamp/boombox/a;).
        val boomboxClass = mutableClassDefBy(boomboxMatch.classDef.type)
        val boomboxOnActivated = boomboxMatch.method
        val cwdEngineField = boomboxOnActivated.instructions.firstNotNullOfOrNull { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
            if (insn.opcode == Opcode.IGET_OBJECT &&
                ref != null &&
                mutableClassDefByOrNull(ref.type)?.methods?.any { m ->
                    m.name == engineSetCrossfadeMethod.name &&
                        m.parameterTypes.map { it.toString() } == listOf("J") &&
                        m.returnType == "V"
                } == true
            ) {
                ref
            } else {
                null
            }
        } ?: throw PatchException("Could not resolve PlaybackEngine field in ${boomboxClass.type}.onActivated")

        val budType = cwdEngineField.type
        val budClass = mutableClassDefBy(budType)
        val budSetCrossfadeMethod = budClass.methods.single { m ->
            m.name == engineSetCrossfadeMethod.name &&
                m.parameterTypes.map { it.toString() } == listOf("J") &&
                m.returnType == "V"
        }

        val boomboxQueueField = boomboxClass.instanceFields.firstOrNull { f ->
            val cls = mutableClassDefByOrNull(f.type)
            cls != null &&
                cls.methods.any { it.name == "getCurrentItem" && it.parameterTypes.isEmpty() } &&
                cls.methods.any { it.name == "peekNext" && it.parameterTypes.isEmpty() }
        } ?: throw PatchException("Could not resolve LocalPlayQueue field on ${boomboxClass.type}")
        val localPlayQueueType = boomboxQueueField.type
        val localPlayQueueClass = mutableClassDefBy(localPlayQueueType)
        val queueGetCurrentMethod = localPlayQueueClass.methods.single {
            it.name == "getCurrentItem" && it.parameterTypes.isEmpty()
        }
        val queuePeekNextMethod = localPlayQueueClass.methods.single {
            it.name == "peekNext" && it.parameterTypes.isEmpty()
        }
        val uqdType = queueGetCurrentMethod.returnType
        val boomboxQueueNextMethod = boomboxClass.methods.single { m ->
            !AccessFlags.STATIC.isSet(m.accessFlags) &&
                m.parameterTypes.isEmpty() &&
                m.returnType == "V" &&
                m.implementation?.instructions?.any { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == localPlayQueueType && ref.name == "peekNext"
                } == true
        }

        // Resolve Lzi4;.f(Lc5b;)Z (canCrossfade), Lc5b;.b (trackId field), and Lyi4;.run()V (40 Hz fade ticker).
        val canCrossfadeMethod = crossfadeControllerClass.methods.single { m ->
            m.parameterTypes.size == 1 &&
                m.returnType == "Z" &&
                m.instructions.any { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
                    ref?.name == "DOLBY_ATMOS"
                }
        }
        val c5bType = canCrossfadeMethod.parameterTypes[0].toString()
        val c5bClass = mutableClassDefBy(c5bType)
        val c5bInit = c5bClass.methods.single { it.name == "<init>" }
        val c5bTrackIdReg = c5bInit.p0Register + 2
        val c5bTrackIdField = c5bInit.instructions.firstNotNullOfOrNull { insn ->
            if (insn.opcode == Opcode.IPUT_OBJECT && (insn as TwoRegisterInstruction).registerA == c5bTrackIdReg) {
                (insn as ReferenceInstruction).reference as FieldReference
            } else {
                null
            }
        } ?: throw PatchException("Could not resolve trackId field on $c5bType")

        val tickerRunMethod = crossfadeControllerClass.instanceFields.firstNotNullOfOrNull { f ->
            val runnableCls = mutableClassDefByOrNull(f.type)
            if (runnableCls != null && runnableCls.interfaces.contains("Ljava/lang/Runnable;")) {
                runnableCls.methods.firstOrNull { m ->
                    m.name == "run" &&
                        m.parameterTypes.isEmpty() &&
                        m.returnType == "V" &&
                        m.instructions.count { insn ->
                            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                            ref?.name == "setVolume" && ref.parameterTypes.map { it.toString() } == listOf("F")
                        } == 2
                }
            } else {
                null
            }
        } ?: throw PatchException("Could not resolve Crossfade ticker Runnable on $crossfadeControllerType")

        // Resolve TrackContextMenu item base class Lgs3; & Lgs3$a$a; (string title wrapper).
        val trackMenuBuildMethod = trackMenuMatch.method
        val gs3Type = trackMenuBuildMethod.instructions.firstNotNullOfOrNull { insn ->
            if (insn.opcode == Opcode.NEW_INSTANCE) {
                val t = ((insn as ReferenceInstruction).reference as TypeReference).type
                val sup = mutableClassDefByOrNull(t)?.superclass
                if (sup != null && sup != "Ljava/lang/Object;") sup else null
            } else {
                null
            }
        } ?: throw PatchException("Could not resolve ContextMenuItem base class in ${trackMenuMatch.classDef.type}")

        val gs3Class = mutableClassDefBy(gs3Type)
        val gs3Init = gs3Class.methods.single { it.name == "<init>" && it.parameterTypes.size == 8 }
        val gs3TextWrapperType = gs3Init.parameterTypes[0].toString()
        val gs3StringWrapperClass = classDefByOrNull { cls ->
            cls.superclass == gs3TextWrapperType &&
                cls.methods.any { m ->
                    m.name == "<init>" && m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;")
                }
        } ?: throw PatchException("Could not resolve String title wrapper subclass of $gs3TextWrapperType")
        val gs3StringWrapperInit = gs3StringWrapperClass.methods.single {
            it.name == "<init>" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;")
        }
        val gs3OnClickMethod = gs3Class.methods.single {
            it.parameterTypes.map { p -> p.toString() } == listOf("Landroidx/fragment/app/FragmentActivity;") &&
                it.returnType == "V"
        }

        val drawableWaves = resourceId(ResourceType.DRAWABLE, "ic_media_right_waves_regular")
        val colorDefaultMenu = resourceId(ResourceType.COLOR, "context_menu_default_color")

        // 3. Wire extension adapter classes to TIDAL interfaces & base classes.
        mutableClassDefBy(CROSSFADE_SETTINGS_CLICK_ADAPTER_CLASS).apply {
            addInterface(function0Type)
        }

        mutableClassDefBy(CROSSFADE_SETTINGS_ITEM_ADAPTER_CLASS).apply {
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

        mutableClassDefBy(CROSSFADE_CONTEXT_MENU_ITEM_ADAPTER_CLASS).apply {
            setSuperClass(gs3Type)
            val oldInit = methods.single { it.name == "<init>" }
            val newInit = ImmutableMethod(
                type,
                "<init>",
                oldInit.parameters.map { ImmutableMethodParameter(it.type, it.annotations, it.name) },
                "V",
                oldInit.accessFlags,
                oldInit.annotations,
                oldInit.hiddenApiRestrictions,
                MutableMethodImplementation(9),
            ).toMutable()
            newInit.addInstructions(
                0,
                """
                    check-cast p1, $gs3TextWrapperType
                    check-cast p4, Lcom/aspiro/wamp/eventtracking/model/ContentMetadata;
                    invoke-direct/range { p0 .. p8 }, $gs3Init
                    return-void
                """.trimIndent(),
            )
            methods.remove(oldInit)
            methods.add(newInit)

            addForwardingMethod(
                name = gs3OnClickMethod.name,
                params = listOf("Landroidx/fragment/app/FragmentActivity;"),
                returnType = "V",
                implName = "onClickedImpl",
                implParams = listOf("Ljava/lang/Object;"),
                implReturnType = "V",
            )
        }

        // 4. Populate CrossfadeTidalBridge native* methods.
        val bridgeClass = mutableClassDefBy(CROSSFADE_BRIDGE_CLASS)

        replaceBridgeMethod(
            bridgeClass,
            "nativeReadDurationSeconds",
            """
                if-nez p0, :has_pref
                invoke-static {}, $CROSSFADE_CONFIG_CLASS->getDefaultDurationSeconds()I
                move-result v0
                return v0
                :has_pref
                check-cast p0, $crossfadePrefType
                invoke-virtual { p0 }, $prefReadMethod
                move-result v0
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeWriteDurationSeconds",
            """
                if-nez p0, :has_pref
                return-void
                :has_pref
                check-cast p0, $crossfadePrefType
                iget-object v0, p0, $prefStoreField
                if-nez v0, :has_store
                return-void
                :has_store
                const-string v1, "crossfade_duration"
                invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v2
                invoke-interface { v0, v1, v2 }, $zdgPutIntMethod
                move-result-object v0
                if-eqz v0, :done
                invoke-virtual { v0 }, $editorApplyMethod
                :done
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeSetEngineCrossfadeDurationMs",
            """
                if-nez p0, :has_engine
                return-void
                :has_engine
                check-cast p0, $budType
                invoke-interface { p0, p1, p2 }, $budSetCrossfadeMethod
                return-void
            """,
        )

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

        replaceBridgeMethod(
            bridgeClass,
            "nativeCreateContextMenuItem",
            """
                if-nez p0, :has_track
                const/4 v0, 0x0
                return-object v0
                :has_track
                check-cast p0, Lcom/aspiro/wamp/model/MediaItem;
                invoke-virtual { p0 }, Lcom/aspiro/wamp/model/MediaItem;->getId()I
                move-result v0
                invoke-static { v0 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                move-result-object v0
                new-instance v4, Lcom/aspiro/wamp/eventtracking/model/ContentMetadata;
                const-string v1, "track"
                invoke-direct { v4, v1, v0 }, Lcom/aspiro/wamp/eventtracking/model/ContentMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;)V
                new-instance v1, ${gs3StringWrapperClass.type}
                invoke-direct { v1, p1 }, $gs3StringWrapperInit
                move v2, p2
                if-nez v2, :has_icon
                const v2, $drawableWaves
                :has_icon
                move v6, p3
                if-nez v6, :has_color
                const v6, $colorDefaultMenu
                :has_color
                const-string v3, "materialtidal_crossfade"
                const/4 v5, 0x0
                const/4 v7, 0x0
                const/16 v8, 0x50
                new-instance v0, $CROSSFADE_CONTEXT_MENU_ITEM_ADAPTER_CLASS
                invoke-direct/range { v0 .. v8 }, $CROSSFADE_CONTEXT_MENU_ITEM_ADAPTER_CLASS-><init>(Ljava/lang/Object;ILjava/lang/String;Ljava/lang/Object;IIII)V
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeFindConsecutiveSameAlbumNextTrackId",
            """
                if-nez p0, :non_null
                const/4 v0, 0x0
                return-object v0
                :non_null
                check-cast p0, $localPlayQueueType
                invoke-virtual { p0 }, $queueGetCurrentMethod
                move-result-object v0
                if-eqz v0, :fail
                invoke-virtual { p0 }, $queuePeekNextMethod
                move-result-object v1
                if-eqz v1, :fail
                invoke-interface { v0 }, $uqdType->getMediaItem()Lcom/aspiro/wamp/model/MediaItem;
                move-result-object v0
                if-eqz v0, :fail
                invoke-interface { v1 }, $uqdType->getMediaItem()Lcom/aspiro/wamp/model/MediaItem;
                move-result-object v1
                if-eqz v1, :fail
                invoke-virtual { v0 }, Lcom/aspiro/wamp/model/MediaItem;->getAlbum()Lcom/aspiro/wamp/model/Album;
                move-result-object v2
                if-eqz v2, :fail
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getAlbum()Lcom/aspiro/wamp/model/Album;
                move-result-object v3
                if-eqz v3, :fail
                invoke-virtual { v2 }, Lcom/aspiro/wamp/model/Album;->getId()I
                move-result v2
                if-lez v2, :fail
                invoke-virtual { v3 }, Lcom/aspiro/wamp/model/Album;->getId()I
                move-result v3
                if-ne v2, v3, :fail
                invoke-virtual { v0 }, Lcom/aspiro/wamp/model/MediaItem;->getVolumeNumber()I
                move-result v2
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getVolumeNumber()I
                move-result v3
                if-ne v2, v3, :fail
                invoke-virtual { v0 }, Lcom/aspiro/wamp/model/MediaItem;->getTrackNumber()I
                move-result v2
                if-lez v2, :fail
                add-int/lit8 v2, v2, 0x1
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getTrackNumber()I
                move-result v3
                if-ne v2, v3, :fail
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getIdAsString()Ljava/lang/String;
                move-result-object v0
                return-object v0
                :fail
                const/4 v0, 0x0
                return-object v0
            """,
        )

        // 5. Hook App.onCreate() to register ActivityLifecycleCallbacks and initialize CrossfadePrefs.
        appOnCreateMatch.method.let { m ->
            val p0 = m.p0Register
            val sputIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.SPUT_OBJECT &&
                    ((insn as ReferenceInstruction).reference as FieldReference).definingClass == "Lcom/aspiro/wamp/App;"
            }
            if (sputIdx < 0) {
                throw PatchException("Could not find App.w sput-object in App.onCreate")
            }
            m.addInstructions(
                sputIdx + 1,
                "invoke-static/range { v$p0 .. v$p0 }, $CROSSFADE_BRIDGE_CLASS->initApplication(Landroid/app/Application;)V",
            )
        }

        // 6. Unlock mf-player-crossfade feature flag across all evaluation sites (immune to remote overrides).
        flagMatch.method.let { m ->
            val zeroIdx = m.instructions.indexOfFirst { insn ->
                insn is NarrowLiteralInstruction && insn.narrowLiteral == 0
            }
            if (zeroIdx < 0) {
                throw PatchException("Could not find false literal in $mwdType.<clinit>")
            }
            val reg = (m.getInstruction(zeroIdx) as OneRegisterInstruction).registerA
            m.replaceInstruction(zeroIdx, "const/4 v$reg, 0x1")
        }

        durationLambdaMatch.method.let { m ->
            val zGetIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.IGET_BOOLEAN &&
                    ((insn as ReferenceInstruction).reference as FieldReference).type == "Z"
            }
            if (zGetIdx < 0) {
                throw PatchException("Could not find Z$0 iget-boolean in ${m.definingClass}.${m.name}")
            }
            val zReg = (m.getInstruction(zGetIdx) as TwoRegisterInstruction).registerA
            m.addInstructions(zGetIdx + 1, "const/16 v$zReg, 0x1")
        }

        // Hook Lk61.a() (Audio & Playback settings list builder) and Lk61.b() (refresh events Observable).
        settingsBuildMatch.method.let { m ->
            val insns = m.instructions
            val mwdSgetIdx = insns.indexOfFirst { insn ->
                insn.opcode == Opcode.SGET_OBJECT &&
                    ((insn as ReferenceInstruction).reference as FieldReference).definingClass == mwdType
            }
            if (mwdSgetIdx < 0) {
                throw PatchException("Could not find $mwdType sget-object in ${m.definingClass}.${m.name}")
            }
            val moveResultIdx = (mwdSgetIdx until minOf(insns.size, mwdSgetIdx + 5)).firstOrNull { idx ->
                insns[idx].opcode == Opcode.MOVE_RESULT
            } ?: throw PatchException("Could not find move-result after $mwdType check in ${m.definingClass}.${m.name}")
            val flagReg = (m.getInstruction(moveResultIdx) as OneRegisterInstruction).registerA

            val addCallIdx = (moveResultIdx until insns.size).firstOrNull { idx ->
                val ref = (insns[idx] as? ReferenceInstruction)?.reference as? MethodReference
                insns[idx].opcode == Opcode.INVOKE_VIRTUAL &&
                    ref?.definingClass == "Ljava/util/ArrayList;" &&
                    ref.name == "add"
            } ?: throw PatchException("Could not find ArrayList.add for Crossfade in ${m.definingClass}.${m.name}")

            val addInsn = m.getInstruction(addCallIdx) as FiveRegisterInstruction
            val listReg = addInsn.registerC
            val itemReg = addInsn.registerD

            // Insert at higher index first so moveResultIdx stays valid.
            m.addInstructions(
                addCallIdx + 1,
                "invoke-static { v$listReg, v$itemReg }, $CROSSFADE_BRIDGE_CLASS->onAudioPlaybackSettingsBuilt(Ljava/util/List;Ljava/lang/Object;)V",
            )
            m.addInstructions(moveResultIdx + 1, "const/16 v$flagReg, 0x1")
        }

        k61Class.methods.single {
            it.returnType == "Lio/reactivex/Observable;" && it.parameterTypes.isEmpty()
        }.let { m ->
            val retIdx = m.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            if (retIdx < 0) {
                throw PatchException("Could not find return-object in ${k61Class.type}.${m.name}")
            }
            val retReg = (m.getInstruction(retIdx) as OneRegisterInstruction).registerA
            m.addInstructionsAtControlFlowLabel(
                retIdx,
                """
                    invoke-static/range { v$retReg .. v$retReg }, $CROSSFADE_BRIDGE_CLASS->mergeSettingsRefreshObservable(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$retReg
                    check-cast v$retReg, Lio/reactivex/Observable;
                """.trimIndent(),
            )
        }

        // Hook Lyog.call() (native Crossfade slider commit) to also refresh our style row badge.
        commitMatch.method.let { m ->
            val retIdx = m.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            if (retIdx < 0) {
                throw PatchException("Could not find return-object in ${m.definingClass}.${m.name}")
            }
            m.addInstructionsAtControlFlowLabel(
                retIdx,
                "invoke-static {}, $CROSSFADE_BRIDGE_CLASS->notifySettingsStyleItemChanged()V",
            )
        }

        // Hook BoomboxPlayback.onActivated to force mf-player-crossfade=true (v21 > 15!) & capture Lbud; engine.
        boomboxOnActivated.let { m ->
            val insns = m.instructions
            val mwdSgetIdx = insns.indexOfFirst { insn ->
                insn.opcode == Opcode.SGET_OBJECT &&
                    ((insn as ReferenceInstruction).reference as FieldReference).definingClass == mwdType
            }
            if (mwdSgetIdx < 0) {
                throw PatchException("Could not find $mwdType sget-object in ${m.definingClass}.${m.name}")
            }
            val moveResultIdx = (mwdSgetIdx until minOf(insns.size, mwdSgetIdx + 5)).firstOrNull { idx ->
                insns[idx].opcode == Opcode.MOVE_RESULT
            } ?: throw PatchException("Could not find move-result after $mwdType check in ${m.definingClass}.${m.name}")
            val flagReg = (m.getInstruction(moveResultIdx) as OneRegisterInstruction).registerA

            val engineGetIdx = insns.indexOfFirst { insn ->
                insn.opcode == Opcode.IGET_OBJECT &&
                    ((insn as ReferenceInstruction).reference as FieldReference) == cwdEngineField
            }
            if (engineGetIdx < 0) {
                throw PatchException("Could not find $cwdEngineField iget-object in ${m.definingClass}.${m.name}")
            }
            val engineReg = (m.getInstruction(engineGetIdx) as TwoRegisterInstruction).registerA

            if (engineGetIdx > moveResultIdx) {
                m.addInstructions(
                    engineGetIdx + 1,
                    "invoke-static/range { v$engineReg .. v$engineReg }, $CROSSFADE_BRIDGE_CLASS->registerPlaybackEngine(Ljava/lang/Object;)V",
                )
                m.addInstructions(moveResultIdx + 1, "const/16 v$flagReg, 0x1")
            } else {
                m.addInstructions(moveResultIdx + 1, "const/16 v$flagReg, 0x1")
                m.addInstructions(
                    engineGetIdx + 1,
                    "invoke-static/range { v$engineReg .. v$engineReg }, $CROSSFADE_BRIDGE_CLASS->registerPlaybackEngine(Ljava/lang/Object;)V",
                )
            }
        }

        // Hook ExoPlayerPlaybackEngine.<init> to guarantee CrossfadeController (E:Lzi4;) is always instantiated.
        engineInitMethod.let { m ->
            val insns = m.instructions
            val ifEqzIdx = (zi4PutIdx downTo maxOf(0, zi4PutIdx - 12)).firstOrNull { idx ->
                insns[idx].opcode == Opcode.IF_EQZ
            } ?: throw PatchException("Could not find if-eqz guarding $crossfadeControllerType in ${engineClass.type}.<init>")
            val boolReg = (m.getInstruction(ifEqzIdx) as OneRegisterInstruction).registerA
            m.addInstructions(ifEqzIdx, "const/16 v$boolReg, 0x1")
        }

        // 7. Hook CrossfadePreference (<init>, b(), a()) to capture instance and use configurable default duration.
        prefInitMatch.method.let { m ->
            val p0 = m.p0Register
            val retIdx = m.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (retIdx < 0) {
                throw PatchException("Could not find return-void in $crossfadePrefType.<init>")
            }
            m.addInstructions(
                retIdx,
                "invoke-static/range { v$p0 .. v$p0 }, $CROSSFADE_BRIDGE_CLASS->registerCrossfadePreference(Ljava/lang/Object;)V",
            )
        }

        for (prefMethod in listOf(prefReadMatch.method, prefFlowMatch.method)) {
            val insns = prefMethod.instructions
            val strIdx = insns.indexOfFirst { insn ->
                (insn.opcode == Opcode.CONST_STRING || insn.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((insn as ReferenceInstruction).reference as StringReference).string == "crossfade_duration"
            }
            if (strIdx < 0) {
                throw PatchException("Could not find 'crossfade_duration' in ${prefMethod.definingClass}.${prefMethod.name}")
            }
            val zeroIdx = ((strIdx + 1) until minOf(insns.size, strIdx + 5)).firstOrNull { idx ->
                val insn = insns[idx]
                insn is NarrowLiteralInstruction && insn.narrowLiteral == 0
            } ?: throw PatchException("Could not find default 0 literal in ${prefMethod.definingClass}.${prefMethod.name}")
            val defReg = (prefMethod.getInstruction(zeroIdx) as OneRegisterInstruction).registerA
            prefMethod.replaceInstruction(
                zeroIdx,
                "invoke-static {}, $CROSSFADE_CONFIG_CLASS->getDefaultDurationSeconds()I",
            )
            prefMethod.addInstructions(zeroIdx + 1, "move-result v$defReg")
        }

        // 8. Hook BoomboxPlayback.m() (peekNext queue evaluation) & Lzi4.f(Lc5b;)Z for gapless-album preservation.
        boomboxQueueNextMethod.let { m ->
            val qGetIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.IGET_OBJECT &&
                    ((insn as ReferenceInstruction).reference as FieldReference) == boomboxQueueField
            }
            if (qGetIdx < 0) {
                throw PatchException("Could not find $boomboxQueueField read in ${boomboxClass.type}.${m.name}")
            }
            val qReg = (m.getInstruction(qGetIdx) as TwoRegisterInstruction).registerA
            m.addInstructions(
                qGetIdx + 1,
                "invoke-static/range { v$qReg .. v$qReg }, $CROSSFADE_BRIDGE_CLASS->onNextQueueEvaluated(Ljava/lang/Object;)V",
            )
        }

        canCrossfadeMethod.let { m ->
            if (m.p0Register < 1) {
                throw PatchException("Expected p0 >= 1 in ${m.definingClass}.${m.name}, got ${m.p0Register}")
            }
            val p1Reg = m.p0Register + 1
            m.addInstructionsWithLabels(
                0,
                """
                    iget-object v0, v$p1Reg, $c5bTrackIdField
                    invoke-static { v0 }, $CROSSFADE_ENGINE_CLASS->shouldSkipForGaplessAlbum(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :mt_allow_crossfade
                    const/4 v0, 0x0
                    return v0
                    :mt_allow_crossfade
                    nop
                """.trimIndent(),
            )
        }

        // 9. Upgrade Lyi4.run() to 40 Hz (25 ms) and wire 4 selectable curves + blend strength shaping.
        tickerRunMethod.let { m ->
            val insns = m.instructions
            val setVolIndices = insns.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                            ref.name == "setVolume" && ref.parameterTypes.map { it.toString() } == listOf("F")
                        } == true
                }
                .map { it.index }
            if (setVolIndices.size != 2) {
                throw PatchException("Expected 2 setVolume(F)V calls in ${m.definingClass}.run, found ${setVolIndices.size}")
            }
            val firstSetVolIdx = setVolIndices[0]
            val secondSetVolIdx = setVolIndices[1]

            val firstSetVolInsn = m.getInstruction(firstSetVolIdx) as FiveRegisterInstruction
            val secondSetVolInsn = m.getInstruction(secondSetVolIdx) as FiveRegisterInstruction
            val outPlayerReg = firstSetVolInsn.registerC
            val scratchReg = firstSetVolInsn.registerD
            val inPlayerReg = secondSetVolInsn.registerC
            val gt6SetVolumeMethod = (m.getInstruction(firstSetVolIdx) as ReferenceInstruction).reference as MethodReference

            val mulIdx = (firstSetVolIdx downTo maxOf(1, firstSetVolIdx - 14)).firstOrNull { idx ->
                insns[idx].opcode == Opcode.MUL_FLOAT && insns[idx - 1].opcode == Opcode.MOVE_RESULT
            } ?: throw PatchException("Could not find smoothstep mul-float after move-result in ${m.definingClass}.run")

            val moveResultIdx = mulIdx - 1
            val tReg = (m.getInstruction(moveResultIdx) as OneRegisterInstruction).registerA

            val cmplRegs = ((moveResultIdx + 1) until secondSetVolIdx)
                .filter { insns[it].opcode == Opcode.CMPL_FLOAT }
                .map { (m.getInstruction(it) as ThreeRegisterInstruction).registerB }
            if (cmplRegs.size != 2) {
                throw PatchException("Expected 2 cmpl-float target volume checks in ${m.definingClass}.run, found ${cmplRegs.size}")
            }
            val outTargetReg = cmplRegs[0]
            val inTargetReg = cmplRegs[1]

            val impl = m.implementation
                ?: throw PatchException("Missing method implementation on ${m.definingClass}.run")
            for (idx in secondSetVolIdx downTo (moveResultIdx + 1)) {
                impl.removeInstruction(idx)
            }

            m.addInstructions(
                moveResultIdx + 1,
                """
                    invoke-static { v$tReg, v$outTargetReg }, $CROSSFADE_ENGINE_CLASS->computeFadeOutGain(FF)F
                    move-result v$scratchReg
                    invoke-virtual { v$outPlayerReg, v$scratchReg }, $gt6SetVolumeMethod
                    invoke-static { v$tReg, v$inTargetReg }, $CROSSFADE_ENGINE_CLASS->computeFadeInGain(FF)F
                    move-result v$scratchReg
                    invoke-virtual { v$inPlayerReg, v$scratchReg }, $gt6SetVolumeMethod
                """.trimIndent(),
            )

            // Upgrade active crossfade tick interval from 50 ms (20 Hz) to 25 ms (40 Hz).
            val tick50Idx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.CONST_WIDE_16 && (insn as WideLiteralInstruction).wideLiteral == 50L
            }
            if (tick50Idx < 0) {
                throw PatchException("Could not find 50ms tick constant in ${m.definingClass}.run")
            }
            val tickReg = (m.getInstruction(tick50Idx) as OneRegisterInstruction).registerA
            m.replaceInstruction(tick50Idx, "const-wide/16 v$tickReg, 0x19")
        }

        // 10. Hook TrackContextMenu.b() to add the Crossfade item in the Now Playing player menu.
        trackMenuBuildMethod.let { m ->
            val insns = m.instructions
            val fCallIdx = insns.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_STATIC &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                        ref.definingClass == trackMenuMatch.classDef.type &&
                            ref.parameterTypes.map { it.toString() } == listOf("Lcom/aspiro/wamp/model/Track;") &&
                            ref.returnType == "Z"
                    } == true
            }
            if (fCallIdx < 0) {
                throw PatchException("Could not find TrackContextMenu.f(Track)Z in ${m.definingClass}.${m.name}")
            }
            val trackReg = (m.getInstruction(fCallIdx) as FiveRegisterInstruction).registerC
            val prevAddIdx = (fCallIdx - 1 downTo maxOf(0, fCallIdx - 20)).firstOrNull { idx ->
                val ref = (insns[idx] as? ReferenceInstruction)?.reference as? MethodReference
                insns[idx].opcode == Opcode.INVOKE_VIRTUAL &&
                    ref?.definingClass == "Ljava/util/ArrayList;" &&
                    ref.name == "add"
            } ?: throw PatchException("Could not find preceding ArrayList.add in ${m.definingClass}.${m.name}")
            val listReg = (m.getInstruction(prevAddIdx) as FiveRegisterInstruction).registerC

            m.addInstructionsAtControlFlowLabel(
                fCallIdx,
                "invoke-static { v$listReg, v$trackReg }, $CROSSFADE_BRIDGE_CLASS->addPlayerContextMenuItem(Ljava/util/List;Ljava/lang/Object;)V",
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
