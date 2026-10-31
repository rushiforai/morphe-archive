package e4;

import b.c0;
import com.google.firebase.crashlytics.internal.common.IdManager;
import java.util.ArrayList;
import mg.l;

/* loaded from: classes2.dex */
public class b {

    /* renamed from: d, reason: collision with root package name */
    public final a f52132d;

    /* renamed from: a, reason: collision with root package name */
    public f f52129a = null;

    /* renamed from: b, reason: collision with root package name */
    public float f52130b = 0.0f;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f52131c = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    public boolean f52133e = false;

    public b(l lVar) {
        this.f52132d = new a(this, lVar);
    }

    public final void a(c cVar, int i5) {
        this.f52132d.g(cVar.j(i5), 1.0f);
        this.f52132d.g(cVar.j(i5), -1.0f);
    }

    public final void b(f fVar, f fVar2, f fVar3, int i5) {
        boolean z11 = false;
        if (i5 != 0) {
            if (i5 < 0) {
                i5 *= -1;
                z11 = true;
            }
            this.f52130b = i5;
        }
        if (z11) {
            this.f52132d.g(fVar, 1.0f);
            this.f52132d.g(fVar2, -1.0f);
            this.f52132d.g(fVar3, -1.0f);
        } else {
            this.f52132d.g(fVar, -1.0f);
            this.f52132d.g(fVar2, 1.0f);
            this.f52132d.g(fVar3, 1.0f);
        }
    }

    public final void c(f fVar, f fVar2, f fVar3, int i5) {
        boolean z11 = false;
        if (i5 != 0) {
            if (i5 < 0) {
                i5 *= -1;
                z11 = true;
            }
            this.f52130b = i5;
        }
        if (z11) {
            this.f52132d.g(fVar, 1.0f);
            this.f52132d.g(fVar2, -1.0f);
            this.f52132d.g(fVar3, 1.0f);
        } else {
            this.f52132d.g(fVar, -1.0f);
            this.f52132d.g(fVar2, 1.0f);
            this.f52132d.g(fVar3, -1.0f);
        }
    }

    public f d(boolean[] zArr) {
        return f(zArr, null);
    }

    public boolean e() {
        return this.f52129a == null && this.f52130b == 0.0f && this.f52132d.d() == 0;
    }

    public final f f(boolean[] zArr, f fVar) {
        int i5;
        int iD = this.f52132d.d();
        f fVar2 = null;
        float f11 = 0.0f;
        for (int i11 = 0; i11 < iD; i11++) {
            float f12 = this.f52132d.f(i11);
            if (f12 < 0.0f) {
                f fVarE = this.f52132d.e(i11);
                if ((zArr == null || !zArr[fVarE.f52156b]) && fVarE != fVar && (((i5 = fVarE.f52166l) == 3 || i5 == 4) && f12 < f11)) {
                    f11 = f12;
                    fVar2 = fVarE;
                }
            }
        }
        return fVar2;
    }

    public final void g(f fVar) {
        f fVar2 = this.f52129a;
        if (fVar2 != null) {
            this.f52132d.g(fVar2, -1.0f);
            this.f52129a.f52157c = -1;
            this.f52129a = null;
        }
        float fH = this.f52132d.h(fVar, true) * (-1.0f);
        this.f52129a = fVar;
        if (fH == 1.0f) {
            return;
        }
        this.f52130b /= fH;
        a aVar = this.f52132d;
        int i5 = aVar.f52126h;
        for (int i11 = 0; i5 != -1 && i11 < aVar.f52119a; i11++) {
            float[] fArr = aVar.f52125g;
            fArr[i5] = fArr[i5] / fH;
            i5 = aVar.f52124f[i5];
        }
    }

    public final void h(c cVar, f fVar, boolean z11) {
        if (fVar.f52160f) {
            float fC = this.f52132d.c(fVar);
            this.f52130b = (fVar.f52159e * fC) + this.f52130b;
            this.f52132d.h(fVar, z11);
            if (z11) {
                fVar.b(this);
            }
            if (this.f52132d.d() == 0) {
                this.f52133e = true;
                cVar.f52136b = true;
            }
        }
    }

    public void i(c cVar, b bVar, boolean z11) {
        a aVar = this.f52132d;
        aVar.getClass();
        float fC = aVar.c(bVar.f52129a);
        aVar.h(bVar.f52129a, z11);
        a aVar2 = bVar.f52132d;
        int iD = aVar2.d();
        for (int i5 = 0; i5 < iD; i5++) {
            f fVarE = aVar2.e(i5);
            aVar.a(fVarE, aVar2.c(fVarE) * fC, z11);
        }
        this.f52130b = (bVar.f52130b * fC) + this.f52130b;
        if (z11) {
            bVar.f52129a.b(this);
        }
        if (this.f52129a == null || this.f52132d.d() != 0) {
            return;
        }
        this.f52133e = true;
        cVar.f52136b = true;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0081  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public String toString() {
        boolean z11;
        String strE = c0.E(this.f52129a == null ? "0" : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b + this.f52129a, " = ");
        if (this.f52130b != 0.0f) {
            StringBuilder sbQ = a2.c.q(strE);
            sbQ.append(this.f52130b);
            strE = sbQ.toString();
            z11 = true;
        } else {
            z11 = false;
        }
        int iD = this.f52132d.d();
        for (int i5 = 0; i5 < iD; i5++) {
            f fVarE = this.f52132d.e(i5);
            if (fVarE != null) {
                float f11 = this.f52132d.f(i5);
                if (f11 != 0.0f) {
                    String string = fVarE.toString();
                    if (!z11) {
                        if (f11 < 0.0f) {
                            strE = c0.E(strE, "- ");
                            f11 *= -1.0f;
                        }
                        strE = f11 == 1.0f ? c0.E(strE, string) : strE + f11 + " " + string;
                        z11 = true;
                    } else if (f11 > 0.0f) {
                        strE = c0.E(strE, " + ");
                        if (f11 == 1.0f) {
                        }
                        z11 = true;
                    } else {
                        strE = c0.E(strE, " - ");
                        f11 *= -1.0f;
                        if (f11 == 1.0f) {
                        }
                        z11 = true;
                    }
                }
            }
        }
        return !z11 ? c0.E(strE, IdManager.DEFAULT_VERSION_NAME) : strE;
    }
}
