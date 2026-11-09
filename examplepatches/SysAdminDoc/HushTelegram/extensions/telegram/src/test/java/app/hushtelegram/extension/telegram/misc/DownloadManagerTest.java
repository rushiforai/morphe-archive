/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDialog;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class DownloadManagerTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final List<DownloadManager.Item> active = new ArrayList<>();
    private final List<DownloadManager.Item> finished = new ArrayList<>();
    private final List<String> cancelled = new ArrayList<>();

    @Before public void reset() {
        restore();
        DownloadManager.source = new DownloadManager.Source() {
            @Override public List<DownloadManager.Item> active() { return new ArrayList<>(active); }

            @Override public List<DownloadManager.Item> finished() { return new ArrayList<>(finished); }

            @Override public void cancel(DownloadManager.Item item) {
                cancelled.add(item.name);
                active.remove(item);
            }
        };
    }

    @After public void restore() {
        PauseForTests.resume();
        PatchFamilyForTests.resetCapabilities();
        SettingReadsForTests.mend(Settings.DOWNLOAD_MANAGER);
        Settings.DOWNLOAD_MANAGER.resetToDefault();
    }

    @Test public void offIsTheDefaultAndChangesNothing() {
        assertFalse(Settings.DOWNLOAD_MANAGER.defaultValue);
        assertEquals(0, DownloadManager.merge());
        assertEquals(8, DownloadManager.limit(8));
        assertEquals(4, DownloadManager.limit(4));
        assertFalse(DownloadManager.rowShown());
    }

    @Test public void onHoldsEveryDownloadToOneQueueAndOneFile() {
        Settings.DOWNLOAD_MANAGER.save(true);
        assertNotEquals(0, DownloadManager.merge());
        assertEquals(1, DownloadManager.limit(8));
        assertEquals(1, DownloadManager.limit(1));
        assertTrue(report().contains("download queued in the one queue"));
    }

    @Test public void pausedMeansStock() {
        Settings.DOWNLOAD_MANAGER.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertEquals(0, DownloadManager.merge());
        assertEquals(8, DownloadManager.limit(8));
        assertFalse(DownloadManager.rowShown());
    }

    @Test public void theSideMenuRowNeedsThePatchAndTheSwitch() {
        Settings.DOWNLOAD_MANAGER.save(true);
        PatchFamilyForTests.installed();
        assertFalse("not in this build", DownloadManager.rowShown());
        PatchFamilyForTests.installed(PatchFamily.Capability.DOWNLOAD_MANAGER);
        assertTrue(DownloadManager.rowShown());
        Settings.DOWNLOAD_MANAGER.save(false);
        assertFalse("switch off", DownloadManager.rowShown());
    }

    @Test public void sizesReadInPlainUnits() {
        assertEquals("", DownloadManager.sizeText(0));
        assertEquals("", DownloadManager.sizeText(-5));
        assertEquals("900 B", DownloadManager.sizeText(900));
        assertEquals("1.5 KB", DownloadManager.sizeText(1536));
        assertEquals("3.3 MB", DownloadManager.sizeText(3_500_000L));
        assertEquals("120 MB", DownloadManager.sizeText(120L * 1024 * 1024));
        assertEquals("2.0 GB", DownloadManager.sizeText(2L * 1024 * 1024 * 1024));
    }

    @Test public void theListShowsRunningWaitingAndFinishedFiles() {
        active.add(new DownloadManager.Item("a", "movie.mp4", 120L * 1024 * 1024, true));
        active.add(new DownloadManager.Item("b", "notes.pdf", 2048, false));
        finished.add(new DownloadManager.Item("c", "song.mp3", 5_000_000L, false));
        List<String> lines = lines(build());
        assertEquals(Arrays.asList("movie.mp4", "Downloading, 120 MB", "Cancel", "notes.pdf", "Waiting, 2.0 KB", "Cancel",
                "song.mp3", "Finished, 4.8 MB"), lines);
    }

    @Test public void anEmptyListSaysSo() {
        assertEquals(Collections.singletonList("No downloads yet"), lines(build()));
    }

    @Test public void cancelStopsThatFileAndRedrawsTheList() {
        active.add(new DownloadManager.Item("a", "movie.mp4", 1, true));
        active.add(new DownloadManager.Item("b", "notes.pdf", 1, false));
        LinearLayout list = build();
        TextView cancel = firstCancel(list);
        cancel.performClick();
        assertEquals(Collections.singletonList("movie.mp4"), cancelled);
        assertEquals(Arrays.asList("notes.pdf", "Waiting, 1 B", "Cancel"), lines(list));
        assertTrue(report().contains("download cancelled from the list"));
    }

    @Test public void aListThatCantBeReadStillOpens() {
        DownloadManager.source = new DownloadManager.Source() {
            @Override public List<DownloadManager.Item> active() throws Exception { throw new IllegalStateException("no controller"); }

            @Override public List<DownloadManager.Item> finished() { return new ArrayList<>(); }

            @Override public void cancel(DownloadManager.Item item) { }
        };
        assertEquals(Collections.singletonList("No downloads yet"), lines(build()));
    }

    @Test public void showOpensTheDialogOverTheActivity() {
        Activity activity = Robolectric.buildActivity(Activity.class).create().start().resume().get();
        active.add(new DownloadManager.Item("a", "movie.mp4", 1, true));
        DownloadManager.show(activity);
        AlertDialog dialog = (AlertDialog) ShadowDialog.getLatestDialog();
        assertNotNull(dialog);
        assertTrue(dialog.isShowing());
        assertTrue(report().contains("download list opened"));
    }

    @Test public void theSideMenuRowOpensIt() {
        Activity activity = Robolectric.buildActivity(Activity.class).create().start().resume().get();
        SideMenu.open(SideMenu.Row.DOWNLOADS, new Object(), activity);
        assertTrue(ShadowDialog.getLatestDialog().isShowing());
    }

    private static String report() { return String.join(System.lineSeparator(), HookStatus.report()); }

    private LinearLayout build() {
        Activity activity = Robolectric.buildActivity(Activity.class).create().get();
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        DownloadManager.fill(list);
        return list;
    }

    private static List<String> lines(View view) {
        List<String> found = new ArrayList<>();
        collect(view, found);
        return found;
    }

    private static void collect(View view, List<String> found) {
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), found);
        } else if (view instanceof TextView) {
            found.add(String.valueOf(((TextView) view).getText()));
        }
    }

    private static TextView firstCancel(View view) {
        if (view instanceof TextView && "Cancel".contentEquals(((TextView) view).getText())) return (TextView) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = firstCancel(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }
}
