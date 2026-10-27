/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.webkit.WebView;

import app.morphe.extension.shared.diagnostics.HookStatus;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

/** Issue #263: Activity center's card stayed gray with AMOLED dark theme on. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class AmoledWebPagesTest {
    private static final String ACTIVITY_CENTER =
            "https://inapp.tiktokv.com/tpp/inapp/pns_product_activity_center/ac/home.html";
    private static final int BLACK = 0xFF000000;
    private static final int MOCHA = 0xFF181825;

    private WebView webView;

    @Before public void setUp() {
        webView = new WebView(RuntimeEnvironment.getApplication());
        HookStatus.clear();
    }

    @After public void tearDown() {
        HookStatus.clear();
    }

    private String evaluated() {
        return Shadows.shadowOf(webView).getLastEvaluatedJavascript();
    }

    @Test public void activityCentersCardTokenTakesTheColorUnderTheDarkSchemeOnly() {
        AmoledWebPages.onPage(webView, ACTIVITY_CENTER, BLACK);
        String script = evaluated();
        assertTrue("no script ran on Activity center", script != null);
        assertTrue(script, script.contains(AmoledWebPages.STYLE_ID));
        assertTrue(script, script.contains("--ui-page-grouped-2:#000000 !important"));
        assertTrue(script, script.contains("--UIPageGrouped2:#000000 !important"));
        assertTrue(script, script.contains("[data-tux-color-scheme=\\\"dark\\\"]"));
        assertTrue(script, script.contains(":not([data-tux-color-scheme=\\\"light\\\"])"));
        assertFalse("a light scheme selector set the tokens", script.contains("[data-tux-color-scheme=\\\"light\\\"]{"));
        assertTrue(HookStatus.report().toString().contains("amoled web pages"));
    }

    @Test public void aPickedColorGoesInAsItsHexCode() {
        assertEquals("#181825", AmoledWebPages.cssColor(MOCHA));
        assertTrue(AmoledWebPages.styleSheet(MOCHA).contains("--bg-primary:#181825 !important"));
    }

    @Test public void sheetCardsKeepTheirGrayLikeTheNativeSheets() {
        String css = AmoledWebPages.styleSheet(BLACK);
        assertFalse(css, css.contains("sheet-grouped-2"));
        assertFalse(css, css.contains("SheetGrouped2"));
    }

    @Test public void withoutThePatchedColorPagesAreLeftAlone() {
        AmoledWebPages.onPage(webView, ACTIVITY_CENTER);
        assertNull("a script ran with no AMOLED color baked in", evaluated());
    }

    @Test public void pagesOutsideTikTokAreLeftAlone() {
        AmoledWebPages.onPage(webView, "https://example.com/ac/home.html", BLACK);
        AmoledWebPages.onPage(webView, "http://inapp.tiktokv.com/plain-http", BLACK);
        AmoledWebPages.onPage(webView, null, BLACK);
        AmoledWebPages.onPage(null, ACTIVITY_CENTER, BLACK);
        assertNull("a script ran on a page TikTok doesn't own", evaluated());
    }
}
