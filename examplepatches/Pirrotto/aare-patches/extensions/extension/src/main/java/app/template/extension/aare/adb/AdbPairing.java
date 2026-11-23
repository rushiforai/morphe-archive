package app.template.extension.aare.adb;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.Mac;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.SSLSocket;

/**
 * Pairs AARE with the phone's wireless debugging, as "adb pair" does with the six-digit code
 * shown under Wireless debugging > Pair device with pairing code.
 *
 * Protocol of AOSP's adb/pairing_connection (TLS 1.3, then SPAKE2 on the code and the TLS exported
 * key, then the public keys exchanged under AES-128-GCM). Adapted from libadb-android
 * (GPL-3.0-or-later / Apache-2.0) and Shizuku (Apache-2.0); SPAKE2 is our own {@link Spake2}.
 */
final class AdbPairing {
    private static final String EXPORTED_KEY_LABEL = "adb-label\u0000";
    private static final int EXPORTED_KEY_SIZE = 64;
    private static final byte[] CLIENT_NAME = "adb pair client\u0000".getBytes(StandardCharsets.UTF_8);
    private static final byte[] SERVER_NAME = "adb pair server\u0000".getBytes(StandardCharsets.UTF_8);
    private static final byte[] HKDF_INFO = "adb pairing_auth aes-128-gcm key".getBytes(StandardCharsets.UTF_8);

    private static final byte HEADER_VERSION = 1;
    private static final int HEADER_SIZE = 6;
    private static final byte TYPE_SPAKE2_MSG = 0;
    private static final byte TYPE_PEER_INFO = 1;
    private static final int PEER_INFO_SIZE = 1 << 13;
    private static final int MAX_PAYLOAD = 2 * PEER_INFO_SIZE;

    /** The code was wrong: SPAKE2 gave the two sides different keys. */
    static final class WrongCodeException extends IOException {
        WrongCodeException() {
            super("wrong pairing code");
        }
    }

    private AdbPairing() {
    }

    static void pair(AdbKey key, String host, int port, String code, String deviceName) throws Exception {
        String stage = "connect";
        try (Socket plain = new Socket()) {
            plain.connect(new InetSocketAddress(host, port), 10_000);
            plain.setTcpNoDelay(true);
            plain.setSoTimeout(30_000);
            stage = "tls";
            try (SSLSocket tls = (SSLSocket) key.sslContext().getSocketFactory().createSocket(plain, host, port, true)) {
                tls.startHandshake();
                DataInputStream in = new DataInputStream(tls.getInputStream());
                DataOutputStream out = new DataOutputStream(tls.getOutputStream());

                // The password binds the code to this very TLS session.
                stage = "export";
                byte[] material = exportKeyingMaterial(tls);
                byte[] codeBytes = code.getBytes(StandardCharsets.UTF_8);
                byte[] password = new byte[codeBytes.length + material.length];
                System.arraycopy(codeBytes, 0, password, 0, codeBytes.length);
                System.arraycopy(material, 0, password, codeBytes.length, material.length);

                stage = "spake2";
                Spake2 spake = new Spake2(true, CLIENT_NAME, SERVER_NAME);
                byte[] ourMsg = spake.generateMessage(password);
                Arrays.fill(password, (byte) 0);
                writePacket(out, TYPE_SPAKE2_MSG, ourMsg);
                byte[] theirMsg = readPacket(in, TYPE_SPAKE2_MSG);
                byte[] keyMaterial = spake.processMessage(theirMsg);
                spake.destroy();
                if (keyMaterial == null) throw new IOException("adbd's SPAKE2 message isn't a curve point");
                byte[] aesKey = hkdfSha256(keyMaterial, HKDF_INFO, 16);

                // Our public key goes to adbd, which stores it like an authorized computer.
                stage = "peer info";
                ByteBuffer info = ByteBuffer.allocate(PEER_INFO_SIZE).order(ByteOrder.BIG_ENDIAN);
                info.put((byte) 0 /* ADB_RSA_PUB_KEY */);
                byte[] pub = key.adbPublicKey(deviceName);
                info.put(pub, 0, Math.min(pub.length, PEER_INFO_SIZE - 1));
                writePacket(out, TYPE_PEER_INFO, gcm(true, aesKey, 0, info.array()));

                byte[] theirInfo;
                try {
                    theirInfo = gcm(false, aesKey, 0, readPacket(in, TYPE_PEER_INFO));
                } catch (javax.crypto.AEADBadTagException | java.io.EOFException e) {
                    // Different keys on the two sides: the code was wrong.
                    throw new WrongCodeException();
                }
                if (theirInfo.length != PEER_INFO_SIZE) throw new IOException("unexpected peer info size " + theirInfo.length);
            }
        } catch (WrongCodeException e) {
            throw e;
        } catch (IOException e) {
            throw new IOException(stage + ": " + e.getMessage(), e);
        }
    }

    /** RFC 5705 keying material of the TLS session (public since Android 10, Conscrypt before). */
    private static byte[] exportKeyingMaterial(SSLSocket socket) throws Exception {
        try {
            Class<?> sockets = Class.forName("android.net.ssl.SSLSockets");
            Method export = sockets.getMethod("exportKeyingMaterial", SSLSocket.class, String.class, byte[].class, int.class);
            return (byte[]) export.invoke(null, socket, EXPORTED_KEY_LABEL, null, EXPORTED_KEY_SIZE);
        } catch (ReflectiveOperationException e) {
            Class<?> conscrypt = Class.forName("com.android.org.conscrypt.Conscrypt");
            Method export = conscrypt.getMethod("exportKeyingMaterial", SSLSocket.class, String.class, byte[].class, int.class);
            return (byte[]) export.invoke(null, socket, EXPORTED_KEY_LABEL, null, EXPORTED_KEY_SIZE);
        }
    }

    private static void writePacket(DataOutputStream out, byte type, byte[] payload) throws IOException {
        ByteBuffer header = ByteBuffer.allocate(HEADER_SIZE).order(ByteOrder.BIG_ENDIAN);
        header.put(HEADER_VERSION).put(type).putInt(payload.length);
        out.write(header.array());
        out.write(payload);
        out.flush();
    }

    private static byte[] readPacket(DataInputStream in, byte expectedType) throws IOException {
        byte[] raw = new byte[HEADER_SIZE];
        in.readFully(raw);
        ByteBuffer header = ByteBuffer.wrap(raw).order(ByteOrder.BIG_ENDIAN);
        byte version = header.get();
        byte type = header.get();
        int size = header.getInt();
        if (version != HEADER_VERSION) throw new IOException("pairing header version " + version);
        if (type != expectedType) throw new IOException("unexpected pairing packet " + type);
        if (size <= 0 || size > MAX_PAYLOAD) throw new IOException("pairing payload size " + size);
        byte[] payload = new byte[size];
        in.readFully(payload);
        return payload;
    }

    /** AES-128-GCM with a 12-byte little-endian counter as IV, as adb's pairing_auth does. */
    private static byte[] gcm(boolean encrypt, byte[] key, long counter, byte[] data) throws Exception {
        byte[] iv = ByteBuffer.allocate(12).order(ByteOrder.LITTLE_ENDIAN).putLong(counter).array();
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(encrypt ? Cipher.ENCRYPT_MODE : Cipher.DECRYPT_MODE, new SecretKeySpec(key, "AES"), new GCMParameterSpec(128, iv));
        return cipher.doFinal(data);
    }

    /** HKDF-SHA256 (RFC 5869) with an empty salt. */
    static byte[] hkdfSha256(byte[] ikm, byte[] info, int length) throws Exception {
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(new SecretKeySpec(new byte[32], "HmacSHA256"));
        byte[] prk = mac.doFinal(ikm);
        mac.init(new SecretKeySpec(prk, "HmacSHA256"));
        byte[] out = new byte[length];
        byte[] previous = new byte[0];
        int done = 0;
        for (int i = 1; done < length; i++) {
            mac.update(previous);
            mac.update(info);
            mac.update((byte) i);
            previous = mac.doFinal();
            int n = Math.min(previous.length, length - done);
            System.arraycopy(previous, 0, out, done, n);
            done += n;
        }
        return out;
    }
}
