package app.yydarlinker.deepseekcaptions;

import java.util.*;

/** Immutable reference data only. No current request, review or pager consumes these values. */
final class CaptionLanguageProfile {
  static final String POLICY_VERSION = "n28a-reference-v1";
  enum Direction { LTR, RTL, FIRST_STRONG }
  enum ReadingCounter { LEGACY_CODEPOINTS, VISIBLE_GRAPHEME }
  enum LineCounter { LEGACY_CHINESE, GRAPHEME, JAPANESE_WIDTH, KOREAN_WIDTH }
  final String id, policyVersion;
  final Locale locale;
  final Direction direction;
  final ReadingCounter readingCounter;
  final LineCounter lineCounter;
  final int referenceCps, referenceCpl;
  final long softPageDurationMs;

  private CaptionLanguageProfile(String id, Direction direction, ReadingCounter reading,
      LineCounter line, int cps, int cpl) {
    this.id=id; locale=Locale.forLanguageTag(id.equals("generic") ? "und" : id);
    this.direction=direction; readingCounter=reading; lineCounter=line;
    referenceCps=cps; referenceCpl=cpl; softPageDurationMs=7000;
    policyVersion=POLICY_VERSION;
  }
  private static CaptionLanguageProfile latin(String id, int cps) {
    return new CaptionLanguageProfile(id,Direction.LTR,ReadingCounter.VISIBLE_GRAPHEME,LineCounter.GRAPHEME,cps,42);
  }
  private static final Map<String,CaptionLanguageProfile> PROFILES;
  static final CaptionLanguageProfile GENERIC = new CaptionLanguageProfile("generic",Direction.FIRST_STRONG,
      ReadingCounter.VISIBLE_GRAPHEME,LineCounter.GRAPHEME,17,42);
  static {
    Map<String,CaptionLanguageProfile> p=new LinkedHashMap<>();
    for(String id:new String[]{"zh-Hans","zh-Hant"}) p.put(id,new CaptionLanguageProfile(id,
        Direction.LTR,ReadingCounter.LEGACY_CODEPOINTS,LineCounter.LEGACY_CHINESE,9,16));
    p.put("ja",new CaptionLanguageProfile("ja",Direction.LTR,ReadingCounter.VISIBLE_GRAPHEME,LineCounter.JAPANESE_WIDTH,4,13));
    p.put("ko",new CaptionLanguageProfile("ko",Direction.LTR,ReadingCounter.VISIBLE_GRAPHEME,LineCounter.KOREAN_WIDTH,12,16));
    p.put("en",latin("en",20));
    for(String id:new String[]{"es","fr","de","pt","ru","vi","id"}) p.put(id,latin(id,17));
    p.put("ar",new CaptionLanguageProfile("ar",Direction.RTL,ReadingCounter.VISIBLE_GRAPHEME,LineCounter.GRAPHEME,20,42));
    p.put("hi",latin("hi",22));
    PROFILES=Collections.unmodifiableMap(p);
  }
  static Map<String,CaptionLanguageProfile> profiles() { return PROFILES; }

  /** Normalizes metadata, never a Session target/URL/cache key. UNKNOWN is not a language guess. */
  static String normalizeCode(String code) {
    if(code==null) return "UNKNOWN";
    String tag=code.trim().replace('_','-').replaceAll("\\s*-\\s*","-");
    if(tag.isEmpty() || tag.length()>128 || !tag.matches("[A-Za-z]{2,8}(?:-[A-Za-z0-9]{1,8})*")) return "UNKNOWN";
    try {
      Locale parsed=new Locale.Builder().setLanguageTag(tag).build();
      String primary=parsed.getLanguage();
      if(primary.isEmpty() || primary.equals("und") || primary.equals("unknown") || primary.equals("zxx") || primary.equals("mul")) return "UNKNOWN";
      return parsed.toLanguageTag();
    } catch(IllformedLocaleException e) { return "UNKNOWN"; }
  }
  static CaptionLanguageProfile fromCode(String code) {
    String tag=normalizeCode(code);
    if(tag.equals("UNKNOWN")) return GENERIC;
    Locale parsed=Locale.forLanguageTag(tag);
    if(parsed.getLanguage().equals("zh")) {
      String script=parsed.getScript(), region=parsed.getCountry();
      if(script.equals("Hans")) return PROFILES.get("zh-Hans");
      if(script.equals("Hant")) return PROFILES.get("zh-Hant");
      if(!script.isEmpty()) return GENERIC;
      if(region.equals("CN") || region.equals("SG")) return PROFILES.get("zh-Hans");
      if(region.equals("TW") || region.equals("HK") || region.equals("MO")) return PROFILES.get("zh-Hant");
      return GENERIC;
    }
    CaptionLanguageProfile p=PROFILES.get(parsed.getLanguage());
    return p==null ? GENERIC : p;
  }
  String readingCounterId() { return readingCounter==ReadingCounter.LEGACY_CODEPOINTS ? "legacy_codepoints" : "visible_grapheme"; }
  String lineCounterId() { return lineCounter.name().toLowerCase(Locale.ROOT); }
}
