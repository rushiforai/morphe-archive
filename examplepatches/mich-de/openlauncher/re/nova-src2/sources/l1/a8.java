package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class a8 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ long f73030j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ long f73031k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ boolean f73032l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ x1.e f73033m;
    public final /* synthetic */ int n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a8(long j11, long j12, boolean z11, x1.e eVar, int i5) {
        super(2);
        this.f73030j = j11;
        this.f73031k = j12;
        this.f73032l = z11;
        this.f73033m = eVar;
        this.n = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        b8.c(this.f73030j, this.f73031k, this.f73032l, this.f73033m, (p1.o) obj, p1.a0.l(this.n | 1));
        return Unit.f71706a;
    }
}
