package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.os.Looper;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.view.View;
import android.widget.*;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.settings.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import static org.junit.Assert.*;

/** Counterexamples: mismatched Activity/override, queued saves, default editor flush, and preserved data. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=28) @LooperMode(LooperMode.Mode.PAUSED)
public class N33LocaleAndDataTest {
    public static class UnitFragment extends android.preference.PreferenceFragment {}
    Activity activity;
    @Before public void setup(){
        BaseSettings.MORPHE_LANGUAGE.save(AppLanguage.DEFAULT);Setting.preferences.preferences=null;ResourceUtils.activity=null;
        activity=Robolectric.buildActivity(Activity.class).setup().get();
        Configuration config=new Configuration(activity.getResources().getConfiguration());config.setLocale(Locale.SIMPLIFIED_CHINESE);
        activity.getResources().updateConfiguration(config,activity.getResources().getDisplayMetrics());
        ResourceUtils.activity=activity;Setting.preferences.preferences=activity.getSharedPreferences("n33-official-signature-fixture",0);
    }
    @After public void done(){Setting.preferences.preferences=null;BaseSettings.MORPHE_LANGUAGE.save(AppLanguage.DEFAULT);ResourceUtils.activity=null;activity.finish();}
    private void choose(AppLanguage language){BaseSettings.MORPHE_LANGUAGE.save(language);Shadows.shadowOf(Looper.getMainLooper()).idle();}
    private EditText editor(DeepSeekTextPreference p){return CaptionEditorIds.editorIn(p.getView(null,new LinearLayout(activity)));}
    @Test public void allFourteenOverridesWinOverChineseActivityAndGeneratedFallbackMatchesXml(){
        DeepSeekDiagnosticsPreference diagnostics=new DeepSeekDiagnosticsPreference(activity);
        View diagnosticView=diagnostics.getView(null,new LinearLayout(activity));
        TextView toggle=diagnosticView.findViewWithTag("ai_diagnostics_toggle");
        toggle.performClick();
        for(AppLanguage language:AppLanguage.values())if(language!=AppLanguage.DEFAULT){choose(language);
            diagnostics.refreshCaptionText();assertEquals(toggle.getText(),toggle.getContentDescription());
            IllegalStateException empty=new IllegalStateException("接口没有返回可选择的模型 ID");empty.setStackTrace(new StackTraceElement[]{new StackTraceElement(DeepSeekModelCatalog.class.getName(),"fetch","DeepSeekModelCatalog.java",1)});
            assertEquals(CaptionStrings.settings(activity,"model_ids_empty"),DeepSeekModelPreference.failureText(activity,empty));
            String locale=CaptionTextResolver.catalogLocale(language.getLocale());
            assertEquals(CaptionTranslationCatalog.text(locale,"ai_summary"),CaptionStrings.settings(activity,"ai_summary"));
            assertEquals(CaptionTranslationCatalog.text(locale,"preview_sample"),CaptionStrings.get(activity,"preview_sample"));
            assertEquals(CaptionTranslationCatalog.text(locale,"default_prompt"),DeepSeekConfig.displayDefaultPrompt(activity));
            assertEquals("忠实、自然、简洁；优先符合目标语言的母语表达习惯；保留人名、专有名词、数字、语气和必要的标点；不要增加原文没有的解释。",DeepSeekConfig.defaultPrompt(activity));
        }
    }
    @Test public void defaultUsesCallerLocaleAndNormalizationHandlesScriptsRegionsAliasesAndFallback(){
        choose(AppLanguage.DEFAULT);assertEquals("zh-rCN",CaptionTextResolver.catalogLocale(CaptionTextResolver.locale(activity)));
        for(String tag:new String[]{"zh-Hant","zh-HK","zh-MO","zh-TW"})assertEquals("zh-rTW",CaptionTextResolver.catalogLocale(Locale.forLanguageTag(tag)));
        for(String tag:new String[]{"zh-Hans-TW","zh-CN"})assertEquals("zh-rCN",CaptionTextResolver.catalogLocale(Locale.forLanguageTag(tag)));
        assertEquals("id",CaptionTextResolver.catalogLocale(new Locale("in")));assertEquals("en",CaptionTextResolver.catalogLocale(Locale.forLanguageTag("tr")));
    }
    @Test public void uiLocaleDoesNotChangeSnapshotsPromptsFingerprintsOrCacheIdentity(){
        RebuildSource source=new RebuildSource(Arrays.asList(new RebuildSource.Word("This",0,600,0,RebuildSource.Precision.NATIVE),new RebuildSource.Word("test.",600,1800,0,RebuildSource.Precision.NATIVE)));
        for(String stored:new String[]{"","custom 原文 API key 模型 层"}){
            SharedPreferences p=ApiProfiles.values(activity);if(stored.isEmpty())p.edit().remove("prompt").commit();else p.edit().putString("prompt",stored).commit();
            Map<String,?> bytes=new TreeMap<>(p.getAll());DeepSeekConfig.Snapshot before=DeepSeekConfig.load(activity);
            for(String target:new String[]{"zh-Hans","zh-Hant","ja","ar"}){
                CaptionLanguageContext policy=CaptionLanguageContext.explicit("en",target);
                String prompt=RebuildApi.prompt(before,target,policy),cache=RebuildCache.identity(source,before,target,policy),fingerprint=policy.fingerprint(before);
                for(AppLanguage language:AppLanguage.values()){
                    choose(language);DeepSeekConfig.Snapshot after=DeepSeekConfig.load(activity);
                    assertEquals(before.prompt,after.prompt);assertEquals(before.effectivePreference,after.effectivePreference);
                    assertEquals(prompt,RebuildApi.prompt(after,target,policy));assertEquals(cache,RebuildCache.identity(source,after,target,policy));assertEquals(fingerprint,policy.fingerprint(after));
                    assertEquals(bytes,p.getAll());
                }
            }
        }
    }
    @Test public void displayedDefaultNeverAutosavesOnLanguageScrollFlushOrProfileCopy(){
        choose(AppLanguage.JA);DeepSeekTextPreference p=new DeepSeekTextPreference(activity);p.setKey(DeepSeekTextPreference.KEY_PROMPT);
        EditText input=editor(p);assertEquals(DeepSeekConfig.displayDefaultPrompt(activity),input.getText().toString());
        for(AppLanguage locale:new AppLanguage[]{AppLanguage.EN,AppLanguage.AR,AppLanguage.HANT}){
            choose(locale);p.refreshCaptionText();Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(2));
            assertTrue(p.flushProfile());assertFalse(ApiProfiles.values(activity).contains("prompt"));
            assertEquals(DeepSeekConfig.displayDefaultPrompt(activity),input.getText().toString());
        }
        String other=ApiProfiles.create(activity,"用户 Profile 名","https://example.invalid");assertTrue(ApiProfiles.select(activity,other));
        assertFalse(ApiProfiles.values(activity,"default").contains("prompt"));assertFalse(ApiProfiles.values(activity,other).contains("prompt"));
    }
    @Test public void realUserDefaultLookingTextRemainsCustomAndChangesLocaleWithoutTranslation(){
        choose(AppLanguage.JA);String custom=DeepSeekConfig.displayDefaultPrompt(activity);
        ApiProfiles.values(activity).edit().putString("prompt",custom).commit();
        DeepSeekTextPreference p=new DeepSeekTextPreference(activity);p.setKey(DeepSeekTextPreference.KEY_PROMPT);EditText input=editor(p);
        choose(AppLanguage.EN);p.refreshCaptionText();assertEquals(custom,input.getText().toString());assertTrue(p.flushProfile());
        assertEquals("stored_custom",DeepSeekConfig.load(activity).preferenceProvenance);assertEquals(custom,ApiProfiles.values(activity).getString("prompt",""));
        input.setText("");Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(2));assertFalse(ApiProfiles.values(activity).contains("prompt"));
    }
    @Test public void ownRootListenerUsesSavedEnumAndNeverWritesCaptionConfiguration(){
        android.preference.PreferenceFragment fragment=new UnitFragment();activity.getFragmentManager().beginTransaction().add(fragment,"n33").commit();activity.getFragmentManager().executePendingTransactions();
        PreferenceScreen root=fragment.getPreferenceManager().createPreferenceScreen(activity);root.setKey("morphe_vot_screen__ai_captions");
        DeepSeekEnabledPreference enabled=new DeepSeekEnabledPreference(activity);root.addPreference(enabled);
        CaptionLanguagesPreference languages=new CaptionLanguagesPreference(activity);languages.setKey("deepseek_caption_languages");root.addPreference(languages);
        CaptionLocaleSubscription subscription=CaptionLocaleSubscription.attach(enabled);assertNotNull(subscription);
        SharedPreferences values=ApiProfiles.values(activity);Map<String,?> before=new TreeMap<>(values.getAll());
        BaseSettings.MORPHE_LANGUAGE.save(AppLanguage.JA);assertNotEquals(CaptionTranslationCatalog.text("ja","ai_title"),root.getTitle());
        Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(CaptionTranslationCatalog.text("ja","ai_title"),root.getTitle());
        assertEquals(CaptionTranslationCatalog.text("ja","languages_summary"),languages.getSummary());assertEquals(before,values.getAll());subscription.close();
    }
    @Test public void exactConstantMigrationDoesNotRewriteProviderOrUserSubstrings(){
        choose(AppLanguage.JA);String original="provider 原文：API 地址必须以 https:// 或 http:// 开头 / 用户翻译要求";
        assertEquals(original,CaptionStrings.localize(activity,original));
        assertEquals(CaptionTranslationCatalog.text("ja","message_bafa7b1ca6cb"),CaptionStrings.localize(activity,"API 地址必须以 https:// 或 http:// 开头"));
        IllegalStateException provider=new IllegalStateException("模型列表 HTTP 503：原文 模型列表 HTTP 200");
        assertEquals(provider.getMessage(),DeepSeekModelPreference.failureText(activity,provider));
        provider.setStackTrace(new StackTraceElement[]{new StackTraceElement(DeepSeekModelCatalog.class.getName(),"fetch","DeepSeekModelCatalog.java",1)});
        assertEquals("HTTP 503: 原文 模型列表 HTTP 200",DeepSeekModelPreference.failureText(activity,provider));
    }
}
