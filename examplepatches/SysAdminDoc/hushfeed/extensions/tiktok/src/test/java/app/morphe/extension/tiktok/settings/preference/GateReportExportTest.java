package app.morphe.extension.tiktok.settings.preference;

import static org.junit.Assert.*;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Build;
import app.morphe.extension.shared.Utils;
import java.io.File;
import java.nio.file.Files;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class GateReportExportTest {
    @Test public void multiMegabyteReportSavesInFullAndNeverReachesClipboard() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        String small = "{\"gates\":[]}";
        ShadowToast.reset();
        assertTrue(GateReportExport.copy(context, small));
        assertEquals("Copied feature gate report", String.valueOf(ShadowToast.getTextOfLatestToast()));
        String large = "{\"value\":\"" + "Caption \uD83C\uDF0D ".repeat(200000) + "\"}";
        ShadowToast.reset();
        assertFalse(GateReportExport.copy(context, large));
        assertEquals("Use Save JSON for this large report",
                String.valueOf(ShadowToast.getTextOfLatestToast()));
        var clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        ClipData clip = clipboard.getPrimaryClip();
        assertNotNull(clip);
        assertEquals("Feature gate recording", clip.getDescription().getLabel());
        assertEquals(small, clip.getItemAt(0).getText());
        assertTrue(clip.getDescription().getExtras()
                .getBoolean("android.content.extra.IS_SENSITIVE"));
        File saved = new File(GateReportExport.write(context, large));
        try { assertEquals(large, new String(Files.readAllBytes(saved.toPath()), java.nio.charset.StandardCharsets.UTF_8)); }
        finally { assertTrue(saved.delete()); }
    }

    @Test
    @Config(sdk = {23, 35})
    public void emptyReportUsesSharedSensitiveClipboardHandlingWhereSupported() {
        Context context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        ShadowToast.reset();

        assertTrue(GateReportExport.copy(context, ""));

        ClipboardManager clipboard = (ClipboardManager) context
                .getSystemService(Context.CLIPBOARD_SERVICE);
        ClipData clip = clipboard.getPrimaryClip();
        assertNotNull(clip);
        assertEquals("Feature gate recording", clip.getDescription().getLabel());
        assertEquals("", clip.getItemAt(0).getText());
        if (Build.VERSION.SDK_INT >= 24) {
            assertNotNull(clip.getDescription().getExtras());
            assertTrue(clip.getDescription().getExtras()
                    .getBoolean("android.content.extra.IS_SENSITIVE"));
        }
        assertEquals("Copied feature gate report",
                String.valueOf(ShadowToast.getTextOfLatestToast()));
    }

    @Test public void clipboardFailureIsReportedWithoutCrashing() {
        Context context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        Context denied = new ContextWrapper(context) {
            @Override public Object getSystemService(String service) { throw new SecurityException("Clipboard denied"); }
        };
        ShadowToast.reset();
        assertFalse(GateReportExport.copy(denied, "{}"));
        assertEquals("Could not copy report. Use Save JSON.",
                String.valueOf(ShadowToast.getTextOfLatestToast()));
    }
}
