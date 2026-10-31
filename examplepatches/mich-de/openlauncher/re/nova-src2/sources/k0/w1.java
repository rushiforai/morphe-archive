package k0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final /* synthetic */ class w1 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70764a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f70765b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f70766c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f70767d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f70768e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f70769f;

    public /* synthetic */ w1(l2 l2Var, int i5, z2.i1 i1Var, int i11, z2.t0 t0Var) {
        this.f70767d = l2Var;
        this.f70765b = i5;
        this.f70768e = i1Var;
        this.f70766c = i11;
        this.f70769f = t0Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f70764a) {
            case 0:
                z2.i1[] i1VarArr = (z2.i1[]) this.f70767d;
                x1 x1Var = (x1) this.f70768e;
                int[] iArr = (int[]) this.f70769f;
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
                    d dVar = u1Var != null ? u1Var.f70756c : null;
                    int i13 = this.f70765b;
                    h1Var.i(i1Var, iArr[i11], dVar != null ? dVar.i(i13 - i1Var.f98082b, y3.n.f96612a, i1Var, this.f70766c) : x1Var.f70777b.a(0, i13 - i1Var.f98082b), 0.0f);
                    i5++;
                    i11 = i12;
                }
                break;
            default:
                l2 l2Var = (l2) this.f70767d;
                z2.h1.k((z2.h1) obj, (z2.i1) this.f70768e, ((y3.k) l2Var.f70674b.invoke(new y3.m(((this.f70765b - r1.f98081a) << 32) | ((this.f70766c - r1.f98082b) & 4294967295L)), ((z2.t0) this.f70769f).getLayoutDirection())).f96605a);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ w1(z2.i1[] i1VarArr, x1 x1Var, int i5, int i11, int[] iArr) {
        this.f70767d = i1VarArr;
        this.f70768e = x1Var;
        this.f70765b = i5;
        this.f70766c = i11;
        this.f70769f = iArr;
    }
}
