package app.yydarlinker.deepseekcaptions;

import android.app.*;
import android.content.res.Configuration;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import org.robolectric.shadows.ShadowDialog;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=28)
public class InlineProfileManagementTest {
    Activity a;String b,c;
    @Before public void setup(){
        a=Robolectric.buildActivity(Activity.class).setup().visible().get();
        ApiProfiles.rename(a,"default","DeepSeek");
        b=ApiProfiles.create(a,"Bailian","https://b.example");
        c=ApiProfiles.create(a,"Backup","https://c.example");
    }
    @After public void done(){a.finish();}
    private void idle(){Shadows.shadowOf(Looper.getMainLooper()).idle();}
    private String text(String key){return CaptionStrings.settings(a,key);}
    private Dialog dialog(){return ShadowDialog.getLatestDialog();}
    private View tree(){return dialog().getWindow().getDecorView();}
    private Dialog open(){new ApiProfilesPreference(a).showProfiles();idle();return dialog();}
    private View tagged(String tag){return tree().findViewWithTag(tag);}
    private View panel(String id){return tagged("profile_panel:"+id);}
    private void more(String id){View v=tagged("profile_more:"+id);assertNotNull(v);v.performClick();idle();}
    private TextView label(View root,String value){
        if(root instanceof TextView && value.contentEquals(((TextView)root).getText()))return (TextView)root;
        if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){
            TextView found=label(((ViewGroup)root).getChildAt(i),value);if(found!=null)return found;
        }return null;
    }
    private EditText input(View root){
        if(root instanceof EditText)return (EditText)root;
        if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){
            EditText result=input(((ViewGroup)root).getChildAt(i));if(result!=null)return result;
        }return null;
    }
    private void action(String id,String key){TextView v=label(panel(id),text(key));assertNotNull(key,v);v.performClick();idle();}

    @Test public void moreAndLongPressExpandInSameDialogWithoutSelecting(){
        Dialog d=open();more(b);
        assertSame(d,dialog());assertTrue(d.isShowing());assertEquals(View.VISIBLE,panel(b).getVisibility());
        assertEquals("default",ApiProfiles.active(a));assertNotNull(label(panel(b),text("profile_rename")));
        assertTrue(label(tree(),"    Backup").performLongClick());idle();
        assertSame(d,dialog());assertEquals(View.GONE,panel(b).getVisibility());assertEquals(View.VISIBLE,panel(c).getVisibility());
        assertEquals("default",ApiProfiles.active(a));more(c);assertEquals(View.GONE,panel(c).getVisibility());
    }
    @Test public void onlyOnePanelIsOpenAndAllRowsRemainSameObjects(){
        open();View original=tagged("profile_row:default"),row=tagged("profile_row:"+b);more(b);more(c);
        assertSame(original,tagged("profile_row:default"));assertSame(row,tagged("profile_row:"+b));
        assertEquals(View.GONE,panel(b).getVisibility());assertEquals(View.VISIBLE,panel(c).getVisibility());
    }
    @Test public void renameSavesInlineKeepsDialogAndDoesNotChangeEngineProfileOrPrompt(){
        DeepSeekConfig.saveEnabled(a,true);DeepSeekConfig.savePrompt(a,"keep this");
        Dialog d=open();more(b);action(b,"profile_rename");assertSame(d,dialog());
        EditText edit=input(panel(b));assertNotNull(edit);assertEquals("Bailian",edit.getText().toString());
        edit.setText("Bailian travel");action(b,"profile_save");
        assertSame(d,dialog());assertTrue(d.isShowing());assertEquals("Bailian travel",ApiProfiles.list(a).get(b));
        assertNotNull(label(tree(),"    Bailian travel"));assertEquals(View.GONE,panel(b).getVisibility());
        assertEquals("default",ApiProfiles.active(a));assertEquals("keep this",DeepSeekConfig.load(a).prompt);assertTrue(DeepSeekConfig.enabled(a));
    }
    @Test public void renameCancelRestoresActionsWithoutWritingDraft(){
        Dialog d=open();more(b);action(b,"profile_rename");input(panel(b)).setText("discarded");action(b,"cancel");
        assertNull(input(panel(b)));assertNotNull(label(panel(b),text("profile_rename")));
        assertEquals("Bailian",ApiProfiles.list(a).get(b));assertSame(d,dialog());assertEquals(View.VISIBLE,panel(b).getVisibility());
    }
    @Test public void dirtyNameBlocksCollapseOtherRowSelectionAndAdd(){
        Dialog d=open();more(b);action(b,"profile_rename");EditText edit=input(panel(b));edit.setText("unfinished");
        more(c);assertSame(edit,input(panel(b)));assertEquals(View.GONE,panel(c).getVisibility());assertNotNull(edit.getError());
        more(b);assertSame(edit,input(panel(b)));
        label(tree(),"    Backup").performClick();idle();assertEquals("default",ApiProfiles.active(a));assertTrue(d.isShowing());
        label(tree(),text("profile_add")).performClick();idle();assertSame(d,dialog());assertEquals(3,ApiProfiles.list(a).size());
    }
    @Test public void blankRenameStaysInlineAndImeDoneSavesValidName(){
        Dialog d=open();more(b);action(b,"profile_rename");EditText edit=input(panel(b));edit.setText("  ");action(b,"profile_save");
        assertNotNull(edit.getError());assertSame(edit,input(panel(b)));assertEquals("Bailian",ApiProfiles.list(a).get(b));
        edit.setText("New name");edit.onEditorAction(android.view.inputmethod.EditorInfo.IME_ACTION_DONE);idle();
        assertEquals("New name",ApiProfiles.list(a).get(b));assertSame(d,dialog());assertTrue(d.isShowing());
    }
    @Test public void confirmedInactiveDeleteOnlyRemovesItsRowAndNeverClosesList(){
        a.getSharedPreferences("deepseek_caption_secret",0).edit().putString("api_key_ciphertext","A")
            .putString("api_key_ciphertext_"+b,"B").putString("api_key_ciphertext_"+c,"C").apply();
        Dialog d=open();View unchanged=tagged("profile_row:"+c);more(b);action(b,"profile_delete");assertSame(d,dialog());
        assertTrue(ApiProfiles.list(a).containsKey(b));assertNotNull(label(panel(b),text("profile_keep")));
        action(b,"profile_confirm_delete");assertSame(d,dialog());assertTrue(d.isShowing());assertNull(tagged("profile_row:"+b));
        assertSame(unchanged,tagged("profile_row:"+c));assertEquals("default",ApiProfiles.active(a));
        assertFalse(a.getSharedPreferences("deepseek_caption_secret",0).contains("api_key_ciphertext_"+b));
        assertEquals("A",a.getSharedPreferences("deepseek_caption_secret",0).getString("api_key_ciphertext",""));
        assertEquals("C",a.getSharedPreferences("deepseek_caption_secret",0).getString("api_key_ciphertext_"+c,""));
    }
    @Test public void activeDeleteExplainsExactReplacementAndUpdatesCurrentMarker(){
        LinkedHashMap<String,String> remaining=ApiProfiles.list(a);remaining.remove("default");
        String next=remaining.keySet().iterator().next(),name=remaining.get(next);
        Dialog d=open();more("default");action("default","profile_delete");
        assertNotNull(label(panel("default"),text("profile_delete_switch")+" "+name));
        action("default","profile_confirm_delete");assertEquals(next,ApiProfiles.active(a));assertSame(d,dialog());
        assertNotNull(label(tree(),"✓  "+name));assertTrue(d.isShowing());
    }
    @Test public void keepProfileReturnsToActionsAndRetainsSecrets(){
        Dialog d=open();more(b);action(b,"profile_delete");action(b,"profile_keep");
        assertTrue(ApiProfiles.list(a).containsKey(b));assertNotNull(label(panel(b),text("profile_rename")));assertSame(d,dialog());
    }
    @Test public void changedReplacementRequiresFreshConfirmation(){
        open();more("default");action("default","profile_delete");ApiProfiles.select(a,b);
        action("default","profile_confirm_delete");assertTrue(ApiProfiles.list(a).containsKey("default"));
        action("default","profile_confirm_delete");assertFalse(ApiProfiles.list(a).containsKey("default"));assertEquals(b,ApiProfiles.active(a));
    }
    @Test public void deletingUntilLastProfileRemovesDeleteAction(){
        open();more(b);action(b,"profile_delete");action(b,"profile_confirm_delete");
        more(c);action(c,"profile_delete");action(c,"profile_confirm_delete");more("default");
        assertNull(label(panel("default"),text("profile_delete")));assertNotNull(label(panel("default"),text("profile_keep_one")));
    }
    @Test public void staleSaveButtonCannotMutateAfterDialogDismissal(){
        Dialog d=open();more(b);action(b,"profile_rename");input(panel(b)).setText("stale");
        TextView save=label(panel(b),text("profile_save"));d.dismiss();idle();save.performClick();idle();
        assertEquals("Bailian",ApiProfiles.list(a).get(b));
    }
    @Test public void backCollapsesActionsFirstAndDirtyBackDoesNotDiscard(){
        Dialog d=open();more(b);d.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN,KeyEvent.KEYCODE_BACK));
        d.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_UP,KeyEvent.KEYCODE_BACK));idle();
        assertTrue(d.isShowing());assertEquals(View.GONE,panel(b).getVisibility());
        more(b);action(b,"profile_rename");EditText edit=input(panel(b));edit.setText("draft");
        d.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN,KeyEvent.KEYCODE_BACK));d.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_UP,KeyEvent.KEYCODE_BACK));idle();
        assertSame(edit,input(panel(b)));assertEquals("draft",edit.getText().toString());assertTrue(d.isShowing());
    }
    @Test public void explicitFooterCancelDiscardsDraftWithoutSaving(){
        Dialog d=open();more(b);action(b,"profile_rename");input(panel(b)).setText("draft");
        ((AlertDialog)d).getButton(AlertDialog.BUTTON_POSITIVE).performClick();idle();
        assertFalse(d.isShowing());assertEquals("Bailian",ApiProfiles.list(a).get(b));
    }
    @Test public void actionStripUsesEqualButtonsAtWideWidthAndStacksAtNarrowWidth(){
        ProfileActionStrip strip=new ProfileActionStrip(a);Button rename=strip.add(text("profile_rename"),false,1,()->{});
        Button delete=strip.add(text("profile_delete"),true,2,()->{});
        measure(strip,500);assertEquals(LinearLayout.HORIZONTAL,strip.getOrientation());
        assertEquals(rename.getMeasuredWidth(),delete.getMeasuredWidth());assertTrue(delete.getLeft()>=rename.getRight());
        assertNotNull(rename.getCompoundDrawablesRelative()[0]);assertNotNull(delete.getCompoundDrawablesRelative()[0]);
        measure(strip,120);assertEquals(LinearLayout.VERTICAL,strip.getOrientation());
        assertTrue(delete.getTop()>=rename.getBottom());assertTrue(delete.getRight()<=strip.getWidth());
        assertTrue(rename.getHeight()>=CaptionSettingsStyle.dp(a,48));assertTrue(delete.getHeight()>=CaptionSettingsStyle.dp(a,48));
    }
    private void measure(View v,int width){
        int px=CaptionSettingsStyle.dp(a,width);
        v.measure(View.MeasureSpec.makeMeasureSpec(px,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
        v.layout(0,0,px,v.getMeasuredHeight());
    }
    @Test public void largeFontAndRtlKeepActionsInsideTheirContainer(){
        Configuration config=new Configuration(a.getResources().getConfiguration());config.fontScale=1.6f;config.setLocales(new LocaleList(Locale.forLanguageTag("ar")));
        a.getResources().updateConfiguration(config,a.getResources().getDisplayMetrics());
        ProfileActionStrip strip=new ProfileActionStrip(a);strip.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
        strip.add(text("profile_rename"),false,1,()->{});strip.add(text("profile_delete"),true,2,()->{});
        measure(strip,224);
        for(int i=0;i<strip.getChildCount();i++){
            View child=strip.getChildAt(i);assertTrue(child.getLeft()>=0);assertTrue(child.getRight()<=strip.getWidth());
            assertTrue(child.getHeight()>=CaptionSettingsStyle.dp(a,48));
        }
    }
    @Test public void moreButtonHasSeparateAccessibleTouchTarget(){
        open();View more=tagged("profile_more:"+b);measure(tagged("profile_row:"+b),300);
        assertTrue(more.getWidth()>=CaptionSettingsStyle.dp(a,48));assertTrue(more.getHeight()>=CaptionSettingsStyle.dp(a,48));
        assertEquals(text("profile_more")+": Bailian",more.getContentDescription().toString());
        more(b);assertEquals(text("profile_collapse")+": Bailian",more.getContentDescription().toString());
        assertEquals("default",ApiProfiles.active(a));
    }
}
