package com.waze.gw;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.SystemClock;
import android.util.Log;

import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Resolves coordinates from Google Maps shares without replacing Waze's normal search flow.
 *
 * <p>The shared text is still submitted to Waze, while a recognized Google Maps URL is resolved
 * off the main thread and opened directly as a Waze coordinate preview. Waze 5.23 does not always
 * publish the legacy Search V2 "no results" state, so that callback cannot be a launch gate.</p>
 */
final class GoogleMapsShareFallback {
    private static final String TAG = "WazeGW.Share";
    private static final Object LOCK = new Object();
    private static final long PENDING_TTL_MS = 20_000L;
    private static final int CONNECT_TIMEOUT_MS = 5_000;
    private static final int READ_TIMEOUT_MS = 5_000;
    private static final int MAX_REDIRECTS = 6;
    private static final long DIRECT_OPEN_DELAY_MS = 750L;

    private static final Pattern WEB_URL = Pattern.compile("https://[^\\s<>\\\"']+", Pattern.CASE_INSENSITIVE);
    private static final Pattern AT_COORDINATES = Pattern.compile(
            "/@(-?\\d{1,2}(?:\\.\\d+)?),(-?\\d{1,3}(?:\\.\\d+)?)",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern DATA_COORDINATES = Pattern.compile(
            "!3d(-?\\d{1,2}(?:\\.\\d+)?)!4d(-?\\d{1,3}(?:\\.\\d+)?)",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern QUERY_COORDINATES = Pattern.compile(
            "(?:^|[?&])(?:query|destination|q|ll)=(-?\\d{1,2}(?:\\.\\d+)?)[,\\s]+"
                    + "(-?\\d{1,3}(?:\\.\\d+)?)(?:$|[&#])",
            Pattern.CASE_INSENSITIVE);

    private static long generation;
    private static long receivedAt;
    private static boolean searchReturnedEmpty;
    private static boolean launched;
    private static double latitude = Double.NaN;
    private static double longitude = Double.NaN;

    private GoogleMapsShareFallback() { }

    static void onSharedText(String text) {
        final String googleUrl = extractGoogleMapsUrl(text);
        final long token;
        synchronized (LOCK) {
            token = ++generation;
            receivedAt = SystemClock.elapsedRealtime();
            searchReturnedEmpty = false;
            launched = false;
            latitude = Double.NaN;
            longitude = Double.NaN;
            if (googleUrl == null) {
                receivedAt = 0L;
                return;
            }
        }
        Log.i(TAG, "Accepted Google Maps share; resolving coordinate in background");

        Thread resolver = new Thread(new Runnable() {
            @Override public void run() {
                double[] coordinate = null;
                try {
                    coordinate = resolve(googleUrl);
                } catch (Throwable error) {
                    Log.w(TAG, "Google Maps coordinate resolution failed", error);
                }
                if (coordinate == null) {
                    Log.i(TAG, "Google Maps share contained no usable coordinate");
                    return;
                }
                Log.i(TAG, "Google Maps coordinate resolved");
                boolean openNow;
                synchronized (LOCK) {
                    if (token != generation || expiredLocked()) return;
                    latitude = coordinate[0];
                    longitude = coordinate[1];
                    openNow = searchReturnedEmpty && !launched;
                    if (openNow) launched = true;
                }
                if (openNow) {
                    openPreview(coordinate[0], coordinate[1], token);
                    return;
                }
                // Let jb.a(Intent) finish submitting Waze's original text search first. The
                // coordinate preview then wins deterministically even when Search V2 never emits
                // the legacy empty-result state used by WazeMod2.
                try {
                    Thread.sleep(DIRECT_OPEN_DELAY_MS);
                } catch (InterruptedException interrupted) {
                    Thread.currentThread().interrupt();
                    return;
                }
                synchronized (LOCK) {
                    if (token != generation || expiredLocked() || launched) return;
                    launched = true;
                }
                openPreview(coordinate[0], coordinate[1], token);
            }
        }, "WazeGW-GMapsResolve");
        resolver.setDaemon(true);
        resolver.start();
    }

    static void onSearchResultsEmpty() {
        final long token;
        final double lat;
        final double lon;
        synchronized (LOCK) {
            if (receivedAt == 0L || expiredLocked() || launched) return;
            searchReturnedEmpty = true;
            Log.i(TAG, "Waze returned no result for the active Google Maps share");
            if (!validCoordinate(latitude, longitude)) return;
            launched = true;
            token = generation;
            lat = latitude;
            lon = longitude;
        }
        openPreview(lat, lon, token);
    }

    private static boolean expiredLocked() {
        return receivedAt == 0L
                || SystemClock.elapsedRealtime() - receivedAt > PENDING_TTL_MS;
    }

    private static String extractGoogleMapsUrl(String text) {
        if (text == null || text.length() == 0) return null;
        Matcher matcher = WEB_URL.matcher(text);
        while (matcher.find()) {
            String candidate = trimUrlPunctuation(matcher.group());
            try {
                URL url = new URL(candidate);
                if (isAllowedMapsUrl(url, true)) return candidate;
            } catch (Throwable ignored) { }
        }
        return null;
    }

    private static String trimUrlPunctuation(String value) {
        int end = value.length();
        while (end > 0) {
            char c = value.charAt(end - 1);
            if (c == '.' || c == ',' || c == ';' || c == ')' || c == ']' || c == '}') end--;
            else break;
        }
        return value.substring(0, end);
    }

    private static double[] resolve(String sharedUrl) throws Exception {
        URL current = new URL(sharedUrl);
        for (int redirect = 0; redirect <= MAX_REDIRECTS; redirect++) {
            if (!isAllowedMapsUrl(current, redirect == 0)) return null;
            double[] direct = parseCoordinates(current.toString());
            if (direct != null) return direct;

            HttpURLConnection connection = null;
            try {
                connection = (HttpURLConnection) current.openConnection();
                connection.setInstanceFollowRedirects(false);
                connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
                connection.setReadTimeout(READ_TIMEOUT_MS);
                connection.setRequestMethod("GET");
                connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Android) WazeMod");
                connection.setRequestProperty("Accept", "text/html,application/xhtml+xml");
                DiagnosticsLogger.networkStart("google-maps-resolve", connection);
                int code = connection.getResponseCode();
                DiagnosticsLogger.networkEnd("google-maps-resolve", connection,
                        code, 0L, null);
                if (code >= 300 && code < 400) {
                    String location = connection.getHeaderField("Location");
                    if (location == null || location.length() == 0) return null;
                    URI next = current.toURI().resolve(location);
                    current = next.toURL();
                    continue;
                }
                URL effective = connection.getURL();
                if (!isAllowedMapsUrl(effective, false)) return null;
                return parseCoordinates(effective.toString());
            } finally {
                if (connection != null) connection.disconnect();
            }
        }
        return null;
    }

    private static boolean isAllowedMapsUrl(URL url, boolean initial) {
        if (url == null || !"https".equalsIgnoreCase(url.getProtocol())) return false;
        String host = url.getHost();
        if (host == null) return false;
        host = host.toLowerCase(Locale.US);
        String path = url.getPath();
        if (path == null) path = "";
        if ("maps.app.goo.gl".equals(host)) return true;
        if ("goo.gl".equals(host)) return path.startsWith("/maps/") || path.equals("/maps");
        if ("maps.google.com".equals(host)) return true;
        if ("google.com".equals(host) || "www.google.com".equals(host)) {
            return path.startsWith("/maps") || (!initial && path.startsWith("/url"));
        }
        return false;
    }

    private static double[] parseCoordinates(String value) {
        if (value == null) return null;
        String decoded = value;
        try {
            decoded = URLDecoder.decode(value, "UTF-8");
        } catch (Throwable ignored) { }
        double[] coordinate = match(decoded, AT_COORDINATES);
        if (coordinate == null) coordinate = match(decoded, DATA_COORDINATES);
        if (coordinate == null) coordinate = match(decoded, QUERY_COORDINATES);
        return coordinate;
    }

    private static double[] match(String value, Pattern pattern) {
        Matcher matcher = pattern.matcher(value);
        if (!matcher.find()) return null;
        try {
            double lat = Double.parseDouble(matcher.group(1));
            double lon = Double.parseDouble(matcher.group(2));
            return validCoordinate(lat, lon) ? new double[] { lat, lon } : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean validCoordinate(double lat, double lon) {
        return !Double.isNaN(lat) && !Double.isNaN(lon)
                && lat >= -90.0 && lat <= 90.0
                && lon >= -180.0 && lon <= 180.0
                && !(lat == 0.0 && lon == 0.0);
    }

    private static void openPreview(double lat, double lon, long token) {
        synchronized (LOCK) {
            if (token != generation || expiredLocked()) return;
        }
        try {
            Context context = currentApplication();
            if (context == null) return;
            Class<?> mainActivity = Class.forName("com.waze.MainActivity");
            String ll = String.format(Locale.US, "%.7f,%.7f", lat, lon);
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("waze://?ll=" + ll));
            intent.setClass(context, mainActivity);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK
                    | Intent.FLAG_ACTIVITY_CLEAR_TOP
                    | Intent.FLAG_ACTIVITY_SINGLE_TOP);
            context.startActivity(intent);
            Log.i(TAG, "Opened Waze coordinate preview after empty shared search: " + ll);
            clear(token);
        } catch (Throwable error) {
            Log.w(TAG, "Unable to open Waze coordinate preview", error);
            clear(token);
        }
    }

    private static Context currentApplication() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke((Object) null);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void clear(long token) {
        synchronized (LOCK) {
            if (token != generation) return;
            receivedAt = 0L;
            searchReturnedEmpty = false;
            latitude = Double.NaN;
            longitude = Double.NaN;
        }
    }
}
