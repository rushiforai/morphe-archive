package app.threadripper.extension.youtube;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.DatagramChannel;
import java.security.GeneralSecurityException;
import java.security.SecureRandom;
import java.util.ArrayDeque;

import javax.crypto.AEADBadTagException;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**
 * Minimal WireGuard initiator for a single peer (Cloudflare WARP), following the WireGuard paper
 * and the wireguard-go timers that matter for a client: handshake on start, retry every 5 s,
 * rekey after 120 s, drop a session after 180 s, keepalive after 10 s of receiving without sending
 * and every 25 s otherwise (WARP sits behind carrier NAT). Cookie replies (sent by a peer under
 * load) are not handled; the handshake is simply retried. No pre-shared key.
 *
 * Three threads: tunnel to UDP (encrypt), UDP to tunnel (decrypt, handshake responses) and a timer.
 * Packets read from the tunnel while there is no session are queued until the handshake completes.
 */
final class WireGuard {
    /** The device side: IP packets. */
    interface Tun {
        /** Reads one packet; returns 0 when nothing arrived within about half a second. */
        int read(byte[] buf) throws IOException;

        void write(byte[] buf, int off, int len) throws IOException;
    }

    /** Opens the UDP socket to the peer (on Android: protected from the VPN, then connected). */
    interface Socket {
        DatagramChannel open(InetSocketAddress peer) throws IOException;
    }

    private static final byte[] CONSTRUCTION = "Noise_IKpsk2_25519_ChaChaPoly_BLAKE2s".getBytes();
    private static final byte[] IDENTIFIER = "WireGuard v1 zx2c4 Jason@zx2c4.com".getBytes();
    private static final byte[] LABEL_MAC1 = "mac1----".getBytes();
    private static final byte[] INITIAL_CHAIN = Blake2s.hash(CONSTRUCTION);
    private static final byte[] INITIAL_HASH = Blake2s.hash(INITIAL_CHAIN, IDENTIFIER);
    private static final byte[] ZERO32 = new byte[32];
    private static final byte[] EMPTY = new byte[0];

    private static final long REKEY_AFTER_MS = 120_000;
    private static final long REJECT_AFTER_MS = 180_000;
    private static final long REKEY_TIMEOUT_MS = 5_000;
    private static final long KEEPALIVE_MS = 10_000;
    private static final long PERSISTENT_KEEPALIVE_MS = 25_000;
    private static final int MAX_QUEUED = 256;
    private static final int BUFFER = 2048;

    private final byte[] privateKey;
    private final byte[] publicKey;
    private final byte[] peerPublicKey;
    private final byte[] staticShared;
    private final byte[] peerHash;
    private final byte[] mac1Key;
    private final InetSocketAddress peer;
    private final Tun tun;
    private final Socket socket;
    private final SecureRandom random = new SecureRandom();

    private volatile boolean running;
    private volatile DatagramChannel channel;
    private volatile Session current;
    private volatile Session previous;
    private volatile long lastSentMs;
    private volatile long lastReceivedMs;
    private volatile long handshakes;
    private long lastTimestamp;
    private Handshake pending;
    private final ArrayDeque<byte[]> queue = new ArrayDeque<>();
    private final Object sendLock = new Object();
    private final Cipher sendCipher = newCipher();
    private final byte[] sendBuffer = new byte[BUFFER + 32];
    private final byte[] sendNonce = new byte[12];
    private Thread[] threads;

    WireGuard(byte[] privateKey, byte[] peerPublicKey, InetSocketAddress peer, Tun tun, Socket socket) {
        this.privateKey = privateKey;
        this.publicKey = X25519.publicKey(privateKey);
        this.peerPublicKey = peerPublicKey;
        this.staticShared = X25519.sharedSecret(privateKey, peerPublicKey);
        this.peerHash = Blake2s.hash(INITIAL_HASH, peerPublicKey);
        this.mac1Key = Blake2s.hash(LABEL_MAC1, peerPublicKey);
        this.peer = peer;
        this.tun = tun;
        this.socket = socket;
    }

    void start() throws IOException {
        running = true;
        channel = socket.open(peer);
        threads = new Thread[]{
                new Thread(this::outbound, "TR-WARP-out"),
                new Thread(this::inbound, "TR-WARP-in"),
                new Thread(this::timer, "TR-WARP-timer"),
        };
        for (Thread t : threads) t.start();
    }

    void stop() {
        running = false;
        try {
            channel.close();
        } catch (IOException ignored) {
        }
        if (threads != null) {
            for (Thread t : threads) t.interrupt();
        }
    }

    /** Whether a session is established (a handshake has completed and not expired). */
    boolean connected() {
        Session s = current;
        return s != null && System.currentTimeMillis() - s.createdMs < REJECT_AFTER_MS;
    }

    long handshakes() {
        return handshakes;
    }

    // ---- Threads ----

    private void outbound() {
        byte[] buf = new byte[BUFFER];
        while (running) {
            try {
                int n = tun.read(buf);
                if (n <= 0) continue;
                Session s = current;
                if (s == null || System.currentTimeMillis() - s.createdMs >= REJECT_AFTER_MS) {
                    synchronized (queue) {
                        if (queue.size() < MAX_QUEUED) {
                            byte[] copy = new byte[n];
                            System.arraycopy(buf, 0, copy, 0, n);
                            queue.add(copy);
                        }
                    }
                    initiate(false);
                    continue;
                }
                send(s, buf, n);
            } catch (Exception ex) {
                if (running) Log.e("WARP: outbound failure", ex);
            }
        }
    }

    private void inbound() {
        byte[] buf = new byte[BUFFER + 64];
        byte[] plain = new byte[BUFFER + 64];
        ByteBuffer bb = ByteBuffer.wrap(buf);
        Cipher cipher = newCipher();
        byte[] nonce = new byte[12];
        while (running) {
            DatagramChannel ch = channel;
            int n;
            try {
                bb.clear();
                n = ch.read(bb);
            } catch (IOException ex) {
                if (!running) return;
                reopen(ch);
                continue;
            }
            if (n < 4) continue;
            try {
                int type = buf[0];
                if (type == 4 && n >= 32) {
                    receiveData(buf, n, plain, cipher, nonce);
                } else if (type == 2 && n == 92) {
                    receiveResponse(buf);
                } else if (type == 3) {
                    Log.i("WARP: cookie reply (peer under load), retrying the handshake later");
                }
            } catch (Exception ex) {
                Log.e("WARP: inbound failure", ex);
            }
        }
    }

    private void timer() {
        while (running) {
            try {
                Thread.sleep(250);
            } catch (InterruptedException ex) {
                return;
            }
            try {
                long now = System.currentTimeMillis();
                Session s = current;
                if (s != null && now - s.createdMs >= REJECT_AFTER_MS) current = null;
                if (s == null || now - s.createdMs >= REKEY_AFTER_MS) initiate(false);
                s = current;
                if (s != null) {
                    long sinceSent = now - lastSentMs;
                    if (sinceSent >= PERSISTENT_KEEPALIVE_MS
                            || (lastReceivedMs > lastSentMs && sinceSent >= KEEPALIVE_MS)) {
                        send(s, EMPTY, 0);
                    }
                }
            } catch (Exception ex) {
                Log.e("WARP: timer failure", ex);
            }
        }
    }

    // ---- Transport data ----

    private void send(Session s, byte[] packet, int len) throws IOException, GeneralSecurityException {
        synchronized (sendLock) {
            int padded = (len + 15) & ~15;
            byte[] out = sendBuffer;
            if (packet != out) {
                // Pad in place: the caller's buffer has room up to BUFFER.
                for (int i = len; i < padded; i++) packet[i] = 0;
            }
            long counter = s.sendCounter++;
            out[0] = 4;
            out[1] = 0;
            out[2] = 0;
            out[3] = 0;
            putIntLE(out, 4, s.remoteIndex);
            putLongLE(out, 8, counter);
            putLongLE(sendNonce, 4, counter);
            sendCipher.init(Cipher.ENCRYPT_MODE, s.sendKey, new IvParameterSpec(sendNonce));
            int n = padded == 0 ? sendCipher.doFinal(EMPTY, 0, 0, out, 16) : sendCipher.doFinal(packet, 0, padded, out, 16);
            write(out, 16 + n);
        }
    }

    private void receiveData(byte[] buf, int n, byte[] plain, Cipher cipher, byte[] nonce) throws IOException {
        int receiver = getIntLE(buf, 4);
        Session s = current;
        if (s == null || s.localIndex != receiver) {
            s = previous;
            if (s == null || s.localIndex != receiver) return;
        }
        long counter = getLongLE(buf, 8);
        if (!s.window.mayAccept(counter)) return;
        int len;
        try {
            putLongLE(nonce, 4, counter);
            cipher.init(Cipher.DECRYPT_MODE, s.recvKey, new IvParameterSpec(nonce));
            len = cipher.doFinal(buf, 16, n - 16, plain, 0);
        } catch (AEADBadTagException ex) {
            return;
        } catch (GeneralSecurityException ex) {
            Log.e("WARP: decrypt failure", ex);
            return;
        }
        s.window.accept(counter);
        lastReceivedMs = System.currentTimeMillis();
        if (len == 0) return; // keepalive
        int ipLen = ipLength(plain, len);
        if (ipLen > 0) tun.write(plain, 0, ipLen);
    }

    /** Total length from the IP header; the decrypted payload is zero padded to 16 bytes. */
    private static int ipLength(byte[] p, int len) {
        int version = (p[0] & 0xff) >>> 4;
        int ipLen;
        if (version == 4 && len >= 20) ipLen = (p[2] & 0xff) << 8 | (p[3] & 0xff);
        else if (version == 6 && len >= 40) ipLen = 40 + ((p[4] & 0xff) << 8 | (p[5] & 0xff));
        else return -1;
        return ipLen <= len ? ipLen : -1;
    }

    // ---- Handshake ----

    /** Sends a handshake initiation unless one is already in flight (or force). */
    private void initiate(boolean force) throws IOException, GeneralSecurityException {
        byte[] msg;
        synchronized (this) {
            long now = System.currentTimeMillis();
            if (!force && pending != null && now - pending.sentMs < REKEY_TIMEOUT_MS) return;
            Handshake hs = new Handshake();
            hs.localIndex = random.nextInt();
            hs.ephemeral = X25519.generatePrivateKey();
            byte[] ephemeralPublic = X25519.publicKey(hs.ephemeral);

            msg = new byte[148];
            msg[0] = 1;
            putIntLE(msg, 4, hs.localIndex);
            byte[] c = kdf1(INITIAL_CHAIN, ephemeralPublic);
            byte[] h = Blake2s.hash(peerHash, ephemeralPublic);
            System.arraycopy(ephemeralPublic, 0, msg, 8, 32);

            byte[][] ck = kdf2(c, X25519.sharedSecret(hs.ephemeral, peerPublicKey));
            c = ck[0];
            byte[] encryptedStatic = aead(Cipher.ENCRYPT_MODE, ck[1], publicKey, h);
            System.arraycopy(encryptedStatic, 0, msg, 40, 48);
            h = Blake2s.hash(h, encryptedStatic);

            ck = kdf2(c, staticShared);
            c = ck[0];
            byte[] encryptedTimestamp = aead(Cipher.ENCRYPT_MODE, ck[1], timestamp(), h);
            System.arraycopy(encryptedTimestamp, 0, msg, 88, 28);
            h = Blake2s.hash(h, encryptedTimestamp);

            byte[] mac1 = Blake2s.mac(mac1Key, msg, 0, 116);
            System.arraycopy(mac1, 0, msg, 116, 16);

            hs.chain = c;
            hs.hash = h;
            hs.sentMs = now;
            pending = hs;
        }
        write(msg, msg.length);
    }

    private void receiveResponse(byte[] msg) throws IOException, GeneralSecurityException {
        Session session;
        synchronized (this) {
            Handshake hs = pending;
            if (hs == null || getIntLE(msg, 8) != hs.localIndex) return;
            byte[] ephemeralPublic = new byte[32];
            System.arraycopy(msg, 12, ephemeralPublic, 0, 32);
            byte[] encryptedNothing = new byte[16];
            System.arraycopy(msg, 44, encryptedNothing, 0, 16);

            byte[] c = kdf1(hs.chain, ephemeralPublic);
            byte[] h = Blake2s.hash(hs.hash, ephemeralPublic);
            c = kdf1(c, X25519.sharedSecret(hs.ephemeral, ephemeralPublic));
            c = kdf1(c, X25519.sharedSecret(privateKey, ephemeralPublic));
            byte[][] ctk = kdf3(c, ZERO32);
            c = ctk[0];
            h = Blake2s.hash(h, ctk[1]);
            try {
                aead(Cipher.DECRYPT_MODE, ctk[2], encryptedNothing, h);
            } catch (AEADBadTagException ex) {
                Log.i("WARP: handshake response failed authentication");
                return;
            }
            byte[][] keys = kdf2(c, EMPTY);
            session = new Session(hs.localIndex, getIntLE(msg, 4), keys[0], keys[1]);
            long rtt = System.currentTimeMillis() - hs.sentMs;
            pending = null;
            previous = current;
            current = session;
            handshakes++;
            if (handshakes == 1) Log.i("WARP: connected to " + peer + ", handshake " + rtt + " ms");
        }
        // The responder can only use the session after our first data packet: flush what queued
        // up during the handshake, or send a keepalive.
        boolean sent = false;
        while (true) {
            byte[] p;
            synchronized (queue) {
                p = queue.poll();
            }
            if (p == null) break;
            byte[] buf = new byte[BUFFER];
            System.arraycopy(p, 0, buf, 0, p.length);
            send(session, buf, p.length);
            sent = true;
        }
        if (!sent) send(session, EMPTY, 0);
    }

    private byte[] timestamp() {
        // TAI64N; strictly increasing, or the peer drops the initiation as a replay.
        long nowNs = System.currentTimeMillis() * 1_000_000L;
        if (nowNs <= lastTimestamp) nowNs = lastTimestamp + 1;
        lastTimestamp = nowNs;
        long seconds = 0x400000000000000aL + nowNs / 1_000_000_000L;
        int nanos = (int) (nowNs % 1_000_000_000L);
        byte[] t = new byte[12];
        for (int i = 0; i < 8; i++) t[i] = (byte) (seconds >>> (56 - 8 * i));
        for (int i = 0; i < 4; i++) t[8 + i] = (byte) (nanos >>> (24 - 8 * i));
        return t;
    }

    // ---- UDP ----

    private void write(byte[] buf, int len) throws IOException {
        DatagramChannel ch = channel;
        try {
            ch.write(ByteBuffer.wrap(buf, 0, len));
            lastSentMs = System.currentTimeMillis();
        } catch (IOException ex) {
            // Typically the network changed; the next packet goes out on a new socket.
            if (running) reopen(ch);
        }
    }

    private synchronized void reopen(DatagramChannel failed) {
        if (!running || channel != failed) return;
        try {
            failed.close();
        } catch (IOException ignored) {
        }
        try {
            channel = socket.open(peer);
            Log.i("WARP: socket reopened");
        } catch (IOException ex) {
            Log.e("WARP: socket reopen failure", ex);
            try {
                Thread.sleep(500);
            } catch (InterruptedException ignored) {
            }
        }
    }

    // ---- Crypto helpers ----

    private static Cipher newCipher() {
        try {
            return Cipher.getInstance("ChaCha20/Poly1305/NoPadding");
        } catch (GeneralSecurityException ex) {
            try {
                return Cipher.getInstance("ChaCha20-Poly1305");
            } catch (GeneralSecurityException ex2) {
                throw new IllegalStateException("ChaCha20-Poly1305 unavailable", ex2);
            }
        }
    }

    /** ChaCha20-Poly1305 with counter 0, as used in the handshake. */
    private static byte[] aead(int mode, byte[] key, byte[] in, byte[] ad) throws GeneralSecurityException {
        Cipher c = newCipher();
        c.init(mode, new SecretKeySpec(key, "ChaCha20"), new IvParameterSpec(new byte[12]));
        c.updateAAD(ad);
        return c.doFinal(in);
    }

    private static byte[] kdf1(byte[] key, byte[] input) {
        byte[] t0 = Blake2s.hmac(key, input);
        return Blake2s.hmac(t0, new byte[]{1});
    }

    private static byte[][] kdf2(byte[] key, byte[] input) {
        byte[] t0 = Blake2s.hmac(key, input);
        byte[] t1 = Blake2s.hmac(t0, new byte[]{1});
        byte[] t2 = Blake2s.hmac(t0, t1, new byte[]{2});
        return new byte[][]{t1, t2};
    }

    private static byte[][] kdf3(byte[] key, byte[] input) {
        byte[] t0 = Blake2s.hmac(key, input);
        byte[] t1 = Blake2s.hmac(t0, new byte[]{1});
        byte[] t2 = Blake2s.hmac(t0, t1, new byte[]{2});
        byte[] t3 = Blake2s.hmac(t0, t2, new byte[]{3});
        return new byte[][]{t1, t2, t3};
    }

    private static void putIntLE(byte[] b, int off, int v) {
        for (int i = 0; i < 4; i++) b[off + i] = (byte) (v >>> (8 * i));
    }

    private static void putLongLE(byte[] b, int off, long v) {
        for (int i = 0; i < 8; i++) b[off + i] = (byte) (v >>> (8 * i));
    }

    private static int getIntLE(byte[] b, int off) {
        return (b[off] & 0xff) | (b[off + 1] & 0xff) << 8 | (b[off + 2] & 0xff) << 16 | (b[off + 3] & 0xff) << 24;
    }

    private static long getLongLE(byte[] b, int off) {
        long v = 0;
        for (int i = 7; i >= 0; i--) v = v << 8 | (b[off + i] & 0xff);
        return v;
    }

    private static final class Handshake {
        int localIndex;
        byte[] ephemeral;
        byte[] chain;
        byte[] hash;
        long sentMs;
    }

    private static final class Session {
        final int localIndex;
        final int remoteIndex;
        final SecretKeySpec sendKey;
        final SecretKeySpec recvKey;
        final long createdMs = System.currentTimeMillis();
        final ReplayWindow window = new ReplayWindow();
        /** Guarded by sendLock. */
        long sendCounter;

        Session(int localIndex, int remoteIndex, byte[] sendKey, byte[] recvKey) {
            this.localIndex = localIndex;
            this.remoteIndex = remoteIndex;
            this.sendKey = new SecretKeySpec(sendKey, "ChaCha20");
            this.recvKey = new SecretKeySpec(recvKey, "ChaCha20");
        }
    }

    /** Sliding window of 2048 counters against replayed packets (inbound thread only). */
    private static final class ReplayWindow {
        private static final int SIZE = 2048;
        private final long[] bits = new long[SIZE / 64];
        private long max = -1;

        boolean mayAccept(long counter) {
            if (counter < 0) return false;
            if (counter > max) return true;
            if (max - counter >= SIZE) return false;
            int i = (int) (counter & (SIZE - 1));
            return (bits[i >>> 6] & (1L << (i & 63))) == 0;
        }

        void accept(long counter) {
            if (counter > max) {
                if (counter - max >= SIZE) {
                    java.util.Arrays.fill(bits, 0);
                } else {
                    for (long c = max + 1; c < counter; c++) {
                        int i = (int) (c & (SIZE - 1));
                        bits[i >>> 6] &= ~(1L << (i & 63));
                    }
                }
                max = counter;
            }
            int i = (int) (counter & (SIZE - 1));
            bits[i >>> 6] |= 1L << (i & 63);
        }
    }
}
