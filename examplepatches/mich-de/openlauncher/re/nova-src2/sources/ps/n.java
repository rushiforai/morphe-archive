package ps;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class n implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f82939a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f82940b;

    public /* synthetic */ n(int i5, int i11, long j11) {
        this.f82939a = i11;
        this.f82940b = j11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f82939a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                r.c(this.f82940b, oVar, p1.a0.l(1));
                break;
            default:
                r00.z.e(this.f82940b, oVar, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
