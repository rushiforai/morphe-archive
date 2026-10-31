package l00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.a0;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72930a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ o f72931b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f72932c;

    public /* synthetic */ e(o oVar, int i5, int i11) {
        this.f72930a = i11;
        this.f72931b = oVar;
        this.f72932c = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f72930a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).intValue();
        switch (i5) {
            case 0:
                this.f72931b.j(oVar, a0.l(this.f72932c | 1));
                break;
            case 1:
                this.f72931b.h(oVar, a0.l(this.f72932c | 1));
                break;
            default:
                this.f72931b.b(oVar, a0.l(this.f72932c | 1));
                break;
        }
        return Unit.f71706a;
    }
}
