package m0;

import g0.b2;
import g0.n1;
import java.util.List;
import kotlin.math.MathKt;

/* loaded from: classes2.dex */
public final class v implements n1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75503a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n1 f75504b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b2 f75505c;

    public /* synthetic */ v(n1 n1Var, b2 b2Var, int i5) {
        this.f75503a = i5;
        this.f75505c = b2Var;
        this.f75504b = n1Var;
    }

    @Override // g0.n1
    public final float a(float f11) {
        switch (this.f75503a) {
        }
        return this.f75504b.a(f11);
    }

    public final int b(int i5) {
        Object obj;
        switch (this.f75503a) {
            case 0:
                q qVarH = ((b0) this.f75505c).h();
                if (qVarH.f75476k.isEmpty()) {
                    return 0;
                }
                int iC = c();
                if (i5 > e() || iC > i5) {
                    return ((i5 - c()) * ic.b.X(qVarH)) - d();
                }
                List list = qVarH.f75476k;
                int size = list.size();
                int i11 = 0;
                while (true) {
                    if (i11 < size) {
                        obj = list.get(i11);
                        if (((r) ((h) obj)).f75481a != i5) {
                            i11++;
                        }
                    } else {
                        obj = null;
                    }
                }
                h hVar = (h) obj;
                if (hVar != null) {
                    return ((r) hVar).o;
                }
                return 0;
            default:
                p0.y yVar = (p0.y) this.f75505c;
                return (int) (kotlin.ranges.a.g0(jk.b.x(yVar) + MathKt.b(((yVar.o() * (i5 - yVar.k())) - (yVar.f81230d.e() * yVar.o())) + 0), yVar.f81234h, yVar.f81233g) - jk.b.x(yVar));
        }
    }

    public final int c() {
        switch (this.f75503a) {
            case 0:
                return ((b0) this.f75505c).f75397e.c();
            default:
                return ((p0.y) this.f75505c).f81231e;
        }
    }

    public final int d() {
        switch (this.f75503a) {
            case 0:
                return ((b0) this.f75505c).f75397e.d();
            default:
                return ((p0.y) this.f75505c).f81232f;
        }
    }

    public final int e() {
        switch (this.f75503a) {
            case 0:
                h hVar = (h) b70.g.i1(((b0) this.f75505c).h().f75476k);
                if (hVar != null) {
                    return ((r) hVar).f75481a;
                }
                return 0;
            default:
                return ((p0.f) ((p0.g) b70.g.h1(((p0.y) this.f75505c).l().f81189a))).f81154a;
        }
    }

    public final void f(int i5, int i11) {
        switch (this.f75503a) {
            case 0:
                ((b0) this.f75505c).k(i5, i11);
                break;
            default:
                ((p0.y) this.f75505c).u(i5, i11 / r0.o(), true);
                break;
        }
    }
}
