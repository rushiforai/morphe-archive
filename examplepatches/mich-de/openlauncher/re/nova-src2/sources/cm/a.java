package cm;

import android.os.StrictMode;
import java.util.Locale;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes.dex */
public final class a implements ThreadFactory {

    /* renamed from: e, reason: collision with root package name */
    public static final ThreadFactory f20095e = Executors.defaultThreadFactory();

    /* renamed from: a, reason: collision with root package name */
    public final AtomicLong f20096a = new AtomicLong();

    /* renamed from: b, reason: collision with root package name */
    public final String f20097b;

    /* renamed from: c, reason: collision with root package name */
    public final int f20098c;

    /* renamed from: d, reason: collision with root package name */
    public final StrictMode.ThreadPolicy f20099d;

    public a(String str, int i5, StrictMode.ThreadPolicy threadPolicy) {
        this.f20097b = str;
        this.f20098c = i5;
        this.f20099d = threadPolicy;
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        Thread threadNewThread = f20095e.newThread(new b80.a(4, this, runnable));
        Locale locale = Locale.ROOT;
        threadNewThread.setName(this.f20097b + " Thread #" + this.f20096a.getAndIncrement());
        return threadNewThread;
    }
}
