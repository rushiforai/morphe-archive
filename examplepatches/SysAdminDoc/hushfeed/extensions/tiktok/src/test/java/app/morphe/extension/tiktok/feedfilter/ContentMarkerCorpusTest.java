package app.morphe.extension.tiktok.feedfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import com.ss.android.ugc.aweme.feed.model.Aweme;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * Marker shapes recorded from TikTok 47.0.3 on the test phone, replayed through the content filters.
 *
 * <p>Hand-built fakes carry the values someone thought to write down. The server sends defaults
 * nobody thought of: Hide series emptied feeds three times because of that gap (#5, #20, #24), the
 * last time over an episode number of "0" on every ordinary profile post. The files under
 * {@code feed-markers/} hold what 233 real videos on four routes carried, recorded by the probe's
 * {@code marker-corpus} action with the verdicts Hushfeed 0.58.0 gave them on the phone. Every
 * ordinary video has to stay ordinary and every labelled one has to stay caught.
 *
 * <p>The files hold shapes, never content: booleans, numbers clamped at 10,000, string lengths and
 * numerals of up to six digits. {@link #theCorpusHoldsShapesAndNoContent} holds them to that.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class ContentMarkerCorpusTest {
    private static final String[] ROUTES = {"for-you", "profile", "following", "search"};
    private static final String[] MARKERS = {"ai", "paid", "series", "playlist"};
    private static final Set<String> TOKENS = Set.of("b", "n", "s", "slen", "sblank", "snum", "c", "m", "o");

    @Test public void noOrdinaryVideoMatchesAContentMarker() throws Exception {
        List<String> matched = new ArrayList<>();
        for (String route : ROUTES) {
            JSONArray items = corpus(route).getJSONArray("items");
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                if (item.getJSONArray("markers").length() > 0) continue;
                Set<String> verdicts = verdicts(replay(item.getJSONObject("shape")));
                if (!verdicts.isEmpty()) matched.add(route + " #" + i + " now reads as " + verdicts);
            }
        }
        assertEquals("ordinary videos a content filter would now remove", Collections.emptyList(), matched);
    }

    @Test public void everyRecordedVideoKeepsTheVerdictItGotOnThePhone() throws Exception {
        List<String> changed = new ArrayList<>();
        for (String route : ROUTES) {
            JSONArray items = corpus(route).getJSONArray("items");
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                Set<String> recorded = new LinkedHashSet<>();
                JSONArray markers = item.getJSONArray("markers");
                for (int m = 0; m < markers.length(); m++) recorded.add(markers.getString(m));
                Set<String> now = verdicts(replay(item.getJSONObject("shape")));
                if (!recorded.equals(now)) changed.add(route + " #" + i + ": phone " + recorded + ", now " + now);
            }
        }
        assertEquals("videos whose verdict changed", Collections.emptyList(), changed);
    }

    @Test public void eachRouteHoldsAtLeastFiftyOrdinaryVideos() throws Exception {
        for (String route : ROUTES) {
            JSONObject corpus = corpus(route);
            assertEquals(route + " was recorded on another TikTok", "47.0.3", corpus.getString("tiktok"));
            JSONArray items = corpus.getJSONArray("items");
            int ordinary = 0;
            for (int i = 0; i < items.length(); i++) {
                if (items.getJSONObject(i).getJSONArray("markers").length() == 0) ordinary++;
            }
            assertTrue(route + " holds " + ordinary + " ordinary videos, fewer than 50", ordinary >= 50);
        }
    }

    @Test public void theCorpusHoldsShapesAndNoContent() throws Exception {
        for (String route : ROUTES) {
            JSONArray items = corpus(route).getJSONArray("items");
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                assertEquals(route + " #" + i + " fields", Set.of("markers", "shape"), keys(item));
                JSONObject shape = item.getJSONObject("shape");
                for (Iterator<String> fields = shape.keys(); fields.hasNext(); ) {
                    String field = fields.next();
                    Object value = shape.get(field);
                    if (value == JSONObject.NULL) continue;
                    JSONObject object = (JSONObject) value;
                    if (isToken(object)) {
                        checkToken(object, route + " #" + i + " " + field);
                        continue;
                    }
                    for (Iterator<String> inner = object.keys(); inner.hasNext(); ) {
                        String name = inner.next();
                        Object token = object.get(name);
                        if (token != JSONObject.NULL) checkToken((JSONObject) token, route + " #" + i + " " + field + "." + name);
                    }
                }
            }
        }
    }

    private static boolean isToken(JSONObject object) {
        return object.length() == 1 && TOKENS.contains(object.keys().next());
    }

    private static void checkToken(JSONObject token, String where) throws Exception {
        assertTrue(where + " is not a token: " + token, isToken(token));
        String kind = token.keys().next();
        if (kind.equals("s")) {
            assertTrue(where + " holds text that is not a short numeral", token.getString("s").matches("-?[0-9]{1,6}"));
        } else if (!kind.equals("b")) {
            assertTrue(where + " holds a number beyond the clamp: " + token, Math.abs(token.getLong(kind)) <= 10_000L);
        }
    }

    private static Set<String> keys(JSONObject object) {
        Set<String> out = new LinkedHashSet<>();
        for (Iterator<String> iterator = object.keys(); iterator.hasNext(); ) out.add(iterator.next());
        return out;
    }

    private static Set<String> verdicts(Aweme video) {
        IFilter[] filters = {new ContentMarkerFilters.AiGeneratedFilter(),
                new ContentMarkerFilters.PaidPartnershipFilter(), new ContentMarkerFilters.SeriesFilter(),
                new ContentMarkerFilters.PlaylistFilter()};
        Set<String> out = new LinkedHashSet<>();
        for (int i = 0; i < filters.length; i++) {
            if (filters[i].getFiltered(video)) out.add(MARKERS[i]);
        }
        return out;
    }

    private static JSONObject corpus(String route) throws Exception {
        String name = "/feed-markers/" + route + "-47.0.3.json";
        try (InputStream stream = ContentMarkerCorpusTest.class.getResourceAsStream(name)) {
            assertNotNull("no corpus at " + name, stream);
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] buffer = new byte[16_384];
            for (int read; (read = stream.read(buffer)) > 0; ) bytes.write(buffer, 0, read);
            return new JSONObject(new String(bytes.toByteArray(), StandardCharsets.UTF_8));
        }
    }

    /** A video built from a recorded shape: every field the filters read, and nothing else. */
    private static Aweme replay(JSONObject shape) throws Exception {
        ReplayVideo video = new ReplayVideo();
        video.aigcInfo = struct(shape, "aigcInfo", new ReplayAigc());
        video.moderationAigcInfo = struct(shape, "moderationAigcInfo", new ReplayModeration());
        video.brandContentAccounts = value(shape.opt("brandContentAccounts"));
        video.commerceVideoAuthInfo = struct(shape, "commerceVideoAuthInfo", new ReplayCommerce());
        video.commercialVideoInfo = value(shape.opt("commercialVideoInfo"));
        video.isPaidContent = value(shape.opt("isPaidContent"));
        video.mPaidContentInfo = struct(shape, "mPaidContentInfo", new ReplayPaidContent());
        video.mixInfo = struct(shape, "mixInfo", new ReplayMix());
        return video;
    }

    private static Object struct(JSONObject shape, String name, Object blank) throws Exception {
        if (shape.isNull(name)) return null;
        JSONObject fields = shape.getJSONObject(name);
        for (Iterator<String> iterator = fields.keys(); iterator.hasNext(); ) {
            String field = iterator.next();
            blank.getClass().getField(field).set(blank, value(fields.opt(field)));
        }
        return blank;
    }

    /** A token back to a value of the recorded type, which is what the filters test. */
    private static Object value(Object token) throws Exception {
        if (token == null || token == JSONObject.NULL) return null;
        JSONObject t = (JSONObject) token;
        if (t.has("b")) return t.getBoolean("b");
        if (t.has("n")) return t.getLong("n");
        if (t.has("s")) return t.getString("s");
        if (t.has("slen")) return "x".repeat(t.getInt("slen"));
        if (t.has("sblank")) return " ".repeat(t.getInt("sblank"));
        if (t.has("snum")) {
            int digits = t.getInt("snum");
            return (digits < 0 ? "-" : "") + "1".repeat(Math.abs(digits));
        }
        if (t.has("c")) return new ArrayList<>(Collections.nCopies(t.getInt("c"), new Object()));
        if (t.has("m")) {
            Map<Integer, Integer> map = new HashMap<>();
            for (int i = 0; i < t.getInt("m"); i++) map.put(i, i);
            return map;
        }
        if (t.has("o")) return new Object();
        throw new AssertionError("unknown token " + t);
    }

    /** Field-shaped stand-ins; the filters read getter first and field second, like on the phone. */
    public static final class ReplayVideo extends Aweme {
        public Object aigcInfo, moderationAigcInfo, brandContentAccounts, commerceVideoAuthInfo,
                commercialVideoInfo, isPaidContent, mPaidContentInfo, mixInfo;
    }

    public static final class ReplayAigc {
        public Object aigcLabelType;
    }

    public static final class ReplayModeration {
        public Object moderationAigcLabelType, moderationUserLabelStatus;
    }

    public static final class ReplayCommerce {
        public Object isBrandedContent, isBrandOrganicContent, brandedContentType, brandOrganicType,
                ecSearchBoBcLabelText, isCommerce;
    }

    public static final class ReplayPaidContent {
        public Object paidCollectionId, collectionName, episodeNumber, isPaidCollectionIntro;
    }

    public static final class ReplayMix {
        public Object mixId, mixName;
    }
}
