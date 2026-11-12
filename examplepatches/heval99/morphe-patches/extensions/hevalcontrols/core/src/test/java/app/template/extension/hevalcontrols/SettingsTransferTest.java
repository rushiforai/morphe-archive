package app.template.extension.hevalcontrols;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/** Profiles and backup: exporting the choices, reading them back, and applying them in one write. */
public class SettingsTransferTest {
    /** ads (switch, on), quiet (switch, off), patchtime (build-time only), countries (list). */
    private static final String REGISTRY = "hevalcontrols-registry:1\n"
            + "ads\tHide ads\t\tA\t1\t0\t0\t\n"
            + "quiet\tQuiet\t\tA\t0\t0\t0\t\n"
            + "patchtime\tPatch time\t\tA\t1\t0\t1\t\n"
            + "countries\tHidden countries\t\tA\t0\t0\t0\t\tlist\n";

    private FakeStore store;

    @Before
    public void setUp() {
        HevalSettings.resetForTests();
        Registry.install(REGISTRY);
        store = new FakeStore();
        HevalSettings.initForTests(store);
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
    public void exportListsRuntimeSwitchesAndPickedKeysButNotBuildTimeFeatures() {
        HevalSettings.setEnabled("quiet", true);
        HevalSettings.setEnabled("ads", false);
        HevalSettings.setHidden("countries", set("FR", "ES"));
        String text = SettingsTransfer.export(Registry.get());
        assertEquals("hevalcontrols-settings:1\n"
                + "f\tads\t0\n"
                + "f\tquiet\t1\n"
                + "l\tcountries\tES\n"
                + "l\tcountries\tFR\n", text);
    }

    @Test
    public void exportThenImportRestoresTheChoices() {
        HevalSettings.setEnabled("quiet", true);
        HevalSettings.setHidden("countries", set("FR", "ES"));
        String text = SettingsTransfer.export(Registry.get());

        HevalSettings.resetAll();
        assertFalse(HevalSettings.isChosen("quiet"));
        assertTrue(HevalSettings.pickedHidden("countries").isEmpty());

        SettingsTransfer.Parsed parsed = SettingsTransfer.parse(text, Registry.get());
        assertTrue(parsed.valid);
        assertEquals(0, parsed.skipped);
        assertTrue(SettingsTransfer.apply(parsed));
        assertTrue(HevalSettings.isChosen("quiet"));
        assertTrue(HevalSettings.isChosen("ads"));
        assertEquals(set("FR", "ES"), HevalSettings.pickedHidden("countries"));
    }

    @Test
    public void applyIsOneWrite() {
        int before = store.commits;
        SettingsTransfer.Parsed parsed = SettingsTransfer.parse(
                "hevalcontrols-settings:1\nf\tads\t0\nf\tquiet\t1\nl\tcountries\tES\n", Registry.get());
        assertTrue(SettingsTransfer.apply(parsed));
        assertEquals(before + 1, store.commits);
    }

    @Test
    public void aListMissingFromTheTextIsImportedAsEmpty() {
        HevalSettings.setHidden("countries", set("ES"));
        SettingsTransfer.Parsed parsed = SettingsTransfer.parse("hevalcontrols-settings:1\nf\tads\t1\n", Registry.get());
        assertTrue(SettingsTransfer.apply(parsed));
        assertTrue(HevalSettings.pickedHidden("countries").isEmpty());
    }

    @Test
    public void unknownWrongKindAndBadRecordsAreSkippedAndCounted() {
        String text = "hevalcontrols-settings:1\n"
                + "f\tads\t0\n"
                + "f\tmissing.feature\t1\n"      // unknown id
                + "f\tcountries\t1\n"            // a list written as a switch
                + "l\tads\tES\n"                 // a switch written as a list
                + "f\tpatchtime\t0\n"            // build-time only
                + "f\tquiet\tmaybe\n"            // bad value
                + "l\tcountries\t\n"             // empty key
                + "not a record\n";
        SettingsTransfer.Parsed parsed = SettingsTransfer.parse(text, Registry.get());
        assertTrue(parsed.valid);
        assertEquals(Collections.singletonMap("ads", false), parsed.switches);
        assertEquals(7, parsed.skipped);
        assertTrue(SettingsTransfer.apply(parsed));
        assertFalse(HevalSettings.isChosen("ads"));
        assertFalse(HevalSettings.isChosen("quiet"));
    }

    @Test
    public void textWithoutTheHeaderOrWithAnotherVersionIsRejectedWholly() {
        assertFalse(SettingsTransfer.parse(null, Registry.get()).valid);
        assertFalse(SettingsTransfer.parse("", Registry.get()).valid);
        assertFalse(SettingsTransfer.parse("f\tads\t0\n", Registry.get()).valid);
        assertFalse(SettingsTransfer.parse("hevalcontrols-settings:2\nf\tads\t0\n", Registry.get()).valid);
        assertFalse(SettingsTransfer.apply(SettingsTransfer.parse("nonsense", Registry.get())));
        assertTrue(HevalSettings.isChosen("ads"));
    }

    @Test
    public void windowsLineEndingsAreAccepted() {
        SettingsTransfer.Parsed parsed = SettingsTransfer.parse("hevalcontrols-settings:1\r\nf\tads\t0\r\nl\tcountries\tES\r\n", Registry.get());
        assertTrue(parsed.valid);
        assertEquals(0, parsed.skipped);
        assertEquals(set("ES"), parsed.lists.get("countries"));
    }

    @Test
    public void applyChoicesIgnoresWhatTheRegistryDoesNotHave() {
        assertFalse(HevalSettings.applyChoices(Collections.singletonMap("nope", true), null));
        assertFalse(HevalSettings.applyChoices(Collections.singletonMap("countries", true), null));
        assertFalse(HevalSettings.applyChoices(null, Collections.singletonMap("ads", set("ES"))));
        assertTrue(HevalSettings.applyChoices(Collections.singletonMap("quiet", true), null));
        assertTrue(HevalSettings.isChosen("quiet"));
    }
}
