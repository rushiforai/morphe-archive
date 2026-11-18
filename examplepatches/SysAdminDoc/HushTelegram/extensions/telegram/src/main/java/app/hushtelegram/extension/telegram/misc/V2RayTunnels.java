/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;

/**
 * What goes over a connection {@link V2RayDialer} opened to a server, for each kind of link:
 * Shadowsocks AEAD, VMess with its AEAD header (alterId 0), VLESS with no flow, and Trojan. Each
 * {@link #open} writes the request for one destination with the first bytes Telegram sent, and
 * hands back the streams the rest goes through. None of this opens a connection itself.
 */
final class V2RayTunnels {
    /** The most a Shadowsocks chunk carries, from its spec. */
    static final int SS_CHUNK = 0x3FFF;
    /** The most a VMess chunk carries, under v2fly's 8192-byte buffer with room for the tag and size. */
    static final int VMESS_CHUNK = 8000;

    private static final byte[] CRLF = {'\r', '\n'};

    private V2RayTunnels() {
    }

    /** Where Telegram asked to go, as SOCKS5 names it: type 1 is IPv4, 3 a host name, 4 IPv6. */
    static final class Target {
        static final int IPV4 = 1;
        static final int DOMAIN = 3;
        static final int IPV6 = 4;

        final int type;
        final byte[] address;
        final int port;

        Target(int type, byte[] address, int port) {
            if ((type == IPV4 && address.length != 4) || (type == IPV6 && address.length != 16)
                    || (type == DOMAIN && (address.length == 0 || address.length > 255))
                    || (type != IPV4 && type != IPV6 && type != DOMAIN) || port < 0 || port > 65535) {
                throw new IllegalArgumentException("not a destination");
            }
            this.type = type;
            this.address = address;
            this.port = port;
        }

        static Target domain(String host, int port) {
            return new Target(DOMAIN, host.getBytes(StandardCharsets.US_ASCII), port);
        }

        /** SOCKS5's own form, which Shadowsocks and Trojan use: type, address, port. */
        byte[] socks() {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            out.write(type);
            if (type == DOMAIN) out.write(address.length);
            out.write(address, 0, address.length);
            out.write(port >> 8);
            out.write(port);
            return out.toByteArray();
        }

        /** VMess's and VLESS's form: port, then type (1 IPv4, 2 host name, 3 IPv6) and address. */
        byte[] portFirst() {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            out.write(port >> 8);
            out.write(port);
            out.write(type == IPV4 ? 1 : type == DOMAIN ? 2 : 3);
            if (type == DOMAIN) out.write(address.length);
            out.write(address, 0, address.length);
            return out.toByteArray();
        }
    }

    /** A connection to a server, with TCP, TLS and WebSocket set up as its link asks. */
    static final class Wire implements Closeable {
        /** What holds the connection open: its read timeout, and closing it. */
        interface Ends extends Closeable {
            void timeout(int ms) throws IOException;
        }

        final InputStream in;
        final OutputStream out;
        private final Ends ends;

        Wire(InputStream in, OutputStream out, Ends ends) {
            this.in = in;
            this.out = out;
            this.ends = ends;
        }

        /** Reads wait this long, 0 for as long as it takes. */
        void timeout(int ms) throws IOException {
            ends.timeout(ms);
        }

        Ends ends() {
            return ends;
        }

        @Override
        public void close() {
            try {
                ends.close();
            } catch (IOException ignored) {
                // Closing is all that's asked, and a connection that's gone is closed.
            }
        }
    }

    /** One destination through a server: what Telegram sends goes to [out], what comes back from [in]. */
    static final class Tunnel implements Closeable {
        final InputStream in;
        final OutputStream out;
        final Wire wire;

        Tunnel(InputStream in, OutputStream out, Wire wire) {
            this.in = in;
            this.out = out;
            this.wire = wire;
        }

        @Override
        public void close() {
            wire.close();
        }
    }

    /** Asks [server], over [wire], for [target], sending [early] with the request. */
    static Tunnel open(V2RayLinks.Server server, Wire wire, Target target, byte[] early) throws IOException {
        try {
            switch (server.kind) {
                case V2RayLinks.SS:
                    return shadowsocks(server, wire, target, early);
                case V2RayLinks.VMESS:
                    return vmess(server, wire, target, early);
                case V2RayLinks.VLESS:
                    return vless(server, wire, target, early);
                case V2RayLinks.TROJAN:
                    return trojan(server, wire, target, early);
                default:
                    throw new IOException("not a kind of server this carries");
            }
        } catch (GeneralSecurityException failure) {
            throw new IOException("the cipher isn't available", failure);
        }
    }

    // ---- Shadowsocks AEAD -------------------------------------------------------------------------

    static int ssKeyLength(String cipher) {
        return "aes-128-gcm".equals(cipher) ? 16 : 32;
    }

    static String ssAead(String cipher) {
        return cipher.startsWith("aes-") ? V2RayCrypto.Aead.AES_GCM : V2RayCrypto.Aead.CHACHA;
    }

    static byte[] ssSubkey(byte[] key, byte[] salt) {
        return V2RayCrypto.hkdfSha1(key, salt, "ss-subkey".getBytes(StandardCharsets.US_ASCII), key.length);
    }

    private static Tunnel shadowsocks(V2RayLinks.Server server, Wire wire, Target target, byte[] early)
            throws IOException, GeneralSecurityException {
        int length = ssKeyLength(server.cipher);
        byte[] key = V2RayCrypto.passwordKey(server.secret, length);
        byte[] salt = V2RayCrypto.random(length);
        SsOut out = new SsOut(wire.out, new V2RayCrypto.Aead(ssAead(server.cipher), ssSubkey(key, salt)));
        // The address goes in the first chunk with what Telegram sent, after the salt, in one write.
        out.first(salt, V2RayCrypto.concat(target.socks(), early));
        return new Tunnel(new SsIn(wire.in, server.cipher, key), out, wire);
    }

    /** Shadowsocks AEAD chunks: a sealed two-byte length, then the sealed payload. */
    static final class SsOut extends OutputStream {
        private final OutputStream wire;
        private final V2RayCrypto.Aead aead;
        private final byte[] nonce = new byte[12];

        SsOut(OutputStream wire, V2RayCrypto.Aead aead) {
            this.wire = wire;
            this.aead = aead;
        }

        void first(byte[] prefix, byte[] payload) throws IOException {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream(prefix.length + payload.length + 64);
            bytes.write(prefix, 0, prefix.length);
            int at = 0;
            do {
                int n = Math.min(SS_CHUNK, payload.length - at);
                seal(bytes, payload, at, n);
                at += n;
            } while (at < payload.length);
            wire.write(bytes.toByteArray());
            wire.flush();
        }

        @Override
        public void write(int b) throws IOException {
            write(new byte[]{(byte) b}, 0, 1);
        }

        @Override
        public void write(byte[] data, int offset, int length) throws IOException {
            if (length == 0) return;
            ByteArrayOutputStream bytes = new ByteArrayOutputStream(length + 64);
            for (int at = offset; at < offset + length; ) {
                int n = Math.min(SS_CHUNK, offset + length - at);
                seal(bytes, data, at, n);
                at += n;
            }
            wire.write(bytes.toByteArray());
        }

        private void seal(ByteArrayOutputStream into, byte[] data, int offset, int length) throws IOException {
            try {
                byte[] size = aead.seal(nonce, new byte[]{(byte) (length >> 8), (byte) length}, 0, 2, null);
                increment(nonce);
                byte[] sealed = aead.seal(nonce, data, offset, length, null);
                increment(nonce);
                into.write(size, 0, size.length);
                into.write(sealed, 0, sealed.length);
            } catch (GeneralSecurityException failure) {
                throw new IOException("a chunk couldn't be sealed", failure);
            }
        }

        @Override
        public void flush() throws IOException {
            wire.flush();
        }

        @Override
        public void close() throws IOException {
            wire.close();
        }
    }

    static final class SsIn extends ChunkIn {
        private final String cipher;
        private final byte[] key;
        private V2RayCrypto.Aead aead;
        private final byte[] nonce = new byte[12];

        SsIn(InputStream wire, String cipher, byte[] key) {
            super(wire);
            this.cipher = cipher;
            this.key = key;
        }

        @Override
        byte[] next() throws IOException {
            try {
                if (aead == null) {
                    byte[] salt = new byte[key.length];
                    if (!readFully(wire, salt, true)) return null;
                    aead = new V2RayCrypto.Aead(ssAead(cipher), ssSubkey(key, salt));
                }
                byte[] sealedSize = new byte[2 + V2RayCrypto.Aead.TAG];
                if (!readFully(wire, sealedSize, true)) return null;
                byte[] size = aead.open(nonce, sealedSize, 0, sealedSize.length, null);
                increment(nonce);
                int length = ((size[0] & 0xff) << 8 | (size[1] & 0xff)) & SS_CHUNK;
                byte[] sealed = new byte[length + V2RayCrypto.Aead.TAG];
                readFully(wire, sealed, false);
                byte[] plain = aead.open(nonce, sealed, 0, sealed.length, null);
                increment(nonce);
                return plain;
            } catch (GeneralSecurityException failure) {
                throw new IOException("a chunk didn't open", failure);
            }
        }
    }

    /** Shadowsocks counts its nonce up as a little-endian number. */
    static void increment(byte[] nonce) {
        for (int i = 0; i < nonce.length; i++) {
            if (++nonce[i] != 0) return;
        }
    }

    // ---- VMess ------------------------------------------------------------------------------------

    static final int VMESS_AES = 3;
    static final int VMESS_CHACHA = 4;
    static final int VMESS_NONE = 5;
    /** Chunked, each chunk's size masked: option S and M. */
    private static final int VMESS_CHUNKED = 0x01 | 0x04;

    private static Tunnel vmess(V2RayLinks.Server server, Wire wire, Target target, byte[] early)
            throws IOException, GeneralSecurityException {
        byte[] id = V2RayCrypto.uuid(server.secret);
        if (id == null) throw new IOException("not an id");
        byte[] cmdKey = V2RayCrypto.vmessCmdKey(id);
        byte[] bodyKey = V2RayCrypto.random(16);
        byte[] bodyIv = V2RayCrypto.random(16);
        int check = V2RayCrypto.RANDOM.nextInt(256);
        boolean zero = "zero".equals(server.cipher);
        int security = zero || "none".equals(server.cipher) ? VMESS_NONE
                : "chacha20-poly1305".equals(server.cipher) ? VMESS_CHACHA : VMESS_AES;
        int options = zero ? 0 : VMESS_CHUNKED;

        ByteArrayOutputStream header = new ByteArrayOutputStream(96);
        header.write(1);
        header.write(bodyIv, 0, 16);
        header.write(bodyKey, 0, 16);
        header.write(check);
        header.write(options);
        int padding = V2RayCrypto.RANDOM.nextInt(16);
        header.write(padding << 4 | security);
        header.write(0);
        header.write(1);
        byte[] address = target.portFirst();
        header.write(address, 0, address.length);
        header.write(V2RayCrypto.random(padding), 0, padding);
        byte[] plain = header.toByteArray();
        int hash = V2RayCrypto.fnv1a(plain, 0, plain.length);
        header.write(hash >>> 24);
        header.write(hash >>> 16);
        header.write(hash >>> 8);
        header.write(hash);

        byte[] sealed = sealVmessHeader(cmdKey, header.toByteArray(), System.currentTimeMillis() / 1000L);
        VmessOut out = new VmessOut(wire.out, security, zero, bodyKey, bodyIv);
        out.first(sealed, early);
        byte[] responseKey = java.util.Arrays.copyOf(V2RayCrypto.digest("SHA-256", bodyKey), 16);
        byte[] responseIv = java.util.Arrays.copyOf(V2RayCrypto.digest("SHA-256", bodyIv), 16);
        return new Tunnel(new VmessIn(wire.in, security, zero, responseKey, responseIv, check), out, wire);
    }

    /** VMess's AEAD request header: AuthID, sealed length, connection nonce, sealed header (v2fly aead/encrypt.go). */
    static byte[] sealVmessHeader(byte[] cmdKey, byte[] header, long seconds) throws GeneralSecurityException {
        byte[] authId = authId(cmdKey, seconds, V2RayCrypto.random(4));
        byte[] nonce = V2RayCrypto.random(8);
        byte[] lengthKey = V2RayCrypto.vmessKdf16(cmdKey, bytes("VMess Header AEAD Key_Length"), authId, nonce);
        byte[] lengthIv = cut(V2RayCrypto.vmessKdf(cmdKey, bytes("VMess Header AEAD Nonce_Length"), authId, nonce), 12);
        byte[] sealedLength = new V2RayCrypto.Aead(V2RayCrypto.Aead.AES_GCM, lengthKey)
                .seal(lengthIv, new byte[]{(byte) (header.length >> 8), (byte) header.length}, 0, 2, authId);
        byte[] headerKey = V2RayCrypto.vmessKdf16(cmdKey, bytes("VMess Header AEAD Key"), authId, nonce);
        byte[] headerIv = cut(V2RayCrypto.vmessKdf(cmdKey, bytes("VMess Header AEAD Nonce"), authId, nonce), 12);
        byte[] sealedHeader = new V2RayCrypto.Aead(V2RayCrypto.Aead.AES_GCM, headerKey)
                .seal(headerIv, header, 0, header.length, authId);
        return V2RayCrypto.concat(authId, sealedLength, nonce, sealedHeader);
    }

    /** The 16-byte AuthID: time, 4 random bytes and their CRC32, under AES keyed from cmdKey. */
    static byte[] authId(byte[] cmdKey, long seconds, byte[] random) throws GeneralSecurityException {
        byte[] block = new byte[16];
        for (int i = 0; i < 8; i++) block[i] = (byte) (seconds >>> (56 - 8 * i));
        System.arraycopy(random, 0, block, 8, 4);
        int crc = V2RayCrypto.crc32(block, 0, 12);
        block[12] = (byte) (crc >>> 24);
        block[13] = (byte) (crc >>> 16);
        block[14] = (byte) (crc >>> 8);
        block[15] = (byte) crc;
        return V2RayCrypto.aesBlock(V2RayCrypto.vmessKdf16(cmdKey, bytes("AES Auth ID Encryption")), block);
    }

    /** ChaCha20-Poly1305 in VMess takes a 32-byte key made of the 16-byte one: MD5 of it, then MD5 of that. */
    static byte[] vmessChachaKey(byte[] key) {
        byte[] first = V2RayCrypto.digest("MD5", key);
        return V2RayCrypto.concat(first, V2RayCrypto.digest("MD5", first));
    }

    /** VMess's body nonce for chunk [count]: the count big-endian, then bytes 2 to 12 of the IV. */
    static byte[] vmessNonce(byte[] iv, int count) {
        byte[] nonce = java.util.Arrays.copyOf(iv, 12);
        nonce[0] = (byte) (count >> 8);
        nonce[1] = (byte) count;
        return nonce;
    }

    static V2RayCrypto.Aead vmessAead(int security, byte[] key) throws GeneralSecurityException {
        return security == VMESS_CHACHA
                ? new V2RayCrypto.Aead(V2RayCrypto.Aead.CHACHA, vmessChachaKey(key))
                : new V2RayCrypto.Aead(V2RayCrypto.Aead.AES_GCM, key);
    }

    /** VMess's request body: each chunk a masked size, then the payload, sealed unless security is none. */
    static final class VmessOut extends OutputStream {
        private final OutputStream wire;
        private final int security;
        private final boolean raw;
        private final V2RayCrypto.Aead aead;
        private final byte[] iv;
        private final V2RayCrypto.Shake128 masks;
        private int count;

        VmessOut(OutputStream wire, int security, boolean raw, byte[] key, byte[] iv) throws GeneralSecurityException {
            this.wire = wire;
            this.security = security;
            this.raw = raw;
            this.aead = security == VMESS_NONE ? null : vmessAead(security, key);
            this.iv = iv;
            this.masks = new V2RayCrypto.Shake128(iv);
        }

        void first(byte[] header, byte[] early) throws IOException {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream(header.length + early.length + 64);
            bytes.write(header, 0, header.length);
            chunks(bytes, early, 0, early.length);
            wire.write(bytes.toByteArray());
            wire.flush();
        }

        @Override
        public void write(int b) throws IOException {
            write(new byte[]{(byte) b}, 0, 1);
        }

        @Override
        public void write(byte[] data, int offset, int length) throws IOException {
            if (length == 0) return;
            ByteArrayOutputStream bytes = new ByteArrayOutputStream(length + 64);
            chunks(bytes, data, offset, length);
            wire.write(bytes.toByteArray());
        }

        private void chunks(ByteArrayOutputStream into, byte[] data, int offset, int length) throws IOException {
            if (raw) {
                into.write(data, offset, length);
                return;
            }
            for (int at = offset; at < offset + length; ) {
                int n = Math.min(VMESS_CHUNK, offset + length - at);
                byte[] payload;
                try {
                    payload = aead == null ? java.util.Arrays.copyOfRange(data, at, at + n)
                            : aead.seal(vmessNonce(iv, count++), data, at, n, null);
                } catch (GeneralSecurityException failure) {
                    throw new IOException("a chunk couldn't be sealed", failure);
                }
                int size = masks.nextShort() ^ payload.length;
                into.write(size >> 8);
                into.write(size);
                into.write(payload, 0, payload.length);
                at += n;
            }
        }

        @Override
        public void flush() throws IOException {
            wire.flush();
        }

        @Override
        public void close() throws IOException {
            wire.close();
        }
    }

    /** VMess's response: its sealed header first, checked against the request, then the body's chunks. */
    static final class VmessIn extends ChunkIn {
        private final int security;
        private final boolean raw;
        private final byte[] key;
        private final byte[] iv;
        private final int check;
        private V2RayCrypto.Aead aead;
        private V2RayCrypto.Shake128 masks;
        private int count;

        VmessIn(InputStream wire, int security, boolean raw, byte[] key, byte[] iv, int check) {
            super(wire);
            this.security = security;
            this.raw = raw;
            this.key = key;
            this.iv = iv;
            this.check = check;
        }

        @Override
        byte[] next() throws IOException {
            try {
                if (masks == null) {
                    if (!header()) return null;
                    masks = new V2RayCrypto.Shake128(iv);
                    if (security != VMESS_NONE) aead = vmessAead(security, key);
                }
                if (raw) {
                    byte[] some = new byte[8192];
                    int n = wire.read(some);
                    return n < 0 ? null : java.util.Arrays.copyOf(some, n);
                }
                byte[] sizeBytes = new byte[2];
                if (!readFully(wire, sizeBytes, true)) return null;
                int size = (masks.nextShort() ^ ((sizeBytes[0] & 0xff) << 8 | (sizeBytes[1] & 0xff))) & 0xffff;
                byte[] chunk = new byte[size];
                readFully(wire, chunk, false);
                byte[] payload = aead == null ? chunk : aead.open(vmessNonce(iv, count++), chunk, 0, chunk.length, null);
                // An empty chunk is the server's end of the stream.
                return payload.length == 0 ? null : payload;
            } catch (GeneralSecurityException failure) {
                throw new IOException("a chunk didn't open", failure);
            }
        }

        private boolean header() throws IOException, GeneralSecurityException {
            byte[] sealedLength = new byte[2 + V2RayCrypto.Aead.TAG];
            if (!readFully(wire, sealedLength, true)) return false;
            byte[] lengthKey = V2RayCrypto.vmessKdf16(key, bytes("AEAD Resp Header Len Key"));
            byte[] lengthIv = cut(V2RayCrypto.vmessKdf(iv, bytes("AEAD Resp Header Len IV")), 12);
            byte[] length = new V2RayCrypto.Aead(V2RayCrypto.Aead.AES_GCM, lengthKey)
                    .open(lengthIv, sealedLength, 0, sealedLength.length, null);
            byte[] sealed = new byte[((length[0] & 0xff) << 8 | (length[1] & 0xff)) + V2RayCrypto.Aead.TAG];
            readFully(wire, sealed, false);
            byte[] headerKey = V2RayCrypto.vmessKdf16(key, bytes("AEAD Resp Header Key"));
            byte[] headerIv = cut(V2RayCrypto.vmessKdf(iv, bytes("AEAD Resp Header IV")), 12);
            byte[] header = new V2RayCrypto.Aead(V2RayCrypto.Aead.AES_GCM, headerKey).open(headerIv, sealed, 0, sealed.length, null);
            if (header.length < 4 || (header[0] & 0xff) != check) throw new IOException("the response isn't for this request");
            return true;
        }
    }

    // ---- VLESS and Trojan -------------------------------------------------------------------------

    private static Tunnel vless(V2RayLinks.Server server, Wire wire, Target target, byte[] early) throws IOException {
        byte[] id = V2RayCrypto.uuid(server.secret);
        if (id == null) throw new IOException("not an id");
        ByteArrayOutputStream request = new ByteArrayOutputStream(64 + early.length);
        request.write(0);
        request.write(id, 0, 16);
        request.write(0);
        request.write(1);
        byte[] address = target.portFirst();
        request.write(address, 0, address.length);
        request.write(early, 0, early.length);
        wire.out.write(request.toByteArray());
        wire.out.flush();
        return new Tunnel(new VlessIn(wire.in), wire.out, wire);
    }

    /** VLESS answers with its version and addons before the data, which are read past. */
    static final class VlessIn extends ChunkIn {
        private boolean started;

        VlessIn(InputStream wire) {
            super(wire);
        }

        @Override
        byte[] next() throws IOException {
            if (!started) {
                byte[] head = new byte[2];
                if (!readFully(wire, head, true)) return null;
                if (head[0] != 0) throw new IOException("not a VLESS answer");
                readFully(wire, new byte[head[1] & 0xff], false);
                started = true;
            }
            byte[] some = new byte[8192];
            int n = wire.read(some);
            return n < 0 ? null : java.util.Arrays.copyOf(some, n);
        }
    }

    private static Tunnel trojan(V2RayLinks.Server server, Wire wire, Target target, byte[] early) throws IOException {
        byte[] password = V2RayCrypto.hex(V2RayCrypto.digest("SHA-224", server.secret.getBytes(StandardCharsets.UTF_8)))
                .getBytes(StandardCharsets.US_ASCII);
        byte[] address = target.socks();
        ByteArrayOutputStream request = new ByteArrayOutputStream(80 + address.length + early.length);
        request.write(password, 0, password.length);
        request.write(CRLF, 0, 2);
        request.write(1);
        request.write(address, 0, address.length);
        request.write(CRLF, 0, 2);
        request.write(early, 0, early.length);
        wire.out.write(request.toByteArray());
        wire.out.flush();
        return new Tunnel(wire.in, wire.out, wire);
    }

    // ---- Shared -------------------------------------------------------------------------------------

    /** A stream read a chunk at a time from [wire]; {@link #next} gives the next one, or null at the end. */
    abstract static class ChunkIn extends InputStream {
        final InputStream wire;
        private byte[] chunk = new byte[0];
        private int at;
        private boolean ended;

        ChunkIn(InputStream wire) {
            this.wire = wire;
        }

        abstract byte[] next() throws IOException;

        @Override
        public int read() throws IOException {
            byte[] one = new byte[1];
            int n = read(one, 0, 1);
            return n < 0 ? -1 : one[0] & 0xff;
        }

        @Override
        public int read(byte[] into, int offset, int length) throws IOException {
            if (length == 0) return 0;
            while (at == chunk.length) {
                if (ended) return -1;
                byte[] more = next();
                if (more == null) {
                    ended = true;
                    return -1;
                }
                chunk = more;
                at = 0;
            }
            int n = Math.min(length, chunk.length - at);
            System.arraycopy(chunk, at, into, offset, n);
            at += n;
            return n;
        }

        @Override
        public int available() {
            return chunk.length - at;
        }

        @Override
        public void close() throws IOException {
            wire.close();
        }
    }

    /**
     * Fills [into] from [in]. With [endAllowed], the stream ending before the first byte is a clean
     * end and gives false; ending anywhere else is an error.
     */
    static boolean readFully(InputStream in, byte[] into, boolean endAllowed) throws IOException {
        int at = 0;
        while (at < into.length) {
            int n = in.read(into, at, into.length - at);
            if (n < 0) {
                if (at == 0 && endAllowed) return false;
                throw new EOFException("cut short");
            }
            at += n;
        }
        return true;
    }

    private static byte[] bytes(String text) {
        return text.getBytes(StandardCharsets.US_ASCII);
    }

    private static byte[] cut(byte[] bytes, int length) {
        return java.util.Arrays.copyOf(bytes, length);
    }
}
