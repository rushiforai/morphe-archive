package app.yydarlinker.deepseekcaptions;

import android.text.StaticLayout;
import java.util.*;

/** Non-Chinese presentation-only pagination, wholly inside one accepted event. */
final class N29LegacyPagerFixture {
  static final long MIN_PAGE_MS = 1200;
  private N29LegacyPagerFixture() {}
  static List<RebuildPageLayout.Page> plan(String text,long start,long end,
      CaptionOverlay.LayoutBudget budget,CaptionRenderSpec spec) {
    if(text==null || text.isEmpty() || end<=start || !wellFormed(text,spec))
      return Collections.emptyList();
    if (end-start <= 7000 && spec.fits(text,budget.preferredPx,budget.width,2))
      return Collections.singletonList(new RebuildPageLayout.Page(text,start,end));
    if (end-start < MIN_PAGE_MS) return Collections.emptyList();
    int[] characters=CaptionUnicode.characterBoundaries(text,spec.locale);
    int[] lines=CaptionUnicode.lineBoundaries(text,spec.locale);
    List<RebuildPageLayout.Page> pages=choose(text,start,end,lines,budget,spec);
    // Only a geometrically insoluble locale-line plan may split an unbreakable word.
    // Every emergency seam still belongs to one complete ICU grapheme; never cut NBSP glue.
    if(!pages.isEmpty()) return pages;
    int[] emergency=Arrays.stream(characters).filter(n -> n==0 || n==text.length()
        || text.charAt(n-1)!='\u00a0' && text.charAt(n)!='\u00a0').toArray();
    pages=choose(text,start,end,emergency,budget,spec);
    if (!pages.isEmpty()) return pages;
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
        int at=cuts[to];
        if(at<text.length() && (text.charAt(at-1)=='\u00a0' || text.charAt(at)=='\u00a0')) continue;
        StaticLayout layout=spec.layout(text.substring(cuts[from],at),budget.preferredPx,budget.width);
        if(layout.getLineCount()>2) break;
        if(spec.fits(text.substring(cuts[from],at),layout,budget.width,2)) reachable[to]=true;
      }
    return reachable[cuts.length-1] ? "page_time_capacity_unresolved" : "hard_geometry_unresolved";
  }
  private static boolean wellFormed(String text,CaptionRenderSpec spec) {
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
  private static List<RebuildPageLayout.Page> choose(String text,long start,long end,int[] cuts,
      CaptionOverlay.LayoutBudget budget,CaptionRenderSpec spec) {
    int n=cuts.length;long duration=end-start;
    int capacity=(int)Math.min(n-1,duration/MIN_PAGE_MS);
    if (capacity < 1) return Collections.emptyList();
    double[][] cost=new double[capacity+1][n];
    int[][] previous=new int[capacity+1][n];
    for(int p=0;p<=capacity;p++) {Arrays.fill(cost[p],Double.POSITIVE_INFINITY);Arrays.fill(previous[p],-1);}
    cost[0][0]=0;
    int total=Math.max(1,spec.readingUnits(text));
    for(int count=0;count<capacity;count++) for(int from=0;from<n-1;from++) {
      if(!Double.isFinite(cost[count][from])) continue;
      for(int to=from+1;to<n;to++) {
        String part=text.substring(cuts[from],cuts[to]);
        StaticLayout layout=spec.layout(part,budget.preferredPx,budget.width);
        if(layout.getLineCount()>spec.maxLines) break;
        if(!spec.fits(part,layout,budget.width,spec.maxLines)) continue;
        double ms=duration*Math.max(1,spec.readingUnits(part))/(double)total;
        double lineUnits=0;
        for(int line=0;line<layout.getLineCount();line++) lineUnits=Math.max(lineUnits,
            spec.lineUnits(part.substring(layout.getLineStart(line),layout.getLineEnd(line))));
        double cpl=Math.max(0,lineUnits-spec.profile.referenceCpl);
        double score=cost[count][from]+200+(layout.getLineCount()==1 ? 0 : 1800)
            +cpl*cpl+Math.max(0,ms-spec.profile.softPageDurationMs)/20;
        if(to<n-1) {
          int at=cuts[to];while(at>cuts[from] && Character.isWhitespace(text.codePointBefore(at)))
            at-=Character.charCount(text.codePointBefore(at));
          if(at>cuts[from] && ".!?;:，。！？；：".indexOf(text.codePointBefore(at))>=0) score-=80;
        }
        if(score<cost[count+1][to]) {cost[count+1][to]=score;previous[count+1][to]=from;}
      }
    }
    int count=-1;double best=Double.POSITIVE_INFINITY;
    for(int p=1;p<=capacity;p++) if(cost[p][n-1]<best) {best=cost[p][n-1];count=p;}
    if(count<0) return Collections.emptyList();
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
