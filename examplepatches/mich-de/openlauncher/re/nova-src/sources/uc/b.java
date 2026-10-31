package uc;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final ThreadPoolExecutor f90789a;

    /* renamed from: b, reason: collision with root package name */
    public static final Handler f90790b = new Handler(Looper.getMainLooper());

    static {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(1, 2, 30L, TimeUnit.SECONDS, new LinkedBlockingQueue(5), new ic.a(1), new a());
        threadPoolExecutor.allowCoreThreadTimeOut(true);
        f90789a = threadPoolExecutor;
    }
}
