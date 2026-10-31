package kw;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class m3 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72493a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ y2 f72494b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f72495c;

    public /* synthetic */ m3(y2 y2Var, Function1 function1, int i5) {
        this.f72493a = i5;
        this.f72494b = y2Var;
        this.f72495c = function1;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f72493a) {
            case 0:
                j3.b0 semantics = (j3.b0) obj;
                Intrinsics.g(semantics, "$this$semantics");
                y2 y2Var = this.f72494b;
                c2.f fVarK = y2Var.k();
                if (fVarK != null) {
                    j3.y.f(semantics, fVarK);
                }
                j3.y.c(semantics, new m3(y2Var, this.f72495c, 1));
                return Unit.f71706a;
            default:
                m3.g it = (m3.g) obj;
                Intrinsics.g(it, "it");
                y2 y2Var2 = this.f72494b;
                c2.f fVarK2 = y2Var2.k();
                if (fVarK2 != null) {
                    this.f72495c.invoke(fVarK2.toString());
                }
                y2Var2.r(it.f75880b);
                return Boolean.TRUE;
        }
    }
}
