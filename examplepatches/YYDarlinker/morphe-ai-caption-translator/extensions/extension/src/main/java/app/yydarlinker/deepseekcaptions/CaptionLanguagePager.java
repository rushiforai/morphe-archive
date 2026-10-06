package app.yydarlinker.deepseekcaptions;

import android.text.StaticLayout;
import java.util.*;

/** Non-Chinese presentation-only pagination, wholly inside one accepted event. */
final class CaptionLanguagePager {
  static final long MIN_PAGE_MS = 1200;
  private CaptionLanguagePager() {}
  static List<RebuildPageLayout.Page> plan(String text,long start,long end,
      CaptionOverlay.LayoutBudget budget,CaptionRenderSpec spec) {
    if(text==null || text.isEmpty() || end<=start || !wellFormed(text,spec))
      return Collections.emptyList();
    if (spec.fits(text,budget.preferredPx,budget.width,2))
      return Collections.singletonList(new RebuildPageLayout.Page(text,start,end,"SOURCE_EVENT"));
    if (end-start < 2*MIN_PAGE_MS && !spec.fits(text,budget.preferredPx,budget.width,2)) return Collections.emptyList();
    Seams seams=seams(text,budget,spec);
    List<RebuildPageLayout.Page> pages=choose(text,start,end,seams.cuts,seams.kinds,budget,spec);
    if(!pages.isEmpty())return pages;
    // Seven seconds and reading/CPL references are watches, not independent reasons for blanking.
    return spec.fits(text,budget.preferredPx,budget.width,2)
        ? Collections.singletonList(new RebuildPageLayout.Page(text,start,end)) : Collections.emptyList();
  }
  static String failureReason(String text,CaptionOverlay.LayoutBudget budget,CaptionRenderSpec spec) {
    if(text==null || text.isEmpty() || !wellFormed(text,spec)) return "hard_geometry_unresolved";
    int[] cuts=CaptionUnicode.characterBoundaries(text,spec.locale);
    boolean[] reachable=new boolean[cuts.length];reachable[0]=true;
    for(int from=0;from<cuts.length-1;from++) if(reachable[from])
      for(int to=from+1;to<cuts.length;to++) {
        if(reachable[to])continue; // Geometry reachability needs no duplicate edge proof.
        int at=cuts[to];
        if(at<text.length() && (text.charAt(at-1)=='\u00a0' || text.charAt(at)=='\u00a0')) continue;
        StaticLayout layout=spec.layout(text.substring(cuts[from],at),budget.preferredPx,budget.width);
        if(layout.getLineCount()>2) break;
        if(spec.fits(text.substring(cuts[from],at),layout,budget.width,2)) {
          reachable[to]=true;if(to==cuts.length-1)return "page_time_capacity_unresolved";
        }
      }
    return reachable[cuts.length-1] ? "page_time_capacity_unresolved" : "hard_geometry_unresolved";
  }
  static boolean wellFormed(String text,CaptionRenderSpec spec) {
    for(int n=0;n<text.length();n++) {
      char c=text.charAt(n);
      if(Character.isHighSurrogate(c)) {
        if(n+1>=text.length() || !Character.isLowSurrogate(text.charAt(++n))) return false;
      } else if(Character.isLowSurrogate(c)) return false;
    }
    int[] cuts=CaptionUnicode.characterBoundaries(text,spec.locale);
    for(int i=1;i<cuts.length;i++) {
      int cp=text.codePointAt(cuts[i-1]),type=Character.getType(cp);
      if(type==Character.NON_SPACING_MARK || type==Character.COMBINING_SPACING_MARK
          || type==Character.ENCLOSING_MARK) return false;
    }
    return true;
  }
  static final int SENTENCE=0, CLAUSE=1, WORD=2, EMERGENCY=3;
  static final class Seams {
    final int[] cuts,kinds;
    Seams(int[] cuts,int[] kinds){this.cuts=cuts;this.kinds=kinds;}
  }
  private static final java.util.regex.Pattern UNICODE_NUMBER=java.util.regex.Pattern.compile(
      "[\\p{Nd}]+(?:[.,\\u066b\\u066c][\\p{Nd}]+)*");
  private static boolean unitLetter(int cp) {
    int type=Character.getType(cp);return Character.isLetterOrDigit(cp) || type==Character.NON_SPACING_MARK
        || type==Character.COMBINING_SPACING_MARK || type==Character.ENCLOSING_MARK;
  }
  static boolean[] protectedOffsets(String text) {
    boolean[] blocked=new boolean[text.length()+1];
    for(int n=1;n<text.length();n++)blocked[n]=text.charAt(n-1)=='\u00a0' || text.charAt(n)=='\u00a0';
    for(java.util.regex.Pattern pattern:Arrays.asList(RebuildNumbers.NUMBER,UNICODE_NUMBER)) {
      java.util.regex.Matcher m=pattern.matcher(text);
      while(m.find())Arrays.fill(blocked,m.start()+1,m.end(),true);
    }
    // Scan compound identifiers once. Avoid repeated regex backtracking on long unspaced scripts.
    for(int at=0;at<text.length();) {
      int cp=text.codePointAt(at);
      if(!unitLetter(cp)){at+=Character.charCount(cp);continue;}
      int from=at;boolean compound=false;
      while(at<text.length()) {
        cp=text.codePointAt(at);
        if(unitLetter(cp)){at+=Character.charCount(cp);continue;}
        if("-./_".indexOf(cp)>=0 && at+Character.charCount(cp)<text.length()
            && unitLetter(text.codePointAt(at+Character.charCount(cp)))) {compound=true;at+=Character.charCount(cp);continue;}
        break;
      }
      if(compound)Arrays.fill(blocked,from+1,at,true);
    }
    return blocked;
  }
  private static int left(String text,int n) {
    while(n>0 && Character.isWhitespace(text.codePointBefore(n)))n-=Character.charCount(text.codePointBefore(n));
    return n;
  }
  private static int right(String text,int n) {
    while(n<text.length() && Character.isWhitespace(text.codePointAt(n)))n+=Character.charCount(text.codePointAt(n));
    return n;
  }
  static boolean opening(int cp) {
    int t=Character.getType(cp);return t==Character.START_PUNCTUATION || t==Character.INITIAL_QUOTE_PUNCTUATION;
  }
  static boolean closing(int cp) {
    int t=Character.getType(cp);return t==Character.END_PUNCTUATION || t==Character.FINAL_QUOTE_PUNCTUATION;
  }
  private static boolean legal(String text,int n,boolean[] blocked) {
    if(n==0 || n==text.length())return true;
    if(blocked[n])return false;
    int l=left(text,n),r=right(text,n);
    if(l==0 || r==text.length())return false; // No whitespace/punctuation-only page.
    int before=text.codePointBefore(l),after=text.codePointAt(r);
    return !opening(before) && !closing(after) && ".,!?;:，。！？；：、\u060c\u061b\u061f\u0964\u0965".indexOf(after)<0;
  }
  private static int evidence(String text,int n) {
    int at=left(text,n);
    while(at>0 && (closing(text.codePointBefore(at)) || text.codePointBefore(at)=='"' || text.codePointBefore(at)=='\''))
      at=left(text,at-Character.charCount(text.codePointBefore(at)));
    if(at==0)return WORD;
    int cp=text.codePointBefore(at);
    if(cp=='.') {
      int start=at-1;
      while(start>0 && (Character.isLetterOrDigit(text.codePointBefore(start)) || text.codePointBefore(start)=='.'))
        start-=Character.charCount(text.codePointBefore(start));
      String unit=text.substring(start,at-1);
      // Decimal, model and short/dotted abbreviation evidence is not a definite sentence.
      if(unit.length()<=3 || unit.indexOf('.')>=0 || RebuildNumbers.hasDigits(unit)
          || !unit.isEmpty() && Character.isUpperCase(unit.codePointAt(0)))return WORD;
      return SENTENCE;
    }
    if("!?。！？\u061f\u0964\u0965".indexOf(cp)>=0)return SENTENCE;
    if(",;:，；：、\u060c\u061b".indexOf(cp)>=0)return CLAUSE;
    return WORD;
  }
  static Seams seams(String text,CaptionOverlay.LayoutBudget budget,CaptionRenderSpec spec) {
    int[] graphemes=CaptionUnicode.characterBoundaries(text,spec.locale);
    int[] words=CaptionUnicode.wordBoundaries(text,spec.locale);
    int[] lines=CaptionUnicode.lineBoundaries(text,spec.locale);
    int[] sentences=CaptionUnicode.sentenceBoundaries(text,spec.locale);
    boolean[] blocked=protectedOffsets(text);
    TreeMap<Integer,Integer> ordinary=new TreeMap<>();ordinary.put(0,SENTENCE);ordinary.put(text.length(),SENTENCE);
    for(int n:graphemes) {
      if(n==0 || n==text.length() || !legal(text,n,blocked))continue;
      int kind=evidence(text,n);
      boolean word=Arrays.binarySearch(words,n)>=0 && Arrays.binarySearch(lines,n)>=0;
      boolean sentence=Arrays.binarySearch(sentences,n)>=0;
      int punctuation=left(text,n);
      while(punctuation>0 && (closing(text.codePointBefore(punctuation)) || text.codePointBefore(punctuation)=='"' || text.codePointBefore(punctuation)=='\''))
        punctuation=left(text,punctuation-Character.charCount(text.codePointBefore(punctuation)));
      if(kind==SENTENCE && punctuation>0 && text.codePointBefore(punctuation)=='.' && !sentence)kind=WORD;
      if(word || kind<WORD || sentence && kind==SENTENCE) ordinary.put(n,kind);
    }
    TreeMap<Integer,Integer> all=new TreeMap<>(ordinary);
    List<Integer> units=new ArrayList<>(ordinary.keySet());
    for(int i=1;i<units.size();i++) {
      int from=units.get(i-1),to=units.get(i);
      // Only an indivisible ordinary unit itself exceeding two-line geometry may split.
      // A shortage of event time is never permission to cut a normally fitting word.
      if(spec.fits(text.substring(from,to),budget.preferredPx,budget.width,2))continue;
      for(int n:graphemes)if(n>from && n<to && text.charAt(n-1)!='\u00a0' && text.charAt(n)!='\u00a0') {
        int l=left(text,n),r=right(text,n);
        if(l>from && r<to && !opening(text.codePointBefore(l)) && !closing(text.codePointAt(r)))all.putIfAbsent(n,EMERGENCY);
      }
    }
    int[] cuts=new int[all.size()],kinds=new int[all.size()];int i=0;
    for(Map.Entry<Integer,Integer> e:all.entrySet()){cuts[i]=e.getKey();kinds[i++]=e.getValue();}
    return new Seams(cuts,kinds);
  }
  static String seamName(int kind) {return new String[]{"sentence","clause","weaker_word","emergency_grapheme"}[kind];}
  static String seamSummary(String text,List<RebuildPageLayout.Page> pages,CaptionOverlay.LayoutBudget budget,CaptionRenderSpec spec) {
    Seams s=seams(text,budget,spec);int at=0,weak=0,emergency=0;StringBuilder cuts=new StringBuilder();
    for(int i=0;i<pages.size()-1;i++) {
      at+=pages.get(i).text.length();int n=Arrays.binarySearch(s.cuts,at);int kind=n<0?EMERGENCY:s.kinds[n];
      if(kind==WORD)weak++;if(kind==EMERGENCY)emergency++;
      if(cuts.length()>0)cuts.append(',');cuts.append(at).append(':').append(seamName(kind));
    }
    return "seam_policy=icu_sentence_word_line_unicode_v3;weak_seams="+weak+";emergency_seams="+emergency+";seams="+cuts;
  }
  private static final class Measured {
    final int lines,units;final boolean fits;final double width,lineUnits;
    Measured(String part,android.text.StaticLayout layout,CaptionOverlay.LayoutBudget budget,CaptionRenderSpec spec) {
      lines=layout.getLineCount();fits=spec.fits(part,layout,budget.width,spec.maxLines);
      // Rejected geometry never participates in scoring; do not run extra ICU counters for it.
      units=fits ? Math.max(1,spec.readingUnits(part)) : 0;
      width=fits ? spec.actualWidth(layout) : 0;lineUnits=fits ? spec.lineUnits(part,layout) : 0;
    }
  }
  private static final class Score implements Comparable<Score> {
    final int emergency,weak,pages,clauses;final double balance;
    Score(int e,int w,int p,int c,double b){emergency=e;weak=w;pages=p;clauses=c;balance=b;}
    public int compareTo(Score o) {
      int n=Integer.compare(emergency,o.emergency);if(n!=0)return n;
      n=Integer.compare(weak,o.weak);if(n!=0)return n;
      n=Integer.compare(pages,o.pages);if(n!=0)return n;
      n=Integer.compare(clauses,o.clauses);return n!=0?n:Double.compare(balance,o.balance);
    }
  }
  private static List<RebuildPageLayout.Page> choose(String text,long start,long end,int[] cuts,int[] kinds,
      CaptionOverlay.LayoutBudget budget,CaptionRenderSpec spec) {
    int n=cuts.length;long duration=end-start;
    int capacity=(int)Math.min(n-1,duration/MIN_PAGE_MS);
    if(capacity<1)return Collections.emptyList();
    Score[][] cost=new Score[capacity+1][n];int[][] previous=new int[capacity+1][n];
    for(int p=0;p<=capacity;p++)Arrays.fill(previous[p],-1);
    cost[0][0]=new Score(0,0,0,0,0);
    int total=Math.max(1,spec.readingUnits(text));
    Map<String,Measured> measurements=new HashMap<>();
    for(int count=0;count<capacity;count++)for(int from=0;from<n-1;from++) {
      Score prior=cost[count][from];if(prior==null)continue;
      for(int to=from+1;to<n;to++) {
        // Within this event/spec/geometry, identical complete parts have identical native layout.
        String part=text.substring(cuts[from],cuts[to]);Measured measured=measurements.get(part);
        if(measured==null){
          measured=new Measured(part,spec.layout(part,budget.preferredPx,budget.width),budget,spec);measurements.put(part,measured);}
        if(measured.lines>spec.maxLines)break;
        if(!measured.fits)continue;
        double ms=duration*measured.units/(double)total;
        double lineUnits=measured.lineUnits,cpl=Math.max(0,lineUnits-spec.profile.referenceCpl);
        int kind=to==n-1?SENTENCE:kinds[to];
        Score score=new Score(prior.emergency+(kind==EMERGENCY?1:0),prior.weak+(kind==WORD?1:0),count+1,
            prior.clauses+(kind==CLAUSE?1:0),prior.balance+cpl*cpl+Math.max(0,ms-spec.profile.softPageDurationMs)/20
            +Math.pow(measured.width/Math.max(1,budget.width)-.8,2));
        if(cost[count+1][to]==null || score.compareTo(cost[count+1][to])<0){cost[count+1][to]=score;previous[count+1][to]=from;}
      }
    }
    int count=-1;Score best=null;
    for(int p=1;p<=capacity;p++)if(cost[p][n-1]!=null && (best==null || cost[p][n-1].compareTo(best)<0)){best=cost[p][n-1];count=p;}
    if(count<0)return Collections.emptyList();
    Deque<String> chosen=new ArrayDeque<>();
    for(int to=n-1;to>0;count--) {int from=previous[count][to];chosen.addFirst(text.substring(cuts[from],cuts[to]));to=from;}
    List<String> parts=new ArrayList<>(chosen);
    long[] weights=new long[parts.size()];long sum=0;
    for(int i=0;i<parts.size();i++) {weights[i]=Math.max(1,spec.readingUnits(parts.get(i)));sum+=weights[i];}
    List<RebuildPageLayout.Page> result=new ArrayList<>();long at=start,used=0,cumulative=0;
    long extra=duration-parts.size()*MIN_PAGE_MS;
    for(int i=0;i<parts.size();i++) {
      cumulative+=weights[i];long distributed=(extra/sum)*cumulative+(extra%sum)*cumulative/sum;
      long next=i==parts.size()-1 ? end : at+MIN_PAGE_MS+distributed-used;
      result.add(new RebuildPageLayout.Page(parts.get(i),at,next));at=next;used=distributed;
    }
    return Collections.unmodifiableList(result);
  }
}
