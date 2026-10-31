package o2;

import android.graphics.Path;
import java.util.List;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class j extends f0 {

    /* renamed from: b, reason: collision with root package name */
    public i2.p f79282b;

    /* renamed from: f, reason: collision with root package name */
    public float f79286f;

    /* renamed from: g, reason: collision with root package name */
    public i2.p f79287g;

    /* renamed from: k, reason: collision with root package name */
    public float f79291k;

    /* renamed from: m, reason: collision with root package name */
    public float f79293m;

    /* renamed from: p, reason: collision with root package name */
    public boolean f79294p;

    /* renamed from: q, reason: collision with root package name */
    public k2.k f79295q;

    /* renamed from: r, reason: collision with root package name */
    public final i2.h f79296r;

    /* renamed from: s, reason: collision with root package name */
    public i2.h f79297s;

    /* renamed from: t, reason: collision with root package name */
    public final Object f79298t;

    /* renamed from: c, reason: collision with root package name */
    public float f79283c = 1.0f;

    /* renamed from: d, reason: collision with root package name */
    public List f79284d = k0.f79316a;

    /* renamed from: e, reason: collision with root package name */
    public float f79285e = 1.0f;

    /* renamed from: h, reason: collision with root package name */
    public int f79288h = 0;

    /* renamed from: i, reason: collision with root package name */
    public int f79289i = 0;

    /* renamed from: j, reason: collision with root package name */
    public float f79290j = 4.0f;

    /* renamed from: l, reason: collision with root package name */
    public float f79292l = 1.0f;
    public boolean n = true;
    public boolean o = true;

    public j() {
        i2.h hVarA = i2.k.a();
        this.f79296r = hVarA;
        this.f79297s = hVarA;
        this.f79298t = LazyKt.b(LazyThreadSafetyMode.f71681c, i.f79278k);
    }

    @Override // o2.f0
    public final void a(k2.f fVar) {
        k2.f fVar2;
        k2.k kVar;
        if (this.n) {
            e0.b(this.f79284d, this.f79296r);
            e();
        } else if (this.f79294p) {
            e();
        }
        this.n = false;
        this.f79294p = false;
        i2.p pVar = this.f79282b;
        if (pVar != null) {
            fVar2 = fVar;
            k2.f.d(fVar2, this.f79297s, pVar, this.f79283c, null, 56);
        } else {
            fVar2 = fVar;
        }
        i2.p pVar2 = this.f79287g;
        if (pVar2 != null) {
            k2.k kVar2 = this.f79295q;
            if (this.o || kVar2 == null) {
                k2.k kVar3 = new k2.k(this.f79286f, this.f79290j, this.f79288h, this.f79289i, 16);
                this.f79295q = kVar3;
                this.o = false;
                kVar = kVar3;
            } else {
                kVar = kVar2;
            }
            k2.f.d(fVar2, this.f79297s, pVar2, this.f79285e, kVar, 48);
        }
    }

    /* JADX WARN: Type inference failed for: r0v10, types: [java.lang.Object, kotlin.Lazy] */
    public final void e() {
        float f11 = this.f79291k;
        i2.h hVar = this.f79296r;
        if (f11 == 0.0f && this.f79292l == 1.0f) {
            this.f79297s = hVar;
            return;
        }
        if (Intrinsics.b(this.f79297s, hVar)) {
            this.f79297s = i2.k.a();
        } else {
            int i5 = this.f79297s.f61117a.getFillType() == Path.FillType.EVEN_ODD ? 1 : 0;
            this.f79297s.f61117a.rewind();
            this.f79297s.f(i5);
        }
        ?? r02 = this.f79298t;
        ((i2.j) r02.getValue()).c(hVar);
        float fA = ((i2.j) r02.getValue()).a();
        float f12 = this.f79291k;
        float f13 = this.f79293m;
        float f14 = ((f12 + f13) % 1.0f) * fA;
        float f15 = ((this.f79292l + f13) % 1.0f) * fA;
        if (f14 <= f15) {
            ((i2.j) r02.getValue()).b(f14, f15, this.f79297s);
        } else {
            ((i2.j) r02.getValue()).b(f14, fA, this.f79297s);
            ((i2.j) r02.getValue()).b(0.0f, f15, this.f79297s);
        }
    }

    public final String toString() {
        return this.f79296r.toString();
    }
}
