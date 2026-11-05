package app.template.extension.hevalcontrols;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.Test;

public class RegistryCodecTest {
    static String fixture() throws IOException {
        return fixture("registry-v1.txt");
    }

    static String fixture(String name) throws IOException {
        try (InputStream in = RegistryCodecTest.class.getClassLoader().getResourceAsStream(name)) {
            assertNotNull(name + " fixture missing", in);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int read;
            while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
            // core.autocrlf may check the fixture out with CRLF; the patch writes LF.
            return new String(out.toByteArray(), StandardCharsets.UTF_8).replace("\r\n", "\n");
        }
    }

    @Test
    public void decodesTheGoldenFixture() throws IOException {
        RegistryCodec.Result result = RegistryCodec.decode(fixture());
        assertEquals(1, result.version);
        assertTrue(result.supported);
        assertEquals(0, result.skipped);
        assertEquals(4, result.features.size());

        Feature ads = result.features.get(0);
        assertEquals("demo.hide_ads", ads.id);
        assertEquals("Hide ads", ads.name);
        assertEquals("Ads", ads.category);
        assertTrue(ads.defaultEnabled);
        assertFalse(ads.restartRequired);
        assertFalse(ads.buildTimeOnly);
        assertEquals(Collections.emptyList(), ads.dependencies);

        Feature receipts = result.features.get(1);
        assertEquals("Chats stay unread for the sender.\nApplies to new chats.", receipts.description);
        assertFalse(receipts.defaultEnabled);
        assertTrue(receipts.restartRequired);
        assertEquals(Collections.singletonList("demo.hide_ads"), receipts.dependencies);

        assertTrue(result.features.get(2).buildTimeOnly);

        Feature rtl = result.features.get(3);
        assertEquals("\u0625\u062e\u0641\u0627\u0621 \u0627\u0644\u0642\u0635\u0635", rtl.name);
        assertEquals("Tab\there, backslash \\ and \u00e9moji \u2713", rtl.description);
        assertEquals(Arrays.asList("demo.hide_ads", "demo.telemetry"), rtl.dependencies);
    }

    @Test
    public void emptyOrMissingRegistryIsEmptyAndSupported() {
        for (String encoded : new String[] {null, ""}) {
            RegistryCodec.Result result = RegistryCodec.decode(encoded);
            assertTrue(result.supported);
            assertEquals(0, result.version);
            assertTrue(result.features.isEmpty());
        }
    }

    @Test
    public void newerVersionIsUnsupportedAndEmpty() {
        RegistryCodec.Result result = RegistryCodec.decode("hevalcontrols-registry:2\na.b\tA\t\tX\t1\t0\t0\t\n");
        assertEquals(2, result.version);
        assertFalse(result.supported);
        assertTrue(result.features.isEmpty());
    }

    @Test
    public void unreadableHeaderIsUnsupported() {
        for (String encoded : new String[] {"garbage", "hevalcontrols-registry:x\n", "a.b\tA\t\tX\t1\t0\t0\t\n"}) {
            RegistryCodec.Result result = RegistryCodec.decode(encoded);
            assertFalse(encoded, result.supported);
            assertEquals(-1, result.version);
            assertTrue(result.features.isEmpty());
        }
    }

    @Test
    public void malformedRecordsAreSkippedNotFatal() {
        String encoded = "hevalcontrols-registry:1\n"
                + "ok.one\tOne\t\tX\t1\t0\t0\t\n"
                + "too\tfew\tfields\n"
                + "Bad-Id\tBad\t\tX\t1\t0\t0\t\n"
                + "bad.flag\tBad\t\tX\tyes\t0\t0\t\n"
                + "bad.escape\tBad \\q\t\tX\t1\t0\t0\t\n"
                + "bad.dangling\tBad \\\t\tX\t1\t0\t0\t\n"
                + "ok.one\tDuplicate\t\tX\t0\t0\t0\t\n"
                + "\n"
                + "ok.two\tTwo\t\tX\t0\t0\t0\t\textra\tfields\tignored\n";
        RegistryCodec.Result result = RegistryCodec.decode(encoded);
        assertTrue(result.supported);
        assertEquals(6, result.skipped);
        assertEquals(2, result.features.size());
        assertEquals("One", result.features.get(0).name);
        assertEquals("ok.two", result.features.get(1).id);
    }

    @Test
    public void invalidOrSelfDependenciesAreDropped() {
        RegistryCodec.Result result = RegistryCodec.decode(
                "hevalcontrols-registry:1\nx.a\tA\t\tX\t1\t0\t0\tx.a,Bad,,x.b,x.b\n");
        List<String> dependencies = result.features.get(0).dependencies;
        assertEquals(Collections.singletonList("x.b"), dependencies);
    }

    @Test
    public void crlfLineEndingsAreTolerated() {
        RegistryCodec.Result result = RegistryCodec.decode("hevalcontrols-registry:1\r\nx.a\tA\t\tX\t1\t0\t0\t\r\n");
        assertTrue(result.supported);
        assertEquals(1, result.features.size());
        assertEquals(Collections.emptyList(), result.features.get(0).dependencies);
    }

    @Test
    public void theSwitchOnlyFixtureStillDecodesAsSwitches() throws IOException {
        // Registries written before list settings existed decode exactly as before.
        for (Feature feature : RegistryCodec.decode(fixture()).features) {
            assertEquals(Feature.KIND_SWITCH, feature.kind);
            assertFalse(feature.isList());
        }
    }

    @Test
    public void decodesTheListFixture() throws IOException {
        RegistryCodec.Result result = RegistryCodec.decode(fixture("registry-v1-lists.txt"));
        assertEquals(1, result.version);
        assertTrue(result.supported);
        assertEquals(0, result.skipped);
        assertEquals(3, result.features.size());

        Feature ads = result.features.get(0);
        assertFalse(ads.isList());
        assertTrue(ads.defaultEnabled);

        Feature countries = result.features.get(1);
        assertEquals("demo.hidden_countries", countries.id);
        assertEquals("Hidden countries", countries.name);
        assertEquals("Leagues", countries.category);
        assertTrue(countries.isList());
        assertEquals(Feature.KIND_LIST, countries.kind);
        assertFalse(countries.defaultEnabled);
        assertTrue(countries.restartRequired);
        assertFalse(countries.buildTimeOnly);
        assertEquals(Collections.emptyList(), countries.dependencies);

        Feature teams = result.features.get(2);
        assertTrue(teams.isList());
        assertFalse(teams.restartRequired);
        assertEquals(Collections.singletonList("demo.hide_ads"), teams.dependencies);
    }

    @Test
    public void listRecordRules() {
        RegistryCodec.Result result = RegistryCodec.decode("hevalcontrols-registry:1\n"
                + "list.on\tOn\t\tX\t1\t0\t0\t\tlist\n"          // a list never starts on
                + "list.patch_time\tP\t\tX\t0\t0\t1\t\tlist\n"   // a list cannot be build-time-only
                + "kind.unknown\tU\t\tX\t1\t0\t0\t\tslider\n"     // unknown kind: a switch, as before
                + "kind.empty\tE\t\tX\t0\t0\t0\t\t\n"             // empty kind: a switch
                + "list.more\tM\t\tX\t0\t0\t0\t\tlist\tlater\n"); // fields after the kind are ignored
        assertEquals(1, result.skipped);
        assertEquals(4, result.features.size());
        Feature on = result.features.get(0);
        assertTrue(on.isList());
        assertFalse(on.defaultEnabled);
        assertFalse(result.features.get(1).isList());
        assertTrue(result.features.get(1).defaultEnabled);
        assertFalse(result.features.get(2).isList());
        assertTrue(result.features.get(3).isList());
    }

    @Test
    public void listFeatureConstructorRules() {
        Feature legacy = new Feature("x.a", "A", "", "X", true, false, false, null);
        assertEquals(Feature.KIND_SWITCH, legacy.kind);
        Feature list = new Feature("x.b", "B", "", "X", true, false, false, null, Feature.KIND_LIST);
        assertTrue(list.isList());
        assertFalse(list.defaultEnabled);
        try {
            new Feature("x.c", "C", "", "X", false, false, true, null, Feature.KIND_LIST);
            throw new AssertionError("a build-time-only list was accepted");
        } catch (IllegalArgumentException expected) {
            // fine
        }
    }

    @Test
    public void featureIdRules() {
        assertTrue(Feature.isValidId("linkedin.hide_promoted"));
        assertTrue(Feature.isValidId("a"));
        assertFalse(Feature.isValidId(null));
        assertFalse(Feature.isValidId(""));
        assertFalse(Feature.isValidId("1abc"));
        assertFalse(Feature.isValidId("Abc"));
        assertFalse(Feature.isValidId("a-b"));
        assertFalse(Feature.isValidId("a,b"));
        char[] longId = new char[65];
        Arrays.fill(longId, 'a');
        assertFalse(Feature.isValidId(new String(longId)));
    }
}
