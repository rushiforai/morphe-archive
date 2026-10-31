package lm;

import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final /* synthetic */ class i implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75047a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f75048b;

    public /* synthetic */ i(long j11, int i5) {
        this.f75047a = i5;
        this.f75048b = j11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f75047a) {
            case 0:
                ((y5.b) obj).d(j.f75049b, Long.valueOf(this.f75048b));
                return null;
            default:
                return Long.valueOf(this.f75048b);
        }
    }
}
