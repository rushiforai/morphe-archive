package app.morphe.extension.tiktok.settings;

import static org.junit.Assert.assertEquals;

import android.content.Context;

import app.morphe.extension.shared.Utils;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * A count and its noun are chosen by the language's plural rule, not by {@code count == 1}.
 *
 * <p>Ten rows hand-paired a singular with a {@code %1$d} form, which serves German, Spanish,
 * Portuguese and Turkish and is wrong for Indonesian (no one form) and for any language with
 * a few or many form. The rule comes from ICU's CLDR data on the phone; the extra forms are rows
 * keyed {@code other + "|" + category}, so a Polish or Russian table can carry them the day it
 * arrives without a code change.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class L10nQuantityTest {
    @Test @Config(sdk = 28, qualifiers = "en")
    public void englishTakesTheOneFormForOneAndTheOtherFormForTheRest() {
        Context context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        assertEquals("1 result", L10n.quantity(context, 1, "1 result", "%1$d results"));
        assertEquals("0 results", L10n.quantity(context, 0, "1 result", "%1$d results"));
        assertEquals("2 results", L10n.quantity(context, 2, "1 result", "%1$d results"));
        assertEquals("21 results", L10n.quantity(context, 21, "1 result", "%1$d results"));
        // Both forms take the same values; the one form leaves the count unused.
        assertEquals("Reset 1 gate of 4.", L10n.quantity(context, 1,
                "Reset 1 gate of %2$d.", "Reset %1$d gates of %2$d.", 1, 4));
        assertEquals("Reset 3 gates of 4.", L10n.quantity(context, 3,
                "Reset 1 gate of %2$d.", "Reset %1$d gates of %2$d.", 3, 4));
    }

    @Test @Config(sdk = 28, qualifiers = "in")
    public void indonesianHasNoOneFormSoOneTakesTheOtherRow() {
        Context context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        assertEquals("other", L10n.pluralCategory(context, 1));
        // "1 result" has a row of its own in the Indonesian table, and it is not used: the
        // language reads every count the same way.
        assertEquals(L10n.f(context, "%1$d results", 1),
                L10n.quantity(context, 1, "1 result", "%1$d results"));
    }

    @Test @Config(sdk = 28, qualifiers = "pl")
    public void aLanguageWithFewAndManySelectsThoseRows() {
        Context context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        // ICU's rule for Polish: 1 is one, 2 to 4 are few, 5 to 21 are many, 22 to 24 few again.
        assertEquals("one", L10n.pluralCategory(context, 1));
        assertEquals("few", L10n.pluralCategory(context, 3));
        assertEquals("many", L10n.pluralCategory(context, 5));
        assertEquals("many", L10n.pluralCategory(context, 21));
        assertEquals("few", L10n.pluralCategory(context, 22));

        // The table a Polish translator would write: the two English forms plus the two extra.
        Map<String, String> table = new LinkedHashMap<>();
        table.put("1 result", "1 wynik");
        table.put("%1$d results", "%1$d wyników");
        table.put("%1$d results|few", "%1$d wyniki");
        table.put("%1$d results|many", "%1$d wyników");
        assertEquals("1 wynik", L10n.pluralRow("one", "1 result", "%1$d results", table));
        assertEquals("%1$d wyniki", L10n.pluralRow("few", "1 result", "%1$d results", table));
        assertEquals("%1$d wyników", L10n.pluralRow("many", "1 result", "%1$d results", table));
        assertEquals("%1$d wyników", L10n.pluralRow("other", "1 result", "%1$d results", table));
        // A table that has not written its few row yet falls back to its other form, which is
        // what every hand-rolled == 1 gave every count above one.
        table.remove("%1$d results|few");
        assertEquals("%1$d wyników", L10n.pluralRow("few", "1 result", "%1$d results", table));
        // No table at all: English.
        assertEquals("%1$d results", L10n.pluralRow("few", "1 result", "%1$d results", null));
    }

    @Test public void readerTextIsIsolatedFromTheSentenceAroundIt() {
        assertEquals("⁨dana⁩", L10n.isolate("dana"));
        assertEquals("⁨שלום⁩", L10n.isolate("שלום"));
        assertEquals("", L10n.isolate(null));
        assertEquals("", L10n.isolate(""));
    }
}
