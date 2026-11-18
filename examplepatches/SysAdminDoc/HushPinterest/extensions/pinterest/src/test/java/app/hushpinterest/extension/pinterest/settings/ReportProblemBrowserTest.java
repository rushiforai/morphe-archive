/*
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Application;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Parcelable;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashSet;

/**
 * GitHub's Android app claims github.com links, opens its own template list and drops every value
 * the report link filled in (S25, 2026-11-18), so the link has to reach a browser.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReportProblemBrowserTest {
    private static final String REPORT =
            "https://github.com/SysAdminDoc/HushPinterest/issues/new?template=bug.yml&versions=a&device=b";
    private final Application app = RuntimeEnvironment.getApplication();

    private static Intent view(String url) {
        return new Intent(Intent.ACTION_VIEW, Uri.parse(url)).addCategory(Intent.CATEGORY_BROWSABLE);
    }

    private static ResolveInfo handler(String packageName, boolean exported) {
        ResolveInfo info = new ResolveInfo();
        info.activityInfo = new ActivityInfo();
        info.activityInfo.packageName = packageName;
        info.activityInfo.name = packageName + ".Main";
        info.activityInfo.exported = exported;
        return info;
    }

    private void handles(String url, ResolveInfo info) {
        Shadows.shadowOf(app.getPackageManager()).addResolveInfoForIntent(view(url), info);
    }

    @Test
    public void theFilledInReportGoesToTheBrowserWithGitHubsAppInstalled() {
        handles(REPORT, handler("com.github.android", true));
        handles(REPORT, handler("com.example.browser", true));
        handles("https://example.com/", handler("com.example.browser", true));

        Intent report = ReportProblemForm.browserIntent(app, REPORT);
        assertEquals(Intent.ACTION_VIEW, report.getAction());
        assertEquals("com.example.browser", report.getPackage());
        assertEquals("every filled-in value stays in the address", REPORT, report.getDataString());
        assertTrue(report.hasCategory(Intent.CATEGORY_BROWSABLE));
        assertTrue("a task of its own", (report.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
    }

    @Test
    public void pinterestItselfAndClosedActivitiesAreNotBrowsers() {
        handles("https://example.com/", handler(app.getPackageName(), true));
        handles("https://example.com/", handler("com.example.closed", false));

        Intent report = ReportProblemForm.browserIntent(app, REPORT);
        assertNull("nothing to aim at, so Android picks", report.getPackage());
        assertEquals(REPORT, report.getDataString());
        assertTrue((report.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
    }

    @Test
    public void theDefaultBrowserIsUsedWhenThereAreSeveral() {
        Intent report = ReportProblemForm.route(REPORT, new LinkedHashSet<>(Arrays.asList("com.one", "com.two")), "com.two");
        assertEquals("com.two", report.getPackage());
        assertEquals(REPORT, report.getDataString());
    }

    @Test
    public void severalBrowsersWithNoDefaultAreOfferedTogether() {
        // With no default Android answers with its own resolver, which is no browser.
        Intent chooser = ReportProblemForm.route(REPORT, new LinkedHashSet<>(Arrays.asList("com.one", "com.two")), "android");
        assertEquals(Intent.ACTION_CHOOSER, chooser.getAction());
        assertTrue((chooser.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
        Intent first = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
        assertNotNull(first);
        assertEquals("com.one", first.getPackage());
        assertEquals(REPORT, first.getDataString());
        Parcelable[] others = chooser.getParcelableArrayExtra(Intent.EXTRA_INITIAL_INTENTS);
        assertEquals(1, others.length);
        assertEquals("com.two", ((Intent) others[0]).getPackage());
        assertEquals(REPORT, ((Intent) others[0]).getDataString());
    }

    @Test
    public void aSingleBrowserNeedsNoChooserEvenWithoutADefault() {
        assertEquals("com.one", ReportProblemForm.route(REPORT, Collections.singleton("com.one"), null).getPackage());
    }
}
