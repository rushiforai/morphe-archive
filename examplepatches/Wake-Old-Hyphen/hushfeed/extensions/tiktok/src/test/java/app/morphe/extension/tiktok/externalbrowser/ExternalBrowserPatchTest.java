package app.morphe.extension.tiktok.externalbrowser;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;

import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class ExternalBrowserPatchTest {
    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        HookStatus.clear();
        Settings.OPEN_EXTERNAL_LINKS.save(true);
    }

    @After public void tearDown() {
        Settings.OPEN_EXTERNAL_LINKS.save(false);
        HookStatus.clear();
    }

    @Test public void resolverAcceptsPlainHttpsTargetsAndKnownWrappers() {
        assertEquals("https://example.com/path",
                ExternalBrowserPatch.resolveTarget("example.com/path").toString());
        assertEquals("https://example.com/path",
                ExternalBrowserPatch.resolveTarget(
                        "aweme://webview?url=https%3A%2F%2Fexample.com%2Fpath").toString());
        assertEquals("https://example.com/path",
                ExternalBrowserPatch.resolveTarget(
                        "https://redirect.example/?target=https%3A%2F%2Fexample.com%2Fpath").toString());
    }

    @Test public void resolverRefusesNonWebSchemesMissingHostsAndWrapperLoops() {
        assertNull(ExternalBrowserPatch.resolveTarget("file:///sdcard/private.txt"));
        assertNull(ExternalBrowserPatch.resolveTarget("javascript:alert(1)"));
        assertNull(ExternalBrowserPatch.resolveTarget("https:///path"));
        assertNull(ExternalBrowserPatch.resolveTarget(
                "aweme://webview?url=aweme%3A%2F%2Fwebview%3Furl%3Daweme%253A%252F%252Fwebview"));
    }

    @Test public void publicHooksRejectDisallowedScreensBeforeOpeningAService() {
        assertFalse(ExternalBrowserPatch.openSparkThirdContext(null, new Object()));
        assertFalse(ExternalBrowserPatch.openStoryLink(new Object(), new Object()));
    }

    @Test public void aRenamedBrowserServiceIsVisibleInHookStatus() {
        AllowedSparkContext spark = new AllowedSparkContext();
        assertFalse(ExternalBrowserPatch.openSparkThirdContext(
                RuntimeEnvironment.getApplication(), spark));

        List<String> missing = HookStatus.missing("external browser");
        assertEquals(missing.toString(), 2, missing.size());
        assertTrue(missing.get(0), missing.get(0).contains("IMainService"));
        assertTrue(missing.get(1), missing.get(1).contains("ServiceManager"));
    }

    public static final class AllowedSparkContext {
        public final String url = "https://example.com/path";
        public final Map<String, String> defaultParams =
                Map.of("sec_link_scene", "bio_url");
    }
}
