package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class d3 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ d1 f73176j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ z5 f73177k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ p9 f73178l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Function2 f73179m;
    public final /* synthetic */ int n;
    public final /* synthetic */ int o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d3(d1 d1Var, z5 z5Var, p9 p9Var, Function2 function2, int i5, int i11) {
        super(2);
        this.f73176j = d1Var;
        this.f73177k = z5Var;
        this.f73178l = p9Var;
        this.f73179m = function2;
        this.n = i5;
        this.o = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        e3.a(this.f73176j, this.f73177k, this.f73178l, this.f73179m, (p1.o) obj, p1.a0.l(this.n | 1), this.o);
        return Unit.f71706a;
    }
}
