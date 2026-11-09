package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** #149: a dot on a switch added since settings were last opened, on its section's heading and on its page's tab. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class NewRowDotsTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        store().edit().clear().commit();
        OpenSections.only();
    }

    private static SharedPreferences store() {
        return RuntimeEnvironment.getApplication().getSharedPreferences(NewRowDots.FILE, Context.MODE_PRIVATE);
    }

    private static List<View> dotted(View view) {
        List<View> found = new ArrayList<>();
        if (NewRowDots.dotted(view)) found.add(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) found.addAll(dotted(group.getChildAt(i)));
        }
        return found;
    }

    private static View title(View root, String key) {
        return ((ViewGroup) root.findViewWithTag("title_line_" + key)).getChildAt(0);
    }

    private static View heading(View root, String section) {
        return ((ViewGroup) root.findViewWithTag("section_" + section)).getChildAt(0);
    }

    /** Stores what a first open built, less [key], as if this build had just added that switch. */
    private static void addedSince(String key) {
        Robolectric.buildActivity(SettingsActivity.class).setup().pause().stop().destroy();
        Set<String> seen = new HashSet<>(store().getStringSet(NewRowDots.SEEN, Set.of()));
        assertTrue(seen.remove(key));
        store().edit().putStringSet(NewRowDots.SEEN, seen).commit();
    }

    @Test public void freshInstallShowsNoDotAndCountsEverySwitchSeen() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertNotNull(root.findViewWithTag("typing"));
            assertEquals(List.of(), dotted(root));
        }
        Set<String> seen = store().getStringSet(NewRowDots.SEEN, null);
        assertNotNull(seen);
        assertTrue(seen.containsAll(List.of("typing", "light", "paused")));
        // A chat's own switch comes and goes as chats call, so it never reads as new.
        assertFalse(NewRowDots.counts(QuietCalls.CHAT_PREFIX + "42"));
        // The next open is no first one: nothing is new, and nothing gets a dot.
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            assertEquals(List.of(), dotted(screen.get().getWindow().getDecorView()));
        }
    }

    @Test public void newSwitchDotsItsTitleSectionAndTab() {
        addedSince("typing");
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            View tab = root.findViewWithTag("tab_controls");
            assertEquals(List.of(tab, heading(root, "conversations"), title(root, "typing")), dotted(root));
            SettingsText text = new SettingsText(screen.get());
            // The tabs keep their tags and words: the dot says it on the side.
            assertEquals(text.get("controls"), ((TextView) tab).getText().toString());
            assertEquals(text.get("controls") + ". " + text.get("new_setting"), tab.getContentDescription().toString());
            // A switch reads its title, then "New", then its summary.
            String isNew = ". " + text.get("new_setting") + ". ";
            assertTrue(root.findViewWithTag("typing").getContentDescription().toString().contains(isNew));
            assertFalse(root.findViewWithTag("people").getContentDescription().toString().contains(isNew));
            AccessibilityNodeInfo info = root.findViewWithTag("section_conversations").createAccessibilityNodeInfo();
            assertTrue(info.getContentDescription().toString().startsWith(text.get("conversations") + ". " + text.get("new_setting") + ". "));
            info = root.findViewWithTag("section_inbox").createAccessibilityNodeInfo();
            assertFalse(info.getContentDescription().toString().contains(text.get("new_setting")));
        }
    }

    @Test public void dotLastsTheVisitThatShowsIt() {
        addedSince("typing");
        // Left shut, the section never showed it: still new next time.
        Robolectric.buildActivity(SettingsActivity.class).setup().pause().stop().destroy();
        assertFalse(store().getStringSet(NewRowDots.SEEN, Set.of()).contains("typing"));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertTrue(NewRowDots.dotted(title(root, "typing")));
            root.findViewWithTag("section_conversations").performClick();
            assertTrue(root.findViewWithTag("typing").isShown());
            root.findViewWithTag("section_conversations").performClick();
            assertFalse(root.findViewWithTag("typing").isShown());
            // Seen once the section closes, though shut again when settings go, and the dot stays until they open again.
            screen.pause();
            assertTrue(store().getStringSet(NewRowDots.SEEN, Set.of()).contains("typing"));
            assertTrue(NewRowDots.dotted(title(root, "typing")));
            screen.stop();
        }
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            assertEquals(List.of(), dotted(screen.get().getWindow().getDecorView()));
        }
    }
}
