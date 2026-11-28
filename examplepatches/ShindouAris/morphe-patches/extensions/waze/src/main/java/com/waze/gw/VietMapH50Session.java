package com.waze.gw;

import java.io.IOException;
import java.io.ByteArrayOutputStream;
import java.nio.charset.Charset;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.LinkedHashMap;

/**
 * VietMap H50 protocol session.
 *
 * <p>The AES/frame implementation is injected so this class owns only the H50 state machine,
 * payload mapping and bounded/coalescing queue. Production wiring should provide an adapter around
 * {@code VietMapH50FrameCodec}; tests can use a deterministic codec without Android or crypto
 * dependencies.</p>
 */
final class VietMapH50Session implements HudProtocolSession {
    static final int CMD_SYNC_TIME = 0x01;
    static final int CMD_SPEED_LIMIT = 0x02;
    static final int CMD_ALERTS = 0x03;
    static final int CMD_ETA = 0x04;
    static final int CMD_LANES = 0x05;
    static final int CMD_TURN = 0x06;
    static final int CMD_IMAGE = 0x07;
    static final int CMD_LEFT_TYPE = 0x08;
    static final int CMD_QUERY_OBD_VERSION = 0x24;
    static final int CMD_QUERY_SERIAL = 0xFB;
    static final int CMD_QUERY_VERSION = 0xFC;

    static final long HANDSHAKE_TIMEOUT_MS = 5000L;
    private static final long STATE_REFRESH_MS = 1000L;
    private static final int MAX_CONTROL_QUEUE = 8;
    private static final int MAX_STATE_QUEUE = 8;
    private static final int MAX_CIPHERTEXT_BYTES = 4096;
    private static final Charset UTF8 = Charset.forName("UTF-8");

    /**
     * Narrow seam expected to be implemented by VietMapH50FrameCodec. encode() must return one
     * complete encrypted logical frame; the BLE transport may split it into GATT chunks later.
     */
    interface FrameCodec {
        byte[] encode(int command, byte[] payload, long unixSeconds) throws Exception;
        DecodedFrame decode(byte[] ciphertext) throws Exception;
        /** Returns the encrypted logical-frame length after decrypting only its first AES block. */
        int expectedCiphertextLength(byte[] firstBlock) throws Exception;
    }

    static final class DecodedFrame {
        final int command;
        final byte[] payload;

        DecodedFrame(int command, byte[] payload) {
            if (command < 0 || command > 0xFF) throw new IllegalArgumentException("command");
            this.command = command;
            this.payload = payload == null ? new byte[0] : Arrays.copyOf(payload, payload.length);
        }
    }

    private enum Phase {
        NEW, WAIT_SERIAL, WAIT_VERSION, WAIT_OBD_VERSION, READY, FAILED, STOPPED
    }

    private static final class Pending {
        final int command;
        final byte[] encrypted;
        final boolean control;

        Pending(int command, byte[] encrypted, boolean control) {
            this.command = command;
            this.encrypted = encrypted;
            this.control = control;
        }
    }

    private final HudTransport transport;
    private final HudSessionListener listener;
    private final FrameCodec codec;
    private final boolean runtimeEnabled;
    private final Object queueLock = new Object();
    private final ArrayDeque<Pending> controls = new ArrayDeque<Pending>();
    private final LinkedHashMap<Integer, Pending> states =
            new LinkedHashMap<Integer, Pending>();

    private volatile Phase phase = Phase.NEW;
    private volatile boolean stopped;
    private boolean errorReported;
    private boolean connectedReported;
    private boolean deadlineArmed;
    private long handshakeDeadline;
    private long lastSpeedAt = Long.MIN_VALUE;
    private long lastEtaAt = Long.MIN_VALUE;
    private long lastLaneAt = Long.MIN_VALUE;
    private long lastTurnAt = Long.MIN_VALUE;
    private String lastSpeedSignature = "";
    private String lastEtaSignature = "";
    private String lastLaneSignature = "";
    private String lastTurnSignature = "";
    private final ByteArrayOutputStream inboundCiphertext = new ByteArrayOutputStream();
    private int expectedInboundLength;

    VietMapH50Session(HudTransport transport, HudSessionListener listener, FrameCodec codec) {
        this(transport, listener, codec, HudFeatureFlags.h50RuntimeEnabled());
    }

    /** Package-private test/integration constructor; production must use the feature-gated one. */
    VietMapH50Session(HudTransport transport, HudSessionListener listener, FrameCodec codec,
                      boolean runtimeEnabled) {
        if (transport == null) throw new NullPointerException("transport");
        if (codec == null) throw new NullPointerException("codec");
        this.transport = transport;
        this.listener = listener;
        this.codec = codec;
        this.runtimeEnabled = runtimeEnabled;
    }

    @Override public synchronized void prepare() {
        if (stopped || phase == Phase.STOPPED) return;
    }

    @Override public synchronized void startHandshake() {
        if (stopped || phase == Phase.STOPPED || phase == Phase.FAILED) return;
        if (!runtimeEnabled) {
            phase = Phase.FAILED;
            reportError("FEATURE_DISABLED", "VietMap H50 runtime is disabled");
            return;
        }
        if (phase != Phase.NEW) return;
        phase = Phase.WAIT_SERIAL;
        deadlineArmed = false;
        if (!enqueueControl(CMD_QUERY_SERIAL, new byte[0])) {
            fail("QUEUE_FULL", "H50 serial query queue is full");
        }
    }

    @Override public void accept(byte[] bytes, int count) {
        if (stopped || bytes == null || count <= 0) return;
        int n = Math.min(count, bytes.length);
        if (n <= 0 || n > MAX_CIPHERTEXT_BYTES) {
            reportError("MALFORMED_FRAME", "H50 ciphertext length is out of range");
            return;
        }
        synchronized (this) {
            if (stopped || phase == Phase.STOPPED || phase == Phase.FAILED) return;
            if (inboundCiphertext.size() + n > MAX_CIPHERTEXT_BYTES) {
                inboundCiphertext.reset();
                expectedInboundLength = 0;
                reportError("MALFORMED_FRAME", "H50 reassembly exceeds maximum frame size");
                return;
            }
            inboundCiphertext.write(bytes, 0, n);
        }
        drainInboundFrames();
    }

    /**
     * BLE notifications can split one encrypted H50 frame. The first CBC block can be decrypted
     * independently (fresh IV) to obtain the declared total length; only a complete ciphertext is
     * handed to the full decoder. This also accepts multiple frames coalesced in one callback.
     */
    private void drainInboundFrames() {
        while (true) {
            final byte[] packet;
            synchronized (this) {
                if (stopped || phase == Phase.STOPPED || phase == Phase.FAILED) return;
                byte[] buffered = inboundCiphertext.toByteArray();
                if (expectedInboundLength == 0) {
                    if (buffered.length < 16) return;
                    try {
                        expectedInboundLength = codec.expectedCiphertextLength(
                                Arrays.copyOf(buffered, 16));
                    } catch (Throwable error) {
                        inboundCiphertext.reset();
                        reportError("MALFORMED_FRAME", message(error,
                                "H50 frame header decode failed"));
                        return;
                    }
                    if (expectedInboundLength < 16 || expectedInboundLength > MAX_CIPHERTEXT_BYTES
                            || (expectedInboundLength & 15) != 0) {
                        inboundCiphertext.reset();
                        expectedInboundLength = 0;
                        reportError("MALFORMED_FRAME", "H50 declared frame length is invalid");
                        return;
                    }
                }
                if (buffered.length < expectedInboundLength) return;
                packet = Arrays.copyOf(buffered, expectedInboundLength);
                inboundCiphertext.reset();
                if (buffered.length > expectedInboundLength) {
                    inboundCiphertext.write(buffered, expectedInboundLength,
                            buffered.length - expectedInboundLength);
                }
                expectedInboundLength = 0;
            }
            processInboundFrame(packet);
        }
    }

    private void processInboundFrame(byte[] packet) {
        final DecodedFrame frame;
        try {
            frame = codec.decode(packet);
        } catch (Throwable error) {
            reportError("MALFORMED_FRAME", message(error, "H50 frame decode failed"));
            return;
        }
        if (frame == null) {
            reportError("MALFORMED_FRAME", "H50 codec returned null frame");
            return;
        }
        synchronized (this) {
            if (stopped || phase == Phase.STOPPED || phase == Phase.FAILED) return;
            if (phase == Phase.WAIT_SERIAL) {
                if (frame.command != CMD_QUERY_SERIAL || !hasText(frame.payload)) {
                    fail("PROTOCOL_ERROR", "unexpected H50 serial response");
                    return;
                }
                phase = Phase.WAIT_VERSION;
                deadlineArmed = false;
                if (!enqueueControl(CMD_QUERY_VERSION, new byte[0]))
                    fail("QUEUE_FULL", "H50 version query queue is full");
                return;
            }
            if (phase == Phase.WAIT_VERSION) {
                if (frame.command != CMD_QUERY_VERSION || !hasVersionPayload(frame.payload)) {
                    fail("PROTOCOL_ERROR", "unexpected H50 version response");
                    return;
                }
                phase = Phase.WAIT_OBD_VERSION;
                deadlineArmed = false;
                if (!enqueueControl(CMD_QUERY_OBD_VERSION, new byte[0]))
                    fail("QUEUE_FULL", "H50 OBD version query queue is full");
                return;
            }
            if (phase == Phase.WAIT_OBD_VERSION) {
                if (frame.command != CMD_QUERY_OBD_VERSION || !hasText(frame.payload)) {
                    fail("PROTOCOL_ERROR", "unexpected H50 OBD response");
                    return;
                }
                // The 0x01 syncTime payload is not present in the recovered evidence. Keep it
                // empty; the frame timestamp is already a Unix timestamp and no unknown field is
                // invented here.
                if (!enqueueControl(CMD_SYNC_TIME, new byte[0])) {
                    fail("QUEUE_FULL", "H50 time sync queue is full");
                    return;
                }
                phase = Phase.READY;
                deadlineArmed = false;
                reportConnected();
                return;
            }
            if (phase == Phase.READY && listener != null) {
                listener.onSessionPeerActivity("h50_rx_0x" + hex(frame.command), nowForEvent());
            }
        }
    }

    @Override public void tick(long elapsedMs, HudCanonicalState state) {
        if (stopped || phase == Phase.STOPPED || phase == Phase.FAILED) return;
        long now = elapsedMs;
        synchronized (this) {
            if (phase == Phase.WAIT_SERIAL || phase == Phase.WAIT_VERSION
                    || phase == Phase.WAIT_OBD_VERSION) {
                if (!deadlineArmed) {
                    handshakeDeadline = now + HANDSHAKE_TIMEOUT_MS;
                    deadlineArmed = true;
                } else if (now >= handshakeDeadline) {
                    fail("HANDSHAKE_TIMEOUT", "H50 handshake timed out at " + phase.name());
                    return;
                }
            }
            if (phase == Phase.READY && state != null) scheduleState(now, state);
        }
        flushOne();
    }

    @Override public boolean isReady() { return phase == Phase.READY && !stopped; }

    @Override public String protocolName() { return "vietmap_h50"; }

    @Override public synchronized void stop() {
        stopped = true;
        phase = Phase.STOPPED;
        synchronized (queueLock) {
            controls.clear();
            states.clear();
        }
        inboundCiphertext.reset();
        expectedInboundLength = 0;
    }

    private void scheduleState(long now, HudCanonicalState state) {
        String speedSignature = state.limitKmh + "\u0000" + state.currentStreet;
        if (!speedSignature.equals(lastSpeedSignature)
                || lastSpeedAt == Long.MIN_VALUE || now - lastSpeedAt >= STATE_REFRESH_MS) {
            enqueueState(CMD_SPEED_LIMIT, buildSpeedLimitPayload(state), speedSignature);
            lastSpeedSignature = speedSignature;
            lastSpeedAt = now;
        }

        String etaSignature = state.remainingMeters + "|" + state.remainingMinutes + "|"
                + state.routeProgressPercent + "|" + state.navigating;
        if (!etaSignature.equals(lastEtaSignature)
                || lastEtaAt == Long.MIN_VALUE || now - lastEtaAt >= STATE_REFRESH_MS) {
            enqueueState(CMD_ETA, buildEtaPayload(state), etaSignature);
            lastEtaSignature = etaSignature;
            lastEtaAt = now;
        }

        String laneSignature = state.lanes == null ? "" : state.lanes.signature();
        if (!laneSignature.equals(lastLaneSignature) || lastLaneAt == Long.MIN_VALUE) {
            enqueueState(CMD_LANES, buildLanePayload(state), laneSignature);
            lastLaneSignature = laneSignature;
            lastLaneAt = now;
        }

        String turnSignature = state.turn + "|" + state.turnDistanceM + "|" + state.nextStreet
                + "|" + state.navigating;
        if (!turnSignature.equals(lastTurnSignature)
                || lastTurnAt == Long.MIN_VALUE || now - lastTurnAt >= STATE_REFRESH_MS) {
            enqueueState(CMD_TURN, buildTurnPayload(state), turnSignature);
            lastTurnSignature = turnSignature;
            lastTurnAt = now;
        }

        // 0x03 alert enums and 0x08 leftType have no verified Waze-to-H50 source mapping yet.
        // 0x07 image, OTA and OBD configuration are intentionally never queued.
    }

    private boolean enqueueControl(int command, byte[] payload) {
        Pending pending = encodePending(command, payload, true);
        if (pending == null) return false;
        synchronized (queueLock) {
            if (controls.size() >= MAX_CONTROL_QUEUE) return false;
            controls.addLast(pending);
            return true;
        }
    }

    private boolean enqueueState(int command, byte[] payload, String signature) {
        Pending pending = encodePending(command, payload, false);
        if (pending == null) return false;
        synchronized (queueLock) {
            if (!states.containsKey(command) && states.size() >= MAX_STATE_QUEUE) {
                reportError("QUEUE_FULL", "H50 state queue is full");
                return false;
            }
            // Signature is intentionally evaluated before encryption. A command key is enough to
            // coalesce because scheduleState only enqueues after its stable signature changes or
            // its one-second refresh interval expires.
            states.put(Integer.valueOf(command), pending);
            return true;
        }
    }

    private Pending encodePending(int command, byte[] payload, boolean control) {
        try {
            byte[] encoded = codec.encode(command, payload == null ? new byte[0] : payload,
                    System.currentTimeMillis() / 1000L);
            if (encoded == null || encoded.length == 0 || encoded.length > MAX_CIPHERTEXT_BYTES
                    || (encoded.length & 15) != 0) {
                reportError("ENCODE_ERROR", "H50 codec returned invalid ciphertext");
                return null;
            }
            return new Pending(command, encoded, control);
        } catch (Throwable error) {
            reportError("ENCODE_ERROR", message(error, "H50 frame encode failed"));
            return null;
        }
    }

    private void flushOne() {
        Pending pending;
        synchronized (queueLock) {
            pending = controls.peekFirst();
            if (pending == null) {
                for (int command : new int[]{CMD_TURN, CMD_LANES, CMD_ALERTS,
                        CMD_SPEED_LIMIT, CMD_ETA}) {
                    pending = states.get(Integer.valueOf(command));
                    if (pending != null) break;
                }
            }
            if (pending == null) return;
            if (!transport.isConnected()) return;
            if (pending.control) controls.removeFirst();
            else states.remove(Integer.valueOf(pending.command));
        }
        try {
            // pending.encrypted is one complete logical H50 frame. GATT chunking belongs to the
            // transport and must never happen before AES/frame construction.
            transport.sendFrame(pending.encrypted);
        } catch (IOException error) {
            fail("WRITE_FAILED", message(error, "H50 frame write failed"));
        } catch (RuntimeException error) {
            fail("WRITE_FAILED", message(error, "H50 frame write failed"));
        }
    }

    static byte[] buildSpeedLimitPayload(HudCanonicalState state) {
        if (state == null) return new byte[]{0, 0, 0, 1, 0};
        byte[] road = utf8Prefix(state.currentStreet, 255);
        byte[] payload = new byte[5 + road.length];
        payload[0] = (byte) clamp(state.limitKmh, 0, 255);
        // These two fields are deliberately zero: neither current speed nor minimum speed has a
        // verified H50 wire mapping.
        payload[1] = 0;
        payload[2] = 0;
        payload[3] = 1;
        payload[4] = (byte) road.length;
        System.arraycopy(road, 0, payload, 5, road.length);
        return payload;
    }

    static byte[] buildEtaPayload(HudCanonicalState state) {
        int distance = state == null ? 0 : clamp(state.remainingMeters, 0, 0xFFFFFF);
        int minutes = state == null ? 0 : Math.max(0, state.remainingMinutes);
        int hour = (minutes / 60) % 24;
        int minute = minutes % 60;
        int progress = state == null ? 0 : clamp(state.routeProgressPercent, 0, 255);
        return new byte[]{(byte) (distance >>> 16), (byte) (distance >>> 8), (byte) distance,
                (byte) hour, (byte) minute, (byte) progress};
    }

    static byte[] buildLanePayload(HudCanonicalState state) {
        byte[] payload = new byte[11];
        if (state == null || state.lanes == null || state.lanes.size() == 0) return payload;
        int count = Math.min(9, state.lanes.size());
        payload[0] = 1;
        payload[1] = (byte) count;
        int left = (9 - count) / 2;
        for (int lane = 0; lane < count; lane++) {
            payload[2 + left + lane] = (byte) h50LaneType(state.lanes, lane);
        }
        return payload;
    }

    static byte[] buildTurnPayload(HudCanonicalState state) {
        int maneuver = state == null ? 0 : mapManeuver(state.turn);
        int distance = state == null ? 0 : clamp(state.turnDistanceM, 0, 0xFFFFFF);
        String road = state == null ? "" : state.nextStreet;
        byte[] text = utf8Prefix(road, 255);
        byte[] payload = new byte[6 + text.length];
        payload[0] = (byte) maneuver;
        payload[1] = (byte) (distance >>> 16);
        payload[2] = (byte) (distance >>> 8);
        payload[3] = (byte) distance;
        payload[4] = 1;
        payload[5] = (byte) text.length;
        System.arraycopy(text, 0, payload, 6, text.length);
        return payload;
    }

    /** H50 maneuver enum values recovered from the Dart object pool. */
    static int mapManeuver(int hlpTurn) {
        switch (hlpTurn) {
            case 1:  return 0x25; // straight
            case 2:  return 0x1F; // turnLeft
            case 3:  return 0x20; // turnRight
            case 4:  return 0x23; // turnSlightLeft
            case 5:  return 0x24; // turnSlightRight
            case 6:  return 0x21; // turnSharpLeft
            case 7:  return 0x22; // turnSharpRight
            case 8:  return 0x27; // uturn
            case 10: return 0x1D; // roundaboutStraight fallback
            case 11: return 0x17; // roundaboutLeft
            case 12: return 0x18; // roundaboutRight
            case 13: return 0x08; // forkLeft
            case 14: return 0x09; // forkRight
            case 15: return 0x05; // endOfRoadLeft
            case 16: return 0x06; // endOfRoadRight
            case 17: return 0x01; // arrive
            case 20: return 0x1E; // roundaboutUturn
            case 19: return 0x1D; // roundaboutStraight
            default: return 0;
        }
    }

    private static int h50LaneType(Gateway.LaneSnapshot lanes, int lane) {
        int bits = 0;
        for (int angle = 0; angle < lanes.angleCount(lane); angle++) {
            bits |= HudLaneCodec.directionBit(lanes.angleAt(lane, angle));
        }
        boolean left = (bits & (HudLaneCodec.SLIGHT_LEFT | HudLaneCodec.LEFT
                | HudLaneCodec.SHARP_LEFT)) != 0;
        boolean right = (bits & (HudLaneCodec.SLIGHT_RIGHT | HudLaneCodec.RIGHT
                | HudLaneCodec.SHARP_RIGHT)) != 0;
        boolean straight = (bits & HudLaneCodec.STRAIGHT) != 0;
        boolean uturn = (bits & HudLaneCodec.U_TURN) != 0;
        if (straight && left && right && uturn) return 0x08;
        if (straight && left && uturn) return 0x09;
        if (straight && right && uturn) return 0x0B;
        if (straight && right) return 0x0A;
        if (straight && left && right) return 0x07;
        if (straight && left) return 0x06;
        if (straight && uturn) return 0x0C;
        if (straight) return 0x05;
        if (left && uturn) return 0x03;
        if (left && right) return 0x02;
        if (left) return 0x01;
        if (right) return 0x04;
        if (uturn) return 0x0E;
        return 0;
    }

    private void reportConnected() {
        if (connectedReported) return;
        connectedReported = true;
        if (listener != null) listener.onSessionConnected(transport.transportName(), 1);
    }

    private void fail(String category, String detail) {
        synchronized (this) {
            if (phase == Phase.FAILED || phase == Phase.STOPPED) return;
            phase = Phase.FAILED;
        }
        reportError(category, detail);
    }

    private void reportError(String category, String detail) {
        if (errorReported) return;
        errorReported = true;
        if (listener != null) listener.onSessionError(category,
                detail == null ? category : detail);
    }

    private static boolean hasText(byte[] payload) {
        if (payload == null || payload.length == 0) return false;
        for (byte value : payload) if (value == 0) return false;
        return true;
    }

    private static boolean hasVersionPayload(byte[] payload) {
        if (!hasText(payload)) return false;
        String text = new String(payload, UTF8);
        return text.indexOf(';') > 0;
    }

    private static byte[] utf8Prefix(String value, int maxBytes) {
        if (value == null || value.length() == 0 || maxBytes <= 0) return new byte[0];
        StringBuilder result = new StringBuilder();
        int used = 0;
        for (int offset = 0; offset < value.length();) {
            int codePoint = value.codePointAt(offset);
            String one = new String(Character.toChars(codePoint));
            byte[] encoded = one.getBytes(UTF8);
            if (used + encoded.length > maxBytes) break;
            result.append(one);
            used += encoded.length;
            offset += Character.charCount(codePoint);
        }
        return result.toString().getBytes(UTF8);
    }

    private static int clamp(int value, int low, int high) {
        return Math.max(low, Math.min(high, value));
    }

    private static String message(Throwable error, String fallback) {
        if (error == null || error.getMessage() == null || error.getMessage().length() == 0)
            return fallback;
        return error.getMessage();
    }

    private static String hex(int value) {
        final char[] digits = "0123456789abcdef".toCharArray();
        return new String(new char[]{digits[(value >>> 4) & 0x0F], digits[value & 0x0F]});
    }

    private long nowForEvent() {
        return System.currentTimeMillis();
    }
}
