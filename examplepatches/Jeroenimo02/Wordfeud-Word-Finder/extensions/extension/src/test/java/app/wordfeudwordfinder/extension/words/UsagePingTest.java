package app.wordfeudwordfinder.extension.words;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import app.wordfeudwordfinder.extension.core.Storage;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;
import org.json.JSONObject;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public class UsagePingTest {
    @Rule public TemporaryFolder tmp = new TemporaryFolder();

    private final List<String> sent = new ArrayList<>();
    private boolean fail;
    private final AtomicLong now = new AtomicLong(1_793_800_000_000L); // 2026-11-04 UTC

    private WordReporter reporter() {
        return new WordReporter("https://w.example/report", (u, json) -> {
            if (fail) throw new java.io.IOException("offline");
            sent.add(json);
        }, Runnable::run);
    }

    @Test
    public void oncePerDayWithVersionAndRulesetsOnly() throws Exception {
        Storage storage = new Storage(tmp.getRoot());
        UsagePing p = new UsagePing(storage, reporter(), now::get);
        p.onGames(Arrays.asList(5, 2));
        p.onGames(Arrays.asList(2));
        assertEquals(1, sent.size());
        JSONObject o = new JSONObject(sent.get(0));
        assertEquals(3, o.length());
        assertEquals("ping", o.getString("type"));
        assertTrue(o.has("patch"));
        assertEquals(2, o.getJSONArray("rulesets").getInt(0));
        assertEquals(5, o.getJSONArray("rulesets").getInt(1));
        // also after a restart the same day
        new UsagePing(storage, reporter(), now::get).onGames(Arrays.asList(2));
        assertEquals(1, sent.size());
        // the next day again
        now.addAndGet(24L * 3600 * 1000);
        p.onGames(Arrays.asList(2));
        assertEquals(2, sent.size());
    }

    @Test
    public void failedPingIsRetriedLater() {
        UsagePing p = new UsagePing(new Storage(tmp.getRoot()), reporter(), now::get);
        fail = true;
        p.onGames(Arrays.asList(2));
        assertTrue(sent.isEmpty());
        fail = false;
        p.onGames(Arrays.asList(2));
        assertEquals(1, sent.size());
    }

    @Test
    public void nothingWithoutGamesOrWhenReportingIsOff() {
        new UsagePing(new Storage(tmp.getRoot()), reporter(), now::get).onGames(Collections.<Integer>emptyList());
        new UsagePing(new Storage(tmp.getRoot()), reporter(), now::get).onGames(null);
        WordReporter off = new WordReporter("", (u, json) -> sent.add(json), Runnable::run);
        new UsagePing(new Storage(tmp.getRoot()), off, now::get).onGames(Arrays.asList(2));
        assertTrue(sent.isEmpty());
        assertEquals("2026-11-04", UsagePing.day(now.get()));
    }
}
