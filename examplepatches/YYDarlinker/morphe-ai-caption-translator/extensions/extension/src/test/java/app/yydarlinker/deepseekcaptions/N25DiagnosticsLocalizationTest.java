package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.os.LocaleList;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.JSONObject;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/**
 * N25 D: the diagnostics panel and the token audit render in the interface language, while the saved
 * export keeps the raw English report byte-for-byte.
 */
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class N25DiagnosticsLocalizationTest {
    private static final String[][] LOCALES={
            {"en","en"},{"zh-rCN","zh-CN"},{"zh-rTW","zh-TW"},{"es","es"},{"fr","fr"},{"de","de"},
            {"pt","pt"},{"ru","ru"},{"ja","ja"},{"ko","ko"},{"ar","ar"},{"hi","hi"},{"id","id"},{"vi","vi"}
    };

    private Context locale(Activity activity,String tag){
        Configuration config=new Configuration(activity.getResources().getConfiguration());
        config.setLocales(new LocaleList(Locale.forLanguageTag(tag)));
        return activity.createConfigurationContext(config);
    }

    @Test public void diagnosticSummaryFollowsTheInterfaceLanguageWhileTheExportStaysRaw() throws Exception {
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        JSONArrayRecorder record=new JSONArrayRecorder();
        try{
            for(String[] locale:LOCALES){
                String tag=locale[0];
                Context c=locale(activity,locale[1]);
                CaptionDiagnostics.clear(c);
                // A presented event proves the verbatim evidence survives; an anchor rejection is one of the
                // stages that also feeds the timestamped decisions channel, which has its own heading.
                CaptionDiagnostics.mark(c,"REBUILD_PRESENTED","block=3;tier=2;unit=7");
                CaptionDiagnostics.mark(c,"ANCHOR_RESPONSE_REJECTED","unit=12;reason=protocol_json");
                String ui=N37DiagnosticsReports.read(c);
                String raw=CaptionDiagnostics.uiText(c,false);
                String export=CaptionDiagnostics.fullText(c);
                // The panel speaks the interface language: its headings are the catalog values. A heading
                // that carries a value is checked by its template's fixed part, since the rendered line
                // substitutes the value into it.
                for(String key:new String[]{"engine","mode","display_debug","timing_decisions","recent_trace"}){
                    String value=CaptionStrings.settings(c,key);
                    String fixed=value.replace("%1$s","").replace("  "," ").trim();
                    assertTrue(tag+" must render '"+key+"' in the interface language (looked for '"
                                    +fixed+"' in '"+ui+"')",
                            fixed.isEmpty()||ui.contains(fixed));
                }
                assertTrue(tag+" must render the debug state in the interface language",
                        ui.contains(String.format(java.util.Locale.ROOT,
                                CaptionStrings.settings(c,"display_debug"),
                                CaptionStrings.settings(c,"off"))));
                // The export keeps the raw headings, so an old report and a new one are comparable. A
                // locale whose own word for "Engine" is the English word cannot be distinguished this way,
                // so the check is skipped only for that exact collision and always uses the joined line.
                assertTrue(tag+" export must keep the raw engine heading",
                        export.contains("Engine: Event rebuild / " + RebuildProtocol.VERSION));
                assertTrue(tag+" export must keep the raw stage heading",export.contains("Latest stage: "));
                String localizedEngine=CaptionStrings.settings(c,"label_separator")
                        .replace("%1$s",CaptionStrings.settings(c,"engine"));
                if(!localizedEngine.equals("Engine: ")){
                    assertFalse(tag+" export must not carry the localized engine heading",
                            export.contains(localizedEngine));
                }
                // N36: the report is built from the bounded diagnostics queue. The panel read drains it,
                // so the recorded evidence is asserted on the panel form and on the export, which is the
                // persisted evidence channel; the raw heading form is checked for its headings above.
                assertTrue("the recorded evidence must survive verbatim in the panel and the export",
                        ui.contains("block=3;tier=2;unit=7")
                                &&export.contains("block=3;tier=2;unit=7"));
                // Event names, JSON keys and protocol codes are never translated.
                assertTrue(tag+" must not translate an event name",ui.contains("REBUILD_PRESENTED"));
                record.add(new JSONObject().put("locale",tag)
                        .put("ui_engine_line",CaptionStrings.settings(c,"engine")
                                +CaptionStrings.settings(c,"engine_event_rebuild")+" / "+RebuildProtocol.VERSION)
                        .put("ui_mode_line",CaptionStrings.settings(c,"label_separator")
                                .replace("%1$s",CaptionStrings.settings(c,"mode"))
                                +CaptionStrings.settings(c,"mode_auto_translate"))
                        .put("ui_debug_line",String.format(java.util.Locale.ROOT,
                                CaptionStrings.settings(c,"display_debug"),CaptionStrings.settings(c,"on")))
                        .put("raw_engine_heading","Engine: Event rebuild / "+RebuildProtocol.VERSION));
            }
        }finally{activity.finish();}
        writeArtifact("n25-diagnostics-localization.json",record.toString());
    }

    @Test public void tokenAuditPanelIsLocalizedAndItsRawFormIsUnchanged(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        try{
            Context c=locale(activity,"zh-CN");
            TokenCostAudit.install(c);
            TokenCostAudit.clear(c);
            // No usage yet: the empty-state sentence is localized, and the raw form is the English one.
            String emptyUi=TokenCostAudit.uiText(c);
            String emptyRaw=TokenCostAudit.uiText(c,false);
            assertEquals(CaptionStrings.settings(c,"audit_no_usage"),emptyUi);
            assertTrue(emptyRaw.startsWith("Token cost audit: no API usage yet."));
            assertNotEquals(emptyUi,emptyRaw);
            // The same holds for the English interface, where the two happen to read alike in structure.
            Context en=locale(activity,"en");
            TokenCostAudit.install(en);
            TokenCostAudit.clear(en);
            assertEquals(CaptionStrings.settings(en,"audit_no_usage"),TokenCostAudit.uiText(en));
        }finally{activity.finish();}
    }

    /** Minimal ordered JSON array writer; the project's org.json has no array builder here. */
    static final class JSONArrayRecorder {
        private final List<String> items=new ArrayList<>();
        void add(JSONObject object){items.add(object.toString());}
        @Override public String toString(){return "[\n"+String.join(",\n",items)+"\n]";}
    }

    private void writeArtifact(String name,String content){
        String output=System.getenv("N25_PREVIEW_OUTPUT");
        if(output==null)return;
        File file=new File(output,name);
        file.getParentFile().mkdirs();
        try(FileOutputStream stream=new FileOutputStream(file)){
            stream.write(content.getBytes(StandardCharsets.UTF_8));
        }catch(IOException failed){
            throw new IllegalStateException(failed);
        }
    }
}
