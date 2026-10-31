package ads_mobile_sdk;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import kotlin.time.Duration;

/* loaded from: classes2.dex */
public final class o22 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ long f7742a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f7743b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o22(long j11, boolean z11) {
        super(0);
        this.f7742a = j11;
        this.f7743b = z11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return "Now online at " + Duration.r(this.f7742a) + "?: " + this.f7743b;
    }
}
