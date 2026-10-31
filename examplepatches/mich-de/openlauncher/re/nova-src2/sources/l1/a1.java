package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class a1 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73003j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ boolean f73004k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ b2.t f73005l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f73006m;
    public final /* synthetic */ Object n;
    public final /* synthetic */ Object o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a1(boolean z11, Object obj, b2.t tVar, Object obj2, int i5, int i11) {
        super(2);
        this.f73003j = i11;
        this.f73004k = z11;
        this.n = obj;
        this.f73005l = tVar;
        this.o = obj2;
        this.f73006m = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f73003j) {
            case 0:
                ((Number) obj2).intValue();
                l3.a aVar = (l3.a) this.n;
                x0 x0Var = (x0) this.o;
                c1.b(this.f73004k, aVar, this.f73005l, x0Var, (p1.o) obj, p1.a0.l(this.f73006m | 1));
                break;
            default:
                ((Number) obj2).intValue();
                Function1 function1 = (Function1) this.n;
                x1.e eVar = (x1.e) this.o;
                l2.a(this.f73004k, function1, this.f73005l, eVar, (p1.o) obj, p1.a0.l(this.f73006m | 1));
                break;
        }
        return Unit.f71706a;
    }
}
