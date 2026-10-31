package b0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class n extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ z2.i1[] f16189j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ o f16190k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f16191l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f16192m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(z2.i1[] i1VarArr, o oVar, int i5, int i11) {
        super(1);
        this.f16189j = i1VarArr;
        this.f16190k = oVar;
        this.f16191l = i5;
        this.f16192m = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        z2.h1 h1Var = (z2.h1) obj;
        for (z2.i1 i1Var : this.f16189j) {
            if (i1Var != null) {
                long jA = this.f16190k.f16195a.f16267b.a((i1Var.f98081a << 32) | (i1Var.f98082b & 4294967295L), (this.f16191l << 32) | (this.f16192m & 4294967295L), y3.n.f96612a);
                h1Var.i(i1Var, (int) (jA >> 32), (int) (jA & 4294967295L), 0.0f);
            }
        }
        return Unit.f71706a;
    }
}
