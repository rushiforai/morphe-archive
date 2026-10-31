package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class y7 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ boolean f74315j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Function0 f74316k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ b2.t f74317l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ boolean f74318m;
    public final /* synthetic */ long n;
    public final /* synthetic */ long o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ x1.e f74319p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ int f74320q;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y7(boolean z11, Function0 function0, b2.t tVar, boolean z12, long j11, long j12, x1.e eVar, int i5) {
        super(2);
        this.f74315j = z11;
        this.f74316k = function0;
        this.f74317l = tVar;
        this.f74318m = z12;
        this.n = j11;
        this.o = j12;
        this.f74319p = eVar;
        this.f74320q = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        b8.a(this.f74315j, this.f74316k, this.f74317l, this.f74318m, this.n, this.o, this.f74319p, (p1.o) obj, p1.a0.l(this.f74320q | 1));
        return Unit.f71706a;
    }
}
