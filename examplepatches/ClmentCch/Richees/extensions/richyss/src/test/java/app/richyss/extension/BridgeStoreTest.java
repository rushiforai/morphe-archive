package app.richyss.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.json.JSONObject;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;

/** The store is plain java.io + org.json, so it is testable without Android. */
public class BridgeStoreTest {

    @Rule
    public TemporaryFolder folder = new TemporaryFolder();

    private BridgeStore store() throws Exception {
        File files = folder.newFolder("files");
        return new BridgeStore(files);
    }

    @Test
    public void writesAndReadsPresence() throws Exception {
        BridgeStore store = store();
        JSONObject payload = BridgeProtocol.parsePresence("{\"activityName\":\"Richyss\"}");
        payload.put("updatedAt", System.currentTimeMillis());

        store.writePresence(payload);

        JSONObject read = store.readPresence();
        assertNotNull(read);
        assertEquals("Richyss", read.getString("activityName"));
        assertTrue(store.updatedAt() > 0);
    }

    @Test
    public void deletesPresenceOnRequest() throws Exception {
        BridgeStore store = store();
        JSONObject payload = BridgeProtocol.parsePresence("{\"activityName\":\"Richyss\"}");
        payload.put("updatedAt", System.currentTimeMillis());
        store.writePresence(payload);

        store.deletePresence();

        assertNull(store.readPresence());
        assertEquals(0L, store.updatedAt());
    }

    @Test
    public void dropsPresenceOlderThan24Hours() throws Exception {
        BridgeStore store = store();
        JSONObject payload = BridgeProtocol.parsePresence("{\"activityName\":\"Old\"}");
        payload.put("updatedAt", System.currentTimeMillis() - 25L * 60L * 60L * 1000L);
        store.writePresence(payload);

        assertNull(store.readPresence());
    }

    @Test
    public void purgeRemovesExpiredPresence() throws Exception {
        BridgeStore store = store();
        JSONObject payload = BridgeProtocol.parsePresence("{\"activityName\":\"Old\"}");
        payload.put("updatedAt", System.currentTimeMillis() - 48L * 60L * 60L * 1000L);
        store.writePresence(payload);

        store.purgeExpired();

        assertNull(store.readPresence());
    }

    @Test
    public void metaDefaultsToEmptyObject() throws Exception {
        assertEquals(0, store().readMeta().length());
    }

    @Test
    public void metaRoundTrip() throws Exception {
        BridgeStore store = store();
        JSONObject meta = new JSONObject();
        meta.put("bridgeVersion", BridgeProtocol.VERSION);
        meta.put("discordVersion", "270.0");
        store.writeMeta(meta);

        assertEquals("1.0.0", store.readMeta().getString("bridgeVersion"));
        assertEquals("270.0", store.readMeta().getString("discordVersion"));
    }
}
