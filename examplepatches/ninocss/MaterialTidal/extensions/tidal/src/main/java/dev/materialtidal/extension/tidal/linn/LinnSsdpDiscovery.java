package dev.materialtidal.extension.tidal.linn;

import android.content.Context;
import android.net.wifi.WifiManager;
import android.os.Handler;
import android.os.Looper;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import java.io.StringReader;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketTimeoutException;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * SSDP (UPnP / OpenHome) + manual-IP discovery for Linn DS / DSM renderers on the local Wi-Fi.
 */
public final class LinnSsdpDiscovery {

    public interface Listener {
        void onDevicesChanged(List<LinnDevice> devices);
    }

    private static final String SSDP_MULTICAST_ADDR = "239.255.255.250";
    private static final int SSDP_PORT = 1900;
    private static final String[] SEARCH_TARGETS = {
            "urn:av-openhome-org:service:Product:1",
            "urn:av-openhome-org:service:Playlist:1",
            "urn:av-openhome-org:device:Source:1",
            "urn:schemas-upnp-org:device:MediaRenderer:1"
    };
    private static final int[] MANUAL_PROBE_PORTS = {55178, 49152, 49153, 8080, 80};
    private static final String[] MANUAL_PROBE_PATHS = {
            "/description.xml",
            "/Device/device.xml",
            "/desc.xml",
            "/rootDesc.xml"
    };

    private final Listener listener;
    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private final ExecutorService executor = Executors.newCachedThreadPool();
    private final Map<String, LinnDevice> devicesByUdn = new LinkedHashMap<>();
    private final AtomicBoolean scanning = new AtomicBoolean(false);
    private volatile WifiManager.MulticastLock multicastLock;
    private volatile Thread scanThread;

    public LinnSsdpDiscovery(Listener listener) {
        this.listener = listener;
    }

    public List<LinnDevice> getDevicesSnapshot() {
        synchronized (devicesByUdn) {
            return new ArrayList<>(devicesByUdn.values());
        }
    }

    public LinnDevice findByItemId(String itemId) {
        if (itemId == null) {
            return null;
        }
        synchronized (devicesByUdn) {
            for (LinnDevice d : devicesByUdn.values()) {
                if (itemId.equals(d.itemId)) {
                    return d;
                }
            }
        }
        return null;
    }

    public void triggerQuickScan() {
        executor.execute(this::runSingleScanPass);
    }

    public void startScanning() {
        if (!scanning.compareAndSet(false, true)) {
            return;
        }
        Thread t = new Thread(() -> {
            while (scanning.get()) {
                runSingleScanPass();
                try {
                    Thread.sleep(6000);
                } catch (InterruptedException ignored) {
                    Thread.currentThread().interrupt();
                    break;
                }
            }
        }, "LinnSsdpScanLoop");
        t.setDaemon(true);
        scanThread = t;
        t.start();
    }

    public void stopScanning() {
        scanning.set(false);
        Thread t = scanThread;
        scanThread = null;
        if (t != null) {
            t.interrupt();
        }
        releaseMulticastLock();
    }

    private void runSingleScanPass() {
        acquireMulticastLock();
        Set<String> locations = new LinkedHashSet<>();
        try {
            collectSsdpLocations(SSDP_MULTICAST_ADDR, false, locations);

            String manualIp = LinnConfig.getManualDeviceIp();
            if (manualIp != null && !manualIp.trim().isEmpty()) {
                String trimmed = manualIp.trim();
                if (trimmed.startsWith("http://") || trimmed.startsWith("https://")) {
                    locations.add(trimmed);
                } else {
                    String host = trimmed;
                    int explicitPort = -1;
                    int colon = trimmed.indexOf(':');
                    if (colon > 0) {
                        host = trimmed.substring(0, colon);
                        try {
                            explicitPort = Integer.parseInt(trimmed.substring(colon + 1));
                        } catch (NumberFormatException ignored) {
                        }
                    }
                    collectSsdpLocations(host, true, locations);
                    if (explicitPort > 0) {
                        for (String path : MANUAL_PROBE_PATHS) {
                            locations.add("http://" + host + ":" + explicitPort + path);
                        }
                    } else {
                        for (int port : MANUAL_PROBE_PORTS) {
                            for (String path : MANUAL_PROBE_PATHS) {
                                locations.add("http://" + host + ":" + port + path);
                            }
                        }
                    }
                }
            }

            for (String location : locations) {
                LinnDevice parsed = fetchAndParseDevice(location);
                if (parsed != null && parsed.supportsPlaylist()) {
                    putDevice(parsed);
                }
            }
        } catch (Throwable ignored) {
        } finally {
            if (!scanning.get()) {
                releaseMulticastLock();
            }
        }
    }

    private void putDevice(LinnDevice device) {
        boolean changed;
        synchronized (devicesByUdn) {
            LinnDevice prev = devicesByUdn.get(device.udn);
            changed = prev == null
                    || !prev.locationUrl.equals(device.locationUrl)
                    || !prev.getDisplayTitle().equals(device.getDisplayTitle());
            devicesByUdn.put(device.udn, device);
        }
        if (changed && listener != null) {
            List<LinnDevice> snapshot = getDevicesSnapshot();
            mainHandler.post(() -> listener.onDevicesChanged(Collections.unmodifiableList(snapshot)));
        }
    }

    private void collectSsdpLocations(String targetAddr, boolean unicast, Set<String> outLocations) {
        try (DatagramSocket socket = new DatagramSocket()) {
            socket.setSoTimeout(2200);
            socket.setBroadcast(true);
            InetAddress addr = InetAddress.getByName(targetAddr);

            for (String st : SEARCH_TARGETS) {
                String msg = "M-SEARCH * HTTP/1.1\r\n"
                        + "HOST: " + targetAddr + ":" + SSDP_PORT + "\r\n"
                        + "MAN: \"ssdp:discover\"\r\n"
                        + "MX: 2\r\n"
                        + "ST: " + st + "\r\n\r\n";
                byte[] bytes = msg.getBytes(StandardCharsets.US_ASCII);
                DatagramPacket pkt = new DatagramPacket(bytes, bytes.length, new InetSocketAddress(addr, SSDP_PORT));
                socket.send(pkt);
                if (!unicast) {
                    socket.send(pkt);
                }
            }

            long deadline = System.currentTimeMillis() + (unicast ? 1200 : 2600);
            byte[] buf = new byte[4096];
            while (System.currentTimeMillis() < deadline) {
                DatagramPacket resp = new DatagramPacket(buf, buf.length);
                try {
                    socket.receive(resp);
                    String packetStr = new String(resp.getData(), resp.getOffset(), resp.getLength(), StandardCharsets.UTF_8);
                    String loc = extractHeader(packetStr, "LOCATION");
                    if (loc != null && (loc.startsWith("http://") || loc.startsWith("https://"))) {
                        outLocations.add(loc.trim());
                    }
                } catch (SocketTimeoutException timeout) {
                    break;
                }
            }
        } catch (Exception ignored) {
        }
    }

    private static String extractHeader(String packet, String headerName) {
        String[] lines = packet.split("\r?\n");
        String prefix = headerName.toLowerCase(Locale.ROOT) + ":";
        for (String line : lines) {
            String lower = line.toLowerCase(Locale.ROOT);
            if (lower.startsWith(prefix)) {
                return line.substring(prefix.length()).trim();
            }
        }
        return null;
    }

    private static LinnDevice fetchAndParseDevice(String locationUrl) {
        try {
            LinnRawHttpClient.HttpResponse resp = LinnRawHttpClient.get(locationUrl);
            if (!resp.isSuccessful() || resp.body.isEmpty()) {
                return null;
            }
            LinnDevice dev = parseDeviceDescriptionXml(locationUrl, resp.body);
            if (dev == null || !dev.supportsPlaylist()) {
                return null;
            }
            String room = dev.roomName;
            if (room.isEmpty() && dev.supportsProduct()) {
                String fetchedRoom = LinnOpenHomeClient.getRoomName(dev);
                if (fetchedRoom != null && !fetchedRoom.trim().isEmpty()) {
                    return new LinnDevice(
                            dev.udn,
                            dev.friendlyName,
                            fetchedRoom.trim(),
                            dev.modelName,
                            dev.manufacturer,
                            dev.host,
                            dev.port,
                            dev.locationUrl,
                            dev.productControlUrl,
                            dev.playlistControlUrl,
                            dev.volumeControlUrl,
                            dev.timeControlUrl,
                            dev.infoControlUrl,
                            dev.productServiceType,
                            dev.playlistServiceType,
                            dev.volumeServiceType,
                            dev.timeServiceType
                    );
                }
            }
            return dev;
        } catch (Exception ignored) {
            return null;
        }
    }

    public static LinnDevice parseDeviceDescriptionXml(String locationUrl, String xml) {
        if (xml == null || xml.isEmpty()) {
            return null;
        }
        try {
            URI locUri = URI.create(locationUrl);
            String host = locUri.getHost() != null ? locUri.getHost() : "";
            int port = locUri.getPort() > 0 ? locUri.getPort() : 80;
            String baseUrl = locationUrl;

            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
            factory.setNamespaceAware(true);
            XmlPullParser parser = factory.newPullParser();
            parser.setInput(new StringReader(xml));

            String udn = null;
            String friendlyName = null;
            String modelName = null;
            String manufacturer = null;
            String productControlUrl = null;
            String playlistControlUrl = null;
            String volumeControlUrl = null;
            String timeControlUrl = null;
            String infoControlUrl = null;
            String productServiceType = null;
            String playlistServiceType = null;
            String volumeServiceType = null;
            String timeServiceType = null;

            String currentServiceType = null;
            String currentControlUrl = null;
            boolean inService = false;
            int depth = 0;
            int minDeviceDepth = Integer.MAX_VALUE;

            int event = parser.getEventType();
            while (event != XmlPullParser.END_DOCUMENT) {
                if (event == XmlPullParser.START_TAG) {
                    depth++;
                    String tag = parser.getName();
                    if ("URLBase".equalsIgnoreCase(tag)) {
                        String u = readSafeText(parser);
                        if (u != null && !u.trim().isEmpty()) {
                            baseUrl = u.trim();
                        }
                        depth--;
                    } else if ("device".equalsIgnoreCase(tag)) {
                        if (depth < minDeviceDepth) {
                            minDeviceDepth = depth;
                        }
                    } else if ("service".equalsIgnoreCase(tag)) {
                        inService = true;
                        currentServiceType = null;
                        currentControlUrl = null;
                    } else if (inService && "serviceType".equalsIgnoreCase(tag)) {
                        currentServiceType = readSafeText(parser);
                        depth--;
                    } else if (inService && "controlURL".equalsIgnoreCase(tag)) {
                        currentControlUrl = readSafeText(parser);
                        depth--;
                    } else if (!inService) {
                        if ("UDN".equalsIgnoreCase(tag) && (udn == null || depth == minDeviceDepth + 1)) {
                            String v = readSafeText(parser);
                            if (v != null && !v.isEmpty()) udn = v.trim();
                            depth--;
                        } else if ("friendlyName".equalsIgnoreCase(tag) && (friendlyName == null || depth == minDeviceDepth + 1)) {
                            String v = readSafeText(parser);
                            if (v != null && !v.isEmpty()) friendlyName = v.trim();
                            depth--;
                        } else if ("modelName".equalsIgnoreCase(tag) && (modelName == null || depth == minDeviceDepth + 1)) {
                            String v = readSafeText(parser);
                            if (v != null && !v.isEmpty()) modelName = v.trim();
                            depth--;
                        } else if ("manufacturer".equalsIgnoreCase(tag) && (manufacturer == null || depth == minDeviceDepth + 1)) {
                            String v = readSafeText(parser);
                            if (v != null && !v.isEmpty()) manufacturer = v.trim();
                            depth--;
                        }
                    }
                } else if (event == XmlPullParser.END_TAG) {
                    String tag = parser.getName();
                    if ("service".equalsIgnoreCase(tag) && inService) {
                        String resolved = LinnRawHttpClient.resolveUrl(baseUrl, currentControlUrl);
                        if (currentServiceType != null && resolved != null) {
                            if (currentServiceType.startsWith("urn:av-openhome-org:service:Product:")) {
                                productControlUrl = resolved;
                                productServiceType = currentServiceType;
                            } else if (currentServiceType.startsWith("urn:av-openhome-org:service:Playlist:")) {
                                playlistControlUrl = resolved;
                                playlistServiceType = currentServiceType;
                            } else if (currentServiceType.startsWith("urn:av-openhome-org:service:Volume:")) {
                                volumeControlUrl = resolved;
                                volumeServiceType = currentServiceType;
                            } else if (currentServiceType.startsWith("urn:av-openhome-org:service:Time:")) {
                                timeControlUrl = resolved;
                                timeServiceType = currentServiceType;
                            } else if (currentServiceType.startsWith("urn:av-openhome-org:service:Info:")) {
                                infoControlUrl = resolved;
                            }
                        }
                        inService = false;
                    }
                    depth--;
                }
                event = parser.next();
            }

            if (playlistControlUrl == null) {
                return null;
            }
            boolean isLinnOrOpenHomeProduct = (productControlUrl != null)
                    || (manufacturer != null && manufacturer.toLowerCase(Locale.ROOT).contains("linn"));
            if (!isLinnOrOpenHomeProduct) {
                return null;
            }
            return new LinnDevice(
                    udn,
                    friendlyName,
                    "",
                    modelName,
                    manufacturer,
                    host,
                    port,
                    locationUrl,
                    productControlUrl,
                    playlistControlUrl,
                    volumeControlUrl,
                    timeControlUrl,
                    infoControlUrl,
                    productServiceType,
                    playlistServiceType,
                    volumeServiceType,
                    timeServiceType
            );
        } catch (Exception e) {
            return null;
        }
    }

    private static String readSafeText(XmlPullParser parser) throws Exception {
        String text = parser.nextText();
        return text != null ? text.trim() : null;
    }

    private void acquireMulticastLock() {
        try {
            if (multicastLock != null && multicastLock.isHeld()) {
                return;
            }
            Context app = LinnTidalBridge.nativeGetAppContext();
            if (app == null) {
                return;
            }
            WifiManager wm = (WifiManager) app.getApplicationContext().getSystemService(Context.WIFI_SERVICE);
            if (wm != null) {
                WifiManager.MulticastLock lock = wm.createMulticastLock("MaterialTidalLinnSSDP");
                lock.setReferenceCounted(false);
                lock.acquire();
                multicastLock = lock;
            }
        } catch (Throwable ignored) {
        }
    }

    private void releaseMulticastLock() {
        try {
            WifiManager.MulticastLock lock = multicastLock;
            multicastLock = null;
            if (lock != null && lock.isHeld()) {
                lock.release();
            }
        } catch (Throwable ignored) {
        }
    }
}
