package gf;

import android.net.Uri;
import com.google.android.exoplayer2.metadata.icy.IcyHeaders;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes3.dex */
public final class i0 {

    /* renamed from: a, reason: collision with root package name */
    public final Uri f57512a;

    /* renamed from: b, reason: collision with root package name */
    public final vf.f0 f57513b;

    /* renamed from: c, reason: collision with root package name */
    public final fl.l f57514c;

    /* renamed from: d, reason: collision with root package name */
    public final l0 f57515d;

    /* renamed from: e, reason: collision with root package name */
    public final bg.g f57516e;

    /* renamed from: g, reason: collision with root package name */
    public volatile boolean f57518g;

    /* renamed from: i, reason: collision with root package name */
    public long f57520i;

    /* renamed from: j, reason: collision with root package name */
    public vf.l f57521j;

    /* renamed from: k, reason: collision with root package name */
    public s0 f57522k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f57523l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ l0 f57524m;

    /* renamed from: f, reason: collision with root package name */
    public final ke.m f57517f = new ke.m();

    /* renamed from: h, reason: collision with root package name */
    public boolean f57519h = true;

    public i0(l0 l0Var, Uri uri, vf.k kVar, fl.l lVar, l0 l0Var2, bg.g gVar) {
        this.f57524m = l0Var;
        this.f57512a = uri;
        this.f57513b = new vf.f0(kVar);
        this.f57514c = lVar;
        this.f57515d = l0Var2;
        this.f57516e = gVar;
        m.f57566a.getAndIncrement();
        this.f57521j = a(0L);
    }

    public final vf.l a(long j11) {
        Map map = Collections.EMPTY_MAP;
        Map map2 = l0.L;
        Uri uri = this.f57512a;
        wf.a.k(uri, "The uri must be set.");
        return new vf.l(uri, 1, null, map2, j11, -1L, 6);
    }

    public final void b() {
        vf.k lVar;
        int i5;
        int iG = 0;
        while (iG == 0 && !this.f57518g) {
            try {
                long j11 = this.f57517f.f71407a;
                vf.l lVarA = a(j11);
                this.f57521j = lVarA;
                long jOpen = this.f57513b.open(lVarA);
                if (jOpen != -1) {
                    jOpen += j11;
                    l0 l0Var = this.f57524m;
                    l0Var.o.post(new h0(l0Var, 2));
                }
                long j12 = jOpen;
                this.f57524m.f57556q = IcyHeaders.a(this.f57513b.f92668a.getResponseHeaders());
                vf.f0 f0Var = this.f57513b;
                IcyHeaders icyHeaders = this.f57524m.f57556q;
                if (icyHeaders == null || (i5 = icyHeaders.f31502f) == -1) {
                    lVar = f0Var;
                } else {
                    lVar = new l(f0Var, i5, this);
                    s0 s0VarA = this.f57524m.A(new k0(0, true));
                    this.f57522k = s0VarA;
                    s0VarA.a(l0.M);
                }
                this.f57514c.p(lVar, this.f57512a, this.f57513b.f92668a.getResponseHeaders(), j11, j12, this.f57515d);
                if (this.f57524m.f57556q != null) {
                    ke.j jVar = (ke.j) this.f57514c.f55374b;
                    if (jVar instanceof re.d) {
                        ((re.d) jVar).f85830p = true;
                    }
                }
                if (this.f57519h) {
                    fl.l lVar2 = this.f57514c;
                    long j13 = this.f57520i;
                    ke.j jVar2 = (ke.j) lVar2.f55374b;
                    jVar2.getClass();
                    jVar2.b(j11, j13);
                    this.f57519h = false;
                }
                while (iG == 0 && !this.f57518g) {
                    try {
                        bg.g gVar = this.f57516e;
                        synchronized (gVar) {
                            while (!gVar.f17888a) {
                                gVar.wait();
                            }
                        }
                        fl.l lVar3 = this.f57514c;
                        ke.m mVar = this.f57517f;
                        ke.j jVar3 = (ke.j) lVar3.f55374b;
                        jVar3.getClass();
                        ke.g gVar2 = (ke.g) lVar3.f55375c;
                        gVar2.getClass();
                        iG = jVar3.g(gVar2, mVar);
                        ke.g gVar3 = (ke.g) this.f57514c.f55375c;
                        long j14 = gVar3 != null ? gVar3.f71398d : -1L;
                        if (j14 > this.f57524m.f57550i + j11) {
                            this.f57516e.c();
                            l0 l0Var2 = this.f57524m;
                            l0Var2.o.post(l0Var2.n);
                            j11 = j14;
                        }
                    } catch (InterruptedException unused) {
                        throw new InterruptedIOException();
                    }
                }
                if (iG == 1) {
                    iG = 0;
                } else {
                    ke.g gVar4 = (ke.g) this.f57514c.f55375c;
                    if ((gVar4 != null ? gVar4.f71398d : -1L) != -1) {
                        this.f57517f.f71407a = gVar4 != null ? gVar4.f71398d : -1L;
                    }
                }
                vf.f0 f0Var2 = this.f57513b;
                if (f0Var2 != null) {
                    try {
                        f0Var2.close();
                    } catch (IOException unused2) {
                    }
                }
            } catch (Throwable th2) {
                if (iG != 1) {
                    ke.g gVar5 = (ke.g) this.f57514c.f55375c;
                    if ((gVar5 != null ? gVar5.f71398d : -1L) != -1) {
                        this.f57517f.f71407a = gVar5 != null ? gVar5.f71398d : -1L;
                    }
                }
                vf.f0 f0Var3 = this.f57513b;
                if (f0Var3 != null) {
                    try {
                        f0Var3.close();
                    } catch (IOException unused3) {
                    }
                }
                throw th2;
            }
        }
    }
}
