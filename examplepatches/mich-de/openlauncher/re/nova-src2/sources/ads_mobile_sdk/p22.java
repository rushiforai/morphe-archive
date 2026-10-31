package ads_mobile_sdk;

import b.c0;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import kotlin.time.Duration;

/* loaded from: classes2.dex */
public final class p22 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ long f8058a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p22(long j11) {
        super(0);
        this.f8058a = j11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return c0.k("Locked in update at ", Duration.r(this.f8058a));
    }
}
