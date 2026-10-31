package l2;

import aa.m0;
import android.graphics.Outline;
import android.graphics.RectF;
import android.os.Build;
import b0.x;
import e10.z2;
import e20.r;
import i2.i0;
import i2.j0;
import i2.k0;
import i2.n0;
import i2.r0;
import java.util.Locale;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import y3.n;
import z.b1;
import z.p0;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final d f74501a;

    /* renamed from: f, reason: collision with root package name */
    public Outline f74506f;

    /* renamed from: j, reason: collision with root package name */
    public float f74510j;

    /* renamed from: k, reason: collision with root package name */
    public r0 f74511k;

    /* renamed from: l, reason: collision with root package name */
    public n0 f74512l;

    /* renamed from: m, reason: collision with root package name */
    public i2.h f74513m;
    public boolean n;
    public k2.b o;

    /* renamed from: p, reason: collision with root package name */
    public m0 f74514p;

    /* renamed from: q, reason: collision with root package name */
    public int f74515q;

    /* renamed from: s, reason: collision with root package name */
    public boolean f74517s;

    /* renamed from: t, reason: collision with root package name */
    public long f74518t;

    /* renamed from: u, reason: collision with root package name */
    public long f74519u;

    /* renamed from: v, reason: collision with root package name */
    public long f74520v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f74521w;

    /* renamed from: x, reason: collision with root package name */
    public RectF f74522x;

    /* renamed from: b, reason: collision with root package name */
    public y3.c f74502b = k2.e.f70869a;

    /* renamed from: c, reason: collision with root package name */
    public n f74503c = n.f96612a;

    /* renamed from: d, reason: collision with root package name */
    public Function1 f74504d = a.f74498k;

    /* renamed from: e, reason: collision with root package name */
    public final x f74505e = new x(this, 14);

    /* renamed from: g, reason: collision with root package name */
    public boolean f74507g = true;

    /* renamed from: h, reason: collision with root package name */
    public long f74508h = 0;

    /* renamed from: i, reason: collision with root package name */
    public long f74509i = 9205357640488583168L;

    /* renamed from: r, reason: collision with root package name */
    public final r f74516r = new r();

    static {
        String lowerCase = Build.FINGERPRINT.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        lowerCase.equals("robolectric");
    }

    public b(d dVar) {
        this.f74501a = dVar;
        dVar.t(false);
        this.f74518t = 0L;
        this.f74519u = 0L;
        this.f74520v = 9205357640488583168L;
    }

    public final void a() {
        Outline outline;
        if (this.f74507g) {
            boolean z11 = this.f74521w;
            Outline outline2 = null;
            d dVar = this.f74501a;
            if (z11 || dVar.K() > 0.0f) {
                n0 n0Var = this.f74512l;
                if (n0Var != null) {
                    RectF rectF = this.f74522x;
                    if (rectF == null) {
                        rectF = new RectF();
                        this.f74522x = rectF;
                    }
                    boolean z12 = n0Var instanceof i2.h;
                    if (!z12) {
                        throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
                    }
                    ((i2.h) n0Var).f61117a.computeBounds(rectF, false);
                    int i5 = Build.VERSION.SDK_INT;
                    if (i5 > 28 || ((i2.h) n0Var).f61117a.isConvex()) {
                        outline = this.f74506f;
                        if (outline == null) {
                            outline = new Outline();
                            this.f74506f = outline;
                        }
                        if (i5 >= 30) {
                            if (!z12) {
                                throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
                            }
                            outline.setPath(((i2.h) n0Var).f61117a);
                        } else {
                            if (!z12) {
                                throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
                            }
                            outline.setConvexPath(((i2.h) n0Var).f61117a);
                        }
                        this.n = !outline.canClip();
                    } else {
                        Outline outline3 = this.f74506f;
                        if (outline3 != null) {
                            outline3.setEmpty();
                        }
                        this.n = true;
                        outline = null;
                    }
                    this.f74512l = n0Var;
                    if (outline != null) {
                        outline.setAlpha(dVar.a());
                        outline2 = outline;
                    }
                    dVar.B(outline2, (4294967295L & Math.round(rectF.height())) | (Math.round(rectF.width()) << 32));
                    if (this.n && this.f74521w) {
                        dVar.t(false);
                        dVar.d();
                    } else {
                        dVar.t(this.f74521w);
                    }
                } else {
                    dVar.t(this.f74521w);
                    Outline outline4 = this.f74506f;
                    if (outline4 == null) {
                        outline4 = new Outline();
                        this.f74506f = outline4;
                    }
                    Outline outline5 = outline4;
                    long jT = w20.e.t(this.f74519u);
                    long j11 = this.f74508h;
                    long j12 = this.f74509i;
                    if (j12 != 9205357640488583168L) {
                        jT = j12;
                    }
                    int i11 = (int) (j11 >> 32);
                    int i12 = (int) (j11 & 4294967295L);
                    int i13 = (int) (jT >> 32);
                    outline5.setRoundRect(Math.round(Float.intBitsToFloat(i11)), Math.round(Float.intBitsToFloat(i12)), Math.round(Float.intBitsToFloat(i13) + Float.intBitsToFloat(i11)), Math.round(Float.intBitsToFloat((int) (jT & 4294967295L)) + Float.intBitsToFloat(i12)), this.f74510j);
                    outline5.setAlpha(dVar.a());
                    dVar.B(outline5, (4294967295L & Math.round(Float.intBitsToFloat(r15))) | (Math.round(Float.intBitsToFloat(i13)) << 32));
                }
            } else {
                dVar.t(false);
                dVar.B(null, 0L);
            }
        }
        this.f74507g = false;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0068  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b() {
        if (this.f74517s && this.f74515q == 0) {
            r rVar = this.f74516r;
            b bVar = (b) rVar.f52080b;
            if (bVar != null) {
                bVar.f74515q--;
                bVar.b();
                rVar.f52080b = null;
            }
            p0 p0Var = (p0) rVar.f52082d;
            if (p0Var != null) {
                Object[] objArr = p0Var.f97741b;
                long[] jArr = p0Var.f97740a;
                int length = jArr.length - 2;
                if (length >= 0) {
                    int i5 = 0;
                    while (true) {
                        long j11 = jArr[i5];
                        if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                            int i11 = 8 - ((~(i5 - length)) >>> 31);
                            for (int i12 = 0; i12 < i11; i12++) {
                                if ((255 & j11) < 128) {
                                    r11.f74515q--;
                                    ((b) objArr[(i5 << 3) + i12]).b();
                                }
                                j11 >>= 8;
                            }
                            if (i11 != 8) {
                                break;
                            } else if (i5 == length) {
                                break;
                            } else {
                                i5++;
                            }
                        }
                    }
                }
                p0Var.e();
            }
            this.f74501a.d();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0094  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(k2.f fVar) {
        r rVar = this.f74516r;
        rVar.f52081c = (b) rVar.f52080b;
        p0 p0Var = (p0) rVar.f52082d;
        if (p0Var != null && p0Var.c()) {
            p0 p0Var2 = (p0) rVar.f52083e;
            if (p0Var2 == null) {
                p0 p0Var3 = b1.f97745a;
                p0Var2 = new p0();
                rVar.f52083e = p0Var2;
            }
            p0Var2.k(p0Var);
            p0Var.e();
        }
        rVar.f52079a = true;
        this.f74504d.invoke(fVar);
        rVar.f52079a = false;
        b bVar = (b) rVar.f52081c;
        if (bVar != null) {
            bVar.f74515q--;
            bVar.b();
        }
        p0 p0Var4 = (p0) rVar.f52083e;
        if (p0Var4 == null || !p0Var4.c()) {
            return;
        }
        Object[] objArr = p0Var4.f97741b;
        long[] jArr = p0Var4.f97740a;
        int length = jArr.length - 2;
        if (length >= 0) {
            int i5 = 0;
            while (true) {
                long j11 = jArr[i5];
                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i11 = 8 - ((~(i5 - length)) >>> 31);
                    for (int i12 = 0; i12 < i11; i12++) {
                        if ((255 & j11) < 128) {
                            r10.f74515q--;
                            ((b) objArr[(i5 << 3) + i12]).b();
                        }
                        j11 >>= 8;
                    }
                    if (i11 != 8) {
                        break;
                    } else if (i5 == length) {
                        break;
                    } else {
                        i5++;
                    }
                }
            }
        }
        p0Var4.e();
    }

    public final r0 d() {
        r0 j0Var;
        r0 r0Var = this.f74511k;
        n0 n0Var = this.f74512l;
        if (r0Var != null) {
            return r0Var;
        }
        if (n0Var != null) {
            i0 i0Var = new i0(n0Var);
            this.f74511k = i0Var;
            return i0Var;
        }
        long jT = w20.e.t(this.f74519u);
        long j11 = this.f74508h;
        long j12 = this.f74509i;
        if (j12 != 9205357640488583168L) {
            jT = j12;
        }
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j11 & 4294967295L));
        float fIntBitsToFloat3 = Float.intBitsToFloat((int) (jT >> 32)) + fIntBitsToFloat;
        float fIntBitsToFloat4 = Float.intBitsToFloat((int) (jT & 4294967295L)) + fIntBitsToFloat2;
        if (this.f74510j > 0.0f) {
            j0Var = new k0(z2.n(fIntBitsToFloat, fIntBitsToFloat2, fIntBitsToFloat3, fIntBitsToFloat4, (Float.floatToRawIntBits(r0) << 32) | (4294967295L & Float.floatToRawIntBits(r0))));
        } else {
            j0Var = new j0(new h2.c(fIntBitsToFloat, fIntBitsToFloat2, fIntBitsToFloat3, fIntBitsToFloat4));
        }
        this.f74511k = j0Var;
        return j0Var;
    }

    public final void e(y3.c cVar, n nVar, long j11, Function1 function1) {
        boolean zA = y3.m.a(this.f74519u, j11);
        d dVar = this.f74501a;
        if (!zA) {
            this.f74519u = j11;
            long j12 = this.f74518t;
            dVar.g((int) (j12 >> 32), (int) (j12 & 4294967295L), j11);
            if (this.f74509i == 9205357640488583168L) {
                this.f74507g = true;
                a();
            }
        }
        this.f74502b = cVar;
        this.f74503c = nVar;
        this.f74504d = function1;
        dVar.p(cVar, nVar, this, this.f74505e);
    }

    public final void f(float f11) {
        d dVar = this.f74501a;
        if (dVar.a() == f11) {
            return;
        }
        dVar.E(f11);
    }

    public final void g(float f11, long j11, long j12) {
        if (h2.b.b(this.f74508h, j11) && h2.e.a(this.f74509i, j12) && this.f74510j == f11 && this.f74512l == null) {
            return;
        }
        this.f74511k = null;
        this.f74512l = null;
        this.f74507g = true;
        this.n = false;
        this.f74508h = j11;
        this.f74509i = j12;
        this.f74510j = f11;
        a();
    }
}
