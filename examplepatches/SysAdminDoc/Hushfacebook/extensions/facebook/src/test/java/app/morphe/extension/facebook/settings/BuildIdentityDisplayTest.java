/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.app.Activity;
import android.content.ClipboardManager;
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
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowLooper;
import java.util.ArrayList;
import java.util.EnumSet;
import java.io.File;
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
        @Implementation public static String getPatchesReleaseVersion() { return "0.7.1"; }
    }

    @After public void restore() {
        IdentityUtils.value = "unknown";
        PauseForTests.resume();
        BaseSettings.PAUSED.resetToDefault();
        PatchFamily.inBuildForTests = null;
        LogBufferManager.clearLogBuffer();
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w393dp-h851dp-night-440dpi")
    public void ordinaryOverviewKeepsVersionAndFourCategoriesInView() throws Exception {
        IdentityUtils.value = "sha256=" + "1".repeat(64) + "; source=dirty:" + "2".repeat(40)
                + "; tree=" + "3".repeat(40) + "; inputs=" + "4".repeat(64);
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        for (boolean paused : new boolean[]{false, true}) {
            BaseSettings.PAUSED.save(paused);
            PauseForTests.pause(paused ? HushfacebookPause.Reason.SWITCH : HushfacebookPause.Reason.NONE);
            try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup().visible()) {
                SettingsDialog dialog = SettingsL10nTest.show(activity.get());
                View root = dialog.getView();
                root.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(2340, View.MeasureSpec.EXACTLY));
                root.layout(0, 0, 1080, 2340);
                ShadowLooper.idleMainLooper();
                ListView list = root.findViewById(android.R.id.list);
                TextView summary = list.getChildAt(0).findViewById(android.R.id.summary);
                assertTrue(summary.getText().toString(), summary.getText().toString().contains("0.7.1"));
                assertTrue("detail lines: " + summary.getLineCount(), summary.getLineCount() <= 4);
                int categories = 0;
                for (int i = 0; i < list.getChildCount(); i++) {
                    View row = list.getChildAt(i);
                    TextView title = row.findViewById(android.R.id.title);
                    if (title != null && List.of("Opening Facebook", "News feed", "Stories", "Reels and Watch",
                            "Playback", "Downloads").contains(title.getText().toString())
                            && row.getTop() >= 0 && row.getBottom() <= list.getHeight()) categories++;
                }
                assertTrue("only " + categories + " categories fit", categories >= 4);
                capture(root, "identity-overview-1080" + (paused ? "-paused" : "-active"));
            }
        }
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h844dp-night-xhdpi")
    public void actualOverviewKeepsCompactIdentityAndRecoveryInEveryPauseState() throws Exception {
        renderedPauseStates("identity-overview");
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h844dp-notnight-xhdpi")
    public void lightOverviewKeepsCompactIdentityAndRecoveryInEveryPauseState() throws Exception {
        renderedPauseStates("identity-overview-light");
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
        IdentityUtils.value = "sha256=" + "1".repeat(64) + "; source=dirty:" + "2".repeat(40)
                + "; tree=" + "3".repeat(40) + "; inputs=" + "4".repeat(64);
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[]{
                HushfacebookPause.Reason.NONE, HushfacebookPause.Reason.SWITCH,
                HushfacebookPause.Reason.CRASH_LOOP}) {
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
                    root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                            View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
                    root.layout(0, 0, width, height);
                    ShadowLooper.idleMainLooper();
                    ListView list = root.findViewById(android.R.id.list);
                    TextView summary = list.getChildAt(0).findViewById(android.R.id.summary);
                    String text = summary.getText().toString();
                    String identity = L10n.f("Build %1$s (modified)", L10n.isolate("11111111"));
                    assertTrue(reason + "/" + savedPause + ": " + text, text.contains(identity));
                    assertTrue(text, text.contains(L10n.isolate("0.7.1")));
                    assertFalse(text, text.contains(IdentityUtils.value));
                    assertEquals("the identity is shown once", text.indexOf(identity), text.lastIndexOf(identity));
                    android.text.Layout layout = summary.getLayout();
                    assertNotNull(layout);
                    assertEquals("the compact detail isn't cut off", text.length(),
                            layout.getLineEnd(layout.getLineCount() - 1));
                    for (int line = 0; line < layout.getLineCount(); line++) assertEquals(0, layout.getEllipsisCount(line));
                    android.widget.Button action = firstButton(list.getChildAt(0));
                    assertNotNull(action);
                    String label = savedPause != (reason != HushfacebookPause.Reason.NONE) ? "Undo"
                            : savedPause ? "Resume" : "Pause";
                    assertEquals(L10n.t(label), action.getText().toString());
                    assertTrue(action.isEnabled() && action.isFocusable() && action.isClickable());
                    assertTrue(action.getWidth() >= 48 * density && action.getHeight() >= 48 * density);
                    assertEquals(action.getText().length(), action.getLayout().getLineEnd(action.getLineCount() - 1));
                    android.graphics.Rect bounds = new android.graphics.Rect();
                    assertTrue("action must remain visible", action.getLocalVisibleRect(bounds));
                    assertEquals(action.getWidth(), bounds.width());
                    assertEquals(action.getHeight(), bounds.height());
                    if (reason != HushfacebookPause.Reason.CRASH_LOOP && savedPause == (reason != HushfacebookPause.Reason.NONE)) {
                        capture(root, captureName + (savedPause ? "-paused" : "-active"));
                    }
                }
            }
        }
    }

    private static android.widget.Button firstButton(View view) {
        if (view instanceof android.widget.Button) return (android.widget.Button) view;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                android.widget.Button found = firstButton(group.getChildAt(i));
                if (found != null) return found;
            }
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

    @Test public void compactIdentityRequiresTheWholeRecordedFormat() {
        String payload = "abcdef12" + "1".repeat(56);
        String inputs = "; inputs=" + "4".repeat(64);
        for (String state : new String[]{"clean", "dirty", "unknown"}) {
            IdentityUtils.value = "sha256=" + payload + "; source=" + state
                    + (state.equals("unknown") ? "" : ":" + "2".repeat(40) + "; tree=" + "3".repeat(40)) + inputs;
            String format = state.equals("clean") ? "Build %1$s (source known)"
                    : state.equals("dirty") ? "Build %1$s (modified)" : "Build %1$s (source unknown)";
            assertEquals(L10n.f("Version %1$s", L10n.isolate("0.7.1")) + "\n"
                    + L10n.f(format, L10n.isolate("abcdef12")), HushfacebookPreferenceFragment.overviewBuildDetails());
        }
        for (String invalid : new String[]{"unverified", "clean", "sha256=" + payload,
                "sha256=" + payload + "; source=clean:abc; tree=abc" + inputs,
                IdentityUtils.value + "\n", IdentityUtils.value.replace("source=unknown", "source=verified"),
                IdentityUtils.value.replace("abcdef12", "ABCDEF12")}) {
            IdentityUtils.value = invalid;
            assertTrue(HushfacebookPreferenceFragment.overviewBuildDetails().endsWith(
                    L10n.f("Build %1$s", L10n.isolate("unverified"))));
        }
        for (String missing : new String[]{null, "", "unknown"}) {
            IdentityUtils.value = missing;
            assertTrue(HushfacebookPreferenceFragment.overviewBuildDetails().endsWith(
                    L10n.f("Build %1$s", L10n.isolate("unknown"))));
        }
    }

    @Test public void anUndeletableResumeMarkerKeepsTheIdentityAndRecoveryAdvice() throws Exception {
        IdentityUtils.value = "unverified";
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup().visible()) {
            File marker = HushfacebookPause.markerFile(activity.get());
            File held = new File(marker, "held");
            assertTrue(marker.mkdirs() && held.createNewFile());
            try {
                BaseSettings.PAUSED.save(true);
                PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
                SettingsDialog dialog = SettingsL10nTest.show(activity.get());
                HushfacebookPreferenceFragment page = (HushfacebookPreferenceFragment) dialog.getChildFragmentManager()
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

    @Test public void overviewIsCompactWhileAboutAndReportsRetainTheFullIdentity() throws Exception {
        String payload = "1".repeat(64);
        for (String value : new String[]{"unknown", "unverified",
                "sha256=" + payload + "; source=dirty:" + "2".repeat(40)
                        + "; tree=" + "3".repeat(40) + "; inputs=" + "4".repeat(64)}) {
            IdentityUtils.value = value;
            assertEquals(value, Utils.getPatchesBuildIdentity());
            for (boolean paused : new boolean[]{false, true}) {
                if (paused) PauseForTests.pause(app.morphe.extension.shared.settings.HushfacebookPause.Reason.CRASH_LOOP);
                else PauseForTests.resume();
                try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
                    HushfacebookPreferenceFragment page = new HushfacebookPreferenceFragment();
                    activity.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
                    List<Preference> rows = new ArrayList<>();
                    collect(page.getPreferenceScreen(), rows);
                    assertTrue(String.valueOf(rows.get(0).getSummary()),
                            String.valueOf(rows.get(0).getSummary()).contains(HushfacebookPreferenceFragment.overviewBuildDetails()));
                    Preference about = rows.stream().filter(row -> "Version".contentEquals(row.getTitle())).findFirst().orElseThrow();
                    assertTrue(String.valueOf(about.getSummary()), String.valueOf(about.getSummary()).contains(L10n.isolate(value)));
                    LogBufferManager.exportToClipboard();
                    Utils.awaitBackgroundTasksForTests();
                    ShadowLooper.idleMainLooper();
                    ClipboardManager clipboard = RuntimeEnvironment.getApplication().getSystemService(ClipboardManager.class);
                    String report = String.valueOf(clipboard.getPrimaryClip().getItemAt(0).getText());
                    assertTrue(report, report.contains("\npatch_build: " + value + "\n"));
                }
            }
        }
    }
}
