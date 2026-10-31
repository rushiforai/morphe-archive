/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.preference.Preference;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.TreeSet;

import app.morphe.extension.facebook.download.SavesForTests;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.PauseForTests;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowLooper;

/**
 * The running saves on the Downloads page: each one with what it's doing and a Cancel button,
 * whether or not Facebook may post notifications, gone once it ends, and listed once after the
 * page is rebuilt.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "w390dp-h844dp-night-xhdpi")
@SuppressWarnings("deprecation")
public class ActiveSavesTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private static final long MIB = 1024L * 1024L;

    private ActivityController<Activity> controller;
    private SettingsDialog dialog;
    private HushfacebookPreferenceFragment page;
    private SavesForTests.FakeClock clock;

    @Before public void open() {
        clock = SavesForTests.fakeClock();
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.inBuildForTests.remove(PatchFamily.MATERIAL_YOU_THEME);
        PauseForTests.resume();
    }

    private void show() {
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = SettingsL10nTest.pageOf(dialog);
        page.navigation.navigate("Downloads");
        layout();
    }

    @After public void close() {
        SavesForTests.endAll();
        if (controller != null) controller.close();
        PatchFamily.inBuildForTests = null;
        PauseForTests.resume();
    }

    private static NotificationManager notifications() {
        return RuntimeEnvironment.getApplication().getSystemService(NotificationManager.class);
    }

    private ListView list() {
        return dialog.getView().findViewById(android.R.id.list);
    }

    private void layout() {
        ShadowLooper.idleMainLooper();
        View root = dialog.getView();
        for (int pass = 0; pass < 2; pass++) {
            root.measure(View.MeasureSpec.makeMeasureSpec(780, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(1688, View.MeasureSpec.EXACTLY));
            root.layout(0, 0, 780, 1688);
            ShadowLooper.idleMainLooper();
        }
    }

    /**
     * The row of save [id], scrolled into view when the page is longer than the screen, or null.
     * By pixels: outside touch mode, as a test runs, setSelection skips a save's row, which can't
     * be selected, and lands on the row after it.
     */
    private View row(int id) {
        for (int position = 0; position < list().getCount(); position++) {
            Preference item = (Preference) list().getItemAtPosition(position);
            if (!("running_save_" + id).equals(item.getKey())) continue;
            for (int tries = 0; tries < list().getCount(); tries++) {
                if (position < list().getFirstVisiblePosition()) list().scrollListBy(-list().getHeight() / 2);
                else if (position > list().getLastVisiblePosition()) list().scrollListBy(list().getHeight() / 2);
                else break;
                layout();
            }
            return list().getChildAt(position - list().getFirstVisiblePosition());
        }
        return null;
    }

    private int savesListed() {
        int listed = 0;
        for (int i = 0; i < list().getCount(); i++) {
            String key = ((Preference) list().getItemAtPosition(i)).getKey();
            if (key != null && key.startsWith("running_save_")) listed++;
        }
        return listed;
    }

    private static Button cancelOf(View row) {
        ViewGroup frame = row.findViewById(android.R.id.widget_frame);
        assertEquals(1, frame.getChildCount());
        return (Button) frame.getChildAt(0);
    }

    private static String summaryOf(View row) {
        return String.valueOf(((TextView) row.findViewById(android.R.id.summary)).getText());
    }

    /** With every Facebook notification off, the Downloads page is the one way to see and stop a save. */
    @Test public void withNotificationsOffTheDownloadsPageListsTheSaveAndCancelsIt() {
        Shadows.shadowOf(notifications()).setNotificationsEnabled(false);
        int id = SavesForTests.begin(RuntimeEnvironment.getApplication(), true);
        SavesForTests.transferred(id, (long) (4.2 * MIB), 100 * MIB);
        show();

        assertEquals("a notification went up with notifications off", 0,
                Shadows.shadowOf(notifications()).getAllNotifications().size());
        View row = row(id);
        assertNotNull("the running save isn't on the Downloads page", row);
        int downloads = -1;
        for (int i = 0; i < list().getCount(); i++) {
            if ("section_Downloads".equals(((Preference) list().getItemAtPosition(i)).getKey())) downloads = i;
        }
        assertTrue("Downloads has no expandable heading", downloads >= 0);
        assertEquals("the save isn't the first control under Downloads", "running_save_" + id,
                ((Preference) list().getItemAtPosition(downloads + 1)).getKey());
        assertEquals("Saving a video", String.valueOf(((TextView) row.findViewById(android.R.id.title)).getText()));
        assertEquals("Downloading\n4.2 MB of 100 MB\n0:00 elapsed", summaryOf(row));
        Button cancel = cancelOf(row);
        assertEquals("Cancel", cancel.getText().toString());
        assertEquals("Cancel saving this video", String.valueOf(cancel.getContentDescription()));
        assertEquals(Button.class.getName(), cancel.createAccessibilityNodeInfo().getClassName());
        assertTrue("a screen reader stops on the save's title and its status separately", row.isScreenReaderFocusable());
        assertTrue("Cancel lost its own screen reader stop", cancel.isFocusable() && cancel.isClickable());
        int touch = Math.round(48 * cancel.getResources().getDisplayMetrics().density);
        assertTrue(cancel.getHeight() >= touch && cancel.getWidth() >= touch);
        assertNull("saving asked for a permission", Shadows.shadowOf(controller.get()).getLastRequestedPermission());

        assertTrue(cancel.performClick());
        assertTrue("Cancel didn't reach the save", SavesForTests.cancelled(id));
        layout();
        assertNull("a cancelled save is still listed", row(id));
        assertEquals(0, savesListed());
    }

    /**
     * Cancel sits on the row with no surface of its own, and a tap on it still shows a ripple, kept
     * to the button. The page's Back arrow, an icon button, gets the same bounded rectangular feedback.
     */
    @Test public void cancelAnswersATapWithARipple() {
        int id = SavesForTests.begin(RuntimeEnvironment.getApplication(), true);
        show();
        View row = row(id);
        assertNotNull("the running save isn't on the Downloads page", row);
        assertTrue("Cancel has no press feedback",
                cancelOf(row).getBackground() instanceof android.graphics.drawable.RippleDrawable);
        android.graphics.drawable.RippleDrawable ripple = (android.graphics.drawable.RippleDrawable) cancelOf(row).getBackground();
        assertNotNull("Cancel's ripple isn't kept to the button", ripple.findDrawableByLayerId(android.R.id.mask));
        View back = withDescription(dialog.getView(), "Back");
        assertNotNull("the page has no Back arrow", back);
        assertTrue("Back has no press feedback", back.getBackground() instanceof android.graphics.drawable.RippleDrawable);
        android.graphics.drawable.Drawable disc = ((android.graphics.drawable.RippleDrawable) back.getBackground())
                .findDrawableByLayerId(android.R.id.mask);
        assertTrue("Back's ripple must follow the shared corner scale", disc instanceof android.graphics.drawable.GradientDrawable
                && ((android.graphics.drawable.GradientDrawable) disc).getShape() == android.graphics.drawable.GradientDrawable.RECTANGLE);
    }

    private static View withDescription(View root, String description) {
        if (description.contentEquals(String.valueOf(root.getContentDescription()))) return root;
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = withDescription(group.getChildAt(i), description);
                if (found != null) return found;
            }
        }
        return null;
    }

    /** Only the saves channel switched off: no notification, and the page lists the save as before. */
    @Test public void withOnlyTheSavesChannelOffTheSaveIsStillListed() {
        notifications().createNotificationChannel(new NotificationChannel("hushfacebook_saves", "Hushfacebook saves",
                NotificationManager.IMPORTANCE_NONE));
        int id = SavesForTests.begin(RuntimeEnvironment.getApplication(), false);
        show();

        assertEquals(0, Shadows.shadowOf(notifications()).getAllNotifications().size());
        View row = row(id);
        assertNotNull(row);
        assertEquals("Saving a photo", String.valueOf(((TextView) row.findViewById(android.R.id.title)).getText()));
        assertEquals("Downloading\n0:00 elapsed", summaryOf(row));
        assertEquals("Cancel saving this photo", String.valueOf(cancelOf(row).getContentDescription()));
        assertTrue(cancelOf(row).performClick());
        assertTrue(SavesForTests.cancelled(id));
    }

    /**
     * Joining and saving show on the row as they happen, and the row is changed where it is: a row
     * rebuilt under a finger would lose the tap on its Cancel.
     */
    @Test public void aSavesPhaseChangesOnItsRowInPlaceAndTheRowGoesWhenItEnds() {
        int id = SavesForTests.begin(RuntimeEnvironment.getApplication(), true);
        show();
        View row = row(id);
        Button cancel = cancelOf(row);

        SavesForTests.joining(id);
        ShadowLooper.idleMainLooper();
        assertSame("the row was rebuilt", cancel, cancelOf(row(id)));
        assertEquals("Joining the picture and sound\n0:00 elapsed", summaryOf(row));
        SavesForTests.saving(id);
        ShadowLooper.idleMainLooper();
        assertEquals("Copying to the gallery\n0:00 elapsed", summaryOf(row));

        assertTrue(SavesForTests.publishing(id));
        ShadowLooper.idleMainLooper();
        assertSame("the publishing row was rebuilt", cancel, cancelOf(row(id)));
        assertFalse("publishing still offers Cancel", cancel.isEnabled());
        assertEquals("Copying to the gallery\n0:00 elapsed", summaryOf(row));
        assertFalse(app.morphe.extension.facebook.download.SaveControl.cancel(id));
        assertNotNull("a rejected cancel removed the row", row(id));

        SavesForTests.end(id);
        layout();
        assertNull("a finished save is still listed", row(id));
    }

    /**
     * The row says how fast the save downloads and how long it has run, and the time goes on once
     * a second while no bytes come, through a stall and a join, which has no rate to give.
     */
    @Test public void aSavesRowSaysItsRateAndItsTimeKeepsGoing() {
        Shadows.shadowOf(notifications()).setNotificationsEnabled(false);
        int id = SavesForTests.begin(RuntimeEnvironment.getApplication(), true);
        for (int quarter = 0; quarter <= 8; quarter++) {
            SavesForTests.transferred(id, quarter * MIB / 4, -1);
            clock.advanceMillis(250);
        }
        show();
        // Two megabytes in 2.25 s, read up to now: 2.25 s since the first sample.
        assertEquals("Downloading\n2.0 MB so far\n910 KB a second, 0:02 elapsed", summaryOf(row(id)));

        // A stall: the tick moves the time on, and the rate falls away with nothing arriving.
        clock.advanceMillis(6_000);
        ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
        assertEquals("Downloading\n2.0 MB so far\n0:08 elapsed", summaryOf(row(id)));

        SavesForTests.joining(id);
        clock.advanceMillis(3_000);
        ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
        assertEquals("Joining the picture and sound\n0:11 elapsed", summaryOf(row(id)));
    }

    /**
     * TalkBack reads a focused row again whenever its text changes, so with it on the time moves
     * every ten seconds instead of every second, and a new phase still shows at once.
     */
    @Test public void withAScreenReaderOnTheRowsTimeMovesEveryTenSeconds() {
        Shadows.shadowOf(notifications()).setNotificationsEnabled(false);
        AccessibilityManager a11y = RuntimeEnvironment.getApplication().getSystemService(AccessibilityManager.class);
        Shadows.shadowOf(a11y).setEnabled(true);
        Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        try {
            int id = SavesForTests.begin(RuntimeEnvironment.getApplication(), true);
            show();
            assertEquals("Downloading\n0:00 elapsed", summaryOf(row(id)));

            // The page opens part of a second into the tick, so the first move lands on the 10th or 11th.
            int waited = 0;
            while ("Downloading\n0:00 elapsed".equals(summaryOf(row(id))) && waited < 20) {
                aSecondGoesBy();
                waited++;
            }
            assertTrue("with TalkBack on the time moved after " + waited + " s, not ten", waited == 10 || waited == 11);
            String moved = summaryOf(row(id));
            assertEquals("Downloading\n0:" + waited + " elapsed", moved);
            for (int second = 1; second <= 8; second++) aSecondGoesBy();
            assertEquals("the time moved again within ten seconds", moved, summaryOf(row(id)));

            SavesForTests.joining(id);
            ShadowLooper.idleMainLooper();
            assertTrue("a new phase waited for its turn: " + summaryOf(row(id)),
                    summaryOf(row(id)).startsWith("Joining the picture and sound\n"));
        } finally {
            Shadows.shadowOf(a11y).setTouchExplorationEnabled(false);
            Shadows.shadowOf(a11y).setEnabled(false);
        }
    }

    /** The save's clock and the tick move together, as on a phone. */
    private void aSecondGoesBy() {
        clock.advanceMillis(1_000);
        ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
    }

    /** Rebuilt for a rotation, the page lists each save once, and goes on following it. */
    @Test public void aRebuiltPageListsEachSaveOnceAndKeepsFollowingIt() {
        int first = SavesForTests.begin(RuntimeEnvironment.getApplication(), true);
        int second = SavesForTests.begin(RuntimeEnvironment.getApplication(), false);
        show();
        assertEquals(2, savesListed());

        controller.recreate();
        ShadowLooper.idleMainLooper();
        dialog = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag("hushfacebook_settings");
        page = SettingsL10nTest.pageOf(dialog);
        page.navigation.navigate("Downloads");
        layout();

        assertEquals("a rebuilt page listed a save twice", 2, savesListed());
        SavesForTests.joining(first);
        ShadowLooper.idleMainLooper();
        assertEquals("Joining the picture and sound\n0:00 elapsed", summaryOf(row(first)));
        SavesForTests.end(second);
        layout();
        assertEquals(1, savesListed());
    }

    /** Nothing of a save is written anywhere: no address, no name and no record once it's over. */
    @Test public void aSaveLeavesNothingStored() {
        File prefs = new File(RuntimeEnvironment.getApplication().getApplicationInfo().dataDir, "shared_prefs");
        TreeSet<String> before = new TreeSet<>(Arrays.asList(prefs.list() == null ? new String[0] : prefs.list()));
        int id = SavesForTests.begin(RuntimeEnvironment.getApplication(), true);
        show();
        assertNotNull(row(id));
        SavesForTests.end(id);
        layout();
        TreeSet<String> after = new TreeSet<>(Arrays.asList(prefs.list() == null ? new String[0] : prefs.list()));
        // Opening the settings stores which rows were seen; that is no part of a save.
        after.remove(NewRowDots.FILE + ".xml");
        assertEquals("a save stored something", before, after);
    }

    @Test public void lastGenericResultRemainsReadableWithoutNotifications() {
        Shadows.shadowOf(notifications()).setNotificationsEnabled(false);
        int id = SavesForTests.begin(RuntimeEnvironment.getApplication(), true);
        show();
        SavesForTests.end(id);
        layout();
        Preference result = page.findPreference("last_save_outcome");
        assertNotNull("failure disappeared with its progress row", result);
        assertEquals("Last save", result.getTitle().toString());
        assertEquals("The video wasn't saved. Try again.", result.getSummary().toString());
        assertFalse(result.isSelectable());
        assertFalse(result.isPersistent());
        controller.recreate();
        ShadowLooper.idleMainLooper();
        dialog = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag("hushfacebook_settings");
        page = SettingsL10nTest.pageOf(dialog);
        page.navigation.navigate("Downloads");
        layout();
        assertEquals("The video wasn't saved. Try again.",
                page.findPreference("last_save_outcome").getSummary().toString());
    }

    /**
     * A save that failed for a reason it knows says which under Last save, where a person with
     * notifications off looks after the toast has gone, and still says it on a rebuilt page.
     */
    @Test public void aFailedSavesReasonRemainsReadableWithoutNotifications() {
        Shadows.shadowOf(notifications()).setNotificationsEnabled(false);
        int id = SavesForTests.begin(RuntimeEnvironment.getApplication(), true);
        show();
        SavesForTests.failedOffline(id);
        SavesForTests.end(id);
        layout();
        Preference result = page.findPreference("last_save_outcome");
        assertNotNull("the failure disappeared with its progress row", result);
        assertEquals("The connection failed. Check your internet and try again.", result.getSummary().toString());
        controller.recreate();
        ShadowLooper.idleMainLooper();
        dialog = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag("hushfacebook_settings");
        page = SettingsL10nTest.pageOf(dialog);
        page.navigation.navigate("Downloads");
        layout();
        assertEquals("The connection failed. Check your internet and try again.",
                page.findPreference("last_save_outcome").getSummary().toString());
    }

    /** Two saves on the Downloads page, drawn as a phone draws them. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void renderTheRunningSaves() throws Exception {
        int video = SavesForTests.begin(RuntimeEnvironment.getApplication(), true);
        SavesForTests.transferred(video, (long) (38.4 * MIB), 112 * MIB);
        int photo = SavesForTests.begin(RuntimeEnvironment.getApplication(), false);
        SavesForTests.saving(photo);
        assertTrue(SavesForTests.publishing(photo));
        show();
        File folder = new File("build/reports/settings-design");
        assertTrue(folder.isDirectory() || folder.mkdirs());
        Bitmap image = Bitmap.createBitmap(780, 1688, Bitmap.Config.ARGB_8888);
        dialog.getView().draw(new Canvas(image));
        try (FileOutputStream out = new FileOutputStream(new File(folder, "downloads-running-saves.png"))) {
            assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, out));
        }
        image.recycle();
    }
}
