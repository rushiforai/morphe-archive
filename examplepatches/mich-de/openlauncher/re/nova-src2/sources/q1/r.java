package q1;

import kotlin.jvm.functions.Function0;
import p1.a2;
import p1.k2;
import p1.t1;

/* loaded from: classes.dex */
public final class r extends j0 {

    /* renamed from: d, reason: collision with root package name */
    public static final r f83414d;

    /* renamed from: e, reason: collision with root package name */
    public static final r f83415e;

    /* renamed from: f, reason: collision with root package name */
    public static final r f83416f;

    /* renamed from: g, reason: collision with root package name */
    public static final r f83417g;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f83418c;

    static {
        int i5 = 1;
        f83414d = new r(i5, 2, 0);
        int i11 = 1;
        f83415e = new r(i11, i11, 1);
        f83416f = new r(i5, 2, 2);
        int i12 = 1;
        f83417g = new r(i12, i12, 3);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r(int i5, int i11, int i12) {
        super(i5, i11);
        this.f83418c = i12;
    }

    @Override // q1.j0
    public final void a(l0 l0Var, p1.c cVar, k2 k2Var, x1.l lVar, k0 k0Var) {
        switch (this.f83418c) {
            case 0:
                Object objInvoke = ((Function0) l0Var.i(0)).invoke();
                p1.a aVar = (p1.a) l0Var.i(1);
                int iH = l0Var.h(0);
                aVar.getClass();
                k2Var.T(k2Var.c(aVar), objInvoke);
                cVar.j(iH, objInvoke);
                cVar.n(objInvoke);
                break;
            case 1:
                p1.a aVar2 = (p1.a) l0Var.i(0);
                int iH2 = l0Var.h(0);
                cVar.q();
                aVar2.getClass();
                cVar.m(iH2, k2Var.C(k2Var.c(aVar2)));
                break;
            case 2:
                Object objI = l0Var.i(0);
                p1.a aVar3 = (p1.a) l0Var.i(1);
                int iH3 = l0Var.h(0);
                if (objI instanceof a2) {
                    a2 a2Var = (a2) objI;
                    lVar.f94966e.b(a2Var);
                    lVar.f94965d.d(a2Var);
                }
                Object objJ = k2Var.J(k2Var.c(aVar3), iH3, objI);
                if (!(objJ instanceof a2)) {
                    if (objJ instanceof t1) {
                        ((t1) objJ).e();
                        break;
                    }
                } else {
                    lVar.e((a2) objJ);
                    break;
                }
                break;
            default:
                Object objI2 = l0Var.i(0);
                int iH4 = l0Var.h(0);
                if (objI2 instanceof a2) {
                    a2 a2Var2 = (a2) objI2;
                    lVar.f94966e.b(a2Var2);
                    lVar.f94965d.d(a2Var2);
                }
                Object objJ2 = k2Var.J(k2Var.f81482t, iH4, objI2);
                if (!(objJ2 instanceof a2)) {
                    if (objJ2 instanceof t1) {
                        ((t1) objJ2).e();
                        break;
                    }
                } else {
                    lVar.e((a2) objJ2);
                    break;
                }
                break;
        }
    }

    @Override // q1.j0
    public p1.a b(l0 l0Var) {
        switch (this.f83418c) {
            case 0:
                return (p1.a) l0Var.i(1);
            case 1:
                return (p1.a) l0Var.i(0);
            default:
                return super.b(l0Var);
        }
    }
}
