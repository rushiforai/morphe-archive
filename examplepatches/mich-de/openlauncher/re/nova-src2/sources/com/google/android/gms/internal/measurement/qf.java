package com.google.android.gms.internal.measurement;

import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public final class qf {

    /* renamed from: a, reason: collision with root package name */
    public final String f33007a;

    /* renamed from: b, reason: collision with root package name */
    public final cl.u f33008b;

    /* renamed from: c, reason: collision with root package name */
    public final vf f33009c;

    /* renamed from: d, reason: collision with root package name */
    public final io.sentry.internal.debugmeta.c f33010d;

    /* renamed from: e, reason: collision with root package name */
    public final bn.i f33011e;

    /* renamed from: f, reason: collision with root package name */
    public final bn.i f33012f = new bn.i(new l6(this));

    /* renamed from: g, reason: collision with root package name */
    public final Object f33013g;

    /* renamed from: h, reason: collision with root package name */
    public final k1 f33014h;

    /* renamed from: i, reason: collision with root package name */
    public List f33015i;

    public qf(vf vfVar, cl.u uVar) {
        Object obj = new Object();
        this.f33013g = obj;
        this.f33015i = new ArrayList();
        this.f33009c = vfVar;
        this.f33008b = uVar;
        this.f33007a = (String) vfVar.f33148a;
        this.f33011e = new bn.i(new tf(vfVar, 1));
        this.f33010d = new io.sentry.internal.debugmeta.c(8);
        this.f33014h = new k1(17);
        nd ndVar = new nd(this, 4);
        synchronized (obj) {
            this.f33015i.add(ndVar);
        }
    }

    public final cl.v a(qd qdVar, cl.e1 e1Var) throws Throwable {
        cl.s sVarF;
        io.sentry.internal.debugmeta.c cVar;
        cl.m0 m0Var;
        nd ndVar = new nd(qdVar, 3);
        int i5 = bh.f32414a;
        be beVar = new be(4, jg.a(), ndVar);
        vk.b0 b0Var = dh.f32478a;
        vk.b0.g(b0Var, "ticker");
        b0Var.r();
        String strConcat = "Update ".concat(String.valueOf(this.f33007a));
        this.f33014h.getClass();
        qg qgVarB = k1.b(strConcat);
        try {
            sVarF = this.f33012f.F();
            cVar = this.f33010d;
            d2 d2Var = new d2(sVarF, 15);
            m0Var = cl.m0.f20038a;
            cVar.D(d2Var, m0Var);
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            ListenableFuture listenableFutureD = cVar.D(bh.a(new j8(this, sVarF, beVar, e1Var, 3)), m0Var);
            cl.w0.propagateCancellation(listenableFutureD, sVarF);
            cl.w0.c(this.f33008b);
            cl.v vVarE = cl.w0.e(listenableFutureD, new vk.h(), m0Var);
            qgVarB.a(vVarE);
            qgVarB.close();
            return vVarE;
        } catch (Throwable th3) {
            th = th3;
            Throwable th4 = th;
            try {
                qgVarB.close();
                throw th4;
            } catch (Throwable th5) {
                th4.addSuppressed(th5);
                throw th4;
            }
        }
    }
}
