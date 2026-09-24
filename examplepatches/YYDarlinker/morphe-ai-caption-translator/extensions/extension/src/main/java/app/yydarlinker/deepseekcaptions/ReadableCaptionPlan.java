package app.yydarlinker.deepseekcaptions;
import java.util.*;
/** Merge-only, pre-display readability planning. Never splits translations or invents timestamps. */
final class ReadableCaptionPlan {
    static List<AnchoredCaptionPlan.Segment> merge(List<AnchoredCaptionPlan.Segment> input){
        List<AnchoredCaptionPlan.Segment> out=new ArrayList<>(input);
        int i=0;
        while(i<out.size()) {
            AnchoredCaptionPlan.Segment small=out.get(i);
            if(!brief(small)){i++;continue;}
            int partner=-1;
            // Attach a connector to what follows; otherwise favor the preceding speech.
            if(i+1<out.size() && (i==0 || CaptionSegmentationPolicy.dependent(small.text) || SentenceBoundaryUtil.startsClause(small.text)) && canJoin(small,out.get(i+1)))partner=i+1;
            if(partner<0 && i>0 && canJoin(out.get(i-1),small))partner=i-1;
            if(partner<0 && i+1<out.size() && canJoin(small,out.get(i+1)))partner=i+1;
            if(partner<0){i++;continue;}
            int from=Math.min(i,partner);AnchoredCaptionPlan.Segment a=out.get(from),b=out.get(from+1);
            out.set(from,new AnchoredCaptionPlan.Segment(a.from,b.to,a.startMs,b.endMs,join(a.text,b.text)));
            out.remove(from+1);i=Math.max(0,from-1);
        }
        return Collections.unmodifiableList(out);
    }
    private static boolean brief(AnchoredCaptionPlan.Segment s){
        long ms=s.endMs-s.startMs;return !s.text.trim().isEmpty() && (CaptionSegmentationPolicy.dependent(s.text) || ms<950 || ms<1400 && s.text.codePointCount(0,s.text.length())<=8);
    }
    private static boolean canJoin(AnchoredCaptionPlan.Segment a,AnchoredCaptionPlan.Segment b){
        return !CaptionSegmentationPolicy.speakerStart(b.text) && !a.text.trim().isEmpty() && !b.text.trim().isEmpty() && a.to+1==b.from &&
            b.startMs>=a.endMs && b.startMs-a.endMs<=250 && b.endMs-a.startMs<=7000 && CaptionPresentationPolicy.visible(join(a.text,b.text)) <= (CaptionPresentationPolicy.cjk(join(a.text,b.text))?32:84);
    }
    private static int width(String text){int n=0;for(int cp:text.codePoints().toArray())n+=cp>255?2:1;return n;}
    static String join(String a,String b){
        boolean space=SentenceBoundaryUtil.needsSpace(a,b) || !a.isEmpty() && !b.isEmpty() && a.charAt(a.length()-1)<128 && b.charAt(0)<128 && Character.isLetterOrDigit(b.charAt(0));
        return a+(space?" ":"")+b;
    }
}
