package app.threadripper.extension.youtube;

import android.os.SystemClock;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Packets on the VPN interface whose source is not the tunnel's address: connections the app opened
 * on the normal network before the VPN came up. Android routes them into the VPN anyway, still
 * carrying the old source address, and WARP drops them; unanswered, the app waits for its own
 * timeout, and a home feed request caught this way leaves the feed grey. They are not forwarded but
 * answered with a TCP reset or an ICMP port unreachable written back into the interface, so the app
 * sees a failed connection at once and retries over the tunnel.
 *
 * Flows are counted and logged in one summary after the start; per-packet logging would be dropped
 * by the ROM's per-process rate limit during app start.
 */
final class StrayFlows {
    private static final int TCP = 6;
    private static final int UDP = 17;
    private static final long SUMMARY_AFTER_MS = 10_000;
    private static final int MAX_FLOWS = 64;
    private static final int MAX_LOGGED = 12;

    interface Writer {
        void write(byte[] buf, int off, int len);
    }

    private final byte[] v4;
    private final byte[] v6;
    private final long startMs = SystemClock.elapsedRealtime();
    private final Map<String, Flow> flows = new LinkedHashMap<>();
    private boolean summarized;
    private long strayPackets;

    StrayFlows(String v4, String v6) {
        this.v4 = address(v4);
        this.v6 = address(v6);
    }

    /** Returns true if the packet is stray: answered here, not to be forwarded. */
    boolean handle(byte[] p, int n, Writer tun) {
        long now = SystemClock.elapsedRealtime() - startMs;
        if (n < 1) return false;
        int version = (p[0] & 0xff) >>> 4;
        int ipHeader, proto;
        boolean ipv4 = version == 4;
        if (ipv4 && n >= 20) {
            if (v4 == null || equal(p, 12, v4)) return false;
            ipHeader = (p[0] & 0x0f) * 4;
            proto = p[9] & 0xff;
            if ((p[16] & 0xf0) == 0xe0 || (p[16] & 0xff) == 0xff) return false; // multicast, broadcast
        } else if (version == 6 && n >= 40) {
            if (v6 == null || equal(p, 8, v6)) return false;
            ipHeader = 40;
            proto = p[6] & 0xff;
            if ((p[24] & 0xff) == 0xff) return false; // multicast
            if ((p[8] & 0xff) == 0xfe && (p[9] & 0xc0) == 0x80) return false; // link-local source
        } else {
            return false;
        }
        strayPackets++;
        boolean ports = (proto == TCP || proto == UDP) && n >= ipHeader + (proto == TCP ? 20 : 8);
        String key = describe(p, ipv4, proto, ipHeader, ports);
        Flow f = flows.get(key);
        if (f == null && flows.size() < MAX_FLOWS) {
            f = new Flow(key, now);
            flows.put(key, f);
        }
        if (f != null) {
            f.packets++;
            f.lastMs = now;
            if (proto == TCP && ports) f.tcpFlags |= p[ipHeader + 13] & 0xff;
        }
        byte[] answer = null;
        if (proto == TCP && ports) {
            answer = ipv4 ? reset4(p, ipHeader, n) : reset6(p, n);
        } else if (proto == UDP && ports) {
            answer = ipv4 ? unreachable4(p, ipHeader, n) : unreachable6(p, n);
        }
        if (answer != null) {
            tun.write(answer, 0, answer.length);
            if (f != null) f.answered++;
        }
        return true;
    }

    /** Called at least every half second by the interface reader. */
    void tick() {
        if (summarized) return;
        long now = SystemClock.elapsedRealtime() - startMs;
        if (now < SUMMARY_AFTER_MS) return;
        summarized = true;
        List<Flow> list = new ArrayList<>(flows.values());
        Log.i("WARP: stray flows at +" + now + " ms: " + list.size() + " flows, " + strayPackets + " packets");
        int logged = 0;
        for (Flow f : list) {
            if (logged++ >= MAX_LOGGED) break;
            Log.i("WARP:   " + f.key + " packets " + f.packets + " first +" + f.firstMs + " ms last +" + f.lastMs
                    + " ms" + (f.tcpFlags != 0 ? " flags " + tcpFlags(f.tcpFlags) : "")
                    + " answered " + f.answered);
        }
    }

    // ---- Answers ----

    /** RFC 793 reset for a segment: seq = its ack if it has one, otherwise ack its sequence space. */
    private static int[] resetNumbers(byte[] p, int tcp, int payload) {
        int flags = p[tcp + 13] & 0xff;
        if ((flags & 0x04) != 0) return null; // never answer a reset
        if ((flags & 0x10) != 0) return new int[]{getInt(p, tcp + 8), 0, 0x04};
        long len = payload + ((flags & 0x02) != 0 ? 1 : 0) + ((flags & 0x01) != 0 ? 1 : 0);
        return new int[]{0, (int) (getInt(p, tcp + 4) + len), 0x14};
    }

    private static byte[] reset4(byte[] p, int ip, int n) {
        int total = Math.min(n, getShort(p, 2));
        int tcp = ip;
        int payload = total - ip - ((p[tcp + 12] & 0xf0) >>> 2);
        int[] num = resetNumbers(p, tcp, Math.max(payload, 0));
        if (num == null) return null;
        byte[] r = new byte[40];
        header4(r, 40, TCP, p, 16, p, 12);
        tcpReset(r, 20, p, tcp, num);
        putShort(r, 36, checksum(r, 20, 20, pseudo4(r, 20, TCP)));
        return r;
    }

    private static byte[] reset6(byte[] p, int n) {
        if ((p[6] & 0xff) != TCP) return null;
        int total = Math.min(n, 40 + getShort(p, 4));
        int tcp = 40;
        int payload = total - 40 - ((p[tcp + 12] & 0xf0) >>> 2);
        int[] num = resetNumbers(p, tcp, Math.max(payload, 0));
        if (num == null) return null;
        byte[] r = new byte[60];
        header6(r, 20, TCP, p);
        tcpReset(r, 40, p, tcp, num);
        putShort(r, 56, checksum(r, 40, 20, pseudo6(r, 20, TCP)));
        return r;
    }

    private static void tcpReset(byte[] r, int t, byte[] p, int tcp, int[] num) {
        System.arraycopy(p, tcp + 2, r, t, 2); // source port = their destination port
        System.arraycopy(p, tcp, r, t + 2, 2);
        putInt(r, t + 4, num[0]);
        putInt(r, t + 8, num[1]);
        r[t + 12] = 0x50; // 20-byte header
        r[t + 13] = (byte) num[2];
    }

    /** ICMP destination unreachable, port unreachable, quoting the IP header and 8 bytes. */
    private static byte[] unreachable4(byte[] p, int ip, int n) {
        int quoted = Math.min(n, ip + 8);
        byte[] r = new byte[20 + 8 + quoted];
        header4(r, r.length, 1, p, 16, p, 12);
        r[20] = 3;
        r[21] = 3;
        System.arraycopy(p, 0, r, 28, quoted);
        putShort(r, 22, checksum(r, 20, r.length - 20, 0));
        return r;
    }

    /** ICMPv6 destination unreachable, port unreachable, quoting as much as fits in 1280 bytes. */
    private static byte[] unreachable6(byte[] p, int n) {
        if ((p[6] & 0xff) != UDP) return null;
        int quoted = Math.min(n, 1280 - 48);
        byte[] r = new byte[48 + quoted];
        header6(r, 8 + quoted, 58, p);
        r[40] = 1;
        r[41] = 4;
        System.arraycopy(p, 0, r, 48, quoted);
        putShort(r, 42, checksum(r, 40, 8 + quoted, pseudo6(r, 8 + quoted, 58)));
        return r;
    }

    /** IPv4 header from the packet's destination back to its source. */
    private static void header4(byte[] r, int total, int proto, byte[] src, int srcOff, byte[] dst, int dstOff) {
        r[0] = 0x45;
        putShort(r, 2, total);
        r[6] = 0x40; // don't fragment
        r[8] = 64;
        r[9] = (byte) proto;
        System.arraycopy(src, srcOff, r, 12, 4);
        System.arraycopy(dst, dstOff, r, 16, 4);
        putShort(r, 10, checksum(r, 0, 20, 0));
    }

    private static void header6(byte[] r, int payload, int next, byte[] p) {
        r[0] = 0x60;
        putShort(r, 4, payload);
        r[6] = (byte) next;
        r[7] = 64;
        System.arraycopy(p, 24, r, 8, 16);
        System.arraycopy(p, 8, r, 24, 16);
    }

    private static int pseudo4(byte[] r, int len, int proto) {
        return sum(r, 12, 8) + proto + len;
    }

    private static int pseudo6(byte[] r, int len, int next) {
        return sum(r, 8, 32) + len + next;
    }

    private static int sum(byte[] b, int off, int len) {
        int s = 0;
        for (int i = 0; i + 1 < len; i += 2) s += (b[off + i] & 0xff) << 8 | (b[off + i + 1] & 0xff);
        if ((len & 1) != 0) s += (b[off + len - 1] & 0xff) << 8;
        return s;
    }

    private static int checksum(byte[] b, int off, int len, int initial) {
        long s = (initial & 0xffffffffL) + sum(b, off, len);
        while ((s >> 16) != 0) s = (s & 0xffff) + (s >> 16);
        return (int) (~s & 0xffff);
    }

    // ---- Description ----

    private static String describe(byte[] p, boolean ipv4, int proto, int ip, boolean ports) {
        String name = proto == TCP ? "tcp" : proto == UDP ? "udp" : "proto " + proto;
        byte[] src = Arrays.copyOfRange(p, ipv4 ? 12 : 8, ipv4 ? 16 : 24);
        byte[] dst = Arrays.copyOfRange(p, ipv4 ? 16 : 24, ipv4 ? 20 : 40);
        String s = text(src), d = text(dst);
        if (ports) {
            s += ":" + getShort(p, ip);
            d += ":" + getShort(p, ip + 2);
        }
        return name + " " + s + " -> " + d;
    }

    private static String tcpFlags(int f) {
        StringBuilder b = new StringBuilder();
        String[] names = {"FIN", "SYN", "RST", "PSH", "ACK"};
        for (int i = 0; i < names.length; i++) {
            if ((f & (1 << i)) != 0) b.append(b.length() == 0 ? "" : "|").append(names[i]);
        }
        return b.toString();
    }

    private static String text(byte[] a) {
        try {
            return InetAddress.getByAddress(a).getHostAddress();
        } catch (UnknownHostException ex) {
            return "?";
        }
    }

    private static byte[] address(String s) {
        if (s == null || s.isEmpty()) return null;
        try {
            return InetAddress.getByName(s).getAddress();
        } catch (UnknownHostException ex) {
            return null;
        }
    }

    private static boolean equal(byte[] p, int off, byte[] a) {
        for (int i = 0; i < a.length; i++) if (p[off + i] != a[i]) return false;
        return true;
    }

    private static int getShort(byte[] b, int off) {
        return (b[off] & 0xff) << 8 | (b[off + 1] & 0xff);
    }

    private static int getInt(byte[] b, int off) {
        return (b[off] & 0xff) << 24 | (b[off + 1] & 0xff) << 16 | (b[off + 2] & 0xff) << 8 | (b[off + 3] & 0xff);
    }

    private static void putShort(byte[] b, int off, int v) {
        b[off] = (byte) (v >>> 8);
        b[off + 1] = (byte) v;
    }

    private static void putInt(byte[] b, int off, int v) {
        b[off] = (byte) (v >>> 24);
        b[off + 1] = (byte) (v >>> 16);
        b[off + 2] = (byte) (v >>> 8);
        b[off + 3] = (byte) v;
    }

    private static final class Flow {
        final String key;
        final long firstMs;
        long lastMs;
        long packets;
        long answered;
        int tcpFlags;

        Flow(String key, long firstMs) {
            this.key = key;
            this.firstMs = firstMs;
        }
    }
}
