package com.waze.gw;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**
 * Offline/transport-independent VietMap H50 codec.
 *
 * <p>A logical frame is padded and encrypted as one unit.  The cipher and IV are recreated for
 * every call intentionally: CBC chaining never crosses an H50 packet or a BLE write boundary.</p>
 */
final class VietMapH50FrameCodec {
    static final int COMMAND_SYNC_TIME = 0x01;
    static final int COMMAND_SPEED_TWO = 0x02;
    static final int COMMAND_UPCOMING_ALERT = 0x03;
    static final int COMMAND_NAVIGATION_ETA = 0x04;
    static final int COMMAND_LANE_INFO = 0x05;
    static final int COMMAND_NAVIGATION_INFO = 0x06;
    static final int COMMAND_IMAGE = 0x07;
    static final int COMMAND_LEFT_TYPE = 0x08;
    static final int COMMAND_QUERY_OBD = 0x24;
    static final int COMMAND_QUERY_SERIAL = 0xFB;
    static final int COMMAND_QUERY_VERSION = 0xFC;
    static final int BLOCK_BYTES = 16;
    static final int MAX_U24 = 0xFFFFFF;
    static final byte[] MAGIC = new byte[]{(byte) 0xA6, (byte) 0x6A};
    static final byte[] FOOTER = new byte[]{(byte) 0x0D, (byte) 0x0A};
    static final String AES_KEY_TEXT = "Walkiz52832iLock";
    static final String AES_IV_TEXT = "1234567890ABCDEF";
    private static final byte[] AES_KEY = AES_KEY_TEXT.getBytes(StandardCharsets.US_ASCII);
    private static final byte[] AES_IV = AES_IV_TEXT.getBytes(StandardCharsets.US_ASCII);

    private VietMapH50FrameCodec() { }

    static final class H50Frame {
        final long timestamp;
        final int declaredLength;
        final int command;
        final byte[] payload;
        final int paddingLength;

        H50Frame(long timestamp, int declaredLength, int command,
                 byte[] payload, int paddingLength) {
            this.timestamp = timestamp;
            this.declaredLength = declaredLength;
            this.command = command;
            this.payload = payload.clone();
            this.paddingLength = paddingLength;
        }

        String commandName() { return VietMapH50FrameCodec.commandName(command); }

        byte[] payloadCopy() { return payload.clone(); }
    }

    static final class AlertRecord {
        final int type;
        final int distanceM;
        final int auxiliary;

        AlertRecord(int type, int distanceM, int auxiliary) {
            requireByte(type, "alert type");
            requireU24(distanceM, "alert distance");
            requireByte(auxiliary, "alert auxiliary");
            this.type = type;
            this.distanceM = distanceM;
            this.auxiliary = auxiliary;
        }
    }

    static final class SpeedTwoPayload {
        final int currentLimitKmh;
        final int secondaryField1;
        final int secondaryField2;
        final int textFlag;
        final String currentRoadName;

        SpeedTwoPayload(int currentLimitKmh, int secondaryField1, int secondaryField2,
                        int textFlag, String currentRoadName) {
            this.currentLimitKmh = currentLimitKmh;
            this.secondaryField1 = secondaryField1;
            this.secondaryField2 = secondaryField2;
            this.textFlag = textFlag;
            this.currentRoadName = currentRoadName;
        }
    }

    static final class UpcomingAlertPayload {
        final AlertRecord first;
        final AlertRecord second;

        UpcomingAlertPayload(AlertRecord first, AlertRecord second) {
            this.first = first;
            this.second = second;
        }
    }

    static final class NavigationEtaPayload {
        final int remainingDistanceM;
        final int etaHour;
        final int etaMinute;
        final int progress;

        NavigationEtaPayload(int remainingDistanceM, int etaHour, int etaMinute, int progress) {
            this.remainingDistanceM = remainingDistanceM;
            this.etaHour = etaHour;
            this.etaMinute = etaMinute;
            this.progress = progress;
        }
    }

    static final class LaneInfoPayload {
        final boolean visible;
        final int laneCount;
        final byte[] laneSlots;

        LaneInfoPayload(boolean visible, int laneCount, byte[] laneSlots) {
            this.visible = visible;
            this.laneCount = laneCount;
            this.laneSlots = laneSlots.clone();
        }

        byte[] laneSlotsCopy() { return laneSlots.clone(); }
    }

    static final class NavigationInfoPayload {
        final int maneuver;
        final int distanceM;
        final int textFlag;
        final String roadName;

        NavigationInfoPayload(int maneuver, int distanceM, int textFlag, String roadName) {
            this.maneuver = maneuver;
            this.distanceM = distanceM;
            this.textFlag = textFlag;
            this.roadName = roadName;
        }
    }

    static byte[] encodeFrame(int command, byte[] payload, long timestamp) {
        requireByte(command, "command");
        byte[] body = payload == null ? new byte[0] : payload;
        long logicalLength = 11L + body.length;
        long paddedLength = (logicalLength + 15L) & ~15L;
        if (paddedLength > 0xFFFFL) throw new IllegalArgumentException("H50 frame exceeds u16 length");
        if (timestamp < 0L || timestamp > 0xFFFFFFFFL)
            throw new IllegalArgumentException("timestamp must fit u32");

        byte[] frame = new byte[(int) paddedLength];
        System.arraycopy(MAGIC, 0, frame, 0, MAGIC.length);
        putU32(frame, 2, timestamp);
        putU16(frame, 6, (int) paddedLength);
        frame[8] = (byte) command;
        System.arraycopy(body, 0, frame, 9, body.length);
        frame[9 + body.length] = FOOTER[0];
        frame[10 + body.length] = FOOTER[1];
        return frame;
    }

    static byte[] encodeFrame(int command, byte[] payload) {
        return encodeFrame(command, payload, System.currentTimeMillis() / 1000L);
    }

    static byte[] encryptFrame(byte[] plaintext) {
        requireCipherFrame(plaintext, "plaintext");
        return crypt(Cipher.ENCRYPT_MODE, plaintext);
    }

    static byte[] decryptFrame(byte[] ciphertext) {
        requireCipherFrame(ciphertext, "ciphertext");
        return crypt(Cipher.DECRYPT_MODE, ciphertext);
    }

    static byte[] encodeEncryptedFrame(int command, byte[] payload, long timestamp) {
        return encryptFrame(encodeFrame(command, payload, timestamp));
    }

    static byte[] encodeEncryptedFrame(int command, byte[] payload) {
        return encryptFrame(encodeFrame(command, payload));
    }

    static H50Frame decodeEncryptedFrame(byte[] ciphertext) {
        return decodeFrame(decryptFrame(ciphertext));
    }

    static H50Frame decodeFrame(byte[] data) {
        if (data == null || data.length < BLOCK_BYTES)
            throw new IllegalArgumentException("H50 frame is shorter than one block");
        if (data.length % BLOCK_BYTES != 0)
            throw new IllegalArgumentException("H50 frame is not block aligned");
        if (data[0] != MAGIC[0] || data[1] != MAGIC[1])
            throw new IllegalArgumentException("invalid H50 magic");
        int declaredLength = u16(data, 6);
        if (declaredLength != data.length)
            throw new IllegalArgumentException("declared H50 length does not match data");

        int bodyStart = 9;
        int end = data.length - bodyStart;
        while (end > 0 && data[bodyStart + end - 1] == 0) end--;
        if (end < 2 || data[bodyStart + end - 2] != FOOTER[0]
                || data[bodyStart + end - 1] != FOOTER[1]) {
            throw new IllegalArgumentException("missing H50 footer before zero padding");
        }
        int payloadLength = end - 2;
        return new H50Frame(u32(data, 2), declaredLength, data[8] & 0xFF,
                Arrays.copyOfRange(data, bodyStart, bodyStart + payloadLength),
                data.length - bodyStart - end);
    }

    static String commandName(int command) {
        switch (command & 0xFF) {
            case COMMAND_SYNC_TIME: return "syncTime";
            case COMMAND_SPEED_TWO: return "sendSpeedTwo";
            case COMMAND_UPCOMING_ALERT: return "upComingAlert";
            case COMMAND_NAVIGATION_ETA: return "estNavigationInfo";
            case COMMAND_LANE_INFO: return "sendLaneInfo";
            case COMMAND_NAVIGATION_INFO: return "navigationInfo";
            case COMMAND_IMAGE: return "sendImage";
            case COMMAND_LEFT_TYPE: return "leftType";
            case COMMAND_QUERY_OBD: return "queryOBDVersion";
            case COMMAND_QUERY_SERIAL: return "querySerial";
            case COMMAND_QUERY_VERSION: return "queryVersion";
            default: return String.format(java.util.Locale.US, "unknown_0x%02x", command & 0xFF);
        }
    }

    static byte[] buildSyncTimeFrame(long unixSeconds) {
        // The recovered builder carries the clock in the common frame timestamp; the command
        // payload itself has no confirmed fields.
        return encodeFrame(COMMAND_SYNC_TIME, null, unixSeconds);
    }

    static byte[] buildSpeedTwoPayload(int currentLimitKmh, int secondaryField1,
                                       int secondaryField2, String currentRoadName) {
        requireByte(currentLimitKmh, "current limit");
        requireByte(secondaryField1, "secondary field 1");
        requireByte(secondaryField2, "secondary field 2");
        byte[] road = utf8(currentRoadName == null ? "" : currentRoadName);
        requireByte(road.length, "road name length");
        ByteArrayOutputStream out = new ByteArrayOutputStream(5 + road.length);
        out.write(currentLimitKmh);
        out.write(secondaryField1);
        out.write(secondaryField2);
        out.write(1);
        out.write(road.length);
        out.write(road, 0, road.length);
        return out.toByteArray();
    }

    static SpeedTwoPayload parseSpeedTwoPayload(byte[] payload) {
        requireAtLeast(payload, 5, COMMAND_SPEED_TWO);
        int length = payload[4] & 0xFF;
        if (5 + length > payload.length) throw new IllegalArgumentException("truncated road name");
        return new SpeedTwoPayload(payload[0] & 0xFF, payload[1] & 0xFF,
                payload[2] & 0xFF, payload[3] & 0xFF,
                new String(payload, 5, length, StandardCharsets.UTF_8));
    }

    static byte[] buildUpcomingAlertPayload(AlertRecord first, AlertRecord second) {
        AlertRecord a = first == null ? new AlertRecord(0, 0, 0) : first;
        AlertRecord b = second == null ? new AlertRecord(0, 0, 0) : second;
        byte[] payload = new byte[10];
        putAlert(payload, 0, a);
        putAlert(payload, 5, b);
        return payload;
    }

    static UpcomingAlertPayload parseUpcomingAlertPayload(byte[] payload) {
        requireExact(payload, 10, COMMAND_UPCOMING_ALERT);
        return new UpcomingAlertPayload(parseAlert(payload, 0), parseAlert(payload, 5));
    }

    static byte[] buildNavigationEtaPayload(int remainingDistanceM, int etaHour,
                                            int etaMinute, int progress) {
        requireU24(remainingDistanceM, "remaining distance");
        requireByte(etaHour, "ETA hour");
        requireByte(etaMinute, "ETA minute");
        requireByte(progress, "progress");
        byte[] payload = new byte[6];
        putU24(payload, 0, remainingDistanceM);
        payload[3] = (byte) etaHour;
        payload[4] = (byte) etaMinute;
        payload[5] = (byte) progress;
        return payload;
    }

    static NavigationEtaPayload parseNavigationEtaPayload(byte[] payload) {
        requireExact(payload, 6, COMMAND_NAVIGATION_ETA);
        return new NavigationEtaPayload(u24(payload, 0), payload[3] & 0xFF,
                payload[4] & 0xFF, payload[5] & 0xFF);
    }

    static byte[] buildLaneInfoPayload(byte[] lanes) {
        byte[] source = lanes == null ? new byte[0] : lanes;
        if (source.length > 9) throw new IllegalArgumentException("H50 supports at most 9 lanes");
        byte[] payload = new byte[11];
        payload[0] = (byte) (source.length == 0 ? 0 : 1);
        payload[1] = (byte) source.length;
        int left = (9 - source.length) / 2;
        System.arraycopy(source, 0, payload, 2 + left, source.length);
        return payload;
    }

    static LaneInfoPayload parseLaneInfoPayload(byte[] payload) {
        requireAtLeast(payload, 11, COMMAND_LANE_INFO);
        return new LaneInfoPayload(payload[0] != 0, payload[1] & 0xFF,
                Arrays.copyOfRange(payload, 2, 11));
    }

    static byte[] buildNavigationInfoPayload(int maneuver, int distanceM, String roadName) {
        requireByte(maneuver, "maneuver");
        requireU24(distanceM, "turn distance");
        byte[] road = utf8(roadName == null ? "" : roadName);
        requireByte(road.length, "road name length");
        byte[] payload = new byte[6 + road.length];
        payload[0] = (byte) maneuver;
        putU24(payload, 1, distanceM);
        payload[4] = 1;
        payload[5] = (byte) road.length;
        System.arraycopy(road, 0, payload, 6, road.length);
        return payload;
    }

    static NavigationInfoPayload parseNavigationInfoPayload(byte[] payload) {
        requireAtLeast(payload, 6, COMMAND_NAVIGATION_INFO);
        int length = payload[5] & 0xFF;
        if (6 + length > payload.length) throw new IllegalArgumentException("truncated road name");
        return new NavigationInfoPayload(payload[0] & 0xFF, u24(payload, 1), payload[4] & 0xFF,
                new String(payload, 6, length, StandardCharsets.UTF_8));
    }

    static byte[] buildLeftTypePayload(int leftType) {
        requireByte(leftType, "left type");
        return new byte[]{(byte) leftType};
    }

    static int parseLeftTypePayload(byte[] payload) {
        requireAtLeast(payload, 1, COMMAND_LEFT_TYPE);
        return payload[0] & 0xFF;
    }

    static byte[] buildQueryFrame(int command, long timestamp) {
        if (command != COMMAND_QUERY_SERIAL && command != COMMAND_QUERY_VERSION
                && command != COMMAND_QUERY_OBD) {
            throw new IllegalArgumentException("not an H50 query command");
        }
        return encodeEncryptedFrame(command, null, timestamp);
    }

    static byte[] buildSerialQueryFrame(long timestamp) {
        return buildQueryFrame(COMMAND_QUERY_SERIAL, timestamp);
    }

    static byte[] buildVersionQueryFrame(long timestamp) {
        return buildQueryFrame(COMMAND_QUERY_VERSION, timestamp);
    }

    static byte[] buildObdQueryFrame(long timestamp) {
        return buildQueryFrame(COMMAND_QUERY_OBD, timestamp);
    }

    static byte[] buildQueryResponsePayload(String value) {
        return utf8(value == null ? "" : value);
    }

    static String parseQueryResponsePayload(int command, byte[] payload) {
        if (command != COMMAND_QUERY_SERIAL && command != COMMAND_QUERY_VERSION
                && command != COMMAND_QUERY_OBD) {
            throw new IllegalArgumentException("not an H50 query command");
        }
        return new String(payload == null ? new byte[0] : payload, StandardCharsets.UTF_8);
    }

    private static byte[] crypt(int mode, byte[] input) {
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
            // New specs and Cipher instances on every call enforce a fresh IV per logical frame.
            cipher.init(mode, new SecretKeySpec(AES_KEY, "AES"), new IvParameterSpec(AES_IV));
            return cipher.doFinal(input);
        } catch (GeneralSecurityException e) {
            throw new IllegalArgumentException("H50 AES operation failed", e);
        }
    }

    private static void putAlert(byte[] target, int offset, AlertRecord value) {
        target[offset] = (byte) value.type;
        putU24(target, offset + 1, value.distanceM);
        target[offset + 4] = (byte) value.auxiliary;
    }

    private static AlertRecord parseAlert(byte[] payload, int offset) {
        return new AlertRecord(payload[offset] & 0xFF, u24(payload, offset + 1),
                payload[offset + 4] & 0xFF);
    }

    private static byte[] utf8(String value) { return value.getBytes(StandardCharsets.UTF_8); }

    private static void requireCipherFrame(byte[] data, String label) {
        if (data == null || data.length == 0 || data.length % BLOCK_BYTES != 0)
            throw new IllegalArgumentException("H50 " + label + " must be non-empty and block aligned");
    }

    private static void requireAtLeast(byte[] payload, int length, int command) {
        if (payload == null || payload.length < length)
            throw new IllegalArgumentException(commandName(command) + " payload is too short");
    }

    private static void requireExact(byte[] payload, int length, int command) {
        if (payload == null || payload.length != length)
            throw new IllegalArgumentException(commandName(command) + " payload length mismatch");
    }

    private static void requireByte(int value, String label) {
        if (value < 0 || value > 0xFF) throw new IllegalArgumentException(label + " must fit u8");
    }

    private static void requireU24(int value, String label) {
        if (value < 0 || value > MAX_U24) throw new IllegalArgumentException(label + " must fit u24");
    }

    private static int u16(byte[] value, int offset) {
        return ((value[offset] & 0xFF) << 8) | (value[offset + 1] & 0xFF);
    }

    private static long u32(byte[] value, int offset) {
        return ((long) (value[offset] & 0xFF) << 24)
                | ((long) (value[offset + 1] & 0xFF) << 16)
                | ((long) (value[offset + 2] & 0xFF) << 8)
                | (long) (value[offset + 3] & 0xFF);
    }

    private static int u24(byte[] value, int offset) {
        return ((value[offset] & 0xFF) << 16)
                | ((value[offset + 1] & 0xFF) << 8)
                | (value[offset + 2] & 0xFF);
    }

    private static void putU16(byte[] target, int offset, int value) {
        target[offset] = (byte) (value >>> 8);
        target[offset + 1] = (byte) value;
    }

    private static void putU24(byte[] target, int offset, int value) {
        target[offset] = (byte) (value >>> 16);
        target[offset + 1] = (byte) (value >>> 8);
        target[offset + 2] = (byte) value;
    }

    private static void putU32(byte[] target, int offset, long value) {
        target[offset] = (byte) (value >>> 24);
        target[offset + 1] = (byte) (value >>> 16);
        target[offset + 2] = (byte) (value >>> 8);
        target[offset + 3] = (byte) value;
    }
}
