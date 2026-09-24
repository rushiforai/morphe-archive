package app.yydarlinker.deepseekcaptions;
import org.junit.*;
import static org.junit.Assert.*;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class CaptionBehaviorTest {
    @Before public void reset(){CaptionChoice.reset();}
    @Test public void sourceModeNeverCallsApiEvenWithKeyOrReadyTimeline() {
        for(boolean failed:new boolean[]{false,true}) for(boolean cancelled:new boolean[]{false,true})
            assertFalse(CaptionModePolicy.mayCallApi(true,failed,cancelled));
        assertTrue(CaptionModePolicy.mayCallApi(false,false,false));
        assertFalse(CaptionModePolicy.mayCallApi(false,true,false));
    }
    @Test public void prefetchedTranslatedUrlIsNotAUserSelection() {
        for(boolean chosen:new boolean[]{false,true}) for(boolean on:new boolean[]{false,true})
            for(boolean mode:new boolean[]{false,true})
                assertEquals(chosen&&on&&mode,CaptionModePolicy.mayTranslateSelection(chosen,on,mode));
    }
    @Test public void coldStartHasNoDefaultLanguage(){assertFalse(CaptionChoice.isOn());assertEquals("",CaptionChoice.language());}
    @Test public void offKeepsLanguageAndModeForNextOn(){
        CaptionChoice.select("ja",true);CaptionChoice.toggle(false);assertFalse(CaptionChoice.isOn());
        assertEquals("ja",CaptionChoice.language());assertTrue(CaptionChoice.translates());
        CaptionChoice.toggle(true);assertTrue(CaptionChoice.isOn());
    }
    @Test public void englishSourceIsDifferentFromEnglishTranslation(){
        CaptionChoice.select("en",false);assertFalse(CaptionChoice.translates());
        CaptionChoice.select("en",true);assertTrue(CaptionChoice.translates());
        CaptionChoice.select("AUTO_TRANSLATE_CAPTIONS_OPTION",false);assertTrue(CaptionChoice.translates());
    }
    @Test public void originalTrackRetainsExactTextAndCueTime() throws Exception {
        String srt="1\n00:00:01,100 --> 00:00:02,700\nHello, world!\n\n2\n00:00:03,000 --> 00:00:04,000\n[Music]\n";
        CaptionDocument.Parsed doc=CaptionDocument.parse(srt.getBytes(StandardCharsets.UTF_8),"application/x-subrip");
        TranslationUnitTimeline.Result result=NativeSourcePlan.build(doc);
        assertEquals(2,result.units.size());assertEquals("Hello, world!",result.units.get(0).sourceText);
        assertEquals(1100,result.units.get(0).startMs);assertEquals(2700,result.units.get(0).endMs);
        AnchoredCaptionPlan plan=AnchoredCaptionPlan.source(1100,2700,"Hello, world!");
        assertEquals("Hello, world!",plan.segments.get(0).text);
        assertEquals(2700,plan.segments.get(0).endMs);
    }
    private byte[] metadata(String code)throws Exception {
        ByteArrayOutputStream entry=new ByteArrayOutputStream();
        CaptionLanguageMetadata.write(entry,1,code.getBytes(StandardCharsets.UTF_8));
        CaptionLanguageMetadata.write(entry,3,new byte[]{1,2,3});
        ByteArrayOutputStream root=new ByteArrayOutputStream();
        CaptionLanguageMetadata.write(root,3,entry.toByteArray());CaptionLanguageMetadata.write(root,99,new byte[]{8,9});return root.toByteArray();
    }
    @Test public void sharedMenuAddsSimplifiedWithoutRemovingTraditional()throws Exception {
        byte[] original=metadata("zh-Hant");byte[] next=CaptionLanguageMetadata.addSimplified(original);
        List<CaptionLanguageMetadata.Field> f=CaptionLanguageMetadata.fields(next);
        assertEquals(3,f.size());assertEquals(3,f.get(0).number);assertEquals(3,f.get(1).number);
        Set<String> codes=new HashSet<>();for(CaptionLanguageMetadata.Field field:f)if(field.number==3)codes.add(new String(CaptionLanguageMetadata.fields(field.value).get(0).value,StandardCharsets.UTF_8));
        assertEquals(new HashSet<>(Arrays.asList("zh-Hans","zh-Hant")),codes);
        assertArrayEquals(new byte[]{8,9},f.get(2).value);
        assertArrayEquals(next,CaptionLanguageMetadata.addSimplified(next));
        assertTrue(new String(next,StandardCharsets.UTF_8).contains(LanguageMenuOrder.simplifiedLabel()));
    }
    @Test public void existingMalformedSimplifiedNameIsCorrectedWithoutDroppingOtherFields()throws Exception {
        ByteArrayOutputStream entry=new ByteArrayOutputStream(),name=new ByteArrayOutputStream(),root=new ByteArrayOutputStream();
        CaptionLanguageMetadata.write(entry,1,"zh-Hans".getBytes(StandardCharsets.UTF_8));
        CaptionLanguageMetadata.write(name,4,"中文（简体中文）".getBytes(StandardCharsets.UTF_8));CaptionLanguageMetadata.write(entry,2,name.toByteArray());
        CaptionLanguageMetadata.write(entry,7,new byte[]{7,9});CaptionLanguageMetadata.write(root,3,entry.toByteArray());CaptionLanguageMetadata.write(root,99,new byte[]{8,9});
        byte[] result=CaptionLanguageMetadata.addSimplified(root.toByteArray());String readable=new String(result,StandardCharsets.UTF_8);
        assertFalse(readable.contains("简体中文"));assertTrue(readable.contains(LanguageMenuOrder.simplifiedLabel()));
        List<CaptionLanguageMetadata.Field> fields=CaptionLanguageMetadata.fields(result);assertEquals(2,fields.size());assertArrayEquals(new byte[]{8,9},fields.get(1).value);
        assertTrue(CaptionLanguageMetadata.fields(fields.get(0).value).stream().anyMatch(f->f.number==7&&Arrays.equals(new byte[]{7,9},f.value)));
    }
    @Test public void noDuplicateAndNoInventedEmptyTrack()throws Exception {
        byte[] original=metadata("zh-Hans");byte[] corrected=CaptionLanguageMetadata.addSimplified(original);assertArrayEquals(corrected,CaptionLanguageMetadata.addSimplified(corrected));assertTrue(new String(corrected,StandardCharsets.UTF_8).contains(LanguageMenuOrder.simplifiedLabel()));
        byte[] bad={26,127};assertSame(bad,CaptionLanguageMetadata.addSimplified(bad));
        byte[] empty={};assertSame(empty,CaptionLanguageMetadata.addSimplified(empty));
    }
}
