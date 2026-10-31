package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class d3 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50282a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f50283b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ c3 f50284c;

    public /* synthetic */ d3(boolean z11, c3 c3Var, int i5, int i11) {
        this.f50282a = i11;
        this.f50283b = z11;
        this.f50284c = c3Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f50282a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                a.a.v(this.f50283b, this.f50284c, oVar, p1.a0.l(7));
                break;
            default:
                a.a.a(this.f50283b, this.f50284c, oVar, p1.a0.l(7));
                break;
        }
        return Unit.f71706a;
    }
}
