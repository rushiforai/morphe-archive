package app.morphe.extension.sabp.read;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;

import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.sabp.EppyBook;
import app.morphe.extension.sabp.EppyDiag;

/**
 * Keeps "Transcribe the whole book" going when eppy is in the background and nothing is playing:
 * a foreground service with a notification (progress, Stop). It keeps the phone awake while
 * transcribing and through short pauses (warm, errors), not when paused for low battery. A
 * watchdog checks every minute: a worker that died is started again, one that made no progress
 * for 10 minutes is replaced. Runs only while some book is in whole-book mode.
 */
public final class TranscribeService extends Service implements Transcriber.Listener {
    private static final String CHANNEL = "eppy_transcribe";
    private static final String ACTION_STOP = "app.morphe.extension.sabp.TRANSCRIBE_STOP";
    private static final String ACTION_RETRY = "app.morphe.extension.sabp.TRANSCRIBE_RETRY";
    private static final long STUCK_MS = 10 * 60_000L, TICK_MS = 60_000L;
    private static final int ID = 0x7EA1;
    private static final long LOCK_MS = 10 * 60_000L; // renewed on every update while working

    private final ExecutorService io = Executors.newSingleThreadExecutor();
    private Transcriber tr;
    private PowerManager.WakeLock lock;
    private volatile boolean destroyed;
    private volatile Notification last;
    private static volatile boolean running;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final Runnable watchdog = new Runnable() {
        @Override
        public void run() {
            if (destroyed) return;
            if (tr.state() == Transcriber.State.WORKING && SystemClock.elapsedRealtime() - tr.lastProgressAt() > STUCK_MS) tr.restartWorker();
            else tr.ensureRunning(); // starts a worker that ended (not one stopped after crashes)
            onTranscriberChanged(); // renews the wake lock and the notification
            handler.postDelayed(this, TICK_MS);
        }
    };

    /** Starts or stops the service to match whether any book is in whole-book mode. */
    static void sync(Context c) {
        Context app = c.getApplicationContext();
        Intent i = new Intent(app, TranscribeService.class);
        try {
            if (Transcriber.get(app).wholeBooks().isEmpty()) app.stopService(i);
            else if (!running) app.startForegroundService(i); // starting it again would re-post the notification (flicker)
        } catch (Throwable t) { // Android refuses to start it from the background; it starts next time eppy opens
            EppyDiag.log("transcribe", "background service: " + t.getClass().getSimpleName());
        }
    }

    @Override
    public void onCreate() {
        super.onCreate();
        running = true;
        tr = Transcriber.get(this);
        PowerManager pm = (PowerManager) getSystemService(POWER_SERVICE);
        lock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "eppy:transcribe");
        lock.setReferenceCounted(false);
        NotificationManager nm = getSystemService(NotificationManager.class);
        nm.createNotificationChannel(new NotificationChannel(CHANNEL, "Transcribing audiobooks", NotificationManager.IMPORTANCE_LOW));
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent != null && ACTION_STOP.equals(intent.getAction())) { // the notification's Stop: stops this service too
            for (String f : tr.wholeBooks()) tr.setWholeBook(f, null, false);
            return START_NOT_STICKY;
        }
        if (intent != null && ACTION_RETRY.equals(intent.getAction())) tr.resetCrashes();
        Notification n = last != null ? last : notification("Transcribing the whole book", null, -1, null, false);
        if (Build.VERSION.SDK_INT >= 34) startForeground(ID, n, ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE);
        else startForeground(ID, n);
        if (tr.wholeBooks().isEmpty()) {
            stopSelf();
            return START_NOT_STICKY;
        }
        tr.addListener(this);
        tr.ensureRunning();
        tr.kick();
        onTranscriberChanged();
        handler.removeCallbacks(watchdog);
        handler.postDelayed(watchdog, TICK_MS);
        return START_STICKY;
    }

    @Override
    public void onTranscriberChanged() {
        Transcriber.State s = tr.state();
        boolean crashed = tr.stoppedAfterCrash();
        // Awake through short pauses too, or the "try again in 2 min" never comes while the screen is off.
        boolean awake = !crashed && (s == Transcriber.State.WORKING || s == Transcriber.State.PAUSED_HEAT || s == Transcriber.State.ERROR);
        if (awake) lock.acquire(LOCK_MS);
        else if (lock.isHeld()) lock.release();
        String detail = tr.stateDetail();
        if (destroyed) return;
        io.execute(() -> {
            Set<String> whole = tr.wholeBooks();
            if (whole.isEmpty()) return;
            EppyBook b = EppyBook.current();
            if (b == null) for (String f : whole) if ((b = tr.savedBook(f)) != null) break;
            String title, text, sub = null;
            int pct = -1;
            boolean retry = false;
            if (crashed) {
                title = "Transcription stopped";
                text = "Stopped after repeated problems";
                retry = true;
            } else if (b == null || !whole.contains(b.folderUri)) {
                title = "Transcribing the whole book";
                text = b != null ? "Waiting while another book is loaded" : "Open the book once to continue";
            } else {
                long[] pr = tr.progress(b);
                pct = pr[1] > 0 ? (int) (1000 * pr[0] / pr[1]) : -1; // tenths of a percent
                String pl = Transcriber.percentLabel(pr);
                sub = b.folderName;
                String chapter = chapterAt(b, tr.workFile(), tr.workFromMs());
                title = chapter != null ? chapter : "Transcribing the whole book";
                switch (s) {
                    case PAUSED_BATTERY:
                    case PAUSED_HEAT:
                    case ERROR:
                        text = detail;
                        break;
                    default:
                        String sp = tr.speedLabel();
                        text = "Transcribing" + (pl.isEmpty() ? "" : " · " + pl) + (sp != null ? " · " + sp : "");
                }
            }
            Notification n = notification(title, text, pct, sub, retry);
            last = n;
            if (!destroyed) getSystemService(NotificationManager.class).notify(ID, n);
        });
    }

    /** Title of the chapter that contains a file position, or null. */
    static String chapterAt(EppyBook b, String file, long ms) {
        if (file == null) return null;
        String title = null;
        for (EppyBook.ChapterItem ch : b.chapters) {
            if (!file.equals(ch.fileName)) continue;
            if (ch.positionInFile * 1000L > ms) break;
            title = ch.title;
        }
        return title != null && !title.trim().isEmpty() ? title.trim() : null;
    }

    private Notification notification(String title, String text, int pct, String sub, boolean retry) {
        Intent open = getPackageManager().getLaunchIntentForPackage(getPackageName());
        PendingIntent tap = open == null ? null : PendingIntent.getActivity(this, 0, open, PendingIntent.FLAG_IMMUTABLE);
        PendingIntent stop = PendingIntent.getService(this, 1, new Intent(this, TranscribeService.class).setAction(ACTION_STOP), PendingIntent.FLAG_IMMUTABLE);
        Notification.Builder b = new Notification.Builder(this, CHANNEL)
                .setSmallIcon(android.R.drawable.stat_notify_sync_noanim)
                .setContentTitle(title)
                .setOngoing(true)
                .setOnlyAlertOnce(true)
                .setContentIntent(tap)
                .addAction(new Notification.Action.Builder(null, "Stop", stop).build());
        if (retry) {
            PendingIntent again = PendingIntent.getService(this, 2, new Intent(this, TranscribeService.class).setAction(ACTION_RETRY), PendingIntent.FLAG_IMMUTABLE);
            b.addAction(new Notification.Action.Builder(null, "Try again", again).build());
        }
        if (text != null) b.setContentText(text);
        if (sub != null) b.setSubText(sub);
        if (pct >= 0) b.setProgress(1000, pct, false);
        return b.build();
    }

    @Override
    public void onDestroy() {
        destroyed = true;
        running = false;
        handler.removeCallbacks(watchdog);
        tr.removeListener(this);
        if (lock.isHeld()) lock.release();
        io.shutdown();
        super.onDestroy();
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
