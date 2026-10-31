package lab.skisafari;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Runtime bridge for the verified Ski Safari 2.5 ARM64 native helper. */
public final class SkiSafariUnlock {
    private static final String TAG = "SkiSafari-Unlock";
    private static final String PACKAGE = "com.yodo1.skisafarigp";
    private static final String PREFERENCES = "ski_safari_unlock_patch";
    private static final String APPLIED_KEY = "unlock_all_items_v1_applied";
    private static final long RETRY_MS = 500L;
    private static final long TIMEOUT_MS = 120_000L;

    private static volatile boolean scheduled;
    private static boolean diagnosticsInstalled;

    private SkiSafariUnlock() { }

    public static synchronized void prepareUnity() {
        Log.i(TAG, "Ingresso attivita': preparazione Unity.");
        if (diagnosticsInstalled) return;
        Thread thread = Thread.currentThread();
        Thread.UncaughtExceptionHandler previous = thread.getUncaughtExceptionHandler();
        thread.setUncaughtExceptionHandler((failedThread, error) -> {
            Log.e(TAG, "Errore durante l'avvio Unity.", error);
            if (previous != null) previous.uncaughtException(failedThread, error);
        });
        diagnosticsInstalled = true;
    }

    public static synchronized void start(Activity activity) {
        if (activity == null) return;
        Context app = activity.getApplicationContext();
        if (!PACKAGE.equals(app.getPackageName())) {
            Log.e(TAG, "Errore: package non corrispondente.");
            return;
        }

        final PackageInfo packageInfo;
        try {
            packageInfo = app.getPackageManager().getPackageInfo(PACKAGE, 0);
        } catch (Exception e) {
            Log.e(TAG, "Errore: impossibile leggere la versione installata.");
            return;
        }
        long versionCode = android.os.Build.VERSION.SDK_INT >= 28
                ? packageInfo.getLongVersionCode() : packageInfo.versionCode;
        if (!"2.5".equals(packageInfo.versionName) || versionCode != 108L) {
            Log.e(TAG, "Errore: Ski Safari 2.5 (108) richiesto; procedura non avviata.");
            return;
        }

        Log.i(TAG, "Patch caricata per Ski Safari 2.5 (108).");
        if (app.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getBoolean(APPLIED_KEY, false)) {
            Log.i(TAG, "Sblocco gia' completato e salvato; nessuna nuova chiamata.");
            return;
        }
        if (scheduled) return;

        try {
            System.loadLibrary("skisafariunlock");
        } catch (Throwable t) {
            Log.e(TAG, "Errore: libreria nativa Ski Safari Unlock non caricata.");
            return;
        }

        try {
            Field playerField = findField(activity.getClass(), "mUnityPlayer");
            Object player = playerField.get(activity);
            if (player == null) throw new IllegalStateException("UnityPlayer absent");
            Method queue = findQueueMethod(player.getClass());
            Thread unityThread = (Thread) findField(player.getClass(), "m_MainThread").get(player);
            if (unityThread == null) throw new IllegalStateException("Unity thread absent");
            scheduled = true;
            UnlockTask task = new UnlockTask(app, player, queue, unityThread);
            task.handler.post(task::enqueue);
            task.handler.postDelayed(() -> {
                if (!task.finished) {
                    Log.e(TAG, "Errore: dispatcher Unity o profilo non pronto entro il timeout.");
                    task.finish();
                }
            }, TIMEOUT_MS);
        } catch (Exception e) {
            scheduled = false;
            Log.e(TAG, "Errore: dispatcher Unity verificato non disponibile.");
        }
    }

    private static Field findField(Class<?> type, String name) throws NoSuchFieldException {
        while (type != null) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException e) {
                type = type.getSuperclass();
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static Method findQueueMethod(Class<?> type) throws NoSuchMethodException {
        while (type != null) {
            try {
                Method method = type.getDeclaredMethod("queueGLThreadEvent", Runnable.class);
                method.setAccessible(true);
                return method;
            } catch (NoSuchMethodException e) {
                type = type.getSuperclass();
            }
        }
        throw new NoSuchMethodException("queueGLThreadEvent");
    }

    private static final class UnlockTask implements Runnable {
        final Context app;
        final Object player;
        final Method queue;
        final Thread unityThread;
        final Handler handler = new Handler(Looper.getMainLooper());
        volatile boolean finished;
        boolean dispatched;

        UnlockTask(Context app, Object player, Method queue, Thread unityThread) {
            this.app = app;
            this.player = player;
            this.queue = queue;
            this.unityThread = unityThread;
        }

        void finish() {
            finished = true;
            scheduled = false;
        }

        void enqueue() {
            if (finished) return;
            try {
                queue.invoke(player, this);
            } catch (Exception e) {
                Log.e(TAG, "Errore: impossibile accodare il lavoro sul thread Unity.");
                finish();
            }
        }

        @Override public void run() {
                if (finished) return;
                if (Thread.currentThread() != unityThread) {
                    Log.e(TAG, "Errore: dispatcher eseguito su thread diverso da Unity.");
                    finish();
                    return;
                }
                if (!dispatched) {
                    Log.i(TAG, "Dispatcher sul thread Unity pronto.");
                    dispatched = true;
                }
                final int result;
                try {
                    result = tryUnlock();
                } catch (Throwable t) {
                    Log.e(TAG, "Errore durante la chiamata nativa ShopItemHelper.");
                    finish();
                    return;
                }

                if (result == 3 || result == 4) {
                    boolean saved = app.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                            .edit().putBoolean(APPLIED_KEY, true).commit();
                    if (saved) {
                        Log.i(TAG, "UnlockAllItems e' ritornato; marcatore one-shot persistito. Il salvataggio del gioco va verificato al riavvio.");
                    } else {
                        Log.e(TAG, "Funzione completata, ma marcatore one-shot non persistito; potra' essere ripetuta al prossimo avvio.");
                    }
                    finish();
                    return;
                }

                if (result < 0) {
                    Log.e(TAG, "Errore: target IL2CPP non pronto o non corrispondente.");
                    finish();
                    return;
                }

                handler.postDelayed(this::enqueue, RETRY_MS);
        }
    }

    /** 0=IL2CPP absent, 1=profile not loaded, 2=shop helper absent, 3=called, 4=already called. */
    private static native int tryUnlock();
}
