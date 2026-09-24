package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import android.content.Context;import android.graphics.drawable.Drawable;import android.view.View;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;
import java.util.*;import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=28,shadows={QuickCaptionToggleTest.Flags.class,QuickCaptionToggleTest.TrackAccess.class,QuickCaptionToggleTest.Keys.class,QuickCaptionToggleTest.Menu.class,QuickCaptionToggleTest.Core.class})
public class QuickCaptionToggleTest {
    private static boolean installed,top,shorts,validKey;private static View.OnClickListener listener;private static int rows;private static final List<Object> selections=new ArrayList<>();
    enum Origin { PREFERRED_TRACK }
    static class Track {}
    @Implements(CaptionAddonSupport.class) public static class Flags {@Implementation public static boolean aiInstalled(){return installed;} @Implementation public static boolean memoryInstalled(){return true;}}
    @Implements(SecureApiKey.class) public static class Keys {@Implementation public static String load(Context context){return validKey?"test-only-not-a-real-key":"";}}
    @Implements(NativeCaptionBridge.class) public static class TrackAccess {
        @Implementation public static String language(Object t){return "fr";}
        @Implementation public static String vss(Object t){return "tfr.en";}
        @Implementation public static String url(Object t){return "https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&tlang=fr";}
        @Implementation public static void selectNative(Object m,Object t,Object o,int reason){selections.add(t);assertEquals(17,reason);}
    }
    @Implements(CaptionQuickToggle.class) public static class Menu {
        @Implementation public static boolean topMenu(){return top;}
        @Implementation public static boolean shortsOpen(){return shorts;}
        @Implementation public static int addNativeRow(Object p,Drawable d,String label,View.OnClickListener click,int index){rows++;listener=click;assertEquals(3,index);assertFalse(label.isEmpty());return index+1;}
    }
    @Implements(DynamicCaptionController.class) public static class Core {
        @Implementation public static void activate(Context context,String url){} // No network in switch tests.
        @Implementation public static void refreshConfiguration(Context context){}
    }
    @Before public void reset(){installed=true;top=false;shorts=false;validKey=true;rows=0;selections.clear();CaptionChoice.reset();RememberedCaptionSelection.reset();}
    @Test public void switchesReselectSameTrackAndKeepLanguageMemory(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(a);DeepSeekConfig.saveEnabled(a,false);Track track=new Track();
        PageCaptionController.onVideoId("abcdefghijk");Object manager=new Object();NativeCaptionBridge.onNativeSelectionWithReason(manager,track,Origin.PREFERRED_TRACK,17);assertTrue(CaptionChoice.translates());
        assertTrue(String.valueOf(org.robolectric.shadows.ShadowToast.getTextOfLatestToast()),CaptionQuickToggle.setEngine(a,true));assertTrue(DeepSeekConfig.enabled(a));assertEquals(Arrays.asList(null,track),selections);
        assertEquals("fr",RememberedCaptionSelection.language());selections.clear();
        assertTrue(CaptionQuickToggle.setEngine(a,false));assertFalse(DeepSeekConfig.enabled(a));assertEquals(Arrays.asList(null,track),selections);assertEquals("fr",RememberedCaptionSelection.language());a.finish();
    }
    @Test public void menuClickTogglesDirectlyWithoutDialog(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(a);DeepSeekConfig.saveEnabled(a,false);top=true;
        NativeCaptionBridge.onNativeSelection(new Object(),null,Origin.PREFERRED_TRACK);
        CaptionQuickToggle.onMenu(new Object(),3);listener.onClick(new View(a));assertTrue(DeepSeekConfig.enabled(a));
        listener.onClick(new View(a));assertFalse(DeepSeekConfig.enabled(a));
        assertNull(org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog());a.finish();
    }
    @Test public void missingKeyDoesNotTurnOffNativeCaptions(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();DeepSeekConfig.saveEnabled(a,false);validKey=false;
        assertFalse(CaptionQuickToggle.setEngine(a,true));assertFalse(DeepSeekConfig.enabled(a));assertTrue(selections.isEmpty());a.finish();
    }
    @Test public void offCaptionsRemainOffWhenEngineChanges(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();DeepSeekConfig.saveEnabled(a,false);NativeCaptionBridge.onNativeSelection(new Object(),null,Origin.PREFERRED_TRACK);
        assertTrue(String.valueOf(org.robolectric.shadows.ShadowToast.getTextOfLatestToast()),CaptionQuickToggle.setEngine(a,true));assertFalse(CaptionChoice.isOn());assertEquals(0,RememberedCaptionSelection.decision());assertTrue(selections.isEmpty());a.finish();
    }
    @Test public void onlyRecognizedPlayerMenusReceiveAnEntry(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(a);Object panel=new Object();
        CaptionQuickToggle.onMenu(panel,3);assertEquals(0,rows);top=true;CaptionQuickToggle.onMenu(panel,3);assertEquals(1,rows);
        installed=false;CaptionQuickToggle.onMenu(panel,3);assertEquals(1,rows);
        installed=true;top=false;shorts=true;
        CaptionQuickToggle.observeMenuPath("captions_sheet_content.e",new byte[]{1});CaptionQuickToggle.onMenu(panel,3);assertEquals(1,rows);
        CaptionQuickToggle.observeMenuPath("overflow_menu_item.e", "yt_outline_closed_caption_".getBytes(java.nio.charset.StandardCharsets.US_ASCII));CaptionQuickToggle.onMenu(panel,3);assertEquals(2,rows);
        CaptionQuickToggle.onMenu(panel,3);assertEquals(2,rows);a.finish();
    }
}
