package b0;

import c0.c2;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Lambda;
import p1.s2;

/* loaded from: classes.dex */
public final class g0 extends Lambda implements Function3 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Function1 f16129j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ c2 f16130k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g0(Function1 function1, c2 c2Var) {
        super(3);
        this.f16129j = function1;
        this.f16130k = c2Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0034  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        long j11;
        z2.t0 t0Var = (z2.t0) obj;
        z2.i1 i1VarH = ((z2.q0) obj2).H(((y3.a) obj3).f96596a);
        if (t0Var.l()) {
            if (((Boolean) this.f16129j.invoke(((s2) this.f16130k.f18733d).getValue())).booleanValue()) {
                j11 = (i1VarH.f98081a << 32) | (i1VarH.f98082b & 4294967295L);
            } else {
                j11 = 0;
            }
        }
        return t0Var.y((int) (j11 >> 32), (int) (4294967295L & j11), b70.h.f17594a, new f0(i1VarH, 0));
    }
}
