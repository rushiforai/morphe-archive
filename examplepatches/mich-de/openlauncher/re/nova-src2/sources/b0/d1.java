package b0;

import c0.w1;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class d1 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f16096j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ e1 f16097k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d1(e1 e1Var, int i5) {
        super(1);
        this.f16096j = i5;
        this.f16097k = e1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        c0.c0 c0VarA;
        c0.c0 c0VarA2;
        switch (this.f16096j) {
            case 0:
                w1 w1Var = (w1) obj;
                r0 r0Var = r0.f16218a;
                r0 r0Var2 = r0.f16219b;
                boolean zC = w1Var.c(r0Var, r0Var2);
                c0.c0 c0VarB = null;
                e1 e1Var = this.f16097k;
                if (zC) {
                    j0 j0Var = e1Var.f16113e.f16126a.f16262c;
                    if (j0Var != null) {
                        c0VarB = j0Var.b();
                    }
                } else if (w1Var.c(r0Var2, r0.f16220c)) {
                    j0 j0Var2 = e1Var.f16114f.f16133a.f16262c;
                    if (j0Var2 != null) {
                        c0VarB = j0Var2.b();
                    }
                } else {
                    c0VarB = z0.f16289d;
                }
                return c0VarB == null ? z0.f16289d : c0VarB;
            default:
                w1 w1Var2 = (w1) obj;
                r0 r0Var3 = r0.f16218a;
                r0 r0Var4 = r0.f16219b;
                boolean zC2 = w1Var2.c(r0Var3, r0Var4);
                e1 e1Var2 = this.f16097k;
                if (zC2) {
                    t1 t1Var = e1Var2.f16113e.f16126a.f16261b;
                    return (t1Var == null || (c0VarA2 = t1Var.a()) == null) ? z0.f16288c : c0VarA2;
                }
                if (!w1Var2.c(r0Var4, r0.f16220c)) {
                    return z0.f16288c;
                }
                t1 t1Var2 = e1Var2.f16114f.f16133a.f16261b;
                return (t1Var2 == null || (c0VarA = t1Var2.a()) == null) ? z0.f16288c : c0VarA;
        }
    }
}
