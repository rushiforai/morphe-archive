package b0;

import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class c1 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f16080j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ e1 f16081k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ long f16082l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c1(e1 e1Var, long j11, int i5) {
        super(1);
        this.f16080j = i5;
        this.f16081k = e1Var;
        this.f16082l = j11;
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x00c1  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        Function1 function1;
        Function1 function12;
        long jC;
        int iOrdinal;
        switch (this.f16080j) {
            case 0:
                int iOrdinal2 = ((r0) obj).ordinal();
                e1 e1Var = this.f16081k;
                long j11 = this.f16082l;
                if (iOrdinal2 == 0) {
                    j0 j0Var = e1Var.f16113e.f16126a.f16262c;
                    if (j0Var != null && (function1 = j0Var.f16152b) != null) {
                        j11 = ((y3.m) function1.invoke(new y3.m(j11))).f96611a;
                    }
                } else if (iOrdinal2 != 1) {
                    if (iOrdinal2 != 2) {
                        throw new NoWhenBranchMatchedException();
                    }
                    j0 j0Var2 = e1Var.f16114f.f16133a.f16262c;
                    if (j0Var2 != null && (function12 = j0Var2.f16152b) != null) {
                        j11 = ((y3.m) function12.invoke(new y3.m(j11))).f96611a;
                    }
                }
                return new y3.m(j11);
            case 1:
                r0 r0Var = (r0) obj;
                e1 e1Var2 = this.f16081k;
                if (e1Var2.f16118j != null && e1Var2.B() != null && !Intrinsics.b(e1Var2.f16118j, e1Var2.B()) && (iOrdinal = r0Var.ordinal()) != 0 && iOrdinal != 1) {
                    if (iOrdinal != 2) {
                        throw new NoWhenBranchMatchedException();
                    }
                    j0 j0Var3 = e1Var2.f16114f.f16133a.f16262c;
                    if (j0Var3 != null) {
                        Function1 function13 = j0Var3.f16152b;
                        long j12 = this.f16082l;
                        long j13 = ((y3.m) function13.invoke(new y3.m(j12))).f96611a;
                        b2.f fVarB = e1Var2.B();
                        Intrinsics.d(fVarB);
                        y3.n nVar = y3.n.f96612a;
                        long jA = fVarB.a(j12, j13, nVar);
                        b2.f fVar = e1Var2.f16118j;
                        Intrinsics.d(fVar);
                        jC = y3.k.c(jA, fVar.a(j12, j13, nVar));
                    } else {
                        jC = 0;
                    }
                }
                return new y3.k(jC);
            default:
                r0 r0Var2 = (r0) obj;
                e1 e1Var3 = this.f16081k;
                t1 t1Var = e1Var3.f16113e.f16126a.f16261b;
                long j14 = this.f16082l;
                long j15 = 0;
                long j16 = t1Var != null ? ((y3.k) t1Var.b().invoke(new y3.m(j14))).f96605a : 0L;
                t1 t1Var2 = e1Var3.f16114f.f16133a.f16261b;
                long j17 = t1Var2 != null ? ((y3.k) t1Var2.b().invoke(new y3.m(j14))).f96605a : 0L;
                int iOrdinal3 = r0Var2.ordinal();
                if (iOrdinal3 == 0) {
                    j15 = j16;
                } else if (iOrdinal3 != 1) {
                    if (iOrdinal3 != 2) {
                        throw new NoWhenBranchMatchedException();
                    }
                    j15 = j17;
                }
                return new y3.k(j15);
        }
    }
}
