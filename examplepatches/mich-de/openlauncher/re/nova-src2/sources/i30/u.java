package i30;

import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.RectF;
import android.opengl.Matrix;
import com.teslacoilsw.launcher.wallpaper.app.CropImage;

/* loaded from: classes4.dex */
public final class u extends n {
    public static final h30.a H = new h30.a(256, 256, 128);
    public boolean D;
    public j30.g E;
    public final fl.l F;
    public boolean G;

    /* renamed from: g, reason: collision with root package name */
    public q f61340g;

    /* renamed from: h, reason: collision with root package name */
    public b f61341h;

    /* renamed from: i, reason: collision with root package name */
    public int f61342i;

    /* renamed from: k, reason: collision with root package name */
    public int f61344k;

    /* renamed from: l, reason: collision with root package name */
    public int f61345l;

    /* renamed from: m, reason: collision with root package name */
    public int f61346m;
    public boolean n;

    /* renamed from: w, reason: collision with root package name */
    public int f61354w;

    /* renamed from: x, reason: collision with root package name */
    public int f61355x;

    /* renamed from: y, reason: collision with root package name */
    public float f61356y;

    /* renamed from: z, reason: collision with root package name */
    public int f61357z;

    /* renamed from: j, reason: collision with root package name */
    public int f61343j = 0;
    public final RectF o = new RectF();

    /* renamed from: p, reason: collision with root package name */
    public final RectF f61347p = new RectF();

    /* renamed from: q, reason: collision with root package name */
    public final z.v f61348q = new z.v((Object) null);

    /* renamed from: r, reason: collision with root package name */
    public final s f61349r = new s();

    /* renamed from: s, reason: collision with root package name */
    public final s f61350s = new s();

    /* renamed from: t, reason: collision with root package name */
    public final s f61351t = new s();

    /* renamed from: u, reason: collision with root package name */
    public int f61352u = -1;

    /* renamed from: v, reason: collision with root package name */
    public int f61353v = -1;
    public final Rect A = new Rect();
    public final Rect[] B = {new Rect(), new Rect()};
    public final t C = new t(this);

    public u(CropImage cropImage) {
        fl.l lVarK0 = tm.o.h0(cropImage).k0();
        this.F = lVarK0;
        this.E = lVarK0.C(new c10.a(this), null);
    }

    @Override // i30.n
    public final void l(int i5, int i11, boolean z11) {
        if (z11) {
            t(this.f61354w, this.f61356y, this.f61355x, this.f61357z);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x00e3  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x010b  */
    @Override // i30.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void o(i iVar) throws Throwable {
        u uVar;
        u uVar2 = this;
        i iVar2 = iVar;
        uVar2.f61346m = 1;
        uVar2.n = true;
        int i5 = uVar2.f61343j;
        int i11 = uVar2.f61357z;
        int i12 = i11 != 0 ? 2 : 0;
        if (i12 != 0) {
            iVar2.h(i12);
            if (i11 != 0) {
                iVar2.k(uVar2.g() / 2, uVar2.e() / 2);
                float f11 = i11;
                float[] fArr = iVar2.f61300b;
                if (f11 != 0.0f) {
                    float[] fArr2 = iVar2.f61310l;
                    Matrix.setRotateM(fArr2, 0, f11, 0.0f, 0.0f, 1.0f);
                    Matrix.multiplyMM(fArr2, 16, fArr, 0, fArr2, 0);
                    System.arraycopy(fArr2, 16, fArr, 0, 16);
                }
                iVar2.k(-r4, -r6);
            }
        }
        try {
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            if (i5 != uVar2.f61342i) {
                b bVar = uVar2.f61341h;
                if (!(bVar != null && bVar.b())) {
                    int i13 = 254 << i5;
                    float f12 = i13 * uVar2.f61356y;
                    Rect rect = uVar2.A;
                    int i14 = rect.top;
                    int i15 = 0;
                    while (i14 < rect.bottom) {
                        float f13 = (i15 * f12) + uVar2.f61345l;
                        int i16 = rect.left;
                        int i17 = 0;
                        while (i16 < rect.right) {
                            uVar2.r(iVar2, i16, i14, i5, uVar2.f61344k + (i17 * f12), f13, f12);
                            i16 += i13;
                            i17++;
                            iVar2 = iVar;
                            uVar2 = uVar2;
                        }
                        i14 += i13;
                        i15++;
                        iVar2 = iVar;
                    }
                    uVar = uVar2;
                }
                if (i12 != 0) {
                    iVar.g();
                }
                if (uVar.n) {
                    uVar.h();
                    return;
                }
                if (uVar.G) {
                    return;
                }
                uVar.G = true;
                z.v vVar = uVar.f61348q;
                int iG = vVar.g();
                for (int i18 = 0; i18 < iG; i18++) {
                    r rVar = (r) vVar.h(i18);
                    if (!rVar.j()) {
                        uVar.u(rVar);
                    }
                }
                return;
            }
            b bVar2 = uVar.f61341h;
            if (bVar2 != null) {
                bVar2.a(iVar, uVar.f61344k, uVar.f61345l, Math.round(uVar.f61352u * uVar.f61356y), Math.round(uVar.f61353v * uVar.f61356y));
                b bVar3 = uVar.f61341h;
                if (bVar3 != null && bVar3.b()) {
                    uVar.h();
                }
            }
            if (i12 != 0) {
            }
            if (uVar.n) {
            }
        } catch (Throwable th3) {
            th = th3;
            if (i12 != 0) {
                iVar.g();
            }
            throw th;
        }
        uVar = uVar2;
    }

    public final void r(i iVar, int i5, int i11, int i12, float f11, float f12, float f13) {
        RectF rectF;
        float f14;
        RectF rectF2;
        r rVar;
        RectF rectF3;
        RectF rectF4 = this.o;
        RectF rectF5 = this.f61347p;
        rectF5.set(f11, f12, f11 + f13, f12 + f13);
        float f15 = 254.0f;
        rectF4.set(0.0f, 0.0f, 254.0f, 254.0f);
        r rVar2 = (r) this.f61348q.c((((i5 << 16) | i11) << 16) | i12);
        if (rVar2 != null) {
            if (!rVar2.j()) {
                if (rVar2.f61335v == 8) {
                    int i13 = this.f61346m;
                    if (i13 > 0) {
                        this.f61346m = i13 - 1;
                        rVar2.m(iVar);
                    } else {
                        this.n = false;
                    }
                } else if (rVar2.f61335v != 16) {
                    this.n = false;
                    u(rVar2);
                }
            }
            while (!rVar2.j()) {
                int i14 = rVar2.f61332s + 1;
                u uVar = rVar2.f61336w;
                if (i14 == uVar.f61342i) {
                    rVar = null;
                    f14 = f15;
                    rectF2 = rectF4;
                } else {
                    int i15 = 254 << i14;
                    f14 = f15;
                    rectF2 = rectF4;
                    rVar = (r) uVar.f61348q.c(((((rVar2.f61331r / i15) * i15) | (((rVar2.f61330q / i15) * i15) << 16)) << 16) | i14);
                }
                if (rVar == null) {
                    rectF = rectF2;
                } else {
                    if (rVar2.f61330q == rVar.f61330q) {
                        rectF3 = rectF2;
                        rectF3.left /= 2.0f;
                        rectF3.right /= 2.0f;
                    } else {
                        rectF3 = rectF2;
                        rectF3.left = (rectF3.left + f14) / 2.0f;
                        rectF3.right = (rectF3.right + f14) / 2.0f;
                    }
                    if (rVar2.f61331r == rVar.f61331r) {
                        rectF3.top /= 2.0f;
                        rectF3.bottom /= 2.0f;
                    } else {
                        rectF3.top = (rectF3.top + f14) / 2.0f;
                        rectF3.bottom = (rectF3.bottom + f14) / 2.0f;
                    }
                    rectF4 = rectF3;
                    rVar2 = rVar;
                    f15 = f14;
                }
            }
            rectF4.offset(1.0f, 1.0f);
            iVar.e(rVar2, rectF4, rectF5);
            return;
        }
        rectF = rectF4;
        if (this.f61341h != null) {
            int i16 = 254 << i12;
            float f16 = r5.f61254a / this.f61352u;
            float f17 = r5.f61255b / this.f61353v;
            rectF.set(i5 * f16, i11 * f17, (i5 + i16) * f16, (i11 + i16) * f17);
            b bVar = this.f61341h;
            if (bVar.f61256c == null) {
                iVar.f(rectF5.left, rectF5.top, rectF5.width(), rectF5.height(), -14540254);
                return;
            }
            if (bVar.f61257d == null) {
                bVar.f61257d = new c(bVar.f61256c);
            }
            iVar.e(bVar.f61257d, rectF, rectF5);
        }
    }

    public final void s(Rect rect, int i5, int i11, int i12, float f11, int i13) {
        double radians = Math.toRadians(-i13);
        double dG = g();
        double dE = e();
        double dCos = Math.cos(radians);
        double dSin = Math.sin(radians);
        double d5 = dCos * dG;
        double d11 = dSin * dE;
        int iCeil = (int) Math.ceil(Math.max(Math.abs(d5 - d11), Math.abs(d5 + d11)));
        double d12 = dSin * dG;
        double d13 = dCos * dE;
        int iCeil2 = (int) Math.ceil(Math.max(Math.abs(d12 + d13), Math.abs(d12 - d13)));
        float f12 = iCeil;
        float f13 = 2.0f * f11;
        float f14 = iCeil2;
        int i14 = 254 << i12;
        rect.set(Math.max(0, (((int) Math.floor(i5 - (f12 / f13))) / i14) * i14), Math.max(0, (((int) Math.floor(i11 - (f14 / f13))) / i14) * i14), Math.min(this.f61352u, (int) Math.ceil((f12 / f11) + r1)), Math.min(this.f61353v, (int) Math.ceil((f14 / f11) + r3)));
    }

    public final void t(int i5, float f11, int i11, int i12) {
        int i13;
        int i14;
        int i15;
        r rVar;
        boolean z11;
        int iG = g();
        int iE = e();
        float f12 = 1.0f / f11;
        long[] jArr = f30.f.f54304a;
        boolean z12 = false;
        int i16 = 0;
        while (i16 < 31 && (1 << i16) <= f12) {
            i16++;
        }
        int i17 = i16 - 1;
        int i18 = this.f61342i;
        int i19 = i17 > i18 ? i18 : i17 < 0 ? 0 : i17;
        this.f61343j = i19;
        int i21 = 2;
        if (i19 != i18) {
            i13 = i5;
            i14 = i11;
            s(this.A, i13, i14, i19, f11, i12);
            this.f61344k = Math.round(((r2.left - i13) * f11) + (iG / 2.0f));
            this.f61345l = Math.round(((r2.top - i14) * f11) + (iE / 2.0f));
            i15 = this.f61343j;
            if ((1 << i15) * f11 > 0.75f) {
                i15--;
            }
        } else {
            i13 = i5;
            i14 = i11;
            this.f61344k = Math.round((iG / 2.0f) - (i13 * f11));
            this.f61345l = Math.round((iE / 2.0f) - (i14 * f11));
            i15 = i19 - 2;
        }
        int iMax = Math.max(0, Math.min(i15, this.f61342i - 2));
        int iMin = Math.min(iMax + 2, this.f61342i);
        Rect[] rectArr = this.B;
        for (int i22 = iMax; i22 < iMin; i22++) {
            s(rectArr[i22 - iMax], i13, i14, i22, 1.0f / (1 << r14), i12);
            i13 = i5;
            i14 = i11;
        }
        if (i12 % 90 != 0) {
            return;
        }
        synchronized (this) {
            try {
                this.f61351t.f61337a = null;
                this.f61350s.f61337a = null;
                this.G = false;
                int iG2 = this.f61348q.g();
                int i23 = 0;
                while (i23 < iG2) {
                    r rVar2 = (r) this.f61348q.h(i23);
                    int i24 = rVar2.f61332s;
                    if (i24 < iMax || i24 >= iMin || !rectArr[i24 - iMax].contains(rVar2.f61330q, rVar2.f61331r)) {
                        z.v vVar = this.f61348q;
                        Object[] objArr = vVar.f97844c;
                        Object obj = objArr[i23];
                        Object obj2 = z.w.f97848a;
                        if (obj != obj2) {
                            objArr[i23] = obj2;
                            vVar.f97842a = true;
                        }
                        i23--;
                        iG2--;
                        v(rVar2);
                    }
                    i23++;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        int i25 = iMax;
        while (i25 < iMin) {
            int i26 = 254 << i25;
            Rect rect = rectArr[i25 - iMax];
            int i27 = rect.top;
            int i28 = rect.bottom;
            while (i27 < i28) {
                int i29 = rect.left;
                int i31 = rect.right;
                while (i29 < i31) {
                    long j11 = ((i27 | (i29 << 16)) << 16) | i25;
                    r rVar3 = (r) this.f61348q.c(j11);
                    if (rVar3 != null) {
                        if (rVar3.f61335v == i21) {
                            rVar3.f61335v = 1;
                        }
                        z11 = false;
                    } else {
                        synchronized (this) {
                            s sVar = this.f61349r;
                            rVar = (r) sVar.f61337a;
                            if (rVar != null) {
                                sVar.f61337a = rVar.f61333t;
                            }
                            if (rVar != null) {
                                rVar.f61335v = 1;
                                rVar.f61330q = i29;
                                rVar.f61331r = i27;
                                rVar.f61332s = i25;
                                if (rVar.f61371l != null) {
                                    rVar.g();
                                }
                                z11 = false;
                                rVar.f61369j = false;
                                rVar.f61249c = -1;
                                rVar.f61250d = -1;
                            } else {
                                z11 = false;
                                rVar = new r(this, i29, i27, i25);
                            }
                        }
                        this.f61348q.e(j11, rVar);
                    }
                    i29 += i26;
                    z12 = z11;
                    i21 = 2;
                }
                i27 += i26;
                i21 = 2;
            }
            i25++;
            i21 = 2;
        }
        h();
    }

    public final synchronized void u(r rVar) {
        boolean z11 = true;
        if (rVar.f61335v == 1) {
            rVar.f61335v = 2;
            s sVar = this.f61351t;
            r rVar2 = (r) sVar.f61337a;
            if (rVar2 != null) {
                z11 = false;
            }
            rVar.f61333t = rVar2;
            sVar.f61337a = rVar;
            if (z11) {
                notifyAll();
            }
        }
    }

    public final synchronized void v(r rVar) {
        if (rVar.f61335v == 4) {
            rVar.f61335v = 32;
            return;
        }
        rVar.f61335v = 64;
        Bitmap bitmap = rVar.f61334u;
        if (bitmap != null) {
            H.b(bitmap);
            rVar.f61334u = null;
        }
        s sVar = this.f61349r;
        rVar.f61333t = (r) sVar.f61337a;
        sVar.f61337a = rVar;
    }

    public final boolean w(int i5, float f11, int i11, int i12) {
        if (this.f61354w == i5 && this.f61355x == i11 && this.f61356y == f11 && this.f61357z == i12) {
            return false;
        }
        this.f61354w = i5;
        this.f61355x = i11;
        this.f61356y = f11;
        this.f61357z = i12;
        t(i5, f11, i11, i12);
        h();
        return true;
    }
}
