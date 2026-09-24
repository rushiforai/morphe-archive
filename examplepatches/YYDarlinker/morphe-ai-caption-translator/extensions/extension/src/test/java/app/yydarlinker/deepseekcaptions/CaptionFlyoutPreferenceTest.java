package app.yydarlinker.deepseekcaptions;
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
    static int added,containers;static boolean shorts,top;
    Activity a;
    @Implements(CaptionAddonSupport.class) public static class Flags {
        @Implementation public static boolean aiInstalled(){return true;}
    }
    @Implements(CaptionQuickToggle.class) public static class Menu {
        @Implementation public static boolean topMenu(){return top;}
        @Implementation public static boolean shortsOpen(){return shorts;}
        @Implementation public static int addNativeRow(Object panel,Drawable icon,String text,View.OnClickListener click,int index){added++;return index+1;}
        @Implementation public static android.widget.LinearLayout nativeContainer(Object panel){containers++;return null;}
    }
    @Before public void setup(){a=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(a);added=containers=0;shorts=false;top=true;}
    @After public void finish(){a.finish();}
    @Test public void visibleByDefaultAndPreferencePersistsWithoutChangingEngineOrLanguage(){
        assertTrue(DeepSeekConfig.flyoutMenuEnabled(a));DeepSeekConfig.saveEnabled(a,true);CaptionChoice.select("fr",true);RememberedCaptionSelection.select("fr",true,false);
        CaptionFlyoutPreference p=new CaptionFlyoutPreference(a);assertTrue(p.isChecked());
        p.getOnPreferenceChangeListener().onPreferenceChange(p,false);
        assertFalse(p.isChecked());assertFalse(new CaptionFlyoutPreference(a).isChecked());
        assertTrue(DeepSeekConfig.enabled(a));assertEquals("fr",CaptionChoice.language());assertEquals("fr",RememberedCaptionSelection.language());
        p.getOnPreferenceChangeListener().onPreferenceChange(p,true);assertTrue(new CaptionFlyoutPreference(a).isChecked());
    }
    @Test public void hiddenEntryLeavesOfficialIndexAndContainerUntouched(){
        DeepSeekConfig.saveFlyoutMenuEnabled(a,false);DeepSeekConfig.saveShortsFlyoutMenuEnabled(a,false);
        for(int index:new int[]{0,3})for(boolean s:new boolean[]{false,true}){
            shorts=s;top=!s;CaptionQuickToggle.observeMenuPath("overflow_menu_item.e", "closed_caption".getBytes());
            assertEquals(index,CaptionQuickToggle.onMenu(new Object(),index));
        }
        assertEquals(0,added);assertEquals(0,containers);
    }
    @Test public void reenablingRestoresExistingRowAndNeverAddsToNestedMenus(){
        DeepSeekConfig.saveFlyoutMenuEnabled(a,false);assertEquals(3,CaptionQuickToggle.onMenu(new Object(),3));
        DeepSeekConfig.saveFlyoutMenuEnabled(a,true);assertEquals(4,CaptionQuickToggle.onMenu(new Object(),3));assertEquals(1,added);
        top=false;assertEquals(3,CaptionQuickToggle.onMenu(new Object(),3));assertEquals(1,added);
        shorts=true;CaptionQuickToggle.observeMenuPath("overflow_menu_item.e", "closed_caption".getBytes());
        assertEquals(4,CaptionQuickToggle.onMenu(new Object(),3));assertEquals(2,added);
    }
    @Test public void regularAndShortsSettingsAreIndependentForEveryCombination(){
        for(boolean regular:new boolean[]{false,true})for(boolean shortSetting:new boolean[]{false,true}){
            DeepSeekConfig.saveFlyoutMenuEnabled(a,regular);DeepSeekConfig.saveShortsFlyoutMenuEnabled(a,shortSetting);
            for(boolean player:new boolean[]{false,true})for(boolean topSignal:new boolean[]{false,true}){
                shorts=player;top=topSignal;added=containers=0;
                if(player)CaptionQuickToggle.observeMenuPath("overflow_menu_item.e", "closed_caption".getBytes());
                boolean expected=player?shortSetting:regular&&topSignal;
                assertEquals(expected?4:3,CaptionQuickToggle.onMenu(new Object(),3));
                assertEquals(expected?1:0,added);assertEquals(expected?1:0,containers);
            }
        }
    }
    @Test public void shortsPreferencePersistsIndependentlyEvenWithEngineDisabled(){
        DeepSeekConfig.saveEnabled(a,false);
        CaptionFlyoutPreference regular=new CaptionFlyoutPreference(a);
        CaptionShortsFlyoutPreference shortPref=new CaptionShortsFlyoutPreference(a);
        assertTrue(regular.isChecked());assertTrue(shortPref.isChecked());
        shortPref.getOnPreferenceChangeListener().onPreferenceChange(shortPref,false);
        assertFalse(new CaptionShortsFlyoutPreference(a).isChecked());assertTrue(new CaptionFlyoutPreference(a).isChecked());
        regular.getOnPreferenceChangeListener().onPreferenceChange(regular,false);
        shortPref.getOnPreferenceChangeListener().onPreferenceChange(shortPref,true);
        assertTrue(new CaptionShortsFlyoutPreference(a).isChecked());assertFalse(new CaptionFlyoutPreference(a).isChecked());
        assertFalse(DeepSeekConfig.enabled(a));
    }
    @Test public void hiddenShortsClearsEvidenceAndDoesNotLeakIntoNestedMenu(){
        shorts=true;top=false;
        CaptionQuickToggle.observeMenuPath("overflow_menu_item.e", "closed_caption".getBytes());
        DeepSeekConfig.saveShortsFlyoutMenuEnabled(a,false);assertEquals(0,CaptionQuickToggle.onMenu(new Object(),0));
        DeepSeekConfig.saveShortsFlyoutMenuEnabled(a,true);assertEquals(0,CaptionQuickToggle.onMenu(new Object(),0));assertEquals(0,added);
        CaptionQuickToggle.observeMenuPath("overflow_menu_item.e", "closed_caption".getBytes());
        assertEquals(1,CaptionQuickToggle.onMenu(new Object(),0));assertEquals(1,added);
    }

}
