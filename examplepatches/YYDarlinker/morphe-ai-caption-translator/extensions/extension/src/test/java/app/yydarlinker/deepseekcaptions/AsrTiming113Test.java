package app.yydarlinker.deepseekcaptions;
import org.junit.*;import static org.junit.Assert.*;import java.util.*;import java.nio.charset.StandardCharsets;
public class AsrTiming113Test {
    private SourceAtomTimeline.Result track(String[] words,long shift,boolean nativeTimes){
        List<SourceAtomTimeline.Atom> a=new ArrayList<>();for(int i=0;i<words.length;i++)a.add(new SourceAtomTimeline.Atom(shift+i*500,shift+i*500+400,words[i],i/4,nativeTimes));
        return new SourceAtomTimeline.Result(a,(words.length+3)/4,nativeTimes?words.length:0,nativeTimes?0:words.length,true,false);
    }
    private String[] words(int count){String[] words=new String[count];for(int i=0;i<count;i++)words[i]="word"+i;return words;}
    @Test public void coarseAsrIsUsedButNeverLabeledNative(){
        SourceAtomTimeline.Result source=track(words(11),0,false),ref=track(words(11),600,false);
        assertSame(source,AsrLocalTiming.align(source,ref));
        SourceAtomTimeline.Result aligned=AsrLocalTiming.alignWithCueTiming(source,ref);
        assertNotSame(source,aligned);assertEquals(11,aligned.asrMatchedAtoms);assertEquals(0,aligned.nativeTimedAtoms);assertEquals(11,aligned.estimatedAtoms);
        for(int i=0;i<11;i++){assertEquals(ref.atoms.get(i).startMs,aligned.atoms.get(i).startMs);assertEquals(ref.atoms.get(i).endMs,aligned.atoms.get(i).endMs);assertFalse(aligned.atoms.get(i).precise);}
    }
    @Test public void completeShortTrackDoesNotNeedEightWords(){
        SourceAtomTimeline.Result a=track(new String[]{"Hello","world"},0,false),b=track(new String[]{"Hello","world"},300,true);
        SourceAtomTimeline.Result r=AsrLocalTiming.alignWithCueTiming(a,b);assertEquals(2,r.nativeTimedAtoms);assertEquals(300,r.atoms.get(0).startMs);
    }
    @Test public void unrelatedRepeatedAndRemoteReferencesAreRejected(){
        SourceAtomTimeline.Result a=track(words(12),0,false);
        assertSame(a,AsrLocalTiming.alignWithCueTiming(a,track(new String[]{"not","the","same","speech","at","all","and","not","matching"},0,false)));
        assertSame(a,AsrLocalTiming.alignWithCueTiming(a,track(words(12),13000,false)));
        String[] repeated=new String[20];Arrays.fill(repeated,"again");
        SourceAtomTimeline.Result repeat=track(repeated,0,false);String[] partial=Arrays.copyOf(repeated,16);
        assertSame(repeat,AsrLocalTiming.alignWithCueTiming(repeat,track(partial,300,false)));
    }
    @Test public void fallbackKeepsCueEdgesAndSilenceWithBoundedWordWeights()throws Exception{
        String text="{\"events\":[{\"tStartMs\":1000,\"dDurationMs\":4000,\"segs\":[{\"utf8\":\"a extraordinarily long name\"}]},{\"tStartMs\":7000,\"dDurationMs\":1000,\"segs\":[{\"utf8\":\"Next.\"}]}]}";
        byte[] bytes=text.getBytes(StandardCharsets.UTF_8);SourceAtomTimeline.Result r=SourceAtomTimeline.build(bytes,CaptionDocument.parse(bytes,"application/json"));
        assertEquals(0,r.nativeTimedAtoms);assertEquals(1000,r.atoms.get(0).startMs);assertEquals(5000,r.atoms.get(3).endMs);assertEquals(7000,r.atoms.get(4).startMs);assertEquals(8000,r.atoms.get(4).endMs);
        assertTrue(SourceAtomTimeline.estimatedWordWeight("extraordinarily")<=5);assertEquals(1,SourceAtomTimeline.estimatedWordWeight("a"));
        for(int i=1;i<r.atoms.size();i++)assertTrue(r.atoms.get(i).startMs>=r.atoms.get(i-1).endMs);
    }
    @Test public void signedNativeTrackLookupIsVideoAndLanguageBounded(){
        NativeAsrTrackReference.clear();String url="https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&kind=asr&sig=private";
        NativeAsrTrackReference.remember("ja","a.ja",url);assertEquals("",NativeAsrTrackReference.find("abcdefghijk"));
        NativeAsrTrackReference.remember("en",".en",url);assertEquals("",NativeAsrTrackReference.find("abcdefghijk"));
        NativeAsrTrackReference.remember("en","a.en",url);assertEquals(url,NativeAsrTrackReference.find("abcdefghijk"));assertEquals("",NativeAsrTrackReference.find("anotherxxxx"));
        assertFalse(WordTimingReference.safe(url+"&v=anotherxxxx","abcdefghijk"));assertFalse(WordTimingReference.safe(url+"&tlang=zh-Hans","abcdefghijk"));NativeAsrTrackReference.clear();
    }
    @Test public void referenceErrorsDoNotExposeResponseBodies(){
        assertEquals("http_403",RawCaptionSource.timingFailureReason(new IllegalStateException("原字幕 HTTP 403: PRIVATE URL COOKIE RESPONSE")));
        assertEquals("empty_response",RawCaptionSource.timingFailureReason(new IllegalStateException("原字幕响应为空")));
    }
}
