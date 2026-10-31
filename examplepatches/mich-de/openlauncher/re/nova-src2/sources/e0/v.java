package e0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final /* synthetic */ class v implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50144a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f50145b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f50146c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function1 f50147d;

    public /* synthetic */ v(int i5, b2.t tVar, Function1 function1) {
        this.f50145b = tVar;
        this.f50147d = function1;
        this.f50146c = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        p1.o oVar = (p1.o) obj;
        Integer num = (Integer) obj2;
        switch (this.f50144a) {
            case 0:
                num.intValue();
                ic.b.g(p1.a0.l(this.f50146c | 1), this.f50145b, this.f50147d, oVar);
                break;
            default:
                num.getClass();
                mk.v.t(this.f50145b, this.f50146c, this.f50147d, oVar, p1.a0.l(7));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ v(b2.t tVar, int i5, Function1 function1, int i11) {
        this.f50145b = tVar;
        this.f50146c = i5;
        this.f50147d = function1;
    }
}
