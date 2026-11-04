package app.wordfeudwordfinder.extension.play;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public class RefreshOrderTest {
    @Rule
    public TemporaryFolder tmp = new TemporaryFolder();

    @Test
    public void parsesCommaAndLineSeparatedNamesCaseInsensitively() {
        assertEquals(Arrays.asList("RouteBounce", "ForegroundSignal", "FcmNudge"),
                RefreshOrder.parse(" routebounce,ForegroundSignal\r\n\n  FCMNUDGE \n"));
        assertEquals(Arrays.asList("FcmNudge", "RouteBounce"), RefreshOrder.parse("FcmNudge; RouteBounce\t"));
        assertEquals(Arrays.asList("LifecycleBounce"), RefreshOrder.parse("lifecyclebounce"));
    }

    @Test
    public void skipsCommentsUnknownNamesAndDuplicates() {
        assertEquals(Collections.singletonList("RouteBounce"),
                RefreshOrder.parse("# test V4\nSelfFetch, RouteBounce # second\nroutebounce\n"));
        assertEquals(Collections.emptyList(), RefreshOrder.parse(""));
        assertEquals(Collections.emptyList(), RefreshOrder.parse(null));
    }

    @Test
    public void buildsStrategiesInOrder() {
        RefreshStrategiesTest.FakeMessenger m = new RefreshStrategiesTest.FakeMessenger();
        List<Refresher.Strategy> s = RefreshOrder.strategies(Arrays.asList("FcmNudge", "RouteBounce",
                "ForegroundSignal", "LifecycleBounce", "Unknown"), m);
        assertEquals(4, s.size());
        assertTrue(s.get(0) instanceof FcmNudge);
        assertTrue(s.get(1) instanceof RouteBounce);
        assertTrue(s.get(2) instanceof ForegroundSignal);
        assertTrue(s.get(3) instanceof LifecycleBounce);
    }

    @Test
    public void externalDebugFileOnlyFromApi30() {
        File internal = new File("/i/debug_refresh_order.txt");
        File external = new File("/e/debug_refresh_order.txt");
        // Android <= 10: other apps with WRITE_EXTERNAL_STORAGE could write the external file (no opt-in then)
        assertEquals(Arrays.asList(internal), RefreshOrder.debugFiles(internal, external, 29));
        assertEquals(Arrays.asList(internal, external), RefreshOrder.debugFiles(internal, external, 30));
        assertEquals(Arrays.asList(internal), RefreshOrder.debugFiles(internal, null, 34));
    }

    @Test
    public void debugFileIsTheOptIn() throws Exception {
        File a = new File(tmp.getRoot(), "a/debug_refresh_order.txt");
        File b = new File(tmp.getRoot(), "b/debug_refresh_order.txt");
        assertNull(RefreshOrder.readDebugFile(Arrays.asList(a, b))); // no file: release behaviour
        write(b, "RouteBounce");
        assertEquals("RouteBounce", RefreshOrder.readDebugFile(Arrays.asList(a, null, b)));
        write(a, ""); // an empty file still opts in (logs only, empty order)
        assertEquals("", RefreshOrder.readDebugFile(Arrays.asList(a, b)));
        StringBuilder big = new StringBuilder();
        for (int i = 0; i < 10000; i++) big.append('x');
        write(a, big.toString());
        assertEquals(RefreshOrder.MAX_DEBUG_BYTES, RefreshOrder.readDebugFile(Arrays.asList(a)).length());
    }

    private static void write(File f, String s) throws Exception {
        f.getParentFile().mkdirs();
        try (FileOutputStream out = new FileOutputStream(f)) {
            out.write(s.getBytes(StandardCharsets.UTF_8));
        }
    }
}
