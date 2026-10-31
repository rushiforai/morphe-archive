package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class y2 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51176a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k0.y f51177b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f51178c;

    public /* synthetic */ y2(k0.y yVar, int i5, int i11) {
        this.f51176a = i11;
        this.f51177b = yVar;
        this.f51178c = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f51176a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).intValue();
        switch (i5) {
            case 0:
                e10.z2.k(this.f51177b, oVar, p1.a0.l(this.f51178c | 1));
                break;
            default:
                ps.o0.l(this.f51177b, oVar, p1.a0.l(this.f51178c | 1));
                break;
        }
        return Unit.f71706a;
    }
}
