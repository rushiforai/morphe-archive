package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class f4 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ long f73290j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Function0 f73291k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ boolean f73292l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f73293m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f4(long j11, Function0 function0, boolean z11, int i5) {
        super(2);
        this.f73290j = j11;
        this.f73291k = function0;
        this.f73292l = z11;
        this.f73293m = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        h4.c(this.f73290j, this.f73291k, this.f73292l, (p1.o) obj, p1.a0.l(this.f73293m | 1));
        return Unit.f71706a;
    }
}
