package cl;

import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;

/* loaded from: classes.dex */
public abstract class w extends q0 implements Runnable {

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ int f20081j = 0;

    /* renamed from: h, reason: collision with root package name */
    public ListenableFuture f20082h;

    /* renamed from: i, reason: collision with root package name */
    public Object f20083i;

    public w(ListenableFuture listenableFuture, Object obj) {
        listenableFuture.getClass();
        this.f20082h = listenableFuture;
        obj.getClass();
        this.f20083i = obj;
    }

    @Override // cl.s
    public final void e() {
        ListenableFuture listenableFuture = this.f20082h;
        if ((listenableFuture != null) & (this.f20073a instanceof d)) {
            listenableFuture.cancel(q());
        }
        this.f20082h = null;
        this.f20083i = null;
    }

    @Override // cl.s
    public final String l() {
        String str;
        ListenableFuture listenableFuture = this.f20082h;
        Object obj = this.f20083i;
        String strL = super.l();
        if (listenableFuture != null) {
            str = "inputFuture=[" + listenableFuture + "], ";
        } else {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (obj == null) {
            if (strL != null) {
                return b.c0.E(str, strL);
            }
            return null;
        }
        return str + "function=[" + obj + "]";
    }

    @Override // java.lang.Runnable
    public final void run() {
        ListenableFuture listenableFuture = this.f20082h;
        Object obj = this.f20083i;
        if (((this.f20073a instanceof d) | (listenableFuture == null)) || (obj == null)) {
            return;
        }
        this.f20082h = null;
        if (listenableFuture.isCancelled()) {
            p(listenableFuture);
            return;
        }
        try {
            try {
                Object objS = s(obj, w0.a(listenableFuture));
                this.f20083i = null;
                t(objS);
            } catch (Throwable th2) {
                try {
                    com.google.android.gms.internal.consent_sdk.k0.C(th2);
                    o(th2);
                } finally {
                    this.f20083i = null;
                }
            }
        } catch (Error e3) {
            o(e3);
        } catch (CancellationException unused) {
            cancel(false);
        } catch (RuntimeException e11) {
            o(e11);
        } catch (ExecutionException e12) {
            o(e12.getCause());
        }
    }

    public abstract Object s(Object obj, Object obj2);

    public abstract void t(Object obj);
}
