package app.template.extension.aare.adb;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.RemoteInput;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.util.Log;

import java.net.ConnectException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.template.extension.aare.PatchSettings;

/**
 * Pairs and starts AARE's integrated Shizuku, from a notification.
 *
 * Pairing: AARE waits for Wireless debugging > Pair device with pairing code to be open, then a
 * notification asks for the six-digit code (typed in the notification, with the code still on
 * screen). Starting: connects to wireless debugging and starts the shell server.
 */
public final class IntegratedShizukuService extends Service {
    private static final String TAG = "AarePatches";
    private static final String CHANNEL = "aare_integrated_shizuku";
    private static final int NOTIFICATION = 0x5A5A;

    public static final String ACTION_PAIR = "app.template.extension.aare.adb.PAIR";
    public static final String ACTION_START = "app.template.extension.aare.adb.START";
    /** Start after the phone boots: waits for Wi-Fi for a few minutes first. */
    public static final String ACTION_BOOT_START = "app.template.extension.aare.adb.BOOT_START";
    private static final String ACTION_CODE = "app.template.extension.aare.adb.CODE";
    private static final String ACTION_CANCEL = "app.template.extension.aare.adb.CANCEL";
    private static final String EXTRA_PORT = "port";
    private static final String KEY_CODE = "code";

    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private AdbMdns pairingSearch;
    private volatile int pairingPort = -1;

    public static void pair(Context context) {
        launch(context, ACTION_PAIR);
    }

    public static void start(Context context) {
        launch(context, ACTION_START);
    }

    public static void bootStart(Context context) {
        launch(context, ACTION_BOOT_START);
    }

    private static void launch(Context context, String action) {
        Intent intent = new Intent(context, IntegratedShizukuService.class).setAction(action);
        try {
            context.startForegroundService(intent);
        } catch (Throwable t) {
            Log.w(TAG, "integrated shizuku: service", t);
        }
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        String action = intent != null ? intent.getAction() : null;
        if (ACTION_PAIR.equals(action)) {
            foreground(progress(text("Pairing with wireless debugging", "Accoppiamento con il debug wireless"),
                    text("Open \"Pair device with pairing code\" in Wireless debugging.",
                            "Apri «Associa dispositivo con codice di accoppiamento» nel Debug wireless."), true));
            startPairingSearch();
        } else if (ACTION_CODE.equals(action)) {
            Bundle results = RemoteInput.getResultsFromIntent(intent);
            CharSequence code = results != null ? results.getCharSequence(KEY_CODE) : null;
            int port = intent.getIntExtra(EXTRA_PORT, -1);
            if (code == null || port <= 0) {
                askCode(pairingPort);
            } else {
                foreground(progress(text("Pairing…", "Accoppiamento…"), null, false));
                worker.execute(() -> doPair(port, code.toString()));
            }
        } else if (ACTION_START.equals(action)) {
            foreground(progress(text("Starting integrated Shizuku…", "Avvio di Shizuku integrato…"), null, false));
            worker.execute(this::doStart);
        } else if (ACTION_BOOT_START.equals(action)) {
            foreground(progress(text("Starting integrated Shizuku…", "Avvio di Shizuku integrato…"),
                    text("Waiting for Wi-Fi.", "In attesa del Wi-Fi."), true));
            worker.execute(() -> {
                // Up to five minutes for the phone to join a Wi-Fi network after starting.
                for (int i = 0; i < 300 && !IntegratedShizuku.onWifi(this); i++) {
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                        return;
                    }
                }
                doStart();
            });
        } else if (ACTION_CANCEL.equals(action)) {
            finish(null, null);
        } else {
            stopSelf();
        }
        return START_NOT_STICKY;
    }

    // region Work

    private final Runnable pairingTimeout = () -> {
        if (pairingSearch != null && !IntegratedShizuku.isPaired(this)) {
            finish(text("Pairing not done", "Accoppiamento non riuscito"),
                    text("Pair device with pairing code didn't open in time. Try again from Settings.",
                            "«Associa dispositivo con codice» non si è aperto in tempo. Riprova da Settings."));
        }
    };

    private void startPairingSearch() {
        stopPairingSearch();
        pairingSearch = new AdbMdns(this, AdbMdns.TLS_PAIRING, port -> main.post(() -> {
            if (port != pairingPort) {
                pairingPort = port;
                askCode(port);
            }
        }));
        pairingSearch.start();
        // Pairing codes expire: give up after five minutes.
        main.postDelayed(pairingTimeout, 5 * 60_000);
    }

    private void stopPairingSearch() {
        main.removeCallbacks(pairingTimeout);
        if (pairingSearch != null) {
            pairingSearch.stop();
            pairingSearch = null;
        }
    }

    private void doPair(int port, String code) {
        try {
            IntegratedShizuku.pair(this, port, code);
            main.post(this::stopPairingSearch);
            // Wireless debugging is on now: start right away.
            doStart();
        } catch (Throwable t) {
            Log.w(TAG, "integrated shizuku: pair", t);
            String why = IntegratedShizuku.isWrongCode(t)
                    ? text("The code was wrong. Type the code shown now.", "Il codice era sbagliato. Scrivi il codice mostrato ora.")
                    : t instanceof ConnectException
                    ? text("The pairing window was closed. Open it again.", "La finestra di accoppiamento è stata chiusa. Riaprila.")
                    : text("Pairing failed: " + t.getMessage(), "Accoppiamento non riuscito: " + t.getMessage());
            main.post(() -> {
                pairingPort = -1;
                foreground(progress(text("Pairing with wireless debugging", "Accoppiamento con il debug wireless"), why, true));
                if (pairingSearch == null) startPairingSearch();
            });
        }
    }

    private void doStart() {
        IntegratedShizuku.Result result = IntegratedShizuku.start(this);
        switch (result) {
            case STARTED:
            case ALREADY_RUNNING:
                finish(text("Integrated Shizuku is running", "Shizuku integrato è attivo"),
                        text("Car audio and voice messages work without the Shizuku app. Wireless debugging is off "
                                        + "again; AARE starts it by itself after a restart.",
                                "Audio in auto e vocali funzionano senza l'app Shizuku. Il debug wireless è di nuovo "
                                        + "spento; dopo un riavvio AARE riparte da sola."));
                break;
            case SHIZUKU_APP_RUNNING:
                finish(text("The Shizuku app is running", "È attiva l'app Shizuku"),
                        text("AARE uses the Shizuku app now. To use the integrated one, stop the Shizuku app (or restart "
                                        + "the phone without starting it), then tap Start.",
                                "AARE sta usando l'app Shizuku. Per usare quello integrato, ferma l'app Shizuku (o riavvia "
                                        + "il telefono senza avviarla), poi tocca Avvia."));
                break;
            case NOT_PAIRED:
                finish(text("Pairing needed", "Serve l'accoppiamento"),
                        text("Pair AARE with wireless debugging from Settings, once.",
                                "Accoppia AARE con il debug wireless da Settings, una volta sola."));
                break;
            case WIRELESS_DEBUGGING_OFF:
                finish(text("Wireless debugging is off", "Il debug wireless è spento"),
                        text("Turn on Wireless debugging (Developer options), then start again.",
                                "Attiva il Debug wireless (Opzioni sviluppatore), poi riavvia."));
                break;
            case NO_WIFI:
                finish(text("Wi-Fi needed", "Serve il Wi-Fi"),
                        text("Wireless debugging works on Wi-Fi only: connect to a Wi-Fi network once, then start again.",
                                "Il debug wireless funziona solo col Wi-Fi: collegati a una rete Wi-Fi, poi riavvia."));
                break;
            default:
                String why = IntegratedShizuku.lastError(this);
                finish(text("Integrated Shizuku didn't start", "Shizuku integrato non è partito"),
                        text("Details: ", "Dettagli: ") + (why != null ? why : "-"));
        }
    }

    // endregion

    // region Notifications

    private void askCode(int port) {
        if (port <= 0) return;
        RemoteInput input = new RemoteInput.Builder(KEY_CODE)
                .setLabel(text("Pairing code", "Codice di accoppiamento"))
                .build();
        Intent reply = new Intent(this, IntegratedShizukuService.class).setAction(ACTION_CODE).putExtra(EXTRA_PORT, port);
        int mutable = Build.VERSION.SDK_INT >= 31 ? PendingIntent.FLAG_MUTABLE : 0;
        PendingIntent pi = PendingIntent.getForegroundService(this, 1, reply, PendingIntent.FLAG_UPDATE_CURRENT | mutable);
        Notification.Action action = new Notification.Action.Builder(null, text("Enter code", "Inserisci codice"), pi)
                .addRemoteInput(input)
                .build();
        Notification n = builder()
                .setContentTitle(text("Pairing code found", "Pronto per l'accoppiamento"))
                .setContentText(text("Type the six-digit code shown by Android here.",
                        "Scrivi qui il codice di sei cifre mostrato da Android."))
                .addAction(action)
                .addAction(cancelAction())
                .setOngoing(true)
                .build();
        foreground(n);
    }

    private Notification progress(String title, String body, boolean cancellable) {
        Notification.Builder b = builder().setContentTitle(title).setOngoing(true);
        if (body != null) b.setContentText(body).setStyle(new Notification.BigTextStyle().bigText(body));
        if (cancellable) b.addAction(cancelAction());
        return b.build();
    }

    private Notification.Action cancelAction() {
        Intent cancel = new Intent(this, IntegratedShizukuService.class).setAction(ACTION_CANCEL);
        PendingIntent pi = PendingIntent.getService(this, 2, cancel, PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        return new Notification.Action.Builder(null, text("Cancel", "Annulla"), pi).build();
    }

    private Notification.Builder builder() {
        NotificationManager nm = getSystemService(NotificationManager.class);
        if (nm.getNotificationChannel(CHANNEL) == null) {
            nm.createNotificationChannel(new NotificationChannel(CHANNEL,
                    text("Integrated Shizuku", "Shizuku integrato"), NotificationManager.IMPORTANCE_HIGH));
        }
        return new Notification.Builder(this, CHANNEL)
                .setSmallIcon(getApplicationInfo().icon)
                .setColor(0xFF3DDBC6)
                .setOnlyAlertOnce(true);
    }

    private void foreground(Notification n) {
        try {
            if (Build.VERSION.SDK_INT >= 29) {
                startForeground(NOTIFICATION, n, ServiceInfo.FOREGROUND_SERVICE_TYPE_CONNECTED_DEVICE);
            } else {
                startForeground(NOTIFICATION, n);
            }
        } catch (Throwable t) {
            Log.w(TAG, "integrated shizuku: foreground", t);
            getSystemService(NotificationManager.class).notify(NOTIFICATION, n);
        }
    }

    /** Ends the work: the service goes, a last notification (if any) stays. */
    private void finish(String title, String body) {
        main.post(() -> {
            stopPairingSearch();
            stopForeground(STOP_FOREGROUND_REMOVE);
            if (title != null) {
                Notification.Builder b = builder().setContentTitle(title).setAutoCancel(true);
                if (body != null) b.setContentText(body).setStyle(new Notification.BigTextStyle().bigText(body));
                getSystemService(NotificationManager.class).notify(NOTIFICATION + 1, b.build());
            }
            stopSelf();
        });
    }

    // endregion

    @Override
    public void onDestroy() {
        stopPairingSearch();
        worker.shutdownNow();
        super.onDestroy();
    }

    private static String text(String english, String italian) {
        return PatchSettings.phrase(english, italian);
    }
}
