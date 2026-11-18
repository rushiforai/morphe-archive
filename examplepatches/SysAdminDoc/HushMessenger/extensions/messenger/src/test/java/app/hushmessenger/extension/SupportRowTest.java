package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.view.View;
import java.lang.reflect.Field;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLog;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class SupportRowTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
    }

    /** Activity hands every launch to this hidden method, and a launch Android refuses throws SecurityException from it. */
    public static final class DenyingInstrumentation extends Instrumentation {
        public Instrumentation.ActivityResult execStartActivity(Context who, IBinder contextThread, IBinder token,
                Activity target, Intent intent, int requestCode, Bundle options) {
            throw new SecurityException("Permission Denial: private launch detail");
        }
    }

    /** Makes [activity]'s launches fail the way a refused one does, until the returned undo runs. */
    static Runnable denyLaunches(Activity activity) throws Exception {
        Field field = Activity.class.getDeclaredField("mInstrumentation");
        field.setAccessible(true);
        Object original = field.get(activity);
        field.set(activity, new DenyingInstrumentation());
        return () -> {
            try {
                field.set(activity, original);
            } catch (IllegalAccessException e) {
                throw new AssertionError(e);
            }
        };
    }

    @Test public void theSupportRowOpensKoFiInTheBrowser() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            View support = root.findViewWithTag("support");
            // The row is its title alone, with no line of text under it.
            assertEquals("Support HushMessenger", support.getContentDescription().toString());
            assertEquals(1, ((android.view.ViewGroup) support).getChildCount());
            assertTrue(support.isFocusable());
            support.performClick();
            Intent opened = Shadows.shadowOf(screen.get()).getNextStartedActivity();
            assertEquals(Intent.ACTION_VIEW, opened.getAction());
            assertEquals("https://ko-fi.com/X8K126YVER", opened.getDataString());
            assertTrue(opened.hasCategory(Intent.CATEGORY_BROWSABLE));
        }
    }

    @Test public void reportAProblemSitsJustAboveSupportAndOpensAFilledReport() throws Exception {
        Settings.preferences.edit().putBoolean("people", true).putBoolean("typing", true).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            View report = root.findViewWithTag("report_problem");
            View support = root.findViewWithTag("support");
            android.view.ViewGroup page = (android.view.ViewGroup) support.getParent();
            assertSame(page, report.getParent());
            assertEquals(page.indexOfChild(support) - 1, page.indexOfChild(report));
            // Ko-fi is the last row; only the license lines follow it.
            for (int i = page.indexOfChild(support) + 1; i < page.getChildCount(); i++)
                assertTrue(page.getChildAt(i) instanceof android.widget.TextView && !page.getChildAt(i).isClickable());
            assertEquals("Report a problem. Opens a public GitHub report with your versions and the controls you have on filled in."
                + " Look it over and add what happened.", report.getContentDescription().toString());
            report.performClick();
            Intent opened = Shadows.shadowOf(screen.get()).getNextStartedActivity();
            assertEquals(Intent.ACTION_VIEW, opened.getAction());
            assertTrue(opened.hasCategory(Intent.CATEGORY_BROWSABLE));
            String url = opened.getDataString();
            String prefix = ProblemReport.NEW_ISSUE + "?title=&body=";
            assertTrue(url, url.startsWith(prefix));
            assertTrue(url.length() <= ProblemReport.MAX_LENGTH);
            String body = java.net.URLDecoder.decode(url.substring(prefix.length()), "UTF-8");
            assertTrue(body, body.startsWith("Versions: HushMessenger " + BuildConfig.VERSION_NAME + " on Messenger "));
            assertTrue(body, body.contains("\nControls on: Hide People You May Know, Hide typing indicator\n"));
            assertTrue(body, body.endsWith("What happened:\n\n\nWhat I expected:\n\n"));
            // No package name, so a clone install's name stays private too.
            assertFalse(body, body.contains(screen.get().getPackageName()));
        }
    }

    @Test public void withoutABrowserTheRowSaysSo() {
        Shadows.shadowOf(RuntimeEnvironment.getApplication()).checkActivities(true);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            root.findViewWithTag("support").performClick();
            assertNull(Shadows.shadowOf(screen.get()).getNextStartedActivity());
            assertEquals("No web browser found on this phone", ShadowToast.getTextOfLatestToast());
        }
    }

    /** A launch Android refuses leaves settings open with a short note, and nothing about the page in the log. */
    @Test public void aRefusedPageLaunchKeepsSettingsOpenAndSaysSo() throws Exception {
        ShadowLog.clear();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            Runnable undo = denyLaunches(screen.get());
            try {
                for (String tag : new String[] {"report_problem", "support"}) {
                    ShadowToast.reset();
                    root.findViewWithTag(tag).performClick();
                    assertEquals(tag, "Your phone didn't allow opening that page", ShadowToast.getTextOfLatestToast());
                }
                // Source and licenses opens in the app, and only its Source code button leaves for a page.
                ShadowToast.reset();
                root.findViewWithTag("source_licenses").performClick();
                assertNull(ShadowToast.getTextOfLatestToast());
                screen.get().licensesSheet().findViewWithTag("licenses_source").performClick();
                assertEquals("Your phone didn't allow opening that page", ShadowToast.getTextOfLatestToast());
                screen.get().licensesSheet().dialog.dismiss();
            } finally {
                undo.run();
            }
            assertFalse(screen.get().isFinishing());
            // The same row works once launches are allowed again.
            root.findViewWithTag("support").performClick();
            assertEquals("https://ko-fi.com/X8K126YVER", Shadows.shadowOf(screen.get()).getNextStartedActivity().getDataString());
        }
        for (ShadowLog.LogItem item : ShadowLog.getLogsForTag("HushMessenger")) {
            assertFalse(item.msg, item.msg.contains("http") || item.msg.contains("private launch detail"));
            assertFalse(item.throwable != null && String.valueOf(item.throwable.getMessage()).contains("private launch detail"));
        }
    }
}
