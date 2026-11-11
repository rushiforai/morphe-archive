package app.sledgesune.extension.waze;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.os.Bundle;
import android.util.Log;
import android.view.ViewGroup;
import android.webkit.CookieManager;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Trip history for Waze: start and end time of each drive.
 * <p>
 * Primary source: the drive archive on Waze's servers (the list the Waze Map Editor shows under "Drives").
 * Fallback: navigation sessions recorded on the phone by this patch, which also works without an account.
 */
@SuppressWarnings("unused")
public final class TripHistoryPatch {

    private static final String TAG = "TripHistoryPatch";

    private static final String PREFS = "sledgesune_trip_history";
    private static final String KEY_TRIPS = "trips";
    private static final String KEY_OPEN_START = "open_start";
    private static final String KEY_LAST_SEEN = "last_seen";
    private static final int MAX_LOCAL_TRIPS = 3000;
    private static final long HEARTBEAT_SAVE_INTERVAL_MS = 60_000;

    /** Only ever contacted host. Same site the app's own web pages use. */
    private static final String WAZE_WEB = "https://www.waze.com";
    /** Server environments: rest of world, North America, Israel. An account has drives in one of them. */
    private static final String[] ENVIRONMENTS = {"row-", "", "il-"};
    private static final int PAGE_SIZE = 50;
    private static final int MAX_PAGES = 40;

    private static volatile Application application;
    private static volatile WeakReference<Activity> currentActivity = new WeakReference<>(null);
    private static volatile boolean openOriginalOnce;
    private static long lastHeartbeatSave;

    private static final class Trip implements Comparable<Trip> {
        final long start;
        final long end;
        /** Negative when unknown. */
        final int meters;
        final boolean online;
        /** End time is the last moment the phone saw the drive running (app was closed mid-drive). */
        final boolean endEstimated;

        Trip(long start, long end, int meters, boolean online, boolean endEstimated) {
            this.start = start;
            this.end = end;
            this.meters = meters;
            this.online = online;
            this.endEstimated = endEstimated;
        }

        @Override
        public int compareTo(Trip other) {
            return Long.compare(other.start, start); // Newest first.
        }
    }

    // region Injection points

    /** Injection point: Application.onCreate(). */
    public static void onApplicationCreate(Application app) {
        try {
            application = app;
            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityResumed(Activity activity) {
                    currentActivity = new WeakReference<>(activity);
                }

                @Override
                public void onActivityPaused(Activity activity) {
                    if (currentActivity.get() == activity) currentActivity = new WeakReference<>(null);
                }

                @Override
                public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                }

                @Override
                public void onActivityStarted(Activity activity) {
                }

                @Override
                public void onActivityStopped(Activity activity) {
                }

                @Override
                public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                }

                @Override
                public void onActivityDestroyed(Activity activity) {
                }
            });
            closeInterruptedTrip();
        } catch (Throwable t) {
            Log.e(TAG, "onApplicationCreate failed", t);
        }
    }

    /** Injection point: the native core reports that navigation started or stopped. */
    public static void onNavigationStateChanged(boolean navigating, int reason) {
        try {
            SharedPreferences prefs = prefs();
            if (prefs == null) return;
            long now = System.currentTimeMillis();
            long openStart = prefs.getLong(KEY_OPEN_START, 0);

            if (navigating) {
                if (openStart == 0) {
                    prefs.edit().putLong(KEY_OPEN_START, now).putLong(KEY_LAST_SEEN, now).apply();
                }
            } else if (openStart != 0) {
                saveLocalTrip(prefs, openStart, now, false);
            }
        } catch (Throwable t) {
            Log.e(TAG, "onNavigationStateChanged failed", t);
        }
    }

    /** Injection point: called often while navigating. Remembers when the drive was last seen running. */
    public static void onNavigationHeartbeat(int etaSeconds) {
        try {
            long now = System.currentTimeMillis();
            if (now - lastHeartbeatSave < HEARTBEAT_SAVE_INTERVAL_MS) return;
            lastHeartbeatSave = now;
            SharedPreferences prefs = prefs();
            if (prefs != null && prefs.getLong(KEY_OPEN_START, 0) != 0) {
                prefs.edit().putLong(KEY_LAST_SEEN, now).apply();
            }
        } catch (Throwable t) {
            Log.e(TAG, "onNavigationHeartbeat failed", t);
        }
    }

    /**
     * Injection point: Settings > Privacy > Navigation history was tapped.
     *
     * @param webHeaders    the headers the app sends to Waze's own web pages (identify the signed-in app user)
     * @param originalClass class of the patched method, used to open Waze's own page on request
     * @return true if the trip history screen was shown and the original action must be skipped
     */
    public static boolean showHistory(Map<String, String> webHeaders, String originalClass, String originalMethod) {
        try {
            if (openOriginalOnce) {
                openOriginalOnce = false;
                return false;
            }
            Activity activity = currentActivity.get();
            if (activity == null || activity.isFinishing()) return false;

            new HistoryScreen(activity, webHeaders, originalClass, originalMethod).show();
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "showHistory failed", t);
            return false;
        }
    }

    // endregion

    // region Local recording

    private static SharedPreferences prefs() {
        Application app = application;
        return app == null ? null : app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /** The app was closed during a drive: end it at the last moment it was seen running. */
    private static void closeInterruptedTrip() {
        SharedPreferences prefs = prefs();
        if (prefs == null) return;
        long openStart = prefs.getLong(KEY_OPEN_START, 0);
        if (openStart == 0) return;
        long lastSeen = Math.max(prefs.getLong(KEY_LAST_SEEN, openStart), openStart);
        saveLocalTrip(prefs, openStart, lastSeen, true);
    }

    private static synchronized void saveLocalTrip(SharedPreferences prefs, long start, long end, boolean endEstimated) {
        StringBuilder trips = new StringBuilder(prefs.getString(KEY_TRIPS, ""));
        trips.append(start).append(',').append(end).append(',').append(endEstimated ? 1 : 0).append('\n');

        // Drop the oldest entries beyond the cap.
        String all = trips.toString();
        int lines = 0;
        for (int i = 0; i < all.length(); i++) if (all.charAt(i) == '\n') lines++;
        while (lines > MAX_LOCAL_TRIPS) {
            all = all.substring(all.indexOf('\n') + 1);
            lines--;
        }

        prefs.edit().putString(KEY_TRIPS, all).remove(KEY_OPEN_START).remove(KEY_LAST_SEEN).apply();
    }

    private static List<Trip> loadLocalTrips() {
        List<Trip> trips = new ArrayList<>();
        SharedPreferences prefs = prefs();
        if (prefs == null) return trips;
        for (String line : prefs.getString(KEY_TRIPS, "").split("\n")) {
            String[] parts = line.split(",");
            if (parts.length < 3) continue;
            try {
                trips.add(new Trip(Long.parseLong(parts[0]), Long.parseLong(parts[1]), -1, false, "1".equals(parts[2])));
            } catch (NumberFormatException ignored) {
            }
        }
        return trips;
    }

    // endregion

    // region Online source

    private static final class OnlineResult {
        final List<Trip> trips = new ArrayList<>();
        boolean signedIn;
        boolean failed;
    }

    private static OnlineResult fetchOnlineTrips(Map<String, String> webHeaders) {
        OnlineResult result = new OnlineResult();
        String cookies = null;
        String userAgent = null;
        try {
            cookies = CookieManager.getInstance().getCookie(WAZE_WEB);
            userAgent = WebSettings.getDefaultUserAgent(application);
        } catch (Throwable t) {
            Log.w(TAG, "WebView not available", t);
        }

        for (String environment : ENVIRONMENTS) {
            try {
                for (int page = 0; page < MAX_PAGES; page++) {
                    String url = WAZE_WEB + "/" + environment + "Descartes/app/Archive/List?minDistance=0&offset="
                            + (page * PAGE_SIZE) + "&count=" + PAGE_SIZE;
                    HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
                    connection.setConnectTimeout(15_000);
                    connection.setReadTimeout(20_000);
                    connection.setInstanceFollowRedirects(false);
                    connection.setRequestProperty("Accept", "application/json");
                    if (userAgent != null) connection.setRequestProperty("User-Agent", userAgent);
                    if (cookies != null && !cookies.isEmpty()) connection.setRequestProperty("Cookie", cookies);
                    if (webHeaders != null) {
                        for (Map.Entry<String, String> header : webHeaders.entrySet()) {
                            if (header.getKey() != null && header.getValue() != null) {
                                connection.setRequestProperty(header.getKey(), header.getValue());
                            }
                        }
                    }

                    int status = connection.getResponseCode();
                    if (status != 200) {
                        connection.disconnect();
                        break; // 403 = guest (not signed in on this environment).
                    }
                    result.signedIn = true;

                    JSONArray objects = new JSONObject(readAll(connection.getInputStream()))
                            .getJSONObject("archives").getJSONArray("objects");
                    connection.disconnect();

                    for (int i = 0; i < objects.length(); i++) {
                        JSONObject drive = objects.getJSONObject(i);
                        long start = drive.optLong("startTime", 0);
                        long end = drive.optLong("endTime", 0);
                        // Entries without an end time are app launches where no drive happened.
                        if (start > 0 && end > start) {
                            result.trips.add(new Trip(start, end, drive.optInt("totalRoadMeters", -1), true, false));
                        }
                    }
                    if (objects.length() < PAGE_SIZE) break;
                }
            } catch (Throwable t) {
                Log.w(TAG, "Online history request failed for environment '" + environment + "'", t);
                result.failed = true;
            }
        }
        return result;
    }

    private static String readAll(InputStream stream) throws Exception {
        try (InputStream in = stream) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
            return out.toString("UTF-8");
        }
    }

    /** Online drives first; phone-recorded trips are added only where no online drive overlaps them. */
    private static List<Trip> merge(List<Trip> online, List<Trip> local) {
        List<Trip> merged = new ArrayList<>(online);
        for (Trip trip : local) {
            boolean covered = false;
            for (Trip other : online) {
                if (trip.start < other.end && trip.end > other.start) {
                    covered = true;
                    break;
                }
            }
            if (!covered) merged.add(trip);
        }
        Collections.sort(merged);
        return merged;
    }

    // endregion

    // region Screen

    private static final class HistoryScreen {
        private final Activity activity;
        private final Map<String, String> webHeaders;
        private final String originalClass;
        private final String originalMethod;

        private final SimpleDateFormat dayFormat = new SimpleDateFormat("EEE d MMM yyyy", Locale.getDefault());
        private final SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm", Locale.getDefault());
        private final SimpleDateFormat csvFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.US);

        private Context themed;
        private ArrayAdapter<String> adapter;
        private AlertDialog dialog;
        private List<Trip> shown = new ArrayList<>();
        private boolean showSignInRow;

        HistoryScreen(Activity activity, Map<String, String> webHeaders, String originalClass, String originalMethod) {
            this.activity = activity;
            this.webHeaders = webHeaders;
            this.originalClass = originalClass;
            this.originalMethod = originalMethod;
        }

        void show() {
            boolean night = (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;
            AlertDialog.Builder builder = new AlertDialog.Builder(activity, night
                    ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                    : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert);
            themed = builder.getContext();

            adapter = new ArrayAdapter<>(themed, android.R.layout.simple_list_item_1, new ArrayList<String>());
            ListView list = new ListView(themed);
            list.setAdapter(adapter);
            list.setOnItemClickListener((parent, view, position, id) -> {
                if (showSignInRow && position == 0) showSignIn();
            });

            dialog = builder.setTitle("Trip history")
                    .setView(list)
                    .setPositiveButton("Close", null)
                    .setNeutralButton("Waze page", (d, which) -> openOriginal())
                    .setNegativeButton("Copy CSV", (d, which) -> copyCsv())
                    .create();
            dialog.show();

            render(loadLocalTrips(), "Loading drives from Waze…", false);
            loadOnline();
        }

        private void loadOnline() {
            new Thread(() -> {
                final OnlineResult online = fetchOnlineTrips(webHeaders);
                final List<Trip> local = loadLocalTrips();
                activity.runOnUiThread(() -> {
                    if (dialog == null || !dialog.isShowing()) return;
                    if (online.signedIn) {
                        render(merge(online.trips, local), online.trips.isEmpty()
                                ? "Waze's servers have no drives for this account." : null, false);
                    } else {
                        render(local, online.failed
                                ? "Could not reach Waze. Showing trips recorded on this phone. Tap to sign in to waze.com."
                                : "Not signed in to waze.com. Showing trips recorded on this phone. Tap to sign in.", true);
                    }
                });
            }, "TripHistoryFetch").start();
        }

        private void render(List<Trip> trips, String notice, boolean signInRow) {
            Collections.sort(trips);
            shown = trips;
            showSignInRow = signInRow;

            adapter.clear();
            if (notice != null) adapter.add(notice);
            else if (signInRow) adapter.add("Tap to sign in to waze.com.");
            if (trips.isEmpty() && notice == null) adapter.add("No trips yet.");
            for (Trip trip : trips) adapter.add(describe(trip));
            adapter.notifyDataSetChanged();
        }

        private String describe(Trip trip) {
            long minutes = Math.max(0, Math.round((trip.end - trip.start) / 60000.0));
            StringBuilder text = new StringBuilder();
            text.append(dayFormat.format(new Date(trip.start))).append('\n')
                    .append(timeFormat.format(new Date(trip.start))).append(" → ")
                    .append(trip.endEstimated ? "~" : "").append(timeFormat.format(new Date(trip.end)))
                    .append("   ").append(minutes).append(" min");
            if (trip.meters >= 0) {
                text.append(String.format(Locale.getDefault(), ", %.1f km", trip.meters / 1000.0));
            }
            if (!trip.online) text.append("   (recorded on phone)");
            return text.toString();
        }

        private void copyCsv() {
            StringBuilder csv = new StringBuilder("start,end,minutes,km,source\n");
            for (Trip trip : shown) {
                csv.append(csvFormat.format(new Date(trip.start))).append(',')
                        .append(csvFormat.format(new Date(trip.end))).append(',')
                        .append(Math.round((trip.end - trip.start) / 60000.0)).append(',')
                        .append(trip.meters >= 0 ? String.format(Locale.US, "%.1f", trip.meters / 1000.0) : "").append(',')
                        .append(trip.online ? "waze" : (trip.endEstimated ? "phone (end estimated)" : "phone"))
                        .append('\n');
            }
            ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard != null) {
                clipboard.setPrimaryClip(ClipData.newPlainText("Waze trip history", csv));
                Toast.makeText(activity, shown.size() + " trips copied", Toast.LENGTH_SHORT).show();
            }
        }

        /** Opens Waze's own Navigation history page by running the original, unpatched action. */
        private void openOriginal() {
            try {
                openOriginalOnce = true;
                java.lang.reflect.Method method = Class.forName(originalClass).getDeclaredMethod(originalMethod);
                method.setAccessible(true);
                method.invoke(null);
            } catch (Throwable t) {
                Log.e(TAG, "Could not open Waze's navigation history page", t);
            } finally {
                openOriginalOnce = false;
            }
        }

        /** Website sign-in inside a WebView. Its cookies are then used for the online drive list. */
        private void showSignIn() {
            try {
                final WebView webView = new WebView(activity);
                webView.getSettings().setJavaScriptEnabled(true);
                webView.getSettings().setDomStorageEnabled(true);
                CookieManager.getInstance().setAcceptCookie(true);
                webView.setWebViewClient(new WebViewClient());
                webView.setLayoutParams(new ViewGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
                webView.loadUrl(WAZE_WEB + "/signin?redirect=%2Faccount");

                new AlertDialog.Builder(themed)
                        .setTitle("Sign in to waze.com")
                        .setView(webView)
                        .setPositiveButton("Done", null)
                        .setOnDismissListener(d -> {
                            CookieManager.getInstance().flush();
                            webView.destroy();
                            if (dialog != null && dialog.isShowing()) {
                                render(loadLocalTrips(), "Loading drives from Waze…", false);
                                loadOnline();
                            }
                        })
                        .show();
            } catch (Throwable t) {
                Log.e(TAG, "Could not open the sign-in page", t);
                Toast.makeText(activity, "Could not open the sign-in page", Toast.LENGTH_SHORT).show();
            }
        }
    }

    // endregion
}
