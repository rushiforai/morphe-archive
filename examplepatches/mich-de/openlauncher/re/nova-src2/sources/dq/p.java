package dq;

import com.stripe.android.PaymentRelayStarter$Args;
import com.stripe.android.view.PaymentRelayActivity;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p implements ww.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49359a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final Object f49360b;

    public p(ww.a host) {
        Intrinsics.g(host, "host");
        this.f49360b = host;
    }

    @Override // ww.b
    public final void a(Object obj) {
        switch (this.f49359a) {
            case 0:
                PaymentRelayStarter$Args paymentRelayStarter$Args = (PaymentRelayStarter$Args) obj;
                ((ww.a) this.f49360b).a(PaymentRelayActivity.class, paymentRelayStarter$Args.d().b(), paymentRelayStarter$Args.getF42446b());
                break;
            default:
                ((j.c) this.f49360b).a((PaymentRelayStarter$Args) obj, null);
                break;
        }
    }

    public p(j.c launcher) {
        Intrinsics.g(launcher, "launcher");
        this.f49360b = launcher;
    }
}
