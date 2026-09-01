package defpackage;

import android.os.Process;
import android.util.Log;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x44 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ x44(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Process.setThreadPriority(10);
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ((Runnable) obj).run();
                break;
            default:
                ExecutorService executorService = (ExecutorService) obj;
                try {
                    if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                        Log.d("FirebaseCrashlytics", "Executing shutdown hook for awaitEvenIfOnMainThread task continuation executor", null);
                    }
                    executorService.shutdown();
                    if (!executorService.awaitTermination(2L, TimeUnit.SECONDS)) {
                        if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                            Log.d("FirebaseCrashlytics", "awaitEvenIfOnMainThread task continuation executor did not shut down in the allocated time. Requesting immediate shutdown.", null);
                        }
                        executorService.shutdownNow();
                    }
                } catch (InterruptedException unused) {
                    Locale locale = Locale.US;
                    if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                        Log.d("FirebaseCrashlytics", "Interrupted while waiting for awaitEvenIfOnMainThread task continuation executor to shut down. Requesting immediate shutdown.", null);
                    }
                    executorService.shutdownNow();
                    return;
                }
                break;
        }
    }
}
