package app.yydarlinker.deepseekcaptions;
import org.junit.Test;import static org.junit.Assert.*;import java.util.*;
public class SegmentationR7Test {
 @Test public void dependentQuestionIsMergedEvenWhenNotBrief(){List<AnchoredCaptionPlan.Segment> s=ReadableCaptionPlan.merge(Arrays.asList(new AnchoredCaptionPlan.Segment(0,1,0,1800,"到底"),new AnchoredCaptionPlan.Segment(2,5,1800,4000,"意味着什么？")));assertEquals(1,s.size());assertEquals("到底意味着什么？",s.get(0).text);assertEquals(0,s.get(0).startMs);assertEquals(4000,s.get(0).endMs);}
 @Test public void rejectsStackedClausesButNotShortCompleteThought(){assertFalse(CaptionSegmentationPolicy.issue(new AnchoredCaptionPlan.Segment(0,30,0,11000,"这意味着什么？但第二点，潜台词是，要做到这一点，它很可能也会软得多，因此抗刮性更差，反之亦然。")).isEmpty());assertEquals("",CaptionSegmentationPolicy.issue(new AnchoredCaptionPlan.Segment(0,5,0,3000,"他们从来不需要解释")));}
 @Test public void shortCauseClauseCanRemainTogether(){assertEquals("",CaptionSegmentationPolicy.issue(new AnchoredCaptionPlan.Segment(0,12,0,6000,"但至少可以说它有误导性，因为防摔和防刮是此消彼长的关系。")));}
 @Test public void seriousParagraphCannotBeMarkedReady()throws Exception{
 List<SourceAtomTimeline.Atom>a=new ArrayList<>();for(int i=0;i<20;i++)a.add(new SourceAtomTimeline.Atom(i*500,(i+1)*500,"word"+i,i,true));
 TranslationUnitTimeline.Unit u=AnchoredWindowPlanner.build(new SourceAtomTimeline.Result(a,20,20,0,true,false)).units.get(0);
 String text="这意味着什么？但第二点，潜台词是，要做到这一点，它很可能也会软得多，因此抗刮性更差，反之亦然。";
 try {AnchoredCaptionPlan.parse(new org.json.JSONArray().put(new org.json.JSONArray().put(u.toAtom-u.fromAtom).put(text)),a,u);fail("serious paragraph must be rejected");}
 catch(IllegalArgumentException expected){assertTrue(expected.getMessage().startsWith(CaptionQualityPolicy.PREFIX));}
 }
 @Test public void noMergeAcrossSpeakerOrLongSilence(){for(AnchoredCaptionPlan.Segment b:Arrays.asList(new AnchoredCaptionPlan.Segment(1,2,400,2400,">> Hello"),new AnchoredCaptionPlan.Segment(1,2,1500,2400,"意味着什么")))assertEquals(2,ReadableCaptionPlan.merge(Arrays.asList(new AnchoredCaptionPlan.Segment(0,0,0,400,"到底"),b)).size());}
}
