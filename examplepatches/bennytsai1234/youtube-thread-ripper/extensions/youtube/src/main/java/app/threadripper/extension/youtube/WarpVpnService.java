package app.threadripper.extension.youtube;

import android.content.Context;
import android.content.Intent;
import android.net.VpnService;
import android.os.Build;
import android.os.ParcelFileDescriptor;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructPollfd;

import java.io.FileDescriptor;
import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.nio.channels.DatagramChannel;

/**
 * VPN for this app only (addAllowedApplication of its own package) through Cloudflare WARP. The
 * service runs in the app's process, so the tunnel ends with the process at the latest. Declared in
 * the manifest by the WARP patch. {@link Warp} starts it in the foreground and stops it in the
 * background.
 */
@SuppressWarnings("unused")
public final class WarpVpnService extends VpnService {
    private static final int MTU = 1280; // WARP's MTU (wgcf, the 1.1.1.1 app)

    private static volatile WarpVpnService instance;

    private ParcelFileDescriptor tun;
    private WireGuard wireGuard;
    private Thread starter;
    private boolean stopped;

    static void start(Context context) {
        context.startService(new Intent(context, WarpVpnService.class));
    }

    static void stop() {
        WarpVpnService s = instance;
        if (s != null) s.shutdown();
    }

    static boolean running() {
        WarpVpnService s = instance;
        return s != null && s.active();
    }

    private synchronized boolean active() {
        return !stopped && (starter != null || wireGuard != null);
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        instance = this;
        synchronized (this) {
            stopped = false;
            if (starter == null && wireGuard == null) {
                starter = new Thread(this::connect, "TR-WARP-start");
                starter.start();
            }
        }
        return START_NOT_STICKY;
    }

    private void connect() {
        try {
            WarpAccount account = WarpAccount.get(this);
            InetSocketAddress peer = new InetSocketAddress(InetAddress.getByName(account.endpointHost), account.endpointPort);
            Builder b = new Builder()
                    .setSession("Thread Ripper WARP")
                    .setMtu(MTU)
                    .addAddress(account.v4, 32)
                    .addRoute("0.0.0.0", 0)
                    .addDnsServer("1.1.1.1")
                    .addDnsServer("1.0.0.1")
                    .addAllowedApplication(getPackageName());
            if (account.v6 != null) {
                b.addAddress(account.v6, 128).addRoute("::", 0).addDnsServer("2606:4700:4700::1111");
            }
            // VPNs count as metered by default from Android 10; the app would treat Wi-Fi as metered.
            if (Build.VERSION.SDK_INT >= 29) b.setMetered(false);
            synchronized (this) {
                if (stopped) return;
                tun = b.establish();
                if (tun == null) {
                    Log.i("WARP: VPN permission missing");
                    return;
                }
                wireGuard = new WireGuard(account.privateKey, account.peerPublicKey, peer, new Tun(tun.getFileDescriptor()),
                        p -> {
                            DatagramChannel ch = DatagramChannel.open();
                            if (!protect(ch.socket())) {
                                ch.close();
                                throw new IOException("protect failed");
                            }
                            ch.connect(p);
                            return ch;
                        });
                wireGuard.start();
            }
            Log.i("WARP: VPN up");
        } catch (Exception ex) {
            Log.e("WARP: start failure", ex);
            shutdown();
        } finally {
            synchronized (this) {
                starter = null;
            }
        }
    }

    private synchronized void shutdown() {
        stopped = true;
        boolean wasUp = wireGuard != null;
        if (wireGuard != null) {
            wireGuard.stop();
            wireGuard = null;
        }
        if (tun != null) {
            try {
                tun.close();
            } catch (IOException ignored) {
            }
            tun = null;
        }
        if (wasUp) Log.i("WARP: VPN down");
        stopSelf();
    }

    @Override
    public void onRevoke() {
        // Another VPN took over, or the user turned it off in system settings.
        shutdown();
        super.onRevoke();
    }

    @Override
    public void onDestroy() {
        shutdown();
        if (instance == this) instance = null;
        super.onDestroy();
    }

    /** The VPN interface; non-blocking (establish() default), polled while idle. */
    private static final class Tun implements WireGuard.Tun {
        private final FileDescriptor fd;
        private final StructPollfd[] poll = {new StructPollfd()};

        Tun(FileDescriptor fd) {
            this.fd = fd;
            poll[0].fd = fd;
            poll[0].events = (short) OsConstants.POLLIN;
        }

        @Override
        public int read(byte[] buf) throws IOException {
            try {
                return Os.read(fd, buf, 0, buf.length);
            } catch (ErrnoException ex) {
                if (ex.errno != OsConstants.EAGAIN) throw new IOException(ex);
            }
            try {
                Os.poll(poll, 500);
            } catch (ErrnoException ex) {
                if (ex.errno != OsConstants.EINTR) throw new IOException(ex);
            }
            return 0;
        }

        @Override
        public void write(byte[] buf, int off, int len) throws IOException {
            try {
                Os.write(fd, buf, off, len);
            } catch (ErrnoException ex) {
                // A full interface queue drops the packet, as a network would.
                if (ex.errno != OsConstants.EAGAIN) throw new IOException(ex);
            }
        }
    }
}
