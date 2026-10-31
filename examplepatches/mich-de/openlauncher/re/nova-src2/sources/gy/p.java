package gy;

import c3.c3;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class p implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58475a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c3 f58476b;

    public /* synthetic */ p(c3 c3Var, int i5) {
        this.f58475a = i5;
        this.f58476b = c3Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        t0.u0 KeyboardActions = (t0.u0) obj;
        switch (this.f58475a) {
            case 0:
                c3 c3Var = this.f58476b;
                if (c3Var != null) {
                    ((c3.b2) c3Var).a();
                }
                break;
            default:
                Intrinsics.g(KeyboardActions, "$this$KeyboardActions");
                c3 c3Var2 = this.f58476b;
                if (c3Var2 != null) {
                    ((c3.b2) c3Var2).a();
                }
                break;
        }
        return Unit.f71706a;
    }
}
