package app.yydarlinker.deepseekcaptions;
import java.util.*;
/** Joins a brief boundary only when both plans are ready and neither has been displayed. */
final class CrossWindowReadability {
    static List<AnchoredCaptionPlan.Segment> merge(AnchoredCaptionPlan a,AnchoredCaptionPlan b,
            int offsetA,int offsetB,long now){
        if(a==null || b==null || a.segments.isEmpty() || b.segments.isEmpty())return Collections.emptyList();
        List<AnchoredCaptionPlan.Segment> all=new ArrayList<>();
        for(AnchoredCaptionPlan.Segment s:a.segments)all.add(global(s,offsetA));
        for(AnchoredCaptionPlan.Segment s:b.segments)all.add(global(s,offsetB));
        List<AnchoredCaptionPlan.Segment> joined=ReadableCaptionPlan.merge(all);
        for(AnchoredCaptionPlan.Segment s:joined)
            if(s.from<offsetB && s.to>=offsetB && now<s.startMs)return joined;
        return Collections.emptyList();
    }
    private static AnchoredCaptionPlan.Segment global(AnchoredCaptionPlan.Segment s,int offset){
        return new AnchoredCaptionPlan.Segment(offset+s.from,offset+s.to,s.startMs,s.endMs,s.text);
    }
}
