package app.morphe.extension.syncforreddit.http;


import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Semaphore;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.Requester;

/**
 * Requests to the archives the undelete patches read from.
 *
 * <p>These are free community services, and a feed can ask for dozens of images at once, so
 * the calls are held to a few at a time and spaced apart. They are also slow enough to matter:
 * without a timeout a stalled lookup holds an image loading thread indefinitely, which is worse
 * than simply not recovering the image.
 */
public final class ArchiveRequests {
    /** Enough to keep a feed moving without flooding the archive. */
    private static final int CONCURRENT_REQUESTS = 2;

    private static final long MINIMUM_SPACING_MS = 250;

    /**
     * How long anything waits on an archive.
     *
     * <p>These calls are made while a thread's comments are held, so this is time the comments
     * are not on screen. A wait of fifteen seconds was one a reader noticed on every thread that
     * held anything removed, for the whole of an outage.
     */
    private static final int CONNECT_TIMEOUT_MS = 5_000;
    private static final int READ_TIMEOUT_MS = 5_000;

    /** Consecutive failures from one host before it is left alone for a while. */
    private static final int FAILURES_BEFORE_RESTING = 2;

    /** How long a host that is not answering is left alone. */
    private static final long REST_FOR_MS = 5 * 60_000;

    /**
     * What each host has done lately.
     *
     * <p>Kept per host: these are several separate services, and one of them being down says
     * nothing about the others.
     */
    private static final Map<String, AtomicInteger> refusals = new ConcurrentHashMap<>();
    private static final Map<String, Long> restingUntil = new ConcurrentHashMap<>();

    private static final Semaphore inFlight = new Semaphore(CONCURRENT_REQUESTS, true);
    private static final Object spacingLock = new Object();
    private static long lastRequestAt;

    private ArchiveRequests() {}

    /**
     * Distinguishes an archive that answered from one that could not be reached, which callers
     * cache the result of: a lookup that failed must not be remembered as one that came back
     * empty, or a single slow moment leaves everything unrecoverable until the app restarts.
     *
     * @return The response body.
     * @throws IOException If the archive could not be asked, including when it turns the request
     *                     away for asking too often.
     */
    public static String get(String url, String accept) throws IOException {
        String host = hostOf(url);
        // An archive that has just failed twice is not asked again for a while. Without this an
        // outage is paid for over and over — once per thread holding anything removed, every
        // one of them waiting out the timeout before the comments appear.
        Long until = restingUntil.get(host);
        if (until != null && System.currentTimeMillis() < until) {
            throw new IOException(host + " is not answering; leaving it alone for now");
        }

        try {
            inFlight.acquire();
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
            throw new IOException("Interrupted waiting to call the archive", ex);
        }

        try {
            space();

            HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Accept", accept);
            connection.setUseCaches(false);
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);

            int code = connection.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) {
                connection.disconnect();
                Logger.printInfo(() -> "The archive answered " + code + " for " + url);
                throw new IOException("The archive answered " + code);
            }
            String answered = Requester.parseStringAndDisconnect(connection);
            answering(host);
            return answered;
        } catch (IOException ex) {
            Logger.printInfo(() -> "Could not reach the archive for " + url + ": " + ex);
            notAnswering(host);
            throw ex;
        } finally {
            inFlight.release();
        }
    }

    /** Remembered so that a host which comes back is asked again straight away. */
    private static void answering(String host) {
        refusals.remove(host);
        restingUntil.remove(host);
    }

    private static void notAnswering(String host) {
        int failed = refusals.computeIfAbsent(host, where -> new AtomicInteger())
                .incrementAndGet();
        if (failed >= FAILURES_BEFORE_RESTING) {
            restingUntil.put(host, System.currentTimeMillis() + REST_FOR_MS);
            refusals.remove(host);
            Logger.printInfo(() -> host + " has not answered " + failed
                    + " times; leaving it alone for " + (REST_FOR_MS / 60_000) + " minutes");
        }
    }

    private static String hostOf(String url) {
        try {
            String host = new URL(url).getHost();
            return host == null ? url : host;
        } catch (IOException ex) {
            return url;
        }
    }

    private static void space() {
        long waitFor;
        synchronized (spacingLock) {
            long now = System.currentTimeMillis();
            waitFor = Math.max(0, lastRequestAt + MINIMUM_SPACING_MS - now);
            lastRequestAt = now + waitFor;
        }

        if (waitFor > 0) {
            try {
                Thread.sleep(waitFor);
            } catch (InterruptedException ex) {
                Thread.currentThread().interrupt();
            }
        }
    }
}
