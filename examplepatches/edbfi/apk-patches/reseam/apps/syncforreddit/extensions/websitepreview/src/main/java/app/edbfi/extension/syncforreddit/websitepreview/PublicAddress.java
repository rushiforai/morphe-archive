// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.websitepreview;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Locale;
import okhttp3.HttpUrl;

final class PublicAddress {
    private PublicAddress() {}

    static boolean allows(HttpUrl url) {
        // OkHttp bypasses its DNS callback for numeric hosts.
        String host = url.host();
        if (host.indexOf(':') >= 0) {
            try {
                return allows(InetAddress.getByName(host));
            } catch (UnknownHostException ignored) {
                return false;
            }
        }
        if (host.matches("[0-9.]+")) return allowsIpv4Literal(host);

        String name = host.toLowerCase(Locale.ROOT);
        if (name.endsWith(".")) name = name.substring(0, name.length() - 1);
        return name.contains(".") && !name.endsWith(".localhost") && !name.endsWith(".local")
                && !name.endsWith(".internal") && !name.endsWith(".lan")
                && !name.equals("home.arpa") && !name.endsWith(".home.arpa")
                && !name.endsWith(".test") && !name.endsWith(".invalid") && !name.endsWith(".example")
                && !name.endsWith(".onion") && !name.endsWith(".alt");
    }

    private static boolean allowsIpv4Literal(String host) {
        String[] parts = host.split("\\.", -1);
        if (parts.length != 4) return false;
        byte[] address = new byte[4];
        for (int index = 0; index < parts.length; index++) {
            String part = parts[index];
            if (part.isEmpty() || part.length() > 3 || (part.length() > 1 && part.charAt(0) == '0')) return false;
            int octet = Integer.parseInt(part);
            if (octet > 255) return false;
            address[index] = (byte) octet;
        }
        try {
            return allows(InetAddress.getByAddress(address));
        } catch (UnknownHostException impossible) {
            return false;
        }
    }

    static boolean allows(InetAddress address) {
        if (address == null) return false;
        byte[] bytes = address.getAddress();
        if (bytes.length == 4) return allowsIpv4(bytes, 0);

        int first = bytes[0] & 255;
        int second = bytes[1] & 255;
        int third = bytes[2] & 255;
        // RFC 6052's well-known prefix 64:ff9b::/96 embeds an IPv4 address in the final four bytes.
        if (first == 0 && second == 0x64 && third == 0xff && (bytes[3] & 255) == 0x9b) {
            for (int index = 4; index < 12; index++) {
                if (bytes[index] != 0) return false;
            }
            return allowsIpv4(bytes, 12);
        }

        // Accept global unicast only. Exclude transition and special-purpose prefixes within it.
        return (first & 224) == 32
                && !(first == 32 && (second == 2
                        || (second == 1 && (third <= 1 || (third == 13 && (bytes[3] & 255) == 184)))))
                && !(first == 63 && (second == 254 || (second == 255 && third < 16)));
    }

    private static boolean allowsIpv4(byte[] bytes, int offset) {
        int first = bytes[offset] & 255;
        int second = bytes[offset + 1] & 255;
        int third = bytes[offset + 2] & 255;
        // Exclude local, shared, benchmark, documentation and protocol allocations.
        return first != 0 && first != 10 && first != 127 && first < 224
                && !(first == 100 && second >= 64 && second <= 127)
                && !(first == 169 && second == 254)
                && !(first == 172 && second >= 16 && second <= 31)
                && !(first == 192 && second == 0 && (third == 0 || third == 2))
                && !(first == 192 && second == 88 && third == 99)
                && !(first == 192 && second == 168)
                && !(first == 198 && (second == 18 || second == 19 || (second == 51 && third == 100)))
                && !(first == 203 && second == 0 && third == 113);
    }
}
