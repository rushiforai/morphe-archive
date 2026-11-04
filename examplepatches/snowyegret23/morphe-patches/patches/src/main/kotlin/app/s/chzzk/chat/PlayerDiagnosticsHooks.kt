package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val DIAGNOSTICS = "Lapp/s/chzzk/extension/PlayerDiagnostics;"
private const val PRISM = "Lcom/naver/prismplayer/"
private const val NATIVE_PLAYER = "${PRISM}player/PrismPlayer;"
private const val PARAMS = "${PRISM}player/PlaybackParams;"
private const val STREAM_SOURCE = "${PRISM}player/MediaStreamSource;"
private const val STREAM = "${PRISM}MediaStream;"
private const val LOW_LATENCY = "${PRISM}player/LowLatencyLiveConfiguration;"
private const val BASE_VIEW = "Lcom/navercorp/game/android/community/core/feature/feature/player/BasePlayerView;"

internal fun BytecodePatchContext.addPlayerDiagnosticsHooks() {
    fun bridge(name: String, registers: Int, body: String) {
        val extension = mutableClassDefBy(DIAGNOSTICS)
        val original = extension.methods.single { it.name == name }
        val replacement = MutableMethod(ImmutableMethod(
            extension.type, original.name, original.parameters, original.returnType, original.accessFlags,
            original.annotations, original.hiddenApiRestrictions,
            ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())
        ))
        replacement.addInstructions(0, body.trimIndent())
        extension.methods.remove(original)
        extension.methods.add(replacement)
    }

    fun getter(field: FieldReference): Method = classDefBy(field.definingClass).methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType == field.type &&
            method.implementation?.instructions?.count() == 2 &&
            method.implementation?.instructions?.any {
                it.getReference<FieldReference>()?.smaliReference == field.smaliReference
            } == true
    }

    val player = classDefBy(NATIVE_PLAYER)
    fun playerMethod(name: String, type: String) = player.methods.single {
        it.name == name && it.parameterTypes.isEmpty() && it.returnType == type
    }
    val mediaType = "${PRISM}Media;"
    val mediaGetter = playerMethod("getMedia", mediaType)
    val isLive = classDefBy(mediaType).methods.single {
        it.name == "z" && it.parameterTypes.isEmpty() && it.returnType == "Z"
    }
    val nativeView = mutableClassDefBy(BASE_VIEW)
    val playerGetter = nativeView.methods.single {
        it.name == "getPlayer" && it.parameterTypes.isEmpty() && it.returnType == NATIVE_PLAYER
    }
    // Duration shares the seek/current window; getLivePosition uses broadcast time.
    val positions = listOf("getCurrentPosition", "getBufferedPosition", "getDuration")
        .map { playerMethod(it, "J") }
    val dimensions = listOf("getVideoWidth", "getVideoHeight")
        .map { playerMethod(it, "Ljava/lang/Integer;") }
    bridge("sample", 12, """
        move-object/from16 v0, p0
        check-cast v0, $BASE_VIEW
        invoke-virtual {v0}, ${playerGetter.smaliReference}
        move-result-object v0
        if-eqz v0, :missing
        invoke-interface {v0}, ${playerMethod("isPlayingAd", "Z").smaliReference}
        move-result v2
        if-nez v2, :missing
        invoke-interface {v0}, ${mediaGetter.smaliReference}
        move-result-object v2
        if-eqz v2, :missing
        invoke-virtual {v2}, ${isLive.smaliReference}
        move-result v2
        if-eqz v2, :missing
        ${positions.mapIndexed { index, method -> """
            invoke-interface {v0}, ${method.smaliReference}
            move-result-wide v4
            const/4 v6, $index
            aput-wide v4, p1, v6
        """.trimIndent() }.joinToString("\n")}
        ${dimensions.mapIndexed { index, method -> """
            invoke-interface {v0}, ${method.smaliReference}
            move-result-object v2
            const-wide/16 v4, 0x0
            if-eqz v2, :dimension_$index
            invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I
            move-result v4
            int-to-long v4, v4
            :dimension_$index
            const/4 v6, ${index + 3}
            aput-wide v4, p1, v6
        """.trimIndent() }.joinToString("\n")}
        const/4 v0, 0x1
        return v0
        :missing
        const/4 v0, 0x0
        return v0
    """)

    val attach = nativeView.methods.single { it.name == "onAttachedToWindow" }
    val attachReturn = attach.implementation!!.instructions.withIndex().single {
        it.value.opcode == Opcode.RETURN_VOID
    }.index
    attach.addInstructions(attachReturn,
        "invoke-static/range {p0 .. p0}, $DIAGNOSTICS->attach(Landroid/view/ViewGroup;)V")

    val config = classDefBy("${PRISM}api/gpop/model/resolved/GpopConfigResult;")
    val resolved = "${PRISM}api/gpop/model/resolved/PlaybackParameter;"
    val apply = config.methods.single { it.parameterTypeNames == listOf(PARAMS, resolved) }
    val applyInstructions = apply.implementation!!.instructions.toList()
    val paramsClass = classDefBy(PARAMS)
    val setters = listOf("getMinBufferMs", "getMaxBufferMs", "getBufferForPlaybackMs", "getBufferForPlaybackAfterRebufferMs").map { name ->
        val start = applyInstructions.indices.single { index ->
            applyInstructions[index].getReference<MethodReference>()?.let {
                it.definingClass == resolved && it.name == name
            } == true
        }
        val reference = applyInstructions.drop(start + 1).firstNotNullOf { instruction ->
            instruction.getReference<MethodReference>()?.takeIf {
                it.definingClass == PARAMS && it.parameterTypeNames == listOf("I") && it.returnType == "V"
            }
        }
        paramsClass.methods.single { it.smaliReference == reference.smaliReference }
    }
    val bufferGetters = setters.map { setter ->
        val field = setter.implementation!!.instructions.single {
            it.opcode == Opcode.IPUT && it.getReference<FieldReference>()?.definingClass == PARAMS
        }.getReference<FieldReference>()!!
        getter(field)
    }
    val clone = classDefBy("${PRISM}player/PlaybackParamsKt;").methods.single {
        it.parameterTypeNames == listOf(PARAMS) && it.returnType == PARAMS
    }
    val source = classDefBy(STREAM_SOURCE)
    fun sourceMethod(name: String, type: String) = source.methods.single {
        it.name == name && it.parameterTypes.isEmpty() && it.returnType == type
    }
    val stream = classDefBy(STREAM)
    val track = stream.methods.single {
        it.parameterTypes.isEmpty() && it.returnType == "${PRISM}player/quality/Track;"
    }
    val lowLatencyFlag = stream.methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType == "Z" &&
            method.implementation?.instructions?.any {
                it.getReference<FieldReference>()?.let { ref ->
                    ref.definingClass == STREAM && ref.name == "g" && ref.type == "Z"
                } == true
            } == true
    }
    bridge("applyProfile", 18, """
        move-object/from16 v0, p2
        if-eqz v0, :done
        invoke-static {}, $DIAGNOSTICS->profileMode()I
        move-result v1
        if-eqz v1, :done
        move-object/from16 v2, p0
        if-eqz v2, :done
        check-cast v2, $STREAM_SOURCE
        invoke-interface {v2}, ${sourceMethod("a", "Z").smaliReference}
        move-result v3
        if-eqz v3, :done
        invoke-interface {v2}, ${sourceMethod("h", "Z").smaliReference}
        move-result v3
        if-nez v3, :done
        invoke-interface {v2}, ${sourceMethod("u", "J").smaliReference}
        move-result-wide v3
        const-wide/16 v5, 0x0
        cmp-long v3, v3, v5
        if-gtz v3, :done
        invoke-interface {v2}, ${sourceMethod("getExtra", "Ljava/util/Map;").smaliReference}
        move-result-object v2
        invoke-static {v2}, $DIAGNOSTICS->profileAllowed(Ljava/util/Map;)Z
        move-result v2
        if-eqz v2, :done
        move-object/from16 v2, p1
        if-eqz v2, :done
        check-cast v2, $STREAM
        invoke-virtual {v2}, ${track.smaliReference}
        move-result-object v3
        instance-of v3, v3, ${PRISM}player/quality/VideoTrack;
        if-eqz v3, :done
        check-cast v0, $PARAMS
        invoke-static {v0}, ${clone.smaliReference}
        move-result-object v0
        move v4, v1
        ${bufferGetters.mapIndexed { index, method -> """
            invoke-virtual {v0}, ${method.smaliReference}
            move-result v${index + 5}
        """.trimIndent() }.joinToString("\n")}
        invoke-static/range {v4 .. v8}, $DIAGNOSTICS->bufferProfile(IIIII)[I
        move-result-object v4
        if-eqz v4, :done
        ${setters.mapIndexed { index, method -> """
            const/4 v5, $index
            aget v6, v4, v5
            invoke-virtual {v0, v6}, ${method.smaliReference}
        """.trimIndent() }.joinToString("\n")}
        invoke-virtual {v2}, ${lowLatencyFlag.smaliReference}
        move-result v3
        if-eqz v3, :done
        invoke-static {v0, v1}, $DIAGNOSTICS->applyLowLatency(Ljava/lang/Object;I)V
        :done
        return-object v0
    """)

    val low = classDefBy(LOW_LATENCY)
    val lowTypes = listOf("J", "F", "F", "Z", "J", "J", "F", "J", "J", "F")
    val lowConstructor = low.methods.single { it.name == "<init>" && it.parameterTypeNames == lowTypes }
    val lowFields = lowConstructor.implementation!!.instructions.mapNotNull { instruction ->
        if (instruction.opcode !in setOf(Opcode.IPUT, Opcode.IPUT_WIDE, Opcode.IPUT_BOOLEAN)) null
        else instruction.getReference<FieldReference>()?.takeIf { it.definingClass == LOW_LATENCY }
    }
    check(lowFields.map { it.type } == lowTypes)
    val lowGetters = lowFields.map { getter(it) }
    val lowParamSetter = paramsClass.methods.single {
        it.parameterTypeNames == listOf(LOW_LATENCY) && it.returnType == "V"
    }
    val lowParamGetter = paramsClass.methods.single {
        it.parameterTypes.isEmpty() && it.returnType == LOW_LATENCY
    }
    bridge("applyLowLatency", 20, """
        move-object/from16 v16, p0
        check-cast v16, $PARAMS
        invoke-virtual/range {v16 .. v16}, ${lowParamGetter.smaliReference}
        move-result-object v16
        if-eqz v16, :done
        invoke-virtual/range {v16 .. v16}, ${lowGetters[4].smaliReference}
        move-result-wide v6
        invoke-virtual/range {v16 .. v16}, ${lowGetters[5].smaliReference}
        move-result-wide v8
        invoke-virtual/range {v16 .. v16}, ${lowGetters[0].smaliReference}
        move-result-wide v4
        move/from16 v3, p1
        invoke-static/range {v3 .. v9}, $DIAGNOSTICS->targetOffset(IJJJ)J
        move-result-wide v1
        ${listOf(1 to 3, 2 to 4, 3 to 5, 6 to 10, 7 to 11, 8 to 13, 9 to 15).map { (index, register) -> """
            invoke-virtual/range {v16 .. v16}, ${lowGetters[index].smaliReference}
            move-result${if (lowTypes[index] == "J") "-wide" else ""} v$register
        """.trimIndent() }.joinToString("\n")}
        new-instance v0, $LOW_LATENCY
        invoke-direct/range {v0 .. v15}, ${lowConstructor.smaliReference}
        move-object/from16 v16, p0
        check-cast v16, $PARAMS
        move-object/from16 v17, v0
        invoke-virtual/range {v16 .. v17}, ${lowParamSetter.smaliReference}
        :done
        return-void
    """)

    val provider = mutableClassDefBy("${PRISM}SupportPlaybackConfigProvider;")
    val original = provider.methods.single {
        it.parameterTypeNames == listOf(STREAM_SOURCE, STREAM, PARAMS, "${PRISM}player/WhereFilter;") && it.returnType == PARAMS
    }
    check(original.implementation!!.instructions.any {
        it.getReference<MethodReference>()?.let { ref ->
            ref.definingClass == config.type && ref.name == "applyToPlaybackParams"
        } == true
    })
    val preserved = MutableMethod(ImmutableMethod(
        provider.type, "sChzzkOriginalPlaybackConfig", original.parameters, original.returnType,
        original.accessFlags, original.annotations, original.hiddenApiRestrictions, original.implementation
    ))
    val wrapper = MutableMethod(ImmutableMethod(
        provider.type, original.name, original.parameters, original.returnType,
        original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        ImmutableMethodImplementation(9, emptyList(), emptyList(), emptyList())
    ))
    wrapper.addInstructions(0, """
        invoke-virtual/range {p0 .. p4}, ${preserved.smaliReference}
        move-result-object v0
        move-object/from16 v1, p1
        move-object/from16 v2, p2
        move-object v3, v0
        invoke-static/range {v1 .. v3}, $DIAGNOSTICS->applyProfile(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v0
        check-cast v0, $PARAMS
        return-object v0
    """.trimIndent())
    provider.methods.remove(original)
    provider.methods.add(preserved)
    provider.methods.add(wrapper)
}
