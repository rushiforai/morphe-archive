package com.travianpatch.notifier;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.IBinder;
import android.util.Log;

import androidx.core.app.NotificationCompat;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import okhttp3.Cookie;
import okhttp3.OkHttpClient;
import okhttp3.Request;

/**
 * Standalone notifier for Travian: Legends build/troop-training queues.
 *
 * Resumes the session captured once by LoginActivity (same public HTTP API
 * the app itself uses), polls for active queues, and fires a local
 * notification with details whenever one completes. Does not touch game
 * logic at all.
 */
public class NotifierService extends Service {

    private static final String TAG = "TravianNotifier";
    private static final String CHANNEL_ID = NotifierBootstrap.CHANNEL_ID;
    private static final long POLL_INTERVAL_MS = 60_000L;
    private static final long SESSION_SEED_TTL_MS = TimeUnit.DAYS.toMillis(3650);

    private static volatile boolean running = false;

    private OkHttpClient http;
    private String gameworldHost; // e.g. https://ts12.x1.europe.travian.com
    private final Map<String, TrackedEvent> tracked = new HashMap<String, TrackedEvent>();
    private Thread worker;

    /** Called from the patched Activity's onCreate() once a login session exists. Safe to call repeatedly. */
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

        http = TravianApi.newClient(new SimpleCookieJar());

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
                    resumeSession();
                }
                poll();
            } catch (SessionInvalidException sie) {
                Log.w(TAG, "stored session no longer valid, asking to log in again: " + sie.getMessage());
                SecureStore.clear(this);
                NotifierBootstrap.promptLogin(this);
                stopSelf();
                return;
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
    // session resume (no password involved — see LoginActivity for that)
    // ------------------------------------------------------------------

    private static final class SessionInvalidException extends Exception {
        SessionInvalidException(String msg) {
            super(msg);
        }
    }

    private void resumeSession() throws Exception {
        String sessionCookie = SecureStore.loadSessionCookie(this);
        if (sessionCookie == null) {
            throw new SessionInvalidException("no saved login session");
        }

        SimpleCookieJar jar = (SimpleCookieJar) http.cookieJar();
        String lobbyHost = TravianApi.hostOf(TravianApi.LOBBY_HOST);
        Cookie cookie = new Cookie.Builder()
                .name(TravianApi.LOBBY_SESSION_COOKIE)
                .value(sessionCookie)
                .domain(lobbyHost)
                .path("/")
                .httpOnly()
                .secure()
                .expiresAt(System.currentTimeMillis() + SESSION_SEED_TTL_MS)
                .build();
        jar.seed(lobbyHost, cookie);

        String avatarsQuery = "{ \"query\": \"query { a: avatars(wuid: null, context: null) "
                + "{ uuid, gameworld { metadata { url } } } }\" }";
        Request avatarsReq = new Request.Builder()
                .url(TravianApi.LOBBY_HOST + "/api/graphql")
                .post(TravianApi.jsonBody(avatarsQuery))
                .build();
        JSONObject avatarsResp = TravianApi.executeJson(http, avatarsReq);
        JSONObject data = avatarsResp.optJSONObject("data");
        if (data == null) {
            // the saved session was rejected outright (expired/revoked) — needs a fresh login
            throw new SessionInvalidException("session rejected by lobby: " + avatarsResp);
        }
        JSONArray avatars = data.getJSONArray("a");
        if (avatars.length() == 0) {
            throw new IllegalStateException("no avatars/villages found for this account");
        }
        JSONObject avatar = avatars.getJSONObject(0);
        String avatarUuid = avatar.getString("uuid");
        String worldUrl = avatar.getJSONObject("gameworld").getJSONObject("metadata").getString("url");
        String worldHost = worldUrl.endsWith("/") ? worldUrl.substring(0, worldUrl.length() - 1) : worldUrl;

        Request playReq = new Request.Builder()
                .url(TravianApi.LOBBY_HOST + "/api/avatar/play/" + avatarUuid)
                .post(TravianApi.emptyBody())
                .build();
        JSONObject playResp = TravianApi.executeJson(http, playReq);
        String worldCode = playResp.getString("code");

        Request worldAuthReq = new Request.Builder()
                .url(worldHost + "/api/v1/auth?redirect=false&code=" + worldCode + "&response_type=token")
                .post(TravianApi.emptyBody())
                .build();
        TravianApi.executeJson(http, worldAuthReq); // sets JWT cookie for worldHost

        gameworldHost = worldHost;
        Log.i(TAG, "resumed session, gameworld host = " + gameworldHost);
    }

    // ------------------------------------------------------------------
    // polling
    // ------------------------------------------------------------------

    private static final String POLL_QUERY =
            "{ \"query\": \"query { p: ownPlayer { villages { id name x y "
            + "buildEvents { id buildingTypeId aspiredLevel timestamp status isActive } "
            + "trainingTroops { eventId unitsLeft nextUnitReadyAt } "
            + "stable { trainingUnits { eventId unitsLeft nextUnitReadyAt } } "
            + "barracks { trainingUnits { eventId unitsLeft nextUnitReadyAt } } "
            + "} } }\" }";

    private void poll() throws Exception {
        Request req = new Request.Builder()
                .url(gameworldHost + "/api/v1/graphql")
                .post(TravianApi.jsonBody(POLL_QUERY))
                .build();
        JSONObject resp = TravianApi.executeJson(http, req);
        JSONObject data = resp.optJSONObject("data");
        if (data == null) {
            throw new IllegalStateException("no data in poll response (session likely expired): " + resp);
        }
        JSONObject player = data.getJSONObject("p");
        JSONArray villages = player.getJSONArray("villages");

        Map<String, TrackedEvent> stillActive = new HashMap<String, TrackedEvent>();

        for (int i = 0; i < villages.length(); i++) {
            JSONObject village = villages.getJSONObject(i);
            String villageName = village.optString("name", "your village");
            int vx = village.optInt("x", 0);
            int vy = village.optInt("y", 0);

            JSONArray buildEvents = village.optJSONArray("buildEvents");
            if (buildEvents != null) {
                for (int j = 0; j < buildEvents.length(); j++) {
                    JSONObject ev = buildEvents.getJSONObject(j);
                    String id = "build:" + ev.optLong("id");
                    stillActive.put(id, new TrackedEvent("build", villageName, vx, vy,
                            ev.optInt("buildingTypeId", -1), ev.optInt("aspiredLevel", -1), 0));
                }
            }
            collectQueue(village.optJSONArray("trainingTroops"), "train", villageName, vx, vy, stillActive);
            JSONObject stable = village.optJSONObject("stable");
            if (stable != null) {
                collectQueue(stable.optJSONArray("trainingUnits"), "stable", villageName, vx, vy, stillActive);
            }
            JSONObject barracks = village.optJSONObject("barracks");
            if (barracks != null) {
                collectQueue(barracks.optJSONArray("trainingUnits"), "barracks", villageName, vx, vy, stillActive);
            }
        }

        // sweep: anything tracked from the previous cycle that's no longer active just completed
        for (Map.Entry<String, TrackedEvent> entry : tracked.entrySet()) {
            if (!stillActive.containsKey(entry.getKey())) {
                notify(describeCompletion(entry.getValue()));
            }
        }
        tracked.clear();
        tracked.putAll(stillActive);

        Log.i(TAG, "poll ok: villages=" + villages.length() + " active=" + stillActive.size());
    }

    private void collectQueue(JSONArray queue, String kind, String villageName, int vx, int vy,
                               Map<String, TrackedEvent> stillActive) {
        if (queue == null) {
            return;
        }
        for (int j = 0; j < queue.length(); j++) {
            JSONObject ev = queue.optJSONObject(j);
            if (ev == null) {
                continue;
            }
            String id = kind + ":" + ev.optLong("eventId") + ":" + villageName;
            // keep the count as first observed — unitsLeft counts down each poll
            TrackedEvent existing = tracked.get(id);
            if (existing != null) {
                stillActive.put(id, existing);
            } else {
                stillActive.put(id, new TrackedEvent(kind, villageName, vx, vy, -1, -1, ev.optInt("unitsLeft", 0)));
            }
        }
    }

    private String describeCompletion(TrackedEvent ev) {
        String location = ev.villageName + " (" + ev.villageX + "|" + ev.villageY + ")";
        if ("build".equals(ev.kind)) {
            String name = GameData.buildingName(ev.buildingTypeId);
            String level = ev.aspiredLevel >= 0 ? " upgraded to level " + ev.aspiredLevel : " upgrade finished";
            return name + level + " — " + location;
        }
        String label = "train".equals(ev.kind) ? "Troop training"
                : "stable".equals(ev.kind) ? "Stable training"
                : "Barracks training";
        String count = ev.initialUnitsLeft > 0 ? " (" + ev.initialUnitsLeft + " units)" : "";
        return label + " finished" + count + " — " + location;
    }

    private static final class TrackedEvent {
        final String kind; // "build" | "train" | "stable" | "barracks"
        final String villageName;
        final int villageX;
        final int villageY;
        final int buildingTypeId; // -1 for troop-training events
        final int aspiredLevel; // -1 for troop-training events
        final int initialUnitsLeft; // 0 for build events

        TrackedEvent(String kind, String villageName, int villageX, int villageY,
                     int buildingTypeId, int aspiredLevel, int initialUnitsLeft) {
            this.kind = kind;
            this.villageName = villageName;
            this.villageX = villageX;
            this.villageY = villageY;
            this.buildingTypeId = buildingTypeId;
            this.aspiredLevel = aspiredLevel;
            this.initialUnitsLeft = initialUnitsLeft;
        }
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
}
