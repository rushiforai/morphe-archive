package app.morphe.extension.tiktok.settings.preference;

import static org.junit.Assert.*;

import android.app.Activity;
import android.os.Bundle;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.L10n;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, qualifiers = "en-w360dp-h800dp-mdpi")
@LooperMode(LooperMode.Mode.PAUSED)
@SuppressWarnings("deprecation")
public class SettingsExpandablePreferenceTest {
    private ActivityController<Activity> owner;
    private Activity activity;
    private PreferenceScreen screen;
    private ListView list;
    private SettingsListAdapter adapter;

    public static class HostFragment extends PreferenceFragment {
        @Override public void onCreate(Bundle state) {
            super.onCreate(state);
            getPreferenceManager().setSharedPreferencesName("expandable_menu_test");
            setPreferenceScreen(getPreferenceManager().createPreferenceScreen(getActivity()));
        }
    }

    @Before public void prepare() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        owner = Robolectric.buildActivity(Activity.class).setup().visible();
        activity = owner.get();
        HostFragment fragment = new HostFragment();
        activity.getFragmentManager().beginTransaction()
                .replace(android.R.id.content, fragment).commit();
        activity.getFragmentManager().executePendingTransactions();
        screen = fragment.getPreferenceScreen();
        screen.getSharedPreferences().edit().clear().commit();
        list = fragment.getView().findViewById(android.R.id.list);
    }

    @After public void close() {
        if (adapter != null) adapter.dispose();
        if (screen != null) screen.getSharedPreferences().edit().clear().commit();
        if (owner != null) owner.pause().stop().destroy();
    }

    @Test public void nativeClicksKeepTheSameControlAndSavedValueAcrossCollapse() {
        SwitchPreference[] child = {null};
        int[] opened = {0};
        SettingsMenuPreference group = menu(preference -> {
            SettingsMenuPreference section = (SettingsMenuPreference) preference;
            if (child[0] == null) {
                child[0] = new SwitchPreference(activity);
                child[0].setKey("retained_switch");
                child[0].setTitle("Retained switch");
                section.addPreference(child[0]);
            }
            section.setExpanded(!section.isExpanded());
            return true;
        });
        SettingsMenuPreference link = new SettingsMenuPreference(activity, "Report a problem", "",
                SettingsMenuPreference.Icon.REPORT, preference -> { opened[0]++; return true; });
        link.setKey("ordinary_link");
        link.setCompact(true);
        show(group, link);
        assertEquals(2, screen.getRootAdapter().getCount());

        click(0);
        assertEquals(3, screen.getRootAdapter().getCount());
        assertSame(child[0], screen.getRootAdapter().getItem(1));
        click(1);
        assertTrue(child[0].isChecked());
        assertTrue(screen.getSharedPreferences().getBoolean("retained_switch", false));

        click(0);
        assertFalse(group.isExpanded());
        assertEquals(2, list.getCount());
        assertSame(group, list.getItemAtPosition(0));
        assertSame(link, list.getItemAtPosition(1));
        assertSame(child[0], screen.findPreference("retained_switch"));
        assertSame(group, child[0].getParent());
        click(1);
        assertEquals("the collapsed child stole the following link's click", 1, opened[0]);
        assertTrue(child[0].isChecked());

        click(0);
        assertSame(child[0], list.getItemAtPosition(1));
        assertTrue(child[0].isChecked());
        assertTrue(screen.getSharedPreferences().getBoolean("retained_switch", false));
    }

    @Test public void accessibilityExpandsThroughTheSameLazyClickListener() {
        int[] calls = {0};
        int[] longPresses = {0};
        list.setOnItemLongClickListener((parent, row, position, id) -> {
            longPresses[0]++;
            return true;
        });
        SettingsMenuPreference group = menu(preference -> {
            calls[0]++;
            SettingsMenuPreference section = (SettingsMenuPreference) preference;
            if (section.getPreferenceCount() == 0) {
                Preference child = new Preference(activity);
                child.setKey("lazy_child");
                child.setTitle("Lazy child");
                section.addPreference(child);
            }
            section.setExpanded(!section.isExpanded());
            return true;
        });
        show(group);
        View row = visible(0);
        AccessibilityNodeInfo closed = row.createAccessibilityNodeInfo();
        assertEquals(Button.class.getName(), closed.getClassName());
        assertTrue(closed.isHeading());
        assertEquals(L10n.t(activity, "Collapsed"), closed.getStateDescription());
        assertTrue("the parent must offer long presses to exercise cleanup", list.isLongClickable());
        assertFalse(closed.isLongClickable());
        assertFalse(hasAction(closed, AccessibilityNodeInfo.ACTION_LONG_CLICK));
        assertFalse(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_LONG_CLICK, null));
        assertTrue(hasAction(closed, AccessibilityNodeInfo.ACTION_CLICK));
        assertTrue(hasAction(closed, AccessibilityNodeInfo.ACTION_EXPAND));
        assertFalse(hasAction(closed, AccessibilityNodeInfo.ACTION_COLLAPSE));
        assertTrue(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_EXPAND, null));
        settle();
        assertEquals(1, calls[0]);
        assertEquals(2, list.getCount());
        assertNotNull(screen.findPreference("lazy_child"));

        row = visible(0);
        AccessibilityNodeInfo open = row.createAccessibilityNodeInfo();
        assertEquals(L10n.t(activity, "Expanded"), open.getStateDescription());
        assertFalse(open.isLongClickable());
        assertFalse(hasAction(open, AccessibilityNodeInfo.ACTION_LONG_CLICK));
        assertFalse(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_LONG_CLICK, null));
        assertEquals(0, longPresses[0]);
        assertTrue(hasAction(open, AccessibilityNodeInfo.ACTION_CLICK));
        assertTrue(hasAction(open, AccessibilityNodeInfo.ACTION_COLLAPSE));
        assertFalse(hasAction(open, AccessibilityNodeInfo.ACTION_EXPAND));
        assertFalse(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_EXPAND, null));
        assertTrue(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_COLLAPSE, null));
        settle();
        assertEquals(2, calls[0]);
        assertEquals(1, list.getCount());

        group.setEnabled(false);
        settle();
        row = visible(0);
        assertFalse(hasAction(row.createAccessibilityNodeInfo(), AccessibilityNodeInfo.ACTION_EXPAND));
        assertFalse(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_EXPAND, null));
        assertEquals(2, calls[0]);
    }

    @Test public void accessibilityDoesNotBypassAListenerThatKeepsTheSectionClosed() {
        int[] calls = {0};
        SettingsMenuPreference group = menu(preference -> { calls[0]++; return true; });
        show(group);
        assertTrue(visible(0).performAccessibilityAction(AccessibilityNodeInfo.ACTION_EXPAND, null));
        assertEquals(1, calls[0]);
        assertFalse(group.isExpanded());
        assertEquals(1, list.getCount());
    }

    @Test @Config(sdk = 23)
    public void olderAndroidExposesHeadingStateAndExpansionAction() {
        SettingsMenuPreference group = menu(preference -> {
            ((SettingsMenuPreference) preference).setExpanded(true);
            return true;
        });
        show(group);
        AccessibilityNodeInfo info = visible(0).createAccessibilityNodeInfo();
        assertNotNull(info.getCollectionItemInfo());
        assertTrue(info.getCollectionItemInfo().isHeading());
        assertTrue(info.getContentDescription().toString().endsWith(L10n.t(activity, "Collapsed")));
        assertTrue(visible(0).performAccessibilityAction(AccessibilityNodeInfo.ACTION_EXPAND, null));
        assertTrue(group.isExpanded());
    }

    @Test public void recycledOrdinaryLinkLosesExpansionSemantics() {
        SettingsMenuPreference group = menu(preference -> true);
        group.setExpanded(true);
        View row = group.getView(null, list);
        assertTrue(row.createAccessibilityNodeInfo().isHeading());
        assertNotNull(row.getStateDescription());
        SettingsMenuPreference link = new SettingsMenuPreference(activity, "Report a problem", "",
                SettingsMenuPreference.Icon.REPORT, preference -> true);
        link.setCompact(true);
        View reused = link.getView(row, list);
        assertSame(row, reused);
        AccessibilityNodeInfo info = reused.createAccessibilityNodeInfo();
        assertFalse(info.isHeading());
        assertNull(reused.getStateDescription());
        assertFalse(hasAction(info, AccessibilityNodeInfo.ACTION_EXPAND));
        assertFalse(hasAction(info, AccessibilityNodeInfo.ACTION_COLLAPSE));
        assertFalse(reused.performAccessibilityAction(AccessibilityNodeInfo.ACTION_EXPAND, null));
    }

    @Test @Config(qualifiers = "de-rDE-w320dp-h800dp-mdpi", fontScale = 2.0f)
    public void expandedGermanRowKeepsItsWholeTextAndTouchTarget() {
        SettingsMenuPreference group = new SettingsMenuPreference(activity, "Backup and restore",
                "Save, restore, reset and undo your settings", SettingsMenuPreference.Icon.BACKUP,
                preference -> true);
        group.setCompact(true);
        group.setExpandable(true);
        group.setExpanded(true);
        View row = group.getView(null, list);
        SettingsUi.styleCompactMenuRow(row, false);
        int width = SettingsUi.dp(activity, 320);
        row.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        row.layout(0, 0, width, row.getMeasuredHeight());
        assertTrue(row.getHeight() >= SettingsUi.dp(activity, 48));
        assertEquals("Sichern und wiederherstellen", group.getTitle());
        for (int id : new int[]{android.R.id.title, android.R.id.summary}) {
            TextView text = row.findViewById(id);
            assertNotNull(text.getLayout());
            assertTrue(text.getHeight() >= text.getLayout().getHeight()
                    + text.getCompoundPaddingTop() + text.getCompoundPaddingBottom());
            for (int line = 0; line < text.getLineCount(); line++) {
                assertEquals(0, text.getLayout().getEllipsisCount(line));
            }
            for (View child = text; child != row; child = (View) child.getParent()) {
                ViewGroup parent = (ViewGroup) child.getParent();
                assertTrue(child.getLeft() >= 0);
                assertTrue(child.getRight() <= parent.getWidth());
            }
        }
    }

    private SettingsMenuPreference menu(Preference.OnPreferenceClickListener listener) {
        SettingsMenuPreference group = new SettingsMenuPreference(activity, "Playback",
                "Quality, speed and auto-advance", SettingsMenuPreference.Icon.PLAYBACK, listener);
        group.setKey("section_playback");
        group.setCompact(true);
        group.setExpandable(true);
        return group;
    }

    private void show(Preference... preferences) {
        for (Preference preference : preferences) screen.addPreference(preference);
        settle();
        adapter = new SettingsListAdapter(screen.getRootAdapter());
        list.setAdapter(adapter);
        settle();
    }

    private void click(int position) {
        assertTrue(list.performItemClick(visible(position), position, list.getItemIdAtPosition(position)));
        settle();
    }

    private View visible(int position) {
        View row = list.getChildAt(position - list.getFirstVisiblePosition());
        assertNotNull("the preference is not visible", row);
        return row;
    }

    private void settle() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        View root = activity.findViewById(android.R.id.content);
        int width = activity.getResources().getDisplayMetrics().widthPixels;
        root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(SettingsUi.dp(activity, 800), View.MeasureSpec.EXACTLY));
        root.layout(0, 0, root.getMeasuredWidth(), root.getMeasuredHeight());
    }

    private static boolean hasAction(AccessibilityNodeInfo info, int action) {
        for (AccessibilityNodeInfo.AccessibilityAction candidate : info.getActionList()) {
            if (candidate.getId() == action) return true;
        }
        return false;
    }
}
