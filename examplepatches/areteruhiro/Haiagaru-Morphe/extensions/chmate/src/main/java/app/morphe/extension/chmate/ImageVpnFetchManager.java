package app.morphe.extension.chmate;

import android.content.Context;
import android.os.Looper;
import app.morphe.extension.chmate.vpn.nativecore.imagevpn.Image;
import app.morphe.extension.chmate.vpn.sstp.SstpImageSession;
import java.io.Closeable;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

/** Private image-only connection owner used by the optional native image relay. */
public final class ImageVpnFetchManager implements Closeable {
    private static ImageVpnFetchManager instance;
    private final Context context;
    private final Semaphore worker = new Semaphore(1, true);
    private volatile boolean closed;
    private volatile String status = "IMAGE_VPN_IDLE";
    private volatile SstpImageSession tunnel;
    private NativeImagePacketStack packets;

    public static synchronized ImageVpnFetchManager getInstance(Context context) {
        if (instance == null || instance.closed) instance = new ImageVpnFetchManager(context);
        return instance;
    }

    private ImageVpnFetchManager(Context context) {
        Context application = context.getApplicationContext();
        this.context = application != null ? application : context;
    }

    public String status() { return status; }

    public Image fetch(String url) throws IOException {
        return fetch(url, false);
    }

    Image fetchPreview(String url) throws IOException { return fetch(url, true); }

    private Image fetch(String url, boolean preview) throws IOException {
        if (Looper.myLooper() == Looper.getMainLooper()) throw new IOException("IMAGE_VPN_WORKER_REQUIRED");
        // Validate before even downloading the server catalogue.
        if (preview ? SiteCardMetadata.safeUrl(url) == null : !ImageVpnRequestPolicy.isProtectedUrl(url))
            throw new IOException("IMAGE_VPN_INVALID_IMAGE_URL");
        boolean acquired = false;
        try {
            acquired = worker.tryAcquire(5, TimeUnit.SECONDS);
            if (!acquired) throw new IOException("IMAGE_VPN_BUSY");
            if (closed) throw new IOException("IMAGE_VPN_DISABLED");
            if (tunnel == null || !tunnel.isConnected()) connect();
            NativeImagePacketStack activePackets = packets;
            SstpImageSession activeTunnel = tunnel;
            if (activePackets == null || activeTunnel == null) throw new IOException("IMAGE_VPN_DISCONNECTED");
            Image result = preview ? activePackets.fetchPreview(url) : activePackets.fetch(url);
            if (closed || !activeTunnel.isConnected()) throw new IOException("IMAGE_VPN_DISCONNECTED");
            status = "IMAGE_VPN_CONNECTED";
            return result;
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            throw new IOException("IMAGE_VPN_INTERRUPTED", interrupted);
        } catch (IOException | RuntimeException | LinkageError failure) {
            if (acquired) {
                disconnect();
                status = closed ? "IMAGE_VPN_DISABLED" : "IMAGE_VPN_FETCH_FAILED";
            }
            throw new IOException("IMAGE_VPN_FETCH_FAILED", failure);
        } finally { if (acquired) worker.release(); }
    }

    private void connect() throws IOException {
        disconnect();
        status = "IMAGE_VPN_CATALOG_LOADING";
        List<VpnGateCatalog.Server> servers = VpnGateCatalog.fetch();
        IOException last = null;
        // Bound retries; each candidate must authenticate TLS and finish PPP/IP.
        for (int index = 0; index < Math.min(3, servers.size()); index++) {
            if (closed) throw new IOException("IMAGE_VPN_DISABLED");
            VpnGateCatalog.Server server = servers.get(index);
            NativeImagePacketStack stack = new NativeImagePacketStack();
            SstpImageSession candidate = new SstpImageSession(context, server.ip,
                    server.hostname, server.port, server.trustAnchorPem, stack);
            synchronized (this) {
                if (closed) { candidate.close(); throw new IOException("IMAGE_VPN_DISABLED"); }
                packets = stack;
                tunnel = candidate;
            }
            try {
                status = "IMAGE_VPN_CONNECTING";
                candidate.start();
                candidate.awaitReady(20000);
                if (closed) throw new IOException("IMAGE_VPN_DISABLED");
                status = "IMAGE_VPN_CONNECTED";
                return;
            } catch (Exception failure) {
                last = new IOException("IMAGE_VPN_CONNECT_FAILED", failure);
                disconnect();
                if (Thread.currentThread().isInterrupted()) throw last;
            }
        }
        throw last != null ? last : new IOException("IMAGE_VPN_NO_SUPPORTED_SERVER");
    }

    private synchronized void disconnect() {
        SstpImageSession current = tunnel;
        tunnel = null;
        NativeImagePacketStack stack = packets;
        packets = null;
        if (current != null) current.close();
        else if (stack != null) stack.close();
    }

    @Override public void close() {
        closed = true;
        disconnect();
        status = "IMAGE_VPN_DISABLED";
    }
}
