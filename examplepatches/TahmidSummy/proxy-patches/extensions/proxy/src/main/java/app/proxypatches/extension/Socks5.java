package app.proxypatches.extension;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.charset.StandardCharsets;

/**
 * Minimal SOCKS5 client (RFC 1928, CONNECT only) with username/password auth (RFC 1929).
 * Destination hostnames are sent to the proxy unresolved (address type 0x03), so DNS for the
 * app's traffic happens on the proxy, not on the device.
 */
final class Socks5 {
    private Socks5() {}

    /** A SOCKS-level failure, with a user-readable message. */
    static class SocksException extends IOException {
        SocksException(String message) { super(message); }
    }

    /** SOCKS5 reply codes 3/4: network/host unreachable. */
    static final class UnreachableException extends SocksException {
        UnreachableException(String message) { super(message); }
    }

    /**
     * Opens a tunnel to host:port through the SOCKS5 proxy in {@code v}. "Host/network
     * unreachable" is retried twice: some SOCKS servers resolve a dual-stack name to IPv6 without
     * having IPv6 connectivity, and succeed when they happen to pick IPv4. (Resolving locally to
     * force IPv4 would leak hostnames to the device's DNS, so we don't.)
     */
    static Socket connect(ProxySettings.Values v, String host, int port) throws IOException {
        UnreachableException last = null;
        for (int attempt = 0; attempt < 3; attempt++) {
            try {
                return connectOnce(v, host, port);
            } catch (UnreachableException e) {
                last = e;
                android.util.Log.i("ProxyPatch", "SOCKS5 retry " + (attempt + 1) + " for " + host + ":" + port
                        + " after: " + e.getMessage());
            }
        }
        throw last;
    }

    private static Socket connectOnce(ProxySettings.Values v, String host, int port) throws IOException {
        Socket s = new Socket();
        boolean ok = false;
        try {
            s.setTcpNoDelay(true);
            s.connect(new InetSocketAddress(v.host, v.port), 15000);
            s.setSoTimeout(30000);
            InputStream rawIn = s.getInputStream();
            DataInputStream in = new DataInputStream(rawIn);
            OutputStream out = s.getOutputStream();

            byte[] user = v.username.getBytes(StandardCharsets.UTF_8);
            byte[] pass = v.password.getBytes(StandardCharsets.UTF_8);
            boolean haveLogin = user.length > 0 || pass.length > 0;
            if (user.length > 255 || pass.length > 255) throw new SocksException("Username or password is too long for SOCKS5 (max 255 bytes).");

            // Greeting: offer "no auth", plus "username/password" if we have a login.
            out.write(haveLogin ? new byte[]{0x05, 0x02, 0x00, 0x02} : new byte[]{0x05, 0x01, 0x00});
            out.flush();
            int ver = in.readUnsignedByte();
            int method = in.readUnsignedByte();
            if (ver != 0x05) throw new SocksException("That server isn't a SOCKS5 proxy (got version " + ver + ").");
            if (method == 0xFF) {
                throw new SocksException(haveLogin
                        ? "The SOCKS5 proxy refused all login methods."
                        : "The SOCKS5 proxy requires a username and password.");
            }
            if (method == 0x02) {
                if (!haveLogin) throw new SocksException("The SOCKS5 proxy requires a username and password.");
                byte[] auth = new byte[3 + user.length + pass.length];
                auth[0] = 0x01;
                auth[1] = (byte) user.length;
                System.arraycopy(user, 0, auth, 2, user.length);
                auth[2 + user.length] = (byte) pass.length;
                System.arraycopy(pass, 0, auth, 3 + user.length, pass.length);
                out.write(auth);
                out.flush();
                in.readUnsignedByte(); // sub-negotiation version
                if (in.readUnsignedByte() != 0x00) throw new SocksException("Wrong SOCKS5 username or password.");
            } else if (method != 0x00) {
                throw new SocksException("The SOCKS5 proxy chose an unsupported login method (" + method + ").");
            }

            // CONNECT request.
            byte[] addr = addressField(host);
            byte[] req = new byte[3 + addr.length + 2];
            req[0] = 0x05;
            req[1] = 0x01; // CONNECT
            req[2] = 0x00;
            System.arraycopy(addr, 0, req, 3, addr.length);
            req[req.length - 2] = (byte) (port >> 8);
            req[req.length - 1] = (byte) port;
            out.write(req);
            out.flush();

            // Reply: VER REP RSV ATYP BND.ADDR BND.PORT
            in.readUnsignedByte();
            int rep = in.readUnsignedByte();
            in.readUnsignedByte();
            int atyp = in.readUnsignedByte();
            int skip = atyp == 0x01 ? 4 : atyp == 0x04 ? 16 : atyp == 0x03 ? in.readUnsignedByte() : -1;
            if (skip < 0) throw new SocksException("Malformed SOCKS5 reply.");
            in.readFully(new byte[skip + 2]);
            if (rep == 0x03 || rep == 0x04) {
                throw new UnreachableException("SOCKS5 proxy couldn't connect to " + host + ":" + port + ": "
                        + replyText(rep) + " (if this keeps happening, the proxy server may lack IPv6; "
                        + "make it prefer IPv4)");
            }
            if (rep != 0x00) throw new SocksException("SOCKS5 proxy couldn't connect to " + host + ":" + port + ": " + replyText(rep));

            s.setSoTimeout(0);
            ok = true;
            return s;
        } finally {
            if (!ok) try { s.close(); } catch (Throwable ignored) {}
        }
    }

    /** ATYP + address. IP literals are sent as-is; names are sent unresolved (no local DNS). */
    private static byte[] addressField(String host) throws IOException {
        String h = host.startsWith("[") && host.endsWith("]") ? host.substring(1, host.length() - 1) : host;
        if (h.matches("\\d{1,3}(\\.\\d{1,3}){3}") || h.contains(":")) {
            byte[] ip = InetAddress.getByName(h).getAddress(); // literal: no DNS lookup
            byte[] f = new byte[1 + ip.length];
            f[0] = (byte) (ip.length == 4 ? 0x01 : 0x04);
            System.arraycopy(ip, 0, f, 1, ip.length);
            return f;
        }
        byte[] name = h.getBytes(StandardCharsets.US_ASCII);
        if (name.length > 255) throw new SocksException("Host name too long for SOCKS5: " + h);
        byte[] f = new byte[2 + name.length];
        f[0] = 0x03;
        f[1] = (byte) name.length;
        System.arraycopy(name, 0, f, 2, name.length);
        return f;
    }

    private static String replyText(int rep) {
        switch (rep) {
            case 1: return "general failure";
            case 2: return "not allowed by the proxy's rules";
            case 3: return "network unreachable";
            case 4: return "host unreachable";
            case 5: return "connection refused";
            case 6: return "timed out";
            case 7: return "command not supported";
            case 8: return "address type not supported";
            default: return "error " + rep;
        }
    }
}
