package iy;

import i2.r0;
import kotlin.UInt;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class g0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68256a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f68257b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f68258c;

    public /* synthetic */ g0(long j11, Function1 function1) {
        this.f68257b = j11;
        this.f68258c = function1;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f68256a;
        Function1 function1 = this.f68258c;
        long j11 = this.f68257b;
        switch (i5) {
            case 0:
                int iIntValue = ((Integer) obj).intValue();
                UInt.Companion companion = UInt.f71696b;
                function1.invoke(new i2.s(i2.s.b(i2.s.c(j11), r0.b(iIntValue))));
                break;
            default:
                tz.n nVar = (tz.n) obj;
                if (nVar != null) {
                    if (j11 != nVar.f90163a) {
                    }
                    break;
                } else {
                    tz.m mVar = tz.n.Companion;
                }
                function1.invoke(nVar);
        }
        return Unit.f71706a;
    }

    public /* synthetic */ g0(Function1 function1, long j11) {
        this.f68258c = function1;
        this.f68257b = j11;
    }
}
