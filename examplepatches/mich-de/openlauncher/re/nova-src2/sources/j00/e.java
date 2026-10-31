package j00;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68473a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ u10.e0 f68474b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f68475c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function1 f68476d;

    public /* synthetic */ e(u10.e0 e0Var, boolean z11, Function1 function1, int i5, int i11) {
        this.f68473a = i11;
        this.f68474b = e0Var;
        this.f68475c = z11;
        this.f68476d = function1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f68473a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                ic.b.o(this.f68474b, this.f68475c, this.f68476d, oVar, p1.a0.l(1));
                break;
            default:
                ic.b.m(this.f68474b, this.f68475c, this.f68476d, oVar, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
