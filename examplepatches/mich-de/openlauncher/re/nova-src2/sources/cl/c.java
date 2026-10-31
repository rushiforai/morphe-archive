package cl;

import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;

/* loaded from: classes3.dex */
public abstract class c extends q0 implements Runnable {

    /* renamed from: h, reason: collision with root package name */
    public ListenableFuture f19986h;

    /* renamed from: i, reason: collision with root package name */
    public Class f19987i;

    /* renamed from: j, reason: collision with root package name */
    public Object f19988j;

    public c(ListenableFuture listenableFuture, Class cls, Object obj) {
        this.f19986h = listenableFuture;
        this.f19987i = cls;
        this.f19988j = obj;
    }

    public static a s(ListenableFuture listenableFuture, Class cls, d0 d0Var, Executor executor) {
        a aVar = new a(listenableFuture, cls, d0Var);
        listenableFuture.b(aVar, fg.a.M(executor, aVar));
        return aVar;
    }

    public static b t(r0 r0Var, Class cls, vk.g gVar, Executor executor) {
        b bVar = new b(r0Var, cls, gVar);
        r0Var.b(bVar, fg.a.M(executor, bVar));
        return bVar;
    }

    @Override // cl.s
    public final void e() {
        ListenableFuture listenableFuture = this.f19986h;
        if ((listenableFuture != null) & (this.f20073a instanceof d)) {
            listenableFuture.cancel(q());
        }
        this.f19986h = null;
        this.f19987i = null;
        this.f19988j = null;
    }

    @Override // cl.s
    public final String l() {
        String str;
        ListenableFuture listenableFuture = this.f19986h;
        Class cls = this.f19987i;
        Object obj = this.f19988j;
        String strL = super.l();
        if (listenableFuture != null) {
            str = "inputFuture=[" + listenableFuture + "], ";
        } else {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (cls == null || obj == null) {
            if (strL != null) {
                return b.c0.E(str, strL);
            }
            return null;
        }
        return str + "exceptionType=[" + cls + "], fallback=[" + obj + "]";
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.lang.Runnable
    public final void run() {
        Throwable e3;
        ListenableFuture listenableFuture = this.f19986h;
        Class cls = this.f19987i;
        Object obj = this.f19988j;
        if (((obj == null) || ((listenableFuture == 0) | (cls == null))) || (this.f20073a instanceof d)) {
            return;
        }
        this.f19986h = null;
        try {
            e3 = listenableFuture instanceof dl.a ? ((dl.a) listenableFuture).a() : null;
        } catch (Error e11) {
            e3 = e11;
        } catch (RuntimeException e12) {
            e3 = e12;
        } catch (ExecutionException e13) {
            Throwable cause = e13.getCause();
            if (cause == null) {
                cause = new NullPointerException("Future type " + listenableFuture.getClass() + " threw " + e13.getClass() + " without a cause");
            }
            e3 = cause;
        }
        Object objA = e3 == null ? w0.a(listenableFuture) : null;
        if (e3 == null) {
            n(objA);
            return;
        }
        if (!cls.isInstance(e3)) {
            p(listenableFuture);
            return;
        }
        try {
            Object objU = u(obj, e3);
            this.f19987i = null;
            this.f19988j = null;
            v(objU);
        } catch (Throwable th2) {
            try {
                com.google.android.gms.internal.consent_sdk.k0.C(th2);
                o(th2);
            } finally {
                this.f19987i = null;
                this.f19988j = null;
            }
        }
    }

    public abstract Object u(Object obj, Throwable th2);

    public abstract void v(Object obj);
}
