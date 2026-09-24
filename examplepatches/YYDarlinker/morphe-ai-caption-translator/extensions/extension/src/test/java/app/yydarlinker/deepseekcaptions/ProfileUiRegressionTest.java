package app.yydarlinker.deepseekcaptions;

import android.app.*;
import android.content.*;
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
public class ProfileUiRegressionTest {
    Activity a;
    @Before public void setup(){a=Robolectric.buildActivity(Activity.class).setup().visible().get();}
    @After public void done(){a.finish();}
    private void idle(){Shadows.shadowOf(Looper.getMainLooper()).idle();}
    private String text(String key){return CaptionStrings.settings(a,key);}
    private View tree(){return ShadowDialog.getLatestDialog().getWindow().getDecorView();}
    private <T extends View> T first(View v,Class<T> type){
        if(type.isInstance(v))return type.cast(v);
        if(v instanceof ViewGroup)for(int i=0;i<((ViewGroup)v).getChildCount();i++){
            T r=first(((ViewGroup)v).getChildAt(i),type);if(r!=null)return r;
        }return null;
    }
    private TextView label(View v,String text){
        if(v instanceof TextView && text.contentEquals(((TextView)v).getText()))return (TextView)v;
        if(v instanceof ViewGroup)for(int i=0;i<((ViewGroup)v).getChildCount();i++){
            TextView r=label(((ViewGroup)v).getChildAt(i),text);if(r!=null)return r;
        }return null;
    }
    private void manage(){TextView row=label(tree(),"✓  "+ApiProfiles.list(a).get(ApiProfiles.active(a)));assertNotNull(row);assertTrue(row.performLongClick());idle();}
    private void click(String key){TextView row=label(tree(),text(key));assertNotNull(key,row);row.performClick();idle();}
    private ApiProfilesPreference open(){ApiProfilesPreference p=new ApiProfilesPreference(a);p.showProfiles();idle();return p;}

    @Test public void mainPageHasOnlyNativeTitleAndCurrentNameNoEditorOrSpinner(){
        ApiProfilesPreference p=new ApiProfilesPreference(a);View row=p.getView(null,new LinearLayout(a));
        assertNull(first(row,EditText.class));assertNull(first(row,Spinner.class));
        assertEquals(ApiProfiles.list(a).get(ApiProfiles.active(a)),p.getSummary());
        int w=CaptionSettingsStyle.dp(a,320);row.measure(View.MeasureSpec.makeMeasureSpec(w,View.MeasureSpec.EXACTLY),0);
        android.preference.Preference reference=new android.preference.Preference(a);
        reference.setTitle(p.getTitle());reference.setSummary(p.getSummary());View nativeRow=reference.getView(null,new LinearLayout(a));
        nativeRow.measure(View.MeasureSpec.makeMeasureSpec(w,View.MeasureSpec.EXACTLY),0);
        assertTrue(row.getMeasuredHeight()<=nativeRow.getMeasuredHeight());
    }
    @Test public void actualDialogCanAddRenameSelectAndDelete(){
        open();click("profile_add");EditText name=first(tree(),EditText.class);assertNotNull(name);
        assertFalse(name.getText().toString().isEmpty());assertEquals(1,ApiProfiles.list(a).size());
        name.setText("Bailian 北京");click("profile_save");String b=ApiProfiles.active(a);assertNotEquals("default",b);
        assertEquals("Bailian 北京",ApiProfiles.list(a).get(b));assertFalse(DeepSeekConfig.load(a).prompt.isEmpty());
        open();manage();click("profile_rename");first(tree(),EditText.class).setText("旅行字幕");click("profile_save");
        assertEquals("旅行字幕",ApiProfiles.list(a).get(b));
        open();label(tree(),"    "+ApiProfiles.list(a).get("default")).performClick();idle();assertEquals("default",ApiProfiles.active(a));
        open();label(tree(),"    旅行字幕").performClick();idle();assertEquals(b,ApiProfiles.active(a));
        open();manage();click("profile_delete");click("profile_confirm_delete");
        assertFalse(ApiProfiles.list(a).containsKey(b));assertEquals("default",ApiProfiles.active(a));
    }
    @Test public void cancelledDeleteRetainsEverythingAndLastProfileCannotBeDeleted(){
        String b=ApiProfiles.create(a,"B","https://b.example");ApiProfiles.select(a,b);
        open();manage();click("profile_delete");click("profile_keep");assertTrue(ApiProfiles.list(a).containsKey(b));
        ApiProfiles.delete(a,b);open();manage();assertNull(label(tree(),text("profile_delete")));
        try{ApiProfiles.delete(a,"default");fail();}catch(IllegalStateException expected){}
    }
    @Test public void confirmedDeleteDiscardsInvalidPendingEditsInsteadOfTrappingTheUser(){
        String b=ApiProfiles.create(a,"B","https://b.example");ApiProfiles.select(a,b);
        DeepSeekTextPreference p=new DeepSeekTextPreference(a);p.setKey(DeepSeekTextPreference.KEY_BASE_URL);
        EditText input=p.getView(null,new LinearLayout(a)).findViewById(android.R.id.edit);input.setText("unfinished address");
        open();manage();click("profile_delete");click("profile_confirm_delete");
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(2));
        assertEquals("default",ApiProfiles.active(a));assertFalse(ApiProfiles.list(a).containsKey(b));assertTrue(ApiProfiles.values(a,b).getAll().isEmpty());
    }
    @Test public void keyConfirmationTargetsCapturedProfileNotLaterSelection(){
        String b=ApiProfiles.create(a,"B","https://b.example");
        a.getSharedPreferences("deepseek_caption_secret",0).edit().putString("api_key_ciphertext","A").putString("api_key_ciphertext_"+b,"B").apply();
        new ApiProfilesPreference(a).clearCurrentKey();idle();
        ApiProfiles.select(a,b);click("profile_clear_key");
        assertEquals("B",a.getSharedPreferences("deepseek_caption_secret",0).getString("api_key_ciphertext_"+b,""));
        assertFalse(a.getSharedPreferences("deepseek_caption_secret",0).contains("api_key_ciphertext"));assertEquals(b,ApiProfiles.active(a));
    }
    @Test public void deletingLegacyPreservesGlobalPreferencesAndCannotResurrectOnRelaunch(){
        DeepSeekConfig.saveEnabled(a,true);DeepSeekConfig.saveCaptionTextSize(a,20);DeepSeekConfig.saveFlyoutMenuEnabled(a,false);
        DeepSeekConfig.savePrompt(a,"old custom");DeepSeekConfig.saveBaseUrl(a,"https://old.example");
        String b=ApiProfiles.create(a,"B","https://b.example");
        a.getSharedPreferences("deepseek_caption_secret",0).edit().putString("api_key_ciphertext","A").putString("api_key_ciphertext_"+b,"B").apply();
        ApiProfiles.delete(a,"default");
        assertEquals(b,ApiProfiles.active(a));assertTrue(DeepSeekConfig.enabled(a));assertEquals(20,DeepSeekConfig.load(a).captionTextSize);
        assertFalse(DeepSeekConfig.flyoutMenuEnabled(a));assertFalse(ApiProfiles.values(a,"default").contains("prompt"));
        assertFalse(ApiProfiles.list(a.getApplicationContext()).containsKey("default"));assertTrue(SecureApiKey.hasSavedValue(a));
    }
    @Test public void newProfilePromptIsEditableAndStoredSeparately(){
        String b=ApiProfiles.create(a,"B","https://b.example");ApiProfiles.select(a,b);
        DeepSeekTextPreference p=new DeepSeekTextPreference(a);p.setKey(DeepSeekTextPreference.KEY_PROMPT);
        EditText editor=p.getView(null,new LinearLayout(a)).findViewById(android.R.id.edit);
        assertEquals(DeepSeekConfig.defaultPrompt(a),editor.getText().toString());assertTrue(editor.isEnabled());assertTrue(editor.isFocusableInTouchMode());
        editor.setText("Keep technical names unchanged.");assertTrue(p.flushProfile());
        assertEquals("Keep technical names unchanged.",ApiProfiles.values(a,b).getString("prompt",""));
        ApiProfiles.select(a,"default");assertEquals(DeepSeekConfig.defaultPrompt(a),DeepSeekConfig.load(a).prompt);
    }
    @Test public void scrollRecreationCommitsUnsavedPromptAndNeverReusesAnotherPreferenceInstance(){
        DeepSeekTextPreference p=new DeepSeekTextPreference(a);p.setKey(DeepSeekTextPreference.KEY_PROMPT);
        View old=p.getView(null,new LinearLayout(a));((EditText)old.findViewById(android.R.id.edit)).setText("pending");
        View fresh=p.getView(null,new LinearLayout(a));assertEquals("pending",((EditText)fresh.findViewById(android.R.id.edit)).getText().toString());
        DeepSeekTextPreference other=new DeepSeekTextPreference(a);other.setKey(DeepSeekTextPreference.KEY_PROMPT);
        assertNotSame(fresh,other.getView(fresh,new LinearLayout(a)));
    }
    @Test public void defaultsFollowAllSupportedLocalesButCustomPromptsRemainVerbatim(){
        String b=ApiProfiles.create(a,"B","https://b.example");ApiProfiles.select(a,b);
        String[] locales={"en","zh-CN","zh-TW","es","fr","de","pt","ru","ja","ko","ar","hi","id","vi"};
        Set<String> defaults=new HashSet<>();
        for(String lang:locales){
            Configuration config=new Configuration(a.getResources().getConfiguration());config.setLocales(new LocaleList(Locale.forLanguageTag(lang)));
            Context c=a.createConfigurationContext(config);String expected=CaptionStrings.settings(c,"default_prompt");
            assertEquals(expected,DeepSeekConfig.load(c).prompt);defaults.add(expected);
        }
        assertEquals(14,defaults.size());assertFalse(ApiProfiles.values(a).contains("prompt"));
        DeepSeekConfig.savePrompt(a,"用户明确写下的要求 — Keep this exact text.");
        Configuration config=new Configuration(a.getResources().getConfiguration());config.setLocales(new LocaleList(Locale.JAPAN));
        assertEquals("用户明确写下的要求 — Keep this exact text.",DeepSeekConfig.load(a.createConfigurationContext(config)).prompt);
        DeepSeekConfig.savePrompt(a,"");assertFalse(ApiProfiles.values(a).contains("prompt"));
    }
    @Test public void oldHardcodedDefaultIsLocalizedWithoutRewritingCustomData(){
        ApiProfiles.values(a).edit().putString("prompt",DeepSeekConfig.DEFAULT_PROMPT).apply();
        assertEquals(DeepSeekConfig.defaultPrompt(a),DeepSeekConfig.load(a).prompt);
        DeepSeekConfig.savePrompt(a,DeepSeekConfig.defaultPrompt(a));assertFalse(ApiProfiles.values(a).contains("prompt"));
    }

    @Test public void staleDetachedEditorRebindsAfterProfileEpochEvenWhenNotRegistered(){
        DeepSeekTextPreference p=new DeepSeekTextPreference(a);p.setKey(DeepSeekTextPreference.KEY_PROMPT);
        LinearLayout parent=new LinearLayout(a);View old=p.getView(null,parent);
        ApiProfiles.unregister(p); // Scrolled off the screen: it no longer receives notifications.
        String b=ApiProfiles.create(a,"B","https://b.example");ApiProfiles.select(a,b);ApiProfiles.select(a,"default");
        ((EditText)old.findViewById(android.R.id.edit)).setText("stale delayed edit");assertTrue(p.flushProfile());
        assertEquals(DeepSeekConfig.defaultPrompt(a),DeepSeekConfig.load(a).prompt);
        View fresh=p.getView(old,parent);assertNotSame(old,fresh);
        assertEquals(DeepSeekConfig.defaultPrompt(a),((EditText)fresh.findViewById(android.R.id.edit)).getText().toString());
    }
    @Test public void staleFinishedActivityCannotBlockCurrentProfileSwitch(){
        Activity old=Robolectric.buildActivity(Activity.class).setup().get();
        DeepSeekTextPreference p=new DeepSeekTextPreference(old);p.setKey(DeepSeekTextPreference.KEY_BASE_URL);
        ((EditText)p.getView(null,new LinearLayout(old)).findViewById(android.R.id.edit)).setText("unfinished");old.finish();
        String b=ApiProfiles.create(a,"B","https://b.example");assertTrue(ApiProfiles.select(a,b));
    }
    @Test public void promptPasteIsNotInterceptedByMorpheBreadcrumbCopy(){
        assertTrue(ApiInputPolicy.owns(DeepSeekTextPreference.KEY_PROMPT));assertFalse(ApiInputPolicy.owns("morphe_debug"));
    }
    @Test public void inactiveDeleteLeavesCurrentEditorAndSettingsIntact(){
        String b=ApiProfiles.create(a,"B","https://b.example");
        DeepSeekTextPreference p=new DeepSeekTextPreference(a);p.setKey(DeepSeekTextPreference.KEY_PROMPT);
        EditText input=p.getView(null,new LinearLayout(a)).findViewById(android.R.id.edit);input.setText("editing current");
        ApiProfiles.delete(a,b);assertEquals("editing current",input.getText().toString());assertTrue(p.flushProfile());
        assertEquals("editing current",DeepSeekConfig.load(a).prompt);
    }

    @Test public void visibleDefaultRebindsAfterLanguageChangeWithoutPersistingOldTranslation(){
        DeepSeekTextPreference p=new DeepSeekTextPreference(a);p.setKey(DeepSeekTextPreference.KEY_PROMPT);
        LinearLayout parent=new LinearLayout(a);View old=p.getView(null,parent);
        Configuration config=new Configuration(a.getResources().getConfiguration());config.setLocales(new LocaleList(Locale.JAPAN));
        a.getResources().updateConfiguration(config,a.getResources().getDisplayMetrics());
        View fresh=p.getView(old,parent);assertNotSame(old,fresh);
        assertEquals(DeepSeekConfig.defaultPrompt(a),((EditText)fresh.findViewById(android.R.id.edit)).getText().toString());
        assertFalse(ApiProfiles.values(a).contains("prompt"));
    }

    @Test public void selectorHasOnlyProfilesAddAndCancelAndLongPressDoesNotSwitch(){
        String b=ApiProfiles.create(a,"B","https://b.example");open();
        assertNull(label(tree(),text("profile_manage")));assertNull(label(tree(),text("profile_close")));
        assertNotNull(label(tree(),text("cancel")));assertNotNull(label(tree(),text("profile_add")));
        assertTrue(label(tree(),"    B").performLongClick());idle();assertEquals("default",ApiProfiles.active(a));
        click("profile_rename");first(tree(),EditText.class).setText("renamed B");click("profile_save");
        assertEquals("renamed B",ApiProfiles.list(a).get(b));assertEquals("default",ApiProfiles.active(a));
    }
    @Test public void newProfileCanSaveDefaultOrEmptyNameAndAvoidsExistingNames(){
        ApiProfiles.rename(a,"default","API 1");open();click("profile_add");
        assertEquals("API 2",first(tree(),EditText.class).getText().toString());click("profile_save");
        assertEquals("API 2",ApiProfiles.list(a).get(ApiProfiles.active(a)));
        open();click("profile_add");first(tree(),EditText.class).setText("");click("profile_save");
        assertEquals("API 3",ApiProfiles.list(a).get(ApiProfiles.active(a)));
    }
    @Test public void resolvedChineseSummaryIsNotTranslatedTwice(){
        Configuration config=new Configuration(a.getResources().getConfiguration());config.setLocales(new LocaleList(Locale.SIMPLIFIED_CHINESE));
        a.getResources().updateConfiguration(config,a.getResources().getDisplayMetrics());
        DeepSeekTextPreference p=new DeepSeekTextPreference(a);p.setKey(DeepSeekTextPreference.KEY_PROMPT);
        String summary=CaptionStrings.settings(a,"prompt_summary");p.setSummary(summary);
        LinearLayout root=(LinearLayout)p.getView(null,new LinearLayout(a));
        assertEquals(summary,((TextView)root.getChildAt(2)).getText().toString());
    }
    @Test public void keyboardRelayoutPreservesFocusedEditorEvenWithoutConvertView(){
        LinearLayout parent=new LinearLayout(a);DeepSeekTextPreference p=new DeepSeekTextPreference(a);p.setKey(DeepSeekTextPreference.KEY_PROMPT);
        View row=p.getView(null,parent);parent.addView(row);a.setContentView(parent);
        EditText editor=row.findViewById(android.R.id.edit);editor.requestFocus();editor.setSelection(3);idle();
        View rebound=p.getView(null,parent);assertSame(row,rebound);assertSame(editor,rebound.findViewById(android.R.id.edit));
        assertTrue(editor.hasFocus());assertEquals(3,editor.getSelectionStart());
        DeepSeekModelPreference model=new DeepSeekModelPreference(a);model.setKey(DeepSeekModelPreference.KEY_MODEL);
        View modelRow=model.getView(null,parent);assertSame(modelRow,model.getView(null,parent));
    }
}
