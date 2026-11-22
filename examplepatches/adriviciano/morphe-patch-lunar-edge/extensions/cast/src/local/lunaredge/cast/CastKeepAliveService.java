package local.lunaredge.cast;

import android.app.*;
import android.content.*;
import android.content.pm.ServiceInfo;
import android.net.*;
import android.net.wifi.WifiManager;
import android.os.*;

/** Servicio visible de conexión a TV; mantiene CPU/red y libera todo al terminar la sesión. */
public final class CastKeepAliveService extends Service {
    private static final String CHANNEL = "lunar_cast_connection";
    private static final String STOP = "local.lunaredge.cast.STOP";
    private static final int NOTIFICATION = 26381;
    private static volatile CastKeepAliveService currentService;
    private SessionLease owned;
    private int serviceStartId;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private PowerManager.WakeLock cpu;
    private WifiManager.WifiLock wifi;
    private ConnectivityManager connectivity;
    private ConnectivityManager.NetworkCallback network;
    private volatile Network wifiNetwork;
    static boolean running() { return currentService != null; }

    private final Runnable renew = new Runnable() {
        @Override public void run() {
            if (owned == null || !owned.isCurrent()) { stopSelfResult(serviceStartId); return; }
            if (cpu != null) cpu.acquire(10 * 60 * 1000L);
            handler.postDelayed(this, 5 * 60 * 1000L);
        }
    };

    @Override public void onCreate() {
        super.onCreate();
        if (Build.VERSION.SDK_INT >= 26) {
            NotificationChannel channel = new NotificationChannel(CHANNEL, "Emisión a TV", NotificationManager.IMPORTANCE_LOW);
            channel.setDescription("Mantiene la emisión al bloquear la pantalla o cambiar de aplicación");
            getSystemService(NotificationManager.class).createNotificationChannel(channel);
        }
    }
    @Override public int onStartCommand(Intent intent, int flags, int startId) {
        serviceStartId = startId;
        if (intent != null && STOP.equals(intent.getAction())) { CastBackground.stopAll(); stopSelfResult(startId); return START_NOT_STICKY; }
        CastBackground.Binding binding = CastBackground.binding();
        if (binding == null) { stopSelfResult(startId); return START_NOT_STICKY; }
        owned = binding.lease;
        try {
            PendingIntent stop = PendingIntent.getService(this, NOTIFICATION, new Intent(this, getClass()).setAction(STOP), PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
            Notification.Builder builder = Build.VERSION.SDK_INT >= 26 ? new Notification.Builder(this, CHANNEL) : new Notification.Builder(this);
            Notification notification = builder.setSmallIcon(android.R.drawable.ic_media_play)
                    .setContentTitle("Emitiendo a TV · " + binding.protocol)
                    .setContentText("La emisión continúa con la pantalla apagada")
                    .setContentIntent(binding.open).setOngoing(true).setOnlyAlertOnce(true)
                    .setCategory(Notification.CATEGORY_TRANSPORT)
                    .addAction(new Notification.Action.Builder(android.R.drawable.ic_media_pause, "Dejar de emitir", stop).build()).build();
            if (Build.VERSION.SDK_INT >= 29) startForeground(NOTIFICATION, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_CONNECTED_DEVICE);
            else startForeground(NOTIFICATION, notification);
            currentService = this;
            if (cpu == null) {
                cpu = getSystemService(PowerManager.class).newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "LunarEdge:CastConnection");
                cpu.setReferenceCounted(false);
                // Los locks de alto rendimiento ya no protegen la pantalla apagada desde Android 14.
                if (Build.VERSION.SDK_INT < 34) {
                    WifiManager manager = (WifiManager) getApplicationContext().getSystemService(WIFI_SERVICE);
                    wifi = manager.createWifiLock(WifiManager.WIFI_MODE_FULL_HIGH_PERF, "LunarEdge:CastWifi");
                    wifi.setReferenceCounted(false); wifi.acquire();
                }
                connectivity = getSystemService(ConnectivityManager.class);
                network = new ConnectivityManager.NetworkCallback() {
                    @Override public void onAvailable(Network available) { wifiNetwork = available; }
                    @Override public void onLost(Network lost) {
                        if (!lost.equals(wifiNetwork)) return;
                        SessionLease lease = owned;
                        handler.post(() -> { if (lease != null && lease.isCurrent()) lease.stop(); });
                    }
                };
                connectivity.requestNetwork(new NetworkRequest.Builder().addTransportType(NetworkCapabilities.TRANSPORT_WIFI).build(), network);
            }
            handler.removeCallbacks(renew); renew.run();
        } catch (RuntimeException error) {
            if (owned != null) owned.stop(); stopSelfResult(startId);
            android.widget.Toast.makeText(this, "No se pudo mantener activa la emisión: " + error.getClass().getSimpleName(), android.widget.Toast.LENGTH_LONG).show();
        }
        return START_NOT_STICKY;
    }
    @Override public void onDestroy() {
        boolean ownsNotification = currentService == this;
        if (ownsNotification) currentService = null;
        handler.removeCallbacksAndMessages(null);
        if (cpu != null && cpu.isHeld()) cpu.release();
        if (wifi != null && wifi.isHeld()) wifi.release();
        if (network != null && connectivity != null) try { connectivity.unregisterNetworkCallback(network); } catch (RuntimeException ignored) { }
        stopForeground(ownsNotification);
        if (owned != null && owned.isCurrent()) owned.stop();
        super.onDestroy();
    }
    @Override public IBinder onBind(Intent intent) { return null; }
}
