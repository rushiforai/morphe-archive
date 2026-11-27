/*
 * PixelBoard - Gboard Enhancement Mod
 *
 * Bengali Unicode script patch for Rambler / Jetson Lite cleanup.
 *
 * Copyright (C) 2026 PixelBoard contributors
 * Derived from PixelBoard (https://github.com/Akshayykadam/PixelBoard) and
 * jasonwu1994/Gboard-patches, licensed under the GNU General Public License
 * v3.0. See LICENSE and ATTRIBUTION.md.
 *
 * Evidence basis (static analysis of the PixelBoard 18.3.1 artifact, APK
 * SHA-256 e229d982ff65b24d71aeee804dcce6863e902ec409a0379ca3deaef17e30f6bd):
 *   - classes3.dex, Lkfd;->d(Lhrl;Ljava/lang/String;ILqqi;Laebb;
 *     Ljava/lang/String;Laugd;Ljava/util/concurrent/atomic/AtomicBoolean;)V
 *     unconditionally replaces {HINGLISH_OVERRIDE_RULE} with a 289-byte rule
 *     (SHA-256 a024513458b73f915c78438cea2a9457b9c5aed28da3644030c3dc76cd
 *     0ac6e9) forcing Romanized output for any Indian-language + English mix,
 *     explicitly naming Bengali/Banglish.
 *   - classes3.dex, Lkew;->b(Ljava/lang/Object;)V owns the 17,802-byte Lite
 *     cleanup prompt (SHA-256 347a9484392763d5fb16660bc3ca9bbceb1851c96f2024
 *     f96c1e9327f504696e) whose SCRIPT GATE Branch A mandates Indic -> ASCII
 *     Romanization on a Latin keyboard.
 *
 * This patch installs two runtime hooks in kfd.d, driven by the enabled-
 * language data that already flows through the method. It adds no
 * transliteration, disables no cleanup stage, and touches nothing outside
 * these anchors. It is FAIL-CLOSED: if the target methods or either stock
 * string fingerprint is missing, patching aborts and the build stays stock.
 */
package com.akshaykadam.pixelboard.patches.gboard.features.ramblerlite

import com.akshaykadam.pixelboard.patches.shared.addInstructions
import com.akshaykadam.pixelboard.patches.shared.bytecodePatch
import com.akshaykadam.pixelboard.patches.shared.MutableMethod
import com.akshaykadam.pixelboard.patches.gboard.shared.GboardMethodTarget
import com.akshaykadam.pixelboard.patches.gboard.shared.findMutableMethodOrNull
import com.akshaykadam.pixelboard.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import com.akshaykadam.pixelboard.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import com.akshaykadam.pixelboard.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import com.akshaykadam.pixelboard.patches.gboard.shared.runtimeabi.RuntimeCallId
import com.akshaykadam.pixelboard.patches.shared.Constants.COMPATIBILITY_GBOARD
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11x
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.security.MessageDigest

private object RamblerLiteBengaliTargets {
    /** JetsonLiteHandler cleanup request builder (18.3.1 obfuscation). */
    val cleanupBuilder = GboardMethodTarget(
        classType = "Lkfd;",
        name = "d",
        parameterTypes = listOf(
            "Lhrl;", "Ljava/lang/String;", "I", "Lqqi;", "Laebb;",
            "Ljava/lang/String;", "Laugd;",
            "Ljava/util/concurrent/atomic/AtomicBoolean;",
        ),
        returnType = "V",
    )

    /** Owner of the 17,802-byte Lite cleanup prompt constant (18.3.1). */
    val promptOwner = GboardMethodTarget(
        classType = "Lkew;",
        name = "b",
        parameterTypes = listOf("Ljava/lang/Object;"),
        returnType = "V",
    )
}

private const val HINGLISH_OVERRIDE_SHA256 =
    "a024513458b73f915c78438cea2a9457b9c5aed28da3644030c3dc76cd0ac6e9"
private const val LITE_CLEANUP_PROMPT_SHA256 =
    "347a9484392763d5fb16660bc3ca9bbceb1851c96f2024f96c1e9327f504696e"
private const val ENABLED_LANGUAGES_PLACEHOLDER = "{ENABLED_LANGUAGES}"
private const val STRING_REPLACE_DESCRIPTOR =
    "Ljava/lang/String;->replace(Ljava/lang/CharSequence;" +
        "Ljava/lang/CharSequence;)Ljava/lang/String;"

internal val gboardRamblerLiteBengaliScriptPatch = bytecodePatch(
    description = "Preserve Bengali Unicode in Rambler Lite cleanup " +
        "(bn-BD/bn-IN/bn-Beng); Romanize only explicit bn-Latn.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val builder = findMutableMethodOrNull(RamblerLiteBengaliTargets.cleanupBuilder)
            ?: error("Rambler Lite cleanup builder kfd.d not found; aborting fail-closed")
        val promptOwner = findMutableMethodOrNull(RamblerLiteBengaliTargets.promptOwner)
            ?: error("Rambler Lite prompt owner kew.b not found; aborting fail-closed")

        // Fingerprint gates: both stock constants must exist verbatim.
        promptOwner.requireConstStringFingerprint(
            LITE_CLEANUP_PROMPT_SHA256, "Lite cleanup prompt",
        )
        val ruleRegister = builder.findConstStringFingerprint(
            HINGLISH_OVERRIDE_SHA256, "Hinglish override rule",
        )

        builder.installBengaliScriptHooks(ruleRegister)
    }
}

private fun sha256(value: String): String =
    MessageDigest.getInstance("SHA-256").digest(value.toByteArray(Charsets.UTF_8))
        .joinToString("") { "%02x".format(it) }

private fun MutableMethod.constStringSites() =
    implementation?.instructions?.mapIndexedNotNull { index, instruction ->
        // const-string is 21c; const-string/jumbo (used for the 17.8 KB
        // prompt) is 31c. Both expose registerA + a StringReference.
        when (instruction) {
            is Instruction21c -> (instruction.reference as? StringReference)
                ?.let { Triple(index, instruction.registerA, it.string) }
            is Instruction31c -> (instruction.reference as? StringReference)
                ?.let { Triple(index, instruction.registerA, it.string) }
            else -> null
        }
    } ?: error("No implementation in $definingClass->$name")

private fun MutableMethod.requireConstStringFingerprint(expected: String, label: String) {
    findConstStringFingerprint(expected, label)
}

private fun MutableMethod.findConstStringFingerprint(expected: String, label: String): Int {
    val matches = constStringSites().filter { sha256(it.third) == expected }
    check(matches.size == 1) {
        "Expected exactly one $label constant (sha256=$expected) in " +
            "$definingClass->$name, found ${matches.size}; aborting fail-closed"
    }
    return matches.single().second
}

private data class ReplaceSite(
    val invokeIndex: Int,
    val moveResultIndex: Int,
    val languagesRegister: Int,
    val resultRegister: Int,
)

/** Find `.replace("{ENABLED_LANGUAGES}", langs)` and its result register. */
private fun MutableMethod.findEnabledLanguagesReplace(): ReplaceSite {
    val instructions = implementation?.instructions
        ?: error("No implementation in $definingClass->$name")
    val placeholderSite = constStringSites()
        .firstOrNull { it.third == ENABLED_LANGUAGES_PLACEHOLDER }
        ?: error("$ENABLED_LANGUAGES_PLACEHOLDER const not found; fail-closed")
    for (index in placeholderSite.first + 1 until instructions.size()) {
        val instruction = instructions[index]
        if (instruction is Instruction35c &&
            instruction.reference.toString() == STRING_REPLACE_DESCRIPTOR &&
            instruction.registerCount == 3 &&
            instruction.registerD == placeholderSite.second
        ) {
            for (j in index + 1 until minOf(index + 4, instructions.size())) {
                val move = instructions[j]
                if (move is Instruction11x &&
                    move.opcode.name == "move-result-object"
                ) {
                    return ReplaceSite(
                        invokeIndex = j,
                        moveResultIndex = j,
                        languagesRegister = instruction.registerE,
                        resultRegister = move.registerA,
                    )
                }
            }
            error("No move-result-object after String.replace; fail-closed")
        }
    }
    error("No String.replace consuming $ENABLED_LANGUAGES_PLACEHOLDER; fail-closed")
}

private fun MutableMethod.installBengaliScriptHooks(ruleRegister: Int) {
    val promptCall = RuntimeCallId.RAMBLER_LITE_RUNTIME_REWRITE_CLEANUP_PROMPT
    val ruleCall = RuntimeCallId.RAMBLER_LITE_RUNTIME_SELECT_HINGLISH_OVERRIDE
    val site = findEnabledLanguagesReplace()
    val instructions = implementation?.instructions
        ?: error("No implementation in $definingClass->$name")
    check(instructions.none {
        (it as? ReferenceInstruction)?.reference?.toString()
            ?.contains("GboardRamblerLiteScriptRuntime") == true
    }) {
        "Bengali script hooks already installed; aborting instead of double-patching"
    }

    val ruleSiteIndex = constStringSites()
        .first { sha256(it.third) == HINGLISH_OVERRIDE_SHA256 }.first
    check(ruleSiteIndex > site.moveResultIndex) {
        "This build loads the Hinglish override before the " +
            "$ENABLED_LANGUAGES_PLACEHOLDER substitution; anchor order " +
            "unsupported, aborting fail-closed (run the standalone analyzer " +
            "and extend the profile)"
    }

    // Three fresh locals: vSave keeps the enabled-languages value alive until
    // the override-rule site (a later const-string may clobber the original
    // register); vT0/vT1 are the contiguous invoke pair.
    //
    // INTEGRATION NOTE: PixelBoard's shared MutableMethod rebases parameter
    // registers when registerCount grows (same contract the smali assembler
    // gives .locals). This exact allocation is validated end-to-end by the
    // standalone smali patcher + fixture test-suite (tests/run_tests.sh);
    // if the shared helper's rebasing differs, use the standalone route.
    val impl = implementation!!
    val base = impl.registerCount
    impl.registerCount = base + 3
    val vSave = "v$base"
    val vT0 = "v${base + 1}"
    val vT1 = "v${base + 2}"

    // Hook B: at the stock override-rule const load, pick the rule text from
    // enabled languages (native Indic -> preservation rule, explicit -Latn ->
    // stock rule, non-Indic -> dropped, unknown -> stock).
    addInstructions(
        ruleSiteIndex + 1,
        """
            move-object/from16 $vT0, v$ruleRegister
            move-object/from16 $vT1, $vSave
            invoke-static/range {$vT0 .. $vT1}, ${RuntimeAbiCatalog.abi(ruleCall).reference}
            move-result-object $vT0
            move-object/from16 v$ruleRegister, $vT0
        """.trimIndent(),
    )

    // Hook A: right after the {ENABLED_LANGUAGES} substitution, save the
    // languages value and gate the SCRIPT GATE Branch A on native Indic tags.
    addInstructions(
        site.moveResultIndex + 1,
        """
            move-object/from16 $vSave, v${site.languagesRegister}
            move-object/from16 $vT0, v${site.resultRegister}
            move-object/from16 $vT1, v${site.languagesRegister}
            invoke-static/range {$vT0 .. $vT1}, ${RuntimeAbiCatalog.abi(promptCall).reference}
            move-result-object $vT0
            move-object/from16 v${site.resultRegister}, $vT0
        """.trimIndent(),
    )
}
