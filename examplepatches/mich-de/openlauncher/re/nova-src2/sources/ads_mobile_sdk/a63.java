package ads_mobile_sdk;

import ads_mobile_sdk.a63;
import ads_mobile_sdk.jb1;
import ads_mobile_sdk.qm1;
import ads_mobile_sdk.rm2;
import ads_mobile_sdk.y53;
import ads_mobile_sdk.yk0;
import android.app.Activity;
import android.content.Context;
import android.view.InputEvent;
import android.view.MotionEvent;
import android.view.View;
import b.a0;
import b.h;
import b.i;
import b.k9;
import b.l1;
import b.ub;
import b.vb;
import cl.d0;
import cl.m0;
import cl.p1;
import cl.r0;
import cl.w0;
import com.google.common.util.concurrent.ListenableFuture;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Optional;
import java.util.RandomAccess;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* loaded from: classes.dex */
public final class a63 implements ub {

    /* renamed from: a, reason: collision with root package name */
    public final a0 f864a;

    /* renamed from: c, reason: collision with root package name */
    public final l1 f865c;

    /* renamed from: d, reason: collision with root package name */
    public final vb f866d;

    /* renamed from: e, reason: collision with root package name */
    public final ExecutorService f867e;

    /* renamed from: f, reason: collision with root package name */
    public final Executor f868f;

    /* renamed from: g, reason: collision with root package name */
    public final ub3 f869g;

    /* renamed from: h, reason: collision with root package name */
    public final vi3 f870h;

    /* renamed from: i, reason: collision with root package name */
    public final Object f871i = new Object();

    /* renamed from: j, reason: collision with root package name */
    public final String f872j;

    /* renamed from: k, reason: collision with root package name */
    public final long f873k;

    /* renamed from: l, reason: collision with root package name */
    public final long f874l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f875m;
    public final boolean n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    public z53 f876p;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v7, types: [cl.l1] */
    public a63(a0 a0Var, l1 l1Var, vb vbVar, ub3 ub3Var, vi3 vi3Var, j7 j7Var, ExecutorService executorService) {
        this.f864a = a0Var;
        this.f865c = l1Var;
        this.f866d = vbVar;
        this.f867e = executorService;
        this.f869g = ub3Var;
        this.f870h = vi3Var;
        this.f872j = j7Var.F();
        this.f873k = j7Var.H();
        this.f874l = j7Var.D();
        this.f875m = j7Var.p();
        this.n = j7Var.C();
        boolean zV = j7Var.v();
        this.o = zV;
        this.f868f = zV ? new cl.l1(executorService) : executorService;
    }

    /* JADX WARN: Removed duplicated region for block: B:113:0x0167  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x016e  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x0175  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00e2  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00e3  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0110 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0130  */
    /* renamed from: a, reason: collision with other method in class */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void m0a(HashMap map) {
        String strP;
        String strP2;
        Long lValueOf;
        sh3 sh3Var;
        String str;
        Throwable cause;
        String strMo3a;
        map.put("v", this.f872j);
        ListenableFuture listenableFuture = (ListenableFuture) map.get("gs");
        ListenableFuture listenableFuture2 = (ListenableFuture) map.get("ai");
        vi3 vi3Var = this.f870h;
        long jO = -1;
        if (listenableFuture != null) {
            sh3Var = new sh3(yk0.EVENT_ID_ORCAS_ENGINE_COMPOSE_GASS_SIGNAL_STATE, vi3Var.f10793b, vi3Var.f10792a);
            try {
                try {
                    sh3Var.b();
                    pd pdVar = (pd) listenableFuture.get(this.f874l, TimeUnit.MILLISECONDS);
                    if (pdVar != null) {
                        if (pdVar.v()) {
                            he heVarR = pdVar.r();
                            if (heVarR.r()) {
                                sq sqVarO = heVarR.o();
                                Charset charset = StandardCharsets.ISO_8859_1;
                                strMo3a = sqVarO.size() == 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : sqVarO.mo3a();
                            } else {
                                strMo3a = null;
                            }
                            try {
                                lValueOf = heVarR.t() ? Long.valueOf(heVarR.q()) : null;
                                try {
                                    strP2 = heVarR.s() ? heVarR.p() : null;
                                    str = strMo3a;
                                } catch (ClassCastException e3) {
                                    e = e3;
                                    strP2 = null;
                                    str = strMo3a;
                                    strP = "E";
                                    sh3Var.a(e);
                                    sh3Var.a();
                                    if (strP.equals("E")) {
                                    }
                                    map.put("int", strP);
                                    if (str != null) {
                                    }
                                    if (lValueOf != null) {
                                    }
                                    if (strP2 != null) {
                                    }
                                    map.put("gv", Long.valueOf(jO));
                                } catch (InterruptedException unused) {
                                    strP2 = null;
                                    str = strMo3a;
                                    strP = "E";
                                    Thread.currentThread().interrupt();
                                    sh3Var.a();
                                    if (strP.equals("E")) {
                                    }
                                    map.put("int", strP);
                                    if (str != null) {
                                    }
                                    if (lValueOf != null) {
                                    }
                                    if (strP2 != null) {
                                    }
                                    map.put("gv", Long.valueOf(jO));
                                } catch (ExecutionException e11) {
                                    e = e11;
                                    strP2 = null;
                                    str = strMo3a;
                                    strP = "E";
                                    cause = e.getCause();
                                    if (cause != null) {
                                    }
                                    sh3Var.a(e);
                                    sh3Var.a();
                                    if (strP.equals("E")) {
                                    }
                                    map.put("int", strP);
                                    if (str != null) {
                                    }
                                    if (lValueOf != null) {
                                    }
                                    if (strP2 != null) {
                                    }
                                    map.put("gv", Long.valueOf(jO));
                                } catch (TimeoutException unused2) {
                                    strP2 = null;
                                    str = strMo3a;
                                    strP = "E";
                                    vi3Var.b(yk0.EVENT_ID_ORCAS_ENGINE_COMPOSE_GASS_SIGNAL_TIMEOUT);
                                    sh3Var.a();
                                    if (strP.equals("E")) {
                                    }
                                    map.put("int", strP);
                                    if (str != null) {
                                    }
                                    if (lValueOf != null) {
                                    }
                                    if (strP2 != null) {
                                    }
                                    map.put("gv", Long.valueOf(jO));
                                }
                            } catch (ClassCastException e12) {
                                e = e12;
                                strP2 = null;
                                lValueOf = null;
                            } catch (InterruptedException unused3) {
                                strP2 = null;
                                lValueOf = null;
                            } catch (ExecutionException e13) {
                                e = e13;
                                strP2 = null;
                                lValueOf = null;
                            } catch (TimeoutException unused4) {
                                strP2 = null;
                                lValueOf = null;
                            }
                        } else {
                            strP2 = null;
                            lValueOf = null;
                        }
                        try {
                            strP = pdVar.p().length() > 1 ? pdVar.p() : "E";
                        } catch (ClassCastException e14) {
                            e = e14;
                            strP = "E";
                            sh3Var.a(e);
                            sh3Var.a();
                            if (strP.equals("E")) {
                                sh3Var = new sh3(yk0.EVENT_ID_ORCAS_ENGINE_COMPOSE_LOCAL_INT_SIGNAL_STATE, vi3Var.f10793b, vi3Var.f10792a);
                                try {
                                    try {
                                        try {
                                            try {
                                                sh3Var.b();
                                                str = (String) listenableFuture2.get(this.f873k, TimeUnit.MILLISECONDS);
                                                if (!vk.l.a(str)) {
                                                }
                                            } catch (TimeoutException unused5) {
                                                vi3Var.b(yk0.EVENT_ID_ORCAS_ENGINE_COMPOSE_LOCAL_INT_SIGNAL_TIMEOUT);
                                                map.put("int", strP);
                                                if (str != null) {
                                                }
                                                if (lValueOf != null) {
                                                }
                                                if (strP2 != null) {
                                                }
                                                map.put("gv", Long.valueOf(jO));
                                            }
                                        } catch (ExecutionException e15) {
                                            e = e15;
                                            Throwable cause2 = e.getCause();
                                            if (cause2 != null) {
                                                e = cause2;
                                            }
                                            sh3Var.a(e);
                                            map.put("int", strP);
                                            if (str != null) {
                                            }
                                            if (lValueOf != null) {
                                            }
                                            if (strP2 != null) {
                                            }
                                            map.put("gv", Long.valueOf(jO));
                                        }
                                    } catch (ClassCastException e16) {
                                        sh3Var.a(e16);
                                        map.put("int", strP);
                                        if (str != null) {
                                        }
                                        if (lValueOf != null) {
                                        }
                                        if (strP2 != null) {
                                        }
                                        map.put("gv", Long.valueOf(jO));
                                    } catch (InterruptedException unused6) {
                                        Thread.currentThread().interrupt();
                                        map.put("int", strP);
                                        if (str != null) {
                                        }
                                        if (lValueOf != null) {
                                        }
                                        if (strP2 != null) {
                                        }
                                        map.put("gv", Long.valueOf(jO));
                                    }
                                } finally {
                                    sh3Var.a();
                                }
                            }
                            map.put("int", strP);
                            if (str != null) {
                            }
                            if (lValueOf != null) {
                            }
                            if (strP2 != null) {
                            }
                            map.put("gv", Long.valueOf(jO));
                        } catch (InterruptedException unused7) {
                            strP = "E";
                            Thread.currentThread().interrupt();
                            sh3Var.a();
                            if (strP.equals("E")) {
                            }
                            map.put("int", strP);
                            if (str != null) {
                            }
                            if (lValueOf != null) {
                            }
                            if (strP2 != null) {
                            }
                            map.put("gv", Long.valueOf(jO));
                        } catch (ExecutionException e17) {
                            e = e17;
                            strP = "E";
                            cause = e.getCause();
                            if (cause != null) {
                                e = cause;
                            }
                            sh3Var.a(e);
                            sh3Var.a();
                            if (strP.equals("E")) {
                            }
                            map.put("int", strP);
                            if (str != null) {
                            }
                            if (lValueOf != null) {
                            }
                            if (strP2 != null) {
                            }
                            map.put("gv", Long.valueOf(jO));
                        } catch (TimeoutException unused8) {
                            strP = "E";
                            vi3Var.b(yk0.EVENT_ID_ORCAS_ENGINE_COMPOSE_GASS_SIGNAL_TIMEOUT);
                            sh3Var.a();
                            if (strP.equals("E")) {
                            }
                            map.put("int", strP);
                            if (str != null) {
                            }
                            if (lValueOf != null) {
                            }
                            if (strP2 != null) {
                            }
                            map.put("gv", Long.valueOf(jO));
                        }
                        try {
                            if (pdVar.t()) {
                                jO = pdVar.o();
                            }
                        } catch (ClassCastException e18) {
                            e = e18;
                            sh3Var.a(e);
                            sh3Var.a();
                            if (strP.equals("E")) {
                            }
                            map.put("int", strP);
                            if (str != null) {
                            }
                            if (lValueOf != null) {
                            }
                            if (strP2 != null) {
                            }
                            map.put("gv", Long.valueOf(jO));
                        } catch (InterruptedException unused9) {
                            Thread.currentThread().interrupt();
                            sh3Var.a();
                            if (strP.equals("E")) {
                            }
                            map.put("int", strP);
                            if (str != null) {
                            }
                            if (lValueOf != null) {
                            }
                            if (strP2 != null) {
                            }
                            map.put("gv", Long.valueOf(jO));
                        } catch (ExecutionException e19) {
                            e = e19;
                            cause = e.getCause();
                            if (cause != null) {
                            }
                            sh3Var.a(e);
                            sh3Var.a();
                            if (strP.equals("E")) {
                            }
                            map.put("int", strP);
                            if (str != null) {
                            }
                            if (lValueOf != null) {
                            }
                            if (strP2 != null) {
                            }
                            map.put("gv", Long.valueOf(jO));
                        } catch (TimeoutException unused10) {
                            vi3Var.b(yk0.EVENT_ID_ORCAS_ENGINE_COMPOSE_GASS_SIGNAL_TIMEOUT);
                            sh3Var.a();
                            if (strP.equals("E")) {
                            }
                            map.put("int", strP);
                            if (str != null) {
                            }
                            if (lValueOf != null) {
                            }
                            if (strP2 != null) {
                            }
                            map.put("gv", Long.valueOf(jO));
                        }
                    } else {
                        strP = "E";
                        strP2 = null;
                        lValueOf = null;
                    }
                    sh3Var.a();
                } finally {
                }
            } catch (ClassCastException e21) {
                e = e21;
                strP = "E";
                strP2 = null;
                lValueOf = null;
            } catch (InterruptedException unused11) {
                strP = "E";
                strP2 = null;
                lValueOf = null;
            } catch (ExecutionException e22) {
                e = e22;
                strP = "E";
                strP2 = null;
                lValueOf = null;
            } catch (TimeoutException unused12) {
                strP = "E";
                strP2 = null;
                lValueOf = null;
            }
        } else {
            strP = "E";
            strP2 = null;
            lValueOf = null;
        }
        if (strP.equals("E") && listenableFuture2 != null) {
            sh3Var = new sh3(yk0.EVENT_ID_ORCAS_ENGINE_COMPOSE_LOCAL_INT_SIGNAL_STATE, vi3Var.f10793b, vi3Var.f10792a);
            sh3Var.b();
            str = (String) listenableFuture2.get(this.f873k, TimeUnit.MILLISECONDS);
            if (!vk.l.a(str)) {
                strP = str;
            }
        }
        map.put("int", strP);
        if (str != null) {
            map.put("att", str);
        }
        if (lValueOf != null) {
            map.put("attts", lValueOf);
        }
        if (strP2 != null) {
            map.put("attkid", strP2);
        }
        map.put("gv", Long.valueOf(jO));
    }

    @Override // b.ub
    public final p1 b(Context context, String str, View view, Activity activity) {
        return w0.d(new b.j(this, context, str, view, activity, 1), this.f868f);
    }

    @Override // b.ub
    public final c8 c() {
        return c8.ADSHIELD_VERSION_3;
    }

    @Override // b.ub
    public final String b() {
        synchronized (this.f871i) {
            try {
                z53 z53Var = this.f876p;
                if (z53Var == null) {
                    return "3.960507516.-1";
                }
                return z53Var.f12454d;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void b(InputEvent inputEvent) {
        try {
            synchronized (this.f871i) {
                try {
                    z53 z53Var = this.f876p;
                    if (z53Var != null) {
                        HashMap map = new HashMap();
                        map.put("evt", inputEvent);
                        z53Var.f12451a.a(z53Var.f12453c, Optional.of(map));
                    } else {
                        this.f870h.b(yk0.EVENT_ID_ORCAS_ENGINE_REPORT_TOUCH_EVENT_NULL_HOLDER);
                    }
                } finally {
                }
            }
        } catch (wi1 | xo3 e3) {
            vi3 vi3Var = this.f870h;
            yk0 yk0Var = yk0.EVENT_ID_UNSPECIFIED;
            ((qm1) vi3Var.f10792a).a(20103, -1L, null, e3);
        }
    }

    @Override // b.ub
    public final void a(InputEvent inputEvent) {
        if (this.o) {
            if (inputEvent instanceof MotionEvent) {
                inputEvent = MotionEvent.obtain((MotionEvent) inputEvent);
            }
            this.f868f.execute(new ae.c(2, this, inputEvent));
            return;
        }
        b(inputEvent);
    }

    public final String a(HashMap map) {
        vi3 vi3Var = this.f870h;
        try {
            new sh3(yk0.EVENT_ID_ORCAS_ENGINE_COLLECT_SIGNAL_VM_INVOCATION, vi3Var.f10793b, vi3Var.f10792a).b();
            synchronized (this.f871i) {
                z53 z53Var = this.f876p;
                if (z53Var == null) {
                    this.f870h.b(yk0.EVENT_ID_ORCAS_ENGINE_COLLECT_SIGNAL_NULL_HOLDER);
                    return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                return k9.u(true).c((byte[]) z53Var.f12451a.a(z53Var.f12452b, Optional.of(map)));
            }
        } finally {
        }
    }

    @Override // b.ub
    public final p1 a(Context context) {
        return w0.d(new i(0, this, context), this.f867e);
    }

    @Override // b.ub
    public final p1 a(Context context, String str, View view, Activity activity) {
        return w0.d(new b.j(this, context, str, view, activity, 0), this.f867e);
    }

    @Override // b.ub
    public final r0 a() {
        boolean z11 = this.n;
        m0 m0Var = m0.f20038a;
        vb vbVar = this.f866d;
        if (z11) {
            return w0.e(vbVar.d(), new h(this, 1), m0Var);
        }
        r0 r0VarR = r0.r(vbVar.a());
        b.e eVar = new b.e(0);
        ExecutorService executorService = this.f867e;
        final int i5 = 0;
        cl.u uVarF = w0.f(cl.c.t(r0VarR, Throwable.class, eVar, executorService), new d0(this) { // from class: b.g

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ a63 f15853b;

            {
                this.f15853b = this;
            }

            @Override // cl.d0
            public final ListenableFuture apply(Object obj) {
                switch (i5) {
                    case 0:
                        a63 a63Var = this.f15853b;
                        rm2 rm2Var = (rm2) obj;
                        if (rm2Var != null) {
                            a0 a0Var = a63Var.f864a;
                            j6 j6VarO = rm2Var.o();
                            qm1 qm1Var = (qm1) a0Var;
                            synchronized (qm1Var.n) {
                                p9 p9Var = qm1Var.f8742q;
                                p9Var.b();
                                ads_mobile_sdk.s7 s7Var = (ads_mobile_sdk.s7) p9Var.f1095b;
                                RandomAccess randomAccess = s7Var.experimentIds_;
                                if (!((ads_mobile_sdk.j) randomAccess).f5068a) {
                                    jb1 jb1Var = (jb1) randomAccess;
                                    s7Var.experimentIds_ = jb1Var.a(jb1Var.f5204c * 2);
                                }
                                y2.a(j6VarO, s7Var.experimentIds_);
                            }
                        }
                        if (a63Var.f865c.b(rm2Var)) {
                            return cl.w0.e(a63Var.f866d.b(), new h(a63Var, 0), cl.m0.f20038a);
                        }
                        a63Var.f870h.b(yk0.EVENT_ID_ORCAS_ENGINE_INIT_SKIP_INVALID_METADATA);
                        throw new y53(1);
                    default:
                        a63 a63Var2 = this.f15853b;
                        Throwable th2 = (Throwable) obj;
                        if (a63Var2.f875m) {
                            return cl.w0.e(a63Var2.f866d.d(), new h(a63Var2, 1), cl.m0.f20038a);
                        }
                        th2.getClass();
                        return new cl.y0(th2);
                }
            }
        }, executorService);
        final int i11 = 1;
        return cl.c.s(uVarF, Throwable.class, new d0(this) { // from class: b.g

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ a63 f15853b;

            {
                this.f15853b = this;
            }

            @Override // cl.d0
            public final ListenableFuture apply(Object obj) {
                switch (i11) {
                    case 0:
                        a63 a63Var = this.f15853b;
                        rm2 rm2Var = (rm2) obj;
                        if (rm2Var != null) {
                            a0 a0Var = a63Var.f864a;
                            j6 j6VarO = rm2Var.o();
                            qm1 qm1Var = (qm1) a0Var;
                            synchronized (qm1Var.n) {
                                p9 p9Var = qm1Var.f8742q;
                                p9Var.b();
                                ads_mobile_sdk.s7 s7Var = (ads_mobile_sdk.s7) p9Var.f1095b;
                                RandomAccess randomAccess = s7Var.experimentIds_;
                                if (!((ads_mobile_sdk.j) randomAccess).f5068a) {
                                    jb1 jb1Var = (jb1) randomAccess;
                                    s7Var.experimentIds_ = jb1Var.a(jb1Var.f5204c * 2);
                                }
                                y2.a(j6VarO, s7Var.experimentIds_);
                            }
                        }
                        if (a63Var.f865c.b(rm2Var)) {
                            return cl.w0.e(a63Var.f866d.b(), new h(a63Var, 0), cl.m0.f20038a);
                        }
                        a63Var.f870h.b(yk0.EVENT_ID_ORCAS_ENGINE_INIT_SKIP_INVALID_METADATA);
                        throw new y53(1);
                    default:
                        a63 a63Var2 = this.f15853b;
                        Throwable th2 = (Throwable) obj;
                        if (a63Var2.f875m) {
                            return cl.w0.e(a63Var2.f866d.d(), new h(a63Var2, 1), cl.m0.f20038a);
                        }
                        th2.getClass();
                        return new cl.y0(th2);
                }
            }
        }, m0Var);
    }

    public final void a(e30.j jVar, byte[] bArr, boolean z11) {
        vi3 vi3Var = this.f870h;
        sh3 sh3Var = new sh3(yk0.EVENT_ID_ORCAS_ENGINE_INIT_VM_LOAD, vi3Var.f10793b, vi3Var.f10792a);
        try {
            try {
                sh3Var.b();
                synchronized (this.f871i) {
                    this.f876p = z53.a(jVar, bArr, z11);
                }
                sh3Var.a();
            } catch (wi1 e3) {
                e = e3;
                sh3Var.a(e);
                throw new y53(e);
            } catch (xo3 e11) {
                e = e11;
                sh3Var.a(e);
                throw new y53(e);
            } catch (Throwable th2) {
                sh3Var.a(th2);
                throw th2;
            }
        } catch (Throwable th3) {
            sh3Var.a();
            throw th3;
        }
    }
}
