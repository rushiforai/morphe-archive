package d1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import y3.n;
import z2.h1;
import z2.i1;

/* loaded from: classes2.dex */
public final /* synthetic */ class k implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48800a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i1 f48801b;

    public /* synthetic */ k(i1 i1Var, int i5) {
        this.f48800a = i5;
        this.f48801b = i1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        h1 h1Var = (h1) obj;
        switch (this.f48800a) {
            case 0:
                h1Var.i(this.f48801b, 0, 0, 0.0f);
                break;
            case 1:
                h1.m(h1Var, this.f48801b, 0, 0);
                break;
            case 2:
                h1.m(h1Var, this.f48801b, 0, 0);
                break;
            case 3:
                n nVarF = h1Var.f();
                n nVar = n.f96612a;
                i1 i1Var = this.f48801b;
                if (nVarF == nVar || h1Var.g() == 0) {
                    h1.a(h1Var, i1Var);
                    i1Var.S(0.0f, y3.k.d(0L, i1Var.f98085e), null);
                } else {
                    long jG = ((h1Var.g() - i1Var.f98081a) - r1) << 32;
                    h1.a(h1Var, i1Var);
                    i1Var.S(0.0f, y3.k.d((((int) 0) & 4294967295L) | jG, i1Var.f98085e), null);
                }
                break;
            case 4:
                h1Var.i(this.f48801b, 0, 0, 0.0f);
                break;
            case 5:
                h1.m(h1Var, this.f48801b, 0, 0);
                break;
            case 6:
                h1.m(h1Var, this.f48801b, 0, 0);
                break;
            default:
                i1 i1Var2 = this.f48801b;
                int i5 = i1Var2.f98081a / 2;
                int i11 = i1Var2.f98082b / 2;
                h1Var.i(i1Var2, -(i5 - i11), -(i11 - i5), 0.0f);
                break;
        }
        return Unit.f71706a;
    }
}
