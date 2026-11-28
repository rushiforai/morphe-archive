package app.yydarlinker.aicaptions;

import app.yydarlinker.aicaptions.settings.AiCaptionConfig;
import app.yydarlinker.aicaptions.settings.ApiProfiles;
import app.yydarlinker.aicaptions.settings.CaptionStrings;
import app.yydarlinker.aicaptions.settings.CaptionTextResolver;


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
import java.util.*;import app.yydarlinker.caption.contracts.CaptionContracts.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import static org.junit.Assert.*;

/** Morphe locale overrides and persistence independence. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=28) @LooperMode(LooperMode.Mode.PAUSED)
public class CaptionLocaleAndDataTest {
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
    @Test public void allFourteenOverridesWinOverChineseActivityAndGeneratedFallbackMatchesXml(){
        for(AppLanguage language:AppLanguage.values())if(language!=AppLanguage.DEFAULT){choose(language);
            assertEquals(CaptionTextResolver.string(activity,language.getLocale(),"ai_summary"),CaptionStrings.get(activity,"ai_summary"));
            assertEquals(CaptionTextResolver.string(activity,language.getLocale(),"default_prompt"),CaptionStrings.get(activity,"default_prompt"));
            assertEquals("忠实、自然、简洁；优先符合目标语言的母语表达习惯；保留人名、专有名词、数字、语气和必要的标点；不要增加原文没有的解释。",AiCaptionConfig.defaultPrompt(activity));
        }
    }
    @Test public void uiLocaleDoesNotChangeSnapshotsPromptsFingerprintsOrCacheIdentity()throws Exception {
        RebuildSource source=new RebuildSource(Arrays.asList(new RebuildSource.Word("This",0,600,0,RebuildSource.Precision.NATIVE),new RebuildSource.Word("test.",600,1800,0,RebuildSource.Precision.NATIVE)));
        RebuildPlanner.Block block=RebuildPlanner.plan(source,CaptionLanguageContext.LEGACY).get(0);
        for(String stored:new String[]{"","custom 原文 API key 模型 层"}){
            SharedPreferences p=ApiProfiles.values(activity);if(stored.isEmpty())p.edit().remove("prompt").commit();else p.edit().putString("prompt",stored).commit();
            Map<String,?> bytes=new TreeMap<>(p.getAll());AiCaptionConfig.ProviderSettings before=AiCaptionConfig.load(activity);
            for(String target:new String[]{"zh-Hans","zh-Hant","ja","ar"}){
                TranslationSettings config=new TranslationSettings(before.enabled,before.baseUrl,before.model,before.prompt,"fixture-key",before.preferenceProvenance);
                CaptionLanguageContext context=CaptionLanguageContext.explicit("en",target);
                String payload=RebuildProtocol.payload(source,block,target,"",context).toString(),cache=RebuildCache.identity(source,config,target,context),fingerprint=before.fingerprint();
                for(AppLanguage language:AppLanguage.values()){
                    choose(language);AiCaptionConfig.ProviderSettings after=AiCaptionConfig.load(activity);
                    assertEquals(before.prompt,after.prompt);assertEquals(before.effectivePreference,after.effectivePreference);
                    TranslationSettings next=new TranslationSettings(after.enabled,after.baseUrl,after.model,after.prompt,"fixture-key",after.preferenceProvenance);
                    assertEquals(payload,RebuildProtocol.payload(source,block,target,"",context).toString());assertEquals(cache,RebuildCache.identity(source,next,target,context));assertEquals(fingerprint,after.fingerprint());assertEquals(bytes,p.getAll());
                }
            }
        }
    }
    
    
    @Test public void exactConstantMigrationDoesNotRewriteProviderOrUserSubstrings(){
        choose(AppLanguage.JA);String original="provider 原文：API 地址必须以 https:// 或 http:// 开头 / 用户翻译要求";
        assertEquals(original,CaptionStrings.localize(activity,original));
        assertEquals(CaptionTextResolver.string(activity,Locale.JAPANESE,"message_bafa7b1ca6cb"),CaptionStrings.localize(activity,"API 地址必须以 https:// 或 http:// 开头"));
    }
}
