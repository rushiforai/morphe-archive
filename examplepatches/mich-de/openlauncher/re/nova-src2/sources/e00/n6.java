package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class n6 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50795a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f50796b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f50797c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function1 f50798d;

    public /* synthetic */ n6(int i5, int i11, boolean z11, Function1 function1) {
        this.f50796b = i5;
        this.f50797c = z11;
        this.f50798d = function1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        p1.o oVar = (p1.o) obj;
        Integer num = (Integer) obj2;
        switch (this.f50795a) {
            case 0:
                num.intValue();
                g90.k.a(this.f50797c, this.f50798d, oVar, p1.a0.l(this.f50796b | 1));
                break;
            default:
                num.getClass();
                g90.k.z(this.f50796b, this.f50797c, this.f50798d, oVar, p1.a0.l(385));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ n6(int i5, Function1 function1, boolean z11) {
        this.f50797c = z11;
        this.f50798d = function1;
        this.f50796b = i5;
    }
}
