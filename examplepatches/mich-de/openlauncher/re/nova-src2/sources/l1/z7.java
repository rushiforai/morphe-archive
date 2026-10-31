package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class z7 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f74371j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f74372k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ z2.t0 f74373l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f74374m;
    public final /* synthetic */ int n;
    public final /* synthetic */ Integer o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ Integer f74375p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z7(z2.i1 i1Var, z2.i1 i1Var2, z2.t0 t0Var, int i5, int i11, Integer num, Integer num2) {
        super(1);
        this.f74371j = i1Var;
        this.f74372k = i1Var2;
        this.f74373l = t0Var;
        this.f74374m = i5;
        this.n = i11;
        this.o = num;
        this.f74375p = num2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        z2.h1 h1Var = (z2.h1) obj;
        z2.i1 i1Var = this.f74372k;
        int i5 = this.n;
        z2.i1 i1Var2 = this.f74371j;
        if (i1Var2 != null && i1Var != null) {
            Integer num = this.o;
            Intrinsics.d(num);
            int iIntValue = num.intValue();
            Integer num2 = this.f74375p;
            Intrinsics.d(num2);
            int iIntValue2 = num2.intValue();
            float f11 = iIntValue == iIntValue2 ? b8.f73067c : b8.f73068d;
            z2.t0 t0Var = this.f74373l;
            int iMo96roundToPx0680j_4 = t0Var.mo96roundToPx0680j_4(o1.u.f79173a) + t0Var.mo96roundToPx0680j_4(f11);
            int iMo95roundToPxR2X_6o = (t0Var.mo95roundToPxR2X_6o(b8.f73069e) + i1Var.f98082b) - iIntValue;
            int i11 = i1Var2.f98081a;
            int i12 = this.f74374m;
            int i13 = (i5 - iIntValue2) - iMo96roundToPx0680j_4;
            z2.h1.m(h1Var, i1Var2, (i12 - i11) / 2, i13);
            z2.h1.m(h1Var, i1Var, (i12 - i1Var.f98081a) / 2, i13 - iMo95roundToPxR2X_6o);
        } else if (i1Var2 != null) {
            float f12 = b8.f73065a;
            z2.h1.m(h1Var, i1Var2, 0, (i5 - i1Var2.f98082b) / 2);
        } else if (i1Var != null) {
            float f13 = b8.f73065a;
            z2.h1.m(h1Var, i1Var, 0, (i5 - i1Var.f98082b) / 2);
        }
        return Unit.f71706a;
    }
}
