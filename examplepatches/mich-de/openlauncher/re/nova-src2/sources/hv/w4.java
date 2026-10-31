package hv;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class w4 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60654a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p0 f60655b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f60656c;

    public /* synthetic */ w4(p0 p0Var, int i5, int i11) {
        this.f60654a = i11;
        this.f60655b = p0Var;
        this.f60656c = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f60654a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                y4.d(this.f60655b, oVar, p1.a0.l(this.f60656c | 1));
                break;
            case 1:
                y4.j(this.f60655b, oVar, p1.a0.l(this.f60656c | 1));
                break;
            default:
                y4.h(this.f60655b, oVar, p1.a0.l(this.f60656c | 1));
                break;
        }
        return Unit.f71706a;
    }
}
