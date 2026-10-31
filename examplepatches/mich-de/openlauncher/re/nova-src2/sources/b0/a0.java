package b0;

import c0.c2;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function2;
import p1.s2;

/* loaded from: classes.dex */
public final class a0 implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ p1.p1 f16046a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c2 f16047b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f16048c;

    public a0(p1.p1 p1Var, c2 c2Var, p1.e1 e1Var) {
        this.f16046a = p1Var;
        this.f16047b = c2Var;
        this.f16048c = e1Var;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        boolean zBooleanValue;
        if (((Boolean) obj).booleanValue()) {
            Function2 function2 = (Function2) this.f16048c.getValue();
            c2 c2Var = this.f16047b;
            zBooleanValue = ((Boolean) function2.invoke(c2Var.f18730a.c(), ((s2) c2Var.f18733d).getValue())).booleanValue();
        } else {
            zBooleanValue = false;
        }
        this.f16046a.setValue(Boolean.valueOf(zBooleanValue));
        return Unit.f71706a;
    }
}
