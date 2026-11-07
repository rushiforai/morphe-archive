package app.noam.extension.chesscom.stockfish;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.InterfaceAddress;
import java.net.NetworkInterface;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 * Looks for sf-bridge on the network this phone is on, so its address does not have to be read off
 * ipconfig on the computer, and does not go stale when the router hands out a different one.
 *
 * Every address of the phone's own subnet is tried on the bridge's port. A host that answers is asked
 * to say hello the way sf-bridge does before anything else ("sf-bridge 1 cores 12"); anything else
 * listening on that port is passed over, since only a bridge can answer that.
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

    /** A host that is off takes the full timeout, so it stays short: 48 of them at once, still fast. */
    private static final int CONNECT_TIMEOUT_MS = 350;
    private static final int GREETING_TIMEOUT_MS = 900;
    private static final int WORKERS = 48;
    /** A /22 is 1,022 addresses to try; a wider network is looked at a /24 at a time. */
    private static final int MAX_SUBNET_ADDRESSES = 1_024;
    /** A phone has its Wi-Fi and, at most, one VPN: two subnets is already more than it needs. */
    private static final int MAX_TOTAL_ADDRESSES = 2_048;
    /** Wider than a /22 is not one Wi-Fi but a campus: the phone's own /24 is the useful part. */
    private static final int WIDEST_PREFIX = 22;

    private BridgeDiscovery() {}

    /** Every sf-bridge that answers on [port] in the phone's own subnet, nearest address first. */
    public static Result find(int port) {
        List<InetAddress> targets = addresses();
        final List<Device> found = Collections.synchronizedList(new ArrayList<Device>());
        if (targets.isEmpty()) return new Result(new ArrayList<Device>(), 0);

        int workers = Math.min(WORKERS, Math.max(4, targets.size()));
        ExecutorService pool = Executors.newFixedThreadPool(workers);
        try {
            List<Future<?>> tasks = new ArrayList<Future<?>>(targets.size());
            for (final InetAddress address : targets) {
                tasks.add(pool.submit(new Runnable() {
                    @Override
                    public void run() {
                        Device device = probe(address, port);
                        if (device != null) found.add(device);
                    }
                }));
            }
            for (Future<?> task : tasks) {
                try {
                    task.get();
                } catch (Exception ignored) {
                    // One address that could not be tried is not the sweep's problem.
                }
            }
        } finally {
            pool.shutdownNow();
        }

        List<Device> devices = new ArrayList<Device>(found);
        Collections.sort(devices, (first, second) -> Integer.compare(first.order, second.order));
        return new Result(devices, targets.size());
    }

    /** Asks one address: does a bridge answer there, and how many cores does it have? */
    private static Device probe(InetAddress address, int port) {
        Socket socket = new Socket();
        try {
            socket.connect(new InetSocketAddress(address, port), CONNECT_TIMEOUT_MS);
            socket.setSoTimeout(GREETING_TIMEOUT_MS);
            BufferedReader reader = new BufferedReader(
                new InputStreamReader(socket.getInputStream(), StandardCharsets.UTF_8));
            String greeting = reader.readLine();
            if (greeting == null || !greeting.startsWith("sf-bridge")) return null;
            return new Device(address.getHostAddress(), port, NetEngine.coresIn(greeting),
                (int) order(address));
        } catch (IOException e) {
            // Nothing there, or something that is not a bridge: both mean "keep looking".
            return null;
        } finally {
            try {
                socket.close();
            } catch (IOException ignored) {
                // Closed anyway.
            }
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
