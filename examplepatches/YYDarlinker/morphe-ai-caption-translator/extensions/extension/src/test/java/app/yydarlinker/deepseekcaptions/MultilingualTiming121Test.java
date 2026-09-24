package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;
import java.net.*;import java.io.*;import java.nio.charset.StandardCharsets;import java.lang.reflect.Field;import java.util.*;import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28)
public class MultilingualTiming121Test {
    static final String VIDEO="abcdefghijk";
    static final String BASE="https://www.youtube.com/api/timedtext?v="+VIDEO;
    static String cue(String words,int start){return "{\"events\":[{\"tStartMs\":"+start+",\"dDurationMs\":4500,\"segs\":[{\"utf8\":\""+words+"\"}]}]}";}
    public static class Engine {
        String language,words;boolean metadata;final List<String> calls=new ArrayList<>();
        public HttpURLConnection openConnection(URL url){
            calls.add(url.toString());boolean watch=url.getPath().equals("/watch");int status=watch?404:200;
            String body=cue(words,url.toString().contains("sig=native")?4000:1000);
            if(watch&&metadata){status=200;body="var ytInitialPlayerResponse={\"videoDetails\":{\"videoId\":\""+VIDEO+"\"},\"captions\":{\"playerCaptionsTracklistRenderer\":{\"captionTracks\":[{\"languageCode\":\""+language+"\",\"kind\":\"asr\",\"baseUrl\":\""+BASE+"&lang="+language+"&kind=asr&sig=native\"}]}}};";}
            final int code=status;final byte[] bytes=body.getBytes(StandardCharsets.UTF_8);
            return new HttpURLConnection(url){public void connect(){}public void disconnect(){}public boolean usingProxy(){return false;}public int getResponseCode(){return code;}public String getContentType(){return "application/json";}public InputStream getInputStream(){return new ByteArrayInputStream(bytes);}public InputStream getErrorStream(){return new ByteArrayInputStream(new byte[0]);}};
        }
    }
    private void check(String language,String words,boolean metadata)throws Exception{
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();NativeAsrTrackReference.clear();SourceCaptionCache.clear(a);
        Field field=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");field.setAccessible(true);Object previous=field.get(null);
        Engine fake=new Engine();fake.language=language;fake.words=words;fake.metadata=metadata;field.set(null,fake);
        Field anchors=RawCaptionSource.class.getDeclaredField("WORD_ANCHORS");anchors.setAccessible(true);((Map<?,?>)anchors.get(null)).clear();
        try{
            if(!metadata)NativeAsrTrackReference.remember(language,"a."+language,BASE+"&lang="+language+"&kind=asr&sig=native");
            RawCaptionSource.Source result=RawCaptionSource.load(a,BASE+"&lang="+language+"&tlang=zh-Hans",false,true);
            assertNotNull(language+"\n"+CaptionDiagnostics.uiText(a),result.alignedAtoms);assertEquals(4000,result.alignedAtoms.atoms.get(0).startMs);
            assertEquals(words,result.document.cues().get(0).text);assertEquals(0,result.alignedAtoms.nativeTimedAtoms);
            assertFalse(fake.calls.stream().anyMatch(url->url.contains("lang=en")));
        }finally{field.set(null,previous);NativeAsrTrackReference.clear();((Map<?,?>)anchors.get(null)).clear();a.finish();}
    }
    @Test public void allSourceLanguagesUseNativeAsrWithoutEnglishGate()throws Exception{
        check("ja","今日は世界の歴史について一緒に学んでいきましょう。",false);
        check("zh","今天我们一起来学习世界历史和文化。",false);
        check("fr","nous allons découvrir une histoire vraiment intéressante ensemble",false);
        check("ar","نحن نتعلم اليوم الكثير عن تاريخ العالم والثقافة القديمة",false);
        check("ko","우리는 오늘 세계 역사와 문화에 대해서 함께 배웁니다",false);
    }
    @Test public void japanesePublicMetadataIsUsable()throws Exception{check("ja","今日は世界の歴史について一緒に学んでいきましょう。",true);}
    @Test public void tracksAreLanguagePrioritizedAndNotOverwritten()throws Exception{
        NativeAsrTrackReference.clear();String en=BASE+"&lang=en&kind=asr",ja=BASE+"&lang=ja&kind=asr";
        NativeAsrTrackReference.remember("en","a.en",en);NativeAsrTrackReference.remember("ja","a.ja",ja);
        assertEquals(Arrays.asList(ja,en),NativeAsrTrackReference.candidates(VIDEO,"ja"));
        assertEquals(Arrays.asList(en,ja),NativeAsrTrackReference.candidates(VIDEO,"en-US"));NativeAsrTrackReference.clear();
    }
    @Test public void metadataPrioritizesAnySourceLanguageAndRejectsForeignVideo()throws Exception{
        String tracks="{\"videoDetails\":{\"videoId\":\""+VIDEO+"\"},\"captions\":{\"playerCaptionsTracklistRenderer\":{\"captionTracks\":["
            +"{\"languageCode\":\"en\",\"kind\":\"asr\",\"baseUrl\":\""+BASE+"&lang=en&kind=asr\"},"
            +"{\"languageCode\":\"ja\",\"baseUrl\":\""+BASE+"&lang=ja\"},"
            +"{\"languageCode\":\"ja\",\"kind\":\"asr\",\"baseUrl\":\""+BASE+"&lang=ja&kind=asr\"}]}}}";
        List<String> found=WordTimingReference.findAll("var ytInitialPlayerResponse="+tracks+";",VIDEO,"ja");
        assertEquals(2,found.size());assertTrue(found.get(0).contains("lang=ja"));assertTrue(found.get(1).contains("lang=en"));
        assertTrue(WordTimingReference.findAll("var ytInitialPlayerResponse="+tracks+";","anotherxxxx","ja").isEmpty());
    }
    @Test public void punctuationOnlyTailKeepsPositiveDurationAfterCalibration()throws Exception{
        String words="今日は世界の歴史について一緒に学んでいきましょう。";
        byte[] a=cue(words,1000).getBytes(StandardCharsets.UTF_8),b=cue(words,4000).getBytes(StandardCharsets.UTF_8);
        SourceAtomTimeline.Result source=SourceAtomTimeline.build(a,CaptionDocument.parse(a,"application/json")),reference=SourceAtomTimeline.build(b,CaptionDocument.parse(b,"application/json"));
        SourceAtomTimeline.Result result=AsrLocalTiming.alignWithCueTiming(source,reference);assertNotSame(source,result);
        for(int i=0;i<result.atoms.size();i++){SourceAtomTimeline.Atom atom=result.atoms.get(i);assertTrue(atom.endMs>atom.startMs);if(i>0)assertTrue(atom.startMs>=result.atoms.get(i-1).endMs);}
        SourceAtomTimeline.Atom tail=result.atoms.get(result.atoms.size()-1);assertEquals("。",tail.text);assertFalse(tail.precise);assertEquals(8500,tail.endMs);
    }
    @Test public void matchingTokensHandleUnspacedJapaneseWithoutChangingLatin(){
        assertEquals(Arrays.asList("今","日","は","日","本","語"),TimingTokens.words("今日は日本語"));
        assertEquals(Arrays.asList("dont","change","english","words"),TimingTokens.words("Don't change English words."));
    }
    @Test public void simplifiedChineseNameUsesYouTubeWording(){
        assertEquals("中文（简体）",LanguageMenuOrder.simplifiedLabel(Locale.forLanguageTag("zh-CN")));
        assertEquals("中文（簡體）",LanguageMenuOrder.simplifiedLabel(Locale.forLanguageTag("zh-TW")));
        assertTrue(LanguageMenuOrder.simplifiedLabel(Locale.ENGLISH).contains("Chinese"));
    }
}
