package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;import java.net.*;import java.io.*;import java.nio.charset.StandardCharsets;import java.lang.reflect.Field;import java.util.*;import static org.junit.Assert.*;
/** Exercises the production loader with an in-memory Cronet-shaped transport; no outside network. */
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28)
public class AsrLoader113Test {
    private static final String VIDEO="abcdefghijk";
    private static final String WORDS="one two three four five six seven eight nine";
    public static class Engine {
        final List<String> calls=new ArrayList<>();boolean nativePresent=true;boolean metadataAvailable=false;
        public HttpURLConnection openConnection(URL url){
            calls.add(url.toString());boolean watch=url.getPath().equals("/watch"),nativeTrack=url.toString().contains("sig=valid-native");
            int status=watch?404:200;String body=cue(nativeTrack?4000:1000);
            if(watch&&metadataAvailable){status=200;body="var ytInitialPlayerResponse={\"videoDetails\":{\"videoId\":\""+VIDEO+"\"},\"captions\":{\"playerCaptionsTracklistRenderer\":{\"captionTracks\":[{\"languageCode\":\"en\",\"kind\":\"asr\",\"baseUrl\":\"https://www.youtube.com/api/timedtext?v="+VIDEO+"&lang=en&kind=asr&sig=valid-native\"}]}}};";}
            final int code=status;final byte[] bytes=body.getBytes(StandardCharsets.UTF_8);
            return new HttpURLConnection(url){public void connect(){}public void disconnect(){}public boolean usingProxy(){return false;}public int getResponseCode(){return code;}public String getContentType(){return "application/json";}public InputStream getInputStream(){return new ByteArrayInputStream(bytes);}public InputStream getErrorStream(){return new ByteArrayInputStream(new byte[0]);}};
        }
    }
    private static String cue(int start){return "{\"events\":[{\"tStartMs\":"+start+",\"dDurationMs\":4500,\"segs\":[{\"utf8\":\""+WORDS+"\"}]}]}";}
    private void check(boolean nativeTrack)throws Exception{
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();NativeAsrTrackReference.clear();SourceCaptionCache.clear(a);
        Field field=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");field.setAccessible(true);Object previous=field.get(null);Engine fake=new Engine();fake.metadataAvailable=!nativeTrack;field.set(null,fake);
        Field anchors=RawCaptionSource.class.getDeclaredField("WORD_ANCHORS");anchors.setAccessible(true);((Map<?,?>)anchors.get(null)).clear();
        try{
            if(nativeTrack)NativeAsrTrackReference.remember("en","a.en","https://www.youtube.com/api/timedtext?v="+VIDEO+"&lang=en&kind=asr&sig=valid-native");
            RawCaptionSource.Source result=RawCaptionSource.load(a,"https://www.youtube.com/api/timedtext?v="+VIDEO+"&lang=en&tlang=zh-Hans",false,true);
            assertNotNull(result.alignedAtoms);assertEquals(0,result.alignedAtoms.nativeTimedAtoms);assertEquals(9,result.alignedAtoms.asrMatchedAtoms);assertEquals(4000,result.alignedAtoms.atoms.get(0).startMs);
            assertTrue(CaptionDiagnostics.uiText(a).contains("ASR_CUE_TIMING_APPLIED"));
            if(nativeTrack){assertTrue(fake.calls.get(1).contains("sig=valid-native"));assertEquals("Usable native reference must not trigger watch-page probing",2,fake.calls.size());}
            assertFalse(SourceCaptionCache.key(fake.calls.get(0)).equals(SourceCaptionCache.referenceKey(fake.calls.get(0))));
        }finally{field.set(null,previous);NativeAsrTrackReference.clear();((Map<?,?>)anchors.get(null)).clear();a.finish();}
    }
    @Test public void nativeSignedAsrIsPreferredAndCoarseClockStillCalibrates()throws Exception{check(true);}
    @Test public void publicMetadataFallbackAcceptsSingleCueWithoutWordOffsets()throws Exception{check(false);}
}
