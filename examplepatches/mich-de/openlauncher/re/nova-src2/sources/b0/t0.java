package b0;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class t0 extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final t0 f16240k;

    /* renamed from: l, reason: collision with root package name */
    public static final t0 f16241l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f16242j;

    static {
        int i5 = 1;
        f16240k = new t0(i5, 0);
        f16241l = new t0(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ t0(int i5, int i11) {
        super(i5);
        this.f16242j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f16242j) {
            case 0:
                long j11 = ((i2.y0) obj).f61193a;
                return new c0.p(i2.y0.b(j11), i2.y0.c(j11));
            default:
                c0.p pVar = (c0.p) obj;
                return new i2.y0(i2.r0.f(pVar.f18914a, pVar.f18915b));
        }
    }
}
