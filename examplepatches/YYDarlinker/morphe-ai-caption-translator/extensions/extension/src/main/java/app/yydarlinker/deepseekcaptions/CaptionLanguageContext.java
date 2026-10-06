package app.yydarlinker.deepseekcaptions;

import android.net.Uri;
import java.util.Locale;

/** Immutable source-request policy. No UI-language or text-script inference. */
final class CaptionLanguageContext {
  static final String POLICY_VERSION = "n28b-policy-v1";
  static final CaptionLanguageContext LEGACY = new CaptionLanguageContext("en", "zh-Hans");
  final String sourceCode, targetCode, sourceProvenance;
  final CaptionLanguageProfile profile;
  final CaptionRenderSpec renderSpec;
  final boolean canApplyEnglishToChinese, chineseFamily, englishSource;
  private CaptionLanguageContext(String source, String target) {
    sourceCode=CaptionLanguageProfile.normalizeCode(source);
    targetCode=CaptionLanguageProfile.normalizeCode(target);
    sourceProvenance=sourceCode.equals("UNKNOWN") ? "UNKNOWN" : "url_lang";
    profile=CaptionLanguageProfile.fromCode(targetCode);
    chineseFamily=Locale.forLanguageTag(targetCode).getLanguage().equals("zh");
    renderSpec=new CaptionRenderSpec(targetCode,profile,chineseFamily);
    englishSource=Locale.forLanguageTag(sourceCode).getLanguage().equals("en");
    canApplyEnglishToChinese=englishSource
        && (profile.id.equals("zh-Hans") || profile.id.equals("zh-Hant"));
  }
  static CaptionLanguageContext explicit(String source, String target) {
    return new CaptionLanguageContext(source, target);
  }
  String scope() {
    return POLICY_VERSION+"|"+sourceCode+"|"+targetCode+"|"
        +(canApplyEnglishToChinese ? "legacy_en_zh" : "neutral");
  }
  String preference(DeepSeekConfig.Snapshot cfg) {
    return canApplyEnglishToChinese ? cfg.prompt : cfg.effectivePreference;
  }
  String fingerprint(DeepSeekConfig.Snapshot cfg) {
    return cfg.baseUrl+'\n'+cfg.model+'\n'+preference(cfg);
  }
  static CaptionLanguageContext observe(String url, String confirmedSessionTarget) {
    String source=null;
    String target=confirmedSessionTarget;
    try {
      Uri uri=Uri.parse(CaptionEngine.sourceCaptionUrl(url));
      // Ambiguous duplicate lang parameters cannot establish one actual source code.
      java.util.List<String> values=uri.getQueryParameters("lang");
      if(values.size()==1) source=values.get(0);
      // Preserve a full URL target spelling only when it agrees with the already-confirmed
      // menu target. Legacy request/cache still use Session.target, including its old aliases.
      java.util.List<String> targets=Uri.parse(url).getQueryParameters("tlang");
      if(targets.size()==1 && !CaptionLanguageProfile.normalizeCode(targets.get(0)).equals("UNKNOWN")
          && TargetLanguage.fromCode(targets.get(0)).code.equals(confirmedSessionTarget))target=targets.get(0);
    } catch(Exception ignored) { /* Missing/invalid URL is unknown; never infer from tlang. */ }
    return new CaptionLanguageContext(source,target);
  }
  String diagnosticFields() {
    return "source_code="+sourceCode+";target_code="+targetCode+";profile_id="+profile.id
        +";policy_version="+POLICY_VERSION+";source_provenance="+sourceProvenance
        +";reading_counter="+profile.readingCounterId()+";line_counter="+profile.lineCounterId()
        +";direction="+profile.direction+";strategy="+(canApplyEnglishToChinese ? "legacy_en_zh" : "neutral")
        +";presentation_policy="+renderSpec.presentationPolicy;
  }
}
