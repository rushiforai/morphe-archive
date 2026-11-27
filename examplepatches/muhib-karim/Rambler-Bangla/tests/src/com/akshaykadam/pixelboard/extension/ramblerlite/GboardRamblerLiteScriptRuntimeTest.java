/*
 * Static unit tests for the Bengali script-policy runtime.
 * Zero-dependency runner: java ...GboardRamblerLiteScriptRuntimeTest
 * GPL-3.0; see LICENSE.
 */
package com.akshaykadam.pixelboard.extension.ramblerlite;

import java.util.Arrays;
import java.util.LinkedHashSet;

public final class GboardRamblerLiteScriptRuntimeTest {

    private static int passed = 0;
    private static int failed = 0;

    private static final String STOCK_RULE =
        "3. Hinglish Override: For any combination of Indian languages (e.g.,"
        + " Hindi, Bengali, Marathi, Kannada, etc.) and English, override all"
        + " native script defaults. Transcribe and edit exclusively in"
        + " Romanized script (Hinglish/Banglish).";

    private static final String STOCK_BRANCH_A_BLOCK =
        "   * Mandatory Indic Romanization (Anti-Gravity Gate): If ASR outputs"
        + " ANY Indian/Indic script\u2014specifically Devanagari, Bengali,"
        + " Gujarati\u2014while on a Latin keyboard, you MUST phonetically"
        + " transliterate (Romanize) ENTIRE text into ASCII Latin characters."
        + " Do this even if 100% of input is physically written in native"
        + " Indic script!\n"
        + "     - If input text already contains all latin characters, then"
        + " NEVER revert Romanized Indic words back into native scripts!\n";

    private static final String PROMPT =
        "<system_role>\n1. SCRIPT GATE\n</system_role>\n"
        + "- Branch A (Latin/Roman Keyboards):\n"
        + STOCK_BRANCH_A_BLOCK
        + "   * Universal Latin & Non-Indic Preservation: keep Latin exact.\n"
        + "- Branch B (Single Native Keyboards): transliterate stray Latin.\n";

    public static void main(String[] args) {
        classificationMatrix();
        hinglishRuleSelection();
        scriptGateRewrite();
        failSafeBehavior();
        rewriteIsBounded();
        localeAdmissionHypothesisHook();
        summary();
        if (failed > 0) {
            System.exit(1);
        }
    }

    private static void classificationMatrix() {
        cls("bn-BD", "NATIVE_PRESENT");
        cls("bn-IN", "NATIVE_PRESENT");
        cls("bn-Beng", "NATIVE_PRESENT");
        cls("bn", "NATIVE_PRESENT");
        cls("bn-BD,en-US", "NATIVE_PRESENT");
        cls("en-US,bn-IN", "NATIVE_PRESENT");
        cls("bn-Latn", "EXPLICIT_LATIN_ONLY");
        cls("bn-latn", "EXPLICIT_LATIN_ONLY");
        cls("bn-Latn-BD", "EXPLICIT_LATIN_ONLY");
        cls("bn-Latn,en-US", "EXPLICIT_LATIN_ONLY");
        cls("hi-Latn", "EXPLICIT_LATIN_ONLY");
        cls("bn-BD,bn-Latn", "NATIVE_PRESENT"); // native present wins; documented
        cls("hi", "NATIVE_PRESENT");
        cls("ta-IN", "NATIVE_PRESENT");
        cls("en-US", "NO_INDIC");
        cls("en-US,es-ES", "NO_INDIC");
        cls("", "UNKNOWN");
        cls(null, "UNKNOWN");
        cls("   ", "UNKNOWN");
        cls("bn_BD", "NATIVE_PRESENT"); // underscore tolerance
    }

    private static void hinglishRuleSelection() {
        eq(GboardRamblerLiteScriptRuntime.selectHinglishOverrideRule(STOCK_RULE, "bn-BD"),
            GboardRamblerLiteScriptRuntime.NATIVE_SCRIPT_RULE, "native bn-BD gets preserve rule");
        eq(GboardRamblerLiteScriptRuntime.selectHinglishOverrideRule(STOCK_RULE, "bn-IN,en-US"),
            GboardRamblerLiteScriptRuntime.NATIVE_SCRIPT_RULE, "native bn-IN+en gets preserve rule");
        eq(GboardRamblerLiteScriptRuntime.selectHinglishOverrideRule(STOCK_RULE, "bn-Latn,en-US"),
            STOCK_RULE, "explicit bn-Latn keeps stock Romanized rule");
        eq(GboardRamblerLiteScriptRuntime.selectHinglishOverrideRule(STOCK_RULE, "en-US"),
            "", "no Indic drops the no-op override");
        eq(GboardRamblerLiteScriptRuntime.selectHinglishOverrideRule(STOCK_RULE, null),
            STOCK_RULE, "unknown languages keep stock rule (fail-safe)");
        eq(GboardRamblerLiteScriptRuntime.selectHinglishOverrideRule(STOCK_RULE, ""),
            STOCK_RULE, "blank languages keep stock rule (fail-safe)");
        ok(!GboardRamblerLiteScriptRuntime.NATIVE_SCRIPT_RULE.contains("Hinglish Override"),
            "replacement is not the stock override");
        ok(GboardRamblerLiteScriptRuntime.NATIVE_SCRIPT_RULE.contains("bn-Latn"),
            "replacement keeps the explicit bn-Latn escape hatch");
    }

    private static void scriptGateRewrite() {
        String out = GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(PROMPT, "bn-BD,en-US");
        ok(!out.equals(PROMPT), "native policy rewrites Branch A");
        ok(!out.contains("Anti-Gravity Gate"), "stock Romanization mandate removed");
        ok(out.contains("Bengali Unicode"), "rewrite mandates Bengali Unicode");
        ok(out.contains("bn-Latn"), "rewrite keeps explicit-Latn Romanization path");
        ok(out.contains("Universal Latin"), "Branch A tail preserved");
        ok(out.contains("- Branch B"), "Branch B preserved");
        ok(out.contains("bn-BD,en-US"), "rewrite embeds actual enabled languages");

        String latn = GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(PROMPT, "bn-Latn");
        eq(latn, PROMPT, "explicit bn-Latn leaves prompt byte-identical");

        String en = GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(PROMPT, "en-US");
        eq(en, PROMPT, "non-Indic leaves prompt byte-identical");

        String second = GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(out, "bn-BD");
        eq(second, out, "rewrite is idempotent (second pass is a no-op)");
    }

    private static void failSafeBehavior() {
        eq(GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(null, "bn-BD"),
            null, "null prompt stays null");
        eq(GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(PROMPT, null),
            PROMPT, "null languages = no-op");
        String drifted = PROMPT.replace("Anti-Gravity Gate", "Renamed Gate");
        eq(GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(drifted, "bn-BD"),
            drifted, "drifted bullet header = no-op");
        String drifted2 = PROMPT.replace("Bengali", "Xengali");
        eq(GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(drifted2, "bn-BD"),
            drifted2, "drifted Bengali sentinel = no-op");
        String drifted3 = PROMPT.replace("Universal Latin", "Universal Xatin");
        eq(GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(drifted3, "bn-BD"),
            drifted3, "missing block end = no-op");
    }

    private static void rewriteIsBounded() {
        String out = GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(PROMPT, "bn-BD");
        ok(out.startsWith("<system_role>\n1. SCRIPT GATE\n</system_role>\n- Branch A"),
            "everything before the Branch A bullet is byte-identical");
        String tail = PROMPT.substring(PROMPT.indexOf("   * Universal Latin"));
        ok(out.endsWith(tail), "everything from Branch A tail onward is byte-identical");
        ok(GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(PROMPT, "bn-BD")
                .contains("Never translate"), "no-translation guard retained");
    }

    private static void localeAdmissionHypothesisHook() {
        LinkedHashSet<String> without = new LinkedHashSet<String>(Arrays.asList("en-US", "hi-IN"));
        java.util.Set<Object> admitted = GboardRamblerLiteScriptRuntime.admitExactBengaliLocales(without);
        ok(admitted.contains("bn-BD") && admitted.contains("bn-IN"), "admits exact bn-BD/bn-IN when absent");
        ok(admitted.contains("en-US") && admitted.contains("hi-IN"), "existing entries preserved");

        LinkedHashSet<String> withBn = new LinkedHashSet<String>(Arrays.asList("bn-BD", "en-US"));
        java.util.Set<Object> kept = GboardRamblerLiteScriptRuntime.admitExactBengaliLocales(withBn);
        ok(kept.size() == 3 && kept.contains("bn-IN"), "no duplicate bn-BD; bn-IN still admitted");

        LinkedHashSet<String> both = new LinkedHashSet<String>(Arrays.asList("bn-BD", "bn-IN"));
        java.util.Set<Object> same = GboardRamblerLiteScriptRuntime.admitExactBengaliLocales(both);
        ok(same.size() == 2, "set already admitting Bengali is unchanged");

        ok(GboardRamblerLiteScriptRuntime.admitExactBengaliLocales(null) == null,
            "null set stays null (fail-safe)");
    }

    private static void cls(String langs, String expected) {
        String actual = GboardRamblerLiteScriptRuntime.classifyEnabledLanguages(langs).name();
        eq(actual, expected, "classify(" + (langs == null ? "null" : '"' + langs + '"') + ")");
    }

    private static void eq(Object actual, Object expected, String label) {
        if (expected == null ? actual == null : expected.equals(actual)) {
            passed++;
        } else {
            failed++;
            System.out.println("FAIL: " + label + "\n  expected: " + abbrev(expected)
                + "\n  actual:   " + abbrev(actual));
        }
    }

    private static void ok(boolean cond, String label) {
        if (cond) {
            passed++;
        } else {
            failed++;
            System.out.println("FAIL: " + label);
        }
    }

    private static String abbrev(Object o) {
        if (o == null) {
            return "null";
        }
        String s = o.toString().replace('\n', ' ');
        return s.length() > 90 ? s.substring(0, 90) + "..." : s;
    }

    private static void summary() {
        System.out.println("PolicyTest: " + passed + " passed, " + failed + " failed");
    }
}
