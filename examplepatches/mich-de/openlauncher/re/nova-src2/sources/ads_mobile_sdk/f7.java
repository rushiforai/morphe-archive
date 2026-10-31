package ads_mobile_sdk;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import b.v2;
import cl.m0;
import cl.v;
import cl.w0;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* loaded from: classes.dex */
public final class f7 {

    /* renamed from: a, reason: collision with root package name */
    public final f61 f3210a;

    /* renamed from: b, reason: collision with root package name */
    public final ga3 f3211b;

    /* renamed from: c, reason: collision with root package name */
    public final ub3 f3212c;

    /* renamed from: d, reason: collision with root package name */
    public final vi3 f3213d;

    /* renamed from: e, reason: collision with root package name */
    public final b.g7 f3214e;

    /* renamed from: f, reason: collision with root package name */
    public final long f3215f;

    /* renamed from: g, reason: collision with root package name */
    public final b.w4 f3216g;

    /* renamed from: h, reason: collision with root package name */
    public final long f3217h;

    /* renamed from: i, reason: collision with root package name */
    public final long f3218i = System.currentTimeMillis();

    /* renamed from: j, reason: collision with root package name */
    public final boolean f3219j;

    /* renamed from: k, reason: collision with root package name */
    public final long f3220k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f3221l;

    public f7(f61 f61Var, ga3 ga3Var, ub3 ub3Var, vi3 vi3Var, b.g7 g7Var, b.w4 w4Var, j7 j7Var) {
        this.f3210a = f61Var;
        this.f3211b = ga3Var;
        this.f3212c = ub3Var;
        this.f3213d = vi3Var;
        this.f3214e = g7Var;
        this.f3215f = j7Var.N();
        this.f3216g = w4Var;
        this.f3217h = j7Var.q();
        this.f3219j = j7Var.y();
        this.f3220k = j7Var.r();
        this.f3221l = j7Var.s();
    }

    public final String a(Context context, String str, View view, Activity activity) {
        ListenableFuture listenableFutureA;
        v vVar;
        vi3 vi3Var = this.f3213d;
        sh3 sh3Var = new sh3(yk0.EVENT_ID_SIGNAL_CLICK, vi3Var.f10793b, vi3Var.f10792a);
        if (this.f3221l) {
            f61 f61Var = this.f3210a;
            synchronized (f61Var) {
                vVar = f61Var.f3209e;
                vVar.getClass();
            }
            listenableFutureA = w0.c(vVar);
        } else {
            listenableFutureA = this.f3210a.a();
        }
        cl.u uVarF = w0.f(listenableFutureA, new v2(this, context, str, view, activity, 1), m0.f20038a);
        try {
            try {
                try {
                    sh3Var.b();
                    String str2 = (String) uVarF.get(this.f3215f, TimeUnit.MILLISECONDS);
                    sh3Var.a();
                    this.f3214e.a();
                    return str2;
                } catch (ExecutionException e3) {
                    Throwable th2 = e3;
                    Throwable cause = th2.getCause();
                    if (cause != null) {
                        th2 = cause;
                    }
                    sh3Var.a(th2);
                    String string = Integer.toString(3);
                    sh3Var.a();
                    this.f3214e.a();
                    return string;
                } catch (Throwable th3) {
                    sh3Var.a(th3);
                    throw th3;
                }
            } catch (InterruptedException e11) {
                Thread.currentThread().interrupt();
                sh3Var.a(e11);
                sh3Var.a();
                this.f3214e.a();
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            } catch (TimeoutException unused) {
                if (this.f3221l) {
                    uVarF.cancel(false);
                }
                this.f3213d.b(yk0.EVENT_ID_CLICK_SIGNAL_TIMEOUT);
                String string2 = Integer.toString(17);
                sh3Var.a();
                this.f3214e.a();
                return string2;
            }
        } catch (Throwable th4) {
            sh3Var.a();
            this.f3214e.a();
            throw th4;
        }
    }

    public final String b(Context context, String str, View view, Activity activity) {
        ListenableFuture listenableFutureA;
        v vVar;
        vi3 vi3Var = this.f3213d;
        sh3 sh3Var = new sh3(yk0.EVENT_ID_SIGNAL_VIEW, vi3Var.f10793b, vi3Var.f10792a);
        if (this.f3221l) {
            f61 f61Var = this.f3210a;
            synchronized (f61Var) {
                vVar = f61Var.f3209e;
                vVar.getClass();
            }
            listenableFutureA = w0.c(vVar);
        } else {
            listenableFutureA = this.f3210a.a();
        }
        cl.u uVarF = w0.f(listenableFutureA, new v2(this, context, str, view, activity, 0), m0.f20038a);
        try {
            try {
                try {
                    sh3Var.b();
                    String str2 = (String) uVarF.get(this.f3215f, TimeUnit.MILLISECONDS);
                    sh3Var.a();
                    this.f3214e.a();
                    return str2;
                } catch (ExecutionException e3) {
                    Throwable th2 = e3;
                    Throwable cause = th2.getCause();
                    if (cause != null) {
                        th2 = cause;
                    }
                    sh3Var.a(th2);
                    String string = Integer.toString(3);
                    sh3Var.a();
                    this.f3214e.a();
                    return string;
                } catch (Throwable th3) {
                    sh3Var.a(th3);
                    throw th3;
                }
            } catch (InterruptedException e11) {
                Thread.currentThread().interrupt();
                sh3Var.a(e11);
                sh3Var.a();
                this.f3214e.a();
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            } catch (TimeoutException unused) {
                if (this.f3221l) {
                    uVarF.cancel(false);
                }
                this.f3213d.b(yk0.EVENT_ID_VIEW_SIGNAL_TIMEOUT);
                String string2 = Integer.toString(17);
                sh3Var.a();
                this.f3214e.a();
                return string2;
            }
        } catch (Throwable th4) {
            sh3Var.a();
            this.f3214e.a();
            throw th4;
        }
    }

    public final String a(boolean z11) {
        if (z11) {
            b.cb cbVar = (b.cb) this.f3216g.get();
            long j11 = this.f3218i;
            up1 up1Var = (up1) cbVar;
            vi3 vi3Var = up1Var.f10435b;
            try {
                new sh3(yk0.EVENT_ID_MINIMAL_SIGNAL_QUERY, vi3Var.f10793b, vi3Var.f10792a).b();
                return up1Var.a(j11);
            } finally {
            }
        } else {
            this.f3213d.b(yk0.EVENT_ID_QUERY_SIGNAL_TIMEOUT);
            return Integer.toString(17);
        }
    }
}
