package app.yydarlinker.deepseekcaptions;

import java.util.*;
import java.util.regex.*;

/** Limited contradiction checks, NOT a multilingual semantic equivalence judge. */
final class RebuildSemantics {
  // Unmodified evidence is authoritative. Ambiguous ASR ("r b", "50 20") is never repaired here.
  static String normalized(String raw) { return raw == null ? "" : raw; }

  static final String[][] ANCHORS = {
      {"\\baircraft carriers?\\b", "航母|航空母舰|航空母艦|航艦"},
      {"\\b(?:fifth|5th)[ -]generation (?:fighters?|aircraft)\\b", "五代|第五代|第5代"},
      {"\\btanks?\\b", "坦克"},
      {"\\bmissiles?\\b", "导弹|飛彈"}
  };
  // Explicit Latin model IDs only. "armada" alone can mean a fleet, "tank" can store water.
  static final Pattern MODEL = Pattern.compile("(?i)(?<![a-z0-9])((?:[a-z]{1,4}(?=-))|(?:(?:t|j|su|mig|f|b|a)(?= )))[- ](\\d{1,3})(?![a-z0-9])");
  static Set<String> models(String x) {
    Set<String> out=new HashSet<>();Matcher m=MODEL.matcher(x);
    while(m.find())out.add(m.group(1).toLowerCase(Locale.ROOT)+"-"+m.group(2));
    return out;
  }
  static boolean has(String pattern,String value){return Pattern.compile(pattern,Pattern.CASE_INSENSITIVE).matcher(value).find();}

  static boolean supports(int concept, String owned) {
    if(concept==2 && has("\\b(?:water|fuel|storage|septic|fish)\\b",owned)) return false;
    if(has(ANCHORS[concept][0],owned)) return true;
    // Context-qualified acronym recognition, never an ASR/text replacement (Sam can be a name).
    return concept==3 && has("\\bsams?\\b",owned)
        && has("\\b(?:chinese|military|missiles?|defen[sc]e|mainland|bases|surface-to-air)\\b",owned);
  }

  static boolean chinese(String text) {
    return text.codePoints().anyMatch(c->Character.UnicodeScript.of(c)==Character.UnicodeScript.HAN)
        && !text.codePoints().anyMatch(c->Character.UnicodeScript.of(c)==Character.UnicodeScript.HIRAGANA || Character.UnicodeScript.of(c)==Character.UnicodeScript.KATAKANA);
  }
  enum Evidence { SUPPORTED, CONTRADICTED, UNKNOWN }
  static Evidence evidence(int concept,String owned,String all) {
    if(supports(concept,owned))return Evidence.SUPPORTED;
    if(!supports(concept,all)||has("\\b(?:it|its|they|them|these|those|such|water|fuel|storage)\\b",owned))return Evidence.UNKNOWN;
    for(int j=0;j<ANCHORS.length;j++)if(j!=concept&&supports(j,owned))return Evidence.CONTRADICTED;
    return Evidence.UNKNOWN;
  }

  /** Reject only positively observed cross-event transfers; omissions/synonyms are not proved locally. */
  static void validatePlan(RebuildSource source, RebuildPlanner.Block block, List<RebuildProtocol.Event> events)
      throws RebuildProtocol.Invalid {
    String all=source.text(block.from,block.to);
    Set<String> allModels=models(all);
    for(RebuildProtocol.Event e:events){
      String owned=source.text(e.from,e.to);
      Set<String> ownModels=models(owned);
      for(String id:models(e.text))
        if(allModels.contains(id)&&!ownModels.contains(id))
          throw new RebuildProtocol.Invalid("semantic_anchor_leak", "range="+e.from+"-"+e.to+"; model="+id+" belongs elsewhere in this block; translate only the quoted source");
      // Absence from a dictionary is UNKNOWN, not proof of transfer. Require an explicit
      // different equipment concept in the owned source as well as the elsewhere-only alias.
      if(chinese(e.text))for(int i=0;i<ANCHORS.length;i++) {
        if(has(ANCHORS[i][1],e.text)&&evidence(i,owned,all)==Evidence.CONTRADICTED)
          throw new RebuildProtocol.Invalid("semantic_anchor_leak", "range="+e.from+"-"+e.to+"; incompatible explicit equipment anchor; source="+owned);
      }
    }
  }

  static void validate(RebuildSource source, int from, int to, String target) throws RebuildProtocol.Invalid {
    String raw=source.text(from,to);
    Matcher adjacent=Pattern.compile("(?<![\\p{L}\\p{N}])(\\d{1,4}) (\\d{1,4})(?![\\p{L}\\p{N}])").matcher(raw);
    while(adjacent.find()){
      // 10 000 / 160 000 can be grouped thousands, not automatically a malformed quantity.
      if(adjacent.group(2).length()==3)continue;
      String reversed=Pattern.quote(adjacent.group(1))+"\\s*(?:至|到|—|–|-)\\s*"+Pattern.quote(adjacent.group(2));
      // These two source numbers are adjacent. A conjunction elsewhere in the event
      // cannot license a range between them (the captured "and has about 50 20" case).
      if(has(reversed,target))
        throw new RebuildProtocol.Invalid("numeric_range_invention");
    }
  }
}
