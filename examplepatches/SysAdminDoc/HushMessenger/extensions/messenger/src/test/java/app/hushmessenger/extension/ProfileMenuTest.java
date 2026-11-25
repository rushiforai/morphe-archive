package app.hushmessenger.extension;

import android.content.Context;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.PopupMenu;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class ProfileMenuTest {
    /** Messenger's popup base keeps the menu, and the popup the hook receives extends it. */
    static class PopupBase {
        private final Menu menu;

        PopupBase(Menu menu) {
            this.menu = menu;
        }
    }

    static final class Popup extends PopupBase {
        final String anchor = "picture";

        Popup(Menu menu) {
            super(menu);
        }
    }

    static final class TwoMenus extends PopupBase {
        private final Menu other;

        TwoMenus(Menu menu, Menu other) {
            super(menu);
            this.other = other;
        }
    }

    private Context context;

    @Before public void reset() {
        context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().putBoolean(ProfileMenu.KEY, true).commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
    }

    private Menu menu(String... titles) {
        Menu menu = new PopupMenu(context, new View(context)).getMenu();
        for (int i = 0; i < titles.length; i++) menu.add(0, i, i, titles[i]);
        return menu;
    }

    private static List<String> shown(Menu menu) {
        List<String> titles = new ArrayList<>();
        for (int i = 0; i < menu.size(); i++) if (menu.getItem(i).isVisible()) titles.add(menu.getItem(i).getTitle().toString());
        return titles;
    }

    private List<String> show(String... titles) {
        Menu menu = menu(titles);
        ProfileMenu.showing(new Popup(menu));
        return shown(menu);
    }

    @Test public void pickedItemsAreHiddenAndKeepTheirPlaceInTheMenu() {
        ProfileMenu.setHidden("Audio call", true);
        ProfileMenu.setHidden("Video call", true);
        Menu menu = menu("View profile", "Audio call", "Video call", "Block");
        ProfileMenu.showing(new Popup(menu));
        assertEquals(Arrays.asList("View profile", "Block"), shown(menu));
        // Messenger's listener runs a row by this id, so every row has to still be there with its own.
        assertEquals(4, menu.size());
        assertEquals("Video call", menu.getItem(2).getTitle().toString());
        assertEquals(2, menu.getItem(2).getItemId());
        assertTrue(Settings.activeAt.containsKey(ProfileMenu.KEY));
    }

    @Test public void theMenuIsNeverLeftEmpty() {
        ProfileMenu.setHidden("View profile", true);
        ProfileMenu.setHidden("Block", true);
        assertEquals(Arrays.asList("View profile", "Block"), show("View profile", "Block"));
    }

    @Test public void nothingPickedLeavesTheMenuAloneAndTheControlUnused() {
        assertEquals(Arrays.asList("View profile", "Block"), show("View profile", "Block"));
        assertFalse(Settings.activeAt.containsKey(ProfileMenu.KEY));
    }

    @Test public void offNothingIsHiddenOrRemembered() {
        ProfileMenu.setHidden("Block", true);
        Settings.preferences.edit().putBoolean(ProfileMenu.KEY, false).commit();
        assertEquals(Arrays.asList("View profile", "Block"), show("View profile", "Block"));
        assertTrue(ProfileMenu.seen().isEmpty());
        assertFalse(Settings.activeAt.containsKey(ProfileMenu.KEY));
    }

    @Test public void titlesAreRememberedOnceAndAnythingThatIsntATitleIsNot() {
        String tooLong = String.join("", Collections.nCopies(61, "x"));
        show("View profile", "  Audio\ncall ", "", tooLong);
        show("View profile", "Block");
        assertEquals(Arrays.asList("View profile", "Audio call", "Block"), ProfileMenu.seen());
    }

    @Test public void aRowAlreadyHiddenStaysOutOfTheCount() {
        ProfileMenu.setHidden("Block", true);
        Menu menu = menu("View profile", "Block");
        menu.getItem(0).setVisible(false);
        ProfileMenu.showing(new Popup(menu));
        assertEquals("the only row left stays", Collections.singletonList("Block"), shown(menu));
        assertEquals(Collections.singletonList("Block"), ProfileMenu.seen());
    }

    @Test public void aPopupWithoutOneClearMenuIsReportedAndLeftAlone() {
        ProfileMenu.setHidden("Block", true);
        Menu first = menu("View profile", "Block");
        ProfileMenu.showing(new TwoMenus(first, menu("Block", "Report")));
        assertEquals(Arrays.asList("View profile", "Block"), shown(first));
        assertTrue(Settings.hookErrors.containsKey(ProfileMenu.KEY));
        Settings.hookErrors.clear();
        ProfileMenu.showing(new Object());
        assertTrue(Settings.hookErrors.containsKey(ProfileMenu.KEY));
    }

    @Test public void nothingHandedOverIsNothingToDo() {
        ProfileMenu.showing(null);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void settingsListsTheItemsSeenAndTheButtonHidesAndShowsEach() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertNotNull(root.findViewWithTag("profile_menu_items_empty"));
            assertNull(root.findViewWithTag("profile_menu_items_row_Block"));

            // Settings stays open under Messenger, someone's picture gets tapped, then Back returns here.
            screen.pause().stop();
            show("View profile", "Audio call", "Block");
            screen.restart().resume();

            assertNull(root.findViewWithTag("profile_menu_items_empty"));
            assertNotNull(root.findViewWithTag("profile_menu_items_row_View profile"));
            assertNotNull(root.findViewWithTag("profile_menu_items_row_Audio call"));

            root.findViewWithTag("profile_menu_items_toggle_Block").performClick();
            assertEquals(Collections.singleton("Block"), ProfileMenu.hidden());
            View item = root.findViewWithTag("profile_menu_items_row_Block");
            assertEquals(new SettingsText(context).get("message_actions_hidden_label", "Block"),
                ((TextView) ((ViewGroup) item).getChildAt(0)).getText().toString());
            assertEquals(Arrays.asList("View profile", "Audio call"), show("View profile", "Audio call", "Block"));

            root.findViewWithTag("profile_menu_items_toggle_Block").performClick();
            assertTrue(ProfileMenu.hidden().isEmpty());
            assertEquals("Block", ((TextView) ((ViewGroup) root.findViewWithTag("profile_menu_items_row_Block")).getChildAt(0)).getText().toString());
        }
    }
}
