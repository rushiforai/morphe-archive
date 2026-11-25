package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.addHelperMethodIfMissing
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.isOpcode
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

// 18.6.3 renamed the whole Advanced Voice chain. Every target below comes from the generated
// bindings instead of being repeated as a literal, so a future release only needs a binding
// update. Old -> 18.6.3:
//   readiness holder          Lssi;->a()Z              -> Lsmi;->a()Z   (flag field Lsmi;->b:Lwbb;)
//   eligibility constructor   Lssx;(...,Set)           -> Lsmz;(...,Set)
//   formatter constructor     Lsmo;(Locale,Letg;,...)  -> Lsgm;(Locale,Leqn;,...)
//   model download            Lsjt;(Context,...)       -> Lsdx;(Context,Lsdy;,Lsdr;,Lacdy;)
//   download journal          Lacbw;->ak(Laclu;ILachc;I) -> Labue;->bJ(Lacdy;ILabzl;I)
//   zh-TW callback            Lsjs;(Lsjt;,Locale,...)  -> Lsdw;(Lsdx;,Locale,Labxm;)
//   settings/config gate      Letg;->c:Leta; / Leta;->H -> Leqn;->c:Leqh; / Leqh;->H
private const val VOICE_CALLBACK_INTERFACE = "Labzl;"

private const val NATIVE_READINESS_HELPER = "morpheNativeSplitReady"
private const val MDD_REQUEST_HELPER = "morpheRequestZhTwMdd"
private const val ZH_TW_FORMATTER_HELPER = "morpheZhTwFormatter"

internal val gboardAdvancedVoiceZhTwPatch = bytecodePatch(
    description = "18.6.3精確的繁中標點、MDD與真實native payload檢查。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)
    execute {
        // Resolve everything up front: a renamed class fails here with the binding name in the
        // message instead of producing an injected call that only breaks at runtime.
        val readiness = GboardVersionBindings.voiceNativeReadiness.resolve(this)
        GboardVersionBindings.voiceFlagHolderField.resolve(this)
        GboardVersionBindings.voiceFlagGetter.resolve(this)
        val eligibility = GboardVersionBindings.voiceEligibilityConstructor.resolve(this)
        val mdd = GboardVersionBindings.voiceMddConstructor.resolve(this)
        GboardVersionBindings.voiceMddManagerField.resolve(this)
        GboardVersionBindings.voiceMddRequest.resolve(this)
        GboardVersionBindings.voiceZhTwCallbackConstructor.resolve(this)
        val formatter = GboardVersionBindings.voiceFormatterConstructor.resolve(this)
        GboardVersionBindings.voiceConfigField.resolve(this)
        GboardVersionBindings.voiceConfigSingleton.resolve(this)
        GboardVersionBindings.voiceConfigGate.resolve(this)
        check(VOICE_CALLBACK_INTERFACE in mutableClass(
            GboardVersionBindings.voiceZhTwCallbackConstructor.ownerDescriptor
        ).interfaces) {
            "Zh-TW callback no longer implements $VOICE_CALLBACK_INTERFACE"
        }

        val readinessOwner = GboardVersionBindings.voiceNativeReadiness.ownerDescriptor
        mutableClass(readinessOwner).addHelperMethodIfMissing(
            name = NATIVE_READINESS_HELPER,
            parameterTypes = listOf("Z"),
            returnType = "Z",
            accessFlags = 0x1a,
            registerCount = 3,
            body = advancedVoiceZhTwNativeBody(),
        )
        val readinessReturns = readiness.implementation!!.instructions.indices.filter { index ->
            readiness.implementation!!.instructions[index].isOpcode("RETURN")
        }
        check(readinessReturns.isNotEmpty()) { "Gboard native readiness has no return" }
        readinessReturns.asReversed().forEach { index ->
            val register = (readiness.implementation!!.instructions[index] as OneRegisterInstruction)
                .registerA
            readiness.addInstructions(
                index,
                """
                invoke-static {v$register}, $readinessOwner->$NATIVE_READINESS_HELPER(Z)Z
                move-result v$register
                """.trimIndent(),
            )
        }

        val mddOwner = GboardVersionBindings.voiceMddConstructor.ownerDescriptor
        mutableClass(mddOwner).addHelperMethodIfMissing(
            name = MDD_REQUEST_HELPER,
            parameterTypes = emptyList(),
            returnType = "V",
            accessFlags = 0x12,
            registerCount = 6,
            body = advancedVoiceZhTwMddBody(),
        )
        val mddReturns = mdd.implementation!!.instructions.indices.filter { index ->
            mdd.implementation!!.instructions[index].isOpcode("RETURN_VOID")
        }
        check(mddReturns.isNotEmpty()) { "Gboard model download constructor has no return" }
        mddReturns.asReversed().forEach { index ->
            mdd.addInstructions(index, "invoke-direct {p0}, $mddOwner->$MDD_REQUEST_HELPER()V")
        }
        mdd.addInstructions(
            0,
            RuntimeCallEmitter.invoke(
                RuntimeCallId.ADVANCED_VOICE_RUNTIME_SEED_APPLICATION_CONTEXT,
                "p1 .. p1",
            ),
        )

        val formatterOwner = GboardVersionBindings.voiceFormatterConstructor.ownerDescriptor
        mutableClass(formatterOwner).addHelperMethodIfMissing(
            name = ZH_TW_FORMATTER_HELPER,
            parameterTypes = listOf(
                "Ljava/util/Locale;",
                GboardVersionBindings.voiceConfigField.ownerDescriptor,
                "Z",
            ),
            returnType = "Z",
            accessFlags = 0x1a,
            registerCount = 5,
            body = advancedVoiceZhTwFormatterBody(),
        )
        formatter.addInstructions(
            0,
            """
            invoke-static {p1, p2, p5}, $formatterOwner->$ZH_TW_FORMATTER_HELPER(Ljava/util/Locale;${GboardVersionBindings.voiceConfigField.ownerDescriptor}Z)Z
            move-result p5
            """.trimIndent(),
        )

        eligibility.addInstructions(
            0,
            """
            ${RuntimeCallEmitter.invoke(RuntimeCallId.ADVANCED_VOICE_RUNTIME_SEED_APPLICATION_CONTEXT, "p1 .. p1")}
            ${RuntimeCallEmitter.invoke(RuntimeCallId.ADVANCED_VOICE_RUNTIME_INCLUDE_EXACT_ZH_TW_SUPPORTED_LOCALE, "p23 .. p23")}
            move-result-object p23
            check-cast p23, Ljava/util/Set;
            """.trimIndent(),
        )
    }
}

internal fun advancedVoiceZhTwNativeBody(): String = """
    :start
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADVANCED_VOICE_RUNTIME_SHOULD_CHECK_NATIVE, "p0")}
    move-result v0
    if-eqz v0, :done
    sget-object v0, ${GboardVersionBindings.voiceFlagHolderField.reference}
    invoke-interface {v0}, ${GboardVersionBindings.voiceFlagGetter.reference}
    move-result-object v0
    check-cast v0, Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z
    move-result v0
    if-eqz v0, :done
    const/4 p0, 0x1
    :done
    return p0
    :end
    .catch Ljava/lang/Throwable; {:start .. :end} :failed
    :failed
    move-exception v0
    return p0
""".trimIndent()

internal fun advancedVoiceZhTwMddBody(): String = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADVANCED_VOICE_RUNTIME_CLAIM_MDD, "")}
    move-result v0
    if-eqz v0, :done
    :start
    iget-object v0, p0, ${GboardVersionBindings.voiceMddManagerField.reference}
    if-eqz v0, :reset
    const-string v1, "zh-TW"
    invoke-static {v1}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;
    move-result-object v1
    new-instance v2, ${GboardVersionBindings.voiceZhTwCallbackConstructor.ownerDescriptor}
    const/4 v3, 0x0
    invoke-direct {v2, p0, v1, v3}, ${GboardVersionBindings.voiceZhTwCallbackConstructor.reference}
    const/4 v4, 0x3
    invoke-static {v0, v3, v2, v4}, ${GboardVersionBindings.voiceMddRequest.reference}
    move-result-object v0
    if-eqz v0, :reset
    :done
    return-void
    :end
    .catch Ljava/lang/Throwable; {:start .. :end} :failed
    :failed
    move-exception v0
    :reset
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADVANCED_VOICE_RUNTIME_RESET_MDD, "")}
    return-void
""".trimIndent()

internal fun advancedVoiceZhTwFormatterBody(): String = """
    if-eqz p1, :stock
    iget-object v0, p1, ${GboardVersionBindings.voiceConfigField.reference}
    if-nez v0, :config
    sget-object v0, ${GboardVersionBindings.voiceConfigSingleton.reference}
    :config
    if-eqz v0, :stock
    iget-boolean v0, v0, ${GboardVersionBindings.voiceConfigGate.reference}
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADVANCED_VOICE_RUNTIME_FORMATTER_GATE, "p0, v0, p2")}
    move-result p2
    :stock
    return p2
""".trimIndent()
