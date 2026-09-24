package app.yydarlinker.deepseekcaptions;
import java.util.*;import org.json.JSONArray;
/** Uses explicit semantic evidence, not a fixed-language dictionary, to join incomplete sense groups. */
final class SemanticEventPacking {
    static List<AnchoredCaptionPlan.Segment> pack(List<AnchoredCaptionPlan.Segment> input,JSONArray raw){
        Set<Integer> join=new HashSet<>();
        if(raw!=null)for(int i=0;i<Math.min(raw.length(),input.size());i++)try{join.add((int)AnchoredCaptionPlan.exactIndex(raw.get(i)));}catch(Exception ignored){}
        List<AnchoredCaptionPlan.Segment> out=new ArrayList<>();
        for(AnchoredCaptionPlan.Segment next:input){
            if(!out.isEmpty()){
                AnchoredCaptionPlan.Segment last=out.get(out.size()-1);String text=ReadableCaptionPlan.join(last.text,next.text);
                long gap=next.startMs-last.endMs;
                if(join.contains(last.to)&&last.to+1==next.from&&!last.text.isEmpty()&&!next.text.isEmpty()
                   &&!next.text.trim().startsWith(">>")&&gap>=0&&gap<=250&&next.endMs-last.startMs<=7000
                   &&CaptionPresentationPolicy.visible(text)<=(CaptionPresentationPolicy.cjk(text)?42:100)){
                    out.set(out.size()-1,new AnchoredCaptionPlan.Segment(last.from,next.to,last.startMs,next.endMs,text));continue;
                }
            }
            out.add(next);
        }
        return Collections.unmodifiableList(out);
    }
}
