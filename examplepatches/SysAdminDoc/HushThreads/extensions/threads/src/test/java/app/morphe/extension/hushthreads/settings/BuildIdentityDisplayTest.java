/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at 837bac40 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

import android.app.Activity;
import android.content.ClipboardManager;
import android.content.Context;
import android.provider.MediaStore;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.view.View;
import android.widget.ListView;
import android.widget.TextView;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowLooper;
import java.util.ArrayList;
import java.util.EnumSet;
import java.io.File;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import app.morphe.extension.shared.settings.preference.LogBufferManagerExportTest;
import java.io.FileOutputStream;
import java.util.List;
import static org.junit.Assert.*;

/**
 * The build line sits under everything on the main list in its short form: the version, the
 * first eight characters of the build hash and whether its source is known. About and exported
 * diagnostics keep the whole recorded identity.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = BuildIdentityDisplayTest.IdentityUtils.class)
@SuppressWarnings("deprecation")
public class BuildIdentityDisplayTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    @Implements(Utils.class)
    public static class IdentityUtils {
        static String value = "unknown";
        @Implementation public static String getPatchesBuildIdentity() { return value; }
        @Implementation public static String getPatchesReleaseVersion() { return "0.9.0"; }
    }

    private static final String DIRTY = "sha256=" + "1".repeat(64) + "; source=dirty:" + "2".repeat(40)
            + "; tree=" + "3".repeat(40) + "; inputs=" + "4".repeat(64);

    @After public void restore() {
        IdentityUtils.value = "unknown";
        PauseForTests.resume();
        BaseSettings.PAUSED.resetToDefault();
        PatchFamily.inBuildForTests = null;
        LogBufferManager.clearLogBuffer();
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w393dp-h851dp-night-440dpi")
    public void ordinaryOverviewKeepsFourSectionsInViewAndTheBuildLineAtTheEnd() throws Exception {
        IdentityUtils.value = DIRTY;
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        for (boolean paused : new boolean[]{false, true}) {
            BaseSettings.PAUSED.save(paused);
            PauseForTests.pause(paused ? HushThreadsPause.Reason.SWITCH : HushThreadsPause.Reason.NONE);
            try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup().visible()) {
                SettingsDialog dialog = SettingsL10nTest.show(activity.get());
                View root = dialog.getView();
                layout(root, 1080, 2340);
                ListView list = root.findViewById(android.R.id.list);
                int sections = 0;
                for (int i = 0; i < list.getChildCount(); i++) {
                    View row = list.getChildAt(i);
                    TextView title = row.findViewById(android.R.id.title);
                    if (title != null && List.of("Feed", "Privacy", "Downloads", "Posts", "Appearance", "Links")
                            .contains(title.getText().toString())
                            && row.getTop() >= 0 && row.getBottom() <= list.getHeight()) sections++;
                }
                assertTrue("only " + sections + " sections fit", sections >= 4);
                capture(root, "identity-overview-1080" + (paused ? "-paused" : "-active"));
                TextView summary = buildLine(root, list);
                assertNotNull("the build line is missing from the end of the main list", summary);
                assertTrue(summary.getText().toString(), summary.getText().toString().contains("0.9.0"));
                assertTrue("detail lines: " + summary.getLineCount(), summary.getLineCount() <= 4);
            }
        }
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h844dp-night-xhdpi")
    public void actualOverviewKeepsCompactIdentityAndRecoveryInEveryPauseState() throws Exception {
        renderedPauseStates("identity-overview");
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w320dp-h640dp-night-xhdpi")
    public void narrowOverviewKeepsCompactIdentityAndActionsAtLargeText() throws Exception {
        RuntimeEnvironment.setFontScale(2f);
        try {
            renderedPauseStates("identity-overview-narrow-large");
        } finally {
            RuntimeEnvironment.setFontScale(1f);
        }
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "ar-rXB-ldrtl-w390dp-h844dp-night-xhdpi")
    public void actualOverviewKeepsCompactIdentityAtLargeRightToLeftText() throws Exception {
        RuntimeEnvironment.setFontScale(2f);
        try {
            renderedPauseStates("identity-overview-large-rtl");
        } finally {
            RuntimeEnvironment.setFontScale(1f);
        }
    }

    private void renderedPauseStates(String captureName) throws Exception {
        IdentityUtils.value = DIRTY;
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        for (HushThreadsPause.Reason reason : new HushThreadsPause.Reason[]{
                HushThreadsPause.Reason.NONE, HushThreadsPause.Reason.SWITCH,
                HushThreadsPause.Reason.CRASH_LOOP}) {
            for (boolean savedPause : new boolean[]{false, true}) {
                BaseSettings.PAUSED.save(savedPause);
                PauseForTests.pause(reason);
                try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup().visible()) {
                    SettingsDialog dialog = SettingsL10nTest.show(activity.get());
                    View root = dialog.getView();
                    android.content.res.Configuration configuration = root.getResources().getConfiguration();
                    float density = root.getResources().getDisplayMetrics().density;
                    int width = Math.round(configuration.screenWidthDp * density);
                    int height = Math.round(configuration.screenHeightDp * density);
                    layout(root, width, height);
                    ListView list = root.findViewById(android.R.id.list);
                    boolean paused = HushThreadsPause.isPaused();
                    boolean pausesNext = HushThreadsPause.pausesNextStart(activity.get());

                    // The toolbar's Pause, Resume or Undo stays whole and in view in every state.
                    android.widget.Button action = root.findViewWithTag(SettingsDialog.PAUSE_ACTION);
                    assertNotNull(action);
                    String label = paused != pausesNext ? "Undo" : pausesNext ? "Resume" : "Pause";
                    assertEquals(reason + "/" + savedPause, L10n.t(label), action.getText().toString());
                    assertTrue(action.isEnabled() && action.isFocusable() && action.isClickable());
                    assertTrue(action.getWidth() >= 48 * density && action.getHeight() >= 48 * density);
                    assertEquals(action.getText().length(), action.getLayout().getLineEnd(action.getLineCount() - 1));
                    android.graphics.Rect bounds = new android.graphics.Rect();
                    assertTrue("the action must stay visible", action.getLocalVisibleRect(bounds));
                    assertEquals(action.getWidth(), bounds.width());
                    assertEquals(action.getHeight(), bounds.height());
                    if (reason != HushThreadsPause.Reason.CRASH_LOOP && savedPause == (reason != HushThreadsPause.Reason.NONE)) {
                        capture(root, captureName + (savedPause ? "-paused" : "-active"));
                    }

                    // The status card shows only when something differs from plain "on".
                    Preference first = (Preference) list.getItemAtPosition(0);
                    assertEquals(reason + "/" + savedPause, paused || pausesNext,
                            !SettingsNavigation.QUICK_SETUPS.equals(first.getKey()));

                    TextView summary = buildLine(root, list);
                    assertNotNull(summary);
                    String text = summary.getText().toString();
                    String identity = L10n.f("Build %1$s (modified)", L10n.isolate("11111111"));
                    assertTrue(reason + "/" + savedPause + ": " + text, text.contains(identity));
                    assertTrue(text, text.contains(L10n.isolate("0.9.0")));
                    assertFalse(text, text.contains(IdentityUtils.value));
                    assertEquals("the identity is shown once", text.indexOf(identity), text.lastIndexOf(identity));
                    android.text.Layout layout = summary.getLayout();
                    assertNotNull(layout);
                    assertEquals("the compact detail isn't cut off", text.length(),
                            layout.getLineEnd(layout.getLineCount() - 1));
                    for (int line = 0; line < layout.getLineCount(); line++) assertEquals(0, layout.getEllipsisCount(line));

                    HushThreadsPreferenceFragment page = (HushThreadsPreferenceFragment) dialog.getChildFragmentManager()
                            .findFragmentById(SettingsDialog.CONTAINER_ID);
                    page.navigation.navigate("About");
                    layout(root, width, height);
                    // While this start and the next differ, a restart row is on the list.
                    assertEquals(reason + "/" + savedPause, paused != pausesNext, keys(list).contains(SettingsNavigation.RESTART));
                    // Under ar-XB the title is drawn mirrored, so the row is found by its localized title.
                    TextView about = visibleSummaryOf(list, L10n.t("Version"));
                    assertNotNull("About's Version row isn't on screen in " + reason + "/" + savedPause + ": "
                            + shownRows(list), about);
                    assertTrue("About keeps the complete source record in every pause state",
                            about.getText().toString().contains(L10n.isolate(IdentityUtils.value)));
                    android.text.Layout aboutLayout = about.getLayout();
                    assertNotNull(aboutLayout);
                    assertEquals(about.length(), aboutLayout.getLineEnd(aboutLayout.getLineCount() - 1));
                    for (int line = 0; line < aboutLayout.getLineCount(); line++) {
                        assertEquals("About doesn't truncate the identity", 0, aboutLayout.getEllipsisCount(line));
                    }
                }
            }
        }
    }

    @Test public void compactIdentityRequiresTheWholeRecordedFormat() {
        String payload = "abcdef12" + "1".repeat(56);
        String inputs = "; inputs=" + "4".repeat(64);
        for (String state : new String[]{"clean", "dirty", "unknown"}) {
            IdentityUtils.value = "sha256=" + payload + "; source=" + state
                    + (state.equals("unknown") ? "" : ":" + "2".repeat(40) + "; tree=" + "3".repeat(40)) + inputs;
            String format = state.equals("clean") ? "Build %1$s (source known)"
                    : state.equals("dirty") ? "Build %1$s (modified)" : "Build %1$s (source unknown)";
            assertEquals(L10n.f("Version %1$s", L10n.isolate("0.9.0")) + "\n"
                    + L10n.f(format, L10n.isolate("abcdef12")), HushThreadsPreferenceFragment.overviewBuildDetails());
        }
        for (String invalid : new String[]{"unverified", "clean", "sha256=" + payload,
                "sha256=" + payload + "; source=clean:abc; tree=abc" + inputs,
                IdentityUtils.value + "\n", IdentityUtils.value.replace("source=unknown", "source=verified"),
                IdentityUtils.value.replace("abcdef12", "ABCDEF12")}) {
            IdentityUtils.value = invalid;
            assertTrue(invalid, HushThreadsPreferenceFragment.overviewBuildDetails().endsWith(
                    L10n.f("Build %1$s", L10n.isolate("unverified"))));
        }
        for (String missing : new String[]{null, "", "unknown"}) {
            IdentityUtils.value = missing;
            assertTrue(HushThreadsPreferenceFragment.overviewBuildDetails().endsWith(
                    L10n.f("Build %1$s", L10n.isolate("unknown"))));
        }
    }

    @Test public void anUndeletableResumeMarkerKeepsTheIdentityAndRecoveryAdvice() throws Exception {
        IdentityUtils.value = "unverified";
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup().visible()) {
            File marker = HushThreadsPause.markerFile(activity.get());
            File held = new File(marker, "held");
            assertTrue(marker.mkdirs() && held.createNewFile());
            try {
                BaseSettings.PAUSED.save(true);
                PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
                SettingsDialog dialog = SettingsL10nTest.show(activity.get());
                HushThreadsPreferenceFragment page = (HushThreadsPreferenceFragment) dialog.getChildFragmentManager()
                        .findFragmentById(SettingsDialog.CONTAINER_ID);
                page.resumeFromOverview();
                ListView list = dialog.getView().findViewById(android.R.id.list);
                View row = list.getAdapter().getView(0, null, list);
                String text = ((TextView) row.findViewById(android.R.id.summary)).getText().toString();
                assertTrue(text, text.contains("couldn't be removed") && text.contains("then tap Resume again."));
                View footer = list.getAdapter().getView(list.getCount() - 1, null, list);
                String detail = ((TextView) footer.findViewWithTag(SettingsDialog.BUILD_DETAILS)).getText().toString();
                assertTrue(detail, detail.contains(L10n.f("Build %1$s", L10n.isolate(IdentityUtils.value))));
            } finally {
                held.delete();
                marker.delete();
            }
        }
    }

    private static void collect(PreferenceGroup group, List<Preference> rows) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference row = group.getPreference(i);
            rows.add(row);
            if (row instanceof PreferenceGroup) collect((PreferenceGroup) row, rows);
        }
    }

    @Test public void overviewIsCompactWhileAboutAndReportsRetainTheFullIdentity() throws Exception {
        String payload = "1".repeat(64);
        for (String value : new String[]{"unknown", "unverified",
                "sha256=" + payload + "; source=unknown; inputs=" + "4".repeat(64),
                "sha256=" + payload + "; source=clean:" + "2".repeat(40)
                        + "; tree=" + "3".repeat(40) + "; inputs=" + "4".repeat(64),
                DIRTY}) {
            IdentityUtils.value = value;
            assertEquals(value, Utils.getPatchesBuildIdentity());
            String compact = value.startsWith("sha256=")
                    ? L10n.f(value.contains("source=dirty:") ? "Build %1$s (modified)"
                    : value.contains("source=clean:") ? "Build %1$s (source known)" : "Build %1$s (source unknown)",
                    L10n.isolate("11111111"))
                    : L10n.f("Build %1$s", L10n.isolate(value));
            assertTrue(HushThreadsPreferenceFragment.overviewBuildDetails().endsWith(compact));
            for (boolean paused : new boolean[]{false, true}) {
                if (paused) PauseForTests.pause(HushThreadsPause.Reason.CRASH_LOOP);
                else PauseForTests.resume();
                try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
                    HushThreadsPreferenceFragment page = new HushThreadsPreferenceFragment();
                    activity.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
                    List<Preference> rows = new ArrayList<>();
                    collect(page.getPreferenceScreen(), rows);
                    Preference about = rows.stream().filter(row -> "Version".contentEquals(row.getTitle())).findFirst().orElseThrow();
                    assertTrue(String.valueOf(about.getSummary()), String.valueOf(about.getSummary()).contains(L10n.isolate(value)));
                    LogBufferManager.exportToClipboard();
                    Utils.awaitBackgroundTasksForTests();
                    ShadowLooper.idleMainLooper();
                    ClipboardManager clipboard = RuntimeEnvironment.getApplication().getSystemService(ClipboardManager.class);
                    String report = String.valueOf(clipboard.getPrimaryClip().getItemAt(0).getText());
                    assertTrue(report, report.contains("\npatch_build: " + value + "\n"));
                    Context application = RuntimeEnvironment.getApplication();
                    Robolectric.setupContentProvider(LogBufferManagerExportTest.Downloads.class, MediaStore.AUTHORITY);
                    ByteArrayOutputStream body = new ByteArrayOutputStream();
                    Shadows.shadowOf(application.getContentResolver()).registerOutputStream(
                            android.content.ContentUris.withAppendedId(MediaStore.Downloads.EXTERNAL_CONTENT_URI, 1), body);
                    LogBufferManager.exportToFile();
                    Utils.awaitBackgroundTasksForTests();
                    ShadowLooper.idleMainLooper();
                    String saved = body.toString(StandardCharsets.UTF_8.name());
                    assertTrue(saved, saved.contains("\npatch_build: " + value + "\n"));
                }
            }
        }
    }

    private static void layout(View root, int width, int height) {
        root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, width, height);
        ShadowLooper.idleMainLooper();
    }

    /** Scrolls to the end of the main list and returns the build line drawn there. */
    private static TextView buildLine(View root, ListView list) {
        list.setSelection(list.getCount() - 1);
        layout(root, root.getWidth(), root.getHeight());
        return root.findViewWithTag(SettingsDialog.BUILD_DETAILS);
    }

    private static List<String> keys(ListView list) {
        List<String> keys = new ArrayList<>();
        for (int i = 0; i < list.getCount(); i++) keys.add(((Preference) list.getItemAtPosition(i)).getKey());
        return keys;
    }

    /** The rows the list has laid out, from its first visible position, for a failure message. */
    private static String shownRows(ListView list) {
        StringBuilder rows = new StringBuilder("list " + list.getHeight() + " px from row " + list.getFirstVisiblePosition());
        for (int i = 0; i < list.getChildCount(); i++) {
            View row = list.getChildAt(i);
            TextView shown = row.findViewById(android.R.id.title);
            rows.append(" | ").append(shown == null ? "?" : shown.getText()).append(" @").append(row.getTop());
        }
        return rows.toString();
    }

    private static TextView visibleSummaryOf(ListView list, String title) {
        for (int i = 0; i < list.getChildCount(); i++) {
            View row = list.getChildAt(i);
            TextView shown = row.findViewById(android.R.id.title);
            if (shown != null && title.contentEquals(shown.getText())) return row.findViewById(android.R.id.summary);
        }
        return null;
    }

    private static void capture(View root, String name) throws Exception {
        File folder = new File("build/reports/settings-design");
        assertTrue(folder.isDirectory() || folder.mkdirs());
        Bitmap bitmap = Bitmap.createBitmap(root.getWidth(), root.getHeight(), Bitmap.Config.ARGB_8888);
        root.draw(new Canvas(bitmap));
        try (FileOutputStream out = new FileOutputStream(new File(folder, name + ".png"))) {
            assertTrue(bitmap.compress(Bitmap.CompressFormat.PNG, 100, out));
        }
        bitmap.recycle();
    }
}
