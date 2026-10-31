package ib;

import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.LongSparseArray;
import com.android.launcher3.CropView;
import gu.j;

/* loaded from: classes2.dex */
public final class c {
    public static final z4.c E = new z4.c(64);
    public boolean A;
    public int B;
    public int C;
    public final CropView D;

    /* renamed from: a, reason: collision with root package name */
    public int f61474a;

    /* renamed from: b, reason: collision with root package name */
    public hb.d f61475b;

    /* renamed from: c, reason: collision with root package name */
    public k9.b f61476c;

    /* renamed from: d, reason: collision with root package name */
    public int f61477d;

    /* renamed from: f, reason: collision with root package name */
    public int f61479f;

    /* renamed from: g, reason: collision with root package name */
    public int f61480g;

    /* renamed from: h, reason: collision with root package name */
    public int f61481h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f61482i;
    public final j n;
    public final j o;

    /* renamed from: p, reason: collision with root package name */
    public final j f61487p;

    /* renamed from: s, reason: collision with root package name */
    public int f61490s;

    /* renamed from: t, reason: collision with root package name */
    public int f61491t;

    /* renamed from: u, reason: collision with root package name */
    public float f61492u;

    /* renamed from: v, reason: collision with root package name */
    public int f61493v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f61494w;

    /* renamed from: z, reason: collision with root package name */
    public final b f61497z;

    /* renamed from: e, reason: collision with root package name */
    public int f61478e = 0;

    /* renamed from: j, reason: collision with root package name */
    public final RectF f61483j = new RectF();

    /* renamed from: k, reason: collision with root package name */
    public final RectF f61484k = new RectF();

    /* renamed from: l, reason: collision with root package name */
    public final LongSparseArray f61485l = new LongSparseArray();

    /* renamed from: m, reason: collision with root package name */
    public final Object f61486m = new Object();

    /* renamed from: q, reason: collision with root package name */
    public int f61488q = -1;

    /* renamed from: r, reason: collision with root package name */
    public int f61489r = -1;

    /* renamed from: x, reason: collision with root package name */
    public final Rect f61495x = new Rect();

    /* renamed from: y, reason: collision with root package name */
    public final Rect[] f61496y = {new Rect(), new Rect()};

    public c(CropView cropView) {
        int i5 = 15;
        char c11 = 0;
        this.n = new j(c11, i5);
        this.o = new j(c11, i5);
        this.f61487p = new j(c11, i5);
        this.D = cropView;
        b bVar = new b(this);
        this.f61497z = bVar;
        bVar.start();
    }

    public final void a(a aVar) {
        synchronized (this.f61486m) {
            try {
                if (aVar.f61470t != 2) {
                    return;
                }
                aVar.f61470t = 4;
                c cVar = aVar.f61471u;
                try {
                    Bitmap bitmap = (Bitmap) E.a();
                    if (bitmap != null && bitmap.getWidth() != cVar.f61474a) {
                        bitmap = null;
                    }
                    aVar.f61469s = cVar.f61475b.a(aVar.f61467q, aVar.o, aVar.f61466p, bitmap);
                } catch (Throwable th2) {
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("TiledImageRenderer");
                    bVar.p(th2, "fail to decode tile", new Object[0]);
                }
                boolean z11 = aVar.f61469s != null;
                synchronized (this.f61486m) {
                    try {
                        if (aVar.f61470t != 32) {
                            aVar.f61470t = z11 ? 8 : 16;
                            if (z11) {
                                this.o.l(aVar);
                                this.D.postInvalidate();
                                return;
                            }
                            return;
                        }
                        aVar.f61470t = 64;
                        Bitmap bitmap2 = aVar.f61469s;
                        if (bitmap2 != null) {
                            E.n(bitmap2);
                            aVar.f61469s = null;
                        }
                        this.n.l(aVar);
                    } finally {
                    }
                }
            } finally {
            }
        }
    }

    public final void b(k9.c cVar, int i5, int i11, int i12, float f11, float f12, float f13) {
        a aVar;
        RectF rectF = this.f61483j;
        RectF rectF2 = this.f61484k;
        rectF2.set(f11, f12, f11 + f13, f13 + f12);
        float f14 = this.f61474a;
        rectF.set(0.0f, 0.0f, f14, f14);
        a aVar2 = (a) this.f61485l.get((((i5 << 16) | i11) << 16) | i12);
        if (aVar2 != null) {
            if (!aVar2.g()) {
                if (aVar2.f61470t == 8) {
                    int i13 = this.f61481h;
                    if (i13 > 0) {
                        this.f61481h = i13 - 1;
                        aVar2.j(cVar);
                    } else {
                        this.f61482i = false;
                    }
                } else if (aVar2.f61470t != 16) {
                    this.f61482i = false;
                    d(aVar2);
                }
            }
            while (!aVar2.g()) {
                int i14 = aVar2.f61467q + 1;
                c cVar2 = aVar2.f61471u;
                if (i14 == cVar2.f61477d) {
                    aVar = null;
                } else {
                    int i15 = cVar2.f61474a << i14;
                    aVar = (a) cVar2.f61485l.get((((((aVar2.o / i15) * i15) << 16) | ((aVar2.f61466p / i15) * i15)) << 16) | i14);
                }
                if (aVar != null) {
                    if (aVar2.o == aVar.o) {
                        rectF.left /= 2.0f;
                        rectF.right /= 2.0f;
                    } else {
                        float f15 = this.f61474a;
                        rectF.left = (rectF.left + f15) / 2.0f;
                        rectF.right = (f15 + rectF.right) / 2.0f;
                    }
                    if (aVar2.f61466p == aVar.f61466p) {
                        rectF.top /= 2.0f;
                        rectF.bottom /= 2.0f;
                    } else {
                        float f16 = this.f61474a;
                        rectF.top = (rectF.top + f16) / 2.0f;
                        rectF.bottom = (f16 + rectF.bottom) / 2.0f;
                    }
                    aVar2 = aVar;
                }
            }
            ((k9.e) cVar).d(rectF, rectF2, aVar2);
            return;
        }
        k9.b bVar = this.f61476c;
        if (bVar != null) {
            int i16 = this.f61474a << i12;
            if (bVar.f71210c == -1) {
                bVar.e();
            }
            float f17 = bVar.f71210c / this.f61488q;
            k9.b bVar2 = this.f61476c;
            if (bVar2.f71210c == -1) {
                bVar2.e();
            }
            float f18 = bVar2.f71211d / this.f61489r;
            rectF.set(i5 * f17, i11 * f18, (i5 + i16) * f17, (i11 + i16) * f18);
            ((k9.e) cVar).d(rectF, rectF2, this.f61476c);
        }
    }

    public final void c(Rect rect, int i5, int i11, int i12, float f11, int i13) {
        double radians = Math.toRadians(-i13);
        double d5 = this.B;
        double d11 = this.C;
        double dCos = Math.cos(radians);
        double dSin = Math.sin(radians);
        double d12 = dCos * d5;
        double d13 = dSin * d11;
        int iCeil = (int) Math.ceil(Math.max(Math.abs(d12 - d13), Math.abs(d12 + d13)));
        double d14 = dSin * d5;
        double d15 = dCos * d11;
        int iCeil2 = (int) Math.ceil(Math.max(Math.abs(d14 + d15), Math.abs(d14 - d15)));
        float f12 = iCeil;
        float f13 = 2.0f * f11;
        int iFloor = (int) Math.floor(i5 - (f12 / f13));
        float f14 = iCeil2;
        int iFloor2 = (int) Math.floor(i11 - (f14 / f13));
        int iCeil3 = (int) Math.ceil((f12 / f11) + iFloor);
        int iCeil4 = (int) Math.ceil((f14 / f11) + iFloor2);
        int i14 = this.f61474a << i12;
        rect.set(Math.max(0, (iFloor / i14) * i14), Math.max(0, (iFloor2 / i14) * i14), Math.min(this.f61488q, iCeil3), Math.min(this.f61489r, iCeil4));
    }

    public final void d(a aVar) {
        synchronized (this.f61486m) {
            try {
                if (aVar.f61470t == 1) {
                    aVar.f61470t = 2;
                    if (this.f61487p.l(aVar)) {
                        this.f61486m.notifyAll();
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void e(a aVar) {
        synchronized (this.f61486m) {
            try {
                if (aVar.f61470t == 4) {
                    aVar.f61470t = 32;
                    return;
                }
                aVar.f61470t = 64;
                Bitmap bitmap = aVar.f61469s;
                if (bitmap != null) {
                    E.n(bitmap);
                    aVar.f61469s = null;
                }
                this.n.l(aVar);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void f(hb.d dVar, int i5) {
        if (this.f61475b != dVar) {
            this.f61475b = dVar;
            synchronized (this.f61486m) {
                try {
                    this.f61487p.f57836b = null;
                    this.o.f57836b = null;
                    int size = this.f61485l.size();
                    for (int i11 = 0; i11 < size; i11++) {
                        e((a) this.f61485l.valueAt(i11));
                    }
                    this.f61485l.clear();
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            hb.d dVar2 = this.f61475b;
            if (dVar2 == null) {
                this.f61488q = 0;
                this.f61489r = 0;
                this.f61477d = 0;
                this.f61476c = null;
            } else {
                int i12 = dVar2.f59601b;
                this.f61488q = i12;
                int i13 = dVar2.f59602c;
                this.f61489r = i13;
                k9.b bVar = dVar2.f59604e;
                this.f61476c = bVar;
                this.f61474a = dVar2.f59603d;
                if (bVar != null) {
                    float f11 = i12;
                    if (bVar.f71210c == -1) {
                        bVar.e();
                    }
                    float f12 = f11 / bVar.f71210c;
                    long[] jArr = i9.a.f61459a;
                    int i14 = 0;
                    while (i14 < 31 && (1 << i14) < f12) {
                        i14++;
                    }
                    this.f61477d = Math.max(0, i14);
                } else {
                    int iMax = Math.max(i12, i13);
                    int i15 = this.f61474a;
                    int i16 = 1;
                    while (i15 < iMax) {
                        i15 <<= 1;
                        i16++;
                    }
                    this.f61477d = i16;
                }
            }
            this.f61494w = true;
        }
        if (this.f61493v != i5) {
            this.f61493v = i5;
            this.f61494w = true;
        }
    }
}
