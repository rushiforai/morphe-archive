package com.google.android.gms.internal.measurement;

import ads_mobile_sdk.b71;
import ads_mobile_sdk.db0;
import ads_mobile_sdk.dq2;
import ads_mobile_sdk.e71;
import ads_mobile_sdk.gj0;
import ads_mobile_sdk.gz;
import ads_mobile_sdk.hb1;
import ads_mobile_sdk.nv;
import ads_mobile_sdk.p80;
import ads_mobile_sdk.qw2;
import ads_mobile_sdk.rg0;
import ads_mobile_sdk.wo2;
import android.net.Uri;
import com.google.common.util.concurrent.ListenableFuture;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;

/* loaded from: classes3.dex */
public final class vf implements b.a7 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f33148a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f33149b;

    /* renamed from: c, reason: collision with root package name */
    public Object f33150c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f33151d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f33152e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f33153f;

    /* renamed from: g, reason: collision with root package name */
    public final Object f33154g;

    /* renamed from: h, reason: collision with root package name */
    public final Object f33155h;

    /* renamed from: i, reason: collision with root package name */
    public final Object f33156i;

    /* renamed from: j, reason: collision with root package name */
    public final Object f33157j;

    public vf(String str, cl.z0 z0Var, yf yfVar, Executor executor, ye yeVar, vk.o oVar, k1 k1Var) {
        this.f33156i = new Object();
        this.f33157j = new io.sentry.internal.debugmeta.c(8);
        this.f33150c = null;
        this.f33148a = str;
        this.f33149b = cl.w0.c(z0Var);
        this.f33151d = yfVar;
        this.f33152e = new cl.l1(executor);
        this.f33153f = yeVar;
        this.f33154g = oVar;
        this.f33155h = k1Var;
    }

    @Override // b.a7
    public wo2 a() {
        return (dq2) ((b.m5) this.f33157j).get();
    }

    @Override // b.a7
    public b71 b() {
        return (b71) ((b.m5) this.f33155h).get();
    }

    public v70.m c() {
        return (v70.m) ((b.m5) this.f33156i).get();
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0023 A[Catch: all -> 0x0017, TryCatch #1 {, blocks: (B:4:0x0003, B:6:0x0009, B:8:0x000f, B:13:0x001b, B:14:0x001d, B:16:0x0023, B:17:0x003f, B:18:0x0044), top: B:25:0x0003, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public ListenableFuture d(be beVar, Executor executor) {
        ListenableFuture listenableFuture;
        synchronized (this.f33156i) {
            ListenableFuture listenableFuture2 = (ListenableFuture) this.f33150c;
            if (listenableFuture2 == null || !listenableFuture2.isDone()) {
                if (((ListenableFuture) this.f33150c) == null) {
                    this.f33150c = cl.w0.c(((io.sentry.internal.debugmeta.c) this.f33157j).D(bh.a(new tf(this, 0)), (cl.l1) this.f33152e));
                }
                listenableFuture = (ListenableFuture) this.f33150c;
            } else {
                try {
                    cl.w0.a((ListenableFuture) this.f33150c);
                } catch (ExecutionException unused) {
                    this.f33150c = null;
                }
                if (((ListenableFuture) this.f33150c) == null) {
                }
                listenableFuture = (ListenableFuture) this.f33150c;
            }
        }
        return ((io.sentry.internal.debugmeta.c) this.f33157j).D(bh.a(new j8(this, listenableFuture, beVar, executor, 2)), cl.m0.f20038a);
    }

    public n0 e(Uri uri) throws IOException {
        yf yfVar = (yf) this.f33151d;
        String str = (String) this.f33148a;
        ye yeVar = (ye) this.f33153f;
        try {
            try {
                k1 k1Var = (k1) this.f33155h;
                StringBuilder sb2 = new StringBuilder(String.valueOf(str).length() + 5);
                sb2.append("Read ");
                sb2.append(str);
                String string = sb2.toString();
                k1Var.getClass();
                qg qgVarB = k1.b(string);
                try {
                    InputStream inputStreamD = j1.d(yeVar.b(uri));
                    try {
                        o1 o1VarA = ((m1) ((o2) yfVar.f33263a.w(7))).a(inputStreamD, yfVar.f33264b);
                        if (inputStreamD != null) {
                            inputStreamD.close();
                        }
                        qgVarB.close();
                        return o1VarA;
                    } finally {
                    }
                } catch (Throwable th2) {
                    try {
                        qgVarB.close();
                    } catch (Throwable th3) {
                        th2.addSuppressed(th3);
                    }
                    throw th2;
                }
            } catch (FileNotFoundException e3) {
                we weVarB = yeVar.b(uri);
                if (weVarB.f33193a.b(weVarB.f33196d)) {
                    throw e3;
                }
                return yfVar.f33263a;
            }
        } catch (IOException e11) {
            throw fb.a(yeVar, uri, e11, str);
        }
    }

    public void f(Uri uri, Object obj) {
        String str = (String) this.f33148a;
        ye yeVar = (ye) this.f33153f;
        Uri uriBuild = uri.buildUpon().path(String.valueOf(uri.getPath()).concat(".tmp")).build();
        try {
            k1 k1Var = (k1) this.f33155h;
            StringBuilder sb2 = new StringBuilder(String.valueOf(str).length() + 6);
            sb2.append("Write ");
            sb2.append(str);
            String string = sb2.toString();
            k1Var.getClass();
            qg qgVarB = k1.b(string);
            try {
                l6 l6Var = new l6(4);
                try {
                    we weVarB = yeVar.b(uriBuild);
                    ArrayList arrayListA = weVarB.a(weVarB.f33193a.d(weVarB.f33196d));
                    new l6[]{l6Var}[0].d(arrayListA);
                    OutputStream outputStream = (OutputStream) arrayListA.get(0);
                    try {
                        ((n0) obj).b(outputStream);
                        if (((gf) l6Var.f32780c) == null) {
                            throw new zzsk("Cannot sync underlying stream");
                        }
                        ((OutputStream) l6Var.f32779b).flush();
                        ((gf) l6Var.f32780c).f32576a.getFD().sync();
                        outputStream.close();
                        qgVarB.close();
                        we weVarB2 = yeVar.b(uriBuild);
                        we weVarB3 = yeVar.b(uri);
                        nf nfVar = weVarB2.f33193a;
                        if (nfVar != weVarB3.f33193a) {
                            throw new zzsk("Cannot rename file across backends");
                        }
                        nfVar.f(weVarB2.f33196d, weVarB3.f33196d);
                    } catch (Throwable th2) {
                        if (outputStream != null) {
                            try {
                                outputStream.close();
                            } catch (Throwable th3) {
                                th2.addSuppressed(th3);
                            }
                        }
                        throw th2;
                    }
                } catch (IOException e3) {
                    throw fb.a(yeVar, uri, e3, str);
                }
            } finally {
            }
        } catch (IOException e11) {
            we weVarB4 = yeVar.b(uriBuild);
            if (weVarB4.f33193a.b(weVarB4.f33196d)) {
                try {
                    we weVarB5 = yeVar.b(uriBuild);
                    weVarB5.f33193a.e(weVarB5.f33196d);
                } catch (IOException e12) {
                    e11.addSuppressed(e12);
                }
            }
            throw e11;
        }
    }

    @Override // b.a7
    public dq2 a() {
        return (dq2) ((b.m5) this.f33157j).get();
    }

    public vf(db0 db0Var, ni.q qVar, qw2 qw2Var, Boolean bool, Boolean bool2, mi.g gVar) {
        this.f33148a = new gj0(new ads_mobile_sdk.n5(3, db0Var.f2348u, db0Var.f2284h, db0Var.f2343t));
        this.f33149b = hb1.a(gVar);
        hb1 hb1Var = b.l8.f15937a;
        this.f33150c = new gj0(new ads_mobile_sdk.ki(hb1Var, (b.bb) hb1Var, (b.m5) hb1Var, 4));
        this.f33151d = new gj0(new ads_mobile_sdk.rh(db0Var.f2349u0, 8));
        this.f33152e = hb1.a(qw2Var);
        this.f33153f = hb1.a(bool2);
        this.f33154g = new p80(hb1.a(qVar));
        hb1 hb1VarA = hb1.a(bool);
        rg0 rg0Var = db0Var.M0;
        hb1 hb1Var2 = (hb1) this.f33152e;
        p80 p80Var = (p80) this.f33154g;
        b.m5 m5Var = (b.m5) this.f33151d;
        b.m5 m5Var2 = db0Var.f2284h;
        b.m5 m5Var3 = db0Var.f2343t;
        gj0 gj0Var = new gj0(new e71(rg0Var, hb1VarA, hb1Var2, p80Var, m5Var, hb1Var, m5Var2, m5Var3));
        this.f33155h = gj0Var;
        gj0 gj0Var2 = new gj0(b.ed.f15827m);
        this.f33156i = gj0Var2;
        rg0 rg0Var2 = db0Var.f2348u;
        this.f33157j = new gj0(new gz(db0Var.f2274f, db0Var.f2360w, db0Var.R3, db0Var.S3, rg0Var2, db0Var.N3, (b.m5) this.f33148a, db0Var.f2305l2, (hb1) this.f33149b, (b.m5) this.f33150c, m5Var3, db0Var.G, m5Var, hb1Var2, db0Var.f2265d, (hb1) this.f33153f, gj0Var, new gj0(new nv(rg0Var2, gj0Var2, 3)), db0Var.f2257b0));
    }
}
