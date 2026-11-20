package app.richyss.extension;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Pure Java validation and serialisation for the Richyss bridge wire protocol.
 *
 * <p>This class deliberately has no Android dependency so that the protocol can be
 * unit tested on the JVM. It is the single source of truth for what the bridge
 * accepts and what it reports back.</p>
 */
public final class BridgeProtocol {
    public static final String VERSION = "1.0.0";
    public static final String PROTOCOL = "1";
    public static final int MAX_PAYLOAD_BYTES = 4096;
    public static final int MAX_BUTTONS = 2;

    /** Packages allowed to use the bridge. Kept in sync with the app's applicationId. */
    public static final String[] ALLOWED_PACKAGES = {"com.richyss.app", "com.richyss.app.debug"};

    private BridgeProtocol() {
    }

    /** Thrown when a payload sent by Richyss is not acceptable. */
    public static final class InvalidPayloadException extends Exception {
        public InvalidPayloadException(String message) {
            super(message);
        }
    }

    public static boolean isAllowedPackage(String packageName) {
        if (packageName == null) {
            return false;
        }
        for (String allowed : ALLOWED_PACKAGES) {
            if (allowed.equals(packageName)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Validates and normalises a presence payload.
     *
     * @return a new JSON object containing only supported fields
     */
    public static JSONObject parsePresence(String raw) throws InvalidPayloadException {
        if (raw == null || raw.trim().isEmpty()) {
            throw new InvalidPayloadException("Empty payload");
        }
        if (raw.getBytes(java.nio.charset.StandardCharsets.UTF_8).length > MAX_PAYLOAD_BYTES) {
            throw new InvalidPayloadException("Payload exceeds " + MAX_PAYLOAD_BYTES + " bytes");
        }

        JSONObject source;
        try {
            source = new JSONObject(raw);
        } catch (JSONException e) {
            throw new InvalidPayloadException("Payload is not a JSON object");
        }

        JSONObject out = new JSONObject();
        try {
            String activityName = text(source, "activityName", 128, true);
            out.put("activityName", activityName);
            out.put("details", text(source, "details", 128, false));
            out.put("state", text(source, "state", 128, false));
            out.put("largeImage", text(source, "largeImage", 256, false));
            out.put("smallImage", text(source, "smallImage", 256, false));
            out.put("largeText", text(source, "largeText", 128, false));
            out.put("smallText", text(source, "smallText", 128, false));

            long start = timestamp(source, "startTimestamp");
            long end = timestamp(source, "endTimestamp");
            if (start > 0) {
                out.put("startTimestamp", start);
            }
            if (end > 0) {
                if (start > 0 && end < start) {
                    throw new InvalidPayloadException("endTimestamp is before startTimestamp");
                }
                out.put("endTimestamp", end);
            }

            JSONArray buttons = buttons(source.optJSONArray("buttons"));
            out.put("buttons", buttons);
            out.put("protocol", PROTOCOL);
        } catch (JSONException e) {
            throw new InvalidPayloadException("Malformed payload: " + e.getMessage());
        }
        return out;
    }

    /** Builds the status document returned to Richyss. */
    public static JSONObject buildStatus(String discordVersion, long updatedAt, String error) {
        JSONObject status = new JSONObject();
        try {
            status.put("bridge", true);
            status.put("version", VERSION);
            status.put("protocol", PROTOCOL);
            status.put("discordVersion", discordVersion == null ? "" : discordVersion);
            status.put("hasPresence", updatedAt > 0);
            status.put("updatedAt", updatedAt);
            if (error != null) {
                status.put("error", error);
            }
        } catch (JSONException ignored) {
            // JSONObject with String/long values cannot fail here.
        }
        return status;
    }

    private static String text(JSONObject source, String key, int maxLength, boolean required)
            throws JSONException, InvalidPayloadException {
        if (!source.has(key) || source.isNull(key)) {
            if (required) {
                throw new InvalidPayloadException("Missing required field: " + key);
            }
            return "";
        }
        Object value = source.get(key);
        if (!(value instanceof String)) {
            throw new InvalidPayloadException("Field " + key + " must be a string");
        }
        String trimmed = ((String) value).trim();
        if (required && trimmed.isEmpty()) {
            throw new InvalidPayloadException("Field " + key + " must not be empty");
        }
        if (trimmed.length() > maxLength) {
            throw new InvalidPayloadException(
                    "Field " + key + " exceeds " + maxLength + " characters");
        }
        return trimmed;
    }

    private static long timestamp(JSONObject source, String key)
            throws InvalidPayloadException, JSONException {
        if (!source.has(key) || source.isNull(key)) {
            return 0L;
        }
        Object value = source.get(key);
        if (value instanceof Number) {
            long result = ((Number) value).longValue();
            if (result < 0) {
                throw new InvalidPayloadException(key + " must be positive");
            }
            return result;
        }
        if (value instanceof String) {
            try {
                return Long.parseLong(((String) value).trim());
            } catch (NumberFormatException e) {
                throw new InvalidPayloadException(key + " must be a unix timestamp in milliseconds");
            }
        }
        throw new InvalidPayloadException(key + " must be a number");
    }

    private static JSONArray buttons(JSONArray source) throws InvalidPayloadException, JSONException {
        JSONArray result = new JSONArray();
        if (source == null) {
            return result;
        }
        if (source.length() > MAX_BUTTONS) {
            throw new InvalidPayloadException("At most " + MAX_BUTTONS + " buttons are supported");
        }
        for (int i = 0; i < source.length(); i++) {
            JSONObject button = source.optJSONObject(i);
            if (button == null) {
                throw new InvalidPayloadException("Button " + i + " is not an object");
            }
            String label = button.optString("label", "").trim();
            String url = button.optString("url", "").trim();
            if (label.isEmpty()) {
                throw new InvalidPayloadException("Button " + i + " has no label");
            }
            if (label.length() > 32) {
                throw new InvalidPayloadException("Button " + i + " label exceeds 32 characters");
            }
            if (!url.isEmpty() && !(url.startsWith("https://") || url.startsWith("http://"))) {
                throw new InvalidPayloadException("Button " + i + " url must be http(s)");
            }
            if (url.length() > 512) {
                throw new InvalidPayloadException("Button " + i + " url exceeds 512 characters");
            }
            JSONObject clean = new JSONObject();
            clean.put("label", label);
            clean.put("url", url);
            result.put(clean);
        }
        return result;
    }
}
