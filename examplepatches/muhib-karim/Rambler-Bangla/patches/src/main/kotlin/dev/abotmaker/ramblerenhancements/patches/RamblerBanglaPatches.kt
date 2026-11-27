/*
 * Rambler Bangla - Bengali-first Rambler voice typing & phonetic Bangla patches
 * for Gboard 18.5.4+ (Morphe patch module).
 *
 * Copyright (C) 2026 muhib-karim & Rambler Bangla contributors
 * Licensed under the GNU General Public License v3.0. See LICENSE and ATTRIBUTION.md.
 */
package dev.abotmaker.ramblerenhancements.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11x
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import java.security.MessageDigest

internal const val BANGLA_LITE_RUNTIME_TYPE =
    "Lcom/akshaykadam/pixelboard/extension/ramblerlite/GboardRamblerLiteScriptRuntime;"
internal const val HINGLISH_OVERRIDE_SHA256 =
    "a024513458b73f915c78438cea2a9457b9c5aed28da3644030c3dc76cd0ac6e9"
internal const val LITE_CLEANUP_PROMPT_SHA256_18_3_1 =
    "347a9484392763d5fb16660bc3ca9bbceb1851c96f2024f96c1e9327f504696e"
internal const val LITE_CLEANUP_PROMPT_SHA256_18_5_4 =
    "adcb7fd5fd4b07872039c80d80091da66055e855b86a5b5bcc2725a30d0a3cab"
internal val VERIFIED_LITE_CLEANUP_PROMPT_SHA256S = setOf(
    LITE_CLEANUP_PROMPT_SHA256_18_3_1,
    LITE_CLEANUP_PROMPT_SHA256_18_5_4,
)
private const val ENABLED_LANGUAGES_PLACEHOLDER = "{ENABLED_LANGUAGES}"
private const val STRING_REPLACE_DESCRIPTOR =
    "Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;"

@Suppress("unused")
val ramblerBanglaLiteScriptPatch = bytecodePatch(
    name = "Rambler Bangla Lite Script Policy",
    description = "Fail-closed, SHA-256 fingerprint-guarded Bengali Unicode script policy for " +
        "Gboard Rambler / Jetson Lite cleanup. Replaces the unconditional Hinglish/Banglish " +
        "Romanization override with native-script preservation for bn-BD, bn-IN, and bn-Beng " +
        "while preserving explicit bn-Latn Romanization. Verified on Gboard 18.5.4.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
        ramblerBanglaLiteScriptResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.BANGLA_LITE_SCRIPT)
        val targets = resolveBanglaLiteTargets(this)
        installBanglaLiteScriptHooks(targets)
    }
}

@Suppress("unused")
val ramblerBanglaPhoneticEnginePatch = bytecodePatch(
    name = "Rambler Bangla Phonetic & Multilingual Engine",
    description = "Adds the full Rambler Bangla V29.3+ post-ASR Bengali phonetic & multilingual " +
        "dictation engine: one-language-per-sentence AUTO routing, Avro-derived 2,265-pair " +
        "Tier-1 normalization, CMUdict-derived English loanword transliteration in Bangla " +
        "(e.g. company -> কোম্পানি), protected spans (#hashtags, @handles, URLs, emails, times), " +
        "Unicode NFC normalization, fail-closed sensitive-field bypass, and native Settings toggles. " +
        "Verified on Gboard 18.5.4.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
        ramblerBanglaPhoneticResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.BANGLA_PHONETIC)
    }
}

internal data class BanglaLiteTargets(
    val cleanupBuilderMethod: MutableMethod,
    val ruleSiteIndex: Int,
    val ruleRegister: Int,
    val replaceInvokeIndex: Int,
    val replaceMoveResultIndex: Int,
    val languagesRegister: Int,
    val promptResultRegister: Int,
)

private data class ConstStringSite(
    val index: Int,
    val register: Int,
    val value: String,
)

private fun sha256Hex(value: String): String =
    MessageDigest.getInstance("SHA-256")
        .digest(value.toByteArray(Charsets.UTF_8))
        .joinToString("") { "%02x".format(it) }

private fun Method.constStringSites(): List<ConstStringSite> {
    val insns = implementation?.instructions ?: return emptyList()
    return insns.mapIndexedNotNull { index, instruction ->
        when (instruction) {
            is Instruction21c -> (instruction.reference as? StringReference)
                ?.let { ConstStringSite(index, instruction.registerA, it.string) }
            is Instruction31c -> (instruction.reference as? StringReference)
                ?.let { ConstStringSite(index, instruction.registerA, it.string) }
            else -> null
        }
    }
}

internal fun resolveBanglaLiteTargets(context: BytecodePatchContext): BanglaLiteTargets {
    var promptOwnerMatches = 0
    val builderMatches = mutableListOf<Pair<ClassDef, Method>>()

    context.classDefForEach { cls ->
        for (field in cls.staticFields) {
            val value = (field.initialValue as? StringEncodedValue)?.value ?: continue
            if (value.length in 15_000..22_000 && sha256Hex(value) in VERIFIED_LITE_CLEANUP_PROMPT_SHA256S) {
                promptOwnerMatches++
            }
        }
        for (method in cls.methods) {
            val sites = method.constStringSites()
            if (sites.isEmpty()) continue
            var hasHinglishRule = false
            var hasEnabledLangs = false
            for (site in sites) {
                val len = site.value.length
                if (len in 15_000..22_000 && sha256Hex(site.value) in VERIFIED_LITE_CLEANUP_PROMPT_SHA256S) {
                    promptOwnerMatches++
                }
                if (len in 200..400 && sha256Hex(site.value) == HINGLISH_OVERRIDE_SHA256) {
                    hasHinglishRule = true
                }
                if (site.value == ENABLED_LANGUAGES_PLACEHOLDER) {
                    hasEnabledLangs = true
                }
            }
            if (hasHinglishRule && hasEnabledLangs) {
                builderMatches.add(cls to method)
            }
        }
    }

    if (promptOwnerMatches != 1) {
        throw PatchException(
            "FAIL-CLOSED: Expected exactly 1 verified Rambler Lite cleanup prompt constant " +
                "(sha256 in $VERIFIED_LITE_CLEANUP_PROMPT_SHA256S), found $promptOwnerMatches.",
        )
    }
    val (builderCls, builderDef) = builderMatches.singleOrNull()
        ?: throw PatchException(
            "FAIL-CLOSED: Expected exactly 1 Rambler Lite cleanup builder owning " +
                "Hinglish override (sha256=$HINGLISH_OVERRIDE_SHA256) and " +
                "$ENABLED_LANGUAGES_PLACEHOLDER, found ${builderMatches.size}.",
        )

    val mutableClass = context.mutableClassDefBy(builderCls.type)
    val builder = mutableClass.methods.singleOrNull { m ->
        m.name == builderDef.name &&
            m.returnType == builderDef.returnType &&
            m.parameterTypes.map { it.toString() } == builderDef.parameterTypes.map { it.toString() }
    } ?: throw PatchException("FAIL-CLOSED: Could not resolve mutable cleanup builder ${builderCls.type}->${builderDef.name}")

    return analyzeBanglaLiteBuilder(builder)
}

internal fun analyzeBanglaLiteBuilder(builder: MutableMethod): BanglaLiteTargets {
    val insns = builder.implementation?.instructions?.toList()
        ?: throw PatchException("FAIL-CLOSED: Cleanup builder ${builder.definingClass}->${builder.name} has no body")

    if (insns.any {
            (it as? ReferenceInstruction)?.reference?.toString()
                ?.contains("GboardRamblerLiteScriptRuntime") == true
        }
    ) {
        throw PatchException("FAIL-CLOSED: Bengali script hooks already installed; refusing double-patch")
    }

    val sites = builder.constStringSites()
    val ruleSite = sites.singleOrNull { it.value.length in 200..400 && sha256Hex(it.value) == HINGLISH_OVERRIDE_SHA256 }
        ?: throw PatchException("FAIL-CLOSED: Hinglish override constant not uniquely found in ${builder.definingClass}->${builder.name}")

    val placeholderSite = sites.firstOrNull { it.value == ENABLED_LANGUAGES_PLACEHOLDER }
        ?: throw PatchException("FAIL-CLOSED: $ENABLED_LANGUAGES_PLACEHOLDER constant missing in ${builder.definingClass}->${builder.name}")

    var invokeIdx = -1
    var moveIdx = -1
    var langReg = -1
    var resultReg = -1

    for (idx in (placeholderSite.index + 1) until insns.size) {
        val insn = insns[idx]
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        if (ref.toString() != STRING_REPLACE_DESCRIPTOR) continue
        val (placeholderArg, langsArg) = when (insn) {
            is FiveRegisterInstruction -> if (insn.registerCount == 3) insn.registerD to insn.registerE else continue
            is RegisterRangeInstruction -> if (insn.registerCount == 3) (insn.startRegister + 1) to (insn.startRegister + 2) else continue
            else -> continue
        }
        if (placeholderArg != placeholderSite.register) continue
        val move = (idx + 1 until minOf(idx + 4, insns.size)).firstNotNullOfOrNull { j ->
            val candidate = insns[j]
            if (candidate is Instruction11x && candidate.opcode == Opcode.MOVE_RESULT_OBJECT) {
                j to candidate.registerA
            } else {
                null
            }
        } ?: throw PatchException("FAIL-CLOSED: Missing move-result-object after {ENABLED_LANGUAGES} String.replace")
        invokeIdx = idx
        moveIdx = move.first
        langReg = langsArg
        resultReg = move.second
        break
    }

    if (invokeIdx < 0) {
        throw PatchException("FAIL-CLOSED: No String.replace consuming $ENABLED_LANGUAGES_PLACEHOLDER")
    }

    return BanglaLiteTargets(
        cleanupBuilderMethod = builder,
        ruleSiteIndex = ruleSite.index,
        ruleRegister = ruleSite.register,
        replaceInvokeIndex = invokeIdx,
        replaceMoveResultIndex = moveIdx,
        languagesRegister = langReg,
        promptResultRegister = resultReg,
    )
}

internal fun installBanglaLiteScriptHooks(targets: BanglaLiteTargets) {
    val builder = targets.cleanupBuilderMethod
    val impl = builder.implementation
        ?: throw PatchException("FAIL-CLOSED: Cleanup builder has no implementation")
    val insns = impl.instructions.toList()

    if (targets.ruleRegister > 15 || targets.languagesRegister > 15 || targets.promptResultRegister > 15) {
        throw PatchException(
            "FAIL-CLOSED: Cleanup builder registers exceed 4-bit invoke range: " +
                "rule=v${targets.ruleRegister}, langs=v${targets.languagesRegister}, " +
                "prompt=v${targets.promptResultRegister}",
        )
    }

    if (targets.ruleSiteIndex < targets.replaceInvokeIndex) {
        // Gboard 18.5.4 layout: Hinglish override runs BEFORE {ENABLED_LANGUAGES} replacement.
        // Prove languagesRegister is already populated and NOT overwritten between ruleSiteIndex
        // and replaceInvokeIndex before emitting direct hooks.
        for (idx in targets.ruleSiteIndex until targets.replaceInvokeIndex) {
            val insn = insns[idx]
            if (insn is OneRegisterInstruction &&
                insn.opcode.setsRegister() &&
                insn.registerA == targets.languagesRegister
            ) {
                throw PatchException(
                    "FAIL-CLOSED: Enabled-languages register v${targets.languagesRegister} is written " +
                        "between Hinglish override (@${targets.ruleSiteIndex}) and {ENABLED_LANGUAGES} " +
                        "replace (@${targets.replaceInvokeIndex}) at @$idx",
                )
            }
        }
        // Insert in descending index order so earlier indices stay valid.
        builder.addInstructions(
            targets.replaceMoveResultIndex + 1,
            """
            invoke-static {v${targets.promptResultRegister}, v${targets.languagesRegister}}, $BANGLA_LITE_RUNTIME_TYPE->rewriteCleanupPromptScriptGate(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            move-result-object v${targets.promptResultRegister}
            """.trimIndent(),
        )
        builder.addInstructions(
            targets.ruleSiteIndex + 1,
            """
            invoke-static {v${targets.ruleRegister}, v${targets.languagesRegister}}, $BANGLA_LITE_RUNTIME_TYPE->selectHinglishOverrideRule(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            move-result-object v${targets.ruleRegister}
            """.trimIndent(),
        )
    } else if (targets.ruleSiteIndex > targets.replaceMoveResultIndex) {
        // Gboard 18.3.1 layout: {ENABLED_LANGUAGES} replacement runs BEFORE Hinglish override.
        // Verify languagesRegister is not clobbered before ruleSiteIndex.
        for (idx in (targets.replaceMoveResultIndex + 1) until targets.ruleSiteIndex) {
            val insn = insns[idx]
            if (insn is OneRegisterInstruction &&
                insn.opcode.setsRegister() &&
                insn.registerA == targets.languagesRegister
            ) {
                throw PatchException(
                    "FAIL-CLOSED: Enabled-languages register v${targets.languagesRegister} is overwritten " +
                        "between {ENABLED_LANGUAGES} replace and Hinglish override at @$idx",
                )
            }
        }
        builder.addInstructions(
            targets.ruleSiteIndex + 1,
            """
            invoke-static {v${targets.ruleRegister}, v${targets.languagesRegister}}, $BANGLA_LITE_RUNTIME_TYPE->selectHinglishOverrideRule(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            move-result-object v${targets.ruleRegister}
            """.trimIndent(),
        )
        builder.addInstructions(
            targets.replaceMoveResultIndex + 1,
            """
            invoke-static {v${targets.promptResultRegister}, v${targets.languagesRegister}}, $BANGLA_LITE_RUNTIME_TYPE->rewriteCleanupPromptScriptGate(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            move-result-object v${targets.promptResultRegister}
            """.trimIndent(),
        )
    } else {
        throw PatchException("FAIL-CLOSED: Overlapping Hinglish override and {ENABLED_LANGUAGES} anchor indices")
    }
}
