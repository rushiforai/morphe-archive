package ya;

import android.os.HandlerThread;
import android.os.Looper;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final ThreadPoolExecutor f97146a;

    /* renamed from: b, reason: collision with root package name */
    public static final x f97147b;

    /* renamed from: c, reason: collision with root package name */
    public static final x f97148c;

    /* renamed from: d, reason: collision with root package name */
    public static final x f97149d;

    static {
        int iMax = Math.max(Runtime.getRuntime().availableProcessors(), 2);
        f97146a = new ThreadPoolExecutor(iMax, iMax, 1L, TimeUnit.SECONDS, new LinkedBlockingQueue());
        f97147b = new x(Looper.getMainLooper());
        HandlerThread handlerThread = new HandlerThread("UiThreadHelper", -2);
        handlerThread.start();
        f97148c = new x(handlerThread.getLooper());
        HandlerThread handlerThread2 = new HandlerThread("launcher-loader", 0);
        handlerThread2.start();
        f97149d = new x(handlerThread2.getLooper());
    }
}
