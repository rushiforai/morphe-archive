/*
 * Forked from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * extensions/facebook/.../ads/MarketplaceAdFilter.java. Copyright 2026 Hushfacebook contributors.
 * Modified for facebook-morphe-patches, 2026: ads only (no advanced search, listing date or
 * diagnostics), always on.
 */
package app.fbpatches.extension.facebook.ads;

import android.util.Log;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Marketplace is drawn by React Native, and its GraphQL queries go out through Facebook's own
 * Networking module as a form-encoded body with the query's variables, under a tracking name of
 * "RelayFBNetwork_" plus the query's name.
 *
 * <ul>
 *   <li>The feed query's shouldSkipAdRequest and shouldSkipBoostedListingAdRequest variables are set
 *       to true, which tells the server to leave ads and boosted listings out.
 *   <li>The ads-only queries aren't sent (the body answered is null, which the module reports to
 *       Relay as a request it couldn't make).
 *   <li>Search answers, which bring ads back among listings, have the ads taken out on the way back
 *       ({@link MarketplaceSearchAds}).
 * </ul>
 *
 * Everything fails open: on any failure the request or answer is Facebook's own.
 */
@SuppressWarnings("unused")
public final class MarketplaceAds {
    private static final String TAG = "FbPatches";

    static final String RELAY = "RelayFBNetwork_";
    static final String MARKETPLACE = "Marketplace";
    static final String READABLE_MAP = "com.facebook.react.bridge.ReadableMap";
    static final String TRACKING_NAME = "trackingName";
    static final String VARIABLES = "variables";

    static final String[] ADS_ONLY_QUERIES = {
            "MarketplaceHomeFeedAdsQueryRendererQuery",
            "MarketplaceHomeFeedAdsPaginationQuery",
            "MarketplaceHomeFeedBoostedListingAdsQuery",
            "MarketplaceHomeFeedBoostedListingAdsPaginationQuery",
    };

    static final String[] LISTING_ADS_QUERIES = {
            "MarketplaceProductDetailsPageRelatedAdsDetailQuery",
            "MarketplacePDPBoostedListingAdsQuery",
            "MarketplacePDPPersonalizedAdsQuery",
    };

    static final String[] SKIP_VARIABLES = {
            "shouldSkipAdRequest",
            "shouldSkipBoostedListingAdRequest",
    };

    static final String SEARCH = "Search";
    static final String TYPEAHEAD = "Typeahead";
    static final String MUTATION = "Mutation";

    static final int MAX_BODY_CHARS = 512 * 1024;

    /** The search answer being read for each request that comes back in pieces. */
    private static final Map<Object, MarketplaceSearchAds.Answer> answers = new WeakHashMap<>();

    private static volatile Method getString;
    private static volatile boolean lookedUp;

    private MarketplaceAds() {
    }

    /**
     * Injection point, right after the Networking module's sendRequest reads a request's POST body.
     * The body to send: Facebook's own, one asking to skip ads, or null to not send it.
     */
    public static String requestBody(String body, Object data) {
        try {
            if (body == null || data == null) return body;
            String query = marketplaceQuery(trackingName(data));
            if (query == null) return body;
            if (heldBack(query)) return null;
            return skipAds(body);
        } catch (Throwable failure) {
            Log.w(TAG, "MarketplaceAds.requestBody failed", failure);
            return body;
        }
    }

    /** Injection point: the native Marketplace video ad drawers. True draws nothing. */
    public static boolean hidesVideoAd() {
        return true;
    }

    /** Injection point: a piece of an answer the module hands to JavaScript. */
    public static String responsePiece(String piece, String trackingName, Object request) {
        MarketplaceSearchAds.Answer answer = null;
        try {
            if (piece == null || request == null) return piece;
            String query = searchQuery(trackingName);
            if (query == null) return piece;
            synchronized (answers) {
                answer = answers.get(request);
                if (answer == null) {
                    answer = new MarketplaceSearchAds.Answer(query, true);
                    answers.put(request, answer);
                }
            }
            return answer.read(piece);
        } catch (Throwable failure) {
            Log.w(TAG, "MarketplaceAds.responsePiece failed", failure);
            return answer != null ? answer.giveUp(piece) : piece;
        }
    }

    /** Injection point: a whole answer the module hands to JavaScript. */
    public static String responseWhole(String text, String trackingName) {
        try {
            if (text == null) return text;
            String query = searchQuery(trackingName);
            if (query == null) return text;
            MarketplaceSearchAds.Answer answer = new MarketplaceSearchAds.Answer(query, true);
            String read = answer.read(text);
            String rest = answer.rest();
            return rest.isEmpty() ? read : read + rest;
        } catch (Throwable failure) {
            Log.w(TAG, "MarketplaceAds.responseWhole failed", failure);
            return text;
        }
    }

    /** Injection point, as an answer in pieces ends: what still waits for a payload to finish, or null. */
    public static String responseEnd(Object request) {
        try {
            if (request == null) return null;
            MarketplaceSearchAds.Answer answer;
            synchronized (answers) {
                answer = answers.remove(request);
            }
            return answer != null ? answer.end() : null;
        } catch (Throwable failure) {
            Log.w(TAG, "MarketplaceAds.responseEnd failed", failure);
            return null;
        }
    }

    static String searchQuery(String trackingName) {
        String query = marketplaceQuery(trackingName);
        if (query == null || !query.contains(SEARCH) || query.contains(TYPEAHEAD) || query.endsWith(MUTATION)) return null;
        return query;
    }

    static String marketplaceQuery(String trackingName) {
        if (trackingName == null || !trackingName.startsWith(RELAY + MARKETPLACE)) return null;
        return trackingName.substring(RELAY.length());
    }

    static boolean heldBack(String query) {
        for (String ads : ADS_ONLY_QUERIES) {
            if (ads.equals(query)) return true;
        }
        for (String ads : LISTING_ADS_QUERIES) {
            if (ads.equals(query)) return true;
        }
        return false;
    }

    static String trackingName(Object data) throws ReflectiveOperationException {
        Method read = getString();
        if (read == null || !read.getDeclaringClass().isInstance(data)) return null;
        Object name = read.invoke(data, TRACKING_NAME);
        return name instanceof String ? (String) name : null;
    }

    private static Method getString() {
        if (lookedUp) return getString;
        synchronized (MarketplaceAds.class) {
            if (lookedUp) return getString;
            try {
                getString = Class.forName(READABLE_MAP).getMethod("getString", String.class);
            } catch (ReflectiveOperationException | RuntimeException | LinkageError missing) {
                Log.w(TAG, "MarketplaceAds: no ReadableMap.getString", missing);
            }
            lookedUp = true;
            return getString;
        }
    }

    /** The body with the ad-skipping variables set to true, or the very body when there's nothing to set. */
    static String skipAds(String body) {
        if (body.length() > MAX_BODY_CHARS) return body;
        int[] value = variablesParameter(body);
        if (value == null) return body;
        Decoded decoded = Decoded.of(body, value[0], value[1]);
        if (decoded == null) return body;
        List<Member> members = Json.members(decoded.bytes, decoded.length);
        if (members == null) return body;

        List<Member> toSet = new ArrayList<>();
        for (String name : SKIP_VARIABLES) {
            Member member = null;
            for (Member candidate : members) {
                if (!candidate.named(decoded.bytes, name)) continue;
                if (member != null) return body;
                member = candidate;
            }
            if (member == null) continue;
            String was = member.literal(decoded.bytes);
            if ("false".equals(was) || "null".equals(was)) toSet.add(member);
        }
        if (toSet.isEmpty()) return body;

        // Members come in body order, so replacing from the last keeps earlier offsets valid.
        toSet.sort((a, b) -> Integer.compare(a.valueStart, b.valueStart));
        StringBuilder edited = new StringBuilder(body);
        for (int i = toSet.size() - 1; i >= 0; i--) {
            Member member = toSet.get(i);
            edited.replace(decoded.from[member.valueStart], decoded.endOf(member.valueEnd), "true");
        }
        return edited.toString();
    }

    /** The start and end of the one form parameter named variables, or null. */
    static int[] variablesParameter(String body) {
        int[] found = null;
        int at = 0;
        while (at <= body.length()) {
            int end = body.indexOf('&', at);
            if (end < 0) end = body.length();
            int equals = at + VARIABLES.length();
            if (equals < end && body.charAt(equals) == '=' && body.startsWith(VARIABLES, at)) {
                if (found != null) return null;
                found = new int[] {equals + 1, end};
            }
            at = end + 1;
        }
        return found;
    }

    /** A form value percent-decoded to bytes, with where each byte came from in the body. */
    static final class Decoded {
        final byte[] bytes;
        final int[] from;
        final int length;
        final int end;

        private Decoded(byte[] bytes, int[] from, int length, int end) {
            this.bytes = bytes;
            this.from = from;
            this.length = length;
            this.end = end;
        }

        int endOf(int index) {
            return index >= length ? end : from[index];
        }

        static Decoded of(String body, int start, int end) {
            byte[] bytes = new byte[end - start];
            int[] from = new int[end - start];
            int length = 0;
            for (int i = start; i < end; ) {
                char c = body.charAt(i);
                if (c == '%') {
                    if (i + 2 >= end) return null;
                    int high = Character.digit(body.charAt(i + 1), 16);
                    int low = Character.digit(body.charAt(i + 2), 16);
                    if (high < 0 || low < 0) return null;
                    bytes[length] = (byte) (high << 4 | low);
                    from[length++] = i;
                    i += 3;
                } else if (c == '+') {
                    bytes[length] = ' ';
                    from[length++] = i++;
                } else if (c < 0x80) {
                    bytes[length] = (byte) c;
                    from[length++] = i++;
                } else {
                    return null;
                }
            }
            return new Decoded(bytes, from, length, end);
        }
    }

    /** A top-level member of a JSON object, by byte offsets. */
    static final class Member {
        final int nameStart;
        final int nameEnd;
        final int valueStart;
        final int valueEnd;

        Member(int nameStart, int nameEnd, int valueStart, int valueEnd) {
            this.nameStart = nameStart;
            this.nameEnd = nameEnd;
            this.valueStart = valueStart;
            this.valueEnd = valueEnd;
        }

        boolean named(byte[] bytes, String name) {
            if (nameEnd - nameStart != name.length()) return false;
            for (int i = 0; i < name.length(); i++) {
                if (bytes[nameStart + i] != name.charAt(i)) return false;
            }
            return true;
        }

        String literal(byte[] bytes) {
            for (String literal : new String[] {"true", "false", "null"}) {
                if (valueEnd - valueStart != literal.length()) continue;
                boolean same = true;
                for (int i = 0; i < literal.length() && same; i++) {
                    same = bytes[valueStart + i] == literal.charAt(i);
                }
                if (same) return literal;
            }
            return null;
        }
    }

    /** Just enough JSON to list an object's top-level members. */
    static final class Json {
        private Json() {
        }

        static List<Member> members(byte[] bytes, int length) {
            List<Member> members = new ArrayList<>();
            int i = space(bytes, 0, length);
            if (i >= length || bytes[i] != '{') return null;
            i = space(bytes, i + 1, length);
            if (i < length && bytes[i] == '}') return space(bytes, i + 1, length) == length ? members : null;
            while (true) {
                if (i >= length || bytes[i] != '"') return null;
                int nameStart = i + 1;
                int nameEnd = stringEnd(bytes, i, length);
                if (nameEnd < 0) return null;
                i = space(bytes, nameEnd + 1, length);
                if (i >= length || bytes[i] != ':') return null;
                int valueStart = space(bytes, i + 1, length);
                int valueEnd = valueEnd(bytes, valueStart, length);
                if (valueEnd < 0) return null;
                members.add(new Member(nameStart, nameEnd, valueStart, valueEnd));
                i = space(bytes, valueEnd, length);
                if (i >= length) return null;
                if (bytes[i] == ',') {
                    i = space(bytes, i + 1, length);
                    continue;
                }
                if (bytes[i] == '}') return space(bytes, i + 1, length) == length ? members : null;
                return null;
            }
        }

        private static int space(byte[] bytes, int i, int length) {
            while (i < length && (bytes[i] == ' ' || bytes[i] == '\t' || bytes[i] == '\n' || bytes[i] == '\r')) i++;
            return i;
        }

        private static int stringEnd(byte[] bytes, int open, int length) {
            for (int i = open + 1; i < length; i++) {
                if (bytes[i] == '\\') i++;
                else if (bytes[i] == '"') return i;
            }
            return -1;
        }

        private static int valueEnd(byte[] bytes, int start, int length) {
            if (start >= length) return -1;
            byte first = bytes[start];
            if (first == '"') {
                int close = stringEnd(bytes, start, length);
                return close < 0 ? -1 : close + 1;
            }
            if (first == '{' || first == '[') {
                int depth = 0;
                for (int i = start; i < length; i++) {
                    byte b = bytes[i];
                    if (b == '"') {
                        i = stringEnd(bytes, i, length);
                        if (i < 0) return -1;
                    } else if (b == '{' || b == '[') {
                        depth++;
                    } else if (b == '}' || b == ']') {
                        if (--depth == 0) return i + 1;
                    }
                }
                return -1;
            }
            int i = start;
            while (i < length && bytes[i] != ',' && bytes[i] != '}' && bytes[i] != ']' && bytes[i] != ' '
                    && bytes[i] != '\t' && bytes[i] != '\n' && bytes[i] != '\r') {
                i++;
            }
            return i > start ? i : -1;
        }
    }
}
