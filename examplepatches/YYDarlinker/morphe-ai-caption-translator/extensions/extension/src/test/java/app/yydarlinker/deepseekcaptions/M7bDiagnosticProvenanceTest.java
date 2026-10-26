package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.content.Context;
import android.content.ContextWrapper;
import java.io.File;
import java.util.LinkedHashMap;
import java.util.Map;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Real report/archive/export contract: build expectations cannot certify device provenance. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
public class M7bDiagnosticProvenanceTest {
    @Implements(CaptionAddonSupport.class)
    public static class Installed {
        @Implementation public static boolean aiInstalled() { return true; }
    }
    @Rule public org.junit.rules.TemporaryFolder owned = new org.junit.rules.TemporaryFolder(
            new File(System.getProperty("n39.root"), "work/temp"));
    Context context;

    @Before public void before() throws Exception {
        File files = owned.newFolder("diagnostics");
        context = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public Context getApplicationContext() { return this; }
            @Override public File getFilesDir() { return files; }
        };
        CaptionDiagnostics.clear(context);
        CaptionDiagnosticsWriter.drainNow(context);
        CaptionDiagnosticArchive.read(context, "history");
    }

    @After public void after() {
        CaptionDiagnostics.clear(context);
        CaptionDiagnosticsWriter.drainNow(context);
        CaptionDiagnosticArchive.read(context, "history");
    }

    Map<String, String> manifest(String export) {
        int start = export.indexOf("[Export manifest; ");
        assertTrue(export, start >= 0);
        String raw = export.substring(start + "[Export manifest; ".length(), export.indexOf("]", start));
        Map<String, String> fields = new LinkedHashMap<>();
        for (String part : raw.split(";\\s*")) {
            String[] pair = part.trim().split("=", 2);
            assertEquals(part, 2, pair.length);
            assertNull("duplicate field: " + pair[0], fields.put(pair[0], pair[1]));
        }
        return fields;
    }

    @Test public void realExportDistinguishesPinnedBuildExpectationFromUnknownRuntime() {
        CaptionDiagnostics.mark(context, "REBUILD_TEST", "fixture-only; no provider calls");
        String summary = CaptionDiagnostics.reportText(context, false);
        String export = CaptionDiagnostics.fullText(context);
        System.out.println("M7B_REPORT_BEGIN\n" + summary + "\nM7B_EXPORT_BEGIN\n" + export);
        Map<String, String> fields = manifest(export);
        assertEquals("unobserved official input must not be reported as a loaded version",
                "unknown", fields.get("official"));
        assertEquals("runtime_unverified", fields.get("official_source"));
        assertEquals("unknown", fields.get("patcher"));
        assertEquals("runtime_unverified", fields.get("patcher_source"));
        assertEquals("1.48.0", fields.get("build_expected_official"));
        assertEquals("2.0.0", fields.get("build_expected_patcher"));
        assertEquals("unverified", fields.get("composition"));
        assertEquals("github.com/YYDarlinker/morphe-ai-caption-translator@ac65fe803ec2b11821b1131040f807922a2b8505",
                fields.get("core_source"));
        assertEquals("local", fields.get("core_adaptation"));
        assertEquals("docs/core-provenance.json", fields.get("core_provenance"));
        assertEquals(CaptionEngineIdentity.ID, fields.get("core"));
        assertEquals(app.yydarlinker.extension.BuildConfig.CAPTION_PATCH_VERSION, fields.get("ui"));
        assertEquals(CaptionDiagnostics.engineVersion(), fields.get("engine"));
        assertEquals(app.yydarlinker.extension.BuildConfig.CAPTION_BUILD_ID, fields.get("build"));
        assertTrue(summary.contains("Engine: Event rebuild / " + CaptionDiagnostics.engineVersion()));
        assertEquals("bounded_not_guaranteed", fields.get("completeness"));
        assertEquals("1", fields.get("history_records"));
        assertNotNull(fields.get("queue_epoch"));
    }

    @Test public void oldHistoryStaysLiteralWhileCurrentManifestAndRedactionRemainIndependent() {
        String old = "saved legacy record: official=1.45.0; build=historical";
        String secret = "sk-m7b-fixture-secret-01234567890123456789";
        CaptionDiagnosticArchive.append(context, "history", old);
        CaptionDiagnosticArchive.read(context, "history");
        CaptionDiagnostics.mark(context, "REBUILD_TEST", "token=" + secret, CaptionCredentialRef.of(secret));
        String history = CaptionDiagnostics.history(context);
        String export = CaptionDiagnostics.fullText(context);
        assertTrue(export.contains(old));
        assertTrue(history.contains(old));
        assertFalse(export.contains(secret));
        assertEquals("unknown", manifest(export).get("official"));
        assertTrue(export.contains("dropped_records="));
        assertTrue(export.contains("merged_records="));
        System.out.println("M7B_LEGACY_REDACTION_BEGIN\n" + export);
    }

    @Test @Config(shadows = Installed.class)
    public void realFirstDrawEventUsesCurrentBuildAndQualifiedUnknownOfficial() throws Exception {
        java.lang.reflect.Field observed = NativeCaptionBridge.class.getDeclaredField("drawObserved");
        observed.setAccessible(true);
        java.util.concurrent.atomic.AtomicBoolean flag =
                (java.util.concurrent.atomic.AtomicBoolean) observed.get(null);
        boolean previous = flag.getAndSet(false);
        NativeCaptionBridge.initialize(context);
        try {
            DeepSeekConfig.saveEnabled(context, false);
            assertFalse("diagnostic metadata must not change the disabled draw decision",
                    NativeCaptionBridge.suppressNativeDraw());
            String export = CaptionDiagnostics.fullText(context);
            System.out.println("M7B_DRAW_EXPORT_BEGIN\n" + export);
            String event = java.util.Arrays.stream(CaptionDiagnostics.history(context).split("\n"))
                    .filter(x -> x.contains(" | NATIVE_DRAW_HOOK_CONNECTED | ")).findFirst().orElse("");
            assertFalse("must exercise the real first-draw diagnostic", event.isEmpty());
            assertTrue(event, event.contains("build="
                    + app.yydarlinker.extension.BuildConfig.CAPTION_BUILD_ID + ";"));
            assertTrue(event, event.contains("official=unknown;official_source=runtime_unverified;"));
            assertTrue(event, event.contains("hook=SubtitleWindowView.draw"));
        } finally {
            flag.set(previous);
            NativeCaptionBridge.resetForTests();
        }
    }
}
