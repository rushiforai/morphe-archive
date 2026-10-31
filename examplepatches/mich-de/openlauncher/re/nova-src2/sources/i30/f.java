package i30;

import android.graphics.RectF;
import android.view.animation.DecelerateInterpolator;
import com.teslacoilsw.launcher.wallpaper.app.CropImage;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes4.dex */
public final class f extends n {

    /* renamed from: g, reason: collision with root package name */
    public float f61280g;

    /* renamed from: h, reason: collision with root package name */
    public float f61281h;

    /* renamed from: i, reason: collision with root package name */
    public float f61282i;

    /* renamed from: j, reason: collision with root package name */
    public e f61283j;

    /* renamed from: k, reason: collision with root package name */
    public u f61284k;

    /* renamed from: l, reason: collision with root package name */
    public d f61285l;

    /* renamed from: m, reason: collision with root package name */
    public int f61286m;
    public int n;
    public CropImage o;

    /* renamed from: p, reason: collision with root package name */
    public k f61287p;

    /* renamed from: q, reason: collision with root package name */
    public int f61288q;

    @Override // i30.n
    public final void l(int i5, int i11, boolean z11) {
        d dVar = this.f61285l;
        e eVar = this.f61283j;
        eVar.i(i5, i11);
        this.f61284k.i(i5, i11);
        if (this.n != -1) {
            dVar.b();
            if (eVar.f() == 0) {
                dVar.a(eVar.f61273g);
                dVar.f61260a = -2L;
                int i12 = dVar.f61269j;
                dVar.f61263d = i12;
                dVar.f61266g = i12;
                int i13 = dVar.f61270k;
                dVar.f61264e = i13;
                dVar.f61267h = i13;
                float f11 = dVar.f61271l;
                dVar.f61265f = f11;
                dVar.f61268i = f11;
            }
        }
    }

    @Override // i30.n
    public final void o(i iVar) {
        d dVar = this.f61285l;
        long j11 = mk.v.f76490c;
        long j12 = dVar.f61260a;
        if (j12 != -2) {
            if (j12 == -1) {
                dVar.f61260a = j11;
            }
            int i5 = (int) (j11 - dVar.f61260a);
            float fB = f30.f.b(i5 / dVar.f61261b, 0.0f, 1.0f);
            DecelerateInterpolator decelerateInterpolator = dVar.f61262c;
            if (decelerateInterpolator != null) {
                fB = decelerateInterpolator.getInterpolation(fB);
            }
            dVar.f61263d = Math.round(((dVar.f61269j - r3) * fB) + dVar.f61266g);
            int iRound = Math.round(((dVar.f61270k - r3) * fB) + dVar.f61267h);
            dVar.f61264e = iRound;
            float f11 = dVar.f61268i;
            float f12 = dVar.f61271l;
            float fA = a2.c.a(f12, f11, fB, f11);
            dVar.f61265f = fA;
            if (dVar.f61263d == dVar.f61269j && iRound == dVar.f61270k && fA == f12) {
                dVar.f61260a = -2L;
            }
            if (i5 >= dVar.f61261b) {
                dVar.f61260a = -2L;
            }
            if (dVar.f61260a != -2) {
                h();
            }
        }
        int i11 = dVar.f61263d;
        int i12 = dVar.f61264e;
        float f13 = dVar.f61265f;
        int i13 = this.f61286m - i11;
        int i14 = this.n - i12;
        u uVar = this.f61284k;
        int i15 = this.f61288q;
        if (i15 == 0) {
            uVar.w(i11, f13, i12, 0);
        } else if (i15 == 90) {
            uVar.w(i12, f13, i13, 90);
        } else if (i15 == 180) {
            uVar.w(i13, f13, i14, 180);
        } else {
            if (i15 != 270) {
                throw new IllegalArgumentException(String.valueOf(i15));
            }
            uVar.w(i14, f13, i11, 270);
        }
        super.o(iVar);
    }

    @Override // i30.n
    public final void p(i iVar) {
        iVar.f61299a.glClear(ReaderJsonLexerKt.BATCH_SIZE);
    }

    public final void r() {
        float f11;
        e eVar = this.f61283j;
        RectF rectF = eVar.f61273g;
        float f12 = eVar.n.f61280g;
        float f13 = f12 == -1.0f ? 1.0f : (r2.n * f12) / r2.f61286m;
        float f14 = 0.3f;
        if (f13 > 1.0f) {
            f11 = 0.3f / f13;
        } else {
            f14 = f13 * 0.3f;
            f11 = 0.3f;
        }
        if (Math.abs(f12 - (r2.f61286m / r2.n)) < 0.001f) {
            rectF.set(0.0f, 0.0f, 1.0f, 1.0f);
        } else {
            rectF.set(0.5f - f14, 0.5f - f11, f14 + 0.5f, f11 + 0.5f);
        }
        eVar.q(0);
    }

    public final void s() {
        u uVar = this.f61284k;
        uVar.D = true;
        j30.g gVar = uVar.E;
        if (gVar != null) {
            gVar.a();
            uVar.E.b();
            uVar.E = null;
        }
        int iG = uVar.f61348q.g();
        for (int i5 = 0; i5 < iG; i5++) {
            r rVar = (r) uVar.f61348q.h(i5);
            rVar.a();
            if (rVar.f61371l != null) {
                rVar.g();
            }
        }
        uVar.f61348q.a();
        uVar.A.set(0, 0, 0, 0);
        synchronized (uVar) {
            try {
                uVar.f61350s.f61337a = null;
                uVar.f61351t.f61337a = null;
                s sVar = uVar.f61349r;
                r rVar2 = (r) sVar.f61337a;
                if (rVar2 != null) {
                    sVar.f61337a = rVar2.f61333t;
                }
                while (rVar2 != null) {
                    rVar2.a();
                    if (rVar2.f61371l != null) {
                        rVar2.g();
                    }
                    s sVar2 = uVar.f61349r;
                    rVar2 = (r) sVar2.f61337a;
                    if (rVar2 != null) {
                        sVar2.f61337a = rVar2.f61333t;
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        uVar.f61341h = null;
        h30.a aVar = u.H;
        synchronized (aVar) {
            aVar.f59040a.clear();
        }
    }

    public final void t() {
        u uVar = this.f61284k;
        if (uVar.E == null) {
            uVar.E = uVar.F.C(new c10.a(uVar), null);
        }
        if (uVar.D) {
            uVar.t(uVar.f61354w, uVar.f61356y, uVar.f61355x, uVar.f61357z);
            uVar.D = false;
            q qVar = uVar.f61340g;
            uVar.f61341h = qVar != null ? qVar.d() : null;
        }
    }

    public final void u(q qVar, int i5) {
        if (((i5 / 90) & 1) != 0) {
            this.f61286m = qVar.c();
            this.n = qVar.e();
        } else {
            this.f61286m = qVar.e();
            this.n = qVar.c();
        }
        this.f61288q = i5;
        u uVar = this.f61284k;
        uVar.f61340g = qVar;
        if (qVar != null) {
            synchronized (uVar) {
                try {
                    uVar.f61351t.f61337a = null;
                    uVar.f61350s.f61337a = null;
                    int iG = uVar.f61348q.g();
                    for (int i11 = 0; i11 < iG; i11++) {
                        uVar.v((r) uVar.f61348q.h(i11));
                    }
                    uVar.f61348q.a();
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            q qVar2 = uVar.f61340g;
            if (qVar2 == null) {
                uVar.f61341h = null;
                uVar.f61352u = 0;
                uVar.f61353v = 0;
                uVar.f61342i = 0;
            } else {
                uVar.f61341h = qVar2.d();
                uVar.f61352u = uVar.f61340g.e();
                uVar.f61353v = uVar.f61340g.c();
                uVar.f61342i = uVar.f61340g.a();
            }
            uVar.t(uVar.f61354w, uVar.f61356y, uVar.f61355x, uVar.f61357z);
            uVar.h();
        }
        this.f61285l.b();
    }
}
