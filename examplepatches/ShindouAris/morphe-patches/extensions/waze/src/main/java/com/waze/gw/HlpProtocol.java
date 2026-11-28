package com.waze.gw;

import android.content.Context;
import android.os.SystemClock;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/** Strict HLP parser, session negotiation and bounded writer for the HLP/1 adapter. */
final class HlpProtocol {
    static final int VERSION = 1;
    static final int DEFAULT_RATE = 8;
    static final int MAX_RATE = 10;
    static final int BLE_MAX_RATE = 4;
    private static final long PING_INTERVAL_MS = 5000L;
    private static final long PEER_TIMEOUT_MS = 20000L;
    static final Set<String> SUPPORTED_FIELDS;
    static {
        LinkedHashSet<String> fields = new LinkedHashSet<String>(Arrays.asList(
                "nav", "spd", "lim", "over", "trn", "trn2", "dst", "exit", "lan",
                "st", "st2", "eta", "rmin", "rm", "rkm", "avg", "avgL", "avgR", "avgP",
                "alr", "alrD", "alrV", "alrS", "alrM", "alrs", "min", "gap", "gapW"));
        SUPPORTED_FIELDS = Collections.unmodifiableSet(fields);
    }

    static final class DevRequest {
        final int rate;
        final boolean allFields;
        final LinkedHashSet<String> fields;
        final boolean speaksV1;

        DevRequest(int rate, boolean allFields, LinkedHashSet<String> fields, boolean speaksV1) {
            this.rate = Math.max(1, Math.min(MAX_RATE, rate));
            this.allFields = allFields;
            this.fields = fields;
            this.speaksV1 = speaksV1;
        }
    }

    static DevRequest parseDev(JSONObject message) throws JSONException {
        if (message.optInt("v", -1) != VERSION) throw new JSONException("unsupported v");
        if (!"dev".equals(message.optString("t", ""))) throw new JSONException("not dev");
        boolean speaksV1 = true;
        JSONArray protocols = message.optJSONArray("proto");
        if (protocols != null) {
            speaksV1 = false;
            for (int i = 0; i < protocols.length(); i++) if (protocols.optInt(i, -1) == VERSION) speaksV1 = true;
        }
        JSONObject want = message.optJSONObject("want");
        int rate = want == null ? DEFAULT_RATE : want.optInt("rate", DEFAULT_RATE);
        if (rate <= 0) rate = DEFAULT_RATE;
        boolean all = true;
        LinkedHashSet<String> fields = new LinkedHashSet<String>();
        if (want != null) {
            Object requested = want.opt("fields");
            if (requested instanceof JSONArray) {
                all = false;
                JSONArray array = (JSONArray) requested;
                for (int i = 0; i < array.length(); i++) {
                    String field = array.optString(i, "");
                    if ("*".equals(field)) all = true;
                    else if (SUPPORTED_FIELDS.contains(field)) fields.add(field);
                }
            } else if (requested instanceof String) {
                all = "*".equals(requested);
                if (!all && SUPPORTED_FIELDS.contains(requested)) fields.add((String) requested);
            }
        }
        return new DevRequest(rate, all, fields, speaksV1);
    }

    static String error(String code, String detail) {
        JSONObject result = new JSONObject();
        try {
            result.put("v", VERSION).put("t", "error").put("code", code);
            if (detail != null && detail.length() > 0) result.put("detail", detail);
        } catch (JSONException ignored) { }
        return result.toString();
    }

    static final class OutboundWriter implements AutoCloseable {
        interface Failure { void onWriteFailure(IOException error); }
        private final HudTransport transport;
        private final Failure failure;
        private final ArrayBlockingQueue<byte[]> control = new ArrayBlockingQueue<byte[]>(64);
        private final java.util.concurrent.ConcurrentHashMap<byte[], java.util.concurrent.CompletableFuture<Boolean>>
                completions = new java.util.concurrent.ConcurrentHashMap<>();

        boolean sendOta(String json) {
            byte[] frame;
            try { frame = HlpFrameCodec.encode(json); } catch (IOException e) { return false; }
            java.util.concurrent.CompletableFuture<Boolean> done = new java.util.concurrent.CompletableFuture<>();
            synchronized (this) {
                if (!running) return false;
                completions.put(frame, done);
                if (!control.offer(frame)) { completions.remove(frame); return false; }
            }
            try { return done.get(15, TimeUnit.SECONDS); }
            catch (Exception e) { close(); return false; }
        }
        private final AtomicReference<byte[]> importantState = new AtomicReference<byte[]>();
        private final AtomicReference<byte[]> latestState = new AtomicReference<byte[]>();
        private volatile boolean running;
        private Thread thread;
        private volatile long droppedStates;

        OutboundWriter(HudTransport transport, Failure failure) {
            this.transport = transport;
            this.failure = failure;
        }

        synchronized void start() {
            if (running) return;
            running = true;
            thread = new Thread(new Runnable() {
                @Override public void run() { loop(); }
            }, "hud-hlp-writer");
            thread.setDaemon(true);
            thread.start();
        }

        synchronized boolean offerControl(String json) {
            try { return control.offer(HlpFrameCodec.encode(json)); }
            catch (IOException e) { if (failure != null) failure.onWriteFailure(e); return false; }
        }

        synchronized boolean offerControls(List<String> jsonFrames) {
            if (!running || jsonFrames == null || jsonFrames.isEmpty()
                    || jsonFrames.size() > control.remainingCapacity()) return false;
            ArrayList<byte[]> encoded = new ArrayList<byte[]>(jsonFrames.size());
            try {
                for (String json : jsonFrames) encoded.add(HlpFrameCodec.encode(json));
            } catch (IOException error) {
                if (failure != null) failure.onWriteFailure(error);
                return false;
            }
            // Capacity was checked while holding this monitor, and every control producer uses a
            // synchronized method, so a transaction cannot be partially queued.
            for (byte[] frame : encoded) if (!control.offer(frame)) return false;
            return true;
        }

        boolean offerState(byte[] frame, boolean important) {
            if (!running || frame == null) return false;
            if (important) {
                byte[] previous = importantState.getAndSet(frame);
                if (previous != null) droppedStates++;
                return true;
            }
            byte[] previous = latestState.getAndSet(frame);
            if (previous != null) droppedStates++;
            return true;
        }

        long droppedStates() { return droppedStates; }

        private void loop() {
            try {
                while (running) {
                    byte[] frame = control.poll(100, TimeUnit.MILLISECONDS);
                    if (frame == null) frame = importantState.getAndSet(null);
                    if (frame == null) frame = latestState.getAndSet(null);
                    if (frame == null) continue;
                    transport.sendFrame(frame);
                    java.util.concurrent.CompletableFuture<Boolean> done = completions.remove(frame);
                    if (done != null) done.complete(true);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            } catch (IOException e) {
                if (running && failure != null) failure.onWriteFailure(e);
            } finally {
                running = false;
                for (java.util.concurrent.CompletableFuture<Boolean> done : completions.values()) done.complete(false);
                completions.clear();
            }
        }

        @Override public synchronized void close() {
            running = false;
            if (thread != null) thread.interrupt();
            control.clear();
            for (java.util.concurrent.CompletableFuture<Boolean> done : completions.values()) done.complete(false);
            completions.clear();
            importantState.set(null);
            latestState.set(null);
        }
    }

    /** Legacy nested name retained for HudConnectionManager source compatibility. */
    interface SessionListener extends HudSessionListener { }

    static final class Session implements HudConfigurableSession,
            HlpFrameCodec.Listener, OutboundWriter.Failure {
        private final Context context;
        private final HudTransport transport;
        private final HudSessionListener listener;
        private final HlpFrameCodec codec;
        private final CountDownLatch devReceived = new CountDownLatch(1);
        private final long sessionId = (SystemClock.elapsedRealtime() ^ (long) System.identityHashCode(this))
                & 0x7fffffffffffffffL;
        private final HudDeviceConfig.Assembler configAssembler =
                new HudDeviceConfig.Assembler(sessionId);
        private OutboundWriter writer;
        private final HudOta ota = new HudOta(this);
        boolean otaReady() { return isReady() && !legacy && transport.isConnected(); }
        boolean sendOta(String packet) { return otaReady() && writer.sendOta(packet); }
        private volatile boolean stopped;
        private volatile boolean hiSent;
        private volatile boolean handshakeStarted;
        private volatile int rate;
        private volatile long lastSent;
        private volatile long lastPingSent;
        private volatile long lastPeerActivity;
        private volatile long lastPongAt;
        private volatile String lastSignature = "";
        private volatile LinkedHashSet<String> acceptedFields = defaultFields();
        private volatile boolean legacy;
        private long nextConfigTransaction = 1L;
        private long pendingConfigTransaction;
        private long pendingConfigAt;
        private long pendingConfigRevision = -1L;
        private LinkedHashMap<String, Object> pendingConfigValues;

        Session(Context context, HudTransport transport, HudSessionListener listener) {
            this.context = context.getApplicationContext();
            this.transport = transport;
            this.listener = listener;
            this.codec = new HlpFrameCodec("usb".equals(transport.transportName()));
            this.rate = "ble".equals(transport.transportName())
                    ? BLE_MAX_RATE : DEFAULT_RATE;
        }

        @Override public void prepare() {
            if (writer == null) {
                HudDeviceConfig.beginSession(sessionId);
                ota.attached();
                writer = new OutboundWriter(transport, this);
            }
        }

        @Override public void startHandshake() {
            prepare();
            if (stopped || !transport.isConnected()) return;
            // Notifications can arrive during BLE setup. Retain negotiation/control frames, but
            // do not let the writer touch GATT until connect() has completed every setup operation.
            handshakeStarted = true;
            writer.start();
            try {
                devReceived.await(500, TimeUnit.MILLISECONDS);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
            if (!hiSent) {
                legacy = true;
                sendHi();
            }
            if (listener != null) listener.onSessionConnected(transport.transportName(), rate);
        }

        @Override public void accept(byte[] bytes, int count) {
            codec.accept(bytes, count, this);
        }

        void tick() {
            tickAt(SystemClock.elapsedRealtime(), HudCanonicalState.capture(context));
        }

        private volatile String lastAlertSignature = "";

        private void sendHi() {
            if (writer == null || stopped) return;
            JSONObject hi = new JSONObject();
            try {
                long wallMillis = System.currentTimeMillis();
                int timezoneMinutes = java.util.TimeZone.getDefault()
                        .getOffset(wallMillis) / 60000;
                hi.put("v", VERSION).put("t", "hi")
                        .put("app", "waze").put("name", "WazeHUD")
                        .put("appv", appVersion())
                        .put("sess", sessionId).put("proto", VERSION)
                        .put("unix", wallMillis / 1000L).put("tz", timezoneMinutes)
                        .put("rate", rate);
                JSONArray fields = new JSONArray();
                for (String field : acceptedFields) fields.put(field);
                if (legacy) hi.put("fields", "*");
                else hi.put("fields", fields);
                JSONArray caps = new JSONArray();
                if (acceptedFields.contains("spd")) caps.put("speed");
                if (acceptedFields.contains("lim")) caps.put("limit");
                if (acceptedFields.contains("trn")) caps.put("turn");
                if (acceptedFields.contains("lan")) caps.put("lanes");
                if (acceptedFields.contains("st")) caps.put("street");
                if (acceptedFields.contains("eta")) caps.put("eta");
                if (acceptedFields.contains("avg")) caps.put("avgzone");
                if (acceptedFields.contains("alr") || acceptedFields.contains("alrs"))
                    caps.put("alerts");
                caps.put("device_config");
                hi.put("caps", caps).put("transport", transport.transportName())
                        .put("maxFrame", HlpFrameCodec.MAX_FRAME_BYTES);
                String json = hi.toString();
                hiSent = writer.offerControl(json);
                if (hiSent) logPayload("TX", json);
            } catch (JSONException ignored) { }
        }

        @Override public void onFrame(String json) {
            logPayload("RX", json);
            try {
                JSONObject message = new JSONObject(json);
                String type = HlpMessageParser.type(message);
                if ("dev".equals(type)) {
                    DevRequest request = HlpMessageParser.parseDev(message);
                    if (!request.speaksV1) {
                        writer.offerControl(error("UNSUPPORTED_VERSION", "HLP/1 required"));
                        onSessionError("PROTOCOL_ERROR", "consumer does not support HLP/1");
                        return;
                    }
                    rate = "ble".equals(transport.transportName())
                            ? Math.min(request.rate, BLE_MAX_RATE) : request.rate;
                    acceptedFields = new LinkedHashSet<String>(
                            request.allFields ? SUPPORTED_FIELDS : request.fields);
                    // The full alert array is intentionally opt-in because it is the largest field.
                    if (!request.fields.contains("alrs")) acceptedFields.remove("alrs");
                    // Lane guidance is also opt-in: it changes less often but may contain many lanes.
                    if (!request.fields.contains("lan")) acceptedFields.remove("lan");
                    // Measured following gap is opt-in too: only firmware that names it receives it.
                    if (!request.fields.contains("gap")) acceptedFields.remove("gap");
                    if (!request.fields.contains("gapW")) acceptedFields.remove("gapW");
                    legacy = false;
                    ota.declared(json);
                    devReceived.countDown();
                    sendHi(); // Idempotent late negotiation.
                } else if ("ota_ack".equals(type)) {
                    ota.ack(json);
                } else if ("cfg_begin".equals(type)) {
                    configAssembler.begin(message);
                } else if ("cfg_item".equals(type)) {
                    configAssembler.item(message);
                } else if ("cfg_end".equals(type)) {
                    configAssembler.end(message);
                } else if ("cfg_ack".equals(type)) {
                    acceptConfigAck(message);
                } else if ("ping".equals(type)) {
                    String pong = "{\"v\":1,\"t\":\"pong\"}";
                    if (writer.offerControl(pong)) logPayload("TX", pong);
                } else if ("bye".equals(type)) {
                    if (listener != null) listener.onSessionWantsDisconnect();
                } else if ("pong".equals(type) || "hi".equals(type)
                        || "s".equals(type) || "error".equals(type)) {
                    // Valid peer messages that require no producer action.
                }
                lastPeerActivity = SystemClock.elapsedRealtime();
                if ("pong".equals(type)) lastPongAt = lastPeerActivity;
                if (listener != null) listener.onSessionPeerActivity(type, lastPeerActivity);
            } catch (JSONException e) {
                onSessionError("MALFORMED_JSON", e.getMessage());
            } catch (RuntimeException e) {
                onSessionError("PROTOCOL_ERROR", e.getMessage());
            }
        }

        @Override public void onMalformedUtf8() {
            onSessionError("MALFORMED_UTF8", "peer sent invalid UTF-8");
        }

        @Override public void onOversizedFrame() {
            onSessionError("FRAME_TOO_LARGE", "peer frame exceeds 512 bytes");
        }

        @Override public void onWriteFailure(IOException error) {
            if (listener != null) listener.onSessionError("WRITE_FAILED",
                    error == null ? "write failed" : error.getMessage());
        }

        @Override public void stop() {
            stopped = true;
            ota.disconnected();
            synchronized (this) { clearPendingConfig(); }
            if (writer != null) writer.close();
            HudDeviceConfig.endSession(sessionId);
        }

        @Override public synchronized boolean applyDeviceConfig(
                long revision, Map<String, Object> candidate) {
            if (stopped || writer == null || !transport.isConnected()
                    || pendingConfigTransaction != 0L) return false;
            HudDeviceConfig.Snapshot current = HudDeviceConfig.snapshot();
            if (current.schema == null || current.schema.revision != revision) return false;
            final LinkedHashMap<String, Object> values;
            try { values = HudDeviceConfig.validatedValues(current.schema, candidate); }
            catch (IllegalArgumentException error) {
                HudDeviceConfig.applyFailed(sessionId, error.getMessage());
                return false;
            }
            long tx = nextConfigTransaction++;
            ArrayList<String> frames = new ArrayList<String>(values.size() + 2);
            try {
                frames.add(new JSONObject().put("v", VERSION).put("t", "cfg_set_begin")
                        .put("tx", tx).put("rev", revision).put("count", values.size()).toString());
                for (Map.Entry<String, Object> entry : values.entrySet()) {
                    frames.add(new JSONObject().put("v", VERSION).put("t", "cfg_set")
                            .put("tx", tx).put("id", entry.getKey())
                            .put("value", entry.getValue()).toString());
                }
                frames.add(new JSONObject().put("v", VERSION).put("t", "cfg_set_commit")
                        .put("tx", tx).toString());
            } catch (JSONException error) {
                HudDeviceConfig.applyFailed(sessionId, I18n.tr("hud_link.couldnt_create_the_settings_package"));
                return false;
            }
            if (!writer.offerControls(frames)) {
                HudDeviceConfig.applyFailed(sessionId, I18n.tr("hud_link.the_send_queue_is_busy"));
                return false;
            }
            pendingConfigTransaction = tx;
            pendingConfigRevision = revision;
            pendingConfigValues = values;
            pendingConfigAt = SystemClock.elapsedRealtime();
            HudDeviceConfig.applying(sessionId);
            for (String frame : frames) logPayload("TX", frame);
            return true;
        }

        private synchronized void acceptConfigAck(JSONObject message) throws JSONException {
            long tx = message.getLong("tx");
            if (pendingConfigTransaction == 0L || tx != pendingConfigTransaction) return;
            boolean ok = message.optBoolean("ok", false);
            if (ok) {
                long revision = message.optLong("rev", pendingConfigRevision);
                LinkedHashMap<String, Object> applied = pendingConfigValues;
                clearPendingConfig();
                HudDeviceConfig.applied(sessionId, revision, applied);
            } else {
                String field = message.optString("field", "");
                String detail = message.optString("error", I18n.tr("hud_link.the_device_rejected_the_settings"));
                clearPendingConfig();
                HudDeviceConfig.applyFailed(sessionId,
                        field.length() == 0 ? detail : field + ": " + detail);
            }
        }

        private void clearPendingConfig() {
            pendingConfigTransaction = 0L;
            pendingConfigAt = 0L;
            pendingConfigRevision = -1L;
            pendingConfigValues = null;
        }

        boolean hasPeerActivity() { return lastPeerActivity > 0L; }
        long lastPongAt() { return lastPongAt; }

        @Override public boolean isReady() {
            return !stopped && handshakeStarted && hiSent && writer != null;
        }

        @Override public String protocolName() { return "hlp1"; }

        /** Legacy manager entry point; the new session boundary accepts an explicit snapshot. */
        @Override public void tick(long elapsedMs, HudCanonicalState state) {
            tickAt(elapsedMs, state == null ? HudCanonicalState.capture(context) : state);
        }

        private void tickAt(long now, HudCanonicalState snapshot) {
            if (stopped || writer == null || !transport.isConnected()) return;
            // Only peers proven to answer ping are subject to the watchdog. One-way/legacy HUDs
            // and older duplex firmware without pong support must remain usable.
            if (lastPongAt > 0L && now - lastPeerActivity >= PEER_TIMEOUT_MS) {
                stop();
                onSessionError("PEER_TIMEOUT", "HUD has not responded for 20 seconds");
                return;
            }
            if (now - lastPingSent >= PING_INTERVAL_MS) {
                String ping = "{\"v\":1,\"t\":\"ping\",\"ts\":" + now + "}";
                if (writer.offerControl(ping)) {
                    lastPingSent = now;
                    logPayload("TX", ping);
                }
            }
            synchronized (this) {
                if (pendingConfigTransaction != 0L && now - pendingConfigAt >= 10000L) {
                    clearPendingConfig();
                    HudDeviceConfig.applyFailed(sessionId, I18n.tr("hud_link.the_device_did_not_respond_to"));
                }
            }
            String signature = HlpStateEncoder.signature(snapshot, acceptedFields);
            long interval = Math.max(100L, 1000L / Math.max(1, rate));
            boolean due = now - lastSent >= interval;
            if (due && (!signature.equals(lastSignature) || now - lastSent >= 1000L)) {
                try {
                    byte[] frame = HlpStateEncoder.encode(snapshot, acceptedFields, now);
                    boolean important = !snapshot.alertSignature().equals(lastAlertSignature);
                    if (writer.offerState(frame, important)) logFrame("TX", frame);
                    lastSignature = signature;
                    lastAlertSignature = snapshot.alertSignature();
                    lastSent = now;
                } catch (IOException e) {
                    onWriteFailure(e);
                }
            }
        }

        private void onSessionError(String category, String detail) {
            if (listener != null) listener.onSessionError(category,
                    detail == null ? category : detail);
        }

        private static LinkedHashSet<String> defaultFields() {
            LinkedHashSet<String> result = new LinkedHashSet<String>(SUPPORTED_FIELDS);
            result.remove("alrs");
            result.remove("lan");
            result.remove("gap");
            result.remove("gapW");
            return result;
        }

        private String appVersion() {
            try {
                android.content.pm.PackageInfo info = context.getPackageManager()
                        .getPackageInfo(context.getPackageName(), 0);
                return info == null || info.versionName == null ? "" : info.versionName;
            } catch (Throwable ignored) {
                return "";
            }
        }

        private void logFrame(String direction, byte[] frame) {
            if (frame == null) return;
            int length = frame.length;
            if (length > 0 && frame[length - 1] == '\n') length--;
            logPayload(direction, new String(frame, 0, length, StandardCharsets.UTF_8));
        }

        private void logPayload(String direction, String payload) {
            if (!context.getSharedPreferences("waze_hud_gw", Context.MODE_PRIVATE)
                    .getBoolean("hud_link_log", false)) return;
            String safe = payload == null ? "" : payload;
            if (safe.length() > 768) safe = safe.substring(0, 768) + "…";
            Log.d("WazeHudLink", direction + " " + safe);
        }
    }
}

/**
 * Source-compatibility view for older package-local tests.
 * Canonical capture/encoding now lives in HudCanonicalState/HlpStateEncoder.
 */
@Deprecated
final class HudStateSnapshot {
    final int speedKmh;
    final int limitKmh;
    final int overMargin;
    final boolean navigating;
    final int turn;
    final int nextTurn;
    final int turnDistance;
    final int exit;
    final Gateway.LaneSnapshot lanes;
    final String currentStreet;
    final String nextStreet;
    final String eta;
    final int remainingMinutes;
    final int remainingMeters;
    final boolean averageZone;
    final int averageLeft;
    final int recommendedSpeed;
    final int averagePercent;
    final List<String> alerts;
    private final HudCanonicalState canonical;

    private HudStateSnapshot(HudCanonicalState canonical) {
        this.canonical = canonical;
        this.speedKmh = canonical.speedKmh;
        this.limitKmh = canonical.limitKmh;
        this.overMargin = canonical.overMargin;
        this.navigating = canonical.navigating;
        this.turn = canonical.turn;
        this.nextTurn = canonical.nextTurn;
        this.turnDistance = canonical.turnDistanceM;
        this.exit = canonical.exitNumber;
        this.lanes = canonical.lanes;
        this.currentStreet = canonical.currentStreet;
        this.nextStreet = canonical.nextStreet;
        this.eta = canonical.etaClock;
        this.remainingMinutes = canonical.remainingMinutes;
        this.remainingMeters = canonical.remainingMeters;
        this.averageZone = canonical.averageZone;
        this.averageLeft = canonical.averageLeftM;
        this.recommendedSpeed = canonical.recommendedSpeedKmh;
        this.averagePercent = canonical.averagePercent;
        ArrayList<String> rows = new ArrayList<String>();
        for (HudCanonicalAlert alert : canonical.alerts) rows.add(alert.rawRow);
        this.alerts = Collections.unmodifiableList(rows);
    }

    static HudStateSnapshot capture(Context context) {
        return new HudStateSnapshot(HudCanonicalState.capture(context));
    }

    static int toKmhForTest(int value, String units) {
        return HudCanonicalState.toKmhForTest(value, units);
    }

    static int turnCode(int ordinal) { return HudTurnCodec.encode(ordinal); }

    String alertSignature() { return canonical.alertSignature(); }

    String signature(Set<String> fields) { return HlpStateEncoder.signature(canonical, fields); }

    byte[] encode(Set<String> requested, long ts) throws IOException {
        return HlpStateEncoder.encode(canonical, requested, ts);
    }
}
