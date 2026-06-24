package dev.jason.gboardpatches.extension.webclipboard;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.LinkedHashSet;
import java.util.List;

public final class WebClipboardEndpointResolver {
    private WebClipboardEndpointResolver() {
    }

    public static List<String> resolveUrls(int port) {
        int safePort = WebClipboardPreferences.sanitizePort(port);
        int safeHttpsPort = ClipboardSyncHttpsSocketFactory.defaultHttpsPortFor(safePort);
        LinkedHashSet<String> urls = new LinkedHashSet<>();
        try {
            Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();
            while (interfaces != null && interfaces.hasMoreElements()) {
                NetworkInterface networkInterface = interfaces.nextElement();
                if (networkInterface == null || !networkInterface.isUp()
                        || networkInterface.isLoopback()) {
                    continue;
                }
                Enumeration<InetAddress> addresses = networkInterface.getInetAddresses();
                while (addresses.hasMoreElements()) {
                    InetAddress address = addresses.nextElement();
                    if (!(address instanceof Inet4Address)
                            || address.isLoopbackAddress()
                            || address.isLinkLocalAddress()) {
                        continue;
                    }
                    urls.add("http://" + address.getHostAddress() + ":" + safePort + "/");
                    urls.add("https://" + address.getHostAddress() + ":" + safeHttpsPort + "/");
                }
            }
        } catch (Throwable ignored) {
            // Fall back to the placeholder below.
        }
        if (urls.isEmpty()) {
            urls.add("http://<phone LAN IP>:" + safePort + "/");
            urls.add("https://<phone LAN IP>:" + safeHttpsPort + "/");
        }
        return Collections.unmodifiableList(new ArrayList<>(urls));
    }
}

