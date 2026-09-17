package app.morphe.extension.tiktok.share;

import static org.junit.Assert.*;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;
import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class ShareModelFilterTest {
    public static final class Item {
        private final String key;
        private final String label;
        Item(String key) { this(key, null); }
        Item(String key, String label) { this.key = key; this.label = label; }
        public String key() { return key; }
        public String getLabel() { return label; }
    }
    // Every case here writes a Setting. Run this class first in a sandbox and all three
    // failed, because Setting's static initialiser needs a context and only @After set one.
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @After public void reset() {
        Settings.SHARE_HIDDEN_ITEMS.save("");
        Settings.HIDE_SHARE_CHANNELS.save(false);
        Settings.HIDE_SHARE_ACTIONS.save(false);
        Settings.HIDE_SHARE_CONTACTS.save(false);
        Settings.SHARE_ACTION_CATALOG.save("");
        HookStatus.clear();
    }
    @Test public void filtersBeforeRenderingWithoutChangingTheBuilderOrUnknownItems() {
        Object copy = new Item("copy"), save = new Item("save"), unknown = new Object();
        List<?> input = Arrays.asList(copy, save, unknown);
        assertSame(input, ShareModelFilter.channels(input));
        Settings.SHARE_HIDDEN_ITEMS.save("Copy link, save video");
        assertEquals(List.of(unknown), ShareModelFilter.channels(input));
        assertEquals(3, input.size());
        Settings.SHARE_HIDDEN_ITEMS.save("");
        assertSame(input, ShareModelFilter.channels(input));
    }
    @Test public void rowsCanBeHiddenIndependently() {
        List<?> input = List.of(new Item("save"));
        Settings.HIDE_SHARE_ACTIONS.save(true);
        assertTrue(ShareModelFilter.actions(input).isEmpty());
        assertSame(input, ShareModelFilter.channels(input));
        assertTrue(ShareModelFilter.contacts(true));
        Settings.HIDE_SHARE_CONTACTS.save(true);
        assertFalse(ShareModelFilter.contacts(true));
        assertFalse(ShareModelFilter.contacts(false));
    }

    /** A list that behaves the way TikTok's own model does not, to prove the boundary holds. */
    static final class HostileList extends java.util.AbstractList<Object> {
        @Override public Object get(int index) { throw new IllegalStateException("hostile"); }
        @Override public int size() { throw new IllegalStateException("hostile"); }
        @Override public boolean isEmpty() { throw new IllegalStateException("hostile"); }
        @Override public java.util.Iterator<Object> iterator() {
            throw new IllegalStateException("hostile");
        }
    }

    @Test public void aFilterThatThrowsHandsTikTokItsOwnRowsBackAndSaysSo() {
        // These three run inside the share model's constructor. Anything that escapes takes the
        // sheet with it, which upstream saw as a Share button that did nothing and then a crash.
        HookStatus.clear();
        Settings.SHARE_HIDDEN_ITEMS.save("copy");
        List<?> hostile = new HostileList();

        assertSame("a failed channels filter leaves TikTok's own row alone",
                hostile, ShareModelFilter.channels(hostile));
        assertSame("a failed actions filter leaves TikTok's own row alone",
                hostile, ShareModelFilter.actions(hostile));

        List<String> missing = HookStatus.missing(ShareModelFilter.FAMILY);
        assertEquals("the catalogue and both filters are each named once", 3, missing.size());
        assertTrue(missing.toString(), missing.get(0).contains("'channels'"));
        assertTrue(missing.toString(), missing.get(0).contains("IllegalStateException"));
        assertTrue(HookStatus.report().toString(),
                HookStatus.report().get(0).startsWith(ShareModelFilter.FAMILY + ": 0 found, 3 missing"));
    }

    @Test public void actionModelsAreRememberedWithReadableLabelsAndStableKeys() {
        List<?> input = Arrays.asList(
                new Item("copy", "Copy link"),
                new Item("save_video", "Save video")
        );
        assertSame(input, ShareModelFilter.actions(input));
        List<ShareActionCatalog.Entry> catalog = ShareActionCatalog.entries();
        assertEquals(2, catalog.size());
        assertEquals("copy", catalog.get(0).key);
        assertEquals("Copy link", catalog.get(0).label);
        assertEquals("save", catalog.get(1).key);
        assertEquals("Save video", catalog.get(1).label);
    }
}
