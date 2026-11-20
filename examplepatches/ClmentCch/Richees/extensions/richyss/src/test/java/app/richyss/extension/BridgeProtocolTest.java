package app.richyss.extension;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

/** JVM unit tests for the bridge wire protocol. */
public class BridgeProtocolTest {

    @Test
    public void acceptsMinimalPayload() throws Exception {
        JSONObject result = BridgeProtocol.parsePresence("{\"activityName\":\"Richyss\"}");

        assertEquals("Richyss", result.getString("activityName"));
        assertEquals("", result.getString("details"));
        assertEquals(0, result.getJSONArray("buttons").length());
        assertEquals(BridgeProtocol.PROTOCOL, result.getString("protocol"));
    }

    @Test
    public void acceptsFullPayload() throws Exception {
        String payload = "{"
                + "\"activityName\":\"Richyss\","
                + "\"details\":\"Editing a profile\","
                + "\"state\":\"Live preview\","
                + "\"largeImage\":\"logo\","
                + "\"smallImage\":\"badge\","
                + "\"largeText\":\"Richyss\","
                + "\"smallText\":\"Patched\","
                + "\"startTimestamp\":1700000000000,"
                + "\"endTimestamp\":1700003600000,"
                + "\"buttons\":[{\"label\":\"Repo\",\"url\":\"https://github.com/ClmentCch/Richees\"}]"
                + "}";

        JSONObject result = BridgeProtocol.parsePresence(payload);

        assertEquals(1700000000000L, result.getLong("startTimestamp"));
        assertEquals(1700003600000L, result.getLong("endTimestamp"));
        JSONArray buttons = result.getJSONArray("buttons");
        assertEquals(1, buttons.length());
        assertEquals("Repo", buttons.getJSONObject(0).getString("label"));
    }

    @Test
    public void rejectsMissingActivityName() {
        assertRejected("{\"details\":\"no name\"}", "Missing required field");
    }

    @Test
    public void rejectsInvalidJson() {
        assertRejected("not json", "not a JSON object");
    }

    @Test
    public void rejectsOversizedPayload() {
        StringBuilder builder = new StringBuilder("{\"activityName\":\"x\",\"details\":\"");
        for (int i = 0; i < BridgeProtocol.MAX_PAYLOAD_BYTES; i++) {
            builder.append('a');
        }
        builder.append("\"}");
        assertRejected(builder.toString(), "exceeds");
    }

    @Test
    public void rejectsTooManyButtons() {
        assertRejected(
                "{\"activityName\":\"a\",\"buttons\":["
                        + "{\"label\":\"1\"},{\"label\":\"2\"},{\"label\":\"3\"}]}",
                "At most 2 buttons"
        );
    }

    @Test
    public void rejectsInsecureButtonUrl() {
        assertRejected(
                "{\"activityName\":\"a\",\"buttons\":[{\"label\":\"x\",\"url\":\"javascript:alert(1)\"}]}",
                "http(s)"
        );
    }

    @Test
    public void rejectsReversedTimestamps() {
        assertRejected(
                "{\"activityName\":\"a\",\"startTimestamp\":2000,\"endTimestamp\":1000}",
                "before startTimestamp"
        );
    }

    @Test
    public void trimsWhitespace() throws Exception {
        JSONObject result = BridgeProtocol.parsePresence("{\"activityName\":\"  Richyss  \"}");
        assertEquals("Richyss", result.getString("activityName"));
    }

    @Test
    public void reportsStatus() throws Exception {
        JSONObject status = BridgeProtocol.buildStatus("270.0", 1234L, null);

        assertTrue(status.getBoolean("bridge"));
        assertEquals(BridgeProtocol.VERSION, status.getString("version"));
        assertEquals("270.0", status.getString("discordVersion"));
        assertTrue(status.getBoolean("hasPresence"));
        assertEquals(1234L, status.getLong("updatedAt"));
    }

    @Test
    public void reportsEmptyStatus() throws Exception {
        JSONObject status = BridgeProtocol.buildStatus(null, 0L, "none");
        assertFalse(status.getBoolean("hasPresence"));
        assertEquals("", status.getString("discordVersion"));
    }

    @Test
    public void allowlistOnlyContainsRichyss() {
        assertTrue(BridgeProtocol.isAllowedPackage("com.richyss.app"));
        assertTrue(BridgeProtocol.isAllowedPackage("com.richyss.app.debug"));
        assertFalse(BridgeProtocol.isAllowedPackage("com.discord"));
        assertFalse(BridgeProtocol.isAllowedPackage(null));
    }

    private static void assertRejected(String payload, String expectedMessage) {
        try {
            BridgeProtocol.parsePresence(payload);
            fail("Payload should have been rejected: " + payload);
        } catch (BridgeProtocol.InvalidPayloadException e) {
            assertTrue(
                    "Unexpected message: " + e.getMessage(),
                    e.getMessage().contains(expectedMessage)
            );
        }
    }
}
