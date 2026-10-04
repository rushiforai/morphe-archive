/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at a788c516 (GPL-3.0),
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

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = BuildIdentityDisplayTest.IdentityUtils.class)
@SuppressWarnings("deprecation")
public class BuildIdentityDisplayTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    @Implements(Utils.class)
    public static class IdentityUtils {
        static String value = "unknown";
        @Implementation public static String getPatchesBuildIdentity() { return value; }
    }

    @After public void restore() {
        IdentityUtils.value = "unknown";
        PauseForTests.resume();
        BaseSettings.PAUSED.resetToDefault();
        PatchFamily.inBuildForTests = null;
        LogBufferManager.clearLogBuffer();
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h844dp-night-xhdpi")
    public void actualOverviewKeepsTheIdentityInEveryPauseState() throws Exception {
        renderedPauseStates("identity-overview");
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "ar-rXB-ldrtl-w390dp-h844dp-night-xhdpi")
    public void actualOverviewKeepsThePayloadAndRecoveryActionAtLargeRightToLeftText() throws Exception {
        RuntimeEnvironment.setFontScale(2f);
        try {
            renderedPauseStates("identity-overview-large-rtl");
        } finally {
            RuntimeEnvironment.setFontScale(1f);
        }
    }

    private void renderedPauseStates(String captureName) throws Exception {
        IdentityUtils.value = "sha256=" + "1".repeat(64) + "; source=dirty:" + "2".repeat(40)
                + "; tree=" + "3".repeat(40) + "; inputs=" + "4".repeat(64);
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
                    root.measure(View.MeasureSpec.makeMeasureSpec(780, View.MeasureSpec.EXACTLY),
                            View.MeasureSpec.makeMeasureSpec(1688, View.MeasureSpec.EXACTLY));
                    root.layout(0, 0, 780, 1688);
                    ShadowLooper.idleMainLooper();
                    ListView list = root.findViewById(android.R.id.list);
                    TextView summary = list.getChildAt(0).findViewById(android.R.id.summary);
                    String text = summary.getText().toString();
                    String identity = L10n.f("Build %1$s", L10n.isolate("sha256=" + "1".repeat(64) + "; source=dirty"));
                    assertTrue(reason + "/" + savedPause + ": " + text, text.contains(identity));
                    assertEquals("the identity is shown once", text.indexOf(identity), text.lastIndexOf(identity));
                    android.text.Layout layout = summary.getLayout();
                    assertNotNull(layout);
                    assertEquals("the final identity bytes aren't cut off", text.length(),
                            layout.getLineEnd(layout.getLineCount() - 1));
                    for (int line = 0; line < layout.getLineCount(); line++) assertEquals(0, layout.getEllipsisCount(line));
                    ArrayList<View> actions = new ArrayList<>();
                    String actionText = HushThreadsPause.isPaused() != HushThreadsPause.pausesNextStart(activity.get())
                            ? L10n.t("Undo") : HushThreadsPause.pausesNextStart(activity.get()) ? L10n.t("Resume") : L10n.t("Pause");
                    root.findViewsWithText(actions, actionText, View.FIND_VIEWS_WITH_TEXT);
                    View action = actions.stream().filter(view -> view instanceof android.widget.Button).findFirst().orElseThrow();
                    android.graphics.Rect bounds = new android.graphics.Rect();
                    assertTrue("the recovery action is visible", action.getGlobalVisibleRect(bounds));
                    assertEquals("the recovery action isn't clipped", action.getHeight(), bounds.height());
                    if (reason != HushThreadsPause.Reason.CRASH_LOOP && savedPause == (reason != HushThreadsPause.Reason.NONE)) {
                        File folder = new File("build/reports/settings-design");
                        assertTrue(folder.isDirectory() || folder.mkdirs());
                        Bitmap bitmap = Bitmap.createBitmap(780, 1688, Bitmap.Config.ARGB_8888);
                        root.draw(new Canvas(bitmap));
                        try (FileOutputStream out = new FileOutputStream(new File(folder,
                                captureName + (savedPause ? "-paused" : "-active") + ".png"))) {
                            assertTrue(bitmap.compress(Bitmap.CompressFormat.PNG, 100, out));
                        }
                        bitmap.recycle();
                    }
                }
            }
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
                assertTrue(text, text.contains(L10n.f("Build %1$s", L10n.isolate(IdentityUtils.value))));
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

    @Test public void runningAndPausedStatusAboutAndReportsCarryTheSameVerifiedValue() throws Exception {
        String payload = "1".repeat(64);
        for (String value : new String[]{"unknown", "unverified",
                "sha256=" + payload + "; source=unknown; inputs=" + "4".repeat(64),
                "sha256=" + payload + "; source=clean:" + "2".repeat(40)
                        + "; tree=" + "3".repeat(40) + "; inputs=" + "4".repeat(64),
                "sha256=" + payload + "; source=dirty:" + "2".repeat(40)
                        + "; tree=" + "3".repeat(40) + "; inputs=" + "4".repeat(64)}) {
            IdentityUtils.value = value;
            assertEquals(value, Utils.getPatchesBuildIdentity());
            for (boolean paused : new boolean[]{false, true}) {
                if (paused) PauseForTests.pause(app.morphe.extension.shared.settings.HushThreadsPause.Reason.CRASH_LOOP);
                else PauseForTests.resume();
                try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
                    HushThreadsPreferenceFragment page = new HushThreadsPreferenceFragment();
                    activity.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
                    List<Preference> rows = new ArrayList<>();
                    collect(page.getPreferenceScreen(), rows);
                    assertTrue(String.valueOf(rows.get(0).getSummary()),
                            String.valueOf(rows.get(0).getSummary()).contains(L10n.isolate(value.startsWith("sha256=")
                                    ? "sha256=" + payload + "; source=" + (value.contains("source=dirty:") ? "dirty"
                                    : value.contains("source=clean:") ? "clean" : "unknown") : value)));
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
}
