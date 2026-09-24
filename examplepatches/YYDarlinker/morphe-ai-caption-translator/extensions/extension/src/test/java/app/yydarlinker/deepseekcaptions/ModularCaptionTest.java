package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import android.content.res.Configuration;import android.os.LocaleList;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;
import java.util.*;import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28,shadows={ModularCaptionTest.Flags.class,ModularCaptionTest.Tracks.class})
public class ModularCaptionTest {
    private static boolean ai,memory,simplified;
    private static final List<Track> nativeTracks=new ArrayList<>(),translatedTracks=new ArrayList<>();
    enum Origin { PREFERRED_TRACK, DEFAULT }
    static class Track {final String language,url,vss;Track(String code,boolean translation,boolean asr){language=code;vss=asr?"a."+code:code;url="https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en"+(translation?"&tlang="+code:"");}}
    @Implements(CaptionAddonSupport.class) public static class Flags {
        @Implementation public static boolean aiInstalled(){return ai;}
        @Implementation public static boolean memoryInstalled(){return memory;}
        @Implementation public static boolean simplifiedInstalled(){return simplified;}
    }
    @Implements(NativeCaptionBridge.class) public static class Tracks {
        @Implementation public static String language(Object t){return ((Track)t).language;}
        @Implementation public static String url(Object t){return ((Track)t).url;}
        @Implementation public static String vss(Object t){return ((Track)t).vss;}
        @Implementation public static List<?> nativeTracks(Object manager){return nativeTracks;}
        @Implementation public static List<?> translatedTracks(Object manager){return translatedTracks;}
        @Implementation public static CharSequence displayName(Object track){return LanguageMenuOrder.label(((Track)track).language);}
    }
    @Before public void before(){ai=false;memory=false;simplified=false;RememberedCaptionSelection.reset();CaptionChoice.reset();nativeTracks.clear();translatedTracks.clear();}
    @Test public void memoryWorksWithoutAiInstallationAndWithAiDisabled(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();NativeCaptionBridge.initialize(activity);DeepSeekConfig.saveEnabled(activity,false);
        for(boolean installed:new boolean[]{false,true}){
            ai=installed;memory=true;RememberedCaptionSelection.reset();Track selected=new Track("fr",false,true);Track fresh=new Track("fr",false,true);nativeTracks.clear();nativeTracks.add(fresh);
            NativeCaptionBridge.onNativeSelection(new Object(),selected,Origin.PREFERRED_TRACK);
            assertEquals(1,NativeCaptionBridge.restoreDecision());assertSame(fresh,NativeCaptionBridge.resolveRemembered(new Object()));
            assertNotSame(selected,NativeCaptionBridge.resolveRemembered(new Object()));assertFalse(DeepSeekConfig.enabled(activity));
        }activity.finish();
    }
    @Test public void enablingAiDoesNotChangeIndependentMemoryDecisions(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();NativeCaptionBridge.initialize(a);ai=true;memory=true;
        for(boolean enabled:new boolean[]{false,true}){
            DeepSeekConfig.saveEnabled(a,enabled);RememberedCaptionSelection.select("fr",false,true);
            Track fresh=new Track("fr",false,true);nativeTracks.clear();nativeTracks.add(fresh);
            assertEquals(1,NativeCaptionBridge.restoreDecision());assertSame(fresh,NativeCaptionBridge.resolveRemembered(new Object()));
            RememberedCaptionSelection.off();assertEquals(0,NativeCaptionBridge.restoreDecision());
        }
        a.finish();
    }
    @Test public void memoryHandlesNativeAutoTranslationAndOffWithoutApi(){
        memory=true;Track track=new Track("es",true,false);translatedTracks.add(track);
        NativeCaptionBridge.onNativeSelection(new Object(),track,Origin.PREFERRED_TRACK);
        assertTrue(RememberedCaptionSelection.translated());assertSame(track,NativeCaptionBridge.resolveRemembered(new Object()));
        NativeCaptionBridge.onNativeSelection(new Object(),null,Origin.PREFERRED_TRACK);assertEquals(0,NativeCaptionBridge.restoreDecision());assertEquals("es",RememberedCaptionSelection.language());
    }
    @Test public void absentOptionalPatchDoesNotRestoreCrossVideoChoice(){
        RememberedCaptionSelection.select("fr",false,false);nativeTracks.add(new Track("fr",false,false));
        assertEquals(-1,NativeCaptionBridge.restoreDecision());assertNull(NativeCaptionBridge.resolveRemembered(new Object()));
        List<String> original=Arrays.asList("fr","en");assertSame(original,NativeCaptionBridge.augmentTranslations(original));
    }
    @Test public void automaticTrackSelectionCannotOverwriteUserMemory(){
        memory=true;NativeCaptionBridge.onNativeSelection(new Object(),new Track("fr",true,false),Origin.PREFERRED_TRACK);
        NativeCaptionBridge.onNativeSelection(new Object(),new Track("en",false,true),Origin.DEFAULT);assertEquals("fr",RememberedCaptionSelection.language());
    }
    @Test public void missingLanguageDoesNotFabricateATrack(){memory=true;RememberedCaptionSelection.select("de",true,false);translatedTracks.add(new Track("fr",true,false));assertNull(NativeCaptionBridge.resolveRemembered(new Object()));}
    @Test public void menuInsertionUsesCurrentAppLocaleNotFixedChineseSort(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(a);
        for(Locale locale:Arrays.asList(Locale.US,Locale.SIMPLIFIED_CHINESE,Locale.FRANCE,new Locale("ar"))){
            Configuration config=new Configuration(a.getResources().getConfiguration());config.setLocales(new LocaleList(locale));a.getResources().updateConfiguration(config,a.getResources().getDisplayMetrics());
            List<String> nativeOrder=new ArrayList<>(Arrays.asList("ar","zh-Hant","en","fr","ja"));nativeOrder.sort(LanguageMenuOrder::compare);
            List<String> input=new ArrayList<>(nativeOrder);input.add("zh-Hans");List<String> output=LanguageMenuOrder.sorted(input,v->v);
            for(int i=1;i<output.size();i++)assertTrue(LanguageMenuOrder.compare(output.get(i-1),output.get(i))<=0);
            output.remove("zh-Hans");assertEquals(nativeOrder,output);
        }a.finish();
    }
    @Test public void engineToggleDoesNotEraseIndependentLanguageMemory(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();memory=true;RememberedCaptionSelection.select("ja",true,false);
        DeepSeekConfig.saveEnabled(a,true);CaptionChoice.reset();assertTrue(CaptionQuickToggle.setEngine(a,false));assertEquals("ja",RememberedCaptionSelection.language());assertEquals(1,RememberedCaptionSelection.decision());a.finish();
    }
}
