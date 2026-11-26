package app.noam.extension.chesscom.stockfish;

import java.io.IOException;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.InterfaceAddress;
import java.net.NetworkInterface;
import java.nio.ByteBuffer;
import java.nio.channels.CancelledKeyException;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.SocketChannel;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * Looks for sf-bridge on the network this phone is on, so its address does not have to be read off
 * ipconfig on the computer, and does not go stale when the router hands out a different one.
 *
 * Every address of the phone's own subnet is tried on the bridge's port. A host that answers is asked
 * to say hello the way sf-bridge does before anything else ("sf-bridge 1 cores 12"); anything else
 * listening on that port is passed over, since only a bridge can answer that.
 *
 * The sweep is non-blocking: every address of a batch is connecting at the same time in one thread,
 * so a whole /24 costs one timeout instead of one timeout per handful of addresses. A network where
 * nothing answers is the slow case, and that is the case a scan is usually run in.
 */
public final class BridgeDiscovery {
    /** One device that answered the way sf-bridge does. */
    public static final class Device {
        public final String host;
        public final int port;
        /** The computer's cores, as its greeting says, or 0 when it named none. */
        public final int cores;
        private final int order;

        Device(String host, int port, int cores, int order) {
            this.host = host;
            this.port = port;
            this.cores = cores;
            this.order = order;
        }

        /** "192.168.1.10:7892 - 12 cores", the way the settings show it. */
        public String label() {
            return host + ":" + port + (cores > 0 ? " - " + cores + " cores" : "");
        }
    }

    /** What one sweep found, and how much of the network it looked at. */
    public static final class Result {
        /** Nothing found, or a sweep that could not start. */
        public static final Result NONE = new Result(Collections.<Device>emptyList(), 0);

        public final List<Device> devices;
        public final int scanned;

        Result(List<Device> devices, int scanned) {
            this.devices = devices;
            this.scanned = scanned;
        }
    }

    /** A host that is off takes the full timeout, so it stays short: the whole batch waits once. */
    private static final int CONNECT_TIMEOUT_MS = 300;
    private static final int GREETING_TIMEOUT_MS = 600;
    /**
     * One thread holds the batch, so the file descriptors are the limit, not the threads: 512 open
     * channels stay well inside what Android gives an app, and a /22 takes two batches.
     */
    private static final int MAX_IN_FLIGHT = 512;
    /** A bridge greets with one short line; anything longer on that port is not a bridge. */
    private static final int GREETING_LIMIT = 256;
    /** A /22 is 1,022 addresses to try; a wider network is looked at a /24 at a time. */
    private static final int MAX_SUBNET_ADDRESSES = 1_024;
    /** A phone has its Wi-Fi and, at most, one VPN: two subnets is already more than it needs. */
    private static final int MAX_TOTAL_ADDRESSES = 2_048;
    /** Wider than a /22 is not one Wi-Fi but a campus: the phone's own /24 is the useful part. */
    private static final int WIDEST_PREFIX = 22;

    private BridgeDiscovery() {}

    /** Every sf-bridge that answers on [port] in the phone's own subnet, nearest address first. */
    public static Result find(int port) {
        return scan(addresses(), port);
    }

    /** One sweep over [targets]. Kept apart from the interfaces so it can be tried on its own. */
    static Result scan(List<InetAddress> targets, int port) {
        List<Device> found = new ArrayList<Device>();
        for (int from = 0; from < targets.size(); from += MAX_IN_FLIGHT) {
            sweep(targets.subList(from, Math.min(targets.size(), from + MAX_IN_FLIGHT)), port, found);
        }
        Collections.sort(found, (first, second) -> Integer.compare(first.order, second.order));
        return new Result(found, targets.size());
    }

    /** What one address is doing in the sweep: connecting, then waiting for the greeting. */
    private static final class Probe {
        final InetAddress address;
        final ByteBuffer greeting = ByteBuffer.allocate(GREETING_LIMIT);
        long deadline;

        Probe(InetAddress address) {
            this.address = address;
        }
    }

    /** Tries every address of [batch] at once and adds the bridges that greet. */
    private static void sweep(List<InetAddress> batch, int port, List<Device> found) {
        Selector selector = null;
        // The selector keeps cancelled keys until its next select, so the sweep counts its own.
        int live = 0;
        try {
            selector = Selector.open();
            long connectDeadline = System.currentTimeMillis() + CONNECT_TIMEOUT_MS;
            for (InetAddress address : batch) {
                SocketChannel channel;
                try {
                    channel = SocketChannel.open();
                } catch (IOException e) {
                    // Out of file descriptors: the rest of this batch is simply not tried.
                    break;
                }
                Probe probe = new Probe(address);
                probe.deadline = connectDeadline;
                SelectionKey key = null;
                try {
                    channel.configureBlocking(false);
                    channel.socket().setTcpNoDelay(true);
                    key = channel.register(selector, SelectionKey.OP_CONNECT, probe);
                    live++;
                    channel.connect(new InetSocketAddress(address, port));
                } catch (IOException | RuntimeException e) {
                    if (key != null) {
                        if (close(key)) live--;
                    } else {
                        closeQuietly(channel);
                    }
                }
            }
            while (live > 0) {
                long now = System.currentTimeMillis();
                long wait = Long.MAX_VALUE;
                for (SelectionKey key : new ArrayList<SelectionKey>(selector.keys())) {
                    Probe probe = (Probe) key.attachment();
                    if (probe == null) continue;
                    if (now >= probe.deadline) {
                        if (close(key)) live--;
                    } else {
                        wait = Math.min(wait, probe.deadline - now);
                    }
                }
                if (live == 0) break;
                selector.select(wait == Long.MAX_VALUE ? 1 : wait);
                for (SelectionKey key : new ArrayList<SelectionKey>(selector.selectedKeys())) {
                    selector.selectedKeys().remove(key);
                    try {
                        if (key.isValid() && key.isConnectable()) {
                            SocketChannel channel = (SocketChannel) key.channel();
                            if (channel.finishConnect()) {
                                Probe probe = (Probe) key.attachment();
                                probe.deadline = System.currentTimeMillis() + GREETING_TIMEOUT_MS;
                                key.interestOps(SelectionKey.OP_READ);
                            } else if (close(key)) {
                                live--;
                            }
                        }
                        if (key.isValid() && key.isReadable() && read(key, port, found)) live--;
                    } catch (IOException | CancelledKeyException e) {
                        // Refused, reset, gone: all of them mean "keep looking".
                        if (close(key)) live--;
                    }
                }
            }
        } catch (IOException e) {
            // A selector that cannot open is a sweep that cannot run: report what was found.
        } finally {
            if (selector != null) {
                for (SelectionKey key : new ArrayList<SelectionKey>(selector.keys())) close(key);
                try {
                    selector.close();
                } catch (IOException ignored) {
                    // Closed anyway.
                }
            }
        }
    }

    /**
     * Reads one line from an address that accepted the connection, and keeps it if it is a bridge.
     * Returns whether the address is finished with, so the sweep can count it out.
     */
    private static boolean read(SelectionKey key, int port, List<Device> found) throws IOException {
        SocketChannel channel = (SocketChannel) key.channel();
        Probe probe = (Probe) key.attachment();
        if (channel.read(probe.greeting) < 0) return close(key);
        String text = new String(probe.greeting.array(), 0, probe.greeting.position(), StandardCharsets.UTF_8);
        int end = text.indexOf('\n');
        if (end < 0) {
            // One more read may bring the newline; a full buffer with none is not a greeting.
            return !probe.greeting.hasRemaining() && close(key);
        }
        String greeting = text.substring(0, end).trim();
        if (greeting.startsWith("sf-bridge")) {
            found.add(new Device(probe.address.getHostAddress(), port, NetEngine.coresIn(greeting),
                (int) order(probe.address)));
        }
        return close(key);
    }

    /** Closes one probe, or answers false when it was closed already. */
    private static boolean close(SelectionKey key) {
        if (key.attachment() == null) return false;
        key.attach(null);
        key.cancel();
        closeQuietly((SocketChannel) key.channel());
        return true;
    }

    private static void closeQuietly(SocketChannel channel) {
        try {
            channel.close();
        } catch (IOException ignored) {
            // Closed anyway.
        }
    }

    /**
     * The addresses of the phone's own subnets. Mobile data and VPN interfaces are point to point and
     * have no broadcast address, so they are left out: the bridge is on the Wi-Fi, not on those.
     */
    private static List<InetAddress> addresses() {
        Set<InetAddress> targets = new LinkedHashSet<InetAddress>();
        try {
            for (NetworkInterface network : Collections.list(NetworkInterface.getNetworkInterfaces())) {
                if (!network.isUp() || network.isLoopback()) continue;
                for (InterfaceAddress onThis : network.getInterfaceAddresses()) {
                    if (onThis.getBroadcast() == null) continue;
                    InetAddress address = onThis.getAddress();
                    if (!(address instanceof Inet4Address)) continue;
                    addSubnet(targets, address, onThis.getNetworkPrefixLength());
                }
            }
        } catch (Exception e) {
            // A missing permission or an interface that went away: try whatever was read so far.
        }
        return new ArrayList<InetAddress>(targets);
    }

    /** Adds every host of [address]'s subnet, its own address left out. */
    private static void addSubnet(Set<InetAddress> targets, InetAddress address, int prefixLength) {
        int prefix = prefixLength < 0 || prefixLength > 30 ? 24 : prefixLength;
        if (prefix < WIDEST_PREFIX) prefix = 24;
        long own = order(address);
        long mask = prefix == 0 ? 0 : (0xFFFFFFFFL << (32 - prefix)) & 0xFFFFFFFFL;
        long first = (own & mask) + 1;
        long last = (own & mask) | (~mask & 0xFFFFFFFFL);
        // One subnet may not take the whole budget: a VPN's /8 must not cut the Wi-Fi's /22 short.
        int room = Math.min(MAX_SUBNET_ADDRESSES, MAX_TOTAL_ADDRESSES - targets.size());
        int added = 0;
        for (long host = first; host < last && added < room; host++) {
            if (host == own) continue;
            targets.add(ipv4(host));
            added++;
        }
    }

    /** An IPv4 address as a number, for comparing and counting. */
    private static long order(InetAddress address) {
        long value = 0;
        for (byte part : address.getAddress()) value = (value << 8) | (part & 0xFF);
        return value;
    }

    private static InetAddress ipv4(long value) {
        byte[] parts = new byte[] {
            (byte) (value >>> 24), (byte) (value >>> 16), (byte) (value >>> 8), (byte) value,
        };
        try {
            // getByAddress with four bytes never asks the network for anything.
            return InetAddress.getByAddress(parts);
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }
}
