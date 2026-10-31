package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.reflect.KProperty;

/* loaded from: classes2.dex */
public final class a7 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73028j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ y6 f73029k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a7(y6 y6Var, int i5) {
        super(1);
        this.f73028j = i5;
        this.f73029k = y6Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f73028j;
        y6 y6Var = this.f73029k;
        switch (i5) {
            case 0:
                j3.b0 b0Var = (j3.b0) obj;
                KProperty[] kPropertyArr = j3.y.f68878a;
                j3.a0 a0Var = j3.w.f68861j;
                KProperty kProperty = j3.y.f68878a[3];
                a0Var.a(b0Var, j3.e.a(0));
                j3.k kVar = (j3.k) b0Var;
                kVar.f(j3.j.f68806u, new j3.a(null, new z6(y6Var, 0)));
                return Unit.f71706a;
            default:
                return Boolean.valueOf(Intrinsics.b(((m2) obj).f73638a, y6Var));
        }
    }
}
