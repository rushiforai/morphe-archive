package app.vantage.extension.music;

import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.List;

/**
 * Lets YouTube Music play a video that its own player API refuses with
 * UNPLAYABLE ("This video is not available") when the same video is playable
 * through the non-Music client that the "Spoof video streams" patch already
 * fetched streams from.
 *
 * Music's /player response for such a video has playabilityStatus UNPLAYABLE
 * and no streamingData, so the app never builds its streaming-data model and
 * the spoof patch's stream override never runs. The injected call lands just
 * before each place that checks "does this response carry streaming data", and
 * swaps in the spoofed client's playabilityStatus (OK) and streamingData. Every
 * later reader then sees a playable response.
 *
 * The response proto is handled at the wire-format level (field numbers from
 * the public InnerTube schema), not through obfuscated field names, so an app
 * update does not move anything this class depends on.
 */
@SuppressWarnings("unused")
public final class UnplayableOverride {
    private static final String TAG = "VantageUnplayable";

    // InnerTube PlayerResponse field numbers.
    private static final int FIELD_PLAYABILITY_STATUS = 2;
    private static final int FIELD_STREAMING_DATA = 4;
    private static final int FIELD_VIDEO_DETAILS = 11;
    // PlayabilityStatus.status / VideoDetails.videoId.
    private static final int FIELD_STATUS = 1;
    private static final int FIELD_VIDEO_ID = 1;

    private static final int STATUS_OK = 0;
    private static final int STATUS_UNPLAYABLE = 2;

    private static final String SPOOF_CLASS =
            "app.morphe.extension.shared.spoof.SpoofVideoStreamsPatch";
    private static final String SPOOF_REQUEST_CLASS =
            "app.morphe.extension.shared.spoof.requests.StreamOrDetailsDataRequest";

    private static volatile Method getStreamingData;
    private static volatile boolean spoofMissing;

    private UnplayableOverride() {
    }

    /**
     * Injection point. Called with the app's PlayerResponse proto right before
     * it checks whether the response has streaming data.
     */
    public static void onPlayerResponse(Object playerResponse) {
        if (playerResponse == null) return;
        try {
            byte[] original = toByteArray(playerResponse);
            if (original == null) return;

            byte[] status = firstField(original, FIELD_PLAYABILITY_STATUS);
            if (status == null) return;
            long statusCode = firstVarint(status, FIELD_STATUS, STATUS_OK);
            if (statusCode != STATUS_UNPLAYABLE) return;

            byte[] details = firstField(original, FIELD_VIDEO_DETAILS);
            byte[] idBytes = details == null ? null : firstField(details, FIELD_VIDEO_ID);
            if (idBytes == null || idBytes.length == 0) {
                Log.w(TAG, "UNPLAYABLE response without a video id, leaving it");
                return;
            }
            String videoId = new String(idBytes, "UTF-8");

            byte[] spoofed = spoofedResponse(videoId);
            if (spoofed == null) {
                Log.i(TAG, videoId + ": UNPLAYABLE and no spoofed stream available ("
                        + spoofDiagnosis(videoId) + "), leaving it");
                return;
            }
            byte[] spoofedStatus = firstField(spoofed, FIELD_PLAYABILITY_STATUS);
            long spoofedCode = spoofedStatus == null
                    ? STATUS_OK : firstVarint(spoofedStatus, FIELD_STATUS, STATUS_OK);
            if (spoofedCode != STATUS_OK || firstField(spoofed, FIELD_STREAMING_DATA) == null) {
                Log.i(TAG, videoId + ": spoofed response is not playable either, leaving it");
                return;
            }

            byte[] merged = replaceFields(original, spoofed,
                    FIELD_PLAYABILITY_STATUS, FIELD_STREAMING_DATA);
            Object replacement = parseLike(playerResponse, merged);
            copyInstanceFields(replacement, playerResponse);
            Log.i(TAG, videoId + ": Music said UNPLAYABLE, using the spoofed client's playable response");
        } catch (Throwable t) {
            Log.e(TAG, "onPlayerResponse failed, leaving the response unchanged", t);
        }
    }

    // MusicResponsiveListItemRenderer field numbers (Android InnerTube proto).
    private static final int ROW_NAVIGATION_ENDPOINT = 5;
    private static final int ROW_DISPLAY_POLICY = 20;
    // Swipe actions. A greyed-out row carries a stub with no background color,
    // which the playable-row path dereferences and crashes on, so drop it.
    private static final int ROW_SWIPE_ACTIONS = 25;
    private static final long DISPLAY_POLICY_GREY_OUT = 2;
    // NavigationEndpoint.watchEndpoint extension, WatchEndpoint.videoId.
    private static final int ENDPOINT_WATCH = 48687757;
    private static final int WATCH_VIDEO_ID = 1;

    private static final java.util.regex.Pattern THUMBNAIL_VIDEO_ID =
            java.util.regex.Pattern.compile("/vi(?:_webp)?/([A-Za-z0-9_-]{11})/");

    /**
     * Injection point. Called with a list row (MusicResponsiveListItemRenderer)
     * as its presenter binds it. A row for a video Music refuses comes greyed
     * out, with an "unavailable" command instead of a watch endpoint, so a tap
     * does nothing. Give it a plain watch endpoint and drop the grey-out; the
     * tap then reaches /player, where {@link #onPlayerResponse} takes over.
     */
    public static void onListItem(Object row) {
        if (row == null) return;
        try {
            byte[] original = toByteArray(row);
            if (original == null
                    || firstVarint(original, ROW_DISPLAY_POLICY, 0) != DISPLAY_POLICY_GREY_OUT) {
                return;
            }
            java.util.regex.Matcher m =
                    THUMBNAIL_VIDEO_ID.matcher(new String(original, "ISO-8859-1"));
            if (!m.find()) return;
            String videoId = m.group(1);

            ByteArrayOutputStream watch = new ByteArrayOutputStream();
            writeBytesField(watch, WATCH_VIDEO_ID, videoId.getBytes("UTF-8"));
            ByteArrayOutputStream endpoint = new ByteArrayOutputStream();
            writeBytesField(endpoint, ENDPOINT_WATCH, watch.toByteArray());
            ByteArrayOutputStream donor = new ByteArrayOutputStream();
            writeBytesField(donor, ROW_NAVIGATION_ENDPOINT, endpoint.toByteArray());

            byte[] merged = replaceFields(original, donor.toByteArray(),
                    ROW_NAVIGATION_ENDPOINT, ROW_DISPLAY_POLICY, ROW_SWIPE_ACTIONS);
            copyInstanceFields(parseLike(row, merged), row);
            Log.i(TAG, videoId + ": un-greyed a list row Music marked unavailable");
        } catch (Throwable t) {
            Log.e(TAG, "onListItem failed, leaving the row unchanged", t);
        }
    }

    private static void writeVarint(ByteArrayOutputStream out, long v) {
        while ((v & ~0x7FL) != 0) {
            out.write((int) ((v & 0x7F) | 0x80));
            v >>>= 7;
        }
        out.write((int) v);
    }

    private static void writeBytesField(ByteArrayOutputStream out, int number, byte[] value) {
        writeVarint(out, ((long) number << 3) | WIRE_LEN);
        writeVarint(out, value.length);
        out.write(value, 0, value.length);
    }

    private static byte[] spoofedResponse(String videoId) throws Exception {
        if (spoofMissing) return null;
        Method method = getStreamingData;
        if (method == null) {
            try {
                method = Class.forName(SPOOF_CLASS).getMethod("getStreamingData", String.class);
            } catch (ClassNotFoundException | NoSuchMethodException e) {
                spoofMissing = true;
                Log.w(TAG, "Spoof video streams is not in this build; nothing to fall back to");
                return null;
            }
            getStreamingData = method;
        }
        // With spoofing on, the spoof patch already fetched this video when the
        // app sent its /player request. This returns that serialized
        // PlayerResponse (blocking until the fetch completes), or null.
        byte[] cached = (byte[]) method.invoke(null, videoId);
        if (cached != null) return cached;

        // With spoofing off (the default whenever the PoToken provider patch is
        // in the build), nothing was fetched. Resolve this one video the way
        // the Music download feature does: through the spoof clients, without
        // touching the playback cache or turning spoofing on for anything else.
        return fetchLikeDownload(videoId);
    }

    private static final String MUSIC_SPOOF_CLASS =
            "app.morphe.extension.music.patches.spoof.SpoofVideoStreamsPatch";
    private static final String MUSIC_SETTINGS_CLASS = "app.morphe.extension.music.settings.Settings";

    private static byte[] fetchLikeDownload(String videoId) throws Exception {
        List<?> clients = (List<?>) Class.forName(MUSIC_SPOOF_CLASS)
                .getMethod("getAvailableClients").invoke(null);
        if (clients == null || clients.isEmpty()) return null;

        Object preferred = null;
        try {
            Object setting = Class.forName(MUSIC_SETTINGS_CLASS)
                    .getField("SPOOF_VIDEO_STREAMS_CLIENT_TYPE").get(null);
            preferred = setting.getClass().getMethod("get").invoke(setting);
        } catch (Throwable t) {
            Log.w(TAG, "could not read the preferred spoof client, using the first one", t);
        }
        if (preferred == null || !clients.contains(preferred)) preferred = clients.get(0);

        Class<?> requestClass = Class.forName(SPOOF_REQUEST_CLASS);
        Method fetch = null;
        for (Method m : requestClass.getMethods()) {
            if (m.getName().equals("fetchRequestForDownload") && m.getParameterTypes().length == 3) {
                fetch = m;
                break;
            }
        }
        if (fetch == null) {
            Log.w(TAG, "fetchRequestForDownload is missing from this spoof patch version");
            return null;
        }
        Object request = fetch.invoke(null, videoId, clients, preferred);
        if (request == null) return null;
        Object details = requestClass.getMethod("getStreamDetails").invoke(request);
        if (details == null) return null;
        // StreamData is a record; streamingData() is the serialized PlayerResponse.
        return (byte[]) details.getClass().getMethod("streamingData").invoke(details);
    }

    /** Why the spoof had nothing, for the log: spoofing off, no request queued, or every client failed. */
    private static String spoofDiagnosis(String videoId) {
        try {
            Object enabled = Class.forName(SPOOF_CLASS).getMethod("isSpoofingEnabled").invoke(null);
            if (!Boolean.TRUE.equals(enabled)) return "spoofing is off";
            Object request = Class.forName(SPOOF_REQUEST_CLASS)
                    .getMethod("getStreamRequestForVideoId", String.class).invoke(null, videoId);
            return request == null ? "no spoof request was queued for it" : "every spoof client failed";
        } catch (Throwable t) {
            return "diagnosis failed: " + t;
        }
    }

    // ---- app proto object plumbing (reflection over the public MessageLite API) ----

    private static byte[] toByteArray(Object message) throws Exception {
        Method m = message.getClass().getMethod("toByteArray");
        return (byte[]) m.invoke(message);
    }

    private static volatile Method parseMethod;
    private static volatile Object extensionRegistry;

    /**
     * Parses bytes into a new message of the same type with
     * GeneratedMessageLite.parseFrom(T, byte[], ExtensionRegistryLite) and the
     * generated registry. The two-argument parseFrom uses an empty registry,
     * which turns every extension field (watchEndpoint, thumbnail renderers,
     * and most other InnerTube renderers are extensions) into unknown fields.
     */
    private static Object parseLike(Object prototype, byte[] bytes) throws Exception {
        Method m = parseMethod;
        if (m == null || !m.getParameterTypes()[0].isInstance(prototype)) {
            m = findParseMethod(prototype.getClass());
            extensionRegistry = m.getParameterTypes()[2].getMethod("getGeneratedRegistry").invoke(null);
            parseMethod = m;
        }
        return m.invoke(null, prototype, bytes, extensionRegistry);
    }

    private static Method findParseMethod(Class<?> type) throws NoSuchMethodException {
        Method fallback = null;
        for (Class<?> c = type; c != null && c != Object.class; c = c.getSuperclass()) {
            for (Method m : c.getDeclaredMethods()) {
                if (!Modifier.isStatic(m.getModifiers())) continue;
                Class<?>[] p = m.getParameterTypes();
                if (p.length != 3 || p[1] != byte[].class || !p[0].isAssignableFrom(type)) continue;
                if (!p[2].getName().endsWith("ExtensionRegistryLite")) continue;
                if (!p[0].isAssignableFrom(m.getReturnType())) continue;
                m.setAccessible(true);
                if (m.getName().equals("parseFrom")) return m;
                if (fallback == null) fallback = m;
            }
        }
        if (fallback != null) return fallback;
        throw new NoSuchMethodException("no static (T, byte[], ExtensionRegistryLite) parser above " + type.getName());
    }

    /**
     * Turns {@code target} into a copy of {@code source} in place. The call
     * sites already hold a reference to the original object (some have stored
     * it in a model before the check), so swapping the reference is not enough.
     */
    private static void copyInstanceFields(Object source, Object target) throws IllegalAccessException {
        for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                f.set(target, f.get(source));
            }
        }
    }

    // ---- protobuf wire format ----

    private static final int WIRE_VARINT = 0;
    private static final int WIRE_I64 = 1;
    private static final int WIRE_LEN = 2;
    private static final int WIRE_I32 = 5;

    /** One top-level field: [start, end) covers tag + value; value is [valueStart, end). */
    private static final class Span {
        int number, wireType, start, valueStart, end;
    }

    private static long readVarint(byte[] b, int[] pos) {
        long result = 0;
        int shift = 0;
        while (true) {
            byte x = b[pos[0]++];
            result |= (long) (x & 0x7f) << shift;
            if ((x & 0x80) == 0) return result;
            shift += 7;
            if (shift > 63) throw new IllegalArgumentException("malformed varint");
        }
    }

    /** Reads the field at pos[0], or returns null at the end of the buffer. */
    private static Span next(byte[] b, int[] pos) {
        if (pos[0] >= b.length) return null;
        Span s = new Span();
        s.start = pos[0];
        long tag = readVarint(b, pos);
        s.number = (int) (tag >>> 3);
        s.wireType = (int) (tag & 7);
        switch (s.wireType) {
            case WIRE_VARINT:
                s.valueStart = pos[0];
                readVarint(b, pos);
                break;
            case WIRE_I64:
                s.valueStart = pos[0];
                pos[0] += 8;
                break;
            case WIRE_LEN: {
                long len = readVarint(b, pos);
                s.valueStart = pos[0];
                pos[0] += (int) len;
                break;
            }
            case WIRE_I32:
                s.valueStart = pos[0];
                pos[0] += 4;
                break;
            default:
                throw new IllegalArgumentException("unsupported wire type " + s.wireType);
        }
        if (pos[0] > b.length) throw new IllegalArgumentException("truncated field " + s.number);
        s.end = pos[0];
        return s;
    }

    private static byte[] firstField(byte[] b, int number) {
        int[] pos = {0};
        for (Span s; (s = next(b, pos)) != null; ) {
            if (s.number == number && s.wireType == WIRE_LEN) {
                byte[] out = new byte[s.end - s.valueStart];
                System.arraycopy(b, s.valueStart, out, 0, out.length);
                return out;
            }
        }
        return null;
    }

    private static long firstVarint(byte[] b, int number, long absent) {
        int[] pos = {0};
        for (Span s; (s = next(b, pos)) != null; ) {
            if (s.number == number && s.wireType == WIRE_VARINT) {
                return readVarint(b, new int[]{s.valueStart});
            }
        }
        return absent;
    }

    /** {@code base} without the given fields, followed by those fields as they appear in {@code donor}. */
    private static byte[] replaceFields(byte[] base, byte[] donor, int... numbers) {
        ByteArrayOutputStream out = new ByteArrayOutputStream(base.length + donor.length);
        int[] pos = {0};
        for (Span s; (s = next(base, pos)) != null; ) {
            if (!contains(numbers, s.number)) out.write(base, s.start, s.end - s.start);
        }
        pos[0] = 0;
        for (Span s; (s = next(donor, pos)) != null; ) {
            if (contains(numbers, s.number)) out.write(donor, s.start, s.end - s.start);
        }
        return out.toByteArray();
    }

    private static boolean contains(int[] values, int v) {
        for (int x : values) if (x == v) return true;
        return false;
    }
}
