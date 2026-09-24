package app.yydarlinker.deepseekcaptions;
import java.util.*;
/** Deterministic presentation faults, not a claim of semantic equivalence. */
final class CaptionQualityPolicy {
    static final String PREFIX="caption_quality:";
    static boolean failure(String reason){return reason!=null&&reason.startsWith(PREFIX);}
    static String issue(List<AnchoredCaptionPlan.Segment> segments,List<SourceAtomTimeline.Atom> atoms,TranslationUnitTimeline.Unit unit){
        for(AnchoredCaptionPlan.Segment s:segments){
            if(s.text.isEmpty())continue;
            int chars=CaptionPresentationPolicy.visible(s.text);long ms=s.endMs-s.startMs;
            boolean cjk=CaptionPresentationPolicy.cjk(s.text);
            boolean clauses=s.text.matches("(?s).+[。！？!?，,；;].+");
            if(!clauses)for(int i=unit.fromAtom+s.from;i<unit.fromAtom+s.to;i++)
                if(SemanticTaskPlanner.boundaryEvidence(atoms,i)>=2 && SemanticTaskPlanner.safeBoundary(atoms,i)){clauses=true;break;}
            if(clauses && chars>(cjk?42:100) && (ms>7000 || chars>(cjk?64:170)))return PREFIX+"paragraph_needs_source_aligned_clauses";
            if(ms<950 && s.to<unit.toAtom-unit.fromAtom && dependent(s.text))return PREFIX+"orphan_fragment";
        }
        return "";
    }
    static boolean dependent(String text){
        String s=text.trim().replaceAll("[，,:：;；。]+$","");
        return CaptionSegmentationPolicy.dependent(s)||s.matches("(这[种一]?|那[种一]?|其)(速度|进程|过程|方面|情况)")||
                s.matches("(我|我们|他|他们|它|这)(也)?(不|并不)?(是|要|会|想|打算|无意)");
    }
    static List<AnchoredCaptionPlan.Segment> pack(List<AnchoredCaptionPlan.Segment> segments,List<SourceAtomTimeline.Atom> atoms,TranslationUnitTimeline.Unit unit){
        List<AnchoredCaptionPlan.Segment> out=new ArrayList<>(segments);
        for(int i=0;i+1<out.size();i++){
            AnchoredCaptionPlan.Segment a=out.get(i),b=out.get(i+1);
            String source=SourceAtomTimeline.join(atoms,unit.fromAtom+a.from,unit.fromAtom+a.to);
            boolean dependent=dependent(a.text)||!SemanticTaskPlanner.safeBoundary(atoms,unit.fromAtom+a.to);
            if(!dependent||SemanticTaskPlanner.terminal(source))continue;
            String text=ReadableCaptionPlan.join(a.text,b.text);
            if(a.to+1==b.from&&!a.text.isEmpty()&&!b.text.isEmpty()&&b.startMs>=a.endMs&&b.startMs-a.endMs<=250&&
                    b.endMs-a.startMs<=7000&&!SemanticTaskPlanner.speaker(b.text)&&
                    CaptionPresentationPolicy.visible(text)<=(CaptionPresentationPolicy.cjk(text)?32:84)){
                out.set(i,new AnchoredCaptionPlan.Segment(a.from,b.to,a.startMs,b.endMs,text));out.remove(i+1);i=Math.max(-1,i-1);
            }
        }
        return Collections.unmodifiableList(out);
    }
}
