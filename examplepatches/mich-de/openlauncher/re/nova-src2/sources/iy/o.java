package iy;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class o implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68324a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f68325b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f68326c;

    public /* synthetic */ o(Long l9, long j11) {
        this.f68325b = j11;
        this.f68326c = l9;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f68324a) {
            case 0:
                ((Function1) this.f68326c).invoke(new tz.n(this.f68325b));
                return Unit.f71706a;
            default:
                return Float.valueOf(((Long) this.f68326c) != null ? kotlin.ranges.a.d0(this.f68325b / r0.longValue(), 0.0f, 1.0f) : 1.0f);
        }
    }

    public /* synthetic */ o(Function1 function1, long j11) {
        this.f68326c = function1;
        this.f68325b = j11;
    }
}
