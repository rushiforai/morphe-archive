package app.morphed.extension.twitch.vpn;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;

import app.morphed.extension.twitch.vpn.crypto.Blake2s;
import app.morphed.extension.twitch.vpn.crypto.ChaChaPoly;
import app.morphed.extension.twitch.vpn.crypto.X25519;

/**
 * A WireGuard client in user space: the Noise IK handshake with the server, then IP packets in and out over UDP.
 * The device's network isn't touched; only what the patches send through it goes through it.
 */
public final class WireGuard {
    /** Gets the IP packets that come out of the tunnel. */
    public interface Receiver {
        void packet(byte[] packet, int offset, int length);
    }

    static final byte[] CONSTRUCTION = "Noise_IKpsk2_25519_ChaChaPoly_BLAKE2s".getBytes(StandardCharsets.US_ASCII);
    static final byte[] IDENTIFIER = "WireGuard v1 zx2c4 Jason@zx2c4.com".getBytes(StandardCharsets.US_ASCII);
    static final byte[] LABEL_MAC1 = "mac1----".getBytes(StandardCharsets.US_ASCII);
    static final byte[] LABEL_COOKIE = "cookie--".getBytes(StandardCharsets.US_ASCII);
    static final long REKEY_AFTER_MS = 120_000;
    static final long REJECT_AFTER_MS = 180_000;
    static final long REKEY_TIMEOUT_MS = 5_000;
    static final long KEEPALIVE_MS = 10_000;
    static final long REKEY_AFTER_MESSAGES = 1L << 60;

    private final WgConfig config;
    private final SecureRandom random = new SecureRandom();
    private final byte[] staticPublic;
    private DatagramSocket socket;
    private InetSocketAddress endpoint;
    private volatile Receiver receiver;
    private volatile boolean closed;
    private Thread reader, timer;

    /** A finished handshake's keys. */
    static final class Keypair {
        final byte[] sendKey, receiveKey;
        final int localIndex, remoteIndex;
        final long createdAt;
        long sendCounter;
        final Replay replay = new Replay();

        Keypair(byte[] sendKey, byte[] receiveKey, int localIndex, int remoteIndex, long createdAt) {
            this.sendKey = sendKey;
            this.receiveKey = receiveKey;
            this.localIndex = localIndex;
            this.remoteIndex = remoteIndex;
            this.createdAt = createdAt;
        }
    }

    /** The handshake in flight. */
    static final class Pending {
        final int localIndex;
        final byte[] ephemeralPrivate;
        final byte[] chain, hash;
        final long sentAt;

        Pending(int localIndex, byte[] ephemeralPrivate, byte[] chain, byte[] hash, long sentAt) {
            this.localIndex = localIndex;
            this.ephemeralPrivate = ephemeralPrivate;
            this.chain = chain;
            this.hash = hash;
            this.sentAt = sentAt;
        }
    }

    private volatile Keypair current, previous;
    private Pending pending;
    private byte[] cookie; // from a cookie reply: mac2 needs it
    private long cookieAt;
    private byte[] lastMac1;
    private volatile long lastSentAt, lastReceivedAt;
    private volatile String failure;

    public WireGuard(WgConfig config) {
        this.config = config;
        this.staticPublic = X25519.publicKey(config.privateKey);
    }

    public WgConfig config() {
        return config;
    }

    /** Connects and waits for the first handshake; IOException saying why when the server doesn't answer. */
    public void start(Receiver receiver, long timeoutMs) throws IOException {
        this.receiver = receiver;
        InetAddress host = lookup(config.endpointHost, Math.min(timeoutMs, 4000));
        endpoint = new InetSocketAddress(host, config.endpointPort);
        socket = new DatagramSocket();
        socket.setSoTimeout(1000);
        reader = new Thread(this::readLoop, "TwitchMorphed-vpn-in");
        reader.setDaemon(true);
        reader.start();
        timer = new Thread(this::timerLoop, "TwitchMorphed-vpn-timer");
        timer.setDaemon(true);
        timer.start();
        long deadline = System.currentTimeMillis() + timeoutMs;
        synchronized (this) {
            sendInitiation();
            while (current == null && !closed && System.currentTimeMillis() < deadline) {
                try {
                    wait(200);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    break;
                }
            }
        }
        if (current == null) {
            close();
            String why = failure;
            throw new IOException(why != null ? why : config.name + " didn't answer the handshake");
        }
    }

    /** The server's address, waited for at most timeoutMs (the system's lookup has no limit of its own). */
    private static InetAddress lookup(String host, long timeoutMs) throws IOException {
        java.util.concurrent.FutureTask<InetAddress> task = new java.util.concurrent.FutureTask<>(() -> InetAddress.getByName(host));
        Thread thread = new Thread(task, "TwitchMorphed-vpn-dns");
        thread.setDaemon(true);
        thread.start();
        try {
            return task.get(timeoutMs, java.util.concurrent.TimeUnit.MILLISECONDS);
        } catch (java.util.concurrent.TimeoutException e) {
            task.cancel(true);
            throw new IOException("The VPN server's name (" + host + ") couldn't be looked up in time");
        } catch (java.util.concurrent.ExecutionException e) {
            throw new IOException("The VPN server's name (" + host + ") couldn't be looked up: " + e.getCause().getMessage());
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new IOException("Interrupted");
        }
    }

    public boolean isOpen() {
        return !closed;
    }

    public boolean isUp() {
        Keypair keys = current;
        return !closed && keys != null && System.currentTimeMillis() - keys.createdAt < REJECT_AFTER_MS;
    }

    public void close() {
        closed = true;
        if (socket != null) socket.close();
    }

    // --- handshake

    private static byte[] tai64n() {
        long now = System.currentTimeMillis();
        long seconds = now / 1000 + (1L << 62) + 10;
        int nanos = (int) ((now % 1000) * 1_000_000);
        byte[] out = new byte[12];
        for (int i = 0; i < 8; i++) out[i] = (byte) (seconds >>> (56 - 8 * i));
        for (int i = 0; i < 4; i++) out[8 + i] = (byte) (nanos >>> (24 - 8 * i));
        return out;
    }

    private static void putInt(byte[] b, int at, int v) {
        b[at] = (byte) v;
        b[at + 1] = (byte) (v >>> 8);
        b[at + 2] = (byte) (v >>> 16);
        b[at + 3] = (byte) (v >>> 24);
    }

    private static int getInt(byte[] b, int at) {
        return (b[at] & 0xff) | (b[at + 1] & 0xff) << 8 | (b[at + 2] & 0xff) << 16 | (b[at + 3] & 0xff) << 24;
    }

    private static byte[] concat(byte[] a, byte[] b) {
        byte[] out = new byte[a.length + b.length];
        System.arraycopy(a, 0, out, 0, a.length);
        System.arraycopy(b, 0, out, a.length, b.length);
        return out;
    }

    /** Builds and sends a handshake initiation (148 bytes). */
    synchronized void sendInitiation() {
        try {
            byte[] chain = Blake2s.hash(CONSTRUCTION);
            byte[] hash = Blake2s.hash(chain, IDENTIFIER);
            hash = Blake2s.hash(hash, config.peerPublicKey);
            byte[] ephemeral = X25519.generatePrivateKey(random);
            byte[] ephemeralPublic = X25519.publicKey(ephemeral);
            chain = Blake2s.kdf(1, chain, ephemeralPublic)[0];
            int index = random.nextInt();
            byte[] msg = new byte[148];
            msg[0] = 1;
            putInt(msg, 4, index);
            System.arraycopy(ephemeralPublic, 0, msg, 8, 32);
            hash = Blake2s.hash(hash, ephemeralPublic);
            byte[][] ck = Blake2s.kdf(2, chain, X25519.scalarMult(ephemeral, config.peerPublicKey));
            chain = ck[0];
            byte[] encryptedStatic = ChaChaPoly.seal(ck[1], ChaChaPoly.nonce(0), hash, staticPublic);
            System.arraycopy(encryptedStatic, 0, msg, 40, 48);
            hash = Blake2s.hash(hash, encryptedStatic);
            ck = Blake2s.kdf(2, chain, X25519.scalarMult(config.privateKey, config.peerPublicKey));
            chain = ck[0];
            byte[] timestamp = ChaChaPoly.seal(ck[1], ChaChaPoly.nonce(0), hash, tai64n());
            System.arraycopy(timestamp, 0, msg, 88, 28);
            hash = Blake2s.hash(hash, timestamp);
            addMacs(msg, 116);
            pending = new Pending(index, ephemeral, chain, hash, System.currentTimeMillis());
            send(msg, msg.length);
        } catch (IOException e) {
            failure = "Couldn't reach " + config.name + ": " + e.getMessage();
        }
    }

    private void addMacs(byte[] msg, int macAt) {
        byte[] mac1 = Blake2s.mac(Blake2s.hash(LABEL_MAC1, config.peerPublicKey), msg, macAt);
        System.arraycopy(mac1, 0, msg, macAt, 16);
        lastMac1 = mac1;
        if (cookie != null && System.currentTimeMillis() - cookieAt < 120_000) {
            byte[] mac2 = Blake2s.mac(cookie, msg, macAt + 16);
            System.arraycopy(mac2, 0, msg, macAt + 16, 16);
        }
    }

    private synchronized void onResponse(byte[] msg, int length) {
        Pending hs = pending;
        if (length != 92 || hs == null || getInt(msg, 8) != hs.localIndex) return;
        byte[] macKey = Blake2s.hash(LABEL_MAC1, staticPublic);
        byte[] mac1 = Blake2s.mac(macKey, msg, 60);
        for (int i = 0; i < 16; i++) if (mac1[i] != msg[60 + i]) return;
        int remoteIndex = getInt(msg, 4);
        byte[] ephemeral = new byte[32];
        System.arraycopy(msg, 12, ephemeral, 0, 32);
        byte[] chain = Blake2s.kdf(1, hs.chain, ephemeral)[0];
        byte[] hash = Blake2s.hash(hs.hash, ephemeral);
        chain = Blake2s.kdf(1, chain, X25519.scalarMult(hs.ephemeralPrivate, ephemeral))[0];
        chain = Blake2s.kdf(1, chain, X25519.scalarMult(config.privateKey, ephemeral))[0];
        byte[][] ctk = Blake2s.kdf(3, chain, config.presharedKey);
        chain = ctk[0];
        hash = Blake2s.hash(hash, ctk[1]);
        byte[] empty = new byte[16];
        System.arraycopy(msg, 44, empty, 0, 16);
        if (ChaChaPoly.open(ctk[2], ChaChaPoly.nonce(0), hash, empty) == null) {
            failure = config.name + " rejected the keys (check the config)";
            return;
        }
        byte[][] keys = Blake2s.kdf(2, chain, new byte[0]);
        previous = current;
        current = new Keypair(keys[0], keys[1], hs.localIndex, remoteIndex, System.currentTimeMillis());
        pending = null;
        failure = null;
        sendKeepalive(); // confirms the handshake to the server
        notifyAll();
    }

    private synchronized void onCookie(byte[] msg, int length) {
        if (length != 64 || pending == null || getInt(msg, 4) != pending.localIndex || lastMac1 == null) return;
        byte[] nonce = new byte[24];
        System.arraycopy(msg, 8, nonce, 0, 24);
        byte[] sealed = new byte[32];
        System.arraycopy(msg, 32, sealed, 0, 32);
        byte[] key = Blake2s.hash(LABEL_COOKIE, config.peerPublicKey);
        byte[] value = ChaChaPoly.xopen(key, nonce, lastMac1, sealed);
        if (value == null) return;
        cookie = value;
        cookieAt = System.currentTimeMillis();
    }

    // --- transport

    /** Sends an IP packet through the tunnel; false when there are no keys yet (a handshake is under way). */
    public boolean send(byte[] packet, int offset, int length) {
        Keypair keys = current;
        if (closed || keys == null || System.currentTimeMillis() - keys.createdAt >= REJECT_AFTER_MS) {
            requestHandshake();
            return false;
        }
        long counter;
        synchronized (keys) {
            counter = keys.sendCounter++;
        }
        int padded = (length + 15) & ~15;
        byte[] msg = new byte[16 + padded + ChaChaPoly.TAG];
        msg[0] = 4;
        putInt(msg, 4, keys.remoteIndex);
        for (int i = 0; i < 8; i++) msg[8 + i] = (byte) (counter >>> (8 * i));
        byte[] plain = packet;
        int plainOffset = offset;
        if (padded != length) {
            plain = new byte[padded];
            System.arraycopy(packet, offset, plain, 0, length);
            plainOffset = 0;
        }
        ChaChaPoly.seal(keys.sendKey, ChaChaPoly.nonce(counter), null, plain, plainOffset, padded, msg, 16);
        try {
            send(msg, msg.length);
            lastDataAt = System.currentTimeMillis();
            return true;
        } catch (IOException e) {
            failure = "Sending to " + config.name + " failed: " + e.getMessage();
            return false;
        }
    }

    private void sendKeepalive() {
        long data = lastDataAt;
        send(new byte[0], 0, 0);
        lastDataAt = data; // a keepalive isn't traffic: it doesn't keep the session being renewed
    }

    /** When something other than a keepalive was last sent: sessions are renewed only while in use. */
    private volatile long lastDataAt;

    private void send(byte[] msg, int length) throws IOException {
        socket.send(new DatagramPacket(msg, length, endpoint));
        lastSentAt = System.currentTimeMillis();
    }

    private void onData(byte[] msg, int length) {
        if (length < 32) return;
        int index = getInt(msg, 4);
        Keypair keys = current;
        if (keys == null || keys.localIndex != index) {
            keys = previous;
            if (keys == null || keys.localIndex != index) return;
        }
        if (System.currentTimeMillis() - keys.createdAt >= REJECT_AFTER_MS) return;
        long counter = 0;
        for (int i = 0; i < 8; i++) counter |= (long) (msg[8 + i] & 0xff) << (8 * i);
        byte[] plain = new byte[length - 16 - ChaChaPoly.TAG];
        if (!ChaChaPoly.open(keys.receiveKey, ChaChaPoly.nonce(counter), null, msg, 16, length - 16, plain, 0)) return;
        synchronized (keys.replay) {
            if (!keys.replay.accept(counter)) return;
        }
        lastReceivedAt = System.currentTimeMillis();
        if (plain.length == 0) return; // keepalive
        int total = ((plain[2] & 0xff) << 8) | (plain[3] & 0xff); // IPv4 total length (the rest is padding)
        if ((plain[0] >> 4) != 4 || total > plain.length || total < 20) return;
        Receiver to = receiver;
        if (to != null) to.packet(plain, 0, total);
    }

    private void readLoop() {
        byte[] buffer = new byte[65536];
        DatagramPacket packet = new DatagramPacket(buffer, buffer.length);
        while (!closed) {
            try {
                packet.setLength(buffer.length);
                socket.receive(packet);
            } catch (java.net.SocketTimeoutException timeout) {
                continue;
            } catch (IOException e) {
                if (!closed) failure = "The connection to " + config.name + " failed: " + e.getMessage();
                break;
            }
            int length = packet.getLength();
            if (length < 4) continue;
            try {
                switch (buffer[0]) {
                    case 2: onResponse(buffer, length); break;
                    case 3: onCookie(buffer, length); break;
                    case 4: onData(buffer, length); break;
                    default:
                }
            } catch (RuntimeException e) {
                failure = "A packet from " + config.name + " couldn't be read: " + e;
            }
        }
    }

    private volatile boolean handshakeWanted;

    private void requestHandshake() {
        handshakeWanted = true;
    }

    private void timerLoop() {
        while (!closed) {
            try {
                Thread.sleep(250);
            } catch (InterruptedException e) {
                return;
            }
            long now = System.currentTimeMillis();
            Keypair keys = current;
            synchronized (this) {
                boolean inFlight = pending != null && now - pending.sentAt < REKEY_TIMEOUT_MS;
                boolean old = keys == null || now - keys.createdAt >= REKEY_AFTER_MS
                        || keys.sendCounter >= REKEY_AFTER_MESSAGES;
                // Renewed while it's in use (or a send is waiting for keys); an idle tunnel lets its keys expire
                // and renews them on the next send, as WireGuard itself does.
                boolean inUse = keys == null || now - lastDataAt < REKEY_AFTER_MS || handshakeWanted; // (null: still connecting)
                if (!inFlight && old && inUse) {
                    handshakeWanted = false;
                    sendInitiation();
                }
            }
            if (keys != null && now - keys.createdAt < REJECT_AFTER_MS && now - lastDataAt < REKEY_AFTER_MS) {
                boolean persistent = config.keepaliveSeconds > 0 && now - lastSentAt >= config.keepaliveSeconds * 1000L;
                boolean passive = lastReceivedAt > lastSentAt && now - lastSentAt >= KEEPALIVE_MS;
                if (persistent || passive) sendKeepalive();
            }
        }
    }

    /** Which counters were seen: a sliding window of 2048 behind the highest (RFC 6479). */
    static final class Replay {
        private static final int WINDOW = 2048;
        private final long[] bits = new long[WINDOW / 64];
        private long highest = -1;

        boolean accept(long counter) {
            if (counter < 0) return false;
            if (counter > highest) {
                long shift = counter - highest;
                if (shift >= WINDOW) {
                    java.util.Arrays.fill(bits, 0);
                } else {
                    for (long c = highest + 1; c <= counter; c++) clear(c);
                }
                highest = counter;
                set(counter);
                return true;
            }
            if (highest - counter >= WINDOW) return false;
            if (isSet(counter)) return false;
            set(counter);
            return true;
        }

        private void set(long c) {
            int slot = (int) (c % WINDOW);
            bits[slot >>> 6] |= 1L << (slot & 63);
        }

        private void clear(long c) {
            int slot = (int) (c % WINDOW);
            bits[slot >>> 6] &= ~(1L << (slot & 63));
        }

        private boolean isSet(long c) {
            int slot = (int) (c % WINDOW);
            return (bits[slot >>> 6] & (1L << (slot & 63))) != 0;
        }
    }

    static byte[] join(byte[] a, byte[] b) {
        return concat(a, b);
    }
}
