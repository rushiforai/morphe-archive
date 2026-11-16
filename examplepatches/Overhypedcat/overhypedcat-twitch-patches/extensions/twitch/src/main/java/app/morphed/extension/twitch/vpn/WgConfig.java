package app.morphed.extension.twitch.vpn;

import java.util.Base64;
import java.util.Locale;

/** A WireGuard config (the .conf file VPN providers hand out): the parts the tunnel needs. */
public final class WgConfig {
    public final String name;
    public final byte[] privateKey;
    public final byte[] address; // IPv4, 4 bytes
    public final byte[] dns; // IPv4, 4 bytes, or null
    public final byte[] peerPublicKey;
    public final byte[] presharedKey; // 32 zero bytes when none
    public final String endpointHost;
    public final int endpointPort;
    public final int keepaliveSeconds; // 0: none
    public final int mtu;

    private WgConfig(String name, byte[] privateKey, byte[] address, byte[] dns, byte[] peerPublicKey,
                     byte[] presharedKey, String endpointHost, int endpointPort, int keepaliveSeconds, int mtu) {
        this.name = name;
        this.privateKey = privateKey;
        this.address = address;
        this.dns = dns;
        this.peerPublicKey = peerPublicKey;
        this.presharedKey = presharedKey;
        this.endpointHost = endpointHost;
        this.endpointPort = endpointPort;
        this.keepaliveSeconds = keepaliveSeconds;
        this.mtu = mtu;
    }

    public static boolean looksLikeWireGuard(String text) {
        if (text == null) return false;
        String lower = text.toLowerCase(Locale.ROOT); // (as the parser: section and key names in any case)
        return lower.contains("[interface]") && lower.contains("[peer]") && lower.contains("privatekey");
    }

    /** Reads a config; IllegalArgumentException saying what's wrong or missing. */
    public static WgConfig parse(String name, String text) {
        if (!looksLikeWireGuard(text)) throw new IllegalArgumentException(name + " isn't a WireGuard config");
        String section = "";
        byte[] privateKey = null, address = null, dns = null, peer = null, psk = new byte[32];
        String host = null;
        int port = 51820, keepalive = 0, mtu = 1420;
        for (String raw : text.split("\\r?\\n")) {
            String line = raw.trim();
            int comment = line.indexOf('#');
            if (comment >= 0) line = line.substring(0, comment).trim();
            if (line.isEmpty()) continue;
            if (line.startsWith("[")) {
                section = line.toLowerCase(Locale.ROOT);
                continue;
            }
            int equals = line.indexOf('=');
            if (equals < 0) continue;
            String key = line.substring(0, equals).trim().toLowerCase(Locale.ROOT);
            String value = line.substring(equals + 1).trim();
            if (section.equals("[interface]")) {
                switch (key) {
                    case "privatekey": privateKey = key32(name, value, "PrivateKey"); break;
                    case "address":
                        for (String part : value.split(",")) {
                            byte[] ip = ipv4(part.trim().replaceAll("/.*", ""));
                            if (ip != null && address == null) address = ip;
                        }
                        break;
                    case "dns":
                        for (String part : value.split(",")) {
                            byte[] ip = ipv4(part.trim());
                            if (ip != null && dns == null) dns = ip;
                        }
                        break;
                    case "mtu":
                        try {
                            mtu = Integer.parseInt(value);
                        } catch (NumberFormatException ignored) {
                            // the default fits every provider's
                        }
                        break;
                    default:
                }
            } else if (section.equals("[peer]")) {
                switch (key) {
                    case "publickey": peer = key32(name, value, "PublicKey"); break;
                    case "presharedkey": psk = key32(name, value, "PresharedKey"); break;
                    case "endpoint": {
                        int colon = value.lastIndexOf(':');
                        if (colon < 0) throw new IllegalArgumentException(name + ": Endpoint has no port");
                        host = value.substring(0, colon).replace("[", "").replace("]", "");
                        try {
                            port = Integer.parseInt(value.substring(colon + 1).trim());
                        } catch (NumberFormatException e) {
                            port = -1;
                        }
                        if (port < 1 || port > 65535) {
                            throw new IllegalArgumentException(name + ": Endpoint's port isn't a number from 1 to 65535");
                        }
                        break;
                    }
                    case "persistentkeepalive":
                        try {
                            keepalive = Integer.parseInt(value);
                        } catch (NumberFormatException ignored) {
                            // off
                        }
                        break;
                    default:
                }
            }
        }
        if (privateKey == null) throw new IllegalArgumentException(name + " has no PrivateKey");
        if (address == null) throw new IllegalArgumentException(name + " has no IPv4 Address");
        if (peer == null) throw new IllegalArgumentException(name + " has no peer PublicKey");
        if (host == null) throw new IllegalArgumentException(name + " has no Endpoint");
        return new WgConfig(name, privateKey, address, dns, peer, psk, host, port, keepalive, Math.max(1280, Math.min(mtu, 1500)));
    }

    private static byte[] key32(String name, String value, String what) {
        byte[] key;
        try {
            key = Base64.getDecoder().decode(value);
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException(name + ": " + what + " isn't a valid key (not Base64)");
        }
        if (key.length != 32) {
            throw new IllegalArgumentException(name + ": " + what + " isn't a valid key (" + key.length
                    + " bytes, a key has 32)");
        }
        return key;
    }

    static byte[] ipv4(String text) {
        String[] parts = text.split("\\.");
        if (parts.length != 4) return null;
        byte[] out = new byte[4];
        try {
            for (int i = 0; i < 4; i++) {
                int v = Integer.parseInt(parts[i]);
                if (v < 0 || v > 255) return null;
                out[i] = (byte) v;
            }
        } catch (NumberFormatException e) {
            return null;
        }
        return out;
    }
}
