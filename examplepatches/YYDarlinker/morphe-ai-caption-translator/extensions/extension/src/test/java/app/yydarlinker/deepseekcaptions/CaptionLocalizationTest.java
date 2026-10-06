package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import android.content.Context;import android.content.res.Configuration;import android.os.LocaleList;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;
import java.util.*;import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=28)
public class CaptionLocalizationTest {
    @Test public void everySupportedLanguageLoadsTheActualAndroidResource(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();
        String[][] expected={{"en","Cancel","Translating…"},{"zh-CN","取消","翻译中…"},{"zh-TW","取消","翻譯中…"},{"es","Cancelar","Traduciendo…"},{"fr","Annuler","Traduction en cours…"},{"de","Abbrechen","Wird übersetzt…"},{"pt","Cancelar","Traduzindo…"},{"ru","Отмена","Перевод…"},{"ja","キャンセル","翻訳中…"},{"ko","취소","번역 중…"},{"ar","إلغاء","تجري الترجمة…"},{"hi","रद्द करें","अनुवाद हो रहा है…"},{"id","Batal","Menerjemahkan…"},{"vi","Hủy","Đang dịch…"}};
        for(String[] row:expected){Configuration config=new Configuration(a.getResources().getConfiguration());config.setLocales(new LocaleList(Locale.forLanguageTag(row[0])));Context c=a.createConfigurationContext(config);
            assertNotEquals(row[0],0,c.getResources().getIdentifier("cap_cancel","string",c.getPackageName()));
            assertEquals(row[0],row[1],CaptionStrings.get(c,"cancel"));
            assertNotEquals(row[0],0,c.getResources().getIdentifier("cap_caption_translating","string",c.getPackageName()));
            assertEquals(row[0],row[2],CaptionStrings.get(c,"caption_translating"));
            assertEquals(row[0],0,c.getResources().getIdentifier("cap_caption_overflow","string",c.getPackageName()));
            for(String[] key:CaptionTranslationCatalog.ENGLISH)assertNotEquals(key[0],CaptionStrings.get(c,key[0]));
        }a.finish();
    }
    @Test public void unsupportedLanguageUsesEnglishNotHardcodedChinese(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();Configuration config=new Configuration(a.getResources().getConfiguration());config.setLocales(new LocaleList(Locale.forLanguageTag("sw")));
        assertEquals("Caption style",CaptionStrings.get(a.createConfigurationContext(config),"style"));a.finish();
        assertEquals("Translating…",CaptionStrings.get(null,"caption_translating"));
    }
    @Test public void localizationDoesNotModifyModelIdsOrUserConfiguration(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();assertEquals("deepseek-v4-flash",CaptionStrings.localize(a,"deepseek-v4-flash"));assertEquals("https://example.test/v1",CaptionStrings.localize(a,"https://example.test/v1"));a.finish();
    }
    @Test public void diagnosticPayloadIsNeverTranslatedWithTheInterface(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();CaptionDiagnostics.clear(a);
        String payload="display=字幕样式 模型 自动翻译;source=do not alter";
        CaptionDiagnostics.mark(a,"CONTEXTUAL_DISPLAY_SELECTED",payload);
        assertTrue(N37DiagnosticsReports.read(a).contains(payload));CaptionDiagnostics.clear(a);a.finish();
    }
}
