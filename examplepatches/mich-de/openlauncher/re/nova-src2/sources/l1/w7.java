package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class w7 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ boolean f74185j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Function0 f74186k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ b2.t f74187l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ boolean f74188m;
    public final /* synthetic */ Function2 n;
    public final /* synthetic */ long o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ long f74189p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w7(boolean z11, Function0 function0, b2.t tVar, boolean z12, Function2 function2, long j11, long j12, int i5) {
        super(2);
        this.f74185j = z11;
        this.f74186k = function0;
        this.f74187l = tVar;
        this.f74188m = z12;
        this.n = function2;
        this.o = j11;
        this.f74189p = j12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        int iL = p1.a0.l(24577);
        b8.b(this.f74185j, this.f74186k, this.f74187l, this.f74188m, this.n, this.o, this.f74189p, (p1.o) obj, iL);
        return Unit.f71706a;
    }
}
