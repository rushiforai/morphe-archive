package k0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final /* synthetic */ class q implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70707a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f70708b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f70709c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ z2.t0 f70710d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f70711e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f70712f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f70713g;

    public /* synthetic */ q(z2.i1 i1Var, z2.q0 q0Var, z2.t0 t0Var, int i5, int i11, s sVar) {
        this.f70711e = i1Var;
        this.f70712f = q0Var;
        this.f70710d = t0Var;
        this.f70708b = i5;
        this.f70709c = i11;
        this.f70713g = sVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f70707a) {
            case 0:
                p.b((z2.h1) obj, (z2.i1) this.f70711e, (z2.q0) this.f70712f, this.f70710d.getLayoutDirection(), this.f70708b, this.f70709c, ((s) this.f70713g).f70737a);
                break;
            default:
                z2.i1[] i1VarArr = (z2.i1[]) this.f70711e;
                x xVar = (x) this.f70712f;
                int[] iArr = (int[]) this.f70713g;
                z2.h1 h1Var = (z2.h1) obj;
                int length = i1VarArr.length;
                int i5 = 0;
                int i11 = 0;
                while (i5 < length) {
                    z2.i1 i1Var = i1VarArr[i5];
                    int i12 = i11 + 1;
                    Intrinsics.d(i1Var);
                    Object objK = i1Var.k();
                    u1 u1Var = objK instanceof u1 ? (u1) objK : null;
                    y3.n layoutDirection = this.f70710d.getLayoutDirection();
                    d dVar = u1Var != null ? u1Var.f70756c : null;
                    int i13 = this.f70708b;
                    h1Var.i(i1Var, dVar != null ? dVar.i(i13 - i1Var.f98081a, layoutDirection, i1Var, this.f70709c) : xVar.f70771b.a(0, i13 - i1Var.f98081a, layoutDirection), iArr[i11], 0.0f);
                    i5++;
                    i11 = i12;
                }
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ q(z2.i1[] i1VarArr, x xVar, int i5, int i11, z2.t0 t0Var, int[] iArr) {
        this.f70711e = i1VarArr;
        this.f70712f = xVar;
        this.f70708b = i5;
        this.f70709c = i11;
        this.f70710d = t0Var;
        this.f70713g = iArr;
    }
}
