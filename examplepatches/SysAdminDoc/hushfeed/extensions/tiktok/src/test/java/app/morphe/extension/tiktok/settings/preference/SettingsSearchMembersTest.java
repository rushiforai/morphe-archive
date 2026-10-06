package app.morphe.extension.tiktok.settings.preference;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.FragmentManager;
import android.os.Bundle;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.view.View;
import android.widget.ListView;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
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
import org.robolectric.shadows.ShadowAlertDialog;

/**
 * A checklist row's summary names only the boxes that are ticked, so the search index, which
 * reads titles and summaries, could not find an unticked box at all: "counts" answered nothing
 * while Counts under the buttons sat clear inside the Right column row. Every box is a result
 * now, and opening one opens that row's dialog on that box without touching its value.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
@SuppressWarnings("deprecation")
public class SettingsSearchMembersTest {
    private static final String ROW = "Hide buttons in the right column";
    private static final String[] LABELS = {"Avatar and follow button", "Like", "Comments", "Save",
            "Share", "Music disc", "Counts under the buttons"};

    /** The boxes in dialog order. A method, not a field: Settings loads only once setUp has
     *  given Utils its context. */
    private static BooleanSetting[] boxes() {
        return new BooleanSetting[]{Settings.HIDE_RAIL_FOLLOW, Settings.HIDE_RAIL_LIKE,
                Settings.HIDE_RAIL_COMMENTS, Settings.HIDE_RAIL_FAVOURITE, Settings.HIDE_RAIL_SHARE,
                Settings.HIDE_RAIL_MUSIC, Settings.HIDE_RAIL_COUNTS};
    }

    private final Map<Field, Boolean> statuses = new LinkedHashMap<>();
    private ActivityController<Activity> owner;

    @Before public void setUp() throws Exception {
        Utils.setContext(RuntimeEnvironment.getApplication());
        for (Field field : SettingsStatus.class.getDeclaredFields()) {
            if (field.getType() == boolean.class && Modifier.isStatic(field.getModifiers())) {
                field.setAccessible(true);
                statuses.put(field, field.getBoolean(null));
                field.setBoolean(null, true);
            }
        }
        for (BooleanSetting box : boxes()) box.resetToDefault();
    }

    @After public void tearDown() throws Exception {
        if (owner != null) owner.pause().stop().destroy();
        for (BooleanSetting box : boxes()) box.resetToDefault();
        for (Map.Entry<Field, Boolean> entry : statuses.entrySet()) {
            entry.getKey().setBoolean(null, entry.getValue());
        }
        statuses.clear();
    }

    @Test public void everyBoxTickedOrNotOpensOnItselfAndBackReturnsToTheResults() throws Exception {
        // Two ticked and five clear, so both states are searched for.
        Settings.HIDE_RAIL_LIKE.save(true);
        Settings.HIDE_RAIL_SHARE.save(true);
        List<Boolean> saved = values();

        for (int box = 0; box < LABELS.length; box++) {
            TikTokPreferenceFragment search = attachSearch();
            Preference result = memberResult(search, LABELS[box], ROW);
            assertNotNull("searching \"" + LABELS[box] + "\" did not find its box", result);
            assertTrue(result.getOnPreferenceClickListener().onPreferenceClick(result));
            settle();

            FragmentManager manager = owner.get().getFragmentManager();
            TikTokPreferenceFragment page =
                    (TikTokPreferenceFragment) manager.findFragmentById(android.R.id.content);
            assertEquals("the box did not open the Feed screen page",
                    "INTERFACE", page.getArguments().getString("morphe_settings_section"));
            AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
            assertNotNull("opening " + LABELS[box] + " opened no dialog", dialog);
            assertTrue("the checklist is not showing for " + LABELS[box], dialog.isShowing());
            assertEquals(ROW, Shadows.shadowOf(dialog).getTitle().toString());

            // Short enough to scroll: the last boxes are in sight only if the dialog moved to them.
            ListView list = layOut(dialog.getListView());
            assertTrue(LABELS[box] + " was scrolled out of sight: rows "
                            + list.getFirstVisiblePosition() + " to " + list.getLastVisiblePosition(),
                    list.getFirstVisiblePosition() <= box && box <= list.getLastVisiblePosition());
            for (int other = list.getFirstVisiblePosition(); other <= list.getLastVisiblePosition(); other++) {
                assertEquals("the dialog shows a box other than as saved",
                        saved.get(other), list.isItemChecked(other));
            }
            assertEquals("opening a box changed a setting", saved, values());

            dialog.cancel();
            settle();
            assertTrue("Back did not return to the results", manager.popBackStackImmediate());
            settle();
            assertTrue(((TikTokPreferenceFragment) manager.findFragmentById(android.R.id.content))
                    .getArguments().getBoolean("morphe_settings_search"));
            assertEquals("leaving the box changed a setting", saved, values());
            owner.pause().stop().destroy();
            owner = null;
        }
    }

    @Test public void theRowTitleStillFindsTheRowAloneAndItsSummaryIsUnchanged() throws Exception {
        Settings.HIDE_RAIL_SHARE.save(true);
        TikTokPreferenceFragment search = attachSearch();
        List<String> titles = search(search, "hide buttons in the right");
        assertEquals("the row's title listed its boxes as well: " + titles, List.of(ROW), titles);
        Preference row = memberResult(search, ROW, "Feed screen");
        assertNotNull(row);
        assertTrue("the row's summary no longer says what is hidden: " + row.getSummary(),
                row.getSummary().toString().endsWith("Hidden: Share"));
    }

    @Test public void aBoxOfAnAbsentPatchIsNotFound() throws Exception {
        // The Right column row exists only with the video overlays patch.
        statusField("videoOverlaysEnabled").setBoolean(null, false);
        TikTokPreferenceFragment search = attachSearch();
        assertEquals(null, memberResult(search, "Counts under the buttons", ROW));
    }

    @Test @Config(sdk = 28, qualifiers = "de")
    public void aTranslatedQueryFindsTheTranslatedBox() throws Exception {
        TikTokPreferenceFragment search = attachSearch();
        Preference result = memberResult(search, "Zahlen unter den Schaltflächen",
                "Schaltflächen in der rechten Spalte ausblenden");
        assertNotNull("the German box label was not searchable", result);
        assertTrue(result.getOnPreferenceClickListener().onPreferenceClick(result));
        settle();
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        assertTrue(dialog.isShowing());
        ListView list = layOut(dialog.getListView());
        assertTrue(list.getLastVisiblePosition() >= 6);
        assertFalse("the clear box opened ticked", list.isItemChecked(6));
    }

    @Test public void recreationKeepsAnOpenBoxDialogAndItsUnsavedTicks() throws Exception {
        TikTokPreferenceFragment search = attachSearch();
        Preference result = memberResult(search, "Counts under the buttons", ROW);
        assertTrue(result.getOnPreferenceClickListener().onPreferenceClick(result));
        settle();
        AlertDialog first = ShadowAlertDialog.getLatestAlertDialog();
        ListView list = layOut(first.getListView());
        list.performItemClick(null, 6, 6);
        assertTrue(list.isItemChecked(6));

        owner.recreate();
        settle();
        AlertDialog again = ShadowAlertDialog.getLatestAlertDialog();
        assertTrue("the recreated page dropped the open checklist", again != first && again.isShowing());
        assertTrue("the unsaved tick was lost", layOut(again.getListView()).isItemChecked(6));
        assertFalse("recreation saved an unsaved tick", Settings.HIDE_RAIL_COUNTS.savedValue());

        again.cancel();
        settle();
        owner.recreate();
        settle();
        assertSame("a dialog closed before recreation came back",
                again, ShadowAlertDialog.getLatestAlertDialog());
        assertFalse(Settings.HIDE_RAIL_COUNTS.savedValue());
    }

    private static List<Boolean> values() {
        List<Boolean> values = new ArrayList<>();
        for (BooleanSetting box : boxes()) values.add(box.savedValue());
        return values;
    }

    private static Field statusField(String name) throws Exception {
        Field field = SettingsStatus.class.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    /** Short enough that the last boxes start out of sight, as on a phone with large text. */
    private static ListView layOut(ListView list) {
        list.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(260, View.MeasureSpec.EXACTLY));
        list.layout(0, 0, 1080, 260);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        return list;
    }

    private void settle() {
        if (owner != null) owner.get().getFragmentManager().executePendingTransactions();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    /** The result row titled {@code title} whose second line names {@code context}. */
    private static Preference memberResult(TikTokPreferenceFragment search, String title,
            String context) throws Exception {
        search(search, title);
        PreferenceScreen screen = search.getPreferenceScreen();
        for (int index = 0; index < screen.getPreferenceCount(); index++) {
            Preference row = screen.getPreference(index);
            if (row.getTitle() != null && title.contentEquals(row.getTitle())
                    && row.getSummary() != null && row.getSummary().toString().contains(context)) {
                return row;
            }
        }
        return null;
    }

    private static List<String> search(TikTokPreferenceFragment fragment, String query)
            throws Exception {
        Method update = TikTokPreferenceFragment.class.getDeclaredMethod("updateSearchResults", String.class);
        update.setAccessible(true);
        update.invoke(fragment, query);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        // The result rows only, not the header and field above them.
        Field rows = TikTokPreferenceFragment.class.getDeclaredField("searchRows");
        rows.setAccessible(true);
        List<String> titles = new ArrayList<>();
        for (Object row : (List<?>) rows.get(fragment)) {
            Preference result = (Preference) row;
            if (result.isSelectable()) titles.add(String.valueOf(result.getTitle()));
        }
        return titles;
    }

    private TikTokPreferenceFragment attachSearch() {
        owner = Robolectric.buildActivity(Activity.class).setup().visible();
        Activity activity = owner.get();
        TikTokPreferenceFragment fragment = new TikTokPreferenceFragment();
        Bundle arguments = new Bundle();
        arguments.putBoolean("morphe_settings_search", true);
        fragment.setArguments(arguments);
        activity.getFragmentManager().beginTransaction()
                .replace(android.R.id.content, fragment)
                .addToBackStack("search")
                .commit();
        settle();
        return fragment;
    }
}
