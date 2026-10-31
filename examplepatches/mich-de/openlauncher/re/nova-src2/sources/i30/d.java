package i30;

import android.graphics.RectF;
import android.view.animation.DecelerateInterpolator;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public long f61260a = -2;

    /* renamed from: b, reason: collision with root package name */
    public int f61261b = 1250;

    /* renamed from: c, reason: collision with root package name */
    public DecelerateInterpolator f61262c = new DecelerateInterpolator(4.0f);

    /* renamed from: d, reason: collision with root package name */
    public int f61263d;

    /* renamed from: e, reason: collision with root package name */
    public int f61264e;

    /* renamed from: f, reason: collision with root package name */
    public float f61265f;

    /* renamed from: g, reason: collision with root package name */
    public int f61266g;

    /* renamed from: h, reason: collision with root package name */
    public int f61267h;

    /* renamed from: i, reason: collision with root package name */
    public float f61268i;

    /* renamed from: j, reason: collision with root package name */
    public int f61269j;

    /* renamed from: k, reason: collision with root package name */
    public int f61270k;

    /* renamed from: l, reason: collision with root package name */
    public float f61271l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ f f61272m;

    public d(f fVar) {
        this.f61272m = fVar;
    }

    public final void a(RectF rectF) {
        int iRound;
        int iRound2;
        f fVar = this.f61272m;
        float fG = fVar.g();
        float fE = fVar.e();
        int i5 = fVar.f61286m;
        if (i5 != -1) {
            float fB = f30.f.b(Math.min(fG / (rectF.width() * fVar.f61286m), fE / (rectF.height() * fVar.n)) * 0.6f, Math.min(fG / i5, fE / fVar.n), 2.0f);
            if (Math.round(fVar.f61286m * fB) > fG) {
                iRound = Math.round((fG * 0.5f) / fB);
                int iRound3 = Math.round(((rectF.left + rectF.right) * fVar.f61286m) / 2.0f);
                int i11 = fVar.f61286m - iRound;
                if (iRound3 > i11) {
                    iRound = i11;
                } else if (iRound3 >= iRound) {
                    iRound = iRound3;
                }
            } else {
                iRound = fVar.f61286m / 2;
            }
            if (Math.round(fVar.n * fB) > fE) {
                iRound2 = Math.round((fE * 0.5f) / fB);
                int iRound4 = Math.round(((rectF.top + rectF.bottom) * fVar.n) / 2.0f);
                int i12 = fVar.n - iRound2;
                if (iRound4 > i12) {
                    iRound2 = i12;
                } else if (iRound4 >= iRound2) {
                    iRound2 = iRound4;
                }
            } else {
                iRound2 = fVar.n / 2;
            }
            this.f61269j = iRound;
            this.f61270k = iRound2;
            this.f61271l = fB;
        }
    }

    public final void b() {
        f fVar = this.f61272m;
        this.f61263d = fVar.f61286m / 2;
        this.f61264e = fVar.n / 2;
        this.f61265f = Math.min(2.0f, Math.min(fVar.g() / fVar.f61286m, fVar.e() / fVar.n));
    }

    public final void c(RectF rectF, RectF rectF2) {
        f fVar = this.f61272m;
        float fG = fVar.g() * 0.5f;
        float fE = fVar.e() * 0.5f;
        int i5 = this.f61263d;
        int i11 = this.f61264e;
        float f11 = this.f61265f;
        float f12 = rectF.left;
        float f13 = fVar.f61286m;
        float f14 = i5;
        float fA = a2.c.a(f12 * f13, f14, f11, fG);
        float f15 = rectF.top;
        float f16 = fVar.n;
        float f17 = i11;
        rectF2.set(fA, a2.c.a(f15 * f16, f17, f11, fE), (((rectF.right * f13) - f14) * f11) + fG, (((rectF.bottom * f16) - f17) * f11) + fE);
    }
}
