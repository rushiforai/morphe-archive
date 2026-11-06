package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private object GboardAdvancedVoice1803Targets {
    val nativeSplitReadiness = GboardMethodTarget(
        classType = "Lscn;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "Z",
    )
    val eligibilityConstructor = GboardMethodTarget(
        classType = "Lsdc;",
        name = "<init>",
        parameterTypes = listOf(
            "Landroid/content/Context;", "Lkuj;", "Lpol;", "Lrtu;", "Ltfz;", "Ltfz;",
            "Lsmr;", "Ltfz;", "Lsmx;", "Lsik;", "Lkuj;", "Lshr;", "Lshz;", "Ltfz;",
            "Lsji;", "Lsnb;", "Lsoz;", "Lrsy;", "Lsdq;", "Lscq;", "Lkuj;", "Labsf;",
            "Ljava/util/Set;",
        ),
        returnType = "V",
    )
    val mddProviderConstructor = GboardMethodTarget(
        classType = "Lrtu;",
        name = "<init>",
        parameterTypes = listOf(
            "Landroid/content/Context;", "Lrtv;", "Lrtp;", "Labsf;",
        ),
        returnType = "V",
    )
    val formatterConstructor = GboardMethodTarget(
        classType = "Lrwr;",
        name = "<init>",
        parameterTypes = listOf(
            "Ljava/util/Locale;", "Lenl;", "Lsjb;", "Lenc;", "Z", "Lrwu;", "Lsoq;",
            "Ltfz;", "Ljava/util/concurrent/Executor;",
        ),
        returnType = "V",
    )
}

internal val gboardAdvancedVoice1803ZhTwPatch = bytecodePatch(
    description = "移植 18.0.3 已驗證的 zh-TW locale、MDD 與 formatter 行為。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(GboardAdvancedVoice1803Targets.nativeSplitReadiness)
            .applyNativeSplitReadiness()
        findMutableMethodOrThrow(GboardAdvancedVoice1803Targets.eligibilityConstructor)
            .also { method ->
                method.applyZhTwLocaleAdmission()
                method.applyApplicationContextSeed()
            }
        findMutableMethodOrThrow(GboardAdvancedVoice1803Targets.mddProviderConstructor)
            .also { method ->
                method.applyZhTwMddProvisioning()
                method.applyApplicationContextSeed()
            }
        findMutableMethodOrThrow(GboardAdvancedVoice1803Targets.formatterConstructor)
            .applyZhTwFormatterGate()
    }
}

private fun MutableMethod.applyNativeSplitReadiness() {
    val call = RuntimeCallId.ADVANCED_VOICE_RUNTIME_AFTER_1803_NATIVE_SPLIT_READINESS
    val reference = RuntimeAbiCatalog.abi(call).reference
    val instructions = implementation?.instructions ?: error("No scn#a implementation")
    val returns = returnInstructionIndices()
    check(returns.isNotEmpty()) { "No boolean returns in scn#a" }
    val existing = instructions.count { it.isMethodReference(reference) }
    if (existing != 0) {
        check(existing == returns.size) { "Malformed 18.0.3 native split readiness delegates" }
        return
    }
    returns.asReversed().forEach { returnIndex ->
        val register = (instructions[returnIndex] as? OneRegisterInstruction)?.registerA
            ?: error("Non-register boolean return in scn#a")
        addInstructions(
            returnIndex,
            """
                ${RuntimeCallEmitter.invoke(call, "v$register .. v$register")}
                move-result v$register
            """.trimIndent(),
        )
    }
}

private fun MutableMethod.applyApplicationContextSeed() {
    val seedCall = RuntimeCallId.ADVANCED_VOICE_RUNTIME_SEED_APPLICATION_CONTEXT
    val reference = RuntimeAbiCatalog.abi(seedCall).reference
    val instructions = implementation?.instructions
        ?: error("No constructor implementation for Advanced Voice context seed")
    val existing = instructions.count { it.isMethodReference(reference) }
    if (existing != 0) {
        check(existing == 1) { "Duplicate Advanced Voice constructor context seeds" }
        return
    }
    addInstructions(0, RuntimeCallEmitter.invoke(seedCall, "p1 .. p1"))
}

private fun MutableMethod.applyZhTwLocaleAdmission() {
    val call = RuntimeCallId.ADVANCED_VOICE_RUNTIME_INCLUDE_EXACT_ZH_TW_SUPPORTED_LOCALE
    val reference = RuntimeAbiCatalog.abi(call).reference
    val instructions = implementation?.instructions ?: error("No sdc constructor implementation")
    val existing = instructions.count { it.isMethodReference(reference) }
    if (existing != 0) {
        check(existing == 1) { "Duplicate 18.0.3 zh-TW locale admission" }
        return
    }
    addInstructions(
        0,
        """
            ${RuntimeCallEmitter.invoke(call, "p23 .. p23")}
            move-result-object p23
            check-cast p23, Ljava/util/Set;
        """.trimIndent(),
    )
}

private fun MutableMethod.applyZhTwMddProvisioning() {
    val call = RuntimeCallId.ADVANCED_VOICE_RUNTIME_AFTER_MDD_PROVIDER_CONSTRUCTED
    val reference = RuntimeAbiCatalog.abi(call).reference
    val instructions = implementation?.instructions ?: error("No rtu constructor implementation")
    val returns = returnInstructionIndices()
    val existing = instructions.count { it.isMethodReference(reference) }
    if (existing != 0) {
        check(existing == returns.size) { "Malformed 18.0.3 zh-TW MDD delegates" }
        return
    }
    returns.asReversed().forEach {
        addInstructions(it, RuntimeCallEmitter.invoke(call, "p0"))
    }
}

private fun MutableMethod.applyZhTwFormatterGate() {
    val call = RuntimeCallId.ADVANCED_VOICE_RUNTIME_BEFORE_FORMATTER_CONSTRUCTED
    val reference = RuntimeAbiCatalog.abi(call).reference
    val instructions = implementation?.instructions ?: error("No rwr constructor implementation")
    val existing = instructions.count { it.isMethodReference(reference) }
    if (existing != 0) {
        check(existing == 1) { "Duplicate 18.0.3 zh-TW formatter delegate" }
        return
    }
    addInstructions(
        0,
        """
            ${RuntimeCallEmitter.invoke(call, "p1, p2, p5")}
            move-result p5
        """.trimIndent(),
    )
}
