package c4;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class i extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19607j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ int f19608k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Object f19609l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Function2 f19610m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i(Object obj, Function2 function2, int i5, int i11) {
        super(2);
        this.f19607j = i11;
        this.f19609l = obj;
        this.f19610m = function2;
        this.f19608k = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f19607j;
        p1.o oVar = (p1.o) obj;
        ((Number) obj2).intValue();
        switch (i5) {
            case 0:
                p7.u.y((b2.t) this.f19609l, this.f19610m, oVar, p1.a0.l(this.f19608k | 1));
                break;
            default:
                ps.e0.e((y1.c) this.f19609l, (x1.e) this.f19610m, oVar, p1.a0.l(this.f19608k | 1));
                break;
        }
        return Unit.f71706a;
    }
}
