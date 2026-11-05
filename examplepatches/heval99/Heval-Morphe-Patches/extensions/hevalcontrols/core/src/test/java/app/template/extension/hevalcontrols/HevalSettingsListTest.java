package app.template.extension.hevalcontrols;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/** List settings ("pick items to hide"): storage, pause, safe mode, dependencies and options. */
public class HevalSettingsListTest {
    /** gate (switch, on), countries (list), late.list (list, restart), needs.gate (list needing gate). */
    private static final String REGISTRY = "hevalcontrols-registry:1\n"
            + "gate\tGate\t\tA\t1\t0\t0\t\n"
            + "countries\tHidden countries\t\tA\t0\t0\t0\t\tlist\n"
            + "late.list\tLate list\t\tA\t0\t1\t0\t\tlist\n"
            + "needs.gate\tNeeds gate\t\tA\t0\t0\t0\tgate\tlist\n";

    private FakeStore store;

    @Before
    public void setUp() {
        HevalSettings.resetForTests();
        Registry.install(REGISTRY);
        store = new FakeStore();
        HevalSettings.synchronousOptionsFlush = true;
    }

    @After
    public void tearDown() {
        HevalSettings.resetForTests();
        Registry.install(null);
    }

    private static Set<String> set(String... keys) {
        return new HashSet<>(Arrays.asList(keys));
    }

    @Test
    public void emptyBeforeInitAndForUnknownOrSwitchIds() {
        assertTrue(HevalSettings.getHidden("countries").isEmpty());
        assertFalse(HevalSettings.isHidden("countries", "ES"));
        assertFalse(HevalSettings.isEnabled("countries"));

        HevalSettings.initForTests(store);
        assertTrue(HevalSettings.getHidden("countries").isEmpty());
        assertTrue(HevalSettings.getHidden("unknown.list").isEmpty());
        assertTrue(HevalSettings.getHidden("gate").isEmpty());
        assertTrue(HevalSettings.getHidden(null).isEmpty());
        assertFalse(HevalSettings.isHidden("countries", null));
        assertFalse(HevalSettings.isEnabled("countries"));
        // Switch and list writes do not cross.
        assertFalse(HevalSettings.setEnabled("countries", true));
        assertFalse(HevalSettings.setHidden("gate", set("ES")));
        assertFalse(HevalSettings.setHidden("unknown.list", set("ES")));
        assertEquals(0, store.commits);
    }

    @Test
    public void picksArePersistedAsAStringSetAndApplyAtOnce() {
        HevalSettings.initForTests(store);
        assertTrue(HevalSettings.setHidden("countries", set("ES", "IT")));
        assertEquals(set("ES", "IT"), store.values.get("l.countries"));
        assertEquals(set("ES", "IT"), HevalSettings.getHidden("countries"));
        assertTrue(HevalSettings.isHidden("countries", "ES"));
        assertFalse(HevalSettings.isHidden("countries", "FR"));
        // A non-empty list is "on".
        assertTrue(HevalSettings.isEnabled("countries"));
        assertTrue(HevalSettings.isChosen("countries"));
        assertEquals(HevalSettings.State.ENABLED, HevalSettings.stateOf(Registry.get().feature("countries")));

        // The hot path hands out the same immutable set until something changes.
        Set<String> first = HevalSettings.getHidden("countries");
        assertSame(first, HevalSettings.getHidden("countries"));
        try {
            first.add("FR");
            throw new AssertionError("the hidden set is mutable");
        } catch (UnsupportedOperationException expected) {
            // fine
        }

        // A new process reads the same store.
        HevalSettings.resetForTests();
        HevalSettings.initForTests(store);
        assertEquals(set("ES", "IT"), HevalSettings.getHidden("countries"));

        // Emptying the list removes the key: stock again.
        assertTrue(HevalSettings.clearHidden("countries"));
        assertFalse(store.values.containsKey("l.countries"));
        assertTrue(HevalSettings.getHidden("countries").isEmpty());
        assertFalse(HevalSettings.isEnabled("countries"));
        assertEquals(HevalSettings.State.DISABLED, HevalSettings.stateOf(Registry.get().feature("countries")));
    }

    @Test
    public void singleKeysCanBeAddedAndRemoved() {
        HevalSettings.initForTests(store);
        assertTrue(HevalSettings.setHidden("countries", "ES", true));
        assertTrue(HevalSettings.setHidden("countries", "IT", true));
        int commits = store.commits;
        assertTrue(HevalSettings.setHidden("countries", "IT", true)); // already there: no write
        assertEquals(commits, store.commits);
        assertTrue(HevalSettings.setHidden("countries", "ES", false));
        assertEquals(set("IT"), HevalSettings.getHidden("countries"));
        assertTrue(HevalSettings.setHidden("countries", "IT", false));
        assertFalse(store.values.containsKey("l.countries"));
        assertFalse(HevalSettings.setHidden("countries", "", true));
        assertFalse(HevalSettings.setHidden("countries", (String) null, true));
    }

    @Test
    public void pauseSafeModeAndEngineFailureEmptyTheListButKeepThePicks() {
        store.values.put("l.countries", set("ES"));
        HevalSettings.initForTests(store);
        assertTrue(HevalSettings.isHidden("countries", "ES"));

        assertTrue(HevalSettings.setPaused(true));
        assertTrue(HevalSettings.getHidden("countries").isEmpty());
        assertFalse(HevalSettings.isEnabled("countries"));
        assertEquals(set("ES"), HevalSettings.pickedHidden("countries"));
        assertTrue(HevalSettings.setPaused(false));
        assertTrue(HevalSettings.isHidden("countries", "ES"));

        assertTrue(HevalSettings.setSafeMode(true));
        assertTrue(HevalSettings.getHidden("countries").isEmpty());
        assertEquals(set("ES"), HevalSettings.pickedHidden("countries"));
        assertTrue(HevalSettings.setSafeMode(false));
        assertTrue(HevalSettings.isHidden("countries", "ES"));

        store.failReads = true;
        HevalSettings.rebuild();
        assertTrue(HevalSettings.isEngineFailed());
        assertTrue(HevalSettings.getHidden("countries").isEmpty());
        assertTrue(HevalSettings.pickedHidden("countries").isEmpty());
    }

    @Test
    public void aListFollowsItsDependency() {
        store.values.put("l.needs.gate", set("ES"));
        HevalSettings.initForTests(store);
        assertTrue(HevalSettings.isHidden("needs.gate", "ES"));
        assertTrue(HevalSettings.setEnabled("gate", false));
        assertTrue(HevalSettings.getHidden("needs.gate").isEmpty());
        assertEquals(set("ES"), HevalSettings.pickedHidden("needs.gate"));
    }

    @Test
    public void invalidStoredValuesAndKeysAreDropped() {
        store.values.put("l.countries", "ES");            // wrong type: nothing picked
        Set<Object> mixed = new HashSet<>();
        mixed.add("IT");
        mixed.add("");
        mixed.add("tab\tkey");
        mixed.add(Boolean.TRUE);
        store.values.put("l.late.list", mixed);
        HevalSettings.initForTests(store);
        assertTrue(HevalSettings.getHidden("countries").isEmpty());
        assertEquals(set("IT"), HevalSettings.getHidden("late.list"));

        assertTrue(HevalSettings.setHidden("countries", set("ES", "", "line\nbreak")));
        assertEquals(set("ES"), store.values.get("l.countries"));

        Set<String> tooMany = new HashSet<>();
        for (int i = 0; i <= HevalSettings.MAX_HIDDEN; i++) tooMany.add("k" + i);
        assertFalse(HevalSettings.setHidden("countries", tooMany));
        assertEquals(set("ES"), HevalSettings.getHidden("countries"));
    }

    @Test
    public void resetAllClearsPicksButKeepsSeenOptions() {
        HevalSettings.initForTests(store);
        HevalSettings.setHidden("countries", set("ES"));
        HevalSettings.reportOptionsSeen("countries", "ES", "Spain");
        assertTrue(store.values.containsKey("o.countries"));
        assertTrue(HevalSettings.resetAll());
        assertFalse(store.values.containsKey("l.countries"));
        assertTrue(store.values.containsKey("o.countries"));
        assertTrue(HevalSettings.getHidden("countries").isEmpty());
        assertEquals("Spain", HevalSettings.options("countries").get("ES"));
    }

    @Test
    public void restartRequiredListsComparePicksWithTheProcessStart() {
        store.values.put("l.late.list", set("ES"));
        HevalSettings.initForTests(store);
        assertEquals(0, HevalSettings.pendingRestartCount());
        // Same "on" state, different picks: still a pending restart.
        HevalSettings.setHidden("late.list", set("IT"));
        assertEquals(1, HevalSettings.pendingRestartCount());
        assertEquals(HevalSettings.State.RESTART_REQUIRED, HevalSettings.stateOf(Registry.get().feature("late.list")));
        HevalSettings.setHidden("late.list", set("ES"));
        assertEquals(0, HevalSettings.pendingRestartCount());
        // A list without the restart flag never counts.
        HevalSettings.setHidden("countries", set("ES"));
        assertEquals(0, HevalSettings.pendingRestartCount());
    }

    @Test
    public void externalChangesRebuildTheList() {
        HevalSettings.initForTests(store);
        store.externalWrite("l.countries", set("FR"));
        assertTrue(HevalSettings.isHidden("countries", "FR"));
    }

    @Test
    public void seenOptionsArePersistedAsKeyTabLabelEntries() {
        HevalSettings.initForTests(store);
        HevalSettings.reportOptionsSeen("countries", "ES", "Spain");
        HevalSettings.reportOptionsSeen("countries", "IT", "  Italy\n");
        HevalSettings.reportOptionsSeen("countries", "XX", null);
        assertEquals(set("ES\tSpain", "IT\tItaly", "XX\tXX"), store.values.get("o.countries"));
        Map<String, String> options = HevalSettings.options("countries");
        assertEquals("Spain", options.get("ES"));
        assertEquals("Italy", options.get("IT"));

        // Known with the same label: no write.
        int commits = store.commits;
        HevalSettings.reportOptionsSeen("countries", "ES", "Spain");
        assertEquals(commits, store.commits);
        // A new label is saved.
        HevalSettings.reportOptionsSeen("countries", "ES", "España");
        assertEquals("España", HevalSettings.options("countries").get("ES"));
        assertTrue(((Set<?>) store.values.get("o.countries")).contains("ES\tEspaña"));

        // Unknown ids, switch ids and invalid keys are ignored.
        commits = store.commits;
        HevalSettings.reportOptionsSeen("unknown.list", "ES", "Spain");
        HevalSettings.reportOptionsSeen("gate", "ES", "Spain");
        HevalSettings.reportOptionsSeen("countries", "", "Empty");
        HevalSettings.reportOptionsSeen("countries", "a\tb", "Tab");
        HevalSettings.reportOptionsSeen(null, "ES", "Spain");
        assertEquals(commits, store.commits);
        assertFalse(store.values.containsKey("o.unknown.list"));
        assertFalse(store.values.containsKey("o.gate"));

        // A new process reads them back.
        HevalSettings.resetForTests();
        HevalSettings.initForTests(store);
        assertEquals("España", HevalSettings.options("countries").get("ES"));
    }

    @Test
    public void seenOptionsAreBounded() {
        HevalSettings.initForTests(store);
        Map<String, String> many = new HashMap<>();
        for (int i = 0; i < HevalSettings.MAX_OPTIONS + 25; i++) many.put("k" + i, "Label " + i);
        HevalSettings.reportOptionsSeen("countries", many);
        assertEquals(HevalSettings.MAX_OPTIONS, ((Set<?>) store.values.get("o.countries")).size());
        int commits = store.commits;
        HevalSettings.reportOptionsSeen("countries", "brand.new", "New");
        assertEquals(commits, store.commits);
    }

    @Test
    public void optionsSeenBeforeInitAreWrittenOnInit() {
        HevalSettings.reportOptionsSeen("countries", "ES", "Spain");
        assertEquals("Spain", HevalSettings.options("countries").get("ES"));
        assertNull(store.values.get("o.countries"));
        HevalSettings.initForTests(store);
        assertEquals(set("ES\tSpain"), store.values.get("o.countries"));
    }

    @Test
    public void backgroundFlushWritesTheBatch() throws InterruptedException {
        HevalSettings.synchronousOptionsFlush = false;
        HevalSettings.initForTests(store);
        HevalSettings.reportOptionsSeen("countries", "ES", "Spain");
        HevalSettings.reportOptionsSeen("countries", "IT", "Italy");
        // Shown by the picker before it is written.
        assertEquals("Italy", HevalSettings.options("countries").get("IT"));
        long deadline = System.currentTimeMillis() + 10_000;
        while (store.values.get("o.countries") == null && System.currentTimeMillis() < deadline) Thread.sleep(50);
        assertEquals(set("ES\tSpain", "IT\tItaly"), store.values.get("o.countries"));
        assertEquals(1, store.commits);
    }

    @Test
    public void optionsMergeSeedsSeenOptionsAndPickedKeys() {
        HevalSettings.initForTests(store);
        Map<String, String> seeds = new HashMap<>();
        seeds.put("ES", "Spain (seed)");
        seeds.put("FR", "France");
        seeds.put("", "Invalid");
        HevalSettings.registerOptions("countries", seeds);
        HevalSettings.registerOptions("countries", Collections.singletonMap("DE", "Germany"));
        HevalSettings.reportOptionsSeen("countries", "ES", "Spain");
        HevalSettings.setHidden("countries", set("ZZ"));

        Map<String, String> options = HevalSettings.options("countries");
        assertEquals(4, options.size());
        assertEquals("Spain", options.get("ES"));      // a seen label wins over the seed
        assertEquals("France", options.get("FR"));
        assertEquals("Germany", options.get("DE"));
        assertEquals("ZZ", options.get("ZZ"));         // a picked key without a label stays listed
        // Seeds are not persisted.
        assertEquals(set("ES\tSpain"), store.values.get("o.countries"));
    }

    @Test
    public void optionIconsComeFromTheListsProviderAndAreNeverPersisted() {
        HevalSettings.initForTests(store);
        // No provider: no icon, also before one is set or for a null id/key.
        assertNull(HevalSettings.optionIcon("countries", "ES"));
        assertNull(HevalSettings.optionIcon(null, "ES"));

        HevalSettings.setOptionIconProvider("countries", new HevalSettings.OptionIconProvider() {
            @Override
            public String iconFor(String key) {
                switch (key) {
                    case "boom": throw new IllegalStateException("provider bug");
                    case "blank": return "  ";
                    case "tab": return "a\tb";
                    case "long": return "123456789012345678901234567890123";
                    case "padded": return " x ";
                    default: return OptionIcons.countryFlag(key);
                }
            }
        });
        assertEquals("🇪🇸", HevalSettings.optionIcon("countries", "ES"));
        assertNull(HevalSettings.optionIcon("countries", null));
        assertNull(HevalSettings.optionIcon("countries", "slug:world")); // the provider's null
        assertNull(HevalSettings.optionIcon("countries", "boom"));       // a throwing provider
        assertNull(HevalSettings.optionIcon("countries", "blank"));
        assertNull(HevalSettings.optionIcon("countries", "tab"));
        assertNull(HevalSettings.optionIcon("countries", "long"));
        assertEquals("x", HevalSettings.optionIcon("countries", "padded"));
        // Per list: another list has no provider.
        assertNull(HevalSettings.optionIcon("late.list", "ES"));

        // Icons never reach storage, the options or the picks.
        HevalSettings.reportOptionsSeen("countries", "ES", "Spain");
        HevalSettings.setHidden("countries", set("ES"));
        assertEquals(set("ES\tSpain"), store.values.get("o.countries"));
        assertEquals("Spain", HevalSettings.options("countries").get("ES"));
        assertEquals(set("ES"), HevalSettings.getHidden("countries"));

        // Null removes the provider.
        HevalSettings.setOptionIconProvider("countries", null);
        assertNull(HevalSettings.optionIcon("countries", "ES"));
    }

    @Test
    public void optionImageUrlsComeOnlyFromImageProvidersAndAreFiltered() {
        HevalSettings.initForTests(store);
        assertNull(HevalSettings.optionImageUrl("countries", "ES"));
        // A plain icon provider has no images.
        HevalSettings.setOptionIconProvider("countries", new HevalSettings.OptionIconProvider() {
            @Override
            public String iconFor(String key) {
                return OptionIcons.countryFlag(key);
            }
        });
        assertNull(HevalSettings.optionImageUrl("countries", "ES"));

        final StringBuilder longUrl = new StringBuilder("https://img.example.com/");
        while (longUrl.length() <= HevalSettings.MAX_IMAGE_URL_LENGTH) longUrl.append('a');
        HevalSettings.setOptionIconProvider("countries", new HevalSettings.OptionImageProvider() {
            @Override
            public String iconFor(String key) {
                return OptionIcons.countryFlag(key);
            }

            @Override
            public String imageUrlFor(String key) {
                switch (key) {
                    case "boom": throw new IllegalStateException("provider bug");
                    case "none": return null;
                    case "padded": return "  https://img.example.com/x.png ";
                    case "upper": return "HTTPS://img.example.com/x.png";
                    case "http": return "http://img.example.com/x.png";
                    case "file": return "file:///sdcard/x.png";
                    case "relative": return "/x.png";
                    case "nohost": return "https:///x.png";
                    case "empty": return "https://";
                    case "userinfo": return "https://@x.png";
                    case "space": return "https://img.example.com/a b.png";
                    case "newline": return "https://img.example.com/a\n.png";
                    case "unicode": return "https://img.example.com/é.png";
                    case "long": return longUrl.toString();
                    default: return "https://img.example.com/country/" + key + "/flag";
                }
            }
        });
        assertEquals("https://img.example.com/country/ES/flag", HevalSettings.optionImageUrl("countries", "ES"));
        // The text icon still comes from the same provider.
        assertEquals("🇪🇸", HevalSettings.optionIcon("countries", "ES"));
        assertEquals("https://img.example.com/x.png", HevalSettings.optionImageUrl("countries", "padded"));
        assertEquals("HTTPS://img.example.com/x.png", HevalSettings.optionImageUrl("countries", "upper"));
        for (String bad : new String[] {"boom", "none", "http", "file", "relative", "nohost", "empty", "userinfo",
                "space", "newline", "unicode", "long"}) {
            assertNull(bad, HevalSettings.optionImageUrl("countries", bad));
        }
        assertNull(HevalSettings.optionImageUrl("countries", null));
        assertNull(HevalSettings.optionImageUrl(null, "ES"));
        assertNull(HevalSettings.optionImageUrl("late.list", "ES"));

        // Image URLs never reach storage either.
        HevalSettings.reportOptionsSeen("countries", "ES", "Spain");
        assertEquals(set("ES\tSpain"), store.values.get("o.countries"));

        HevalSettings.setOptionIconProvider("countries", null);
        assertNull(HevalSettings.optionImageUrl("countries", "ES"));
    }

    @Test
    public void optionIconsBuildFlags() {
        assertEquals("🇩🇪", OptionIcons.countryFlag("DE"));
        assertEquals("🇩🇪", OptionIcons.countryFlag("de"));
        assertEquals("🇽🇰", OptionIcons.countryFlag("XK"));
        assertNull(OptionIcons.countryFlag(null));
        assertNull(OptionIcons.countryFlag("D"));
        assertNull(OptionIcons.countryFlag("DEU"));
        assertNull(OptionIcons.countryFlag("D1"));
        assertNull(OptionIcons.countryFlag("ÄD"));
        // England: black flag, tags g b e n g, cancel tag.
        assertEquals(new String(new int[] {0x1F3F4, 0xE0067, 0xE0062, 0xE0065, 0xE006E, 0xE0067, 0xE007F}, 0, 7),
                OptionIcons.ENGLAND);
        assertEquals(new String(new int[] {0x1F3F4, 0xE0067, 0xE0062, 0xE0073, 0xE0063, 0xE0074, 0xE007F}, 0, 7),
                OptionIcons.SCOTLAND);
        assertEquals(new String(new int[] {0x1F3F4, 0xE0067, 0xE0062, 0xE0077, 0xE006C, 0xE0073, 0xE007F}, 0, 7),
                OptionIcons.WALES);
        assertTrue(OptionIcons.ENGLAND.length() <= HevalSettings.MAX_ICON_LENGTH);
        assertNull(OptionIcons.subdivisionFlag("GBENG"));
        assertNull(OptionIcons.subdivisionFlag("gb"));
        assertNull(OptionIcons.subdivisionFlag("gb-eng"));
    }
}
