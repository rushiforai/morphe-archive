package ads_mobile_sdk;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import kotlin.time.Duration;

/* loaded from: classes.dex */
public final class m22 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ long f6997a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f6998b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m22(long j11, boolean z11) {
        super(0);
        this.f6997a = j11;
        this.f6998b = z11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return "Previously online at " + Duration.r(this.f6997a) + "?: " + this.f6998b;
    }
}
