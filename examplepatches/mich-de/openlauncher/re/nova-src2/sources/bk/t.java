package bk;

import android.graphics.Matrix;
import android.graphics.Path;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public float f18046a;

    /* renamed from: b, reason: collision with root package name */
    public float f18047b;

    /* renamed from: c, reason: collision with root package name */
    public float f18048c;

    /* renamed from: d, reason: collision with root package name */
    public float f18049d;

    /* renamed from: e, reason: collision with root package name */
    public float f18050e;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f18051f = new ArrayList();

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f18052g = new ArrayList();

    public t() {
        d(0.0f, 270.0f, 0.0f);
    }

    public final void a(float f11) {
        float f12 = this.f18049d;
        if (f12 == f11) {
            return;
        }
        float f13 = ((f11 - f12) + 360.0f) % 360.0f;
        if (f13 > 180.0f) {
            return;
        }
        float f14 = this.f18047b;
        float f15 = this.f18048c;
        p pVar = new p(f14, f15, f14, f15);
        pVar.f18039f = this.f18049d;
        pVar.f18040g = f13;
        this.f18052g.add(new n(pVar));
        this.f18049d = f11;
    }

    public final void b(Matrix matrix, Path path) {
        ArrayList arrayList = this.f18051f;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((r) arrayList.get(i5)).a(matrix, path);
        }
    }

    public final void c(float f11, float f12) {
        q qVar = new q();
        qVar.f18041b = f11;
        qVar.f18042c = f12;
        this.f18051f.add(qVar);
        o oVar = new o(qVar, this.f18047b, this.f18048c);
        float fB = oVar.b() + 270.0f;
        float fB2 = oVar.b() + 270.0f;
        a(fB);
        this.f18052g.add(oVar);
        this.f18049d = fB2;
        this.f18047b = f11;
        this.f18048c = f12;
    }

    public final void d(float f11, float f12, float f13) {
        this.f18046a = f11;
        this.f18047b = 0.0f;
        this.f18048c = f11;
        this.f18049d = f12;
        this.f18050e = (f12 + f13) % 360.0f;
        this.f18051f.clear();
        this.f18052g.clear();
    }
}
