package app.morphe.extension.syncforreddit.redirects.imgur;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.syncforreddit.redirects.RedirectSettings;

/**
 * The Rimgo instances: which ones are known, which are to be asked, and which of them work.
 *
 * <p>Rimgo is run by whoever cares to run one, so the list of them is published rather than
 * built in: LibRedirect keeps the same list its own extension uses, and that is what is read
 * here. One typed in by hand sits alongside it.
 *
 * <p><b>Being on the list says nothing about working.</b> Asked for the same picture, the
 * twenty-three published instances answered nine different ways: nine served it, several
 * answered 429 because Imgur is rate limiting them, some 403, some 404 or 500, four did not
 * resolve at all — and two answered <i>200 with a page of HTML</i>, because they route a media
 * address to their post handler. That last pair is why this asks what the reply actually is and
 * not merely whether it arrived: HTML handed to an image decoder draws as a broken picture,
 * which looks like the patch failing rather than the instance being wrong.
 *
 * <p>What it asks for is {@code /removed.png} — the placeholder Imgur itself has served for
 * years for a picture that has been taken down. It is tiny, it is permanent, and fetching it
 * exercises the whole path the app actually uses: the instance's media route, its connection to
 * Imgur, and whether Imgur is answering it at all.
 */
public final class RimgoInstances {
    /** Where LibRedirect publishes the list its own extension redirects with. */
    private static final String PUBLISHED =
            "https://raw.githubusercontent.com/libredirect/instances/main/data.json";

    /** Imgur's own placeholder for something taken down: small, permanent, always served. */
    private static final String CANARY = "/removed.png";

    /** What the last instance that worked is remembered under. */
    private static final String LAST_GOOD = "sync_up_redirect_imgur_rimgo_last";

    private static final int CONNECT_MS = 5000;

    private static final int READ_MS = 5000;

    /** An answer larger than this is not the placeholder, whatever it calls itself. */
    private static final int MOST_BYTES = 64 * 1024;

    /** How long a working instance is taken on trust before it is asked again. */
    private static final long TRUSTED_FOR_MS = 10 * 60 * 1000L;

    /** How long an instance that failed is left alone, so an outage costs one wait, not many. */
    private static final long RESTED_FOR_MS = 5 * 60 * 1000L;

    /** How stale the published list may be before it is worth fetching again. */
    private static final long LIST_GOOD_FOR_MS = 24 * 60 * 60 * 1000L;

    /** What an instance was last found to be. */
    public enum Health { UNKNOWN, WORKING, FAILING, CHECKING }

    private static final Map<String, Health> health =
            Collections.synchronizedMap(new LinkedHashMap<String, Health>());

    /** When each instance last failed, so that a failing one is rested rather than hammered. */
    private static final Map<String, Long> failedAt =
            Collections.synchronizedMap(new LinkedHashMap<String, Long>());

    /** When the instance in use was last found to work. */
    private static volatile long trustedSince;

    private static volatile String trusted;

    private static final ExecutorService CHECKING = Executors.newFixedThreadPool(4);

    private RimgoInstances() {}

    // region What is known.

    /** @return The published list as last fetched, which may be empty before the first fetch. */
    public static List<String> published() {
        return RedirectSettings.lines(RedirectSettings.RIMGO_PUBLISHED);
    }

    /** @return The instances typed in here. */
    public static List<String> own() {
        return RedirectSettings.lines(RedirectSettings.RIMGO_OWN);
    }

    /** @return Everything known, the typed ones first, with nothing repeated. */
    public static List<String> all() {
        Set<String> every = new LinkedHashSet<>(own());
        every.addAll(published());
        return new ArrayList<>(every);
    }

    /** @return The ones to actually ask, in the order they are to be tried. */
    public static List<String> chosen() {
        List<String> picked = RedirectSettings.lines(RedirectSettings.RIMGO_CHOSEN);
        List<String> known = all();
        List<String> kept = new ArrayList<>();
        for (String each : picked) {
            // An instance taken off the published list should stop being asked, unless it was
            // typed in here, in which case it is the person's own business.
            if (known.contains(each)) {
                kept.add(each);
            }
        }
        return kept;
    }

    public static boolean isChosen(String instance) {
        return chosen().contains(instance);
    }

    public static void choose(String instance, boolean wanted) {
        Set<String> picked = new LinkedHashSet<>(chosen());
        if (wanted) {
            picked.add(instance);
        } else {
            picked.remove(instance);
        }
        RedirectSettings.putLines(RedirectSettings.RIMGO_CHOSEN, picked);
        if (!wanted && instance.equals(trusted)) {
            forget();
        }
    }

    /** @return What was added, or null where it is not an address an instance could be at. */
    @Nullable
    public static String add(String typed) {
        String tidied = tidy(typed);
        if (tidied == null) {
            return null;
        }
        Set<String> mine = new LinkedHashSet<>(own());
        mine.add(tidied);
        RedirectSettings.putLines(RedirectSettings.RIMGO_OWN, mine);
        // Typed in by hand, so plainly meant to be used.
        choose(tidied, true);
        return tidied;
    }

    public static void remove(String instance) {
        Set<String> mine = new LinkedHashSet<>(own());
        if (mine.remove(instance)) {
            RedirectSettings.putLines(RedirectSettings.RIMGO_OWN, mine);
        }
        choose(instance, false);
    }

    /**
     * @return The address with nothing after the host, or null where it is unusable. Typed by
     *         hand, so a missing scheme and a trailing slash are expected rather than refused.
     */
    @Nullable
    public static String tidy(String typed) {
        if (typed == null) {
            return null;
        }
        String said = typed.trim();
        if (said.isEmpty()) {
            return null;
        }
        if (!said.contains("://")) {
            said = "https://" + said;
        }
        try {
            URL asked = new URL(said);
            String host = asked.getHost();
            if (host == null || host.isEmpty() || !host.contains(".")) {
                return null;
            }
            String scheme = asked.getProtocol().toLowerCase(Locale.ROOT);
            if (!scheme.equals("http") && !scheme.equals("https")) {
                return null;
            }
            String port = asked.getPort() == -1 ? "" : ":" + asked.getPort();
            return scheme + "://" + host.toLowerCase(Locale.ROOT) + port;
        } catch (Exception ex) {
            return null;
        }
    }

    // endregion

    // region The published list.

    public static long publishedAt() {
        return RedirectSettings.when(RedirectSettings.RIMGO_PUBLISHED_AT);
    }

    /** @return Whether the list is old enough to be worth fetching again. */
    public static boolean listIsStale() {
        long at = publishedAt();
        return at == 0L || System.currentTimeMillis() - at > LIST_GOOD_FOR_MS;
    }

    /**
     * Fetches the published list, in the background, and says so when it is in.
     *
     * <p>Nothing is chosen on our behalf by doing this: an instance has to be picked before it
     * is asked anything, which is what keeps Rimgo opt-in all the way down.
     */
    public static void refresh(@Nullable Runnable whenDone) {
        CHECKING.execute(() -> {
            try {
                String body = fetch(PUBLISHED, null);
                JSONObject held = new JSONObject(body);
                JSONObject rimgo = held.optJSONObject("rimgo");
                if (rimgo == null) {
                    Logger.printInfo(() -> "rimgo: the published list no longer names rimgo");
                    return;
                }
                JSONArray clearnet = rimgo.optJSONArray("clearnet");
                if (clearnet == null || clearnet.length() == 0) {
                    Logger.printInfo(() -> "rimgo: the published list holds no instances");
                    return;
                }

                Set<String> found = new LinkedHashSet<>();
                for (int at = 0; at < clearnet.length(); at++) {
                    String tidied = tidy(clearnet.optString(at, ""));
                    if (tidied != null) {
                        found.add(tidied);
                    }
                }
                RedirectSettings.putLines(RedirectSettings.RIMGO_PUBLISHED, found);
                RedirectSettings.putWhen(
                        RedirectSettings.RIMGO_PUBLISHED_AT, System.currentTimeMillis());
                Logger.printDebug(() -> "rimgo: the published list holds " + found.size()
                        + " instances");
            } catch (Exception ex) {
                Logger.printInfo(() -> "rimgo: could not fetch the published list: " + ex);
            } finally {
                if (whenDone != null) {
                    whenDone.run();
                }
            }
        });
    }

    // endregion

    // region Whether they work.

    public static Health healthOf(String instance) {
        Health known = health.get(instance);
        return known == null ? Health.UNKNOWN : known;
    }

    /** @return How many of the chosen instances are known to be working. */
    public static int workingCount() {
        int working = 0;
        for (String each : chosen()) {
            if (healthOf(each) == Health.WORKING) {
                working++;
            }
        }
        return working;
    }

    /**
     * Asks every instance known whether it works, and says so after each answer.
     *
     * <p>Every one of them rather than only the chosen: which to choose is the question being
     * asked while this list is open, and answering it needs to know about the ones that have
     * not been chosen yet. Being on the published list says very little — of the twenty-three
     * published when this was written, nine served a picture.
     */
    public static void checkAll(@Nullable Runnable afterEach) {
        check(all(), afterEach);
    }

    /**
     * The same, for the ones nothing is known about yet. This is what opening the list does, so
     * that opening it a second time does not ask twenty-three servers all over again.
     */
    public static void checkWhatIsUnknown(@Nullable Runnable afterEach) {
        List<String> asking = new ArrayList<>();
        for (String instance : all()) {
            if (healthOf(instance) == Health.UNKNOWN) {
                asking.add(instance);
            }
        }
        check(asking, afterEach);
    }

    private static void check(List<String> asking, @Nullable Runnable afterEach) {
        for (String instance : asking) {
            health.put(instance, Health.CHECKING);
        }
        if (afterEach != null) {
            afterEach.run();
        }
        for (String instance : asking) {
            CHECKING.execute(() -> {
                boolean works = works(instance);
                health.put(instance, works ? Health.WORKING : Health.FAILING);
                if (afterEach != null) {
                    afterEach.run();
                }
            });
        }
    }

    /**
     * Asks one instance for the placeholder and reads what comes back.
     *
     * @return Whether it answered with a picture. An instance that answers at all but with a
     *         page, or with Imgur's rate limit, is no use to us and counts as failing.
     */
    public static boolean works(String instance) {
        HttpURLConnection asking = null;
        try {
            asking = (HttpURLConnection) new URL(instance + CANARY).openConnection();
            asking.setConnectTimeout(CONNECT_MS);
            asking.setReadTimeout(READ_MS);
            asking.setInstanceFollowRedirects(true);
            asking.setRequestProperty("Accept", "image/*");
            // Asked with whatever this instance is spoken to with, so that one behind mTLS
            // reports what it really is rather than always failing the check.
            RimgoRoute.offerOn(asking, instance);

            int said = asking.getResponseCode();
            String kind = asking.getContentType();
            int length = asking.getContentLength();

            boolean picture = kind != null && kind.toLowerCase(Locale.ROOT).startsWith("image/");
            boolean small = length <= MOST_BYTES;
            boolean good = said == HttpURLConnection.HTTP_OK && picture && small;

            if (good) {
                Logger.printDebug(() -> "rimgo: " + instance + " is working");
                failedAt.remove(instance);
            } else {
                Logger.printInfo(() -> "rimgo: " + instance + " answered " + said + " "
                        + kind + ", which is not a picture");
                failedAt.put(instance, System.currentTimeMillis());
            }
            return good;
        } catch (Exception ex) {
            Logger.printInfo(() -> "rimgo: " + instance + " could not be reached: " + ex);
            failedAt.put(instance, System.currentTimeMillis());
            return false;
        } finally {
            if (asking != null) {
                asking.disconnect();
            }
        }
    }

    // endregion

    // region Which one to use.

    /**
     * @return The instance to ask now, or null where there is none to ask. The one that last
     *         worked is used again without being asked twice, for as long as it is still being
     *         taken on trust; otherwise the chosen ones are tried in order, resting any that
     *         failed recently, and the one that answers is remembered.
     */
    @Nullable
    public static String inUse() {
        List<String> picked = chosen();
        if (picked.isEmpty()) {
            return null;
        }

        String remembered = trusted == null
                ? RedirectSettings.text(LAST_GOOD, "") : trusted;
        if (!remembered.isEmpty() && picked.contains(remembered)) {
            if (trusted != null && System.currentTimeMillis() - trustedSince < TRUSTED_FOR_MS) {
                return remembered;
            }
            if (works(remembered)) {
                remember(remembered);
                return remembered;
            }
            health.put(remembered, Health.FAILING);
        }

        long now = System.currentTimeMillis();
        for (String instance : picked) {
            if (instance.equals(remembered)) {
                continue;
            }
            Long failed = failedAt.get(instance);
            if (failed != null && now - failed < RESTED_FOR_MS) {
                continue;
            }
            if (works(instance)) {
                health.put(instance, Health.WORKING);
                remember(instance);
                return instance;
            }
            health.put(instance, Health.FAILING);
        }

        Logger.printInfo(() -> "rimgo: none of the " + picked.size()
                + " chosen instances is answering");
        return null;
    }

    /**
     * @return The instance to name without asking anything, or null where none is chosen.
     *
     * <p>{@link #inUse} checks whether an instance is answering, which is a network call, and
     * there are places this is wanted from that are the thread that draws — sharing an address
     * is one. Android answers a network call on that thread by taking the app down, so this
     * says what is already known and nothing more: the one that last worked, where it is still
     * chosen, and otherwise the first of the chosen ones.
     */
    @Nullable
    public static String inUseWithoutAsking() {
        List<String> picked = chosen();
        if (picked.isEmpty()) {
            return null;
        }
        String remembered = trusted == null
                ? RedirectSettings.text(LAST_GOOD, "") : trusted;
        return picked.contains(remembered) ? remembered : picked.get(0);
    }

    /** Called where an instance has just served something, which is the best news there is. */
    public static void worked(String instance) {
        health.put(instance, Health.WORKING);
        remember(instance);
    }

    /** Called where the one in use has just failed, so that the next request tries another. */
    public static void failed(String instance) {
        health.put(instance, Health.FAILING);
        failedAt.put(instance, System.currentTimeMillis());
        if (instance.equals(trusted)) {
            forget();
        }
    }

    private static void remember(String instance) {
        trusted = instance;
        trustedSince = System.currentTimeMillis();
        health.put(instance, Health.WORKING);
        if (!instance.equals(RedirectSettings.text(LAST_GOOD, ""))) {
            RedirectSettings.put(LAST_GOOD, instance);
        }
    }

    private static void forget() {
        trusted = null;
        trustedSince = 0L;
    }

    // endregion

    /** @return The body of a request, read as text. Used for the list and for an album page. */
    static String fetch(String url, @Nullable String accept) throws IOException {
        return fetch(url, accept, null);
    }

    /**
     * @param instance Whose certificate to offer, where the thing being fetched belongs to an
     *                 instance. Null for the published list, which is nobody's and is fetched
     *                 with no certificate at all.
     */
    static String fetch(String url, @Nullable String accept, @Nullable String instance)
            throws IOException {
        HttpURLConnection asking = (HttpURLConnection) new URL(url).openConnection();
        try {
            asking.setConnectTimeout(CONNECT_MS);
            asking.setReadTimeout(READ_MS);
            asking.setInstanceFollowRedirects(true);
            if (instance != null) {
                RimgoRoute.offerOn(asking, instance);
            }
            if (accept != null) {
                asking.setRequestProperty("Accept", accept);
            }
            int said = asking.getResponseCode();
            if (said != HttpURLConnection.HTTP_OK) {
                throw new IOException(url + " answered " + said);
            }
            try (InputStream reading = asking.getInputStream()) {
                ByteArrayOutputStream held = new ByteArrayOutputStream();
                byte[] block = new byte[8192];
                int read;
                while ((read = reading.read(block)) > 0) {
                    held.write(block, 0, read);
                }
                return held.toString("UTF-8");
            }
        } finally {
            asking.disconnect();
        }
    }
}
