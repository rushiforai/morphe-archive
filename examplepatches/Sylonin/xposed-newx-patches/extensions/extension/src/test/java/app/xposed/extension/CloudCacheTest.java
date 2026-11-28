package app.xposed.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.json.JSONObject;
import org.junit.Test;

import java.util.concurrent.TimeUnit;

public class CloudCacheTest {
    private static final long NOW = 1_780_000_000_000L;

    private static JSONObject entry() throws Exception {
        return new JSONObject().put("l", "Japan").put("d", "Japan App Store").put("a", true)
                .put("t", NOW / 1000 - 60).put("id", "42");
    }

    @Test
    public void readsCreationAndHandleChanges() throws Exception {
        AccountInfo info = CloudCache.parseEntry(entry().put("c", 1_300_000_000L).put("uc", 2), NOW);
        assertEquals("Japan", info.location);
        assertEquals(42, info.userId);
        assertEquals(AccountInfo.ORIGIN_CLOUD, info.origin);
        assertEquals(1_300_000_000_000L, info.details.createdAt);
        assertEquals(2, info.details.handleChanges);
        // The cache doesn't carry About's verification answers.
        assertNull(info.details.identityVerified);
    }

    @Test
    public void ignoresImpossibleCreationTimes() throws Exception {
        assertEquals(0, CloudCache.parseEntry(entry().put("c", NOW / 1000 + 60), NOW).details.createdAt);
        assertEquals(0, CloudCache.parseEntry(entry().put("c", -5), NOW).details.createdAt);
        assertEquals(-1, CloudCache.parseEntry(entry(), NOW).details.handleChanges);
    }

    @Test
    public void dropsExpiredAndEmptyEntries() throws Exception {
        long old = (NOW - TimeUnit.DAYS.toMillis(61)) / 1000;
        assertNull(CloudCache.parseEntry(entry().put("t", old), NOW));
        assertNull(CloudCache.parseEntry(new JSONObject().put("t", NOW / 1000).put("c", 1_300_000_000L), NOW));
    }
}
