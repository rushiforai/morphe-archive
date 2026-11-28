package app.yydarlinker.aicaptions.settings;

import app.yydarlinker.aicaptions.host.CaptionAddonSupport;
import android.app.Activity;
import android.graphics.drawable.Drawable;
import android.view.View;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={CaptionFlyoutPreferenceTest.Flags.class,CaptionFlyoutPreferenceTest.Menu.class})
public class CaptionFlyoutPreferenceTest {
    static int added,containers;static boolean shorts,top,reject;
    Activity a;
    @Implements(CaptionAddonSupport.class) public static class Flags {
        @Implementation public static boolean aiInstalled(){return true;}
    }
    @Implements(CaptionQuickToggle.class) public static class Menu {
        @Implementation public static boolean topMenu(){return top;}
        @Implementation public static boolean shortsOpen(){return shorts;}
        @Implementation public static int addNativeRow(Object panel,Drawable icon,String text,View.OnClickListener click,int index){added++;return reject ? -1 : index+1;}
        @Implementation public static android.widget.LinearLayout nativeContainer(Object panel){containers++;return null;}
    }
    @Before public void setup(){a=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(a);added=containers=0;shorts=reject=false;top=true;}
    @After public void finish(){a.finish();}
    @Test public void hiddenEntryLeavesOfficialIndexAndContainerUntouched(){
        AiCaptionConfig.saveFlyoutMenuEnabled(a,false);AiCaptionConfig.saveShortsFlyoutMenuEnabled(a,false);
        for(int index:new int[]{0,3})for(boolean s:new boolean[]{false,true}){
            shorts=s;top=!s;CaptionQuickToggle.observeMenuPath("overflow_menu_item.e", "closed_caption".getBytes());
            assertEquals(index,CaptionQuickToggle.onMenu(new Object(),index));
        }
        assertEquals(0,added);assertEquals(0,containers);
    }
    @Test public void nativeInsertionFailurePreservesIncomingIndex() {
        reject = true;
        assertEquals(7, CaptionQuickToggle.onMenu(new Object(), 7));
        assertEquals(1, added);
        assertEquals(0, containers);
    }

    @Test public void regularAndShortsSettingsAreIndependentForEveryCombination(){
        for(boolean regular:new boolean[]{false,true})for(boolean shortSetting:new boolean[]{false,true}){
            AiCaptionConfig.saveFlyoutMenuEnabled(a,regular);AiCaptionConfig.saveShortsFlyoutMenuEnabled(a,shortSetting);
            for(boolean player:new boolean[]{false,true})for(boolean topSignal:new boolean[]{false,true}){
                shorts=player;top=topSignal;added=containers=0;
                if(player)CaptionQuickToggle.observeMenuPath("overflow_menu_item.e", "closed_caption".getBytes());
                boolean expected=player?shortSetting:regular&&topSignal;
                assertEquals(expected?4:3,CaptionQuickToggle.onMenu(new Object(),3));
                assertEquals(expected?1:0,added);assertEquals(expected?1:0,containers);
            }
        }
    }
    @Test public void hiddenShortsClearsEvidenceAndDoesNotLeakIntoNestedMenu(){
        shorts=true;top=false;
        CaptionQuickToggle.observeMenuPath("overflow_menu_item.e", "closed_caption".getBytes());
        AiCaptionConfig.saveShortsFlyoutMenuEnabled(a,false);assertEquals(0,CaptionQuickToggle.onMenu(new Object(),0));
        AiCaptionConfig.saveShortsFlyoutMenuEnabled(a,true);assertEquals(0,CaptionQuickToggle.onMenu(new Object(),0));assertEquals(0,added);
        CaptionQuickToggle.observeMenuPath("overflow_menu_item.e", "closed_caption".getBytes());
        assertEquals(1,CaptionQuickToggle.onMenu(new Object(),0));assertEquals(1,added);
    }

}
