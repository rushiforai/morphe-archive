package app.yydarlinker.deepseekcaptions;

import java.util.*;
import java.util.regex.*;

/** Bounded, advisory fidelity review with targeted repair candidates. */
final class RebuildReview {
  static final int MAX_SESSION_REPAIRS = 6;

  static final class Issue {
    final int from,to;
    final String code,detail;
    final boolean repair;
    Issue(int f,int t,String c,String d,boolean r){from=f;to=t;code=c;detail=d;repair=r;}
    String describe(){return code+" range="+from+"-"+to+": "+detail;}
  }

  static List<Issue> inspect(RebuildSource s,RebuildPlanner.Block b,List<RebuildProtocol.Event> events) {
    List<Issue> out=new ArrayList<>();
    int shortEvents=0;
    for(RebuildProtocol.Event e:events) {
      String source=s.text(e.from,e.to), text=e.text;
      boolean zh=RebuildSemantics.chinese(text);
      int words=source.split("\\s+").length;
      long han=text.codePoints().filter(c->Character.UnicodeScript.of(c)==Character.UnicodeScript.HAN).count();
      int visible=(int)text.codePoints().filter(c->!Character.isWhitespace(c)).count();
      boolean english=source.matches("(?s).*[a-zA-Z]{3}.*") && !source.codePoints().anyMatch(RebuildSource::cjk);
      if(words<=6 || han<=7) shortEvents++;
      boolean compressed=english&&zh&&words>=24&&han<words*.8;
      boolean negative=RebuildSemantics.has("\\b(?:cannot|can't|couldn't|won't|never)\\b",source);
      boolean translatedNegative=RebuildSemantics.has("不|没|未|无|難|难|非|勿|否|休想|别想",text);
      if(compressed&&negative&&!translatedNegative)
        out.add(new Issue(e.from,e.to,"possible_omission","Source contains a negative conclusion but this short translation may omit it. Re-read every predicate, object, condition and modality; retain the conclusion without summarizing.",true));
      else if(compressed)
        out.add(new Issue(e.from,e.to,"compression_watch","Unusually short translation for this source; not proof of omission.",false));
      if(english&&zh&&words>=12&&han<words
          &&RebuildSemantics.has("\\b(?:could|can) reach (?:the )?[a-z]+(?: [a-z]+){0,2} with\\b",source)
          &&!RebuildSemantics.has("达|及|覆盖|覆蓋|射程|触|觸|抵|到|打击|打擊",text))
        out.add(new Issue(e.from,e.to,"possible_relation_omission","Check the source reach/place relation and its object; translation may retain equipment but omit where it can reach.",true));
      if(english&&zh&&RebuildSemantics.has("(?i)(?:aren't|isn't|not) always",source)&&RebuildSemantics.has("通常不|一般不|往往不",text))
        out.add(new Issue(e.from,e.to,"possible_polarity_change","Not always means not in every case, not usually not. Preserve the quantifier scope.",true));
      if(english&&zh&&RebuildSemantics.has("(?i)a product of",source)&&RebuildSemantics.has("乘积|相乘",text)&&!RebuildSemantics.has("(?i)multiply|multiplication|equation|mathematical",source))
        out.add(new Issue(e.from,e.to,"possible_arithmetic_misread","Product of may express dependence rather than multiplication. Read the revenue/sales relationship in context.",true));
      if(english&&zh&&source.matches("(?is).*\\bwould follow [a-z'-]+ reduced\\b.*")&&RebuildSemantics.has("之后|之後",text))
        out.add(new Issue(e.from,e.to,"possible_subject_attachment","A new subject followed by reduced may start a new clause after would follow. Preserve the actor of the reduction; do not attach that actor to the prior relative clause.",true));
      if(english&&zh&&text.matches("(?s).*(?:延伸至|延伸到|达到|取决于)[，。；]?$")&&e.to+1<s.words.size())
        out.add(new Issue(e.from,e.to,"open_complement","The target ends with an incomplete relation. Retain its source-owned complement, using neighboring context only to understand it.",true));
      String before=e.from>0?s.text(Math.max(0,e.from-48),e.from-1):"";
      if(english&&zh&&source.matches("(?is)^(?:(?:than|then) )?they are with\\b.*")
          &&RebuildSemantics.has("\\b(?:more|less)\\b[\\s\\S]{0,260}\\b(?:than|then)\\s*$",before)
          &&RebuildSemantics.has("一起|共同|一同",text))
        out.add(new Issue(e.from,e.to,"possible_comparison_misread","Context compares reactions to A versus B; this fragment may not mean jointly participating with B. Preserve comparison direction and resolve ASR then/than without editing source.",true));

      boolean likelyIncomplete=english && incompleteSourceEnd(source);
      boolean connectorFragment=english && source.trim().toLowerCase(Locale.ROOT).matches("(?:and|but|then|well)\\b.*")
          && (han<=6 || visible<=8);
      if(english&&zh&&words>=3&&e.end-e.start<1800&&han<=4&&(likelyIncomplete||connectorFragment)) {
        out.add(new Issue(e.from,e.to,"fragmentary_translation","Source ends or begins at a grammatical dependency, while the translation is too short to carry the predicate and its argument. Join it with a coherent neighboring source range; do not split target text to create times.",true));
      } else if(english&&zh&&han<=2&&words>=3&&e.end-e.start<1800)
        out.add(new Issue(e.from,e.to,"fragmentary_translation","Very short translation for multiple source words. Check that the predicate and its argument have not been lost; join only by reassigning coherent source ranges.",false));
      else if(english&&zh&&han<=2&&words>=2&&e.end-e.start<1000)
        out.add(new Issue(e.from,e.to,"micro_event_watch","Sub-second isolated discourse marker; inspect neighboring source/target continuity without assuming omission.",false));
      if(english&&zh&&words>=25&&han>=32&&e.end-e.start>=8000)
        out.add(new Issue(e.from,e.to,"dense_long_event_watch","Long multi-clause caption; verify readable timing and coherent source boundaries at the preferred font.",false));
      if(english&&zh&&RebuildSemantics.has("\\blicensed or unlicensed\\b",source)
          &&RebuildSemantics.has("合法.*非法|非法.*合法",text))
        out.add(new Issue(e.from,e.to,"possible_authorization_expansion","Licensed/unlicensed means authorized/unauthorized, not necessarily legal/illegal; check source meaning and repair the wording if needed.",true));
      if(english&&zh&&RebuildSemantics.has("\\btank fleet\\b",source)
          &&RebuildSemantics.has("坦克舰队|坦克艦隊",text))
        out.add(new Issue(e.from,e.to,"possible_equipment_term","Tank fleet means the tanks as a force, not a naval fleet; preserve the intended military unit and repair the wording.",true));
      if(e.to<b.to && RebuildPlanner.protectedCut(s,e.to))
        out.add(new Issue(e.from,e.to,"dependent_boundary","Boundary may split a noun phrase, comparison or subject+verb. Reassign coherent SOURCE ranges, then translate each whole range; never divide target text to create times.",true));

      Matcher adjacent=Pattern.compile("\\b(\\d{1,3}) (\\d{1,3})\\b").matcher(source);
      while(adjacent.find()) {
        String left=adjacent.group(1), right=adjacent.group(2);
        // A three-digit second group can be a grouped thousand: "10 000".
        // The deterministic numeric validator has the same exemption.
        if(right.length()==3)continue;
        out.add(new Issue(e.from,e.to,"source_number_ambiguity","Adjacent source numbers; do not silently invent a range or model identifier.",false));
        boolean leftPresent=RebuildSemantics.has("(?<![0-9])"+Pattern.quote(left)+"(?![0-9])",text);
        boolean rightPresent=RebuildSemantics.has("(?<![0-9])"+Pattern.quote(right)+"(?![0-9])",text);
        if(!leftPresent||!rightPresent)
          out.add(new Issue(e.from,e.to,"possible_number_loss","Original ASR has two adjacent numbers; translation omits at least one. Keep the uncertainty explicit rather than silently selecting one.",true));
        String joined="(?s)(?<![0-9])"+Pattern.quote(left)+"\\s*(?:至|到|[-—~]|型|型号|号|架|艘|辆|枚)\\s*"+Pattern.quote(right)+"(?![0-9])";
        if(RebuildSemantics.has(joined,text))
          out.add(new Issue(e.from,e.to,"possible_number_range_invention","Adjacent source numbers were joined as a range, model, or unit relation that the source does not state. Preserve the unresolved ASR locally.",true));
      }
      if(zh)for(int i=0;i<RebuildSemantics.ANCHORS.length;i++)
        if(RebuildSemantics.has(RebuildSemantics.ANCHORS[i][1],text)
            &&!RebuildSemantics.supports(i,source)
            &&RebuildSemantics.supports(i,s.text(b.from,b.to)))
          out.add(new Issue(e.from,e.to,"anchor_unknown","Entity ownership is uncertain (possible synonym/reference); not a hard rejection or automatic repair.",false));
      // A long block still needs its final events checked. The repair prompt,
      // rather than the safety scan, is bounded to 1200 characters below.
    }
    int totalWords=Math.max(1,b.to-b.from+1);
    double average=(double)totalWords/Math.max(1,events.size());
    if(out.size()<16 && events.size()>=9 && average<9.0 && shortEvents*100>=events.size()*60) {
      // Specific bad fragments already have their own bounded repair issue.
      // A block-wide warning must not keep spending after that fragment has played.
      out.add(new Issue(b.from,b.to,"fragmented_plan","The block is over-segmented into many short events. Prefer fewer clause-complete events; never split discourse markers, auxiliaries, or complements merely to follow estimated word times.",false));
    }
    return Collections.unmodifiableList(out);
  }

  private static boolean incompleteSourceEnd(String source) {
    String t=source.trim().toLowerCase(Locale.ROOT);
    return t.matches("(?s).*\\b(?:have|has|had|is|are|was|were|be|been|being|will|would|can|could|should|might|must|and|or|but|because|if|while|that|which|who|than|then|with|of|to|for|from|in|on|at|by|as|after|before|every|a|an|the|more|less|not)\\b");
  }

  static RebuildProtocol.Plan withLayoutReview(RebuildProtocol.Plan plan, java.util.function.Predicate<String> fits) {
    return withLayoutReview(plan,null,fits);
  }
  static RebuildProtocol.Plan withLayoutReview(RebuildProtocol.Plan plan,RebuildSource source,
      java.util.function.Predicate<String> fits) {
    if (fits == null) return plan;
    List<Issue> all = new ArrayList<>(plan.issues);
    for (RebuildProtocol.Event e : plan.events)
      if (!fits.test(e.text)) {
        String detail="This event does not fit the current measured caption budget; keep every proposition and repair its SOURCE boundary, not the translated text.";
        int cut=suggestedSourceCut(source,e);
        if(cut>=0)detail+=" Try a coherent source boundary after token "+cut+" (next event begins at "+(cut+1)+").";
        all.add(new Issue(e.from,e.to,"layout_overflow",detail,true));
      }
    return all.size()==plan.issues.size() ? plan : new RebuildProtocol.Plan(plan.events,plan.json,all,plan.reboundEvents);
  }
  private static int suggestedSourceCut(RebuildSource source,RebuildProtocol.Event event) {
    if(source==null || event.to-event.from<10)return -1;
    int mid=(event.from+event.to)/2,best=-1,bestScore=Integer.MIN_VALUE;
    for(int i=event.from+4;i<=event.to-5;i++) {
      if(!RebuildPlanner.safeCut(source,i))continue;
      int score=RebuildPlanner.resourceScore(source,i);
      if(score<50)continue;
      int rank=score*100-Math.abs(i-mid);
      if(rank>bestScore){best=i;bestScore=rank;}
    }
    return best;
  }
  static boolean uncertainNumbers(RebuildProtocol.Plan p,RebuildProtocol.Event e) {
    for(Issue i:p.issues)if(i.code.equals("source_number_ambiguity")&&i.from<=e.to&&i.to>=e.from)return true;
    return false;
  }
  static boolean blocked(RebuildProtocol.Plan plan,RebuildProtocol.Event event) {
    return blocked(plan,event,null);
  }
  static boolean blocked(RebuildProtocol.Plan plan,RebuildProtocol.Event event,
      java.util.function.Predicate<String> currentFits) {
    for(Issue issue:plan.issues) {
      if(issue.from>event.to || issue.to<event.from)continue;
      if(issue.code.equals("layout_overflow")) {
        if(currentFits==null || !currentFits.test(event.text))return true;
      } else if(issue.code.equals("paragraph") || issue.code.equals("possible_polarity_change")
          || issue.code.equals("possible_arithmetic_misread") || issue.code.equals("possible_subject_attachment")
          || issue.code.equals("numeric_range_invention") || issue.code.equals("possible_number_range_invention"))
        return true;
    }
    return false;
  }
  static int score(List<Issue> issues){int n=0;for(Issue i:issues)if(i.repair)n++;return n;}
  static String repair(List<Issue> issues) {
    StringBuilder out=new StringBuilder("Advisory fidelity review, not a proven error. Check these ranges against source and context; preserve already correct meanings. ");
    List<Issue> ordered=new ArrayList<>();
    for(Issue i:issues)if(i.repair)ordered.add(i);
    // The bounded prompt must include factual reversals even after many early
    // low-priority fragments; do not let source order alone crowd them out.
    ordered.sort((a,b)->Integer.compare(repairPriority(b.code),repairPriority(a.code)));
    for(Issue i:ordered){
      if(out.length()+i.describe().length()>1200)continue;
      out.append(i.describe()).append(' ');
    }
    return out.toString();
  }
  private static int repairPriority(String code) {
    if(code.equals("numeric_range_invention") || code.equals("possible_number_range_invention")
        || code.equals("possible_polarity_change") || code.equals("possible_subject_attachment")
        || code.equals("possible_arithmetic_misread"))return 100;
    if(code.equals("possible_number_loss") || code.equals("possible_authorization_expansion")
        || code.equals("possible_equipment_term"))return 80;
    if(code.equals("layout_overflow") || code.equals("paragraph"))return 60;
    if(code.equals("fragmentary_translation"))return 40;
    return 30;
  }
  static String repair(RebuildProtocol.Plan plan,long position) {
    List<Issue> upcoming=new ArrayList<>();
    for(Issue issue:plan.issues)
      for(RebuildProtocol.Event e:plan.events)
        if(e.end>position && issue.from<=e.to && issue.to>=e.from) {
          upcoming.add(issue);
          break;
        }
    return repair(upcoming);
  }
  private static int semanticScore(RebuildProtocol.Plan p){
    int n=0;
    for(Issue i:p.issues) if(i.repair && !i.code.equals("layout_overflow")
        && !i.code.equals("paragraph") && !i.code.equals("fragmented_plan")
        && !i.code.equals("fragmentary_translation")) {
      // Factual reversal/invented quantities outrank terminology and layout.
      if(i.code.equals("numeric_range_invention") || i.code.equals("possible_number_range_invention")
          || i.code.equals("possible_polarity_change") || i.code.equals("possible_subject_attachment")
          || i.code.equals("possible_arithmetic_misread"))n+=3;
      else n++;
    }
    return n;
  }
  private static int segmentationPenalty(RebuildProtocol.Plan p){
    int n=0;
    for(Issue i:p.issues) {
      if(i.code.equals("fragmented_plan")) n+=3;
      else if(i.code.equals("fragmentary_translation")) n+=2;
      else if(i.code.equals("micro_event_watch")) n++;
    }
    return n;
  }
  static RebuildProtocol.Plan prefer(RebuildProtocol.Plan previous,RebuildProtocol.Plan candidate) {
    return prefer(previous,candidate,null,Long.MIN_VALUE);
  }
  static RebuildProtocol.Plan prefer(RebuildProtocol.Plan previous,RebuildProtocol.Plan candidate,
      java.util.function.Predicate<String> currentFits) {
    return prefer(previous,candidate,currentFits,Long.MIN_VALUE);
  }
  static RebuildProtocol.Plan prefer(RebuildProtocol.Plan previous,RebuildProtocol.Plan candidate,
      java.util.function.Predicate<String> currentFits,long position) {
    if(previous==null)return candidate;
    int oldSemantic=semanticScore(previous),newSemantic=semanticScore(candidate);
    if(oldSemantic!=newSemantic)return oldSemantic<newSemantic?previous:candidate;
    long oldUnavailable=unavailableMs(previous,currentFits,position),newUnavailable=unavailableMs(candidate,currentFits,position);
    if(oldUnavailable!=newUnavailable)return newUnavailable<oldUnavailable?candidate:previous;
    int oldSeg=segmentationPenalty(previous),newSeg=segmentationPenalty(candidate);
    if(oldSeg!=newSeg)return newSeg<oldSeg?candidate:previous;
    if(score(candidate.issues)==score(previous.issues))return previous;
    return score(candidate.issues)<score(previous.issues)?candidate:previous;
  }
  private static long unavailableMs(RebuildProtocol.Plan plan,
      java.util.function.Predicate<String> currentFits,long position) {
    long total=0;
    for(RebuildProtocol.Event e:plan.events)
      if(blocked(plan,e,currentFits) || currentFits!=null && !currentFits.test(e.text))
        total+=Math.max(0,e.end-Math.max(e.start,position));
    return total;
  }
  static boolean structuralRetry(String reason) {
    if (reason == null) return false;
    String code = reason;
    int cut = code.indexOf(';');
    if (cut >= 0) code = code.substring(0, cut);
    return code.equals("source_quote_mismatch");
  }

  static boolean shouldRepair(RebuildProtocol.Plan p,int attempts,int repairs,long position,long end) {
    return shouldRepair(p,attempts,repairs,position,end,null);
  }
  static boolean shouldRepair(RebuildProtocol.Plan p,int attempts,int repairs,long position,long end,
      java.util.function.Predicate<String> currentFits) {
    if(attempts>=2 || repairs>=MAX_SESSION_REPAIRS || position>=end)return false;
    for(Issue issue:p.issues)if(issue.repair) {
      for(RebuildProtocol.Event e:p.events) {
        if(e.end<=position || issue.from>e.to || issue.to<e.from)continue;
        if(!issue.code.equals("layout_overflow") || currentFits==null || !currentFits.test(e.text))
          return true;
      }
    }
    return false;
  }
}
