package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.app.*;
import android.content.*;
import android.content.res.Configuration;
import android.graphics.*;
import android.os.Looper;
import android.view.*;
import android.widget.*;
import android.preference.*;
import java.lang.reflect.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import org.robolectric.shadows.ShadowDialog;
import app.morphe.extension.shared.settings.*;

/** Addon locale overrides a Chinese host across every secondary menu, with actual Android widgets. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=35,qualifiers="w320dp-h800dp-mdpi") @GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class SecondaryMenusLocalizationTest {
    public static class Settings extends PreferenceActivity {}
    Settings activity;int checkedMenus;
    @Before public void start(){activity=Robolectric.buildActivity(Settings.class).setup().visible().get();activity.getApplicationInfo().flags|=android.content.pm.ApplicationInfo.FLAG_SUPPORTS_RTL;Configuration config=new Configuration(activity.getResources().getConfiguration());config.setLocale(Locale.SIMPLIFIED_CHINESE);config.fontScale=1.3f;activity.getResources().updateConfiguration(config,activity.getResources().getDisplayMetrics());}
    @After public void finish()throws Exception{Dialog dialog=ShadowDialog.getLatestDialog();if(dialog!=null)dialog.dismiss();BaseSettings.MORPHE_LANGUAGE.save(AppLanguage.DEFAULT);activity.finish();}
    void choose(AppLanguage language){BaseSettings.MORPHE_LANGUAGE.save(language);Shadows.shadowOf(Looper.getMainLooper()).idle();}
    String text(String key){return CaptionStrings.get(activity,key);}
    static TextView label(View root,String value){if(root instanceof TextView&&value.contentEquals(((TextView)root).getText()))return (TextView)root;if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){TextView found=label(((ViewGroup)root).getChildAt(i),value);if(found!=null)return found;}return null;}
    static <T extends View> T first(View root,Class<T> kind){if(kind.isInstance(root))return kind.cast(root);if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){T found=first(((ViewGroup)root).getChildAt(i),kind);if(found!=null)return found;}return null;}
    View current(){return ShadowDialog.getLatestDialog().getWindow().getDecorView();}
    void click(String key){TextView value=label(current(),text(key));assertNotNull(key,value);value.performClick();Shadows.shadowOf(Looper.getMainLooper()).idle();}
    void required(String menu,String...keys)throws Exception{
        View root=current();for(String key:keys){TextView value=label(root,text(key));assertNotNull(menu+" "+key+" "+CaptionTextResolver.locale(activity),value);
            if(value instanceof Button){value.measure(View.MeasureSpec.makeMeasureSpec(280,View.MeasureSpec.AT_MOST),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));value.layout(0,0,value.getMeasuredWidth(),value.getMeasuredHeight());assertNotNull(value.getLayout());assertEquals(key,value.length(),value.getLayout().getLineEnd(value.getLayout().getLineCount()-1));for(int i=0;i<value.getLineCount();i++)assertEquals(key,0,value.getLayout().getEllipsisCount(i));}
        }
        checkedMenus++;
    }
    @Test public void allFourteenLanguagesCoverConfirmProfilesRenameDeleteAddClearKey()throws Exception{
        for(AppLanguage language:AppLanguage.values())if(language!=AppLanguage.DEFAULT){choose(language);int[] confirmations={0};
            for(String kind:new String[]{"clear_diagnostics","profile_clear_key"}){
                Dialog dialog=CaptionSettingsDialogs.confirm(activity,text(kind),text(kind.equals("clear_diagnostics")?"clear_diagnostics_confirm":"profile_clear_key_summary"),text(kind),()->confirmations[0]++);required(kind,"cancel",kind);
                click("cancel");assertFalse(dialog.isShowing());assertEquals(0,confirmations[0]);
            }
            Dialog approved=CaptionSettingsDialogs.confirm(activity,text("clear_diagnostics"),text("clear_diagnostics_confirm"),text("clear_diagnostics"),()->confirmations[0]++);
            current().findViewWithTag("caption_dialog_confirm").performClick();assertEquals(1,confirmations[0]);assertFalse(approved.isShowing());
            ApiProfiles.rename(activity,"default","Primary");String extra=ApiProfiles.create(activity,"Secondary "+language,"https://example.invalid/v1");
            ApiProfilesPreference profiles=new ApiProfilesPreference(activity);profiles.showProfiles();required("profile-selector","profile_add","cancel");
            TextView primary=label(current(),"✓  Primary");assertNotNull(primary);primary.performLongClick();required("profile-actions","profile_rename","profile_delete");
            click("profile_rename");required("rename","cancel","profile_save");click("cancel");
            click("profile_delete");required("profile-delete","profile_keep","profile_confirm_delete");click("profile_keep");ShadowDialog.getLatestDialog().dismiss();
            profiles.showProfiles();click("profile_add");required("add-profile","profile_new_summary","cancel","profile_save");click("cancel");
            profiles.clearCurrentKey();required("clear-key","profile_clear_key_summary","cancel","profile_clear_key");click("cancel");ApiProfiles.delete(activity,extra);
        }assertEquals(112,checkedMenus);
    }
    @Test public void modelMenusAndEditorActionsUseAddonLanguageAndKeepModelIdsVerbatim()throws Exception{
        for(AppLanguage language:AppLanguage.values())if(language!=AppLanguage.DEFAULT){choose(language);LinearLayout root=new LinearLayout(activity);((FrameLayout)activity.findViewById(android.R.id.content)).addView(root,new FrameLayout.LayoutParams(-1,100));
            InlineCaptionEditor editor=new InlineCaptionEditor(activity);editor.setText("example-data");root.addView(editor,new LinearLayout.LayoutParams(-1,60));root.measure(1073742144,1073742624);root.layout(0,0,320,800);editor.requestFocus();assertTrue(editor.performLongClick());Field f=InlineCaptionEditor.class.getDeclaredField("actions");f.setAccessible(true);ActionMode mode=(ActionMode)f.get(editor);assertNotNull(mode);
            for(int id:new int[]{android.R.id.paste,android.R.id.selectAll,android.R.id.copy})assertEquals(text(id==android.R.id.paste?"paste":id==android.R.id.selectAll?"select_all":"copy"),mode.getMenu().findItem(id).getTitle());mode.finish();
            TextView model=DeepSeekModelPreference.modelMenuRow(activity,"provider-model-42",true,false,null,root);assertEquals("✓  provider-model-42",model.getText().toString());assertTrue(model.getContentDescription().toString().endsWith(text("selected_suffix")));
            TextView heading=DeepSeekModelPreference.modelMenuRow(activity,text("model"),false,true,null,root);assertEquals("    "+text("model"),heading.getText().toString());
            DeepSeekModelPreference preference=new DeepSeekModelPreference(activity);preference.setKey(DeepSeekModelPreference.KEY_MODEL);root.addView(preference.getView(null,root));
            Method showModels=DeepSeekModelPreference.class.getDeclaredMethod("showModels",List.class,boolean.class);showModels.setAccessible(true);showModels.invoke(preference,Arrays.asList("provider-model-42","provider-model-43"),false);
            root.measure(1073742144,View.MeasureSpec.makeMeasureSpec(500,View.MeasureSpec.AT_MOST));root.layout(0,0,320,root.getMeasuredHeight());
            Method showMenu=DeepSeekModelPreference.class.getDeclaredMethod("showModelMenu");showMenu.setAccessible(true);showMenu.invoke(preference);Field menu=DeepSeekModelPreference.class.getDeclaredField("modelMenu");menu.setAccessible(true);PopupWindow popup=(PopupWindow)menu.get(preference);assertNotNull(language+" popup",popup);assertTrue(popup.isShowing());
            assertNotNull(label(popup.getContentView(),"    "+text("model")+" (2)"));assertNotNull(label(popup.getContentView(),"    provider-model-42"));popup.dismiss();
            Method copyPages=DeepSeekDiagnosticsPreference.class.getDeclaredMethod("copyPages",Context.class,String.class);copyPages.setAccessible(true);copyPages.invoke(null,activity,"offline diagnostic record");Dialog chunks=ShadowDialog.getLatestDialog();required("diagnostic-copy-parts","cancel");assertNotNull(label(current(),text("copy_parts_title")));chunks.dismiss();
            checkedMenus++;((FrameLayout)activity.findViewById(android.R.id.content)).removeView(root);
        }
    }
    @Test public void settingsWithoutPromptHasContinuousApiStyleDiagnosticsAndPreservesLegacyBytes()throws Exception{
        int resource=activity.getResources().getIdentifier("caption_settings_fixture","xml",activity.getPackageName());assertNotEquals(0,resource);activity.addPreferencesFromResource(resource);
        PreferenceScreen screen=activity.getPreferenceScreen();assertNull(screen.findPreference("deepseek_caption_prompt"));assertNotNull(screen.findPreference("deepseek_caption_base_url"));assertNotNull(screen.findPreference("deepseek_caption_style_preview"));
        List<Preference> categories=new ArrayList<>();for(int i=0;i<screen.getPreferenceCount();i++)if(screen.getPreference(i) instanceof PreferenceCategory){PreferenceGroup group=(PreferenceGroup)screen.getPreference(i);assertTrue("empty category",group.getPreferenceCount()>0);categories.add(group);}
        assertEquals(3,categories.size());String saved="忠实、自然、简洁；增加原文没有的解释。";ApiProfiles.values(activity).edit().putString("prompt",saved).commit();Map<String,?> before=new TreeMap<>(ApiProfiles.values(activity).getAll());
        for(AppLanguage language:AppLanguage.values())if(language!=AppLanguage.DEFAULT){choose(language);LinearLayout page=new LinearLayout(activity);page.setOrientation(LinearLayout.VERTICAL);page.setBackgroundColor(CaptionSettingsStyle.surfaceColor(activity));
            for(int i=0;i<screen.getPreferenceCount();i++){Preference item=screen.getPreference(i);page.addView(item.getView(null,page));if(item instanceof PreferenceGroup)for(int j=0;j<((PreferenceGroup)item).getPreferenceCount();j++)page.addView(((PreferenceGroup)item).getPreference(j).getView(null,page));}
            page.measure(View.MeasureSpec.makeMeasureSpec(320,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));page.layout(0,0,320,page.getMeasuredHeight());
            assertEquals(text("api_config"),categories.get(0).getTitle());assertEquals(text("style"),categories.get(1).getTitle());assertEquals(text("cache_diagnostics"),categories.get(2).getTitle());assertEquals(before,ApiProfiles.values(activity).getAll());assertNull(label(page,text("translation_requirements")));

            checkedMenus++;
        }
    }
}
