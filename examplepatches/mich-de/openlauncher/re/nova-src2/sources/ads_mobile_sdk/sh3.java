package ads_mobile_sdk;

import android.os.SystemClock;
import b.o2;
import b.v7;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public final class sh3 {

    /* renamed from: a, reason: collision with root package name */
    public final yk0 f9558a;

    /* renamed from: b, reason: collision with root package name */
    public final v7 f9559b;

    /* renamed from: c, reason: collision with root package name */
    public final o2 f9560c;

    /* renamed from: d, reason: collision with root package name */
    public final AtomicBoolean f9561d = new AtomicBoolean(false);

    /* renamed from: e, reason: collision with root package name */
    public long f9562e = -1;

    /* renamed from: f, reason: collision with root package name */
    public long f9563f = -1;

    /* renamed from: g, reason: collision with root package name */
    public Throwable f9564g = null;

    public sh3(yk0 yk0Var, o2 o2Var, v7 v7Var) {
        this.f9558a = yk0Var;
        this.f9559b = v7Var;
        this.f9560c = o2Var;
    }

    public final void a() {
        AtomicBoolean atomicBoolean = this.f9561d;
        if (atomicBoolean.getAndSet(true)) {
            throw new IllegalStateException("Finished trace.");
        }
        this.f9560c.getClass();
        this.f9563f = SystemClock.uptimeMillis();
        ((qm1) this.f9559b).a(this.f9558a.f12178a, atomicBoolean.get() ? this.f9563f - this.f9562e : -1L, null, this.f9564g);
    }

    public final void b() {
        if (this.f9561d.get()) {
            throw new IllegalStateException("Finished trace.");
        }
        this.f9560c.getClass();
        this.f9562e = SystemClock.uptimeMillis();
    }

    public final void a(Throwable th2) {
        if (!this.f9561d.get()) {
            this.f9564g = th2;
            return;
        }
        throw new IllegalStateException("Finished trace.");
    }
}
