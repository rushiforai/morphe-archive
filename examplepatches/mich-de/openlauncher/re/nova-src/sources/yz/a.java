package yz;

import android.os.Handler;
import android.os.Looper;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a extends Handler implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final Runnable f97732a;

    /* renamed from: b, reason: collision with root package name */
    public final long f97733b;

    /* JADX WARN: Illegal instructions before constructor call */
    public a(Runnable runnable, long j11) {
        Looper looperMyLooper = Looper.myLooper();
        Intrinsics.d(looperMyLooper);
        super(looperMyLooper);
        this.f97732a = runnable;
        this.f97733b = j11;
    }

    public final void a() {
        removeCallbacksAndMessages(null);
        postDelayed(this, this.f97733b);
    }

    @Override // java.lang.Runnable
    public final void run() {
        Runnable runnable = this.f97732a;
        if (runnable != null) {
            runnable.run();
        }
    }
}
