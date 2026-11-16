package app.morphed.extension.twitch.vpn;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Just enough IPv4 to talk through the tunnel: TCP connections (see {@link TcpConnection}) and DNS over UDP.
 * Packets out go to the link (the WireGuard tunnel); packets in come from it.
 */
public final class IpStack {
    /** Where packets go out. */
    public interface Link {
        boolean send(byte[] packet, int offset, int length);
    }

    static final int PROTO_TCP = 6, PROTO_UDP = 17;

    final byte[] localAddress;
    final int mss;
    private final Link link;
    private final byte[] dnsServer;
    private final SecureRandom random = new SecureRandom();
    private final Map<String, TcpConnection> connections = new ConcurrentHashMap<>();
    private final Map<Integer, byte[][]> udpReplies = new ConcurrentHashMap<>();
    private final Map<String, CachedName> names = new HashMap<>();
    private int ipId;
    private final Thread timer;
    private volatile boolean closed;

    private static final class CachedName {
        final byte[] address;
        final long until;

        CachedName(byte[] address, long until) {
            this.address = address;
            this.until = until;
        }
    }

    public IpStack(byte[] localAddress, byte[] dnsServer, int mtu, Link link) {
        this.localAddress = localAddress;
        this.dnsServer = dnsServer;
        this.mss = mtu - 40;
        this.link = link;
        timer = new Thread(this::timerLoop, "TwitchMorphed-tcp-timer");
        timer.setDaemon(true);
        timer.start();
    }

    public void close() {
        closed = true;
        for (TcpConnection connection : connections.values()) connection.abort("the tunnel closed");
        connections.clear();
    }

    private void timerLoop() {
        while (!closed) {
            try {
                Thread.sleep(connections.isEmpty() ? 500 : 50); // nothing to time: a slow beat
            } catch (InterruptedException e) {
                return;
            }
            long now = System.currentTimeMillis();
            for (TcpConnection connection : connections.values()) {
                if (connection.isFinished()) {
                    forget(connection);
                    continue;
                }
                try {
                    connection.tick(now);
                } catch (RuntimeException ignored) {
                    // one broken connection mustn't stop the others' timers
                }
            }
        }
    }

    // --- out

    synchronized int nextId() {
        return ipId++ & 0xffff;
    }

    /** An IPv4 packet around a transport payload, checksummed, sent to the link. */
    boolean sendIp(int protocol, byte[] destination, byte[] payload, int length) {
        byte[] packet = new byte[20 + length];
        packet[0] = 0x45;
        int total = packet.length;
        packet[2] = (byte) (total >>> 8);
        packet[3] = (byte) total;
        int id = nextId();
        packet[4] = (byte) (id >>> 8);
        packet[5] = (byte) id;
        packet[6] = 0x40; // don't fragment
        packet[8] = 64;
        packet[9] = (byte) protocol;
        System.arraycopy(localAddress, 0, packet, 12, 4);
        System.arraycopy(destination, 0, packet, 16, 4);
        int sum = checksum(packet, 0, 20, 0);
        packet[10] = (byte) (sum >>> 8);
        packet[11] = (byte) sum;
        System.arraycopy(payload, 0, packet, 20, length);
        return link.send(packet, 0, packet.length);
    }

    /** The internet checksum of bytes [offset, offset+length) added to a starting sum. */
    static int checksum(byte[] data, int offset, int length, int start) {
        long sum = start;
        int i = offset;
        for (; i + 1 < offset + length; i += 2) sum += ((data[i] & 0xff) << 8) | (data[i + 1] & 0xff);
        if (i < offset + length) sum += (data[i] & 0xff) << 8;
        while ((sum >>> 16) != 0) sum = (sum & 0xffff) + (sum >>> 16);
        return (int) (~sum & 0xffff);
    }

    /** The pseudo-header's part of a TCP/UDP checksum, before folding. */
    int pseudoHeaderSum(byte[] destination, int protocol, int length) {
        int sum = 0;
        sum += ((localAddress[0] & 0xff) << 8) | (localAddress[1] & 0xff);
        sum += ((localAddress[2] & 0xff) << 8) | (localAddress[3] & 0xff);
        sum += ((destination[0] & 0xff) << 8) | (destination[1] & 0xff);
        sum += ((destination[2] & 0xff) << 8) | (destination[3] & 0xff);
        sum += protocol;
        sum += length;
        return sum;
    }

    // --- in

    /** An IP packet from the tunnel. */
    public void receive(byte[] packet, int offset, int length) {
        if (length < 20 || (packet[offset] >> 4) != 4) return;
        // A fragment (more to come, or not the first): not reassembled here; TCP's MSS keeps them from happening.
        if ((packet[offset + 6] & 0x20) != 0 || (((packet[offset + 6] & 0x1f) << 8) | (packet[offset + 7] & 0xff)) != 0) return;
        int headerLength = (packet[offset] & 0x0f) * 4;
        int total = ((packet[offset + 2] & 0xff) << 8) | (packet[offset + 3] & 0xff);
        if (total > length || headerLength < 20 || total < headerLength) return;
        int protocol = packet[offset + 9] & 0xff;
        byte[] source = new byte[4];
        System.arraycopy(packet, offset + 12, source, 0, 4);
        int at = offset + headerLength, size = total - headerLength;
        if (protocol == PROTO_TCP && size >= 20) {
            int sourcePort = ((packet[at] & 0xff) << 8) | (packet[at + 1] & 0xff);
            int destinationPort = ((packet[at + 2] & 0xff) << 8) | (packet[at + 3] & 0xff);
            TcpConnection connection = connections.get(key(source, sourcePort, destinationPort));
            if (connection != null) connection.onSegment(packet, at, size);
        } else if (protocol == PROTO_UDP && size >= 8) {
            int destinationPort = ((packet[at + 2] & 0xff) << 8) | (packet[at + 3] & 0xff);
            byte[][] slot = udpReplies.get(destinationPort);
            if (slot != null) {
                byte[] payload = new byte[size - 8];
                System.arraycopy(packet, at + 8, payload, 0, payload.length);
                synchronized (slot) {
                    slot[0] = payload;
                    slot.notifyAll();
                }
            }
        }
    }

    static String key(byte[] remote, int remotePort, int localPort) {
        return (remote[0] & 0xff) + "." + (remote[1] & 0xff) + "." + (remote[2] & 0xff) + "." + (remote[3] & 0xff)
                + ":" + remotePort + ">" + localPort;
    }

    int freePort() {
        return 40000 + random.nextInt(20000);
    }

    /** Opens a TCP connection through the tunnel. */
    public TcpConnection connect(byte[] address, int port, int timeoutMs) throws IOException {
        if (closed) throw new IOException("The VPN tunnel is closed");
        int localPort;
        String key;
        do {
            localPort = freePort();
            key = key(address, port, localPort);
        } while (connections.containsKey(key));
        TcpConnection connection = new TcpConnection(this, address, port, localPort, random.nextInt());
        connections.put(key, connection);
        try {
            connection.connect(timeoutMs);
        } catch (IOException e) {
            connections.remove(key);
            throw e;
        }
        return connection;
    }

    void forget(TcpConnection connection) {
        connections.remove(key(connection.remoteAddress, connection.remotePort, connection.localPort));
    }

    // --- DNS

    /** The IPv4 address of a host name, asked of the config's DNS server through the tunnel. */
    public byte[] resolve(String host) throws IOException {
        byte[] literal = WgConfig.ipv4(host);
        if (literal != null) return literal;
        synchronized (names) {
            CachedName cached = names.get(host);
            if (cached != null && cached.until > System.currentTimeMillis()) return cached.address;
        }
        byte[] server = dnsServer != null ? dnsServer : new byte[]{1, 1, 1, 1};
        IOException last = null;
        for (int attempt = 0; attempt < 3; attempt++) {
            try {
                byte[] answer = udpExchange(server, 53, Dns.query(host, random.nextInt() & 0xffff), 2000);
                Dns.Answer parsed = Dns.parse(answer);
                if (parsed.address == null) throw new UnknownHostException(host + " has no IPv4 address through the VPN");
                synchronized (names) {
                    names.put(host, new CachedName(parsed.address, System.currentTimeMillis()
                            + Math.max(30, Math.min(parsed.ttl, 600)) * 1000L));
                }
                return parsed.address;
            } catch (UnknownHostException e) {
                throw e;
            } catch (IOException e) {
                last = e;
            }
        }
        throw new IOException("The VPN's DNS server didn't answer for " + host, last);
    }

    private byte[] udpExchange(byte[] server, int port, byte[] query, int timeoutMs) throws IOException {
        int localPort;
        byte[][] slot = new byte[1][];
        do {
            localPort = freePort();
        } while (udpReplies.putIfAbsent(localPort, slot) != null);
        try {
            byte[] udp = new byte[8 + query.length];
            udp[0] = (byte) (localPort >>> 8);
            udp[1] = (byte) localPort;
            udp[2] = (byte) (port >>> 8);
            udp[3] = (byte) port;
            udp[4] = (byte) (udp.length >>> 8);
            udp[5] = (byte) udp.length;
            System.arraycopy(query, 0, udp, 8, query.length);
            int sum = checksum(udp, 0, udp.length, pseudoHeaderSum(server, PROTO_UDP, udp.length));
            if (sum == 0) sum = 0xffff;
            udp[6] = (byte) (sum >>> 8);
            udp[7] = (byte) sum;
            if (!sendIp(PROTO_UDP, server, udp, udp.length)) throw new IOException("The VPN tunnel isn't up");
            long deadline = System.currentTimeMillis() + timeoutMs;
            synchronized (slot) {
                while (slot[0] == null) {
                    long left = deadline - System.currentTimeMillis();
                    if (left <= 0) throw new IOException("No DNS answer in time");
                    try {
                        slot.wait(left);
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                        throw new IOException("Interrupted");
                    }
                }
                return slot[0];
            }
        } finally {
            udpReplies.remove(localPort);
        }
    }

    /** DNS queries and answers, type A only. */
    static final class Dns {
        static final class Answer {
            final byte[] address;
            final int ttl;

            Answer(byte[] address, int ttl) {
                this.address = address;
                this.ttl = ttl;
            }
        }

        static byte[] query(String host, int id) {
            List<Byte> out = new ArrayList<>();
            int[] header = {id >>> 8, id, 0x01, 0x00, 0, 1, 0, 0, 0, 0, 0, 0};
            for (int b : header) out.add((byte) b);
            for (String label : host.split("\\.")) {
                byte[] bytes = label.getBytes(java.nio.charset.StandardCharsets.US_ASCII);
                out.add((byte) bytes.length);
                for (byte b : bytes) out.add(b);
            }
            int[] tail = {0, 0, 1, 0, 1}; // end of name, type A, class IN
            for (int b : tail) out.add((byte) b);
            byte[] bytes = new byte[out.size()];
            for (int i = 0; i < bytes.length; i++) bytes[i] = out.get(i);
            return bytes;
        }

        private static int skipName(byte[] m, int at) {
            while (at < m.length) {
                int length = m[at] & 0xff;
                if (length == 0) return at + 1;
                if ((length & 0xc0) == 0xc0) return at + 2;
                at += 1 + length;
            }
            return at;
        }

        static Answer parse(byte[] m) throws IOException {
            try {
                return parseUnchecked(m);
            } catch (RuntimeException broken) {
                throw new IOException("A broken DNS answer", broken);
            }
        }

        private static Answer parseUnchecked(byte[] m) throws IOException {
            if (m.length < 12) throw new IOException("A broken DNS answer");
            int rcode = m[3] & 0x0f;
            if (rcode != 0) return new Answer(null, 0);
            int questions = ((m[4] & 0xff) << 8) | (m[5] & 0xff);
            int answers = ((m[6] & 0xff) << 8) | (m[7] & 0xff);
            int at = 12;
            for (int q = 0; q < questions; q++) at = skipName(m, at) + 4;
            for (int a = 0; a < answers && at + 10 <= m.length; a++) {
                at = skipName(m, at);
                int type = ((m[at] & 0xff) << 8) | (m[at + 1] & 0xff);
                int ttl = ((m[at + 4] & 0xff) << 24) | ((m[at + 5] & 0xff) << 16) | ((m[at + 6] & 0xff) << 8) | (m[at + 7] & 0xff);
                int length = ((m[at + 8] & 0xff) << 8) | (m[at + 9] & 0xff);
                at += 10;
                if (type == 1 && length == 4 && at + 4 <= m.length) {
                    byte[] address = new byte[4];
                    System.arraycopy(m, at, address, 0, 4);
                    return new Answer(address, ttl);
                }
                at += length;
            }
            return new Answer(null, 0);
        }
    }
}
