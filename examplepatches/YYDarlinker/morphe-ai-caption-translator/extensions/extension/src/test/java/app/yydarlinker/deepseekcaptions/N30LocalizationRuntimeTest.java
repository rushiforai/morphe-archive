package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.Context;
import android.content.res.Configuration;
import android.os.LocaleList;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.settings.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.Locale;
import org.json.JSONObject;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;

/** Catalog input is the specification; compiled resources and runtime lookup are outputs. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=28,manifest=Config.NONE)
public class N30LocalizationRuntimeTest {
    private static final String[] TAGS={"en","zh-CN","zh-TW","es","fr","de","pt","ru","ja","ko","ar","hi","id","vi"};
    @Before public void setup() {
        ResourceUtils.activity=null;Setting.preferences.preferences=null;
        BaseSettings.MORPHE_LANGUAGE.save(AppLanguage.DEFAULT);
    }
    @After public void cleanup() { setup(); }

    private Context locale(String tag) {
        Context app=RuntimeEnvironment.getApplication();
        Configuration config=new Configuration(app.getResources().getConfiguration());
        config.setLocales(new LocaleList(Locale.forLanguageTag(tag)));
        return app.createConfigurationContext(config);
    }

    @Test public void everyCurrentCatalogKeyReachesCompiledResourcesAndRuntimeLookup() throws Exception {
        Path catalog=Paths.get(System.getProperty("n39.root"),"localization/catalog.json");
        JSONObject languages=new JSONObject(new String(Files.readAllBytes(catalog),StandardCharsets.UTF_8)).getJSONObject("languages");
        assertEquals("new locales need an explicit runtime configuration case",TAGS.length,languages.length());
        for(String tag:TAGS) {
            String folder=tag.equals("zh-CN")?"zh-rCN":tag.equals("zh-TW")?"zh-rTW":tag;
            JSONObject expected=languages.getJSONObject(folder);assertTrue(expected.length()>0);
            Context context=locale(tag);
            for(java.util.Iterator<String> keys=expected.keys();keys.hasNext();) {
                String key=keys.next();int id=context.getResources().getIdentifier("cap_"+key,"string",context.getPackageName());
                assertNotEquals(tag+":"+key+" missing compiled resource",0,id);
                assertEquals(tag+":"+key+" generated XML differs from catalog",expected.getString(key),context.getString(id));
                assertEquals(tag+":"+key+" runtime used another locale/key",expected.getString(key),CaptionStrings.get(context,key));
            }
            assertNotEquals(CaptionStrings.get(context,"autosave"),CaptionStrings.get(context,"ai_summary"));
            assertEquals(expected.getString("default_prompt"),DeepSeekConfig.defaultPrompt(context));
        }
    }

    @Test public void rawExportRemainsEnglishAndEvidenceVerbatimInArabicContext() {
        Context context=locale("ar");CaptionDiagnostics.clear(context);
        String evidence="source=原始证据;response=texte brut;prompt=自定义";
        try {
            CaptionDiagnostics.mark(context,"N30_RAW_EVIDENCE",evidence);
            String raw=CaptionDiagnostics.fullText(context);
            assertTrue(raw.contains("Engine: "));assertTrue(raw.contains("Latest stage: "));
            assertTrue("keep source/model/user text verbatim",raw.contains(evidence));
        } finally { CaptionDiagnostics.clear(context); }
    }
}
