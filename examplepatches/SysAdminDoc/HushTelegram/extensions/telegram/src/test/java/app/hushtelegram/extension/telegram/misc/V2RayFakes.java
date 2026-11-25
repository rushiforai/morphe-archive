/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.KeyStore;
import java.security.MessageDigest;
import java.security.Signature;
import java.security.cert.Certificate;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.security.spec.ECGenParameterSpec;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.zip.CRC32;
import javax.crypto.Cipher;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.ExtendedSSLSession;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SNIHostName;
import javax.net.ssl.SNIServerName;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;

/**
 * Servers for the V2Ray-style tests, written from each protocol's own description rather than from
 * {@link V2RayTunnels}: Shadowsocks AEAD (shadowsocks.org's AEAD page), VMess with its AEAD header
 * (v2fly's proxy/vmess/aead and encoding/server.go), VLESS (XTLS's VLESS page) and Trojan
 * (trojan-gfw's protocol page). Each runs over TCP or a WebSocket, with or without TLS under a
 * certificate made here. The key derivations they share with the client are the ones
 * V2RayCryptoTest holds to known answers; the sealing is the JDK's own.
 */
final class V2RayFakes {
    private static final String WS_GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";

    private V2RayFakes() {
    }

    /** What one connection to a fake asked for and sent, kept once it has ended. */
    static final class Heard {
        int type;
        byte[] address = new byte[0];
        int port;
        /** The WebSocket upgrade's path and Host header. */
        String path;
        String host;
        /** The name TLS asked for, and the protocol ALPN settled on. */
        String sni;
        String alpn;
        int pongs;
        int vmessSecurity = -1;
        int vmessOptions = -1;
        /** What went wrong before the data, null when the request read as it should. */
        Throwable failure;
        private final ByteArrayOutputStream data = new ByteArrayOutputStream();

        synchronized void got(byte[] bytes, int length) {
            data.write(bytes, 0, length);
        }

        synchronized byte[] data() {
            return data.toByteArray();
        }

        synchronized void ponged() {
            pongs++;
        }
    }

    /** What's behind the server: what Telegram's connection reached. */
    interface Destination {
        void serve(Heard heard, InputStream in, OutputStream out) throws IOException;
    }

    /** Sends back all it gets, until the other side ends. */
    static void echo(Heard heard, InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[8192];
        try {
            int n;
            while ((n = in.read(buffer)) >= 0) {
                if (n == 0) continue;
                heard.got(buffer, n);
                out.write(buffer, 0, n);
                out.flush();
            }
        } catch (IOException ended) {
            // A client that closed with something unread resets the connection: that's its end too.
        }
    }

    /**
     * Reads the [first] bytes the client sent, says [text] and ends the stream. Reading first matters:
     * a socket closed with bytes unread resets the connection, and a reset can drop what was said.
     */
    static Destination says(int first, String text) {
        return (heard, in, out) -> {
            byte[] sent = readN(in, first);
            heard.got(sent, sent.length);
            out.write(text.getBytes(StandardCharsets.US_ASCII));
            out.flush();
        };
    }

    // ---- The certificate ----------------------------------------------------------------------

    /** A self-signed certificate for hush.test and 127.0.0.1, made once a run, so no key sits in the source. */
    static final class TestCert {
        static final String NAME = "hush.test";
        private static TestCert made;
        private final SSLContext server;
        private final TrustManager[] trust;

        static synchronized TestCert get() throws GeneralSecurityException, IOException {
            if (made == null) made = new TestCert();
            return made;
        }

        private TestCert() throws GeneralSecurityException, IOException {
            // No provider named: under Robolectric SunEC's generator can't read its own default curve.
            KeyPairGenerator generator = KeyPairGenerator.getInstance("EC");
            generator.initialize(new ECGenParameterSpec("secp256r1"));
            KeyPair pair = generator.generateKeyPair();
            byte[] algorithm = der(0x30, oid(1, 2, 840, 10045, 4, 3, 2));
            byte[] name = der(0x30, der(0x31, der(0x30, oid(2, 5, 4, 3), der(0x0c, ascii("HushTelegram test")))));
            byte[] validity = der(0x30, der(0x17, ascii("250101000000Z")), der(0x17, ascii("491231235959Z")));
            byte[] altNames = der(0x30, der(0x82, ascii(NAME)), der(0x87, new byte[]{127, 0, 0, 1}));
            byte[] extensions = der(0xa3, der(0x30, der(0x30, oid(2, 5, 29, 17), der(0x04, altNames))));
            byte[] tbs = der(0x30, der(0xa0, der(0x02, new byte[]{2})), der(0x02, new byte[]{0x48, 0x54}),
                    algorithm, name, validity, name, pair.getPublic().getEncoded(), extensions);
            Signature signer = Signature.getInstance("SHA256withECDSA");
            signer.initSign(pair.getPrivate());
            signer.update(tbs);
            byte[] signature = signer.sign();
            byte[] bits = new byte[signature.length + 1];
            System.arraycopy(signature, 0, bits, 1, signature.length);
            X509Certificate certificate = (X509Certificate) CertificateFactory.getInstance("X.509")
                    .generateCertificate(new ByteArrayInputStream(der(0x30, tbs, algorithm, der(0x03, bits))));

            char[] password = "test".toCharArray();
            KeyStore keys = KeyStore.getInstance("PKCS12");
            keys.load(null, null);
            keys.setKeyEntry("server", pair.getPrivate(), password, new Certificate[]{certificate});
            KeyManagerFactory keyManagers = KeyManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
            keyManagers.init(keys, password);
            // Conscrypt, as on the client: Robolectric puts it first, and SunJSSE's EC code then can't name the curve.
            server = SSLContext.getInstance("TLS");
            server.init(keyManagers.getKeyManagers(), null, null);

            KeyStore anchors = KeyStore.getInstance("PKCS12");
            anchors.load(null, null);
            anchors.setCertificateEntry("anchor", certificate);
            TrustManagerFactory trustManagers = TrustManagerFactory.getInstance("PKIX");
            trustManagers.init(anchors);
            trust = trustManagers.getTrustManagers();
        }

        /** What the client trusts: this certificate alone. */
        TrustManager[] trust() {
            return trust;
        }

        SSLContext server() {
            return server;
        }

        private static byte[] der(int tag, byte[]... parts) {
            ByteArrayOutputStream body = new ByteArrayOutputStream();
            for (byte[] part : parts) body.write(part, 0, part.length);
            byte[] content = body.toByteArray();
            ByteArrayOutputStream out = new ByteArrayOutputStream(content.length + 4);
            out.write(tag);
            int n = content.length;
            if (n < 128) {
                out.write(n);
            } else if (n < 256) {
                out.write(0x81);
                out.write(n);
            } else {
                out.write(0x82);
                out.write(n >> 8);
                out.write(n);
            }
            out.write(content, 0, n);
            return out.toByteArray();
        }

        private static byte[] oid(int... arcs) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            out.write(40 * arcs[0] + arcs[1]);
            for (int i = 2; i < arcs.length; i++) {
                int arc = arcs[i];
                int shift = 28;
                while (shift > 0 && (arc >>> shift) == 0) shift -= 7;
                for (; shift > 0; shift -= 7) out.write(0x80 | ((arc >>> shift) & 0x7f));
                out.write(arc & 0x7f);
            }
            return der(0x06, out.toByteArray());
        }
    }

    // ---- A fake server ------------------------------------------------------------------------

    /** One fake server on 127.0.0.1, taking connections until it's closed. */
    static final class Fake implements Closeable {
        final String kind;
        final String secret;
        /** Shadowsocks: its cipher. A VMess server takes whichever its client asks for. */
        final String cipher;
        final boolean tls;
        final boolean ws;
        volatile Destination destination = V2RayFakes::echo;
        /** WebSocket: answer the upgrade with an accept key that doesn't match. */
        volatile boolean wrongAccept;
        /** WebSocket: answer the upgrade with something other than 101. */
        volatile boolean refuseUpgrade;
        /** VMess: answer with a check byte other than the one the request sent. */
        volatile boolean wrongCheck;
        /** What went wrong on this side most recently, so a client that only saw the connection drop can say why. */
        volatile Exception lastFailure;
        private final LinkedBlockingQueue<Heard> ended = new LinkedBlockingQueue<>();
        private final List<Socket> sockets = new CopyOnWriteArrayList<>();
        private final ServerSocket listening;

        Fake(String kind, String secret, String cipher, boolean tls, boolean ws) throws IOException {
            this.kind = kind;
            this.secret = secret;
            this.cipher = cipher;
            this.tls = tls;
            this.ws = ws;
            listening = new ServerSocket(0, 50, InetAddress.getByAddress(new byte[]{127, 0, 0, 1}));
            Thread accepting = new Thread(this::accept, "fake-" + kind);
            accepting.setDaemon(true);
            accepting.start();
        }

        int port() {
            return listening.getLocalPort();
        }

        /** The next connection to end, waiting a while for it. */
        Heard next() throws InterruptedException {
            Heard heard = ended.poll(15, TimeUnit.SECONDS);
            if (heard == null) throw new AssertionError("no connection to the fake " + kind + " server ended");
            return heard;
        }

        /** How many connections have ended and not been taken by {@link #next}. */
        int endedCount() {
            return ended.size();
        }

        @Override
        public void close() {
            closeQuietly(listening);
            for (Socket socket : sockets) closeQuietly(socket);
        }

        private void accept() {
            while (!listening.isClosed()) {
                Socket socket;
                try {
                    socket = listening.accept();
                } catch (IOException closed) {
                    return;
                }
                sockets.add(socket);
                Thread serving = new Thread(() -> serve(socket), "fake-" + kind + "-connection");
                serving.setDaemon(true);
                serving.start();
            }
        }

        private void serve(Socket socket) {
            Heard heard = new Heard();
            try {
                socket.setSoTimeout(15_000);
                Socket open = tls ? tls(socket, heard) : socket;
                InputStream in = open.getInputStream();
                OutputStream out = open.getOutputStream();
                if (ws) {
                    if (!upgrade(in, out, heard)) return;
                    FrameIn frames = new FrameIn(in, heard);
                    out = new FrameOut(out, frames);
                    in = frames;
                }
                switch (kind) {
                    case V2RayLinks.SS:
                        shadowsocks(in, out, heard);
                        break;
                    case V2RayLinks.VMESS:
                        vmess(in, out, heard);
                        break;
                    case V2RayLinks.VLESS:
                        vless(in, out, heard);
                        break;
                    case V2RayLinks.TROJAN:
                        trojan(in, out, heard);
                        break;
                    default:
                        throw new IOException("no such kind");
                }
            } catch (IOException | GeneralSecurityException | RuntimeException failure) {
                heard.failure = failure;
                lastFailure = failure;
            } finally {
                closeQuietly(socket);
                ended.add(heard);
            }
        }

        /** The destination, then the end of the stream as the protocol marks it. */
        private void then(Heard heard, InputStream in, OutputStream out) throws IOException {
            destination.serve(heard, in, out);
            try {
                out.close();
            } catch (IOException gone) {
                // The client may have gone first.
            }
        }

        // ---- TLS and WebSocket ----------------------------------------------------------------

        private Socket tls(Socket raw, Heard heard) throws IOException, GeneralSecurityException {
            // The layered form android.jar has: the host and port only name the peer, and server mode follows.
            SSLSocket tls = (SSLSocket) TestCert.get().server().getSocketFactory()
                    .createSocket(raw, raw.getInetAddress().getHostAddress(), raw.getPort(), true);
            tls.setUseClientMode(false);
            SSLParameters parameters = tls.getSSLParameters();
            parameters.setApplicationProtocols(new String[]{"h2", "http/1.1"});
            tls.setSSLParameters(parameters);
            tls.startHandshake();
            SSLSession session = tls.getSession();
            if (session instanceof ExtendedSSLSession) {
                for (SNIServerName name : ((ExtendedSSLSession) session).getRequestedServerNames()) {
                    if (name instanceof SNIHostName) heard.sni = ((SNIHostName) name).getAsciiName();
                }
            }
            heard.alpn = tls.getApplicationProtocol();
            return tls;
        }

        /** RFC 6455's opening handshake, server side. False when this fake answers it wrong on purpose. */
        private boolean upgrade(InputStream in, OutputStream out, Heard heard) throws IOException, GeneralSecurityException {
            String[] lines = head(in).split("\r\n");
            String[] request = lines[0].split(" ");
            if (request.length != 3 || !"GET".equals(request[0]) || !"HTTP/1.1".equals(request[2])) {
                throw new IOException("not an upgrade request");
            }
            heard.path = request[1];
            String key = null;
            String upgrade = null;
            String version = null;
            for (int i = 1; i < lines.length; i++) {
                int colon = lines[i].indexOf(':');
                if (colon <= 0) continue;
                String name = lines[i].substring(0, colon).trim().toLowerCase(Locale.ROOT);
                String value = lines[i].substring(colon + 1).trim();
                if (name.equals("host")) heard.host = value;
                if (name.equals("sec-websocket-key")) key = value;
                if (name.equals("upgrade")) upgrade = value;
                if (name.equals("sec-websocket-version")) version = value;
            }
            if (key == null || !"websocket".equalsIgnoreCase(upgrade) || !"13".equals(version)) {
                throw new IOException("not a WebSocket upgrade");
            }
            if (refuseUpgrade) {
                out.write("HTTP/1.1 404 Not Found\r\nContent-Length: 0\r\n\r\n".getBytes(StandardCharsets.US_ASCII));
                out.flush();
                return false;
            }
            String accept = Base64.getEncoder().encodeToString(MessageDigest.getInstance("SHA-1")
                    .digest((key + WS_GUID).getBytes(StandardCharsets.US_ASCII)));
            if (wrongAccept) accept = Base64.getEncoder().encodeToString(new byte[20]);
            out.write(("HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\nConnection: Upgrade\r\n"
                    + "Sec-WebSocket-Accept: " + accept + "\r\n\r\n").getBytes(StandardCharsets.US_ASCII));
            out.flush();
            return !wrongAccept;
        }

        // ---- Trojan and VLESS -----------------------------------------------------------------

        /** hex(SHA224(password)), CRLF, command 1, a SOCKS5 address, CRLF, then the data. */
        private void trojan(InputStream in, OutputStream out, Heard heard) throws IOException, GeneralSecurityException {
            String expected = hex(MessageDigest.getInstance("SHA-224").digest(secret.getBytes(StandardCharsets.UTF_8)));
            if (!expected.equals(new String(readN(in, 56), StandardCharsets.US_ASCII))) throw new IOException("wrong password");
            crlf(in);
            if (readByte(in) != 1) throw new IOException("not CONNECT");
            socksAddress(in, heard);
            crlf(in);
            then(heard, in, out);
        }

        /** Version 0, the id, no addons, command 1, port, address; answered with version 0 and no addons. */
        private void vless(InputStream in, OutputStream out, Heard heard) throws IOException {
            if (readByte(in) != 0) throw new IOException("not version 0");
            if (!Arrays.equals(readN(in, 16), V2RayCrypto.uuid(secret))) throw new IOException("wrong id");
            int addons = readByte(in);
            if (addons != 0) throw new IOException("addons with no flow");
            if (readByte(in) != 1) throw new IOException("not TCP");
            portFirstAddress(in, heard);
            out.write(new byte[]{0, 0});
            out.flush();
            then(heard, in, out);
        }

        // ---- Shadowsocks AEAD -----------------------------------------------------------------

        private void shadowsocks(InputStream in, OutputStream out, Heard heard) throws IOException {
            int length = "aes-128-gcm".equals(cipher) ? 16 : 32;
            byte[] key = V2RayCrypto.passwordKey(secret, length);
            byte[] salt = readN(in, length);
            InputStream plain = new SsIn(in, cipher, subkey(key, salt));
            socksAddress(plain, heard);
            then(heard, plain, new SsOut(out, cipher, key));
        }

        private static byte[] subkey(byte[] key, byte[] salt) {
            return V2RayCrypto.hkdfSha1(key, salt, "ss-subkey".getBytes(StandardCharsets.US_ASCII), key.length);
        }

        /** [salt][sealed length][sealed payload]..., each sealing with the next little-endian nonce. */
        private static final class SsIn extends Chunks {
            private final String cipher;
            private final byte[] subkey;
            private final byte[] nonce = new byte[12];

            SsIn(InputStream wire, String cipher, byte[] subkey) {
                super(wire);
                this.cipher = cipher;
                this.subkey = subkey;
            }

            @Override
            byte[] next() throws IOException {
                byte[] sealedLength = readOrEnd(wire, 2 + 16);
                if (sealedLength == null) return null;
                byte[] length = open(cipher, subkey, bump(nonce), sealedLength, null);
                int size = (length[0] & 0xff) << 8 | (length[1] & 0xff);
                if (size > 0x3FFF) throw new IOException("a chunk over the limit");
                return open(cipher, subkey, bump(nonce), readN(wire, size + 16), null);
            }
        }

        private static final class SsOut extends OutputStream {
            private final OutputStream wire;
            private final String cipher;
            private final byte[] key;
            private byte[] subkey;
            private final byte[] nonce = new byte[12];

            SsOut(OutputStream wire, String cipher, byte[] key) {
                this.wire = wire;
                this.cipher = cipher;
                this.key = key;
            }

            @Override
            public void write(int b) throws IOException {
                write(new byte[]{(byte) b}, 0, 1);
            }

            @Override
            public void write(byte[] data, int offset, int length) throws IOException {
                if (subkey == null) {
                    byte[] salt = new byte[key.length];
                    new java.security.SecureRandom().nextBytes(salt);
                    subkey = subkey(key, salt);
                    wire.write(salt);
                }
                for (int at = offset; at < offset + length; ) {
                    int n = Math.min(0x3FFF, offset + length - at);
                    wire.write(seal(cipher, subkey, bump(nonce), new byte[]{(byte) (n >> 8), (byte) n}, null));
                    wire.write(seal(cipher, subkey, bump(nonce), Arrays.copyOfRange(data, at, at + n), null));
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

        // ---- VMess ----------------------------------------------------------------------------

        /** v2fly's AEAD request: AuthID, sealed length, connection nonce, sealed header, then the body. */
        private void vmess(InputStream in, OutputStream out, Heard heard) throws IOException, GeneralSecurityException {
            byte[] cmdKey = V2RayCrypto.vmessCmdKey(V2RayCrypto.uuid(secret));
            byte[] authId = readN(in, 16);
            Cipher ecb = Cipher.getInstance("AES/ECB/NoPadding");
            ecb.init(Cipher.DECRYPT_MODE, new SecretKeySpec(kdf16(cmdKey, "AES Auth ID Encryption"), "AES"));
            byte[] plainId = ecb.doFinal(authId);
            CRC32 crc = new CRC32();
            crc.update(plainId, 0, 12);
            if ((int) crc.getValue() != int32(plainId, 12)) throw new IOException("not this user's AuthID");
            long seconds = (long) int32(plainId, 0) << 32 | (int32(plainId, 4) & 0xffffffffL);
            if (Math.abs(System.currentTimeMillis() / 1000L - seconds) > 120) throw new IOException("an AuthID out of time");
            byte[] sealedLength = readN(in, 2 + 16);
            byte[] connection = readN(in, 8);
            byte[] length = open("aes", kdf16(cmdKey, "VMess Header AEAD Key_Length", authId, connection),
                    kdf12(cmdKey, "VMess Header AEAD Nonce_Length", authId, connection), sealedLength, authId);
            byte[] header = open("aes", kdf16(cmdKey, "VMess Header AEAD Key", authId, connection),
                    kdf12(cmdKey, "VMess Header AEAD Nonce", authId, connection),
                    readN(in, ((length[0] & 0xff) << 8 | (length[1] & 0xff)) + 16), authId);
            if (V2RayCrypto.fnv1a(header, 0, header.length - 4) != int32(header, header.length - 4)) {
                throw new IOException("the header's hash doesn't match");
            }
            if (header[0] != 1) throw new IOException("not version 1");
            byte[] iv = Arrays.copyOfRange(header, 1, 17);
            byte[] key = Arrays.copyOfRange(header, 17, 33);
            int check = header[33] & 0xff;
            int options = header[34] & 0xff;
            int padding = (header[35] & 0xff) >> 4;
            int security = header[35] & 0x0f;
            if (header[36] != 0 || header[37] != 1) throw new IOException("not TCP");
            ByteArrayInputStream address = new ByteArrayInputStream(header, 38, header.length - 38 - 4);
            portFirstAddress(address, heard);
            if (address.available() != padding) throw new IOException("the padding doesn't add up");
            heard.vmessSecurity = security;
            heard.vmessOptions = options;
            boolean chunked;
            if (options == 0x05 && (security == 3 || security == 4 || security == 5)) {
                chunked = true;
            } else if (options == 0 && security == 5) {
                chunked = false;
            } else {
                throw new IOException("options " + options + " with security " + security);
            }
            byte[] responseKey = Arrays.copyOf(MessageDigest.getInstance("SHA-256").digest(key), 16);
            byte[] responseIv = Arrays.copyOf(MessageDigest.getInstance("SHA-256").digest(iv), 16);
            byte[] answer = {(byte) (wrongCheck ? check ^ 0x5a : check), 0, 0, 0};
            out.write(seal("aes", kdf16(responseKey, "AEAD Resp Header Len Key"), kdf12(responseIv, "AEAD Resp Header Len IV"),
                    new byte[]{0, (byte) answer.length}, null));
            out.write(seal("aes", kdf16(responseKey, "AEAD Resp Header Key"), kdf12(responseIv, "AEAD Resp Header IV"),
                    answer, null));
            out.flush();
            InputStream body = chunked ? new VmessIn(in, security, key, iv) : in;
            then(heard, body, chunked ? new VmessOut(out, security, responseKey, responseIv) : out);
        }

        /** Each chunk: a two-byte size masked by SHAKE128 of the IV, then the payload, sealed unless security is none. */
        private static final class VmessIn extends Chunks {
            private final int security;
            private final byte[] key;
            private final byte[] iv;
            private final V2RayCrypto.Shake128 masks;
            private int count;

            VmessIn(InputStream wire, int security, byte[] key, byte[] iv) {
                super(wire);
                this.security = security;
                this.key = key;
                this.iv = iv;
                masks = new V2RayCrypto.Shake128(iv);
            }

            @Override
            byte[] next() throws IOException {
                byte[] size = readOrEnd(wire, 2);
                if (size == null) return null;
                int length = (masks.nextShort() ^ ((size[0] & 0xff) << 8 | (size[1] & 0xff))) & 0xffff;
                byte[] chunk = readN(wire, length);
                byte[] payload = security == 5 ? chunk : open(vmessCipher(security), vmessKey(security, key),
                        vmessNonce(iv, count++), chunk, null);
                return payload.length == 0 ? null : payload;
            }
        }

        private static final class VmessOut extends OutputStream {
            private final OutputStream wire;
            private final int security;
            private final byte[] key;
            private final byte[] iv;
            private final V2RayCrypto.Shake128 masks;
            private int count;

            VmessOut(OutputStream wire, int security, byte[] key, byte[] iv) {
                this.wire = wire;
                this.security = security;
                this.key = key;
                this.iv = iv;
                masks = new V2RayCrypto.Shake128(iv);
            }

            @Override
            public void write(int b) throws IOException {
                write(new byte[]{(byte) b}, 0, 1);
            }

            @Override
            public void write(byte[] data, int offset, int length) throws IOException {
                for (int at = offset; at < offset + length; ) {
                    int n = Math.min(4000, offset + length - at);
                    chunk(Arrays.copyOfRange(data, at, at + n));
                    at += n;
                }
            }

            private void chunk(byte[] plain) throws IOException {
                byte[] payload = security == 5 ? plain : seal(vmessCipher(security), vmessKey(security, key),
                        vmessNonce(iv, count++), plain, null);
                int size = masks.nextShort() ^ payload.length;
                wire.write(new byte[]{(byte) (size >> 8), (byte) size});
                wire.write(payload);
            }

            @Override
            public void flush() throws IOException {
                wire.flush();
            }

            /** An empty chunk marks the end, then the connection closes. */
            @Override
            public void close() throws IOException {
                chunk(new byte[0]);
                wire.flush();
                wire.close();
            }
        }

        private static String vmessCipher(int security) {
            return security == 4 ? "chacha" : "aes";
        }

        /** ChaCha20-Poly1305 in VMess keys with MD5(key) then MD5 of that. */
        private static byte[] vmessKey(int security, byte[] key) {
            if (security != 4) return key;
            byte[] first = md5(key);
            byte[] both = Arrays.copyOf(first, 32);
            System.arraycopy(md5(first), 0, both, 16, 16);
            return both;
        }

        /** The chunk count big-endian in two bytes, then bytes 2 to 12 of the IV. */
        private static byte[] vmessNonce(byte[] iv, int count) {
            byte[] nonce = Arrays.copyOf(iv, 12);
            nonce[0] = (byte) (count >> 8);
            nonce[1] = (byte) count;
            return nonce;
        }

        private static byte[] kdf16(byte[] key, String... path) {
            byte[][] parts = new byte[path.length][];
            for (int i = 0; i < path.length; i++) parts[i] = ascii(path[i]);
            return Arrays.copyOf(V2RayCrypto.vmessKdf(key, parts), 16);
        }

        private static byte[] kdf16(byte[] key, String path, byte[] authId, byte[] nonce) {
            return Arrays.copyOf(V2RayCrypto.vmessKdf(key, ascii(path), authId, nonce), 16);
        }

        private static byte[] kdf12(byte[] key, String path, byte[] authId, byte[] nonce) {
            return Arrays.copyOf(V2RayCrypto.vmessKdf(key, ascii(path), authId, nonce), 12);
        }

        private static byte[] kdf12(byte[] key, String path) {
            return Arrays.copyOf(V2RayCrypto.vmessKdf(key, ascii(path)), 12);
        }
    }

    // ---- WebSocket frames, server side --------------------------------------------------------

    /** A client's frames: masked, as RFC 6455 has them. A pong is counted, a close ends the stream. */
    static final class FrameIn extends Chunks {
        /** What {@link #frame} gives for a frame with no data: a pong or an empty data frame. */
        private static final byte[] NOTHING = new byte[0];
        private final Heard heard;
        /** Data read while waiting for the pong, given out by {@link #next} before anything newer. */
        private final ArrayDeque<byte[]> kept = new ArrayDeque<>();
        private boolean closed;

        FrameIn(InputStream wire, Heard heard) {
            super(wire);
            this.heard = heard;
        }

        @Override
        byte[] next() throws IOException {
            while (true) {
                if (!kept.isEmpty()) return kept.poll();
                byte[] one = frame();
                if (one != NOTHING) return one;
            }
        }

        /**
         * Reads on until the client has answered the ping, keeping any data for {@link #next}. A pong
         * left unread when the server closes makes Windows reset the connection, and the reset throws
         * away whatever the client hasn't read yet, the end of the stream included.
         */
        void untilPonged() throws IOException {
            while (heard.pongs == 0) {
                byte[] one = frame();
                if (one == null) return;
                if (one != NOTHING) kept.add(one);
            }
        }

        /** One frame: its data, {@link #NOTHING}, or null once the client has closed. */
        private byte[] frame() throws IOException {
            if (closed) return null;
            byte[] head = readOrEnd(wire, 2);
            if (head == null) {
                closed = true;
                return null;
            }
            if ((head[1] & 0x80) == 0) throw new IOException("a client frame came unmasked");
            long length = head[1] & 0x7f;
            if (length == 126) {
                byte[] more = readN(wire, 2);
                length = (more[0] & 0xff) << 8 | (more[1] & 0xff);
            } else if (length == 127) {
                byte[] more = readN(wire, 8);
                length = 0;
                for (byte b : more) length = length << 8 | (b & 0xff);
            }
            byte[] mask = readN(wire, 4);
            byte[] payload = readN(wire, (int) length);
            for (int i = 0; i < payload.length; i++) payload[i] ^= mask[i & 3];
            switch (head[0] & 0x0f) {
                case 0x0:
                case 0x2:
                    return payload.length > 0 ? payload : NOTHING;
                case 0xA:
                    heard.ponged();
                    return NOTHING;
                case 0x8:
                    closed = true;
                    return null;
                default:
                    throw new IOException("a frame of kind " + (head[0] & 0x0f));
            }
        }
    }

    /** A server's frames, unmasked. A ping goes first, so the client has one to answer; a close goes last. */
    static final class FrameOut extends OutputStream {
        private final OutputStream wire;
        /** The same connection's frames, read for the pong before the close. */
        private final FrameIn frames;
        private boolean pinged;

        FrameOut(OutputStream wire, FrameIn frames) {
            this.wire = wire;
            this.frames = frames;
        }

        @Override
        public void write(int b) throws IOException {
            write(new byte[]{(byte) b}, 0, 1);
        }

        @Override
        public void write(byte[] data, int offset, int length) throws IOException {
            if (length == 0) return;
            if (!pinged) {
                pinged = true;
                wire.write(frame(0x9, ascii("anyone there"), 0, 12));
            }
            wire.write(frame(0x2, data, offset, length));
        }

        @Override
        public void flush() throws IOException {
            wire.flush();
        }

        @Override
        public void close() throws IOException {
            if (pinged) frames.untilPonged();
            wire.write(frame(0x8, new byte[]{0x03, (byte) 0xe8}, 0, 2));
            wire.flush();
            wire.close();
        }

        static byte[] frame(int opcode, byte[] data, int offset, int length) {
            ByteArrayOutputStream frame = new ByteArrayOutputStream(length + 10);
            frame.write(0x80 | opcode);
            if (length < 126) {
                frame.write(length);
            } else if (length < 65536) {
                frame.write(126);
                frame.write(length >> 8);
                frame.write(length);
            } else {
                frame.write(127);
                for (int shift = 56; shift >= 0; shift -= 8) frame.write((int) ((long) length >>> shift));
            }
            frame.write(data, offset, length);
            return frame.toByteArray();
        }
    }

    // ---- Shared -------------------------------------------------------------------------------

    /** A stream read a chunk at a time; {@link #next} gives null at the end. */
    abstract static class Chunks extends InputStream {
        final InputStream wire;
        private byte[] chunk = new byte[0];
        private int at;
        private boolean ended;

        Chunks(InputStream wire) {
            this.wire = wire;
        }

        abstract byte[] next() throws IOException;

        @Override
        public int read() throws IOException {
            byte[] one = new byte[1];
            return read(one, 0, 1) < 0 ? -1 : one[0] & 0xff;
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
        public void close() throws IOException {
            wire.close();
        }
    }

    /** A SOCKS5 address: type, address, port. */
    static void socksAddress(InputStream in, Heard heard) throws IOException {
        heard.type = readByte(in);
        switch (heard.type) {
            case 1:
                heard.address = readN(in, 4);
                break;
            case 3:
                heard.address = readN(in, readByte(in));
                break;
            case 4:
                heard.address = readN(in, 16);
                break;
            default:
                throw new IOException("address type " + heard.type);
        }
        heard.port = readByte(in) << 8 | readByte(in);
    }

    /** VMess's and VLESS's address: port, then type 1 IPv4, 2 a name or 3 IPv6. Kept as SOCKS5 numbers them. */
    static void portFirstAddress(InputStream in, Heard heard) throws IOException {
        heard.port = readByte(in) << 8 | readByte(in);
        int type = readByte(in);
        switch (type) {
            case 1:
                heard.type = 1;
                heard.address = readN(in, 4);
                break;
            case 2:
                heard.type = 3;
                heard.address = readN(in, readByte(in));
                break;
            case 3:
                heard.type = 4;
                heard.address = readN(in, 16);
                break;
            default:
                throw new IOException("address type " + type);
        }
    }

    private static String head(InputStream in) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        while (true) {
            bytes.write(readByte(in));
            byte[] so = bytes.toByteArray();
            int n = so.length;
            if (n >= 4 && so[n - 4] == '\r' && so[n - 3] == '\n' && so[n - 2] == '\r' && so[n - 1] == '\n') {
                return new String(so, 0, n - 4, StandardCharsets.ISO_8859_1);
            }
            if (n > 8192) throw new IOException("a head too long");
        }
    }

    private static void crlf(InputStream in) throws IOException {
        if (readByte(in) != '\r' || readByte(in) != '\n') throw new IOException("no CRLF");
    }

    static byte[] readN(InputStream in, int length) throws IOException {
        byte[] bytes = new byte[length];
        int at = 0;
        while (at < length) {
            int n = in.read(bytes, at, length - at);
            if (n < 0) throw new EOFException("cut short");
            at += n;
        }
        return bytes;
    }

    /** [length] bytes, or null when the stream ends before the first. */
    static byte[] readOrEnd(InputStream in, int length) throws IOException {
        int first = in.read();
        if (first < 0) return null;
        byte[] bytes = new byte[length];
        bytes[0] = (byte) first;
        System.arraycopy(readN(in, length - 1), 0, bytes, 1, length - 1);
        return bytes;
    }

    static int readByte(InputStream in) throws IOException {
        int b = in.read();
        if (b < 0) throw new EOFException("cut short");
        return b;
    }

    private static int int32(byte[] bytes, int at) {
        return (bytes[at] & 0xff) << 24 | (bytes[at + 1] & 0xff) << 16 | (bytes[at + 2] & 0xff) << 8 | (bytes[at + 3] & 0xff);
    }

    /** Shadowsocks counts its nonce up as a little-endian number, after each use: this gives the one to use now. */
    private static byte[] bump(byte[] nonce) {
        byte[] now = nonce.clone();
        for (int i = 0; i < nonce.length; i++) {
            if (++nonce[i] != 0) break;
        }
        return now;
    }

    static byte[] seal(String cipher, byte[] key, byte[] nonce, byte[] plain, byte[] aad) throws IOException {
        return aead(Cipher.ENCRYPT_MODE, cipher, key, nonce, plain, aad);
    }

    static byte[] open(String cipher, byte[] key, byte[] nonce, byte[] sealed, byte[] aad) throws IOException {
        return aead(Cipher.DECRYPT_MODE, cipher, key, nonce, sealed, aad);
    }

    /** The JDK's own AES-GCM and ChaCha20-Poly1305, with a 16-byte tag. */
    private static byte[] aead(int mode, String cipher, byte[] key, byte[] nonce, byte[] data, byte[] aad) throws IOException {
        try {
            Cipher aead;
            if (cipher.startsWith("aes")) {
                aead = Cipher.getInstance("AES/GCM/NoPadding");
                aead.init(mode, new SecretKeySpec(key, "AES"), new GCMParameterSpec(128, nonce));
            } else {
                aead = Cipher.getInstance("ChaCha20-Poly1305");
                aead.init(mode, new SecretKeySpec(key, "ChaCha20"), new IvParameterSpec(nonce));
            }
            if (aad != null) aead.updateAAD(aad);
            return aead.doFinal(data);
        } catch (GeneralSecurityException failure) {
            throw new IOException("a seal that doesn't open", failure);
        }
    }

    private static byte[] md5(byte[] data) {
        try {
            return MessageDigest.getInstance("MD5").digest(data);
        } catch (GeneralSecurityException missing) {
            throw new IllegalStateException(missing);
        }
    }

    static byte[] ascii(String text) {
        return text.getBytes(StandardCharsets.US_ASCII);
    }

    static String hex(byte[] bytes) {
        StringBuilder hex = new StringBuilder();
        for (byte b : bytes) hex.append(String.format("%02x", b & 0xff));
        return hex.toString();
    }

    static byte[] unhex(String hex) {
        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < bytes.length; i++) bytes[i] = (byte) Integer.parseInt(hex.substring(i * 2, i * 2 + 2), 16);
        return bytes;
    }

    static void closeQuietly(Closeable closeable) {
        if (closeable == null) return;
        try {
            closeable.close();
        } catch (IOException ignored) {
            // Closing is all that's asked.
        }
    }
}
