package app.morphe.extension.tiktok.featuregatelab;

import static org.junit.Assert.*;
import android.app.Activity;
import android.app.Fragment;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.CheckedTextView;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.UiCapture;
import app.morphe.extension.tiktok.settings.SettingsPagesTest.PageActivity;
import app.morphe.extension.tiktok.settings.preference.SettingsUi;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowToast;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "w480dp-h960dp-night-mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class FeatureGatePagesTest {
    @Before public void resetSharedState() throws Exception {
        Utils.setContext(RuntimeEnvironment.getApplication());
        Utils.awaitBackgroundTasksForTests();
        FeatureGateDetailFragment.awaitChangesForTests();
        FeatureGateCatalog.awaitForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        FeatureGateDetailFragment.setDetailChangeTestHookForTests(null);
        FeatureGateCatalog.resetForTests();
        FeatureGateLabSession.resetForTests();
        FeatureGateLabUndo.resetForTests();
        SettingsManagerObservationRecorder.clear();
    }

    @Test public void darkLabSearchAndOverrideEditorWork() throws Exception { exercise("dark"); }
    @Test @Config(qualifiers = "w480dp-h960dp-notnight-mdpi")
    public void lightLabSearchAndOverrideEditorWork() throws Exception { exercise("light"); }

    @Test public void theCustomValueDialogKeepsItsActionHierarchyInTheDark() throws Exception {
        assertCustomValueActionsAreRanked();
    }

    @Test @Config(qualifiers = "w480dp-h960dp-notnight-mdpi")
    public void theCustomValueDialogKeepsItsActionHierarchyInTheLight() throws Exception {
        assertCustomValueActionsAreRanked();
    }

    /**
     * The shared dialog styling ranks the actions, then the Lab's own tree walk used to repaint
     * every Button with the accent, so Use value and Cancel came out looking equally primary on
     * a dialog whose whole point is that one of the two is the unverified one.
     */
    private static void assertCustomValueActionsAreRanked() throws Exception {
        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            FeatureGateLabStore.resetAllLabData();
            FeatureGateLabSession.begin();
            FeatureGateLabStore.setMasterEnabled(true);
            var entry = new FeatureGateCatalog.Entry("ranked_gate", "Ranked gate", "abmock",
                    "INT", true, true, List.of("0", "1"), List.of(), List.of(), "", "",
                    true, "1", "INT");
            var cached = FeatureGateCatalog.class.getDeclaredField("cachedSnapshot");
            cached.setAccessible(true);
            cached.set(null, new FeatureGateCatalog.Snapshot(
                    List.of(entry), Map.of(entry.identity(), entry), 0, 0, true));

            FeatureGateDetailFragment detail =
                    FeatureGateDetailFragment.forEntry("abmock", "ranked_gate", "INT");
            attach(activity, detail);

            java.lang.reflect.Method showCustom =
                    FeatureGateDetailFragment.class.getDeclaredMethod("showCustomValue");
            showCustom.setAccessible(true);
            showCustom.invoke(detail);
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            android.app.AlertDialog dialog =
                    (android.app.AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
            assertNotNull("the custom value dialog never opened", dialog);
            android.widget.Button use = dialog.getButton(android.app.AlertDialog.BUTTON_POSITIVE);
            android.widget.Button cancel = dialog.getButton(android.app.AlertDialog.BUTTON_NEGATIVE);
            assertNotNull(use);
            assertNotNull(cancel);

            assertEquals("Use value lost the accent", SettingsUi.accent(),
                    use.getCurrentTextColor());
            assertEquals("Cancel was promoted to a positive action", SettingsUi.textSecondary(),
                    cancel.getCurrentTextColor());
            assertNotEquals("both actions read as equally primary",
                    use.getCurrentTextColor(), cancel.getCurrentTextColor());

            // The state list has to survive too, or a disabled action stops looking disabled.
            use.setEnabled(false);
            assertNotEquals("the positive action kept its live colour while disabled",
                    SettingsUi.accent(), use.getCurrentTextColor());
            dialog.dismiss();
        }
    }

    @Test public void labFiltersExposeActionRolesCountsAndTheFocusedSourceSelection()
            throws Exception {
        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            FeatureGateLabStore.resetAllLabData();
            FeatureGateLabSession.begin();
            var entry = new FeatureGateCatalog.Entry("source_gate", "Source gate", "abmock",
                    "INT", true, true, List.of("0", "1"), List.of(), List.of(), "", "",
                    true, "1", "INT");
            var cached = FeatureGateCatalog.class.getDeclaredField("cachedSnapshot");
            cached.setAccessible(true);
            cached.set(null, new FeatureGateCatalog.Snapshot(
                    List.of(entry), Map.of(entry.identity(), entry), 0, 0, true));

            FeatureGateLabFragment lab = new FeatureGateLabFragment();
            attach(activity, lab);
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            for (String tag : new String[]{"feature_gate_view_0", "feature_gate_view_1",
                    "feature_gate_view_2", "feature_gate_filter"}) {
                TextView action = lab.getView().findViewWithTag(tag);
                assertNotNull(tag, action);
                assertButtonRole(action);
            }

            View allSources = lab.getView().findViewWithTag("feature_gate_source_0");
            View appAb = lab.getView().findViewWithTag("feature_gate_source_1");
            assertEquals(android.widget.Button.class.getName(),
                    allSources.createAccessibilityNodeInfo().getClassName());
            assertTrue("the focused source container does not carry the selected state",
                    allSources.isSelected());
            appAb.performClick();
            assertFalse(allSources.isSelected());
            assertTrue(appAb.isSelected());

            TextView count = lab.getView().findViewWithTag("feature_gate_result_count");
            assertNotNull(count);
            assertEquals("1 result", count.getText().toString());
            assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE,
                    count.getAccessibilityLiveRegion());
            EditText search = find(lab.getView(), EditText.class);
            search.setText("nothing-here");
            Shadows.shadowOf(Looper.getMainLooper())
                    .idleFor(java.time.Duration.ofMillis(200));
            assertEquals("0 results", count.getText().toString());
        }
    }

    @Test public void darkLabFilterUsesTheSharedSingleChoiceTheme() throws Exception {
        assertLabFilterUsesTheSharedTheme("pages/dark/lab-filter.png");
    }

    @Test @Config(qualifiers = "w480dp-h960dp-notnight-mdpi")
    public void lightLabFilterUsesTheSharedSingleChoiceTheme() throws Exception {
        assertLabFilterUsesTheSharedTheme("pages/light/lab-filter.png");
    }

    private void assertLabFilterUsesTheSharedTheme(String screenshot) throws Exception {
        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            FeatureGateLabStore.resetAllLabData();
            FeatureGateLabSession.begin();
            var entry = new FeatureGateCatalog.Entry("filter_gate", "Filter gate", "abmock",
                    "INT", true, true, List.of("1"), List.of(), List.of(), "", "",
                    true, "1", "INT");
            var cached = FeatureGateCatalog.class.getDeclaredField("cachedSnapshot");
            cached.setAccessible(true);
            cached.set(null, new FeatureGateCatalog.Snapshot(
                    List.of(entry), Map.of(entry.identity(), entry), 0, 0, true));

            FeatureGateLabFragment lab = new FeatureGateLabFragment();
            attach(activity, lab);
            TextView filter = lab.getView().findViewWithTag("feature_gate_filter");
            assertTrue(filter.performClick());
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            android.app.AlertDialog dialog = (android.app.AlertDialog)
                    org.robolectric.shadows.ShadowDialog.getLatestDialog();
            assertNotNull(dialog);
            ListView choices = dialog.getListView();
            assertEquals(ListView.CHOICE_MODE_SINGLE, choices.getChoiceMode());
            View decor = dialog.getWindow().getDecorView();
            decor.measure(View.MeasureSpec.makeMeasureSpec(480, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(960, View.MeasureSpec.EXACTLY));
            decor.layout(0, 0, 480, 960);
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            CheckedTextView first = findCheckedTextView(choices.getChildAt(0));
            assertNotNull("the filter did not render a platform choice row", first);
            assertEquals(SettingsUi.textPrimary(), first.getCurrentTextColor());
            assertNull("the platform check mark leaked through the shared picker style",
                    first.getCheckMarkDrawable());
            assertNotNull("the shared radio indicator is missing",
                    first.getCompoundDrawablesRelative()[0]);
            assertEquals("DialogCheckMarkDrawable",
                    first.getCompoundDrawablesRelative()[0].getClass().getSimpleName());
            assertNotNull("the shared divider is missing", choices.getDivider());
            UiCapture.save(decor, screenshot);
            dialog.dismiss();
        }
    }

    private static CheckedTextView findCheckedTextView(View view) {
        if (view instanceof CheckedTextView) return (CheckedTextView) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                CheckedTextView found = findCheckedTextView(group.getChildAt(index));
                if (found != null) return found;
            }
        }
        return null;
    }

    /**
     * The state column on the right of a Lab row held three stacked 12sp labels in a fixed
     * 116dp. Density scales that number; text size does not, so at double text size the
     * labels have twice the width to fit into the same box. An ellipsis in a value the reader
     * came to the Lab to read is the whole point of the screen going missing.
     */
    @Test @Config(qualifiers = "w360dp-h640dp-night-mdpi", fontScale = 2)
    public void aLabRowKeepsItsStateColumnReadableAtDoubleTextSize() throws Exception {
        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            // Without this the rest of the test proves nothing: it would be measuring a row
            // at ordinary text size and finding, correctly, that nothing is cut off.
            assertEquals("the font scale did not take",
                    2f, activity.getResources().getConfiguration().fontScale, 0.01f);
            FeatureGateLabStore.resetAllLabData();
            FeatureGateLabSession.begin();
            // A gate that has never been read, which is the row that says "No current value",
            // and the state the item names.
            var entry = new FeatureGateCatalog.Entry("3p_login_optimization", "3p Login Optimization",
                    "abmock", "STRING", true, false, List.of(), List.of(), List.of(), "", "", false, null, null);
            var cached = FeatureGateCatalog.class.getDeclaredField("cachedSnapshot");
            cached.setAccessible(true);
            cached.set(null, new FeatureGateCatalog.Snapshot(List.of(entry), Map.of(entry.identity(), entry), 0, 0, true));
            FeatureGateLabStore.saveRule("abmock", entry.key, "STRING", "control_group_b", false);
            FeatureGateLabFragment lab = new FeatureGateLabFragment();
            attach(activity, lab);
            var tabs = FeatureGateLabFragment.class.getDeclaredField("viewTabs");
            tabs.setAccessible(true);
            ((ViewGroup) tabs.get(lab)).getChildAt(1).performClick();
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            ListView list = find(lab.getView(), ListView.class);
            assertEquals(1, list.getAdapter().getCount());
            View row = list.getAdapter().getView(0, null, list);
            int width = View.MeasureSpec.makeMeasureSpec(
                    activity.getResources().getDisplayMetrics().widthPixels,
                    View.MeasureSpec.EXACTLY);
            row.measure(width, View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
            row.layout(0, 0, row.getMeasuredWidth(), row.getMeasuredHeight());

            List<TextView> shown = labels(row);
            assertTrue("no labels were measured", shown.size() >= 3);
            assertTrue("the row is not in the state the item describes: "
                            + shown.stream().map(label -> label.getText().toString())
                            .collect(java.util.stream.Collectors.joining(" | ")),
                    shown.stream().anyMatch(label -> "Override off".contentEquals(label.getText()))
                            && shown.stream().anyMatch(label ->
                            label.getText().toString().startsWith("Saved ")));
            for (TextView label : shown) {
                android.text.Layout laidOut = label.getLayout();
                assertNotNull("\"" + label.getText() + "\" was never laid out", laidOut);
                for (int line = 0; line < laidOut.getLineCount(); line++) {
                    assertEquals("\"" + label.getText() + "\" is cut off at double text size",
                            0, laidOut.getEllipsisCount(line));
                }
                // A label wider than the box it sits in is clipped whether or not the
                // ellipsis machinery ran, which is what a fixed width column does to a
                // label that has no room to shorten.
                assertTrue("\"" + label.getText() + "\" is " + laidOut.getWidth()
                                + "px of text in a " + label.getWidth() + "px label",
                        label.getWidth() >= laidOut.getWidth());
            }
            UiCapture.save(row, "pages/dark/lab-row-large-text.png");
        }
    }

    /**
     * The search field at the top of the Lab was a fixed 48dp box around 16sp text. At double
     * text size that is 32sp of glyphs in a box built for 16, so the tops and tails of what the
     * reader had typed were cut off. 48dp is the floor a finger needs, not the height.
     */
    @Test @Config(qualifiers = "w360dp-h640dp-night-mdpi", fontScale = 2)
    public void theLabSearchFieldGrowsWithTheTextAndKeepsItsFingerSizedFloor() throws Exception {
        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            assertEquals("the font scale did not take, so this proves nothing",
                    2f, activity.getResources().getConfiguration().fontScale, 0.01f);
            FeatureGateLabStore.resetAllLabData();
            FeatureGateLabSession.begin();
            var entry = new FeatureGateCatalog.Entry("3p_login_optimization",
                    "3p Login Optimization", "abmock", "INT", true, true,
                    List.of(), List.of(), List.of(), "", "", false, null, null);
            var cached = FeatureGateCatalog.class.getDeclaredField("cachedSnapshot");
            cached.setAccessible(true);
            cached.set(null, new FeatureGateCatalog.Snapshot(
                    List.of(entry), Map.of(entry.identity(), entry), 0, 0, true));
            FeatureGateLabFragment lab = new FeatureGateLabFragment();
            attach(activity, lab);

            EditText search = find(lab.getView(), EditText.class);
            assertNotNull("the Lab has no search field, so this proves nothing", search);
            assertEquals("the search field lost the floor a finger needs",
                    FeatureGateLabUi.dp(activity, 48), search.getMinimumHeight());

            search.setText("login");
            View root = lab.getView();
            root.measure(
                    View.MeasureSpec.makeMeasureSpec(
                            activity.getResources().getDisplayMetrics().widthPixels,
                            View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
            root.layout(0, 0, root.getMeasuredWidth(), root.getMeasuredHeight());

            android.text.Layout typed = search.getLayout();
            assertNotNull("what was typed was never laid out", typed);
            int needed = typed.getHeight() + search.getPaddingTop() + search.getPaddingBottom();
            assertTrue("the search field is " + search.getHeight() + "px around " + needed
                            + "px of text at double text size",
                    search.getHeight() >= needed);
        }
    }

    private static List<TextView> labels(View view) {
        List<TextView> found = new java.util.ArrayList<>();
        if (view instanceof TextView) {
            TextView label = (TextView) view;
            // The key line is meant to shorten; it is an identifier, shown middle-truncated.
            if (label.getVisibility() == View.VISIBLE && label.length() > 0
                    && label.getEllipsize() != android.text.TextUtils.TruncateAt.MIDDLE) {
                found.add(label);
            }
        } else if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                found.addAll(labels(group.getChildAt(index)));
            }
        }
        return found;
    }

    private void exercise(String theme) throws Exception {
        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            FeatureGateLabStore.resetAllLabData();
            FeatureGateLabSession.begin();
            var entry = new FeatureGateCatalog.Entry("3p_login_optimization", "3p Login Optimization",
                    "abmock", "INT", true, true, List.of("0", "1"), List.of(), List.of(), "", "", false, null, null);
            var cached = FeatureGateCatalog.class.getDeclaredField("cachedSnapshot");
            cached.setAccessible(true);
            cached.set(null, new FeatureGateCatalog.Snapshot(List.of(entry), Map.of(entry.identity(), entry), 0, 0, true));
            FeatureGateLabFragment lab = new FeatureGateLabFragment();
            attach(activity, lab);
            var tabs = FeatureGateLabFragment.class.getDeclaredField("viewTabs");
            tabs.setAccessible(true);
            ((ViewGroup) tabs.get(lab)).getChildAt(1).performClick();
            UiCapture.save(lab.getView(), "pages/" + theme + "/lab.png");
            EditText search = find(lab.getView(), EditText.class);
            search.setText("no-such-gate-12345");
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(200));
            ListView list = find(lab.getView(), ListView.class);
            assertEquals(0, list.getAdapter().getCount());
            UiCapture.save(lab.getView(), "pages/" + theme + "/lab-empty.png");
            search.setText("");
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(200));
            assertEquals(1, list.getAdapter().getCount());
            FeatureGateDetailFragment detail = FeatureGateDetailFragment.forEntry("abmock", entry.key, "INT");
            attach(activity, detail);
            UiCapture.save(detail.getView(), "pages/" + theme + "/gate_details.png");
            assertFalse(find(detail.getView(), Switch.class).isEnabled());
            Spinner disabledValue = find(detail.getView(), Spinner.class);
            assertNotNull(disabledValue);
            assertFalse(disabledValue.isEnabled());
            TextView disabledChoice = (TextView) disabledValue.getAdapter()
                    .getView(0, null, disabledValue);
            assertEquals("the disabled spinner still looks active",
                    app.morphe.extension.tiktok.settings.preference.SettingsUi.textDisabled(),
                    disabledChoice.getCurrentTextColor());
            FeatureGateLabStore.setMasterEnabled(true);
            detail = FeatureGateDetailFragment.forEntry("abmock", entry.key, "INT");
            attach(activity, detail);
            Switch control = find(detail.getView(), Switch.class);
            assertTrue(control.isEnabled());
            ShadowToast.reset();
            control.performClick();
            // Saving an override goes through the journal now, off this thread and back.
            FeatureGateDetailFragment.awaitChangesForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertTrue(FeatureGateLabStore.rule("abmock", entry.key, "INT").enabled);
            assertEquals("Feature gate override saved", ShadowToast.getTextOfLatestToast());
            assertButtonRole(findText(detail.getView(), "Reset override"));
            assertButtonRole(findText(detail.getView(), "Show"));
            UiCapture.save(detail.getView(), "pages/" + theme + "/gate-details-enabled.png");
            attach(activity, FeatureGateDetailFragment.forEntry("abmock", "missing", "INT"));
            UiCapture.save(activity.getFragmentManager().findFragmentById(android.R.id.content).getView(),
                    "pages/" + theme + "/gate-details-unavailable.png");
        }
    }

    @Test public void aFinishedSaveIsReportedAfterTheDetailScreenCloses() throws Exception {
        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            FeatureGateLabStore.resetAllLabData();
            FeatureGateLabSession.begin();
            FeatureGateLabStore.setMasterEnabled(true);
            var entry = new FeatureGateCatalog.Entry("leaving_gate", "Leaving gate", "abmock",
                    "INT", true, true, List.of("0", "1"), List.of(), List.of(), "", "",
                    false, null, null);
            var cached = FeatureGateCatalog.class.getDeclaredField("cachedSnapshot");
            cached.setAccessible(true);
            cached.set(null, new FeatureGateCatalog.Snapshot(
                    List.of(entry), Map.of(entry.identity(), entry), 0, 0, true));
            FeatureGateDetailFragment detail = FeatureGateDetailFragment.forEntry(
                    entry.manager, entry.key, entry.type);
            attach(activity, detail);
            Switch control = find(detail.getView(), Switch.class);
            assertNotNull(control);

            ShadowToast.reset();
            synchronized (FeatureGateLabUndo.class) {
                control.performClick();
                activity.getFragmentManager().beginTransaction().remove(detail).commit();
                activity.getFragmentManager().executePendingTransactions();
                assertNull(detail.getActivity());
            }
            FeatureGateDetailFragment.awaitChangesForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            assertTrue(FeatureGateLabStore.rule("abmock", entry.key, "INT").enabled);
            assertEquals("Feature gate override saved", ShadowToast.getTextOfLatestToast());
        }
    }

    @Test public void rapidDetailChangesStayOrderedAndShareOneUndoPoint() throws Exception {
        for (boolean firstFails : new boolean[]{false, true, false}) {
            try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
                Activity activity = owner.get();
                Utils.setContext(activity);
                FeatureGateLabStore.resetAllLabData();
                FeatureGateLabStore.setMasterEnabled(true);
                var entry = new FeatureGateCatalog.Entry("ordered_gate", "Ordered gate", "abmock",
                        "INT", true, true, List.of("0", "1", "2"), List.of(), List.of(), "", "",
                        true, "0", "INT");
                var cached = FeatureGateCatalog.class.getDeclaredField("cachedSnapshot");
                cached.setAccessible(true);
                cached.set(null, new FeatureGateCatalog.Snapshot(
                        List.of(entry), Map.of(entry.identity(), entry), 0, 0, true));
                FeatureGateLabUndo.saveRule("abmock", entry.key, entry.type, "0", true);

                FeatureGateDetailFragment detail = FeatureGateDetailFragment.forEntry(
                        entry.manager, entry.key, entry.type);
                attach(activity, detail);
                Spinner values = find(detail.getView(), Spinner.class);
                assertNotNull(values);
                var firstStarted = new java.util.concurrent.CountDownLatch(1);
                var releaseFirst = new java.util.concurrent.CountDownLatch(1);
                var secondFinished = new java.util.concurrent.CountDownLatch(1);
                FeatureGateDetailFragment.setDetailChangeTestHookForTests(
                        new FeatureGateDetailFragment.DetailChangeTestHook() {
                            @Override public void before(long generation) throws Exception {
                                if (generation != 1) return;
                                firstStarted.countDown();
                                if (!releaseFirst.await(2, java.util.concurrent.TimeUnit.SECONDS)) {
                                    throw new AssertionError("the delayed save was not released");
                                }
                                if (firstFails) throw new java.io.IOException("delayed first save failed");
                            }

                            @Override public void after(long generation) {
                                if (generation == 2) secondFinished.countDown();
                            }
                        });

                boolean secondOvertookFirst = false;
                try {
                    ShadowToast.reset();
                    values.setSelection(1);
                    assertTrue("the first save did not reach its delay",
                            firstStarted.await(2, java.util.concurrent.TimeUnit.SECONDS));
                    values.setSelection(2);
                    secondOvertookFirst = secondFinished.await(
                            300, java.util.concurrent.TimeUnit.MILLISECONDS);
                } finally {
                    releaseFirst.countDown();
                    FeatureGateDetailFragment.awaitChangesForTests();
                    Shadows.shadowOf(Looper.getMainLooper()).idle();
                    FeatureGateDetailFragment.setDetailChangeTestHookForTests(null);
                }

                assertFalse("the second save ran around the delayed first save",
                        secondOvertookFirst);
                FeatureGateLabStore.Rule stored = FeatureGateLabStore.rule(
                        "abmock", entry.key, entry.type);
                assertNotNull(stored);
                assertEquals("the last tap did not win in storage", "2", stored.value);
                var ruleField = FeatureGateDetailFragment.class.getDeclaredField("rule");
                ruleField.setAccessible(true);
                assertEquals("a stale callback repainted the detail screen", "2",
                        ((FeatureGateLabStore.Rule) ruleField.get(detail)).value);
                assertEquals(2, values.getSelectedItemPosition());
                assertEquals("Feature gate override saved", ShadowToast.getTextOfLatestToast());

                FeatureGateLabUndo.undo();
                assertEquals("Undo did not restore the value from before both taps", "0",
                        FeatureGateLabStore.rule("abmock", entry.key, entry.type).value);
            }
        }
    }

    @Test public void rebuildingTheDetailViewDoesNotStackUpTheEditorsOrLeaveADialogUp() throws Exception {
        // This screen sits on a back stack, so its view is built again on a rotation, a font
        // scale change, a theme change, or a return from anything deeper. Every rebuild used to
        // append a second full set of field editors, so the text collected on save came from
        // fields nobody could see, and each of them pinned a destroyed hierarchy.
        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            FeatureGateLabStore.resetAllLabData();
            FeatureGateLabSession.begin();
            FeatureGateLabStore.setMasterEnabled(true);
            var entry = new FeatureGateCatalog.Entry("object_gate", "Object gate",
                    FeatureGateLabStore.MANAGER_SETTINGS_MANAGER, "OBJECT", true, true,
                    List.of(), List.of(), List.of(), "", "", false, null, null,
                    StructuredConfigControllerTest.Config.class.getName());
            var cached = FeatureGateCatalog.class.getDeclaredField("cachedSnapshot");
            cached.setAccessible(true);
            cached.set(null, new FeatureGateCatalog.Snapshot(
                    List.of(entry), Map.of(entry.identity(), entry), 0, 0, true));

            FeatureGateDetailFragment detail = FeatureGateDetailFragment.forEntry(
                    FeatureGateLabStore.MANAGER_SETTINGS_MANAGER, "object_gate", "OBJECT");
            attach(activity, detail);
            int editors = detail.objectEditorCountForTests();
            assertTrue("the screen built no field editors, so this proves nothing", editors > 0);

            for (int rebuild = 0; rebuild < 2; rebuild++) {
                activity.getFragmentManager().beginTransaction().detach(detail).commit();
                activity.getFragmentManager().executePendingTransactions();
                activity.getFragmentManager().beginTransaction().attach(detail).commit();
                activity.getFragmentManager().executePendingTransactions();
                Shadows.shadowOf(Looper.getMainLooper()).idle();
            }

            assertEquals("the editors from the earlier views are still in the list",
                    editors, detail.objectEditorCountForTests());
        }
    }

    @Test @Config(fontScale = 1f)
    public void structuredEditorsHaveOneUniqueNamedInputAtNormalTextSize() throws Exception {
        assertStructuredEditorsAreNamed(1f);
    }

    @Test @Config(fontScale = 2f)
    public void structuredEditorsHaveOneUniqueNamedInputAtDoubleTextSize() throws Exception {
        assertStructuredEditorsAreNamed(2f);
    }

    @Test @Config(fontScale = 1f)
    public void structuredBooleanFieldsHaveOneNamedSwitchAtNormalTextSize() throws Exception {
        assertStructuredTogglesAreNamed(1f);
    }

    @Test @Config(fontScale = 2f)
    public void structuredBooleanFieldsHaveOneNamedSwitchAtDoubleTextSize() throws Exception {
        assertStructuredTogglesAreNamed(2f);
    }

    /**
     * A generated Boolean field used to leave three labels in traversal for one value: the
     * readable title, the raw field name, and the raw field name again as the Switch's content
     * description. The text fields beside it had already been reduced to one named editor.
     */
    private static void assertStructuredTogglesAreNamed(float expectedScale) throws Exception {
        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            assertEquals(expectedScale,
                    activity.getResources().getConfiguration().fontScale, 0.01f);
            FeatureGateLabStore.resetAllLabData();
            FeatureGateLabSession.begin();
            FeatureGateLabStore.setMasterEnabled(true);
            var entry = new FeatureGateCatalog.Entry("boolean_gate", "Boolean gate",
                    FeatureGateLabStore.MANAGER_SETTINGS_MANAGER, "OBJECT", true, true,
                    List.of(), List.of(), List.of(), "", "", false, null, null,
                    StructuredConfigControllerTest.TwoBooleans.class.getName());
            var cached = FeatureGateCatalog.class.getDeclaredField("cachedSnapshot");
            cached.setAccessible(true);
            cached.set(null, new FeatureGateCatalog.Snapshot(
                    List.of(entry), Map.of(entry.identity(), entry), 0, 0, true));

            FeatureGateDetailFragment detail = FeatureGateDetailFragment.forEntry(
                    FeatureGateLabStore.MANAGER_SETTINGS_MANAGER, "boolean_gate", "OBJECT");
            attach(activity, detail);
            java.util.List<Switch> all = new java.util.ArrayList<>();
            collectSwitches(detail.getView(), all);
            // The page carries the gate's own master switch too. A generated field row is a
            // title, a raw name and the control, in that order, which is what separates them.
            java.util.List<Switch> toggles = new java.util.ArrayList<>();
            for (Switch candidate : all) {
                ViewGroup parent = (ViewGroup) candidate.getParent();
                if (parent.getChildCount() >= 3
                        && parent.getChildAt(0) instanceof TextView
                        && parent.getChildAt(1) instanceof TextView
                        && parent.getChildAt(2) == candidate) {
                    toggles.add(candidate);
                }
            }
            assertEquals("the fixture did not build one switch per Boolean field",
                    2, toggles.size());

            java.util.Set<Integer> ids = new java.util.HashSet<>();
            java.util.Set<String> names = new java.util.HashSet<>();
            for (Switch toggle : toggles) {
                ViewGroup field = (ViewGroup) toggle.getParent();
                TextView label = (TextView) field.getChildAt(0);
                TextView technical = (TextView) field.getChildAt(1);

                assertNotEquals("a generated switch has no address for its label",
                        View.NO_ID, toggle.getId());
                assertTrue("two generated switches share the same view id", ids.add(toggle.getId()));
                assertEquals("the field label is not connected to its switch",
                        toggle.getId(), label.getLabelFor());
                assertEquals("the field label is a second accessibility stop",
                        View.IMPORTANT_FOR_ACCESSIBILITY_NO,
                        label.getImportantForAccessibility());
                assertEquals("the technical field label is a second accessibility stop",
                        View.IMPORTANT_FOR_ACCESSIBILITY_NO,
                        technical.getImportantForAccessibility());
                assertFalse(label.isFocusable());
                assertFalse(technical.isFocusable());
                assertNull("a content description replaced what the switch reports",
                        toggle.getContentDescription());

                android.view.accessibility.AccessibilityNodeInfo node =
                        toggle.createAccessibilityNodeInfo();
                assertEquals("the generated switch stopped announcing itself as a switch",
                        Switch.class.getName(), node.getClassName());
                assertNull(node.getContentDescription());
                String spokenName = String.valueOf(node.getText());
                assertTrue("the node omits the readable field name",
                        spokenName.contains(label.getText()));
                assertTrue("the node omits the exact field identifier or required type",
                        spokenName.contains(technical.getText()));
                assertTrue("two generated switches read the same", names.add(spokenName));
                assertEquals(toggle.isChecked(), node.isChecked());
                assertTrue(node.isEnabled());
                assertEquals("the switch lost its click action", 1, node.getActionList().stream()
                        .filter(action -> action.getId() == android.view.accessibility
                                .AccessibilityNodeInfo.ACTION_CLICK)
                        .count());

                // The state has to survive being switched and being disabled, which is where a
                // content description would have frozen the old value in place.
                toggle.setChecked(!toggle.isChecked());
                assertEquals(toggle.isChecked(),
                        toggle.createAccessibilityNodeInfo().isChecked());
                toggle.setEnabled(false);
                android.view.accessibility.AccessibilityNodeInfo disabled =
                        toggle.createAccessibilityNodeInfo();
                assertFalse(disabled.isEnabled());
                assertEquals(spokenName, String.valueOf(disabled.getText()));
            }
            assertEquals("the two Boolean fields do not read differently", 2, names.size());
        }
    }

    private static void collectSwitches(View view, java.util.List<Switch> found) {
        if (view instanceof Switch) {
            found.add((Switch) view);
        } else if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                collectSwitches(group.getChildAt(index), found);
            }
        }
    }

    private static void assertStructuredEditorsAreNamed(float expectedScale) throws Exception {
        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            assertEquals(expectedScale,
                    activity.getResources().getConfiguration().fontScale, 0.01f);
            FeatureGateLabStore.resetAllLabData();
            FeatureGateLabSession.begin();
            FeatureGateLabStore.setMasterEnabled(true);
            var entry = new FeatureGateCatalog.Entry("object_gate", "Object gate",
                    FeatureGateLabStore.MANAGER_SETTINGS_MANAGER, "OBJECT", true, true,
                    List.of(), List.of(), List.of(), "", "", false, null, null,
                    StructuredConfigControllerTest.Config.class.getName());
            var cached = FeatureGateCatalog.class.getDeclaredField("cachedSnapshot");
            cached.setAccessible(true);
            cached.set(null, new FeatureGateCatalog.Snapshot(
                    List.of(entry), Map.of(entry.identity(), entry), 0, 0, true));

            FeatureGateDetailFragment detail = FeatureGateDetailFragment.forEntry(
                    FeatureGateLabStore.MANAGER_SETTINGS_MANAGER, "object_gate", "OBJECT");
            attach(activity, detail);
            java.util.List<EditText> inputs = new java.util.ArrayList<>();
            collect(detail.getView(), inputs);
            assertTrue("the fixture built no structured text inputs", inputs.size() > 1);
            java.util.Set<Integer> ids = new java.util.HashSet<>();

            for (EditText input : inputs) {
                ViewGroup field = (ViewGroup) input.getParent();
                TextView label = (TextView) field.getChildAt(0);
                TextView technical = (TextView) field.getChildAt(1);
                assertNotEquals("a structured input has no address for its label",
                        View.NO_ID, input.getId());
                assertTrue("two structured inputs share the same view id", ids.add(input.getId()));
                assertEquals("the field label is not connected to its input",
                        input.getId(), label.getLabelFor());
                assertEquals("the field label is a second accessibility stop",
                        View.IMPORTANT_FOR_ACCESSIBILITY_NO,
                        label.getImportantForAccessibility());
                assertEquals("the technical field label is a second accessibility stop",
                        View.IMPORTANT_FOR_ACCESSIBILITY_NO,
                        technical.getImportantForAccessibility());
                assertFalse(label.isFocusable());
                assertFalse(technical.isFocusable());
                assertTrue(input.isFocusable());
                assertNull("the accessible name replaced the structured value",
                        input.getContentDescription());

                android.view.accessibility.AccessibilityNodeInfo node =
                        input.createAccessibilityNodeInfo();
                String spokenName = String.valueOf(node.getHintText());
                assertTrue("the node omits the readable field name",
                        spokenName.contains(label.getText()));
                assertTrue("the node omits the exact field identifier or required type",
                        spokenName.contains(technical.getText()));
                assertEquals(input.getText().toString(), String.valueOf(node.getText()));
                assertEquals(input.getInputType(), node.getInputType());
                assertTrue(node.isEditable());
                assertTrue(node.isEnabled());
                assertNull(node.getContentDescription());

                input.setEnabled(false);
                android.view.accessibility.AccessibilityNodeInfo disabled =
                        input.createAccessibilityNodeInfo();
                assertFalse(disabled.isEnabled());
                assertEquals(input.getText().toString(), String.valueOf(disabled.getText()));
                assertEquals(input.getInputType(), disabled.getInputType());
                assertEquals(spokenName, String.valueOf(disabled.getHintText()));
            }
        }
    }

    private static void collect(View view, java.util.List<EditText> found) {
        if (view instanceof EditText) {
            found.add((EditText) view);
        } else if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                collect(group.getChildAt(index), found);
            }
        }
    }

    @Test public void enablingAnArrayOverrideKeepsItsGeneratedValues() throws Exception {
        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            FeatureGateDetailFragment detail = arrayDetail(owner.get(), false, null);
            EditText editor = find(detail.getView(), EditText.class);
            assertNotNull(editor);
            assertEquals("analytics.us.tiktok.com", editor.getText().toString());

            Switch force = find(detail.getView(), Switch.class);
            assertFalse(force.isChecked());
            force.performClick();
            FeatureGateDetailFragment.awaitChangesForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            FeatureGateLabStore.Rule saved = FeatureGateLabStore.rule(
                    FeatureGateLabStore.MANAGER_SETTINGS_MANAGER, "ad_gaid_whitelist", "OBJECT");
            assertNotNull(saved);
            assertTrue(saved.enabled);
            org.json.JSONArray values = new org.json.JSONObject(saved.value).getJSONArray("$value");
            assertEquals(1, values.length());
            assertEquals("analytics.us.tiktok.com", values.getString(0));
        }
    }

    @Test public void savingAnArrayOverrideKeepsTheLoadedValuesAheadOfItsDefaults() throws Exception {
        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            FeatureGateDetailFragment detail = arrayDetail(owner.get(), true,
                    "[\"account.one\",\"account.two\"]");
            EditText editor = find(detail.getView(), EditText.class);
            assertNotNull(editor);
            assertEquals("account.one\naccount.two", editor.getText().toString());

            TextView save = findText(detail.getView(), "Save field values");
            assertNotNull(save);
            assertButtonRole(save);
            ShadowToast.reset();
            save.performClick();
            FeatureGateDetailFragment.awaitChangesForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            FeatureGateLabStore.Rule saved = FeatureGateLabStore.rule(
                    FeatureGateLabStore.MANAGER_SETTINGS_MANAGER, "ad_gaid_whitelist", "OBJECT");
            assertNotNull(saved);
            assertFalse("saving fields must not enable the override", saved.enabled);
            org.json.JSONArray values = new org.json.JSONObject(saved.value).getJSONArray("$value");
            assertEquals(2, values.length());
            assertEquals("account.one", values.getString(0));
            assertEquals("account.two", values.getString(1));
            assertEquals("Feature gate override saved", ShadowToast.getTextOfLatestToast());
        }
    }

    private static void assertButtonRole(TextView view) {
        assertNotNull(view);
        assertEquals(android.widget.Button.class.getName(),
                view.createAccessibilityNodeInfo().getClassName());
    }

    private static FeatureGateDetailFragment arrayDetail(Activity activity, boolean loaded,
                                                         String currentValue) throws Exception {
        Utils.setContext(activity);
        FeatureGateLabStore.resetAllLabData();
        FeatureGateLabSession.begin();
        FeatureGateLabStore.setMasterEnabled(true);
        // The generated 46.2.3 catalogue declares this real gate as a String[] with this default.
        var entry = new FeatureGateCatalog.Entry("ad_gaid_whitelist", "Ad Gaid Whitelist",
                FeatureGateLabStore.MANAGER_SETTINGS_MANAGER, "OBJECT", true, true,
                List.of("[\"analytics.us.tiktok.com\"]"), List.of(), List.of(), "", "",
                loaded, currentValue, loaded ? "JSON" : null, String[].class.getName());
        var cached = FeatureGateCatalog.class.getDeclaredField("cachedSnapshot");
        cached.setAccessible(true);
        cached.set(null, new FeatureGateCatalog.Snapshot(
                List.of(entry), Map.of(entry.identity(), entry), 0, 0, true));
        FeatureGateDetailFragment detail = FeatureGateDetailFragment.forEntry(
                entry.manager, entry.key, entry.type);
        attach(activity, detail);
        return detail;
    }

    private static TextView findText(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) {
            return (TextView) view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                TextView found = findText(group.getChildAt(index), text);
                if (found != null) return found;
            }
        }
        return null;
    }

    /**
     * The chevron on the value spinner is a compound drawable, and a compound drawable is only
     * turned round when the view it hangs off resolves its own layout direction. An adapter
     * hands its row back before anything attaches it, so on an Arabic or Hebrew phone the
     * arrow sat at the reading end of the row still pointing the other way.
     */
    @Test @Config(sdk = 23, qualifiers = "ar-rEG-ldrtl-w480dp-h960dp-night-mdpi")
    public void theValueSpinnersChevronTurnsRoundForARightToLeftReader() throws Exception {
        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            assertEquals("the fixture is not a right to left screen, so this proves nothing",
                    View.LAYOUT_DIRECTION_RTL,
                    activity.getResources().getConfiguration().getLayoutDirection());
            FeatureGateLabStore.resetAllLabData();
            FeatureGateLabSession.begin();
            FeatureGateLabStore.setMasterEnabled(true);
            var entry = new FeatureGateCatalog.Entry("rtl_gate", "Rtl gate", "abmock", "INT",
                    true, true, List.of(), List.of(), List.of(), "", "", false, null, null);
            var cached = FeatureGateCatalog.class.getDeclaredField("cachedSnapshot");
            cached.setAccessible(true);
            cached.set(null, new FeatureGateCatalog.Snapshot(
                    List.of(entry), Map.of(entry.identity(), entry), 0, 0, true));

            attach(activity, FeatureGateDetailFragment.forEntry("abmock", "rtl_gate", "INT"));
            Spinner values = find(
                    activity.getFragmentManager().findFragmentById(android.R.id.content).getView(),
                    Spinner.class);
            assertNotNull("the detail screen has no value spinner, so this proves nothing", values);
            View row = values.getAdapter().getView(0, null, values);
            android.graphics.drawable.Drawable chevron =
                    ((TextView) row).getCompoundDrawablesRelative()[2];
            assertNotNull("the spinner row carries no chevron, so this proves nothing", chevron);
            assertEquals("the chevron points the way a left to right reader reads",
                    View.LAYOUT_DIRECTION_RTL, chevron.getLayoutDirection());
        }
    }

    private static void attach(Activity activity, Fragment fragment) {
        activity.getFragmentManager().beginTransaction().replace(android.R.id.content, fragment).commit();
        activity.getFragmentManager().executePendingTransactions();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }
    private static <T extends View> T find(View view, Class<T> type) {
        if (type.isInstance(view)) return type.cast(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                T found = find(group.getChildAt(i), type);
                if (found != null) return found;
            }
        }
        return null;
    }
}
