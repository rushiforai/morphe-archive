/*
 * PixelBoard Bengali script-policy runtime for Rambler / Jetson Lite cleanup.
 *
 * Copyright (C) 2026 PixelBoard contributors
 * Derived from PixelBoard (https://github.com/Akshayykadam/PixelBoard),
 * licensed under the GNU General Public License v3.0. See LICENSE.
 *
 * This runtime is loaded by the Bengali script patch. It decides the output
 * script policy for the Jetson Lite cleanup stage from the enabled-language
 * data that already flows through kfd.d ({ENABLED_LANGUAGES} joined from the
 * enabled-language collection). It performs NO transliteration itself and
 * never disables cleanup; it only narrows two stock prompt policies:
 *
 *   1. The unconditional "Hinglish Override" rule injected by kfd.d is kept
 *      only when the enabled Indic languages are explicit Latin variants
 *      (e.g. bn-Latn). With a native Indic tag present (bn-BD, bn-IN,
 *      bn-Beng, ...) it is replaced with a native-script preservation rule.
 *   2. The "SCRIPT GATE" Branch A ASCII-Romanization mandate inside the Lite
 *      cleanup prompt is rewritten, only under a native Indic policy, into an
 *      enabled-language-driven script rule. All other priorities of the
 *      prompt (disfluencies, dictionary, edits, emoji, punctuation, grammar)
 *      are left byte-identical.
 *
 * Fail-safe contract: any null/blank/unknown input returns the stock input
 * unchanged. The bytecode patcher additionally refuses to install these hooks
 * unless the stock string fingerprints match, so an unexpected Gboard build
 * keeps completely stock behavior instead of getting a guessed patch.
 */
package com.akshaykadam.pixelboard.extension.ramblerlite;

import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Set;

public final class GboardRamblerLiteScriptRuntime {

    public static final String HOOK_VERSION = "1.0.0";

    /** Base ISO-639 codes treated as Indic for script policy. */
    private static final String[] INDIC_BASES = {
        "as", "bn", "bho", "gu", "hi", "kn", "kok", "mai", "ml", "mr",
        "ne", "or", "pa", "sa", "sd", "ta", "te", "ur",
    };

    /** Native-script replacement for the stock "3. Hinglish Override" rule. */
    public static final String NATIVE_SCRIPT_RULE =
        "3. Native Script Preservation: For any combination of Indian languages"
        + " (e.g., Hindi, Bengali, Marathi, Kannada, etc.) and English,"
        + " preserve each language in its own script. Keep Bengali and other"
        + " Indic languages in their native Unicode scripts and keep English"
        + " words in Latin characters. Only use Romanized script (e.g.,"
        + " Banglish) when the enabled language tag explicitly requests a"
        + " Latin variant (e.g., bn-Latn).";

    /** Sentinels delimiting the stock Branch A Romanization bullet. */
    static final String BRANCH_A_BULLET_START =
        "   * Mandatory Indic Romanization (Anti-Gravity Gate)";
    static final String BRANCH_A_BLOCK_END =
        "   * Universal Latin";
    static final String BRANCH_A_REQUIRED_SENTINEL_1 = "Bengali";
    static final String BRANCH_A_REQUIRED_SENTINEL_2 = "NEVER revert";

    public enum IndicScriptPolicy {
        /** No Indic language tag among the enabled languages. */
        NO_INDIC,
        /** Every enabled Indic tag carries an explicit Latin script subtag. */
        EXPLICIT_LATIN_ONLY,
        /** At least one enabled Indic tag is a native-script tag. */
        NATIVE_PRESENT,
        /** Language data missing: caller must keep stock behavior. */
        UNKNOWN,
    }

    /** Observable outcome of the last hook call, for device-side validation. */
    public static volatile String lastHookStatus = "none";

    private GboardRamblerLiteScriptRuntime() {
    }

    public static IndicScriptPolicy classifyEnabledLanguages(String enabledLanguages) {
        if (enabledLanguages == null || enabledLanguages.trim().isEmpty()) {
            return IndicScriptPolicy.UNKNOWN;
        }
        int nativeCount = 0;
        int latinCount = 0;
        for (String raw : enabledLanguages.split("[,;\\s]+")) {
            String tag = raw.trim().toLowerCase(Locale.ROOT).replace('_', '-');
            if (tag.isEmpty()) {
                continue;
            }
            String base = tag.split("-", 2)[0];
            if (!isIndicBase(base)) {
                continue;
            }
            if (tag.matches(".*-latn(-.*)?$")) {
                latinCount++;
            } else {
                nativeCount++;
            }
        }
        if (nativeCount > 0) {
            return IndicScriptPolicy.NATIVE_PRESENT;
        }
        if (latinCount > 0) {
            return IndicScriptPolicy.EXPLICIT_LATIN_ONLY;
        }
        return IndicScriptPolicy.NO_INDIC;
    }

    private static boolean isIndicBase(String base) {
        for (String b : INDIC_BASES) {
            if (b.equals(base)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Hook for kfd.d: chooses what replaces {HINGLISH_OVERRIDE_RULE}.
     * Returns the stock rule only for explicit-Latin Indic selections, the
     * native-preservation rule for native Indic selections, an empty rule for
     * non-Indic selections, and the untouched stock rule when language data is
     * unavailable (fail-safe = stock behavior).
     */
    public static String selectHinglishOverrideRule(String stockRule, String enabledLanguages) {
        switch (classifyEnabledLanguages(enabledLanguages)) {
            case NATIVE_PRESENT:
                lastHookStatus = "hinglish:native-preserve";
                return NATIVE_SCRIPT_RULE;
            case EXPLICIT_LATIN_ONLY:
                lastHookStatus = "hinglish:stock-latn";
                return stockRule;
            case NO_INDIC:
                lastHookStatus = "hinglish:dropped-no-indic";
                return "";
            case UNKNOWN:
            default:
                lastHookStatus = "hinglish:stock-unknown";
                return stockRule;
        }
    }

    /**
     * Hook for kfd.d: rewrites the SCRIPT GATE Branch A Romanization mandate
     * inside the assembled Lite cleanup prompt, but only under a native Indic
     * policy and only when the expected stock block is present verbatim. Any
     * drift leaves the prompt byte-identical.
     */
    public static String rewriteCleanupPromptScriptGate(String prompt, String enabledLanguages) {
        if (prompt == null) {
            return null;
        }
        if (classifyEnabledLanguages(enabledLanguages) != IndicScriptPolicy.NATIVE_PRESENT) {
            lastHookStatus = "scriptgate:untouched";
            return prompt;
        }
        int start = prompt.indexOf(BRANCH_A_BULLET_START);
        int end = start < 0 ? -1 : prompt.indexOf(BRANCH_A_BLOCK_END, start);
        if (start < 0 || end < 0) {
            lastHookStatus = "scriptgate:sentinels-missing-noop";
            return prompt;
        }
        String block = prompt.substring(start, end);
        if (!block.contains(BRANCH_A_REQUIRED_SENTINEL_1)
                || !block.contains(BRANCH_A_REQUIRED_SENTINEL_2)) {
            lastHookStatus = "scriptgate:block-drift-noop";
            return prompt;
        }
        lastHookStatus = "scriptgate:rewritten-native";
        return prompt.substring(0, start)
            + buildNativeBranchABlock(enabledLanguages)
            + prompt.substring(end);
    }

    private static String buildNativeBranchABlock(String enabledLanguages) {
        String langs = enabledLanguages == null ? "" : enabledLanguages.trim();
        return
            "   * Enabled-Language Script Policy: Choose the output script from the"
            + " active enabled languages (" + langs + "), not from the keyboard layout alone.\n"
            + "     - Explicit Latin Indic variants: If the enabled languages contain an explicit"
            + " Latin-script Indic variant (e.g., bn-Latn, hi-Latn), phonetically Romanize Indic"
            + " words into ASCII Latin.\n"
            + "     - Native Indic variants: If the enabled languages contain a native Indic"
            + " language (e.g., bn-BD, bn-IN, bn-Beng, hi, ta) without a Latin-script subtag, keep"
            + " that language in its native script (Bengali stays in Bengali Unicode). If the ASR"
            + " transcript Romanized a native Indic language, restore the correct native script.\n"
            + "     - Never translate semantic meaning between languages.\n";
    }

    /**
     * Hypothesis-stage hook (zh-TW analogue, NOT part of the proven cleanup
     * boundary): admits exact bn-BD / bn-IN into a dictation supported-locale
     * set only if the set exists and lacks them. Element type is preserved
     * (String or java.util.Locale). Returns the input unchanged when the set
     * is null, empty, already admits Bengali, or uses an unknown element type.
     * Ship disabled until a device decode confirms Bengali is actually
     * filtered at this gate on 18.3.1; see docs/VALIDATION.md.
     */
    public static Set<Object> admitExactBengaliLocales(Set<?> supported) {
        if (supported == null) {
            return null;
        }
        LinkedHashSet<Object> result = new LinkedHashSet<Object>(supported);
        boolean hasBnBd = false;
        boolean hasBnIn = false;
        Class<?> elementType = null;
        for (Object e : supported) {
            if (e == null) {
                continue;
            }
            if (elementType == null) {
                elementType = e.getClass();
            }
            String s = e.toString().replace('_', '-');
            if (s.equalsIgnoreCase("bn-BD")) {
                hasBnBd = true;
            }
            if (s.equalsIgnoreCase("bn-IN")) {
                hasBnIn = true;
            }
        }
        if (elementType == null) {
            return result;
        }
        if (Locale.class.isAssignableFrom(elementType)) {
            if (!hasBnBd) {
                result.add(Locale.forLanguageTag("bn-BD"));
            }
            if (!hasBnIn) {
                result.add(Locale.forLanguageTag("bn-IN"));
            }
        } else if (String.class.isAssignableFrom(elementType)) {
            if (!hasBnBd) {
                result.add("bn-BD");
            }
            if (!hasBnIn) {
                result.add("bn-IN");
            }
        }
        return result;
    }
}
