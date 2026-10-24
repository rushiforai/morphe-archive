package app.morphe.extension.chmate;

import android.util.Base64;
import app.morphe.extension.chmate.vpn.sstp.SstpImageSession;
import app.morphe.extension.chmate.vpn.nativecore.imagevpn.Image;
import app.morphe.extension.chmate.vpn.nativecore.imagevpn.Imagevpn;
import app.morphe.extension.chmate.vpn.nativecore.imagevpn.Session;
import java.io.IOException;
import java.security.cert.X509Certificate;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;

/** Go userspace stack bridge. It has no default-network socket factory. */
public final class NativeImagePacketStack implements SstpImageSession.PacketStack {
    private volatile Session session;
    private static volatile String roots;

    @Override public synchronized void initialize(String address, String dns, int mtu, SstpImageSession.PacketWriter writer) {
        if (session != null) throw new IllegalStateException("IMAGE_VPN_STACK_ALREADY_INITIALIZED");
        try {
            session = Imagevpn.newSession(address, dns, rootsPem(), mtu, writer::writePacket);
        } catch (Exception error) { throw new IllegalStateException("IMAGE_VPN_STACK_INITIALIZATION_FAILED", error); }
    }

    @Override public void receive(byte[] packet) {
        Session current = session;
        if (current == null) throw new IllegalStateException("IMAGE_VPN_STACK_DISCONNECTED");
        try { current.receive(packet); }
        catch (Exception error) { throw new IllegalStateException("IMAGE_VPN_PACKET_FAILED", error); }
    }

    public Image fetch(String url) throws IOException {
        Session current = session;
        if (current == null) throw new IOException("IMAGE_VPN_STACK_DISCONNECTED");
        try { return current.fetch(url, 32L * 1024 * 1024, 30000); }
        catch (Exception error) { throw new IOException("IMAGE_VPN_IMAGE_FETCH_FAILED", error); }
    }

    public Image fetchPreview(String url) throws IOException {
        Session current = session;
        if (current == null) throw new IOException("IMAGE_VPN_STACK_DISCONNECTED");
        try { return current.fetchPreview(url, 2L * 1024 * 1024, 15000); }
        catch (Exception error) { throw new IOException("IMAGE_VPN_PREVIEW_FETCH_FAILED", error); }
    }

    public String probeExitAddress() throws IOException {
        Session current = session;
        if (current == null) throw new IOException("IMAGE_VPN_STACK_DISCONNECTED");
        try { return current.probeExitAddress(); }
        catch (Exception failure) { throw new IOException("IMAGE_VPN_EXIT_PROBE_FAILED", failure); }
    }

    @Override public synchronized void close() {
        Session current = session; session = null;
        if (current != null) current.close();
    }

    private static synchronized String rootsPem() throws Exception {
        if (roots != null) return roots;
        TrustManagerFactory factory = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
        factory.init((java.security.KeyStore) null);
        StringBuilder pem = new StringBuilder();
        for (TrustManager manager : factory.getTrustManagers()) {
            if (!(manager instanceof X509TrustManager)) continue;
            for (X509Certificate cert : ((X509TrustManager) manager).getAcceptedIssuers()) {
                pem.append("-----BEGIN CERTIFICATE-----\n")
                        .append(Base64.encodeToString(cert.getEncoded(), Base64.NO_WRAP))
                        .append("\n-----END CERTIFICATE-----\n");
            }
        }
        if (pem.length() == 0) throw new IOException("IMAGE_VPN_NO_ANDROID_TRUST_ROOTS");
        roots = pem.toString(); return roots;
    }
}
