package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class g8 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73354j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ b2.t f73355k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ long f73356l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ long f73357m;
    public final /* synthetic */ float n;
    public final /* synthetic */ Function3 o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ Function2 f73358p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ x1.e f73359q;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g8(float f11, int i5, int i11, long j11, long j12, b2.t tVar, Function2 function2, Function3 function3, x1.e eVar) {
        super(2);
        this.f73354j = i5;
        this.f73355k = tVar;
        this.f73356l = j11;
        this.f73357m = j12;
        this.n = f11;
        this.o = function3;
        this.f73358p = function2;
        this.f73359q = eVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        int iL = p1.a0.l(12607537);
        o8.a(this.n, this.f73354j, iL, this.f73356l, this.f73357m, this.f73355k, this.f73358p, this.o, (p1.o) obj, this.f73359q);
        return Unit.f71706a;
    }
}
