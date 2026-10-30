package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.*;
import java.io.*;
import java.nio.file.*;
import java.nio.charset.StandardCharsets;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,manifest=Config.NONE)
public class D7CachePolicyTest {
    @Rule public org.junit.rules.TemporaryFolder owned=new org.junit.rules.TemporaryFolder(new File(System.getProperty("caption.workspace"),"work/temp"));
    @Test public void oldRewrittenCompleteCacheMissesWithoutDeletingItsBytesOrCredentials() throws Exception {
        File root=owned.newFolder("cache");
        Context c=new ContextWrapper(RuntimeEnvironment.getApplication()){@Override public File getCacheDir(){return root;}};
        RebuildSource s=D7CoverageRegressionTest.source();RebuildPlanner.Block b=RebuildContractTest.block(s);
        TranslationSettings cfg=new TranslationSettings(true,"https://example.invalid/v1","fixture-model","faithful","fixture-key","stored_custom");
        CaptionLanguageContext lang=D7CoverageRegressionTest.LANGUAGE;
        // Independently reconstruct the pre-fix identity, whose JSON has already lost original IDs.
        StringBuilder old=new StringBuilder(RebuildProtocol.VERSION).append('|').append(lang.fingerprint(cfg)).append("|zh-Hans|")
            .append(RebuildCache.hash(RebuildApi.prompt(cfg,"zh-Hans",lang))).append('|').append(lang.renderSpec.presentationPolicy);
        for(RebuildSource.Word w:s.words)old.append('\n').append(w.start).append(':').append(w.end).append(':').append(w.precision).append(':').append(w.text);
        String legacy=RebuildCache.hash(old.toString()),current=RebuildCache.identity(s,cfg,"zh-Hans",lang);
        assertNotEquals(legacy,current);
        File dir=new File(root,"caption-events-r2.12");assertTrue(dir.mkdirs());
        File entry=new File(dir,legacy+"-"+b.id()+".json");
        byte[] bytes=RebuildContractTest.reply(b,new JSONArray().put(RebuildContractTest.event(0,b.to,"花园今天很早开放。").put("source",s.text(0,b.to)))).getBytes(StandardCharsets.UTF_8);
        Files.write(entry.toPath(),bytes);
        assertNull(RebuildCache.read(c,current,s,b,lang));assertArrayEquals(bytes,Files.readAllBytes(entry.toPath()));
        RebuildProtocol.Plan partial=RebuildProtocol.parseBestEffort(D7CoverageRegressionTest.contradictory(s,b),s,b,lang);
        assertTrue(partial.partial);
        // The existing writer accepts score-zero plans; strict cache reads must never
        // restore this partial JSON as a complete translation.
        try(RebuildCache.Prepared prepared=RebuildCache.prepare(c,current,s,b,partial,lang)) {
            assertNotNull(prepared);assertTrue(prepared.commit());
        }
        assertNull(RebuildCache.read(c,current,s,b,lang));
        TranslationSettings replacement=new TranslationSettings(true,cfg.baseUrl,cfg.model,cfg.prompt,"replacement-key","stored_custom");
        assertEquals(current,RebuildCache.identity(s,replacement,"zh-Hans",lang));
        assertNotEquals(current,RebuildCache.identity(s,cfg,"zh-Hans",lang,true));
        assertArrayEquals(bytes,Files.readAllBytes(entry.toPath()));
    }
}
