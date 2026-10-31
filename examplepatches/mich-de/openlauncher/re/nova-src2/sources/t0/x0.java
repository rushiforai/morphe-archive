package t0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import p1.s2;

/* loaded from: classes.dex */
public final /* synthetic */ class x0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f88270a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ y0 f88271b;

    public /* synthetic */ x0(y0 y0Var, int i5) {
        this.f88270a = i5;
        this.f88271b = y0Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f88270a) {
            case 0:
                y0 y0Var = this.f88271b;
                p1.e1 e1Var = y0Var.f88296t;
                r3.z zVar = (r3.z) obj;
                String str = zVar.f85471a.f75880b;
                m3.g gVar = y0Var.f88288j;
                if (!Intrinsics.b(str, gVar != null ? gVar.f75880b : null)) {
                    ((s2) y0Var.f88289k).setValue(k0.f88058a);
                    if (((Boolean) ((s2) e1Var).getValue()).booleanValue()) {
                        ((s2) e1Var).setValue(Boolean.FALSE);
                    } else {
                        ((s2) y0Var.f88295s).setValue(Boolean.FALSE);
                    }
                }
                long j11 = m3.o0.f75944b;
                y0Var.f(j11);
                y0Var.e(j11);
                y0Var.f88297u.invoke(zVar);
                y0Var.f88280b.c();
                return Unit.f71706a;
            case 1:
                this.f88271b.f88294r.b(((r3.l) obj).f85451a);
                return Unit.f71706a;
            default:
                return Boolean.valueOf(this.f88271b.f88294r.b(((r3.l) obj).f85451a));
        }
    }
}
