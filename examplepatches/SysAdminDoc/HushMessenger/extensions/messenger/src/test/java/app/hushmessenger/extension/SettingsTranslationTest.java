package app.hushmessenger.extension;

import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.IllegalFormatException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.junit.After;
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
public class SettingsTranslationTest {
    private static final Pattern PLACEHOLDER = Pattern.compile("%(\\d+\\$)?[-#+ 0,(]*\\d*(?:\\.\\d+)?([a-zA-Z%])");

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
    }

    private Map<String, String> shippedSpanish;

    @Before public void keepShippedSpanish() { shippedSpanish = SettingsTranslations.LOCALES.get("es"); }

    /** The display test swaps in its own Spanish table; put back the real one so the shipped check still sees it. */
    @After public void restoreShippedSpanish() {
        if (shippedSpanish == null) SettingsTranslations.LOCALES.remove("es");
        else SettingsTranslations.LOCALES.put("es", shippedSpanish);
    }

    /** Every id a locale table has to cover, with its English. */
    static Map<String, String> englishIds() {
        Map<String, String> ids = new LinkedHashMap<>(SettingsText.ENGLISH);
        for (String[] spec : SettingsActivity.CONTROLS) {
            ids.put(spec[0] + ".title", spec[1]);
            ids.put(spec[0] + ".description", spec[2]);
        }
        return ids;
    }

    /** Each argument the text formats, as argument number and conversion, so reordering with %2$s is allowed. */
    static List<String> placeholders(String text) {
        List<String> found = new ArrayList<>();
        Matcher m = PLACEHOLDER.matcher(text);
        for (int next = 1; m.find(); ) {
            String conversion = m.group(2);
            if (conversion.equals("%") || conversion.equals("n")) continue;
            int argument = m.group(1) != null ? Integer.parseInt(m.group(1).substring(0, m.group(1).length() - 1)) : next++;
            found.add(argument + conversion);
        }
        Collections.sort(found);
        return found;
    }

    /** Arguments shaped like the English text's placeholders, so a translation can be formatted the way get() does. */
    static Object[] sampleArguments(String english) {
        List<String> found = placeholders(english);
        int count = 0;
        for (String p : found) count = Math.max(count, Integer.parseInt(p.substring(0, p.length() - 1)));
        Object[] arguments = new Object[count];
        for (String p : found) {
            char conversion = p.charAt(p.length() - 1);
            arguments[Integer.parseInt(p.substring(0, p.length() - 1)) - 1] = "doxX".indexOf(conversion) >= 0 ? (Object) 7 : "x";
        }
        return arguments;
    }

    /** What's wrong with a locale table: ids it lacks or doesn't know, empty text, changed placeholders, and text that won't format. */
    static List<String> problems(Map<String, String> table) {
        Map<String, String> english = englishIds();
        List<String> problems = new ArrayList<>();
        for (String id : english.keySet()) if (!table.containsKey(id)) problems.add("missing " + id);
        for (Map.Entry<String, String> entry : table.entrySet()) {
            String source = english.get(entry.getKey());
            if (source == null) problems.add("unknown " + entry.getKey());
            else if (entry.getValue().trim().isEmpty()) problems.add("empty " + entry.getKey());
            // Control rows are shown as is; only text ids go through get(), which runs String.format on them.
            else if (!SettingsText.ENGLISH.containsKey(entry.getKey())) continue;
            else if (!placeholders(source).equals(placeholders(entry.getValue()))) problems.add("placeholders differ in " + entry.getKey());
            else {
                // A stray % that isn't %% passes the placeholder list but crashes the screen.
                try {
                    String.format(Locale.ROOT, entry.getValue(), sampleArguments(source));
                } catch (IllegalFormatException e) {
                    problems.add("won't format " + entry.getKey());
                }
            }
        }
        Collections.sort(problems);
        return problems;
    }

    private static String[][] marked(Map<String, String> english) {
        List<String[]> pairs = new ArrayList<>();
        for (Map.Entry<String, String> entry : english.entrySet()) pairs.add(new String[] {entry.getKey(), "ES " + entry.getValue()});
        return pairs.toArray(new String[0][]);
    }

    private static boolean showsText(View view, String text) {
        if (view instanceof TextView && text.equals(((TextView) view).getText().toString()) && view.isShown()) return true;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) if (showsText(group.getChildAt(i), text)) return true;
        }
        return false;
    }

    /** #27: "Messenger's icon" read as the Messenger title inside the app, where a long-press does nothing. */
    @Test public void settingsDirectionsNameTheHomeScreenIcon() {
        int directed = 0;
        for (Map.Entry<String, String> entry : englishIds().entrySet()) {
            if (!entry.getValue().contains("Patch controls")) continue;
            directed++;
            assertTrue(entry.getKey(), entry.getValue().contains("Messenger's home screen icon"));
        }
        assertEquals(8, directed);
    }

    @Test public void everyShippedLocaleCoversEveryIdAndKeepsItsPlaceholders() {
        for (Map.Entry<String, Map<String, String>> locale : SettingsTranslations.LOCALES.entrySet())
            assertEquals(locale.getKey(), List.of(), problems(locale.getValue()));
    }

    @Test public void theCheckFindsAMissingIdAnUnknownIdEmptyTextAndAChangedPlaceholder() {
        Map<String, String> table = new HashMap<>();
        for (String[] pair : marked(englishIds())) table.put(pair[0], pair[1]);
        assertEquals(List.of(), problems(table));
        // Reordering arguments by number is fine.
        table.put("results_many", "%2$d controls installed, %1$d shown");
        assertEquals(List.of(), problems(table));
        table.remove("controls");
        table.put("results_one", "%d control installed");
        table.put("update_available", "Version %d is available");
        table.put("people.title", " ");
        table.put("no_such_text", "x");
        table.put("saved", "PX 100%.");
        // A control row is shown as is, never formatted, so a percent sign is fine there.
        table.put("people.description", "Hides 100% of suggestions.");
        table.put("saved_one", "%d saved choice, 100%% kept.");
        assertEquals(List.of("empty people.title", "missing controls", "placeholders differ in results_one",
            "placeholders differ in update_available", "unknown no_such_text", "won't format saved"), problems(table));
    }

    @Test public void aShippedSpanishTableIsCheckedEvenAfterTheDisplayTestSwapsItsOwnIn() {
        Map<String, String> reallyShipped = shippedSpanish;
        String[][] missingOne = marked(englishIds());
        SettingsTranslations.add("es", java.util.Arrays.stream(missingOne).filter(p -> !p[0].equals("controls")).toArray(String[][]::new));
        // Run the display test with its own before and after around it, as JUnit would.
        keepShippedSpanish();
        aLocaleTableTranslatesTheScreenAndKeepsPreferenceKeysAndEnglishSearch();
        restoreShippedSpanish();
        assertEquals(List.of("missing controls"), problems(SettingsTranslations.LOCALES.get("es")));
        shippedSpanish = reallyShipped;
    }

    @Test public void aTranslationThatWontFormatFallsBackToEnglishInsteadOfCrashing() {
        Map<String, String> english = englishIds();
        english.put("results_many", "%d of %d installed controls, 100%");
        SettingsTranslations.add("es", marked(english));
        SettingsText text = new SettingsText(Locale.forLanguageTag("es"));
        assertEquals("3 of 20 installed controls", text.get("results_many", 3, 20));
        assertEquals("ES 5m", text.format("minutes_short", 5L));
        assertEquals("ES Used ES 5m ago", text.get("active_ago", text.format("minutes_short", 5L)));
        assertEquals("Used 5m ago", new SettingsText(Locale.US).get("active_ago", new SettingsText(Locale.US).format("minutes_short", 5L)));
    }

    @Test public void everyTextIdIsFormattedSoADoubledPercentShowsOnce() {
        Map<String, String> english = englishIds();
        english.put("light_help", "Use a light background in settings, 100%% of the time.");
        english.put("check_updates_help", "Checks GitHub 100% of the time.");
        String[][] table = marked(english);
        SettingsTranslations.add("es", table);
        assertEquals(List.of("placeholders differ in check_updates_help"), problems(SettingsTranslations.LOCALES.get("es")));
        RuntimeEnvironment.setQualifiers("es-rES-w400dp-h800dp-mdpi");
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            assertTrue(showsText(root, "ES Use a light background in settings, 100% of the time."));
            // A line that won't format shows in English instead.
            assertTrue(showsText(root, new SettingsText(Locale.US).get("check_updates_help")));
        }
    }

    @Test public void aLocaleTableTranslatesTheScreenAndKeepsPreferenceKeysAndEnglishSearch() {
        SettingsTranslations.add("es", marked(englishIds()));
        assertEquals(List.of(), problems(SettingsTranslations.LOCALES.get("es")));
        // A regional locale uses its language's table.
        RuntimeEnvironment.setQualifiers("es-rMX-w400dp-h800dp-mdpi");
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertEquals("ES Controls", ((TextView) root.findViewWithTag("tab_controls")).getText().toString());
            assertTrue(showsText(root, "ES Hide People You May Know"));
            assertTrue(showsText(root, "ES Removes suggested people from chats, search and stories, and from the People and Notifications tabs."));
            assertFalse(showsText(root, "Hide People You May Know"));
            root.findViewWithTag("people").performClick();
            assertEquals(Map.of("people", true), Settings.preferences.getAll());
            EditText search = root.findViewWithTag("find_control");
            for (String query : new String[] {"People You", "ES Hide People"}) {
                search.setText(query);
                assertTrue(query, root.findViewWithTag("people").isShown());
                assertFalse(query, root.findViewWithTag("stories").isShown());
            }
        }
        assertEquals("ES 3 of 20 installed controls", new SettingsText(Locale.forLanguageTag("es-MX")).get("results_many", 3, 20));
        // "zxx" is the tag for no linguistic content, so no table will ever be added for it.
        assertEquals("3 of 20 installed controls", new SettingsText(Locale.forLanguageTag("zxx")).get("results_many", 3, 20));
    }
}
