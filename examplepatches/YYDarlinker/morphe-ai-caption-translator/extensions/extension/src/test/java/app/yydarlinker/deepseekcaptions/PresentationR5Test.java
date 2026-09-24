package app.yydarlinker.deepseekcaptions;
import org.junit.Test;import static org.junit.Assert.*;import java.util.*;import java.nio.charset.StandardCharsets;import java.io.ByteArrayOutputStream;
public class PresentationR5Test {
    @Test public void profileHasDocumentedBounds(){assertEquals(16,CaptionPresentationPolicy.CJK_LINE);assertEquals(32,CaptionPresentationPolicy.CJK_EVENT);assertEquals(7000,CaptionPresentationPolicy.MAX_MS);}
    @Test public void wrapNeverChangesCharactersOrTimes(){String s="第一部分是完整语义，而第二部分继续解释原因。";assertEquals(s,CaptionPresentationPolicy.wrap(s).replace("\n",""));assertFalse(CaptionPresentationPolicy.wrap(s).contains("\n"));}
    @Test public void speakersAreSeparatedBeforePaidRequests(){
        List<SourceAtomTimeline.Atom> a=new ArrayList<>();String[] words={"Hello",">>","Why",">>","Because"};
        for(int i=0;i<words.length;i++)a.add(new SourceAtomTimeline.Atom(i*700,(i+1)*700,words[i],i,true));
        TranslationUnitTimeline.Result result=AnchoredWindowPlanner.build(new SourceAtomTimeline.Result(a,5,5,0,true,false));
        assertEquals(3,result.units.size());assertFalse(result.units.get(0).sourceText.contains("Why"));
    }
    @Test public void transportWindowsStayBounded(){List<SourceAtomTimeline.Atom>a=new ArrayList<>();for(int i=0;i<100;i++)a.add(new SourceAtomTimeline.Atom(i*500,(i+1)*500,"word",i,true));
        for(TranslationUnitTimeline.Unit u:AnchoredWindowPlanner.build(new SourceAtomTimeline.Result(a,100,100,0,true,false)).units)assertTrue(u.endMs-u.startMs<=12000);}
    @Test public void shortMergeCannotCreateWallOfChinese(){String longText=String.join("",Collections.nCopies(32,"字"));
        List<AnchoredCaptionPlan.Segment> out=ReadableCaptionPlan.merge(Arrays.asList(new AnchoredCaptionPlan.Segment(0,0,0,400,"是的"),new AnchoredCaptionPlan.Segment(1,9,400,4000,longText)));assertEquals(2,out.size());}
    @Test public void languageInsertionPreservesOtherNativeOrder(){List<String> result=LanguageMenuOrder.sorted(Arrays.asList("ar","en","ja","zh-Hant","zh-Hans"),v->v);
        List<String> others=new ArrayList<>(result);others.remove("zh-Hans");assertEquals(Arrays.asList("ar","en","ja","zh-Hant"),others);assertEquals(1,Collections.frequency(result,"zh-Hans"));}
    @Test public void sortingMetadataPreservesUnknownFields()throws Exception{
        ByteArrayOutputStream root=new ByteArrayOutputStream();for(String code:Arrays.asList("zh-Hant","en","ja")) {ByteArrayOutputStream e=new ByteArrayOutputStream();CaptionLanguageMetadata.write(e,1,code.getBytes(StandardCharsets.UTF_8));CaptionLanguageMetadata.write(root,3,e.toByteArray());}
        CaptionLanguageMetadata.write(root,99,new byte[]{7,8});byte[] next=CaptionLanguageMetadata.addSimplified(root.toByteArray());List<String> codes=new ArrayList<>();boolean unknown=false;
        for(CaptionLanguageMetadata.Field f:CaptionLanguageMetadata.fields(next)){if(f.number==99){assertArrayEquals(new byte[]{7,8},f.value);unknown=true;}if(f.number==3)for(CaptionLanguageMetadata.Field v:CaptionLanguageMetadata.fields(f.value))if(v.number==1)codes.add(new String(v.value,StandardCharsets.UTF_8));}
        assertTrue(unknown);assertTrue(codes.containsAll(Arrays.asList("ja","en","zh-Hans","zh-Hant")));assertTrue(codes.indexOf("ja")>codes.indexOf("en"));assertArrayEquals(next,CaptionLanguageMetadata.addSimplified(next));
    }
    @Test public void fullWidthMusicIsNotTranslated(){assertEquals("这是 EOS",ContextualCaptionTextPolicy.translationForDisplay("这是［音乐］ EOS"));}
    @Test public void sizeRangeIsClamped(){assertEquals(22,DeepSeekConfig.MAX_CAPTION_TEXT_SIZE);assertTrue(SubtitleStyleMetrics.scaledSp(22,1000)<=39.6f+.001f);}
}
