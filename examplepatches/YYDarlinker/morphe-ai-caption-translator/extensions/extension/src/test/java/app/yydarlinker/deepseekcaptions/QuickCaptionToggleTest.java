package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import android.content.Context;import android.graphics.drawable.Drawable;import android.view.View;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;
import java.util.*;import app.yydarlinker.caption.contracts.CaptionContracts.*;import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=28,shadows={QuickCaptionToggleTest.Flags.class,QuickCaptionToggleTest.TrackAccess.class,QuickCaptionToggleTest.Keys.class,QuickCaptionToggleTest.Menu.class,QuickCaptionToggleTest.Core.class})
public class QuickCaptionToggleTest {
    private static String currentVideo="";
    static void setVideo(String value){currentVideo=value;NativeCaptionBridge.onVideoId(value);}
    static void installFakePort(){
        CaptionActions.install(new CaptionPort(){
            public void command(Action action,String value){if(action==Action.VIDEO)setVideo(value);}
            public boolean active(){return false;}public boolean ownsNativeTrack(){return false;}
            public String restoreTarget(String url){return url;}public String videoId(){return currentVideo;}
            public void playback(long time){}
        },new CaptionActions.SettingsServices(){public String testApi(){return "fake";}public List<String> models(String endpoint){return Collections.emptyList();}});
    }

    private static boolean installed,top,shorts,validKey;private static View.OnClickListener listener;private static int rows;private static final List<Object> selections=new ArrayList<>();
    enum Origin { PREFERRED_TRACK }
    static class Track {}
    @Implements(CaptionAddonSupport.class) public static class Flags {@Implementation public static boolean aiInstalled(){return installed;}}
    @Implements(SecureApiKey.class) public static class Keys {@Implementation public static String load(Context context){return validKey?"test-only-not-a-real-key":"";}}
    @Implements(NativeCaptionBridge.class) public static class TrackAccess {
        @Implementation public static String language(Object t){return "fr";}
        @Implementation public static String vss(Object t){return "tfr.en";}
        @Implementation public static String url(Object t){return "https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&tlang=fr";}
        @Implementation public static String nativeModelVideo(Object m){return "abcdefghijk";}
    }
    @Implements(CaptionQuickToggle.class) public static class Menu {
        @Implementation public static boolean topMenu(){return top;}
        @Implementation public static boolean shortsOpen(){return shorts;}
        @Implementation public static int addNativeRow(Object p,Drawable d,String label,View.OnClickListener click,int index){rows++;listener=click;assertEquals(3,index);assertFalse(label.isEmpty());return index+1;}
    }
    @Implements(CaptionActions.class) public static class Core {
        @Implementation public static void activate(Context context,String url){} // No network in switch tests.
        @Implementation public static void refreshConfiguration(Context context){}
        // The real port writes the session intent on a user off; the fake port has no application,
        // so the intent write is done here instead.
        @Implementation public static void deactivateByUser(){CaptionSessionReconciler.onUserOff(CaptionAddonSupport.context(),"cc_button");}
        @Implementation public static void deactivateAfterNativeReset(){}
    }
    @Before public void reset(){
        installFakePort();setVideo("");installed=true;top=false;shorts=false;validKey=true;rows=0;selections.clear();
        CaptionSessionIntent.resetForTests(CaptionAddonSupport.context());
        CaptionSessionReconciler.resetForTests();
        CaptionNativeProjection.resetForTests();NativeCaptionBridge.resetForTests();
    }
    /** The application announces a video: that is what starts the caption session. */
    private static void startVideo(Activity a,String video){
        setVideo(video);
        CaptionSessionReconciler.onVideo(a,video);
    }
    @Test public void switchingEngineKeepsTheNativeSelection(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(a);DeepSeekConfig.saveEnabled(a,false);Track track=new Track();
        CaptionSessionIntent.resetForTests(a);startVideo(a,"abcdefghijk");Object manager=new Object();
        NativeCaptionBridge.onNativeSelectionWithReason(manager,track,Origin.PREFERRED_TRACK,17);
        CaptionSessionIntent chosen=CaptionSessionIntent.load(a);
        assertTrue("the CC menu choice is the user's target",CaptionNativeProjection.snapshot().hasTarget());assertEquals("fr",CaptionNativeProjection.snapshot().target());assertTrue(CaptionNativeProjection.snapshot().translated);
        assertFalse("the CC menu preserves the disabled AI choice",chosen.aiEnabled);
        assertFalse("a native language choice cannot enable AI",DeepSeekConfig.enabled(a));
        assertTrue(selections.isEmpty());
        assertTrue(String.valueOf(org.robolectric.shadows.ShadowToast.getTextOfLatestToast()),CaptionQuickToggle.setEngine(a,true));assertTrue(DeepSeekConfig.enabled(a));assertEquals("fr",CaptionNativeProjection.snapshot().target());
        assertTrue(selections.isEmpty());
        assertTrue(CaptionQuickToggle.setEngine(a,false));assertFalse(DeepSeekConfig.enabled(a));assertTrue(selections.isEmpty());
        assertEquals("turning AI off keeps its target","fr",CaptionNativeProjection.snapshot().target());a.finish();
    }
    @Test public void menuClickTogglesDirectlyWithoutDialog(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(a);DeepSeekConfig.saveEnabled(a,false);top=true;
        startVideo(a,"abcdefghijk");
        NativeCaptionBridge.onNativeSelection(new Object(),new Track(),Origin.PREFERRED_TRACK);
        assertTrue("the menu gave the switch a target",CaptionNativeProjection.snapshot().hasTarget());
        assertFalse("the native language menu keeps AI disabled",DeepSeekConfig.enabled(a));
        CaptionQuickToggle.onMenu(new Object(),3);listener.onClick(new View(a));assertTrue(DeepSeekConfig.enabled(a));
        listener.onClick(new View(a));assertFalse(DeepSeekConfig.enabled(a));
        assertNull(org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog());a.finish();
    }
    @Test public void missingKeyDoesNotTurnOffNativeCaptions(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();DeepSeekConfig.saveEnabled(a,false);validKey=false;
        assertFalse(CaptionQuickToggle.setEngine(a,true));assertFalse(DeepSeekConfig.enabled(a));assertTrue(selections.isEmpty());a.finish();
    }
    @Test public void anExplicitOffIsAUserActAndTheSwitchCanUndoItWithATarget(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(a);
        DeepSeekConfig.saveEnabled(a,false);CaptionSessionIntent.resetForTests(a);startVideo(a,"abcdefghijk");
        NativeCaptionBridge.onNativeSelection(new Object(),null,Origin.PREFERRED_TRACK);
        assertFalse("an explicit caption-menu Off is a user act",CaptionSessionIntent.load(a).aiEnabled);
        // The Off row leaves no target; choosing one in the same menu is the user's next act.
        NativeCaptionBridge.onNativeSelection(new Object(),new Track(),Origin.PREFERRED_TRACK);
        assertEquals("the menu supplied the target","fr",CaptionNativeProjection.snapshot().target());
        assertTrue(String.valueOf(org.robolectric.shadows.ShadowToast.getTextOfLatestToast()),CaptionQuickToggle.setEngine(a,true));
        assertTrue(CaptionSessionIntent.load(a).aiEnabled);
        assertTrue("the target is retained",CaptionNativeProjection.snapshot().hasTarget());
        assertTrue(selections.isEmpty());a.finish();
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
    /** A fresh install has no target: the switch must not stay on and silence native captions. */
    @Test     public void switchingOnWithoutANativeSelectionWaitsWithoutInventingALanguage(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(a);
        DeepSeekConfig.saveEnabled(a,false);CaptionSessionIntent.resetForTests(a);startVideo(a,"abcdefghijk");
        assertTrue(CaptionQuickToggle.setEngine(a,true));
        assertTrue(DeepSeekConfig.enabled(a));
        assertTrue(CaptionSessionIntent.load(a).aiEnabled);
        assertFalse(CaptionNativeProjection.snapshot().hasTarget());
        assertTrue(selections.isEmpty());a.finish();
    }
}
