package com.travianpatch.notifier;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.IBinder;
import android.util.Base64;
import android.util.Log;

import androidx.core.app.NotificationCompat;

import org.json.JSONArray;
import org.json.JSONObject;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okio.BufferedSink;

/**
 * Standalone notifier for Travian: Legends build/troop-training queues.
 *
 * Logs in independently of the game's own Unity/IL2CPP layer (same public
 * HTTP API the app itself uses), polls for active queues, and fires a local
 * notification whenever one completes. Does not touch game logic at all.
 */
public class NotifierService extends Service {

    private static final String TAG = "TravianNotifier";
    private static final String CHANNEL_ID = "travian_notifier";
    private static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");

    // --- account + API constants (discovered via traffic capture) ---
    // Non-final: the patch injects sput-object instructions at build time
    // (from user-configurable patch options) to overwrite these defaults.
    public static String EMAIL = "you@example.com";
    public static String PASSWORD = "changeme";
    private static final String CLIENT_ID = "HIaSfC2LNQ1yXOMuY7Pc2uIH3EqkAi26";
    private static final String IDENTITY_HOST = "https://identity.service.legends.travian.info";
    private static final String LOBBY_HOST = "https://lobby.legends.travian.com";
    private static final long POLL_INTERVAL_MS = 60_000L;

    private static volatile boolean running = false;

    private OkHttpClient http;
    private String gameworldHost; // e.g. https://ts12.x1.europe.travian.com
    private final Set<String> notifiedEventIds = new HashSet<String>();
    private Thread worker;

    /** Called from the patched Activity's onCreate(). Safe to call repeatedly. */
    public static void start(Context ctx) {
        if (running) {
            return;
        }
        try {
            Intent intent = new Intent(ctx.getApplicationContext(), NotifierService.class);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                ctx.getApplicationContext().startForegroundService(intent);
            } else {
                ctx.getApplicationContext().startService(intent);
            }
        } catch (Throwable t) {
            Log.e(TAG, "failed to start", t);
        }
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (running) {
            return START_STICKY;
        }
        running = true;
        createChannel();
        startForeground(1, buildStatusNotification("Watching for build/troop timers…"));

        http = new OkHttpClient.Builder()
                .cookieJar(new SimpleCookieJar())
                .connectTimeout(15, TimeUnit.SECONDS)
                .readTimeout(15, TimeUnit.SECONDS)
                .build();

        worker = new Thread(new Runnable() {
            @Override
            public void run() {
                runLoop();
            }
        }, "travian-notifier-worker");
        worker.setDaemon(true);
        worker.start();

        return START_STICKY;
    }

    @Override
    public void onDestroy() {
        running = false;
        if (worker != null) {
            worker.interrupt();
        }
        super.onDestroy();
    }

    // ------------------------------------------------------------------
    // main loop
    // ------------------------------------------------------------------

    private void runLoop() {
        while (running) {
            try {
                if (gameworldHost == null) {
                    login();
                }
                poll();
            } catch (Exception e) {
                Log.w(TAG, "poll/login cycle failed, will retry: " + e);
                gameworldHost = null; // force re-login next time
            }
            try {
                Thread.sleep(POLL_INTERVAL_MS);
            } catch (InterruptedException ie) {
                return;
            }
        }
    }

    // ------------------------------------------------------------------
    // auth flow (mirrors the app's own login sequence)
    // ------------------------------------------------------------------

    private void login() throws Exception {
        String codeVerifier = randomUrlSafe(32);
        String codeChallenge = sha256UrlSafe(codeVerifier);

        JSONObject step1Body = new JSONObject();
        step1Body.put("code_challenge_method", "S256");
        step1Body.put("login", EMAIL);
        step1Body.put("password", PASSWORD);
        step1Body.put("code_challenge", codeChallenge);
        JSONObject step1 = postJson(IDENTITY_HOST + "/provider/login?client_id=" + CLIENT_ID, step1Body);
        String authCode = step1.getString("code");

        JSONObject step2Body = new JSONObject();
        step2Body.put("code", authCode);
        step2Body.put("code_verifier", codeVerifier);
        step2Body.put("locale", "en-US");
        postJson(LOBBY_HOST + "/api/auth/code", step2Body); // sets _tl_lobby_session cookie

        String avatarsQuery = "{ \"query\": \"query { a: avatars(wuid: null, context: null) "
                + "{ uuid, gameworld { metadata { url } } } }\" }";
        Request avatarsReq = new Request.Builder()
                .url(LOBBY_HOST + "/api/graphql")
                .post(jsonBody(avatarsQuery))
                .build();
        JSONObject avatarsResp = executeJson(avatarsReq);
        JSONArray avatars = avatarsResp.getJSONObject("data").getJSONArray("a");
        if (avatars.length() == 0) {
            throw new IllegalStateException("no avatars/villages found for this account");
        }
        JSONObject avatar = avatars.getJSONObject(0);
        String avatarUuid = avatar.getString("uuid");
        String worldUrl = avatar.getJSONObject("gameworld").getJSONObject("metadata").getString("url");
        String worldHost = worldUrl.endsWith("/") ? worldUrl.substring(0, worldUrl.length() - 1) : worldUrl;

        Request playReq = new Request.Builder()
                .url(LOBBY_HOST + "/api/avatar/play/" + avatarUuid)
                .post(emptyBody())
                .build();
        JSONObject playResp = executeJson(playReq);
        String worldCode = playResp.getString("code");

        Request worldAuthReq = new Request.Builder()
                .url(worldHost + "/api/v1/auth?redirect=false&code=" + worldCode + "&response_type=token")
                .post(emptyBody())
                .build();
        executeJson(worldAuthReq); // sets JWT cookie for worldHost

        gameworldHost = worldHost;
        Log.i(TAG, "logged in, gameworld host = " + gameworldHost);
    }

    // ------------------------------------------------------------------
    // polling
    // ------------------------------------------------------------------

    private static final String POLL_QUERY =
            "{ \"query\": \"query { p: ownPlayer { villages { id name "
            + "buildEvents { id buildingTypeId aspiredLevel timestamp status isActive } "
            + "trainingTroops { eventId unitsLeft nextUnitReadyAt } "
            + "stable { trainingUnits { eventId unitsLeft nextUnitReadyAt } } "
            + "barracks { trainingUnits { eventId unitsLeft nextUnitReadyAt } } "
            + "} } }\" }";

    private void poll() throws Exception {
        Request req = new Request.Builder()
                .url(gameworldHost + "/api/v1/graphql")
                .post(jsonBody(POLL_QUERY))
                .build();
        JSONObject resp = executeJson(req);
        JSONObject data = resp.optJSONObject("data");
        if (data == null) {
            throw new IllegalStateException("no data in poll response (session likely expired): " + resp);
        }
        JSONObject player = data.getJSONObject("p");
        JSONArray villages = player.getJSONArray("villages");

        Set<String> stillActive = new HashSet<String>();

        for (int i = 0; i < villages.length(); i++) {
            JSONObject village = villages.getJSONObject(i);
            String villageName = village.optString("name", "your village");

            JSONArray buildEvents = village.optJSONArray("buildEvents");
            if (buildEvents != null) {
                for (int j = 0; j < buildEvents.length(); j++) {
                    JSONObject ev = buildEvents.getJSONObject(j);
                    String id = "build:" + ev.optLong("id");
                    stillActive.add(id);
                    if (!notifiedEventIds.contains(id)) {
                        // first time we've seen it: nothing to notify yet, just track it
                        notifiedEventIds.add(id + ":seen");
                    }
                }
            }
            collectQueue(village.optJSONArray("trainingTroops"), "train", villageName, stillActive);
            JSONObject stable = village.optJSONObject("stable");
            if (stable != null) {
                collectQueue(stable.optJSONArray("trainingUnits"), "stable", villageName, stillActive);
            }
            JSONObject barracks = village.optJSONObject("barracks");
            if (barracks != null) {
                collectQueue(barracks.optJSONArray("trainingUnits"), "barracks", villageName, stillActive);
            }
        }

        // sweep: any previously-seen id no longer present => completed
        Set<String> toRemove = new HashSet<String>();
        for (String tracked : notifiedEventIds) {
            if (!tracked.endsWith(":seen")) {
                continue;
            }
            String bareId = tracked.substring(0, tracked.length() - ":seen".length());
            if (!stillActive.contains(bareId)) {
                notify(describeCompletion(bareId));
                toRemove.add(tracked);
            }
        }
        notifiedEventIds.removeAll(toRemove);

        Log.i(TAG, "poll ok: villages=" + villages.length()
                + " active=" + stillActive + " tracked=" + notifiedEventIds
                + " completedThisRound=" + toRemove.size());
    }

    private void collectQueue(JSONArray queue, String kind, String villageName, Set<String> stillActive) {
        if (queue == null) {
            return;
        }
        for (int j = 0; j < queue.length(); j++) {
            JSONObject ev = queue.optJSONObject(j);
            if (ev == null) {
                continue;
            }
            String id = kind + ":" + ev.optLong("eventId") + ":" + villageName;
            stillActive.add(id);
            String seenKey = id + ":seen";
            if (!notifiedEventIds.contains(seenKey)) {
                notifiedEventIds.add(seenKey);
            }
        }
    }

    private String describeCompletion(String bareId) {
        if (bareId.startsWith("build:")) {
            return "A building upgrade has finished!";
        }
        if (bareId.startsWith("train:") || bareId.startsWith("stable:") || bareId.startsWith("barracks:")) {
            return "Troop training has finished!";
        }
        return "A queue has finished in your village!";
    }

    // ------------------------------------------------------------------
    // notifications
    // ------------------------------------------------------------------

    private void createChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationManager nm = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
            NotificationChannel channel = new NotificationChannel(
                    CHANNEL_ID, "Travian timers", NotificationManager.IMPORTANCE_DEFAULT);
            channel.setDescription("Alerts when a building, upgrade, or troop queue finishes.");
            nm.createNotificationChannel(channel);
        }
    }

    private Notification buildStatusNotification(String text) {
        return new NotificationCompat.Builder(this, CHANNEL_ID)
                .setContentTitle("Travian Notifier")
                .setContentText(text)
                .setSmallIcon(android.R.drawable.ic_popup_reminder)
                .setPriority(NotificationCompat.PRIORITY_LOW)
                .setOngoing(true)
                .build();
    }

    private void notify(String text) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            int granted = getApplicationContext().checkSelfPermission("android.permission.POST_NOTIFICATIONS");
            if (granted != PackageManager.PERMISSION_GRANTED) {
                Log.w(TAG, "POST_NOTIFICATIONS not granted, skipping notification: " + text);
                return;
            }
        }
        NotificationManager nm = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        Notification n = new NotificationCompat.Builder(this, CHANNEL_ID)
                .setContentTitle("Travian: Legends")
                .setContentText(text)
                .setSmallIcon(android.R.drawable.ic_popup_reminder)
                .setPriority(NotificationCompat.PRIORITY_HIGH)
                .setAutoCancel(true)
                .build();
        nm.notify((int) System.currentTimeMillis(), n);
    }

    // ------------------------------------------------------------------
    // http helpers
    // ------------------------------------------------------------------

    private JSONObject postJson(String url, JSONObject body) throws Exception {
        Request req = new Request.Builder()
                .url(url)
                .post(jsonBody(body.toString()))
                .build();
        return executeJson(req);
    }

    private JSONObject executeJson(Request req) throws Exception {
        Response resp = http.newCall(req).execute();
        try {
            String bodyStr = resp.body() != null ? resp.body().string() : "";
            if (bodyStr.length() == 0) {
                return new JSONObject();
            }
            return new JSONObject(bodyStr);
        } finally {
            resp.close();
        }
    }

    // ------------------------------------------------------------------
    // request body helpers (avoids OkHttp version-specific RequestBody.create
    // overload ordering, which differs between OkHttp 3.x and 4.x)
    // ------------------------------------------------------------------

    private static RequestBody jsonBody(final String content) {
        return new RequestBody() {
            @Override
            public MediaType contentType() {
                return JSON;
            }

            @Override
            public void writeTo(BufferedSink sink) throws java.io.IOException {
                sink.writeUtf8(content);
            }
        };
    }

    private static RequestBody emptyBody() {
        return new RequestBody() {
            @Override
            public MediaType contentType() {
                return null;
            }

            @Override
            public void writeTo(BufferedSink sink) throws java.io.IOException {
                // no body
            }
        };
    }

    // ------------------------------------------------------------------
    // PKCE helpers
    // ------------------------------------------------------------------

    private static String randomUrlSafe(int numBytes) {
        byte[] b = new byte[numBytes];
        new SecureRandom().nextBytes(b);
        return Base64.encodeToString(b, Base64.URL_SAFE | Base64.NO_PADDING | Base64.NO_WRAP);
    }

    private static String sha256UrlSafe(String input) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(input.getBytes("UTF-8"));
        return Base64.encodeToString(hash, Base64.URL_SAFE | Base64.NO_PADDING | Base64.NO_WRAP);
    }
}
