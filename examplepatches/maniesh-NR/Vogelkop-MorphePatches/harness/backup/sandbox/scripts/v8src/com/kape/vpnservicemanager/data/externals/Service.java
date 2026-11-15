package com.kape.vpnservicemanager.data.externals;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.VpnService;
import android.os.Build;
import android.os.ParcelFileDescriptor;

import com.zai.sysvpn.Res;
import com.zai.sysvpn.VpnController;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;

/**
 * v8 embedded system-wide free VPN.
 *
 * Reuses the (otherwise dead) manifest declaration of Opera's VPN Pro
 * infrastructure partner: the {@code com.kape.vpnservicemanager} service
 * entry with BIND_VPN_SERVICE, the android.net.VpnService intent filter and
 * a systemExempted foreground type. The Pro client classes never ship in
 * sideloaded builds, so this name was free.
 *
 * Stack: tun (establish) -> hev-socks5-tunnel (JNI, in-process) ->
 * 127.0.0.1:18080 -> liboprx.so (opera-proxy child process, SOCKS5 mode) ->
 * *.sec-tunnel.com free servers.
 *
 * Loop prevention: the whole browser package is disallowed from the tun, so
 * opera-proxy's upstream sockets can never re-enter the VPN. The browser
 * keeps using its own in-browser free VPN path.
 */
public final class Service extends VpnService {

    public static volatile boolean sRunning = false;

    private static final int NOTIF_ID = 0x56505031; // "VPP1"
    private static final int CONSENT_NOTIF_ID = 0x56505032;
    private static final String CHANNEL_ID = "sysvpn";
    private static final String PROXY_ADDR = "127.0.0.1";
    private static final int PROXY_PORT = 18080;
    private static final String TUN_V4 = "198.18.0.1";
    private static final String TUN_V6 = "fc00::1";
    private static final String DNS_V4 = "198.18.0.2";

    private java.lang.Process child;
    private ParcelFileDescriptor tun;
    private Thread tunnelThread;

    @Override
    public void onCreate() {
        super.onCreate();
        NotificationManager nm = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
        if (nm != null && Build.VERSION.SDK_INT >= 26) {
            NotificationChannel ch = new NotificationChannel(CHANNEL_ID,
                    "System VPN", NotificationManager.IMPORTANCE_LOW);
            ch.setDescription("System-wide free VPN status");
            nm.createNotificationChannel(ch);
        }
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        String action = intent != null ? intent.getAction() : VpnController.ACTION_TOGGLE;
        if (action == null) {
            action = VpnController.ACTION_TOGGLE;
        }
        String regionExtra = intent != null
                ? intent.getStringExtra(VpnController.EXTRA_REGION) : null;

        if (VpnController.ACTION_DISABLE.equals(action)) {
            stopVpn(false);
            return START_NOT_STICKY;
        }

        if (VpnController.ACTION_RESTART.equals(action)) {
            if (regionExtra != null) {
                VpnController.setRegion(this, regionExtra);
            }
            if (sRunning) {
                stopVpn(true);
                startVpn();
            } else {
                startVpn();
            }
            return START_NOT_STICKY;
        }

        // ENABLE / TOGGLE / anything else
        if (VpnController.ACTION_TOGGLE.equals(action) && sRunning) {
            stopVpn(false);
            return START_NOT_STICKY;
        }
        startVpn();
        return START_NOT_STICKY;
    }

    // ------------------------------------------------------------------ start

    private void startVpn() {
        if (sRunning) {
            updateStatusNotification();
            return;
        }
        // startForegroundService contract: go foreground immediately.
        startForegroundCompat(buildNotification("Connecting\u2026", false));

        // 1. VPN consent (one-time, via notification tap on first enable).
        Intent prep;
        try {
            prep = prepare(this);
        } catch (Throwable t) {
            prep = null;
        }
        if (prep != null) {
            postConsentNotification(prep);
            stopForeground(true);
            stopSelf();
            return;
        }

        // 2. Establish the tun interface.
        try {
            Builder b = new Builder();
            b.setSession("Opera VPN");
            b.setMtu(8500);
            b.addAddress(TUN_V4, 32);
            b.addAddress(TUN_V6, 128);
            b.addDnsServer(DNS_V4);
            b.addRoute("0.0.0.0", 0);
            b.addRoute("::", 0);
            try {
                b.addDisallowedApplication(getPackageName());
            } catch (Throwable ignored) {
                // without this the upstream would loop; bail out instead
                stopForeground(true);
                stopSelf();
                return;
            }
            tun = b.establish();
        } catch (Throwable t) {
            tun = null;
        }
        if (tun == null) {
            stopForeground(true);
            stopSelf();
            return;
        }

        // 3. Kill any orphaned opera-proxy child from a previous life
        //    (app crash leaves it holding 127.0.0.1:18080).
        killOrphanChild();

        // 4. Start opera-proxy (child process from nativeLibraryDir).
        try {
            File exe = new File(getApplicationInfo().nativeLibraryDir, "liboprx.so");
            File dir = workDir();
            File log = new File(dir, "opera-proxy.log");
            ProcessBuilder pb = new ProcessBuilder(
                    exe.getAbsolutePath(),
                    "-bind-address", PROXY_ADDR + ":" + PROXY_PORT,
                    "-socks-mode",
                    "-country", VpnController.getRegion(this),
                    "-server-selection", "first");
            pb.redirectErrorStream(true);
            pb.redirectOutput(log);
            child = pb.start();
            writeChildPid();
        } catch (Throwable t) {
            teardownTun();
            stopForeground(true);
            stopSelf();
            return;
        }

        // 5. Start hev-socks5-tunnel (JNI) with the tun fd.
        File config = new File(workDir(), "hev.yml");
        writeHevConfig(config);
        final String configPath = config.getAbsolutePath();
        final int tunFd = tun.getFd();
        tunnelThread = new Thread(new Runnable() {
            public void run() {
                try {
                    hev.htproxy.TProxyService.TProxyStartService(configPath, tunFd);
                } catch (Throwable ignored) {
                }
            }
        }, "hev-socks5-tunnel");
        tunnelThread.start();

        sRunning = true;
        updateStatusNotification();
        VpnController.refreshTile(Service.this);
        pushWidgets(Service.this);
    }

        /** Push a widget update through the (patched) Opera widget provider. */
    private static void pushWidgets(Context c) {
        try {
            Class<?> w = Class.forName(
                    "com.opera.android.vpn.app_widget.VpnProAppWidget");
            Object inst = w.newInstance();
            w.getMethod("b", Context.class).invoke(inst, c);
        } catch (Throwable ignored) {
        }
    }

    // ------------------------------------------------------------------- stop

    private void stopVpn(boolean keepServiceAlive) {
        stopTunnel();
        if (!keepServiceAlive) {
            stopForeground(true);
            stopSelf();
        }
        VpnController.refreshTile(this);
        pushWidgets(this);
    }

    private void stopTunnel() {
        sRunning = false;
        try {
            hev.htproxy.TProxyService.TProxyStopService();
        } catch (Throwable ignored) {
        }
        if (tunnelThread != null) {
            try {
                tunnelThread.join(1500);
            } catch (InterruptedException ignored) {
                Thread.currentThread().interrupt();
            }
            tunnelThread = null;
        }
        killChild();
        killOrphanChild();
        teardownTun();
    }

    private void teardownTun() {
        if (tun != null) {
            try {
                tun.close();
            } catch (Throwable ignored) {
            }
            tun = null;
        }
    }

    @Override
    public void onRevoke() {
        // System revoked the VPN (another VPN took over / user disconnect).
        stopVpn(false);
    }

    @Override
    public void onDestroy() {
        stopTunnel();
        super.onDestroy();
    }

    // ------------------------------------------------------------- child mgmt

    private File workDir() {
        File d = new File(getFilesDir(), "sysvpn");
        if (!d.exists()) {
            d.mkdirs();
        }
        return d;
    }

    private File pidFile() {
        return new File(workDir(), "opera-proxy.pid");
    }

    /** Record the pid of the freshly started liboprx child (or -1). */
    private void writeChildPid() {
        long found = -1;
        long[] pids = ProcessApi.getChildPids();
        for (int i = 0; i < pids.length; i++) {
            if (isLibOprxProcess(pids[i])) {
                found = pids[i];
            }
        }
        try {
            FileOutputStream fo = new FileOutputStream(pidFile());
            fo.write(String.valueOf(found).getBytes(Charset.forName("US-ASCII")));
            fo.close();
        } catch (Throwable ignored) {
        }
    }

    private static boolean isLibOprxProcess(long pid) {
        try {
            File cmd = new File("/proc/" + pid + "/cmdline");
            FileInputStream c = new FileInputStream(cmd);
            byte[] cb = new byte[256];
            int cn = c.read(cb);
            c.close();
            String cs = new String(cb, 0, Math.max(cn, 0), Charset.forName("US-ASCII"));
            return cs.contains("liboprx");
        } catch (Throwable t) {
            return false;
        }
    }

    private void killChild() {
        if (child != null) {
            try {
                child.destroy();
            } catch (Throwable ignored) {
            }
            child = null;
        }
    }

    /** Kill a leftover liboprx process from a previous app lifetime. */
    private void killOrphanChild() {
        try {
            FileInputStream fi = new FileInputStream(pidFile());
            byte[] buf = new byte[32];
            int n = fi.read(buf);
            fi.close();
            pidFile().delete();
            if (n <= 0) {
                return;
            }
            String s = new String(buf, 0, n, Charset.forName("US-ASCII")).trim();
            long pid = Long.parseLong(s);
            if (pid <= 0) {
                return;
            }
            if (isLibOprxProcess(pid)) {
                android.os.Process.killProcess((int) pid);
            }
        } catch (Throwable ignored) {
            pidFile().delete();
        }
    }

    // -------------------------------------------------------------- hev config

    private void writeHevConfig(File out) {
        StringBuilder sb = new StringBuilder();
        sb.append("tunnel:\n");
        sb.append("  name: tun0\n");
        sb.append("  mtu: 8500\n");
        sb.append("  ipv4: ").append(TUN_V4).append('\n');
        sb.append("  ipv6: '").append(TUN_V6).append("'\n");
        sb.append("socks5:\n");
        sb.append("  port: ").append(PROXY_PORT).append('\n');
        sb.append("  address: ").append(PROXY_ADDR).append('\n');
        sb.append("mapdns:\n");
        sb.append("  address: ").append(DNS_V4).append('\n');
        sb.append("  port: 53\n");
        sb.append("  cache-size: 10000\n");
        sb.append("misc:\n");
        sb.append("  log-level: warn\n");
        try {
            FileOutputStream fo = new FileOutputStream(out);
            fo.write(sb.toString().getBytes(Charset.forName("UTF-8")));
            fo.close();
        } catch (IOException ignored) {
        }
    }

    // ----------------------------------------------------------- notifications

    private Notification buildNotification(String text, boolean withRegionButtons) {
        Notification.Builder b;
        if (Build.VERSION.SDK_INT >= 26) {
            b = new Notification.Builder(this, CHANNEL_ID);
        } else {
            b = new Notification.Builder(this);
        }
        b.setSmallIcon(Res.DRAWABLE_VPN_ON);
        b.setContentTitle("Opera VPN");
        b.setContentText(text);
        b.setOngoing(true);
        b.setOnlyAlertOnce(true);
        b.setShowWhen(false);
        b.setContentIntent(VpnController.servicePending(this,
                VpnController.ACTION_TOGGLE, 1));
        if (withRegionButtons) {
            b.addAction(0, "Europe",
                    regionPending("EU", 2));
            b.addAction(0, "Asia",
                    regionPending("AS", 3));
            b.addAction(0, "Americas",
                    regionPending("AM", 4));
        }
        return b.build();
    }

    private PendingIntent regionPending(String region, int requestCode) {
        Intent i = new Intent(this, com.kape.vpnservicemanager.data.externals.Service.class);
        i.setComponent(new android.content.ComponentName(this,
                "com.opera.android.vpn.VpnReceiver"));
        i.setAction(VpnController.ACTION_RESTART);
        i.putExtra(VpnController.EXTRA_REGION, region);
        int flags = PendingIntent.FLAG_UPDATE_CURRENT;
        if (Build.VERSION.SDK_INT >= 23) {
            flags |= PendingIntent.FLAG_IMMUTABLE;
        }
        return PendingIntent.getBroadcast(this, requestCode, i, flags);
    }

    private void updateStatusNotification() {
        NotificationManager nm = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
        if (nm != null) {
            String region = VpnController.regionName(VpnController.getRegion(this));
            nm.notify(NOTIF_ID,
                    buildNotification("Connected \u2014 " + region
                            + " \u00b7 tap to stop", true));
        }
    }

    private void postConsentNotification(Intent prep) {
        NotificationManager nm = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
        if (nm == null) {
            return;
        }
        int flags = PendingIntent.FLAG_UPDATE_CURRENT;
        if (Build.VERSION.SDK_INT >= 23) {
            flags |= PendingIntent.FLAG_IMMUTABLE;
        }
        PendingIntent pi = PendingIntent.getActivity(this, 5, prep, flags);
        Notification.Builder b;
        if (Build.VERSION.SDK_INT >= 26) {
            b = new Notification.Builder(this, CHANNEL_ID);
        } else {
            b = new Notification.Builder(this);
        }
        b.setSmallIcon(Res.DRAWABLE_VPN_ON);
        b.setContentTitle("Opera VPN");
        b.setContentText("Tap to allow the VPN connection, then tap the VPN tile again.");
        b.setContentIntent(pi);
        b.setAutoCancel(true);
        nm.notify(CONSENT_NOTIF_ID, b.build());
    }

    private void startForegroundCompat(Notification n) {
        if (Build.VERSION.SDK_INT >= 29) {
            // The 2-arg form is not available before API 24-compatible paths;
            // use the 3-arg with the manifest-declared type on 29+.
            try {
                startForeground(NOTIF_ID, n, 0x400 /* SYSTEM_EXEMPTED */);
                return;
            } catch (Throwable ignored) {
                // fall back to the classic form
            }
        }
        startForeground(NOTIF_ID, n);
    }

    // Small helper to discover direct children (API 24+: /proc/self/task scan).
    static final class ProcessApi {
        static long[] getChildPids() {
            try {
                File task = new File("/proc/self/task");
                File[] tasks = task.listFiles();
                if (tasks == null) {
                    return new long[0];
                }
                java.util.ArrayList<Long> out = new java.util.ArrayList<Long>();
                for (File t : tasks) {
                    File children = new File(t, "children");
                    FileInputStream fi = new FileInputStream(children);
                    byte[] buf = new byte[256];
                    int n = fi.read(buf);
                    fi.close();
                    if (n <= 0) {
                        continue;
                    }
                    String s = new String(buf, 0, n, Charset.forName("US-ASCII")).trim();
                    String[] parts = s.split("\\s+");
                    for (String p : parts) {
                        try {
                            out.add(Long.parseLong(p));
                        } catch (NumberFormatException ignored) {
                        }
                    }
                }
                long[] r = new long[out.size()];
                for (int i = 0; i < out.size(); i++) {
                    r[i] = out.get(i).longValue();
                }
                return r;
            } catch (Throwable t) {
                return new long[0];
            }
        }
    }
}
