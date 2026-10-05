/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 * Copyright (C) 2026 riky-dev (CapCut adaptation)
 *
 * See the included NOTICE / wireguard licenses for terms.
 */

package app.riky.extension.capcut.tunnel;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.os.Build;

import com.wireguard.android.backend.GoBackend;

/** Foreground lifecycle around the unmodified upstream userspace backend service. */
public final class WireGuardVpnService extends GoBackend.VpnService {
    private static final String CHANNEL = "riky_capcut_tunnel";
    private static final int NOTIFICATION = 0x72696b79;
    private boolean foregroundFailed;

    @Override public void onCreate() {
        try {
            NotificationManager notifications = getSystemService(NotificationManager.class);
            notifications.createNotificationChannel(new NotificationChannel(CHANNEL, "CapCut network tunnel",
                    NotificationManager.IMPORTANCE_LOW));
            Intent openImport = new Intent(this, TunnelImportActivity.class);
            PendingIntent pending = PendingIntent.getActivity(
                    this, NOTIFICATION, openImport,
                    PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
            Notification notification = new Notification.Builder(this, CHANNEL)
                    .setSmallIcon(android.R.drawable.stat_sys_warning)
                    .setContentTitle("CapCut network tunnel")
                    .setContentText("CapCut-only WireGuard active. Tap to manage config.")
                    .setContentIntent(pending)
                    .setOngoing(true)
                    .setCategory(Notification.CATEGORY_SERVICE)
                    .build();
            if (Build.VERSION.SDK_INT >= 34) {
                startForeground(NOTIFICATION, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_SYSTEM_EXEMPTED);
            } else {
                startForeground(NOTIFICATION, notification);
            }
        } catch (Exception | LinkageError error) {
            foregroundFailed = true;
            stopSelf();
        }
        super.onCreate();
    }

    @Override public Builder getBuilder() {
        if (foregroundFailed) throw new IllegalStateException("VPN foreground service unavailable");
        return super.getBuilder();
    }

    @Override public int onStartCommand(android.content.Intent intent, int flags, int startId) {
        super.onStartCommand(intent, flags, startId);
        return START_NOT_STICKY;
    }

    @Override public void onRevoke() { stopSelf(); }

    @Override public void onDestroy() {
        stopForeground(STOP_FOREGROUND_REMOVE);
        WireGuardManager.get(this).serviceDestroyed(() -> super.onDestroy());
    }
}
