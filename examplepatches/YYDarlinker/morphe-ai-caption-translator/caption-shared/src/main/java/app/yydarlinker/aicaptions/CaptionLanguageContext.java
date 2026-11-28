package app.yydarlinker.aicaptions;

import android.net.Uri;

import java.util.List;
import java.util.Locale;

/** Immutable source-request policy. No UI-language or text-script inference. */
public final class CaptionLanguageContext {
    static final String POLICY_VERSION = "n28b-policy-v1";
    static final CaptionLanguageContext LEGACY = new CaptionLanguageContext("en", "zh-Hans");
    public final String sourceCode, targetCode, sourceProvenance;
    final CaptionLanguageProfile profile;
    public final CaptionRenderSpec renderSpec;
    final boolean canApplyEnglishToChinese, chineseFamily, englishSource;

    private CaptionLanguageContext(String source, String target) {
        sourceCode = CaptionLanguageProfile.normalizeCode(source);
        targetCode = CaptionLanguageProfile.normalizeCode(target);
        sourceProvenance = sourceCode.equals("UNKNOWN") ? "UNKNOWN" : "url_lang";
        profile = CaptionLanguageProfile.fromCode(targetCode);
        chineseFamily = Locale.forLanguageTag(targetCode).getLanguage().equals("zh");
        renderSpec = new CaptionRenderSpec(targetCode, profile, chineseFamily);
        englishSource = Locale.forLanguageTag(sourceCode).getLanguage().equals("en");
        canApplyEnglishToChinese =
                englishSource && (profile.id.equals("zh-Hans") || profile.id.equals("zh-Hant"));
    }

    public static CaptionLanguageContext explicit(String source, String target) {
        return new CaptionLanguageContext(source, target);
    }

    String scope() {
        return POLICY_VERSION
                + "|"
                + sourceCode
                + "|"
                + targetCode
                + "|"
                + (canApplyEnglishToChinese ? "legacy_en_zh" : "neutral");
    }

    String preference(TranslationSettings cfg) {
        return canApplyEnglishToChinese ? cfg.prompt : cfg.effectivePreference;
    }

    String fingerprint(TranslationSettings cfg) {
        return cfg.baseUrl + '\n' + cfg.model + '\n' + preference(cfg);
    }

    public static CaptionLanguageContext observe(String url, String confirmedSessionTarget) {
        String source = null;
        String target = confirmedSessionTarget;
        try {
            Uri uri = Uri.parse(url);
            // Ambiguous duplicate lang parameters cannot establish one actual source code.
            List<String> values = uri.getQueryParameters("lang");
            if (values.size() == 1) source = values.get(0);
            // Preserve a full URL target spelling only when it agrees with the already-confirmed
            // menu target. Legacy request/cache still use Session.target, including its old
            // aliases.
            List<String> targets = uri.getQueryParameters("tlang");
            TargetLanguage requested =
                    targets.size() == 1 ? TargetLanguage.fromCode(targets.get(0)) : null;
            if (requested != null
                    && !CaptionLanguageProfile.normalizeCode(targets.get(0)).equals("UNKNOWN")
                    && requested.code.equals(confirmedSessionTarget)) target = targets.get(0);
        } catch (Exception ignored) {
            /* Missing/invalid URL is unknown; never infer from tlang. */
        }
        return new CaptionLanguageContext(source, target);
    }

    String diagnosticFields() {
        return "source_code="
                + sourceCode
                + ";target_code="
                + targetCode
                + ";profile_id="
                + profile.id
                + ";policy_version="
                + POLICY_VERSION
                + ";source_provenance="
                + sourceProvenance
                + ";reading_counter="
                + profile.readingCounterId()
                + ";line_counter="
                + profile.lineCounterId()
                + ";direction="
                + profile.direction
                + ";strategy="
                + (canApplyEnglishToChinese ? "legacy_en_zh" : "neutral")
                + ";presentation_policy="
                + renderSpec.presentationPolicy;
    }
}
