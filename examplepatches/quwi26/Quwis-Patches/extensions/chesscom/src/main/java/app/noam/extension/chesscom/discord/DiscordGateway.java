package app.noam.extension.chesscom.discord;

import android.content.Context;

import org.json.JSONObject;

import app.noam.extension.chesscom.Utils;

/**
 * One Discord gateway session: Hello, the heartbeat, Identify with the OAuth token, and op 3
 * presence updates. A dropped connection is retried with a growing pause; a refused one is not.
 */
final class DiscordGateway {
    /** DEDUPE_USER_OBJECTS, PRIORITIZED_READY_PAYLOAD, AUTO_CALL_CONNECT, AUTO_LOBBY_CONNECT. */
    private static final int CAPABILITIES = (1 << 4) | (1 << 5) | (1 << 12) | (1 << 16);
    /** Direct messages, private channels, calls, relationships, presence and lobbies. */
    private static final int INTENTS =
        (1 << 12) | (1 << 18) | (1 << 19) | (1 << 22) | (1 << 23) | (1 << 27) | (1 << 28) | (1 << 29);
    /** Codes that mean "this token will never work", not "try again". */
    private static final int[] FINAL_CODES = {4004, 4010, 4011, 4012, 4013, 4014};

    private final Context context;
    private volatile boolean running;
    private volatile boolean ready;
    private volatile String state = "Not connected";
    private volatile String userName = "";
    private volatile JSONObject presence;
    private volatile DiscordWebSocket socket;
    private Thread thread;
    /** How long to wait before the next attempt; a session that reaches READY starts it over. */
    private long backoff = 2_000;

    DiscordGateway(Context context) {
        this.context = context;
    }

    boolean isRunning() {
        Thread current = thread;
        return running && current != null && current.isAlive();
    }

    boolean isReady() {
        return ready;
    }

    /** "Connected", "Connecting", "Reconnecting" or "Not connected", for the settings page. */
    String state() {
        return state;
    }

    String userName() {
        return userName;
    }

    void start() {
        if (running) return;
        running = true;
        thread = new Thread(this::loop, "MorpheDiscordGateway");
        thread.setDaemon(true);
        thread.start();
    }

    /** Closing the session is what removes the activity from the Discord profile. */
    void stop() {
        running = false;
        ready = false;
        state = "Not connected";
        DiscordWebSocket current = socket;
        if (current != null) current.close();
    }

    void sendPresence(JSONObject desired) {
        presence = desired;
        DiscordWebSocket current = socket;
        if (!ready || current == null) return;
        try {
            current.sendText(presenceFrame(desired));
        } catch (Throwable failure) {
            Utils.log("Discord presence was not sent: " + failure);
        }
    }

    private void loop() {
        try {
            while (running) {
                if (!DiscordAuth.linked()) {
                    state = "Not connected";
                    break;
                }
                try {
                    String access = DiscordAuth.accessToken(context);
                    session(access);
                    if (!running) break;
                    state = "Reconnecting";
                    pause(backoff);
                    backoff = Math.min(backoff * 2, 30_000);
                } catch (Fatal fatal) {
                    Utils.log("Discord: " + fatal.getMessage());
                    state = "Not connected";
                    break;
                } catch (Throwable failure) {
                    Utils.log("Discord gateway: " + failure);
                    state = "Reconnecting";
                    pause(backoff);
                    backoff = Math.min(backoff * 2, 30_000);
                }
            }
        } finally {
            running = false;
            ready = false;
            socket = null;
            state = "Not connected";
        }
    }

    private void session(String access) throws Exception {
        DiscordWebSocket ws = DiscordWebSocket.open();
        socket = ws;
        ready = false;
        state = "Connecting";
        long interval = 0;
        long nextBeat = 0;
        try {
            while (running) {
                String text;
                try {
                    text = ws.readText(1000);
                } catch (DiscordWebSocket.Closed closed) {
                    if (isFinal(closed.code)) throw new Fatal(closed.getMessage());
                    return;
                }
                long now = System.currentTimeMillis();
                if (text != null && !text.isEmpty()) {
                    JSONObject message = new JSONObject(text);
                    int op = message.optInt("op", -1);
                    JSONObject data = message.optJSONObject("d");
                    if (op == 10) {
                        interval = data == null ? 41250L : data.optLong("heartbeat_interval", 41250L);
                        nextBeat = now + interval;
                        identify(ws, access);
                    } else if (op == 1) {
                        heartbeat(ws);
                    } else if (op == 7 || op == 9) {
                        // Discord asks for a fresh session; HELLO comes again on the next one.
                        return;
                    } else if (op == 0 && "READY".equals(message.optString("t"))) {
                        ready = true;
                        state = "Connected";
                        backoff = 2_000;
                        JSONObject user = data == null ? null : data.optJSONObject("user");
                        userName = user == null ? "" : user.optString("username", "");
                        Utils.log("Discord connected as " + userName);
                        push(ws);
                    }
                }
                if (interval > 0 && now >= nextBeat) {
                    heartbeat(ws);
                    nextBeat = now + interval;
                }
            }
        } finally {
            ready = false;
            socket = null;
            ws.close();
        }
    }

    private void identify(DiscordWebSocket ws, String access) throws Exception {
        JSONObject properties = new JSONObject();
        properties.put("os", "Android");
        properties.put("browser", "chess.com");
        properties.put("device", "Android");
        properties.put("browser_user_agent", DiscordApp.USER_AGENT);
        properties.put("browser_version", "1.0");
        properties.put("client_version", "1.0");
        properties.put("client_build_number", 1);
        properties.put("native_build_number", 1);
        properties.put("release_channel", "stable");

        JSONObject data = new JSONObject();
        data.put("token", "Bearer " + access);
        data.put("capabilities", CAPABILITIES);
        data.put("intents", INTENTS);
        data.put("properties", properties);
        ws.sendText(frame(2, data));
    }

    private void heartbeat(DiscordWebSocket ws) throws Exception {
        ws.sendText(frame(1, null));
    }

    private void push(DiscordWebSocket ws) throws Exception {
        JSONObject desired = presence;
        if (desired != null) ws.sendText(presenceFrame(desired));
    }

    private static String presenceFrame(JSONObject presence) throws Exception {
        return frame(3, presence);
    }

    private static String frame(int op, JSONObject data) throws Exception {
        JSONObject payload = new JSONObject();
        payload.put("op", op);
        payload.put("d", data);
        return payload.toString();
    }

    private static boolean isFinal(int code) {
        for (int finalCode : FINAL_CODES) if (finalCode == code) return true;
        return false;
    }

    /** Waits between attempts in short steps, so stopping the session does not wait it out. */
    private void pause(long millis) {
        long until = System.currentTimeMillis() + millis;
        while (running && System.currentTimeMillis() < until) {
            try {
                Thread.sleep(250);
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                return;
            }
        }
    }

    /** A connection Discord will not accept again without a new login. */
    private static final class Fatal extends Exception {
        Fatal(String message) {
            super(message);
        }
    }
}
