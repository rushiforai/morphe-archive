package hv;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class x2 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60659a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f60660b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f60661c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f60662d;

    public /* synthetic */ x2(String str, boolean z11, boolean z12, int i5) {
        this.f60662d = str;
        this.f60660b = z11;
        this.f60661c = z12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f60659a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(7);
                a3.f((String) this.f60662d, this.f60660b, this.f60661c, (p1.o) obj, iL);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(1);
                y4.g(this.f60660b, this.f60661c, (Function1) this.f60662d, (p1.o) obj, iL2);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ x2(boolean z11, boolean z12, Function1 function1, int i5) {
        this.f60660b = z11;
        this.f60661c = z12;
        this.f60662d = function1;
    }
}
